object Fr_contas_receber: TFr_contas_receber
  Left = 313
  Top = 89
  BorderIcons = [biSystemMenu]
  Caption = 'Contas a Receber'
  ClientHeight = 493
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pccor: TsPageControl
    Left = 0
    Top = 0
    Width = 605
    Height = 493
    ActivePage = tab_resultado
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_localizar: TsTabSheet
      Caption = 'Localizar'
      OnShow = tab_localizarShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel15: TsPanel
        Left = 0
        Top = 0
        Width = 592
        Height = 409
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object GroupBox9: TsGroupBox
          Left = 10
          Top = -1
          Width = 127
          Height = 46
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object EDdtaini: TsDateEdit
            Left = 6
            Top = 17
            Width = 115
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
            DialogTitle = 'Selecione uma Data'
          end
        end
        object GroupBox10: TsGroupBox
          Left = 140
          Top = -1
          Width = 127
          Height = 46
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object Eddtafin: TsDateEdit
            Left = 6
            Top = 17
            Width = 117
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
            DialogTitle = 'Selecione uma Data'
          end
        end
        object GroupBox11: TsGroupBox
          Left = 270
          Top = -1
          Width = 315
          Height = 46
          Caption = 'Filtrar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object Rb_filtro_vencimento: TsRadioButton
            Left = 5
            Top = 18
            Width = 79
            Height = 20
            Caption = 'Vencimento '
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_filtro_pagamento: TsRadioButton
            Left = 94
            Top = 18
            Width = 74
            Height = 20
            Caption = 'Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object GroupBox12: TsGroupBox
          Left = 10
          Top = 44
          Width = 575
          Height = 46
          Caption = 'Loja:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_empresa1: TsLabel
            Left = 77
            Top = 26
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
          object Zzcod_empresa: TsComboEdit
            Left = 5
            Top = 18
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
            OnExit = Zzcod_empresaExit
            OnKeyPress = Zzcod_empresaKeyPress
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
            OnButtonClick = Zzcod_empresaButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object GroupBox13: TsGroupBox
          Left = 10
          Top = 89
          Width = 575
          Height = 43
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object LbNom_cliente1: TsLabel
            Left = 78
            Top = 25
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
          object Zzcod_cliente1: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = Zzcod_cliente1Exit
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
            OnButtonClick = Zzcod_cliente1ButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbFormaPgto: TsGroupBox
          Left = 10
          Top = 132
          Width = 281
          Height = 45
          Caption = 'Forma de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_fop1: TsLabel
            Left = 78
            Top = 24
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
          object Zzcod_fop1: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = Zzcod_fop1Exit
            OnKeyPress = Zzcod_fop1KeyPress
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
            OnButtonClick = Zzcod_fop1ButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbtitulo1: TsGroupBox
          Left = 204
          Top = 177
          Width = 87
          Height = 46
          Caption = 'T'#237'tulo de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          SkinData.SkinSection = 'GROUPBOX'
          object Ed_titulo1: TsEdit
            Left = 6
            Top = 17
            Width = 75
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbtitulo2: TsGroupBox
          Left = 295
          Top = 177
          Width = 80
          Height = 46
          Caption = 'T'#237'tulo at'#233':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          SkinData.SkinSection = 'GROUPBOX'
          object ed_titulo2: TsEdit
            Left = 6
            Top = 16
            Width = 67
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = ed_titulo2Exit
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
        object gbValor1: TsGroupBox
          Left = 388
          Top = 177
          Width = 96
          Height = 46
          Caption = 'Valor R$ de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          SkinData.SkinSection = 'GROUPBOX'
          object edValorIni: TsCurrencyEdit
            Left = 6
            Top = 16
            Width = 83
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
            OnExit = edValorIniExit
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
        object gbvalor2: TsGroupBox
          Left = 489
          Top = 177
          Width = 96
          Height = 46
          Caption = 'Valor R$ at'#233':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          SkinData.SkinSection = 'GROUPBOX'
          object edValorFim: TsCurrencyEdit
            Left = 6
            Top = 15
            Width = 83
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
        object GroupBox19: TsGroupBox
          Left = 10
          Top = 335
          Width = 575
          Height = 34
          Caption = 'Filtrar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          SkinData.SkinSection = 'GROUPBOX'
          object Rb_efetivados: TsRadioButton
            Left = 8
            Top = 11
            Width = 70
            Height = 20
            Caption = 'Efetivados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_nao_efetivados: TsRadioButton
            Left = 101
            Top = 11
            Width = 93
            Height = 20
            Caption = 'N'#227'o Efetivados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object rbVencidos: TsRadioButton
            Left = 210
            Top = 11
            Width = 64
            Height = 20
            Caption = 'Vencidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_todos: TsRadioButton
            Left = 504
            Top = 11
            Width = 50
            Height = 20
            Caption = 'Todos'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object rbParciais: TsRadioButton
            Left = 299
            Top = 11
            Width = 57
            Height = 20
            Caption = 'Parciais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object rbProtestados: TsRadioButton
            Left = 386
            Top = 11
            Width = 76
            Height = 20
            Caption = 'Protestados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object GroupBox20: TsGroupBox
          Left = 10
          Top = 368
          Width = 575
          Height = 34
          Caption = 'Ordenar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          SkinData.SkinSection = 'GROUPBOX'
          object zz_ord_titulo: TsRadioButton
            Left = 8
            Top = 12
            Width = 46
            Height = 20
            Caption = 'Titulo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_vencimento: TsRadioButton
            Left = 93
            Top = 12
            Width = 102
            Height = 20
            Caption = 'Data Vencimento'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_pagamento: TsRadioButton
            Left = 232
            Top = 12
            Width = 100
            Height = 20
            Caption = 'Data Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_Cliente: TsRadioButton
            Left = 360
            Top = 12
            Width = 52
            Height = 20
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_valor: TsRadioButton
            Left = 477
            Top = 12
            Width = 44
            Height = 20
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object gbNF: TsGroupBox
          Left = 10
          Top = 177
          Width = 87
          Height = 46
          Caption = 'N'#176' NF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object ED_NF: TsEdit
            Left = 6
            Top = 17
            Width = 75
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbPlanoContas: TsGroupBox
          Left = 10
          Top = 266
          Width = 575
          Height = 71
          Caption = 'Plano De Contas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          SkinData.SkinSection = 'GROUPBOX'
          object zLbnom_plano_contas_N1: TsLabel
            Left = 64
            Top = 13
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zLbnom_plano_contas_N2: TsLabel
            Left = 64
            Top = 26
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
          object zLbnom_plano_contas_N3: TsLabel
            Left = 64
            Top = 40
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
          object zLbnom_plano_contas_N4: TsLabel
            Left = 64
            Top = 54
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
          object zPrId_Plano_Contas: TsComboEdit
            Left = 6
            Top = 32
            Width = 52
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 0
            Text = ''
            OnExit = zPrId_Plano_ContasExit
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
            OnButtonClick = zPrId_Plano_ContasButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object GBPedido: TsGroupBox
          Left = 107
          Top = 177
          Width = 87
          Height = 46
          Caption = 'N'#176' Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          SkinData.SkinSection = 'GROUPBOX'
          object ed_pedido: TsEdit
            Left = 6
            Top = 17
            Width = 75
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbHistorico: TsGroupBox
          Left = 9
          Top = 223
          Width = 576
          Height = 42
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          SkinData.SkinSection = 'GROUPBOX'
          object edHistorico: TsEdit
            Left = 6
            Top = 15
            Width = 563
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbContaBoleto: TsGroupBox
          Left = 295
          Top = 132
          Width = 290
          Height = 45
          Caption = 'CC Boleto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object lbContaBoleto: TsLabel
            Left = 78
            Top = 24
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
          object ZzContaBoleto: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = ZzContaBoletoExit
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
            OnButtonClick = ZzContaBoletoButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
      end
      object Panel1: TsPanel
        Left = 0
        Top = 416
        Width = 597
        Height = 49
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvNone
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object BtnLimpar: TsBitBtn
          Left = 58
          Top = 3
          Width = 75
          Height = 43
          Hint = 'Limpar os Filtros de Pesquisa'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BtnLimparClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btok: TsBitBtn
          Left = 153
          Top = 3
          Width = 75
          Height = 43
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F0000
            000000000000000000000000000000000000000000007F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000007F
            7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F000000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
            00000000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7F7F7F000000000000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF00000000007F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
            FFFFFFFFFFFF7F7F7F000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF00000000007F7F7F7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF
            FFFFFF7F7F7F0000007F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00000000007F7F7F7F00007F0000FF0000FFFFFFFFFFFF
            7F7F7F0000007F0000FF00007F0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00007F00007F00007F0000FF0000FFFF00FFFFFFFFFFFF
            7F7F7F000000FF00007F0000FF00007F0000FF0000FF0000FF0000FF0000FF00
            00000000000000000000000000000000000000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00007F0000FF0000FF0000FFFF00FFFFFFFFFFFF
            000000FF00007F0000FF00007F0000FF00007F0000FF00007F00000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFFFFFFFF
            7F00007F00007F00007F0000FF00007F0000FF00007F00000000007F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F00007F0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFF000000
            7F00007F00007F00007F00007F00007F00007F0000FF00000000007F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
            7F00007F00007F00007F00007F00007F00007F00000000007F7F7F7F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
            7F00007F0000FFFFFFFFFFFF7F00007F00007F00007F7F7F7F7F7F7F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
            7F00007F0000FFFFFFFF00FFFFFFFFFFFFFF7F00000000007F7F7F7F7F7F7F7F
            7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
            FF00FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
            7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
            007FFFFF00FFFF00FF0000FFFF007F007F7F007F0000007F7F7FFFFFFF000000
            7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFF
            FF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
            007F7F007F7F007FFFFF00FFFF007F007F7F007F0000007F7F7FFFFFFF000000
            FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F
            007F7F007F7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFF000000
            FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF7F007F7F007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FF00FF7F
            007FFF00FF7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFFFFFFFF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F007F7F007F7F00
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000007F007FFF
            00FF7F007FFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000
            007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000FF00FFFF00FF7F
            007FFF00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF
            00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FF
            FF00FF7F007FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFF00FF7F007F
            7F007F7F007F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFF
            FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 0
          OnClick = btokClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BitBtn2: TsBitBtn
          Left = 249
          Top = 3
          Width = 51
          Height = 43
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
            34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
            A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
            6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
            66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
            66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
            34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
            D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
            7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
            33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
            7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
            CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
            3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
            E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
            8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
            33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
            88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
            DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
            ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
            8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
            FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
            95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
            FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
            FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
            999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
            FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
            97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
            FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
            FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
            669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 2
          OnClick = BitBtn2Click
          SkinData.SkinSection = 'BUTTON'
        end
        object Bt_imp_cop: TsBitBtn
          Left = 400
          Top = 3
          Width = 139
          Height = 43
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAEABACCCCACB
            B1AFAFA09D9EFF00FFFF00FFACAAABD3D3D3DBDADAC0BEBEADAAABFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAEABACC7
            C5C6F4F3F3F7F6F6BCBABAB1AFAF5D5C5D615F60888687AEACACCBCACAE3E2E2
            E7E7E7D5D4D4B6B4B5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADAB
            ACBBB8B9EAE9E9FFFEFEFDFCFCF3F2F2BAB8B8B2B0B04C4B4D23232530303242
            4244626062878486AFADADD2D1D1E9E8E8DEDDDDAAA7A8FF00FFFF00FFFF00FF
            FF00FFAFADAEE1DFDFFDFCFCFCFBFBFAF9F9FCFBFBEDEBECB6B4B4B6B4B49897
            986F6E6F4C4B4D33333528282A2E2E30414143605F608C898AA7A5A5FF00FFFF
            00FFFF00FFA4A1A2D1CFCFF8F7F7FBFAFAF7F6F6F7F6F6EAE9E9C8C7C7ADABAC
            A09D9EA3A1A1AFACADB8B5B6B3B1B19E9D9D7B7A7B57565738383A2627294342
            44A19E9FFF00FFFF00FFFF00FFA4A1A2F0F0F0F4F4F4F1F0F0E2E1E1C1BFBFAB
            A8A9B9B7B7D4D3D3B7B5B5A8A5A5A29FA09F9C9DA2A0A0ABA8A9B5B3B2B5B3B3
            A7A5A68483846C6C6DA2A0A0FF00FFFF00FFFF00FFA4A1A2E6E5E5DBDADABAB8
            B8A9A6A7BAB8B8D6D5D6DFE0DFE4E3E3E8E7E7D8D6D6C9C7C7BAB8B8AFACADA5
            A2A3A19E9FA09D9EA7A4A4B1AEAEB6B4B4A7A5A5FF00FFFF00FFFF00FFA4A1A2
            B2B0B1A9A7A7BBBABAD4D4D4DCDDDDD9D9D9D5D5D5ECEBEBF8F7F7F6F6F6F1F0
            F0E7E6E6DAD9D9CDCCCCC0BEBEB5B3B3AAA8A8A3A1A1A19E9F9D9A9BFF00FFFF
            00FFFF00FFA4A1A2BCBABBD5D4D4DADADAD7D7D7D6D6D6D3D3D3E3E3E3F7F6F6
            C5C3C4C6BCC4D1CFD0E1E0E0E8E8E8E9E9E9E2E2E2D9D9D9CFCECEC4C3C3BCBA
            BAA8A5A6FF00FFFF00FFFF00FFA4A1A2D6D6D6D8D8D8D6D6D6D6D6D6D4D4D4E0
            E0E0F7F6F6C0BCBEAEB2AD80C184B2B6B1AEAAACB0AFAFBCBBBBCAC9C9D8D7D7
            DCDCDCDCDCDCDADADAAFAEAEFF00FFFF00FFFF00FFFF00FFBFBDBEDBDBDBD8D9
            D9D9D9D9E6E6E6EAE9E9B7B5B5BDBBBCF2F2F1D4F1D5EBEEEBE7E5E6FAC0AFC1
            BFC0B3B1B1AAA7A8AFACADBDBBBBBDBBBCB6B3B4FF00FFFF00FFFF00FFFF00FF
            FF00FFB5B3B4CAC9C9D6D5D5C6C4C4AEACACCCCACAF7F6F6F7F6F6F7F2F6EFED
            EDEBEAEAE9E9E9E8E8E8E2E2E2D9D9D9CDCDCDAAA8A9A5A2A3FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFA19E9FBBBABADCDCDCCDCDCDADAEAE
            C9C9C9DDDCDCE6E5E5E8E7E7E6E6E6E4E4E4E5E5E5E0E0E0C5C5C5BAB7B8FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1AFB0F6F7F7F7
            F6F5E2DFDEBCBABABABBBBC4C7C8D4D7D8D5D8D8D8D9D9D8D8D8C6C5C6ADABAC
            BAB7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFEED9D8FFEAE2FFE5DAFEDFD4FADDD3F6DCD3F1DCD6ECDEDAE6E1DFDB
            DBDBC8C7C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFE5C4C1FFE7DDFFE1D5FFDACEFFD4C5FFCEBCFFC9
            B7FFC7B3FDC1AEEBD2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C5C1FFEBE1FFE1D5FFDACE
            FFD5C7FECFBFFECAB8FFC4B0F9B9A7FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFECCDC8FF
            EBE1FFE1D5FFDACEFFD5C7FECFBFFECAB8FFC5B1F0B4A5FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFE8CCC8FFE9DFFFE1D5FFDACEFFD5C7FECFBFFECAB8FFC5B1FAC0AFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFE8CCC8FFE7DDFFE1D5FFDACEFFD5C7FECFBFFFCA
            B8FAC0AFFAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7C9C5FFF1E9FFE7DDFFE1D5FFDACE
            FED5C7FED0BFFFCCB9FAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8CCC8FFF4EBFF
            EBE1FFE6D9FFDFD2FFD9CAFFD4C3F1BDB0FAC0AFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9B3
            B1E8CCC8E7C7C3E7C5BFE7C2BBE7BEB8E7BCB4E5B6AFFAC0AFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 3
          OnClick = Bt_imp_copClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object tab_resultado: TsTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      OnShow = tab_resultadoShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel11: TsPanel
        Left = 0
        Top = 428
        Width = 597
        Height = 37
        Align = alBottom
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sbAbrir: TsSpeedButton
          Left = 308
          Top = 3
          Width = 86
          Height = 31
          Caption = '    Abrir'
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
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbAbrirClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sbConfPgto: TsSpeedButton
          Left = 392
          Top = 3
          Width = 150
          Height = 31
          Caption = ' Confirmar Pgto.'
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
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbConfPgtoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sbCancPgto: TsSpeedButton
          Left = 548
          Top = 3
          Width = 150
          Height = 31
          Caption = ' Cancelar Pgto.'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033337733333333333333333F333333333333
            0000333911733333973333333377F333333F3333000033391117333911733333
            37F37F333F77F33300003339111173911117333337F337F3F7337F3300003333
            911117111117333337F3337F733337F3000033333911111111733333337F3337
            3333F7330000333333911111173333333337F333333F73330000333333311111
            7333333333337F3333373333000033333339111173333333333337F333733333
            00003333339111117333333333333733337F3333000033333911171117333333
            33337333337F333300003333911173911173333333373337F337F33300003333
            9117333911173333337F33737F337F33000033333913333391113333337FF733
            37F337F300003333333333333919333333377333337FFF730000333333333333
            3333333333333333333777330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbCancPgtoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object CheckTodos: TsCheckBox
          Left = 800
          Top = 9
          Width = 119
          Height = 20
          Caption = 'Selecionar Todos'
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = CheckTodosClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object Panel12: TsPanel
        Left = 0
        Top = 384
        Width = 597
        Height = 44
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object GroupBox7: TsGroupBox
          Left = 505
          Top = 3
          Width = 114
          Height = 38
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object stTotal: TsLabel
            Left = 4
            Top = 14
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
        object GroupBox8: TsGroupBox
          Left = 387
          Top = 3
          Width = 114
          Height = 38
          Caption = 'Total Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object stTotalSel: TsLabel
            Left = 4
            Top = 15
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 248
        Top = 96
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsContapagar
        ParentColor = False
        TabOrder = 2
        Visible = False
      end
      object Panel13: TsPanel
        Left = 0
        Top = 0
        Width = 597
        Height = 384
        Align = alClient
        Caption = 'Panel13'
        TabOrder = 3
        SkinData.SkinSection = 'PANEL'
        object dgContasPagar: TDBGrid
          Left = 1
          Top = 1
          Width = 595
          Height = 382
          Align = alClient
          Color = clWhite
          DataSource = dsContapagar
          DefaultDrawing = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dgContasPagarDrawColumnCell
          OnDblClick = dgContasPagarDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DOCUMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Pedido'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 54
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TITULO'
              Title.Alignment = taCenter
              Title.Caption = 'T'#237'tulo'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEQUENCIA'
              Title.Caption = 'Seq.'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZAO_SOCIAL'
              Title.Caption = 'Cliente'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_PEDIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Tot.Pedido'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTAVEN'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Vcto.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor R$'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTAPAG'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Rec.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PAGO'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Rec.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_FOP'
              Title.Caption = 'Forma Pgto.'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTA'
              Title.Caption = 'Conta/Boleto'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Check'
              Width = 18
              Visible = True
            end>
        end
      end
    end
    object tab_dados: TsTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      OnShow = tab_dadosShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Pcdados_cr1: TsPageControl
        Left = 0
        Top = 0
        Width = 597
        Height = 424
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'PAGECONTROL'
        object TabSheet2: TsTabSheet
          Caption = 'Dados'
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object Label18: TsLabel
            Left = 8
            Top = 68
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
            Top = 84
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
          object SpeedButton1: TsSpeedButton
            Left = 533
            Top = 68
            Width = 47
            Height = 35
            Hint = 'INFORMA'#199#213'ES  SOBRE O FORNECEDOR'
            Flat = True
            Glyph.Data = {
              FE0A0000424DFE0A00000000000036000000280000001E0000001E0000000100
              180000000000C80A0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6
              F6EDEDEDE7E7E7E6E6E6E8E8E8EFEFEFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5DCDCDCB7B7B79595958181817D7D7D
              7E7E7E7F7F7F8080808181818585859D9D9DBEBEBEE0E0E0F6F6F6FEFEFEFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFEFEFEE7E7E7AFAFAF7D7D7D727272828282969696A5A5A5B2B2B2B9
              B9B9B7B7B7B3B3B39E9E9E7171716C6C6C808080AEAEAEE4E4E4FDFDFDFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F4F4F4A7A7A77E7E7E8787879B9B9BAFAFAFC1C1C1CCCCCCD4D4D4D6D6D6D4D4
              D4D2D2D2C5C5C59494948C8C8C949494949494AEAEAEEDEDEDFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDA1A1A16E
              6E6E888888B0B0B0D5D5D5EBEBEBF7F8F9F8FBFDF3F6F9EDF1F4E8EBEEE4E6E8
              DDDEDFCECECEBDBDBDB1B1B1B4B4B4BCBCBCC6C6C6EEEEEEFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE8E8E89F9F9F777777959595DCDC
              DCFEFFFFFFFFFFF7FBFFE2E1E1D2CAC4C8BCB2C4B6AAC1B5ABBFB9B5C3C4C6CD
              D1D6D0D3D6CBCCCCC4C4C4C3C3C3CCCCCCCACACAECECECFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFF1F1F19F9F9F8D8D8DC2C2C2FAFBFBFFFFFFF2F2F4
              CFC0AFB49065B07839B36F22B96C17BC6D15BA6E1BB77127B0783DAA8763AB9F
              95B4B6BAC1C3C6CCCCCCCFCFCFCFCFCFCACACAF2F2F2FFFFFFFFFFFF0000FFFF
              FFFFFFFFFFFFFFB0B0B08A8A8AD6D6D6FFFFFFFEFFFFD6C9BBAE8449AF6D10C1
              740CD18011DA8511D28111D18113E08A14E78F19E18B18D78416C17B1FA9804D
              ADA59ECACED2DADBDBD7D7D7CACACAD0D0D0FDFDFDFFFFFF0000FFFFFFFFFFFF
              D9D9D9848484D1D1D1FFFFFFF8F9FCC1A985A97115BE7B09D08A15D89219DB95
              19BE9248B4A388B4A68EB5925CDC9822EFA41FEEA31FEFA31EE39817BE8627B3
              A186D9DBE0E7E8E8DBDBDBC2C2C2E5E5E5FFFFFF0000FFFFFFFEFEFE9D9D9DB3
              B3B3FFFFFFF9FAFDBBA173AB7307C5880ECF9315D89B18E4A317D1A33FCACCCD
              E5EAF3DDDBD0CCB16DD2A94BF8B61EF8B621F6B520F6B51FF2B01ACD941ABAA7
              82EBECF1F4F4F4D3D3D3C7C7C7FEFEFE0000FFFFFFE2E2E2949494F2F2F2FEFF
              FFC6B28EA97406C28B0ECB9413D59E16E0A819EAB016CDB676DFE1E8E5E6E7CF
              CCC5D8AB2EFDC522FDC420FDC420FDC420FBC220F9C01FF4BA1ACA991ACABDA3
              FCFEFFF2F2F3BEBEBEEDEDED0000FFFFFFC0C0C0BEBEBEFFFFFFE1D9CDA47617
              BB850AC48F10CE9913D9A415E4AE18EEB714D7C285DDDFE4DDDDDDD8D9DFC0AE
              75F9C216FFCA1EFFCA1EFECA1EFDC81EFBC51DF6C01DEDB615BC952EE6E2DEFF
              FFFFD2D2D2DDDDDD0000FFFFFFBBBBBBE7E7E8FBFCFDB59760AE7703BC870EC4
              8E10CE9812D9A314E4AE17EEB813E8C866E9EBF1E5E5E5E2E3E5C3C1B8DCB128
              FFC91BFEC71DFDC71DFDC61DFBC41CF5BE1BEFB81AD5A00EC2AC7CFEFFFFE9EA
              EADADADA0000FFFFFFCBCBCBFCFDFEE4DED6A37419B47D09BA840DC28C0FCC95
              11D6A013E2AA16ECB315EEBC2DEBE6D9EFF0F3EFEFEFE1E4E9C8AD60F8BF14FC
              C31BFBC31BFAC21BF8BF1AF2BA19EAB217E0A711B78F31EAE9E9F9FAFAE1E1E1
              0000FFFFFFDFDFDFFCFFFFD3C6B0A57008B27B09B7800CBF870DC89010D29911
              DCA313E6AC16EDB110E6D096ECEEF5EDEDEDF0F1F5CAC0A5E7B018FABD19F8BC
              1AF6BA1AF3B818EDB217E4AB15DCA213B98611D5CBBAFFFFFFE9E9E90000FBFB
              FBE9E9E9F9FBFECCBAA1B58733AF7707B47A09BB810CC2890ECC900FD59911DF
              A113E7A80FE5B747E7E8E9EAEAEBEDEDEED7D6D4D3A430F5B313F2B217F0B116
              ECAD16E5A714DDA013D59811BC8309C8B594FDFFFFEDEEEE0000FAFAFAEAEAEA
              F7F9FBCAB79BC29B5EB98935AF7405B57908BC800CC4870DCD8E0FD59510DE9C
              10E2A015E3D6BAE9EBEFEAEAEAE1E3E8C9A453EAA50EEAA613E7A413E3A012DC
              9B11D49410CD8D0EB97D07C0A981FCFFFFEDEDEE0000FEFEFEEBEBEBF4F5F8CE
              BCA6C5A16CC8A36DBC8C3EB07407B47604BC7C0AC4820CCB880DD28E0ED28A03
              D7AE63EBEDF1EAEAEAE5E9EFCBA153E0960ADF9810DC9510D7910FD18D0DCA87
              0DC3810BB27305C1A986F9FCFFEBEBEB0000FFFFFFEAEAEBF1F2F4D6CABBC8A7
              7ACCA97ACCA979C39754B47916B37000BA7606C17C0AC77F08B58B46B69D70F0
              F3F9F4FAFFE2DBCFCD8C20D5890AD3880CD0860CCB830CC67F0BC07B0ABB7808
              A66702C8B69EF3F6FBECEDED0000FFFFFFEBEBEBEAEBEDE1DBD5CAAE8AD0B087
              CFAE84D0AF85CCA573BE8A3BB4710BB56D00BB7100BE8126CDB390EADBC5E4CB
              A9CE9034CA7B03C87C0AC77B09C47909C07708BC7407B77107B26E049E640FD6
              CDC3E8EBEEF2F2F20000FFFFFFF3F3F3DFE0E0EBEAE9D0BDA5D3B693D2B591D2
              B38ED2B38DD2B28BCBA36FC0883CB67213B56800B86800BA6C00B36300AA5E00
              B36600BD6F03BB6F06B96E06B66C06B26A05AF6905A86200A1763BE3E3E6DFE0
              E0F9F9F90000FFFFFFFDFDFDDADADAEAEBECDDD4CBD4BB9FD7BD9ED6BB9BD5B8
              97D4B694D5B795D5B593CFA97DC69458BC7C2CB26B12AE8A5EB8AD9EA58A66A2
              5E06B06100AE6200AB6100A96000A85F00965400BDAA94E1E5E9E3E3E3FFFFFF
              0000FFFFFFFFFFFFEAEAEAD6D6D6ECECECD8C9B9DAC2A9DAC2A7D9C0A4D8BEA1
              D7BC9DD7B99AD7B99AD7B89AD5B391D0B293EFF1F3FFFFFFEFF4FAB39672AE6B
              1AAF6C19AE6B18AD6C19A86818A98356E1E1E2D9DADBF6F6F6FFFFFF0000FFFF
              FFFFFFFFFEFEFED5D5D5DFDFE0E8E5E3DAC9B8DDC8B1DDC7B0DCC5ADDBC3A9DA
              C1A6D9BEA3D8BCA0D7B99BDAC2AAFDFCFBFFFFFFFFFFFFE1D6CDCBA782CCA67F
              CAA37AC69E74C1A487E4E1E0E0E1E2E7E6E7FFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFF7F7F7C5C5C5E1E2E2EAE6E2DECFC0E0CCB8E0CCB7DFCAB5DEC9B2DDC6
              AFDCC4ACDBC2A9D9BFA4E5D4C3F7F1EBF2ECE4D9C1A9D3B494D2B293CCAC8AC8
              B097E2DEDAE5E6E7DFDFDFFDFDFDFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
              FFFFEFEFEFC5C5C5E5E6E6F0EEEDE3D8CEE0CFBFE2CFBCE2CFBBE1CDB9E0CCB7
              DFCAB4DEC8B1DBC3AADBC3AAD9C1A6D8BDA1D6BA9ED0B69CD4C4B3EAE8E6E6E7
              E9DDDEDDFBFBFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFF3F3F3D0D0D0E3E4E4F7F7F6EEEAE5E5DAD0E2D3C4E2D1C0E1D0BDE1CFBBE1
              CDB9E0CBB6DDC7B1DBC5AFD9C5B0DCCCBDE8E2DCF2F2F3E2E3E4E1E1E1FCFCFC
              FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FBFBFBE0E0E0E1E1E2F4F4F5FBFAFBF5F3F1EFE9E3E9E0D7E7DCD2E5DACFE5DA
              CFE7DCD3ECE5DEF3F0EDF6F6F6EAECEDDCDDDDE9E9E9FEFEFEFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF5F5F5EBEBEBEDEDEEF3F4F5F7F8F9FBFCFDFCFCFDFCFCFCFCFCFDFBFCFD
              F5F6F7EAEAEBE0E0E0E6E6E6F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFDFDFDF5F5F5EFEFF0EBEBECE9E9E9EAEAEAEBEBECEDEDEDF0F0F0F2
              F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000}
            OnClick = SpeedButton1Click
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object GroupBox1: TsGroupBox
            Left = 0
            Top = 0
            Width = 580
            Height = 66
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object btAltTitulo: TsSpeedButton
              Left = 198
              Top = 10
              Width = 23
              Height = 23
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFA13E08A13E08A13E08FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E08B95404C05C03A34007A03D08
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13D08BE5A04D4
                6F00C05B03A23E07A13E08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFA13E08A24008C25E03D36D00BD5903A13E08A13E08FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF9F3C08A54207C76202D26D00B854049F3C08A03C
                07FF00FFFF00FFFF00FFA13E089D3A069E3A069F3B089F3C089F3C089F3C089F
                3C089F3C089F3C089F3C089F3C08A13E08FF00FFFF00FF9F3C08AA4706CC6701
                D06B01AF4B059E3B08A03D08FF00FFFF00FFA44109B85813B7570EB25008B14C
                05B14D05B14D05B14D05B14D05B14D05B24D05B04C05A54108A13E08FF00FFFF
                00FF9F3C08AE4B05CE6A01C96402A64207A03D08FF00FFFF00FFA9480DEB9533
                E99228DA7C14D16D06CE6801D16B01D16C01D16C01D16C01D26C01D36E01B24E
                059F3C08FF00FFFF00FFFF00FF9F3C08B35005D16C00BD5804A03D08A03C07FF
                00FFA9480EF1A242F4A33DE8912ADD8018C96609B44F03B75304B75304B75304
                B85404B65305A64307A13E08FF00FFFF00FFFF00FFFF00FFA03D08C05C03CF6A
                01AB47079F3D08FF00FFA9470DF3A848FDB14CE99536EB952EDA7E1CA8460A9B
                38079F3C089F3C089F3C089F3C08A13E08FF00FFFF00FFFF00FFFF00FFFF00FF
                9F3C08AF4C06D16C01BC57049E3C089F3D08A9470DF3A747FFB751C46922DF89
                30F39E34D3761AA23F079F3B07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFA64307CC6701C45F02A23F089F3D08A9470DF3A747
                FFBA52B95C19AC4B10F2A240F4A036CF721BA13D079F3B07FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA34007C76202C86402A441079F
                3D08A9470DF3A747FFBA52BF621D952F00BC601CF9AB46F6A339CF731DA13E07
                9F3B06FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA44107C964
                02C96402A441079F3D08A9470DF3A747FFB952BE621D9C37039B3603C36821FC
                B04AF8A63CD37820A542089D3906FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                9F3C08AB4807CF6A01C56002A240079F3D08A9470DF3A747FFB952BE621D9C37
                03FF00FF9B3603C16620FAAE49FAAB40DC8325AC4A0B9C3905FF00FFFF00FFFF
                00FFFF00FFA13E08A03D08BF5A03D26D00BB57049F3C08FF00FFA9470DF3A747
                FFB952BE621D9C3703FF00FFFF00FF9B3502BA5E1CF4A746FEB045E58D2CB655
                109F3B059D3A079E3C089E3C08A03D08B85404D06B01CD6801AA4607A03D08FF
                00FFA9470DF3A747FFB952BE621D9C3703FF00FFFF00FFFF00FF9B3603AE4E12
                E39139FDAF46F19C34D2751CB9580DB04C07B04C05C05C03D16C01CE6901B34E
                059F3C08FF00FFFF00FFA9480DF7AD4BFFC156BF641E9C3703FF00FFFF00FFFF
                00FFFF00FF9D3904A03C07C46922E79538F29F36EB9227DD7F14D47106CE6801
                C25D03AC48069F3C08FF00FFFF00FFFF00FFA24008D4802FE29139AC4C109F3C
                06FF00FFFF00FFFF00FFFF00FFFF00FFA03C079B3704A4420AB75916C2661BC0
                6214B5530BA94506A13E08A03D08FF00FFFF00FFFF00FFFF00FFFF00FF9E3A06
                9F3B05A03C07FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F3D
                089D39059D39059D3A079F3C08A03D08FF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Visible = False
              OnClick = btAltTituloClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object btGrTitulo: TsSpeedButton
              Left = 198
              Top = 10
              Width = 23
              Height = 22
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004EAB004EAB004EAB004E
                AB004EAB004EABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0077F1006DE40063D8
                005FCD0060C8005CC10054B7004EAB004794003A76FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007DFD0077F800
                75F32988ED67A9EC91C1F0A3CAF1A2C9F18BBCEC5C9DE01C73CD0053B3004797
                003D7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007C
                FF0078FF3597FDAAD3FCF4F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
                F3FD93BFED2274CB004CA7003C7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF027FFF0982FF8EC5FFF5FAFFFFFFFFFFFFFFFFFFFFFFFFFFF5FAFFFAFD
                FFFFFFFFFFFFFFFFFFFFFFFFFFE7F1FC6CA5E00054B1003D7EFF00FFFF00FFFF
                00FFFF00FFFF00FF0A84FF0A84FFA6D2FFFFFFFFFFFFFFFFFFFFE3F1FF8CC2FB
                479AF4489BF13A93EF56A1F199C7F7EEF7FFFFFFFFFFFFFFFFFFFF72A8E1004E
                AB003E7EFF00FFFF00FFFF00FFFF00FF0380FF7CBDFFFFFFFFFFFFFFFFFFFFA1
                CFFF1B89FE006BF8248AF5C5E0FC298BEE0066E5006DE72988EDB7D9FBFFFFFF
                FFFFFFF3F8FC2F7DCC004DA5FF00FFFF00FFFF00FF0F86FF2390FFE6F3FFFFFF
                FFFFFFFF95C9FF017FFF0075FF3D9DFFE5F2FFFFFFFF79B8F8006DEA0073E800
                6DE70874E9ADD3FAFFFFFFFFFFFFB6D2EE025ABA0053A9FF00FFFF00FF0A84FF
                79BBFFFFFFFFFFFFFFC7E3FF1087FF007CFF53A8FFEEF7FFFFFFFFFFFFFFCAE5
                FF0379F20073EB0073E8006DE7147DEBDCEDFDFFFFFFFDFDFD3F89D40058BEFF
                00FF1B8CFF188BFFC5E1FFFFFFFFFEFFFF5AACFF027FFF69B3FFF7FBFFFFFFFF
                FFFFFFFFFFFFFCFEFF3597F90073F20075ED0073E8006AE66BAFF4FFFFFFFFFF
                FF91BDE90061CF0053A91B8CFF3097FFF1F8FFFFFFFFDFEFFF2792FF81BFFFFC
                FEFFFFFFFFFFFFFF93C8FF7DBEFFFFFFFF8BC4FE0074F90078F50076EE0070E9
                1C83ECF3F9FFFFFFFFC9DFF60470DE0069D71D8DFF52A7FFFCFDFFFFFFFFB8DB
                FF2A94FFCEE6FFFFFFFFF9FCFF7CBDFF0681FF1087FFDBEDFFE5F2FF0B83FF00
                79FA0078F50075EF0477ECD2E6FCFFFFFFEAF3FD0E7CEC0073ED2591FF70B7FF
                FEFFFFFFFFFFB4D9FF2591FF49A3FFC7E3FF65B2FF1087FF168AFF0782FF5AAC
                FFFFFFFF57AAFF0078FF007DFB0079F70379F1C8E1FBFFFFFFF1F8FF1081F400
                77F12E95FF82C0FFFFFFFFFFFFFFC1E0FF3097FF2D95FF2E96FF218FFF2390FF
                1F8EFF188BFF0C85FFB5DAFFC1E0FF027FFF017FFF007BFC067EF8D7EBFDFFFF
                FFE8F4FF0D82F70078F53297FF86C2FFFAFDFFFFFFFFE8F3FF3D9DFF3097FF30
                97FF2E96FF2A94FF2591FF218FFF1388FF2E96FFDFEFFF3D9DFF017FFF007CFF
                2791FFF7FBFFFFFFFFC7E3FF047DFA0079F757AAFF75BAFFEEF7FFFFFFFFFFFF
                FF79BBFF2792FF3398FF3398FF3097FF2B93FF2591FF218FFF0F86FF6DB5FF99
                CCFF0480FF007AFF82C0FFFFFFFFFFFFFF8CC5FF0076FD0079F7FF00FF58ABFF
                D9ECFFFFFFFFFFFFFFDCEDFF3D9DFF2D95FF3398FF3398FF3097FF2D95FF2792
                FF218FFF188BFF82C0FF2D95FF2D95FFECF5FFFFFFFFFCFEFF389BFF007AFFFF
                00FFFF00FF5DADFFACD5FFFEFFFFFFFFFFFFFFFFBDDEFF3699FF2993FF3297FF
                3398FF3297FF2E95FF2993FF1E8DFF1F8EFF58ABFFCAE5FFFFFFFFFFFFFFACD5
                FF017FFF017FFFFF00FFFF00FFFF00FF6FB7FFE8F4FFFFFFFFFFFFFFFFFFFFCC
                E5FF5AACFF2D95FF2591FF2993FF2792FF218FFF2792FF5EAEFFD9EBFFFFFFFF
                FFFFFFEDF6FF2A94FF027FFFFF00FFFF00FFFF00FFFF00FF77BAFFA3D0FFFAFD
                FFFFFFFFFFFFFFFFFFFFFAFDFFC0DFFF8FC6FF7BBCFF7CBDFF95C9FFCAE5FFFF
                FFFFFFFFFFFFFFFFFCFEFF64B1FF017FFF0A84FFFF00FFFF00FFFF00FFFF00FF
                FF00FF76B9FFAFD7FFF5FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFDCEDFF60AFFF0782FF0F86FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF79BBFF91C8FFDBEDFFFAFDFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6FFA1CFFF3599FF0E85FF1489FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF97CAFF75B9FF9E
                CEFFCAE5FFE3F1FFEDF6FFEDF6FFE6F3FFD4E9FFABD4FF6DB5FF3097FF1D8DFF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FF95C9FF75B9FF75B9FF7BBCFF7BBCFF6DB5FF58ABFF44A1FF2D
                95FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Visible = False
              OnClick = btGrTituloClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label8: TsLabel
              Left = 7
              Top = 15
              Width = 77
              Height = 13
              Caption = 'N'#186' Titulo...........:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Label10: TsLabel
              Left = 238
              Top = 15
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
            object Label22: TsLabel
              Left = 8
              Top = 46
              Width = 77
              Height = 13
              Caption = 'Loja..................:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Lbnom_empresa: TsLabel
              Left = 161
              Top = 46
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
            object Prtitulo: TsEdit
              Left = 89
              Top = 11
              Width = 106
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 6
              ParentFont = False
              TabOrder = 0
              OnExit = PrtituloExit
              OnKeyPress = PrtituloKeyPress
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
            object Prsequencia: TsEdit
              Left = 268
              Top = 11
              Width = 35
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnKeyPress = PrtituloKeyPress
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
            object Prconferido: TsCheckBox
              Left = 500
              Top = 15
              Width = 74
              Height = 20
              TabStop = False
              Caption = 'Conferido'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object Prid: TsEdit
              Left = 460
              Top = 11
              Width = 35
              Height = 21
              TabStop = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
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
            object Prcod_empresa: TsComboEdit
              Left = 90
              Top = 40
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
              OnExit = Prcod_empresaExit
              OnKeyPress = Prcod_empresaKeyPress
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
              OnButtonClick = Prcod_empresaButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
            object PrExtrato: TsEdit
              Left = 460
              Top = 35
              Width = 35
              Height = 21
              TabStop = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
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
            object PrProtesto: TsCheckBox
              Left = 500
              Top = 39
              Width = 74
              Height = 20
              TabStop = False
              Caption = 'Protesto?'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
          end
          object GroupBox2: TsGroupBox
            Left = 1
            Top = 171
            Width = 579
            Height = 193
            TabOrder = 3
            SkinData.SkinSection = 'GROUPBOX'
            object Label11: TsLabel
              Left = 7
              Top = 15
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
            object Label12: TsLabel
              Left = 178
              Top = 15
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
            object Label13: TsLabel
              Left = 179
              Top = 119
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
            object lbrec: TsLabel
              Left = 7
              Top = 119
              Width = 92
              Height = 13
              Caption = 'Data Recebimento:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Label16: TsLabel
              Left = 7
              Top = 50
              Width = 44
              Height = 13
              Caption = 'Hist'#243'rico:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Label17: TsLabel
              Left = 297
              Top = 15
              Width = 104
              Height = 13
              Caption = 'Forma de Pagamento:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Lbnom_fop: TsLabel
              Left = 367
              Top = 33
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
            object lbCCBoleto: TsLabel
              Left = 367
              Top = 140
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
            object Label40: TsLabel
              Left = 297
              Top = 119
              Width = 84
              Height = 13
              Caption = 'Banco CC Boleto:'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object sLabel1: TsLabel
              Left = 7
              Top = 153
              Width = 151
              Height = 13
              Caption = 'Instru'#231#245'es Adicionais ao Boleto.'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
            end
            object Prdtaven: TsDateEdit
              Left = 5
              Top = 29
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
              OnExit = PrdtavenExit
              OnKeyPress = PrtituloKeyPress
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
            object Prvalor: TsCurrencyEdit
              Left = 172
              Top = 29
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
              TabOrder = 1
              OnKeyPress = PrtituloKeyPress
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
            object Prhistorico1: TsMemo
              Left = 5
              Top = 62
              Width = 569
              Height = 56
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
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
            end
            object Prdtarec: TsDateEdit
              Left = 5
              Top = 132
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
              TabOrder = 4
              Text = '  /  /    '
              OnKeyPress = PrtituloKeyPress
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
            object Prvalor_recebido: TsCurrencyEdit
              Left = 172
              Top = 132
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
              TabOrder = 5
              OnKeyPress = PrtituloKeyPress
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
            object Prcod_fop: TsComboEdit
              Left = 297
              Top = 29
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
            object PrCONTA_BOLETO: TsComboEdit
              Left = 295
              Top = 132
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
              TabOrder = 6
              Text = ''
              OnExit = PrCONTA_BOLETOExit
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
              OnButtonClick = PrCONTA_BOLETOButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
            object PrInstrucao_Boleto: TsEdit
              Left = 5
              Top = 166
              Width = 569
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 7
              OnKeyPress = PrtituloKeyPress
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
          object Prcod_cliente: TsComboEdit
            Left = 5
            Top = 80
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
            OnExit = Prcod_clienteExit
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
            OnButtonClick = Prcod_clienteButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object GroupBox6: TsGroupBox
            Left = 1
            Top = 102
            Width = 592
            Height = 75
            Caption = 'Plano De Contas'
            TabOrder = 2
            SkinData.SkinSection = 'GROUPBOX'
            object Lbnom_plano_contas_N1: TsLabel
              Left = 64
              Top = 15
              Width = 13
              Height = 13
              Caption = '...'
              Color = clBtnFace
              ParentColor = False
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
            end
            object Lbnom_plano_contas_N2: TsLabel
              Left = 64
              Top = 30
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
            object Lbnom_plano_contas_N3: TsLabel
              Left = 64
              Top = 45
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
            object Lbnom_plano_contas_N4: TsLabel
              Left = 64
              Top = 60
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
            object Prid_plano_contas: TsComboEdit
              Left = 6
              Top = 37
              Width = 52
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
              OnExit = Prid_plano_contasExit
              OnKeyPress = Prid_plano_contasKeyPress
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
              OnButtonClick = Prid_plano_contasButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
          end
        end
        object TabSheet3: TsTabSheet
          Caption = 'Cheques'
          ImageIndex = 1
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object GroupBox3: TsGroupBox
            Left = 0
            Top = 0
            Width = 589
            Height = 396
            Align = alClient
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object bt_loc_cheque: TsBitBtn
              Left = 13
              Top = 18
              Width = 329
              Height = 33
              Caption = 'Localizar Cheque de Terceiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFA87D78B78183B78183B78183B78183B78183B78183B78183B78183B781
                83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
                00FFFF00FFFF00FF7E7D7F4A667CBE9596F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
                F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
                97B3897BFF00FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693F5DFC2F4
                DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
                EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF2089
                E94B7AA2C69592F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
                CC97EECC97EECC97EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF
                FF00FF51B7FE51B3FF1D87E64E7AA0CA9792F5DEC1F4DCBCF3D9B6F2D7B0F1D4
                AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B3897BFF00FFFF
                00FFFF00FFFF00FFFF00FFA97F7B51B7FE4EB2FF1F89E64E7BA2B99497F5DFC2
                F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
                96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9DD52B8FE4BB1FF27
                87D95F6A76E3C8B4A87875AD807BA97976AF807DC8A18DE0BD9AF0CFA0EECC99
                EECC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DF5EC
                E3FBF2E655BDFFB5D6EDA58785AB807AD0B6A3EEE4C7FCFAD7EDE4C6CDAFA0B1
                8580D7B294F0CFA0EECC99EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FF
                FF00FFB2887EF7EFE8FCF5ECFAEFE4C4A8A7B48780F1DEB7FFFDD6FFFFDAFFFF
                DAFFFFDFFFFFEFEADDD8AB7D7ADFBD9AF0CF9FEFCD9AEDCA96B3897BFF00FFFF
                00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1FAF3EAB58681D4B399F8DBAA
                FDF7D0FFFFDAFFFFE1FFFFF2FFFFFBFFFFFFC7A99EC8A18CF0D1A4F0D09FEDCB
                98B3897BFF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFCF8FCF6F0B1
                847EEDD0A4F2C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECE4D9BFAE7F7B
                F1D4AAF1D2A5EECD9EB3897CFF00FFFF00FFFF00FFFF00FFFF00FFBE9283FBF8
                F7FFFFFEFEFAF6A97A76F9DEAAEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFFEAFF
                FFE0F8F5D5A97976F2D7B0F2D5ABEFCFA4B48A7DFF00FFFF00FFFF00FFFF00FF
                FF00FFC29685FBF8F7FFFFFFFFFEFCB2857FEED4A9EFBB84F3CC98FBEEC4FFFF
                DBFFFFDDFFFFDCFFFFDCE8DCC1AE807BF3D9B5F2D7B0F0D2A8B48B7EFF00FFFF
                00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFFFFFFFFB78A85D7BBA0FAE9C5
                F4D3A6F4D09DF9E4B8FEF6CFFEFAD3FFFFDACAAE9CCAA596F4DCBBF4DAB6F1D5
                AEB18A7FFF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFFFFFFFFFFEB
                DFDFB48A82F1EAE9FFF7E9F3CC98F0BD89F4CE9DFCE6B6F0E2BBAD817BE3C8B3
                F4DEC0F3DBBAD9C4A7A0847DFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FCF9
                F7FFFFFFFFFFFFFFFFFFE0CECDB28985D3BBAEEFDCB2FBE3B0EED4A9D2B19AB1
                847EDBBEB0F6E4CCEBD9C0D1C1ABB5A89798817CFF00FFFF00FFFF00FFFF00FF
                FF00FFD2A38AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFEBDFDFB78F84AF827CA97A
                76B2847ECCADA5E7D1C5FBEEDBE7DBC9C8BDAFBAB0A2B7AC9D9C837EFF00FFFF
                00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
                76AD8274FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9F8FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
                E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFDFA
                F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
                D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA482DAA482DA
                A482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482B38176B88285
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              TabOrder = 0
              OnClick = bt_loc_chequeClick
              SkinData.SkinSection = 'BUTTON'
            end
            object Gbdados_cheque: TsGroupBox
              Left = 2
              Top = 57
              Width = 604
              Height = 120
              Caption = 'Dados do Cheque'
              TabOrder = 1
              SkinData.SkinSection = 'GROUPBOX'
              object Label7: TsLabel
                Left = 4
                Top = 18
                Width = 66
                Height = 13
                Caption = 'N'#186' Cheque:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label19: TsLabel
                Left = 220
                Top = 18
                Width = 77
                Height = 13
                Caption = 'N'#186' do Banco:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label20: TsLabel
                Left = 412
                Top = 19
                Width = 69
                Height = 13
                Caption = 'N'#186' Ag'#234'ncia:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label21: TsLabel
                Left = 3
                Top = 41
                Width = 108
                Height = 13
                Caption = 'N'#186' Conta Corrente:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label23: TsLabel
                Left = 4
                Top = 63
                Width = 77
                Height = 13
                Caption = 'Nome Titular:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label24: TsLabel
                Left = 6
                Top = 87
                Width = 82
                Height = 13
                Caption = 'Data Emiss'#227'o:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label25: TsLabel
                Left = 197
                Top = 88
                Width = 102
                Height = 13
                Caption = 'Data Vencimento:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Label26: TsLabel
                Left = 414
                Top = 89
                Width = 67
                Height = 13
                Caption = 'Vlr Cheque:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
              end
              object Lbnr_cheque: TsLabel
                Left = 75
                Top = 18
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object LbNr_banco: TsLabel
                Left = 299
                Top = 18
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Lbnr_agencia: TsLabel
                Left = 483
                Top = 19
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object lbvalor_cheque: TsLabel
                Left = 486
                Top = 89
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object LbData_vencimento: TsLabel
                Left = 303
                Top = 88
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object LbData_emissao: TsLabel
                Left = 91
                Top = 87
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Lbnom_titular: TsLabel
                Left = 84
                Top = 63
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Lbnr_cc: TsLabel
                Left = 114
                Top = 41
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object lbid: TsLabel
                Left = 436
                Top = 50
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
            end
            object BitBtn3: TsBitBtn
              Left = 13
              Top = 180
              Width = 329
              Height = 33
              Caption = 'Gravar Cheque como Recebimento da parcela'
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                AE746C9F52529A4D4E9C4E4F994748A37374B7B8B8B8B6B6B9B7B7BAB8B7BAB7
                B7B9B7B7B8B6B6B7B6B6B8B8B8A47171984546994A4B994B4C9A4D4E9A4D4EFF
                00FFFF00FFB48176C36E6BC96464C96464CB6565B757579A696AB0B1B1CDCDCB
                E5E3E1F2EFEDF9F5F2F9F5F1EEEBEAE3E2E0DEDFDFB67676952C2C9835359E3A
                3AC15B5BC060619A4C4DFF00FFB48176C36E6BCD6565CD6666CE6767BA58599B
                6C6CA18D8DB58180CFAFACDFCCCAF9F5F1FFFCF9FBF7F5EFEDEBE8E9E8B97677
                942A299833339E3939C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB66
                66CE6767B858589E7171A17D7E9E3D3CB4706EC9A09DECE8E5FBF7F5FEFAF7F9
                F5F2F0F0EFBB7978942A2A9833339E3939C25C5CC262629A4C4DFF00FFB48176
                C36E6BCC6565CB6666CE6767B85858A27474A78484972F2F9F3F3FB57573DED8
                D7F2EFEDFBF7F5FEFBF8FAFAF7BE7C7C94292A9833339E3939C25C5CC262629A
                4C4DFF00FFB48176C36E6BCC6565CB6666CE6767B85858A57676AD8988983232
                972F2FA04848C9C2C1E5E3E1F3F0EDFDF9F6FFFFFDC27F7E9329299833339E39
                39C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB6666CE6767B75757AB
                7A79B58C8B972B2B972B2B973232ADA6A6CFCFCEE6E3E0F6F3F0FFFFFDC48280
                9329299833339E3939C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB66
                66CE6767B55656AE7C7BC5AAA8A66565A160609D64649E9F9FB4B9B8D3D6D4EC
                EFECFFFFFFC382819026269530309C3737C15B5BC262629A4C4DFF00FFB48176
                C36E6BCC6565CB6666CE6767BD5C5CB97172D3A7A5C9A0A0BF9999B89494B18D
                8DB18D8DC39F9ED8B2B1E6C2C0C57776A73F3FAA4545AE4949C66060C261629A
                4C4DFF00FFB48176C36E6BCD6666CD6666CD6666CC6565CC6363CB6161CB6262
                CB6262CC6162CC6162CB6161CA5F5FCA5F5FC95F5FCB6262CC6565CC6363CD66
                66CE6767C060619A4C4DFF00FFB48176C36E6BC66060C15D5CC46361C86C6BCB
                7272CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776
                CD7776CD7978CD6F6FCD6666C060619A4C4DFF00FFB48276C46F6CB04E4AA549
                44B56C68C48F8CD0ABA9D7BCBBD8BFBED8BEBDD8BEBDD8BEBDD8BEBDD8BEBDD8
                BEBDD8BEBDD8BEBDD8BEBDD8C3C2D19090CC6161C060619A4C4DFF00FFB48276
                C46E6BAC4541CE9E9AFAF5F3F6EDECF7EFEEF8F1F0F8F1F0F8F1F0F8F1F0F8F1
                F0F8F1F0F8F1F0F8F1F0F8F1F0F8F1F0FAF3F2EEE5E4CD8E8DC35959C060619A
                4D4EFF00FFB48276C46E6BAC4541D2A6A3FFFFFFFBF5F4FBF5F4FBF5F4FBF5F4
                FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FDF7F6EFE7E6CC8D
                8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFDF8F2F1F8
                F1F0F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F1F0
                FBF5F4EFE6E5CC8D8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4
                A1FFFFFEE9E4E3CCCACACDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCD
                CCCCCDCCCCCAC9C8E6E2E2F2E8E7CC8D8CC15757C060619A4D4EFF00FFB48276
                C46E6BAC4541D1A4A1FFFFFEF5EEEEEDE8E7EDE8E7EDE8E7EDE8E7EDE8E7EDE8
                E7EDE8E7EDE8E7EDE8E7EDE8E7ECE7E6F5F0F0F1E7E6CC8D8CC15757C060619A
                4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFEECE7E6D4D1D1D5D2D2D5D2D2
                D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D2D0D0E9E5E5F1E8E7CC8D
                8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFEF2ECEBE5
                E0DFE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDF
                F2EDECF1E7E6CC8D8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4
                A1FFFFFEF2ECEBE5E0DFE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5
                E1E0E5E1E0E4DFDFF2EDECF1E7E6CC8D8CC15757C060619A4D4EFF00FFB48276
                C46E6BAC4541D1A4A1FFFFFEEBE5E5D2CFCFD3D1D0D3D1D0D3D1D0D3D1D0D3D1
                D0D3D1D0D3D1D0D3D1D0D3D1D0D0CECEE9E4E3F2E8E7CC8D8CC15757C060619A
                4D4EFF00FFB48276C46E6BAC4541D2A5A2FFFFFFFCF5F4FDF6F5FDF6F5FDF6F5
                FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FFF8F7F1E7E6CC8D
                8CC35959C161629A4D4EFF00FFB48276BF6F6BAA4541CB9E9BF3F3F2EFE9E8EF
                E9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8
                F0ECEBE8E0DFC88B8AB85353B85C5D9A4D4EFF00FFFF00FFAD736CA14540B689
                87C6CBCBC4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4
                C3C3C4C3C3C4C3C3C3C3C3CFC9C8B884849644459A4C4DFF00FF}
              TabOrder = 2
              OnClick = BitBtn3Click
              SkinData.SkinSection = 'BUTTON'
            end
            object Sgcht_cr1: TAdvStringGrid
              Left = 2
              Top = 232
              Width = 603
              Height = 137
              Cursor = crDefault
              ColCount = 6
              DefaultRowHeight = 21
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 3
              HoverRowCells = [hcNormal, hcSelected]
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'MS Sans Serif'
              ActiveCellFont.Style = [fsBold]
              CellNode.ShowTree = False
              ControlLook.FixedGradientHoverFrom = clGray
              ControlLook.FixedGradientHoverTo = clWhite
              ControlLook.FixedGradientDownFrom = clGray
              ControlLook.FixedGradientDownTo = clSilver
              ControlLook.ControlStyle = csClassic
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'Tahoma'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              EnhRowColMove = False
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'Tahoma'
              FilterDropDown.Font.Style = []
              FilterDropDownClear = '(All)'
              FilterEdit.TypeNames.Strings = (
                'Starts with'
                'Ends with'
                'Contains'
                'Not contains'
                'Equal'
                'Not equal'
                'Clear')
              FixedColWidth = 19
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = []
              FloatFormat = '%.2f'
              HoverButtons.Buttons = <>
              HoverButtons.Position = hbLeftFromColumnLeft
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'Tahoma'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.Borders = pbNoborder
              PrintSettings.Centered = False
              PrintSettings.PageNumSep = '/'
              ScrollWidth = 16
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'Tahoma'
              SearchFooter.Font.Style = []
              SelectionColor = clHighlight
              SelectionTextColor = clHighlightText
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              Version = '7.4.6.3'
              WordWrap = False
              ColWidths = (
                19
                94
                77
                75
                240
                77)
            end
          end
        end
        object tab_deposito: TsTabSheet
          Caption = 'Depositos'
          ImageIndex = 2
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object GroupBox4: TsGroupBox
            Left = 0
            Top = 0
            Width = 589
            Height = 396
            Align = alClient
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object Sg_deposito: TAdvStringGrid
              Left = 2
              Top = 199
              Width = 605
              Height = 202
              Cursor = crDefault
              ColCount = 4
              Ctl3D = True
              DefaultRowHeight = 21
              DrawingStyle = gdsClassic
              FixedCols = 0
              RowCount = 2
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
              ParentCtl3D = False
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
              HoverRowCells = [hcNormal, hcSelected]
              OnClickCell = Sg_depositoClickCell
              ActiveCellShow = True
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'MS Sans Serif'
              ActiveCellFont.Style = [fsBold]
              ActiveCellColor = clMoneyGreen
              CellNode.ShowTree = False
              ControlLook.FixedGradientHoverFrom = clGray
              ControlLook.FixedGradientHoverTo = clWhite
              ControlLook.FixedGradientDownFrom = clGray
              ControlLook.FixedGradientDownTo = clSilver
              ControlLook.ControlStyle = csClassic
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'Tahoma'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              EnhRowColMove = False
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'Tahoma'
              FilterDropDown.Font.Style = []
              FilterDropDownClear = '(All)'
              FilterEdit.TypeNames.Strings = (
                'Starts with'
                'Ends with'
                'Contains'
                'Not contains'
                'Equal'
                'Not equal'
                'Clear')
              FixedColWidth = 17
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = []
              FloatFormat = '%.2f'
              HoverButtons.Buttons = <>
              HoverButtons.Position = hbLeftFromColumnLeft
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'Tahoma'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.Borders = pbNoborder
              PrintSettings.Centered = False
              PrintSettings.PageNumSep = '/'
              ScrollWidth = 16
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'Tahoma'
              SearchFooter.Font.Style = []
              SelectionColor = clHighlight
              SelectionTextColor = clHighlightText
              SortSettings.DefaultFormat = ssAutomatic
              SortSettings.Column = 0
              Version = '7.4.6.3'
              WordWrap = False
              ColWidths = (
                17
                197
                116
                110)
            end
            object Panel10: TsPanel
              Left = 4
              Top = 104
              Width = 593
              Height = 39
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 1
              SkinData.SkinSection = 'PANEL'
              object btnovdep: TsBitBtn
                Left = 8
                Top = 3
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
                OnClick = btnovdepClick
                SkinData.SkinSection = 'BUTTON'
              end
              object btaltdep: TsBitBtn
                Left = 90
                Top = 3
                Width = 83
                Height = 31
                Caption = 'Alterar'
                Glyph.Data = {
                  A2070000424DA207000000000000360000002800000019000000190000000100
                  1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFF7F7F7F0F0EFE7E5E4E1E0
                  DFE4E4E4EAEAEAEFEFEFF3F3F3F7F7F7F9F9F9FBFBFBFDFDFDFDFDFDFEFEFEFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFD2D2D263686B8A9297A6A7A8B4B1B0BBB8B6BABABAC1C1C1C9C9C9D0D0D0D7
                  D7D7DCDCDCE2E2E2E6E6E6EBEBEBEEEEEEF1F1F1F4F4F4F7F7F7F9F9F9FCFCFC
                  FEFEFEFFFFFFFFFFFF00FFFFFFFAFAF9ACB5B977A0B9759BB093A8B1B8C2C8DC
                  DAD8D5D4D3D1D1D1D0D0D0D1D1D1D2D2D2D4D4D4D7D7D7DADADADDDDDDE0E0E0
                  E4E4E4E7E7E7EDEDEDF4F4F4FBFBFBFEFEFEFFFFFF00FFFFFFFFFFFFFFFFFFCE
                  E8F688B6D35999C42E89C49CC6E1FFFFFFFFFEFDF9F9F9F7F7F7F4F4F4F2F2F2
                  F0F0F0EEEEEEECECECECECECEBEBEBECECECEFEFEFF5F5F5FBFBFBFEFEFEFFFF
                  FF00FFFFFFFFFFFFFFFFFFF6FBFEA7DAEE32A1EE1687DF1880C684B8DAFDFDFE
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFCFCFCFDFD
                  FDFDFDFDFEFEFEFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFA7EDFF37C9FC
                  27A3F21E8CE2137EC86AA9D2F2F6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFF1FDFF94ECFF41D0FD2AABF42392E7117FCC539ECDE3ECF4FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFA2EEFF48D5FE2EB2
                  F62799EA1382D03F93C9D0E2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFAFF1FF4ED9FF32B9F82B9FEE1786D52D8AC7BCD6E8FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDF4FF56DCFF35C0F92F
                  A7F11B8BDB2084C6A5C8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFCAF5FF5FDFFF38C6FB33AEF42292E01780C78BBBDBFEFDFDFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6F8FF69E2FF3CCBFC38B6F5
                  289AE51280C971ACD4F7F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE0F9FF75E5FF3ED0FD3ABCF82FA3EA1181CD59A0CFE8EFF5FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAFCFF80E7FF41D3FE3EC2F935AB
                  EE1485D14395CBD5E4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFF1FDFF8EEAFF45D6FE3FC7FB3BB3F2168CD82C8BC8C7D6DEFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF9CECFF49D8FF3ECAFC42B9F27F
                  AEC88B909AA0A0B2FDFDF8FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                  FFFFA9EFFF50DAFF9DD2DFB2A7BD555292606085A3A3C8FBFBFDFFFFFF00FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAF2FACED0D77E6FCA9E9CC18383DB
                  5E5ED8A0A0E7F7F7FD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
                  D2CFEDB1ADE0A6A5E47D7DE58585E47777E0B8B8EF00FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFF9F9FFE7E8F6A7A6EEA5A4EDA8A8ED9E9EEBB0B0
                  EE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2
                  FBCDCCF9CCCBF9C3C3F6E1E1F900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6FFEDECFEF2F2FEFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00}
                TabOrder = 1
                OnClick = btaltdepClick
                SkinData.SkinSection = 'BUTTON'
              end
              object btgradep: TsBitBtn
                Left = 172
                Top = 3
                Width = 83
                Height = 31
                Caption = 'Gravar'
                Enabled = False
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
                TabOrder = 2
                OnClick = btgradepClick
                SkinData.SkinSection = 'BUTTON'
              end
              object btcandep: TsBitBtn
                Left = 254
                Top = 3
                Width = 83
                Height = 31
                Caption = 'Cancelar'
                Enabled = False
                Glyph.Data = {
                  A2070000424DA207000000000000360000002800000019000000190000000100
                  1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE
                  FDFBFDFCFBFCFBFCFDFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFCFEFDF6FAF7EEF6F0E7F2
                  EAE2EFE5DCECE0D6E9DBD1E7D6CEE4D2D4E8D8E3F0E6F4F9F5FEFEFFFFFFFFFF
                  FFFFFFFFFFFDFEFEFBFDFCFAFCFAFBFCFBFCFEFDFEFEFEFFFFFFFFFFFF00FFFF
                  FFF9FCFAE6F1E9C9E2CFB0D4B8A3CEADA2CCABA2CDACA4CDADA9D0B1B5D7BDC9
                  E2CFDDECE0EAF3ECEDF5EEECF4EDE9F3EBE4F0E7E0EEE2DEEDE2E2EFE5EBF4ED
                  F6FAF7FCFDFCFFFFFF00FFFFFFFEFEFEF6FAF7DFEEE2C0DDC6A5CEAE9AC8A49D
                  CAA7A3CDACA8D0B2AED3B6B3D6BBB9D9C0BFDCC5C3DECAC6E0CCC9E2CECCE3D1
                  D0E5D4D5E9DADFEEE2EAF3ECF4F9F5FCFDFCFFFFFF00FFFFFFFFFFFFFFFFFFFB
                  FDFBEBF4EDD1E6D6BCDBC3BCDAC2CAE2D0DEEBE1E2EBE3DAE8DCD2E7D6D2E7D7
                  D5E8D9D9EBDCDDEDE1E3F0E6E9F3ECF0F7F1F7FAF7FBFDFBFEFEFEFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFBFDFEFBFCF2F7F2CCEDD5
                  9BE3B2D4F5E4FDFDFDFBFDFCFBFDFCFCFEFCFDFEFEFEFEFEFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F8F0
                  C4EBCE83D99D44CA7115BE4E18C85E44D68BF9FEFBFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFE
                  E2F1E4B0E2BC71D28D39C86810C24F02C14900BF4611C14F17DA7761DC9CFEFE
                  FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FBFCFC75D18F2DC25B0EC04B02C14803C14A06C24C06C24A05C1
                  4621C35C15DB7BCAF5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
                  FBF25DBC745DC783FAFFFEFFFFFFFFFFFF00FBFCFC4FCB7D1EC8590DC34E03C0
                  4505BD4305BC4006BC3F05BC3C13B7425FD994FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFC0E9CB37AC5100861200982581E0A8FFFFFFFFFFFF00FFFF
                  FFA2DFB940C76731C35909BB3C03B73505B33304AD2F04A82C00A3242EAF49AB
                  E0B7F3FDF7FFFFFFFFFFFFFBFFFECAEED469C9840C9E30008F1D039326019323
                  08A837B1E6C8FFFFFF00FFFFFFDFF2E667CC8059C96F35BF5305B22E03B02B04
                  AD2B04AA2A04A82B00A32300A52931B85558C5765AC4783CB75F0DA538009B25
                  009E2C05A13004A43004A93000A82328B85CEBFAF300FFFFFFFEFEFE98D9A87A
                  D18A66CC7B36C35803BC3605C13C07C54008C54207C54304C03F00B53300AD2E
                  00A82C00A42B00A63105A93505AE3705B63B05C04004CB4200BC3463D18CF7FD
                  FA00FFFFFFFFFFFFC8EBD491DAA58ADA9E75D8903BD36903CF4705D34908D44C
                  07D54C07D44D07D04B06CA4705C44405C04105BD3F05BE3D05C43F05CD4804D6
                  4F00CB403FCE73E6FAEEFFFFFF00FFFFFFFFFFFFEEF8F3A7E3BBACE7BD98E5AE
                  87E8A44BE68107DF5B04E05C07E26008E26208E26107DF5F07DB5B07D95807D6
                  5506D65306D85301D64D00C83C40D876D9FAE7FFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFC0EBCFC5F0D2B8EFCA63DF8E55DF8644E8880DE66E06E66B09E76B09E6
                  6908E46608E26208DF5E09DD5A04D85200CD400BC54068DD8AE6FEEFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFE0F4E7CDEFD7C1F0D026D97A47D07F8BE0
                  A544D57604CD4D00CE4700CE4400CB3F00C83B00C33500BE3211C14153D372B6
                  EFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF9FDFAD4ED
                  DE8CE7B211EA85CBF8E3FFFFFFE6F4E9BAE8C68ADBA06AD1855AC9765EC77876
                  D08B9EDFACD3F2D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFFFFFFFFFFFFFFFFFFFD1EBDC2AC26D4CECA1FEFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF4FAF69FDEB9D3F7E4FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00}
                TabOrder = 3
                OnClick = btcandepClick
                SkinData.SkinSection = 'BUTTON'
              end
              object btexcdep: TsBitBtn
                Left = 336
                Top = 3
                Width = 83
                Height = 31
                Caption = 'Excluir'
                Glyph.Data = {
                  A2070000424DA207000000000000360000002800000019000000190000000100
                  1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F9EBEBECEDEEEFE8EAEADFE0E0DBDC
                  DCE4E4E5F5F6F6FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0ABACAC7978777F79
                  789A928D988E8A89807B756E6B6764636C6C6BA2A3A3D8D8D8E8E8E8FBFBFBFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFEAEA
                  EBA3A09F82756FA79086C0A397CAAA9CCEAC9ECCA898C39F8FAE8F807D685E3E
                  37338A898AC3C3C3DADADAFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFFFFFFFFFFFFFFEFEFEC1BFBEAC9D97D4BBB1DAC1B6DAC1B5E0C6BAE8CFC4E9
                  CDC1E2C4B7E1BFB1ECCEC1B9A1967B716DB9B9BAC2C2C2F0F0F0FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFBEB2ADAC9C96C1B3ADC5
                  B6B1C7B7B0CFBFBBDAC9C3DDC9C1D7C2BAD6BFB5E3D1CAECDFD9AF9A91BCBCBC
                  D4D4D4F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFE
                  FFFFDCC6BEC8B8B1B4A8A3B7A9A1BAA89BC1A890C8BCB5C8BAB5C2B4ADBFADA6
                  CABBB5E5DBD8CAB2A8E0DEDDF8F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFFBFAF9DFC9C1EADDD8CDB082C09B64BF9C72BD8035
                  C7A077D1C6C3CEC0BACEBDB5E0D1CAF5ECE8DBC6BEF4EFEEFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF7F3F2E1CDC7E7D8C4
                  D4B57FD7B98DE0C6A9D8AF7EDAA871F5E2D6F0E4E0E9D9D3EDE1DBF6F0EDDFCD
                  C6EEE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFF4EEECE2CFC7E6D5B1E0D3C0E8E2E1EDE7E4E5CFB7D39C5FEDD5BFF0EA
                  E8E8DDD9EDE4E0F7F3F1E1D3CDEAE3E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFFFFFFF1EAE8E2CEC2E8D3A5E1D4BCE7E2E2EFEB
                  EBD4AD7AD09854F3E6D9F2EFEEE9E2E0EEE8E6F9F5F5E4D7D3E8DFDBFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFEFE7E4E2CE
                  C1ECDCBBE5D8C4E3DDD9E2D3C0DEC29DE9D1B3FDFDFEF3F1F0EAE7E6EFECEAF9
                  F7F7E9DFDCE4D9D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFFFFFFFFFFFFFEDE3DFE4D2CCEEE5D8DEC694DAC7A9C99F5ED5B07BFDFEFEFD
                  FEFEF4F2F2ECEAE9F0EEEEF9F8F8EEE7E4E0D4D0FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE9DDD7EADAD5EFE4D1E1C891D2
                  B379C9A364E5D3BCFCFAF7FDFDFDF4F3F2ECEAE9F0EFEEF9F8F8F3EEECDCD0CB
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE6
                  D8D1F0E3DDF4EBE5EDDECDE7D4C0E0D0C0EDE5E0FBF8F5FCFAF9F4F2F1EBE9E9
                  F0EEEEF8F7F7F7F2F1D8CBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFE4D3CCF6EDE9F9F2EEF3E8E4F0E2DDE9D9D0E7D8CD
                  F7EEE7FAF4F0F4EEECEBE6E4F0ECEBF8F7F6F9F6F5D6C7C2FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFEFEE2CFC7F9F4F1FCF9F7
                  F9F0ECF8EAE2F7E4D9F2DFD2F8E8DDFDF0E7F8EEE8EFE5E0F2EBE8F7F5F3FBF8
                  F7D5C5BEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FDFDFDE1CCC4FDF9F7FFFFFFFEF9F7E3DCD7CDC1BAC6BAB3D0C5BED8CDC6D8CF
                  CAD7CCC5EBE2DCFFFBF9FFFFFFD6C5BEFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00FFFFFFFFFFFFFDFCFBE4CEC6F9F7F6CAC9C89997968884828984
                  809A9591A7A19DA19B988D898677737275716F979593E0DEDDE1CBC2F6F3F1FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFBFBE2D1CAB5B0
                  AF998E88B3A298D4BFB3EED8CAF4DFD3E4CEC0DCC5B7D9C4B6C7B5AB9E908868
                  5F5B4C4948917F78F5F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
                  FFFFFFFFFEFDFDC0B8B5B6A69DD7C4B7DFCABCE6D0C2F5DED0F9E3D7EBD3C5EA
                  D0C0F3DACAF6DDCDEAD1C1DDC4B6A5948A544E4BE1DFDEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE3E2E1A19994E2D4CADAC9BFDBCABFE4
                  D4C9F4E3D8F8E8DDEAD7CAE8D2C4EFD8C9EFD7C8E2C9B9DDC3B2EBCFBDA29288
                  D5D5D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFECEBEB7F
                  7B77BCB2ABDECFC5DECEC3E5D5CBF4E5DBF8ECE3EBDCD1E9D8CCF1DED1F1DDCF
                  E8D1C2E6CDBEC4AFA2847E7AEDEDEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF00FFFFFFFFFFFFFFFFFFD9D8D797928FACA39DC5B9B1DECFC6F5E7DEFAEEE6
                  EEE0D8EDE0D7F5E7DEEFE2D9CCC0B89D948E827F7ED2D2D3FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8D4D3D2
                  BFBCBABBB6B4C8C2BFD0C9C6C6C1BDBEBAB7B5B2AFA4A2A19E9D9DBBBCBCF2F3
                  F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8F8F0F0F0EAEAEAE5E6E6E8E8
                  E9FAFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF00}
                TabOrder = 4
                OnClick = btexcdepClick
                SkinData.SkinSection = 'BUTTON'
              end
            end
            object GroupBox5: TsGroupBox
              Left = 1
              Top = 6
              Width = 606
              Height = 94
              TabOrder = 2
              SkinData.SkinSection = 'GROUPBOX'
              object lbconta: TsLabel
                Left = 80
                Top = 33
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
              object Label27: TsLabel
                Left = 11
                Top = 13
                Width = 74
                Height = 13
                Caption = 'Conta Corrente:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label29: TsLabel
                Left = 434
                Top = 13
                Width = 71
                Height = 13
                Caption = 'Data Deposito:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label30: TsLabel
                Left = 10
                Top = 55
                Width = 58
                Height = 13
                Caption = 'Justificativa:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label31: TsLabel
                Left = 405
                Top = 53
                Width = 74
                Height = 13
                Caption = 'Conta Corrente:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label15: TsLabel
                Left = 273
                Top = 13
                Width = 60
                Height = 13
                Caption = 'N'#186' Deposito:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Dpcod_conta: TsComboEdit
                Left = 9
                Top = 27
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
                OnExit = Dpcod_contaExit
                OnKeyPress = Dpcod_contaKeyPress
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
                OnButtonClick = Dpcod_contaButtonClick
                GlyphMode.Blend = 0
                GlyphMode.Grayed = False
              end
              object Dpjustificativa: TsEdit
                Left = 8
                Top = 68
                Width = 385
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                Text = 'Edit1'
                OnKeyPress = Dpnr_depositoKeyPress
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
              object Dpdta_deposito: TsDateEdit
                Left = 430
                Top = 27
                Width = 118
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
                ReadOnly = True
                TabOrder = 2
                Text = '  /  /    '
                OnKeyPress = Dpnr_depositoKeyPress
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
              object Dpvlr_deposito: TsCurrencyEdit
                Left = 404
                Top = 68
                Width = 99
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
                OnKeyPress = Dpnr_depositoKeyPress
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
              object Dpid: TsEdit
                Left = 560
                Top = 40
                Width = 49
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
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
              object Dpnr_documento: TsEdit
                Left = 541
                Top = 56
                Width = 49
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                Text = 'Edit3'
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
              object Dpseq: TsEdit
                Left = 557
                Top = 64
                Width = 49
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                Text = 'Edit3'
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
              object Dpnr_deposito: TsEdit
                Left = 269
                Top = 27
                Width = 148
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnKeyPress = Dpnr_depositoKeyPress
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
        object tabAgruparPedidos: TsTabSheet
          Caption = 'Agrupar Pedidos'
          TabVisible = False
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object dgPedidosAgrupar: TDBGrid
            Left = 0
            Top = 0
            Width = 589
            Height = 396
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUMDOC'
                Title.Alignment = taCenter
                Title.Caption = 'N'#176' Pedido'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DTADOC'
                Title.Alignment = taCenter
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLIENTE'
                Title.Caption = 'Cliente'
                Width = 340
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOT_LIQUIDO'
                Title.Alignment = taCenter
                Title.Caption = 'T.L'#237'quido'
                Width = 65
                Visible = True
              end
              item
                ButtonStyle = cbsNone
                Expanded = False
                FieldName = 'AGRUPADO'
                Title.Alignment = taCenter
                Title.Caption = ' '
                Width = 20
                Visible = True
              end>
          end
          object ckAgrupar: TsDBCheckBox
            Left = 412
            Top = 64
            Width = 20
            Height = 20
            Hint = 'Cliente Bloqueado'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = False
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
            DataField = 'AGRUPADO'
            ValueChecked = #39'S'#39
            ValueUnchecked = #39'N'#39
          end
        end
      end
      object Panel8: TsPanel
        Left = 0
        Top = 424
        Width = 597
        Height = 41
        Align = alBottom
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Btnov: TsBitBtn
          Left = 13
          Top = 5
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
          TabOrder = 1
          OnClick = BtnovClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btalt: TsBitBtn
          Left = 95
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Alterar'
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFF7F7F7F0F0EFE7E5E4E1E0
            DFE4E4E4EAEAEAEFEFEFF3F3F3F7F7F7F9F9F9FBFBFBFDFDFDFDFDFDFEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFD2D2D263686B8A9297A6A7A8B4B1B0BBB8B6BABABAC1C1C1C9C9C9D0D0D0D7
            D7D7DCDCDCE2E2E2E6E6E6EBEBEBEEEEEEF1F1F1F4F4F4F7F7F7F9F9F9FCFCFC
            FEFEFEFFFFFFFFFFFF00FFFFFFFAFAF9ACB5B977A0B9759BB093A8B1B8C2C8DC
            DAD8D5D4D3D1D1D1D0D0D0D1D1D1D2D2D2D4D4D4D7D7D7DADADADDDDDDE0E0E0
            E4E4E4E7E7E7EDEDEDF4F4F4FBFBFBFEFEFEFFFFFF00FFFFFFFFFFFFFFFFFFCE
            E8F688B6D35999C42E89C49CC6E1FFFFFFFFFEFDF9F9F9F7F7F7F4F4F4F2F2F2
            F0F0F0EEEEEEECECECECECECEBEBEBECECECEFEFEFF5F5F5FBFBFBFEFEFEFFFF
            FF00FFFFFFFFFFFFFFFFFFF6FBFEA7DAEE32A1EE1687DF1880C684B8DAFDFDFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFCFCFCFDFD
            FDFDFDFDFEFEFEFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFA7EDFF37C9FC
            27A3F21E8CE2137EC86AA9D2F2F6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFF1FDFF94ECFF41D0FD2AABF42392E7117FCC539ECDE3ECF4FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFA2EEFF48D5FE2EB2
            F62799EA1382D03F93C9D0E2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFAFF1FF4ED9FF32B9F82B9FEE1786D52D8AC7BCD6E8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDF4FF56DCFF35C0F92F
            A7F11B8BDB2084C6A5C8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCAF5FF5FDFFF38C6FB33AEF42292E01780C78BBBDBFEFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6F8FF69E2FF3CCBFC38B6F5
            289AE51280C971ACD4F7F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE0F9FF75E5FF3ED0FD3ABCF82FA3EA1181CD59A0CFE8EFF5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAFCFF80E7FF41D3FE3EC2F935AB
            EE1485D14395CBD5E4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF1FDFF8EEAFF45D6FE3FC7FB3BB3F2168CD82C8BC8C7D6DEFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF9CECFF49D8FF3ECAFC42B9F27F
            AEC88B909AA0A0B2FDFDF8FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FFFFA9EFFF50DAFF9DD2DFB2A7BD555292606085A3A3C8FBFBFDFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAF2FACED0D77E6FCA9E9CC18383DB
            5E5ED8A0A0E7F7F7FD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
            D2CFEDB1ADE0A6A5E47D7DE58585E47777E0B8B8EF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF9F9FFE7E8F6A7A6EEA5A4EDA8A8ED9E9EEBB0B0
            EE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2
            FBCDCCF9CCCBF9C3C3F6E1E1F900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6FFEDECFEF2F2FEFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 2
          OnClick = btaltClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btgra: TsBitBtn
          Left = 177
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Gravar'
          Enabled = False
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
          TabOrder = 0
          OnClick = btgraClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btcan: TsBitBtn
          Left = 260
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Cancelar'
          Enabled = False
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE
            FDFBFDFCFBFCFBFCFDFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFCFEFDF6FAF7EEF6F0E7F2
            EAE2EFE5DCECE0D6E9DBD1E7D6CEE4D2D4E8D8E3F0E6F4F9F5FEFEFFFFFFFFFF
            FFFFFFFFFFFDFEFEFBFDFCFAFCFAFBFCFBFCFEFDFEFEFEFFFFFFFFFFFF00FFFF
            FFF9FCFAE6F1E9C9E2CFB0D4B8A3CEADA2CCABA2CDACA4CDADA9D0B1B5D7BDC9
            E2CFDDECE0EAF3ECEDF5EEECF4EDE9F3EBE4F0E7E0EEE2DEEDE2E2EFE5EBF4ED
            F6FAF7FCFDFCFFFFFF00FFFFFFFEFEFEF6FAF7DFEEE2C0DDC6A5CEAE9AC8A49D
            CAA7A3CDACA8D0B2AED3B6B3D6BBB9D9C0BFDCC5C3DECAC6E0CCC9E2CECCE3D1
            D0E5D4D5E9DADFEEE2EAF3ECF4F9F5FCFDFCFFFFFF00FFFFFFFFFFFFFFFFFFFB
            FDFBEBF4EDD1E6D6BCDBC3BCDAC2CAE2D0DEEBE1E2EBE3DAE8DCD2E7D6D2E7D7
            D5E8D9D9EBDCDDEDE1E3F0E6E9F3ECF0F7F1F7FAF7FBFDFBFEFEFEFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFBFDFEFBFCF2F7F2CCEDD5
            9BE3B2D4F5E4FDFDFDFBFDFCFBFDFCFCFEFCFDFEFEFEFEFEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F8F0
            C4EBCE83D99D44CA7115BE4E18C85E44D68BF9FEFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFE
            E2F1E4B0E2BC71D28D39C86810C24F02C14900BF4611C14F17DA7761DC9CFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FBFCFC75D18F2DC25B0EC04B02C14803C14A06C24C06C24A05C1
            4621C35C15DB7BCAF5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
            FBF25DBC745DC783FAFFFEFFFFFFFFFFFF00FBFCFC4FCB7D1EC8590DC34E03C0
            4505BD4305BC4006BC3F05BC3C13B7425FD994FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC0E9CB37AC5100861200982581E0A8FFFFFFFFFFFF00FFFF
            FFA2DFB940C76731C35909BB3C03B73505B33304AD2F04A82C00A3242EAF49AB
            E0B7F3FDF7FFFFFFFFFFFFFBFFFECAEED469C9840C9E30008F1D039326019323
            08A837B1E6C8FFFFFF00FFFFFFDFF2E667CC8059C96F35BF5305B22E03B02B04
            AD2B04AA2A04A82B00A32300A52931B85558C5765AC4783CB75F0DA538009B25
            009E2C05A13004A43004A93000A82328B85CEBFAF300FFFFFFFEFEFE98D9A87A
            D18A66CC7B36C35803BC3605C13C07C54008C54207C54304C03F00B53300AD2E
            00A82C00A42B00A63105A93505AE3705B63B05C04004CB4200BC3463D18CF7FD
            FA00FFFFFFFFFFFFC8EBD491DAA58ADA9E75D8903BD36903CF4705D34908D44C
            07D54C07D44D07D04B06CA4705C44405C04105BD3F05BE3D05C43F05CD4804D6
            4F00CB403FCE73E6FAEEFFFFFF00FFFFFFFFFFFFEEF8F3A7E3BBACE7BD98E5AE
            87E8A44BE68107DF5B04E05C07E26008E26208E26107DF5F07DB5B07D95807D6
            5506D65306D85301D64D00C83C40D876D9FAE7FFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFC0EBCFC5F0D2B8EFCA63DF8E55DF8644E8880DE66E06E66B09E76B09E6
            6908E46608E26208DF5E09DD5A04D85200CD400BC54068DD8AE6FEEFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFE0F4E7CDEFD7C1F0D026D97A47D07F8BE0
            A544D57604CD4D00CE4700CE4400CB3F00C83B00C33500BE3211C14153D372B6
            EFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF9FDFAD4ED
            DE8CE7B211EA85CBF8E3FFFFFFE6F4E9BAE8C68ADBA06AD1855AC9765EC77876
            D08B9EDFACD3F2D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFD1EBDC2AC26D4CECA1FEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF4FAF69FDEB9D3F7E4FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 3
          OnClick = btcanClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btexc: TsBitBtn
          Left = 515
          Top = 6
          Width = 83
          Height = 31
          Caption = 'Excluir'
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F9EBEBECEDEEEFE8EAEADFE0E0DBDC
            DCE4E4E5F5F6F6FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0ABACAC7978777F79
            789A928D988E8A89807B756E6B6764636C6C6BA2A3A3D8D8D8E8E8E8FBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFEAEA
            EBA3A09F82756FA79086C0A397CAAA9CCEAC9ECCA898C39F8FAE8F807D685E3E
            37338A898AC3C3C3DADADAFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFEFEFEC1BFBEAC9D97D4BBB1DAC1B6DAC1B5E0C6BAE8CFC4E9
            CDC1E2C4B7E1BFB1ECCEC1B9A1967B716DB9B9BAC2C2C2F0F0F0FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFBEB2ADAC9C96C1B3ADC5
            B6B1C7B7B0CFBFBBDAC9C3DDC9C1D7C2BAD6BFB5E3D1CAECDFD9AF9A91BCBCBC
            D4D4D4F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFE
            FFFFDCC6BEC8B8B1B4A8A3B7A9A1BAA89BC1A890C8BCB5C8BAB5C2B4ADBFADA6
            CABBB5E5DBD8CAB2A8E0DEDDF8F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFBFAF9DFC9C1EADDD8CDB082C09B64BF9C72BD8035
            C7A077D1C6C3CEC0BACEBDB5E0D1CAF5ECE8DBC6BEF4EFEEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF7F3F2E1CDC7E7D8C4
            D4B57FD7B98DE0C6A9D8AF7EDAA871F5E2D6F0E4E0E9D9D3EDE1DBF6F0EDDFCD
            C6EEE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFF4EEECE2CFC7E6D5B1E0D3C0E8E2E1EDE7E4E5CFB7D39C5FEDD5BFF0EA
            E8E8DDD9EDE4E0F7F3F1E1D3CDEAE3E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFF1EAE8E2CEC2E8D3A5E1D4BCE7E2E2EFEB
            EBD4AD7AD09854F3E6D9F2EFEEE9E2E0EEE8E6F9F5F5E4D7D3E8DFDBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFEFE7E4E2CE
            C1ECDCBBE5D8C4E3DDD9E2D3C0DEC29DE9D1B3FDFDFEF3F1F0EAE7E6EFECEAF9
            F7F7E9DFDCE4D9D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFEDE3DFE4D2CCEEE5D8DEC694DAC7A9C99F5ED5B07BFDFEFEFD
            FEFEF4F2F2ECEAE9F0EEEEF9F8F8EEE7E4E0D4D0FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE9DDD7EADAD5EFE4D1E1C891D2
            B379C9A364E5D3BCFCFAF7FDFDFDF4F3F2ECEAE9F0EFEEF9F8F8F3EEECDCD0CB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE6
            D8D1F0E3DDF4EBE5EDDECDE7D4C0E0D0C0EDE5E0FBF8F5FCFAF9F4F2F1EBE9E9
            F0EEEEF8F7F7F7F2F1D8CBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFE4D3CCF6EDE9F9F2EEF3E8E4F0E2DDE9D9D0E7D8CD
            F7EEE7FAF4F0F4EEECEBE6E4F0ECEBF8F7F6F9F6F5D6C7C2FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFEFEE2CFC7F9F4F1FCF9F7
            F9F0ECF8EAE2F7E4D9F2DFD2F8E8DDFDF0E7F8EEE8EFE5E0F2EBE8F7F5F3FBF8
            F7D5C5BEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FDFDFDE1CCC4FDF9F7FFFFFFFEF9F7E3DCD7CDC1BAC6BAB3D0C5BED8CDC6D8CF
            CAD7CCC5EBE2DCFFFBF9FFFFFFD6C5BEFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFDFCFBE4CEC6F9F7F6CAC9C89997968884828984
            809A9591A7A19DA19B988D898677737275716F979593E0DEDDE1CBC2F6F3F1FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFBFBE2D1CAB5B0
            AF998E88B3A298D4BFB3EED8CAF4DFD3E4CEC0DCC5B7D9C4B6C7B5AB9E908868
            5F5B4C4948917F78F5F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFEFDFDC0B8B5B6A69DD7C4B7DFCABCE6D0C2F5DED0F9E3D7EBD3C5EA
            D0C0F3DACAF6DDCDEAD1C1DDC4B6A5948A544E4BE1DFDEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE3E2E1A19994E2D4CADAC9BFDBCABFE4
            D4C9F4E3D8F8E8DDEAD7CAE8D2C4EFD8C9EFD7C8E2C9B9DDC3B2EBCFBDA29288
            D5D5D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFECEBEB7F
            7B77BCB2ABDECFC5DECEC3E5D5CBF4E5DBF8ECE3EBDCD1E9D8CCF1DED1F1DDCF
            E8D1C2E6CDBEC4AFA2847E7AEDEDEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFD9D8D797928FACA39DC5B9B1DECFC6F5E7DEFAEEE6
            EEE0D8EDE0D7F5E7DEEFE2D9CCC0B89D948E827F7ED2D2D3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8D4D3D2
            BFBCBABBB6B4C8C2BFD0C9C6C6C1BDBEBAB7B5B2AFA4A2A19E9D9DBBBCBCF2F3
            F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8F8F0F0F0EAEAEAE5E6E6E8E8
            E9FAFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 4
          OnClick = btexcClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btBoleto: TsBitBtn
          Left = 343
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Boleto'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFCA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800
            CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA68
            00CA6800FF00FFFF00FFFF00FFCA6800FFE3C4FEE1C0FFE0BDFFDDBAFEDCB5FF
            D9B2FED8AFFED7ABFED4A7FED4A5FED1A1FED09FFECF9DFECE9AFECC98FECC97
            FECB96FECB96FECB96FECB96CA6800FF00FFFF00FFCA6800FEE5C9FEE3C50081
            00008100008100008100008100008100008100FED4A7FED3A500810000810000
            8100008100008100008100008100FECB96FECB96CA6800FF00FFFF00FFCA6800
            FFE6CCFFE5C9008100008100008100008100008100008100008100FED7ABFED4
            A7008100008100008100008100008100008100008100FECB97FECB96CA6800FF
            00FFFF00FFCA6800FEE9D1FEE6CEFEE5C9FFE3C6FEE1C1FFE0BFFEDDBAFEDCB6
            FEDAB2FED8AFFED5ACFED5A9FED3A6FED1A3FED1A0FECF9DFECE9CFECC99FECC
            97FECB96CA6800FF00FFFF00FFCA6800FEEAD5FEE9D100810000810000810000
            8100008100008100008100FEDAB2FED8AF008100008100008100008100008100
            008100008100FECC99FECC98CA6800FF00FFFF00FFCA6800FFEDD9FFEBD50081
            00008100008100008100008100008100008100FEDCB6FEDAB400810000810000
            8100008100008100008100008100FECF9DFECE99CA6800FF00FFFF00FFCA6800
            FFEFDDFFEDD9FFEBD5FEEAD1FEE7CCFFE5C9FEE3C6FFE1C2FFE0BFFEDEBBFFDC
            B7FEDAB4FED8B0FED7ACFED5A9FED4A6FFD1A4FED0A1FECF9EFECF9CCA6800FF
            00FFFF00FFCA6800FFF0E1FFEFDD008100008100008100008100008100008100
            008100FEE0BFFEDEBB008100008100008100008100008100008100008100FED0
            A1FFCF9ECA6800FF00FFFF00FFCA6800FFF2E5FFF0E100810000810000810000
            8100008100008100008100FFE2C2FEE0BF008100008100008100008100008100
            008100008100FED1A4FED1A1CA6800FF00FFFF00FFCA6800FFF4E7FFF3E5FFF0
            E1FFEEDDFEEDDAFFEBD7FFEAD1FFE7CFFEE6CAFEE3C6FFE2C4FFE1BFFEDDBBFF
            DCB7FEDAB4FED9B0FFD7ACFED5AAFED4A7FED3A4CA6800FF00FFFF00FFCA6800
            FEF6EDFFF4E9008100008100008100008100008100008100008100FEE6CBFEE3
            C7008100008100008100008100008100008100008100FFD7AAFED4A7CA6800FF
            00FFFF00FFCA6800FFF8EFFFF6ED008100008100008100008100008100008100
            008100FEE7CFFEE6CB008100008100008100008100008100008100008100FED8
            ADFED5ABCA6800FF00FFFF00FFCA6800FFF8F2FFF7EFFFF6EDFFF4EAFFF3E6FF
            F0E2FFEFDEFFEEDAFFEBD7FEE9D3FFE9CFFEE6CBFEE5C7FFE2C4FEE1C0FEDEBB
            FEDDB8FEDAB5FED9B1FED7AFCA6800FF00FFFF00FFCA6800FFFAF4FFF8F20081
            00008100008100008100008100008100008100FEEBD7FEEAD400810000810000
            8100008100008100008100008100FEDCB5FED9B1CA6800FF00FFFF00FFCA6800
            FEFBF8FFFBF6008100008100008100008100008100008100008100FFEEDAFFEB
            D7008100008100008100008100008100008100008100FFDDB8FFDAB6CA6800FF
            00FFFF00FFCA6800FFFCFBFFFBF8FEFBF6FFFAF3FFF7F0FFF6EDFFF4EAFEF3E7
            FEF0E2FFF0DEFEEEDAFFEBD8FFEAD4FEE9D0FEE6CBFEE5C7FFE2C5FFE1C0FEDE
            BCFEDDBACA6800FF00FFFF00FFCA6800FFFEFCFFFEFB00810000810000810000
            8100008100008100008100FFF0E2FFF0E0008100008100008100008100008100
            008100008100FEE1C1FEDEBDCA6800FF00FFFF00FFCA6800FFFFFFFFFEFE0081
            00008100008100008100008100008100008100FFF3E6FFF2E300810000810000
            8100008100008100008100008100FFE3C5FFE1C1CA6800FF00FFFF00FFCA6800
            FFFFFFFFFFFFFFFEFEFFFEFBFFFBF8FFFBF6FFFAF4FFF8F0FFF7EEFFF6EBFFF3
            E6FEF2E3FFF0E0FFEEDCFFEDD8FFEBD4FFE9D0FEE7CCFFE5C9FEE3C5CA6800FF
            00FFFF00FFCA6800FFFFFFFFFFFFFFFFFFFFFEFEFFFEFBFFFCF8FFFBF7FFFAF3
            FFF8F0FFF7EEFFF4EAFEF3E7FFF2E3FFF0E1FEEEDDFEEDD8FFEAD4FEE9D0FEE7
            CEFEE5C9CA6800FF00FFFF00FFFF00FFCA6800CA6800CA6800CA6800CA6800CA
            6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800CA6800
            CA6800CA6800CA6800CA6800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 5
          OnClick = btBoletoClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnEmailBoleto: TsBitBtn
          Left = 426
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000BF8281BC8181
            BA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B
            7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA
            7B7ABF8281BC8181D99D83FFC988FFC587FFC487FFC487FFC487FFC487FFC487
            FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC587FFC2
            87CB8F82BB7F81BA7B7ABF8281D79983C18781E0A98EFCCB99F8C697F8C697F8
            C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697
            F8C697FCCB99D8A18BC18481CC9286BA7B7ABA7F80E1A98AD99E86BC8282EFC5
            A1F7D0A6F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4
            CCA5F4CCA5F4CCA5F7D0A6E7BA9DBC8181E2AB8EDDA990BA7B7ABA7E7ED9AB98
            F7C99CC98A7FCE9D92F3D7B7F2D4B6F0D3B5F0D3B5F0D3B5F0D3B5F0D3B5F0D3
            B5F0D3B5F0D3B5F0D3B5F0D3B5F2D4B6EDCBB1C18987CC9286F8D5AFD8AB9CBA
            7B7ABA7D7BD4ACA3F7DCBBEDB791BF817FDAB6AAEFDCC6EDD8C4EDD8C4EDD8C4
            EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4F0DEC7D3A99FBD7F7BE7BD
            A1F3E1C9D4ACA3BA7B7ABA7D7BD4AFA7EFE3D3F4D5B4D79C86BC8484E7D5C9ED
            E1D1EBDDCEEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCEEDE3D3DDC2B7
            BC807FDEAF97F0DEC7EEE5D5D4AFA7BA7B7ABA7D7BD5B1ACF3EBE0F2E2D1F2C7
            A4C7897BCCA19EEDE2D7EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9F0
            E7DCEDDED4C18B8ACB9186F3DCC4F0E5D9F3EBE0D5B1ACBA7B7ABA7B7AD8B5B1
            F7F3EAF3EBE3F8E6D0F2C09CB67B77D3B5B1F7F2E9F4EDE3F4EDE3F4EDE3F4ED
            E3F4EDE3F4EDE3F4EDE3CFA4A1C1827BEECCB5F6EFE3F3EBE3F8F3EAD8B5B1BA
            7B7ABA7B7ADAB8B5FBFBF3F8F4EFFAF4EDEDCAB5C1837ABC807FCB9C99CC9E9A
            CC9D9ACC9D9ACC9E9ACC9D9ACC9C99C6908EB87777D19E96F7EBDEFAF8F2F7F3
            EBFBFBF3DAB8B5BA7B7ABA7A79DDBCBBFFFFFFFCFBF7D5AFACBA7B7AC69393D8
            B8B8C69393BD8382BF8484BF8484BD8483BF8686C49593CFB5B4CBA7A6BC7D7D
            C99392EFE0DDFFFFFFFFFFFFDDBCBBBA7B7ABA7A79E1C4C2F0E2E2CB9A99BC80
            7FD7B2B2F3F2F0FBFFFFF4FBFCEFF6F7EFF6F7EDF6F7EDF6F7E9F6F7E9FBFBED
            FFFFE9FFFFD7CCCBC19291BD7F7ED9B5B4FBF7F7E1C4C2BA7B7ABC7F7FCE9D9C
            C48684C08686E9D7D7FFFFFFFBFFFFF7FFFFF7FFFFF3FFFFF3FFFFEFFFFFEFFF
            FFEDFFFFE9FFFFE9FFFFE7FFFFE9FFFFE2F4F4C9A9A9BA7D7BC99392CFA4A1BA
            7B7ABF8281B68080BAB4B6F7F2F2FFFFFFFBFFFFFAFFFFF7FFFFF7FFFFF3FFFF
            F2FFFFEFFFFFEDFFFFEDFFFFE9FFFFE9FFFFE7FFFFE7FFFFE7FFFFE7FFFFDCE3
            E3CBA5A4BF8281BA7B7AC17E7DA19DA09EFCFFFFFFFFFEFFFFFBFFFFFAFFFFF7
            FFFFF7FFFFF3FFFFF2FFFFEFFFFFEFFFFFF2FFFFEFFFFFF2FFFFEFFFFFE9FFFF
            E2F8FADCF4F6CFEEF2B7DEE3AD9EA0BA7B7AC0817FAB9092ACE3E9FFFFFFFEFF
            FFFBFFFFFBFFFFFAFFFFFBFFFFFBFFFFFBFFFFF2FFFFE9F6F7D3E7E9C1DADDAF
            CCD3A0C1C990B4C183A9B8739EB26C9DB57F8E9CA48082BA7B7AFF00FFBB7A79
            BA7D7BFFFFFFFFFFFFFBFFFFF7FFFFEBFAFBD4EAEBC0DEE1AFD5D992C6CC75B1
            BA6CADBA6BB0BF69B1C668B2CA6CB6D46DBBDE72BFE591A4BABC807FBF817FFF
            00FFFF00FFFF00FFC17E7DBA7D7BA19FA397F4FF86F7FF78E5F26FD3DE6CD1DE
            68D7E26BDDEA6FE5F372E6F874E2F775DEF776DCF873DCFC7ACCEDA997A0C081
            7FBF8180FF00FFFF00FFFF00FFFF00FFFF00FFBA7D7BB87E7BA19FA37EDAE56F
            F3FF72F0FF74EFFF74F0FF74F0FF74F0FF74EFFF75EBFC74E7FE73E5FE87C2D7
            AF9298C27F7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFC17E7DBD838299B5BA73F3FF70F6FF74F0FF74EFFF74EFFF72F0FF70F6FF76
            E7F89EAAB1BF8180C17E7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFBF817FC07F7EA7A1A583D7E072F4FF6FF7FF6FF7
            FF74F0FF83D8E1AC9C9DC27D7ABF8180FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC27D7ABC8483
            A6A1A499B5BA99B5BAAB9C9DBC8282C17E7DFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFBF8180C17E7DC27D7AC27D7AC17E7DFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          TabOrder = 6
          OnClick = BtnEmailBoletoClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
  end
  object Q_cr1: TFDQuery
    Connection = dao.CN
    Left = 248
    Top = 90
  end
  object Q_deposito_cr1: TFDQuery
    Connection = dao.CN
    Left = 280
    Top = 90
  end
  object Q_cheque_terc_cr1: TFDQuery
    Connection = dao.CN
    Left = 312
    Top = 90
  end
  object Q_resultado: TFDQuery
    Connection = dao.CN
    Left = 224
    Top = 130
  end
  object mmContasPagar: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 360
    Top = 208
    object mmContasPagarID: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'ID'
    end
    object mmContasPagarTITULO: TStringField
      FieldName = 'TITULO'
    end
    object mmContasPagarNR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
    end
    object mmContasPagarSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object mmContasPagarRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object mmContasPagarHISTORICO: TStringField
      DisplayWidth = 500
      FieldName = 'HISTORICO'
      Size = 500
    end
    object mmContasPagarDTAVEN: TDateField
      Alignment = taCenter
      FieldName = 'DTAVEN'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmContasPagarDTAPAG: TDateField
      Alignment = taCenter
      FieldName = 'DTAPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmContasPagarTOTAL_PEDIDO: TCurrencyField
      FieldName = 'TOTAL_PEDIDO'
    end
    object mmContasPagarVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmContasPagarVALOR_PAGO: TCurrencyField
      FieldName = 'VALOR_PAGO'
    end
    object mmContasPagarVALOR_CORRIGIDO: TCurrencyField
      FieldName = 'VALOR_CORRIGIDO'
    end
    object mmContasPagarNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 100
    end
    object mmContasPagarEXTRATO: TIntegerField
      FieldName = 'EXTRATO'
    end
    object mmContasPagarCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmContasPagarDESCONTADA: TStringField
      FieldName = 'DESCONTADA'
      Size = 1
    end
    object mmContasPagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 100
    end
  end
  object dsContapagar: TDataSource
    DataSet = mmContasPagar
    Left = 480
    Top = 296
  end
  object q_pedidos_agrupar: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT distinct a.NUMDOC, a.DTADOC, a.cod_cliente, a.COD_CLIENTE' +
        '||'#39'-'#39'||c.NOM_CLIENTE as cliente, a.TOT_BRUTO, a.TOT_LIQUIDO,'
      
        'a.COD_REPRESENTANTE||'#39'-'#39'||r.NOM_REPRESENTANTE as representante, ' +
        'A.OBSERVACOES_PEDIDO,'
      'case when A.NUMDOC_GRUPO is null then '#39'N'#39' else '#39'S'#39' end agrupado'
      ''
      'FROM VENDAS1 a'
      'INNER JOIN CLIENTE C ON C.COD_CLIENTE = A.COD_CLIENTE'
      'left outer join REPRESENTANTE r on r.ID = a.COD_REPRESENTANTE '
      'where '
      
        '  a.consignacao<> '#39'1'#39' and a.orcamento= '#39'0'#39' and a.cod_fop <> '#39'9'#39' ' +
        'AND'
      '  '
      '  A.FATURADO = 0 and'
      '  A.COD_CLIENTE = :cliente and'
      '  A.NUMDOC <> :grupo and '
      '  0 = (select faturado from vendas1 where numdoc = :grupo) and'
      '  (A.NUMDOC_GRUPO = :grupo OR A.NUMDOC_GRUPO IS NULL) '
      '  '
      '  '
      'order by '
      '  numdoc desc, A.DTADOC desc')
    Left = 472
    Top = 112
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_pedidos_agruparNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'NUMDOC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_pedidos_agruparDTADOC: TDateField
      FieldName = 'DTADOC'
      Origin = 'DTADOC'
    end
    object q_pedidos_agruparCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
    end
    object q_pedidos_agruparCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 162
    end
    object q_pedidos_agruparTOT_BRUTO: TBCDField
      FieldName = 'TOT_BRUTO'
      Origin = 'TOT_BRUTO'
      Precision = 18
      Size = 2
    end
    object q_pedidos_agruparTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'TOT_LIQUIDO'
      Precision = 18
    end
    object q_pedidos_agruparREPRESENTANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTE'
      Origin = 'REPRESENTANTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 62
    end
    object q_pedidos_agruparOBSERVACOES_PEDIDO: TMemoField
      FieldName = 'OBSERVACOES_PEDIDO'
      Origin = 'OBSERVACOES_PEDIDO'
      BlobType = ftMemo
    end
    object q_pedidos_agruparAGRUPADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AGRUPADO'
      Origin = 'AGRUPADO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object ds_pedidos_agrupar: TDataSource
    DataSet = q_pedidos_agrupar
    Left = 476
    Top = 148
  end
  object fR_RELATORIO: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 42430.646703044010000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure MDOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Trim(<Banco."DirLogo">) <> '#39#39' then'
      '  begin              '
      
        '     Logo_1.Picture.LoadFromFile(<Banco."DirLogo"> + '#39'\'#39' + <Banc' +
        'o."Numero"> + '#39'.bmp'#39');'
      '     Logo_2.Picture.Assign(Logo_1.Picture);'
      '     Logo_3.Picture.Assign(Logo_1.Picture);'
      '  end;                   '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 432
    Top = 184
    Datasets = <
      item
      end
      item
      end
      item
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MD: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 1028.032160000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MDOnBeforePrint'
        RowCount = 0
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 275.000000000000000000
          Top = 210.897637800000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'MS sans Serif'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 180.417440000000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_1: TfrxPictureView
          Align = baLeft
          AllowVectorExport = True
          Top = 0.102350000000001000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          Frame.Typ = [ftRight, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 274.994434550000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'MS sans Serif'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 17.140074240000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Comprovante de Entrega  ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795275590000000000
          Width = 274.771653540000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Benefici'#225'rio')
          ParentFont = False
        end
        object CedenteNome: TfrxMemoView
          AllowVectorExport = True
          Top = 49.398268480000000000
          Width = 274.771653543307000000
          Height = 18.897650000000000000
          DataField = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Cedente."Nome"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 275.147936050000000000
          Top = 37.795275590000000000
          Width = 169.702457650000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Ag'#234'ncia / C'#243'digo Benefici'#225'rio')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 68.223562130000000000
          Width = 275.223097120000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Sacado')
          ParentFont = False
        end
        object TituloSacado_NomeSacado: TfrxMemoView
          AllowVectorExport = True
          Top = 79.587198490000000000
          Width = 274.872604240000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 444.454545450000000000
          Top = 37.795275590000000000
          Width = 273.109153030000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Motivo de n'#227'o entrega. (Para uso da empresa entregadora)')
          ParentFont = False
        end
        object CedenteAgencia: TfrxMemoView
          AllowVectorExport = True
          Left = 275.000000000000000000
          Top = 49.041743940000000000
          Width = 170.078740160000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TITULO."CodCedente"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object TituloNossoNum: TfrxMemoView
          AllowVectorExport = True
          Left = 275.147936050000000000
          Top = 79.587198490000000000
          Width = 169.702457650000000000
          Height = 18.897650000000000000
          DataField = 'NossoNum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."NossoNum"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 275.147936050000000000
          Top = 68.028155570000000000
          Width = 169.702457650000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 451.515151520000000000
          Top = 56.102349990000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Mudou-se')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 451.757575760000000000
          Top = 86.209973760000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Recusado')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 451.515151520000000000
          Top = 115.193259090000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Desconhecido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 98.526592420000000000
          Width = 70.677642570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Vencimento')
          ParentFont = False
        end
        object TituloVencimento: TfrxMemoView
          AllowVectorExport = True
          Top = 109.647804540000000000
          Width = 70.677165350000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."Vencimento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 70.696969700000000000
          Top = 98.526592420000000000
          Width = 144.162491050000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' N'#250'mero do Documento')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 215.151515150000000000
          Top = 98.526592420000000000
          Width = 60.071581970000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Moeda')
          ParentFont = False
        end
        object TituloNumeroDocumento: TfrxMemoView
          AllowVectorExport = True
          Left = 70.696969690000000000
          Top = 109.606299210000000000
          Width = 144.757575760000000000
          Height = 18.897650000000000000
          DataField = 'NumeroDocumento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloEspecieDoc: TfrxMemoView
          AllowVectorExport = True
          Left = 215.151515150000000000
          Top = 109.606299210000000000
          Width = 60.094488190000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 275.000000000000000000
          Top = 98.526592420000000000
          Width = 170.078740160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Valor do Documento')
          ParentFont = False
        end
        object TituloValorDocumento: TfrxMemoView
          AllowVectorExport = True
          Left = 275.000000000000000000
          Top = 109.606299210000000000
          Width = 169.870130310000000000
          Height = 18.897650000000000000
          DataField = 'ValorDocumento'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 128.829622730000000000
          Width = 156.283703170000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Recebemos o T'#237'tulo')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 156.060606060000000000
          Top = 128.829622730000000000
          Width = 78.253400150000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Data')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 234.090909090000000000
          Top = 128.072046970000000000
          Width = 210.897637800000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Assinatura')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 530.303030300000000000
          Top = 56.102350000000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Ausente')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 530.545454540000000000
          Top = 86.209973770000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) N'#227'o procurado')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 530.303030300000000000
          Top = 115.193259100000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Falecido')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 609.090909090000000000
          Top = 56.102350000000000000
          Width = 71.217609160000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) N'#227'o existe No indicado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 609.333333330000000000
          Top = 86.209973770000000000
          Width = 93.187306130000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Endere'#231'o insuficiente')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 609.090909090000000000
          Top = 115.193259100000000000
          Width = 103.035790980000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '(  ) Outros (anotar no verso)')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 444.472440940000000000
          Top = 128.503937010000000000
          Width = 78.253400150000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop]
          Memo.UTF8W = (
            ' Data')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 522.727272730000000000
          Top = 128.503937010000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' Assinatura')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Top = 140.193259090000000000
          Width = 156.472440940000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            'com as caracteristicas acima')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 156.818181820000000000
          Top = 140.193259090000000000
          Width = 77.713049100000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 234.090909090000000000
          Top = 140.193259090000000000
          Width = 210.897637800000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 444.472440940000000000
          Top = 140.193259090000000000
          Width = 78.236220470000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 522.727272730000000000
          Top = 140.193259090000000000
          Width = 195.170686680000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 159.132653030000000000
          Width = 600.980672870000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 600.757575760000000000
          Top = 159.132653030000000000
          Width = 117.647339540000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' Data do processamento')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Top = 170.496289390000000000
          Width = 601.169410640000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloDataProcessamento: TfrxMemoView
          AllowVectorExport = True
          Left = 601.757575760000000000
          Top = 170.496289390000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'DataProcessamento'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 200.548546670000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 180.417440000000000000
          Top = 210.897637800000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_2: TfrxPictureView
          Align = baLeft
          AllowVectorExport = True
          Top = 210.750154550000000000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          Frame.Typ = [ftRight, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo36: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 228.545454550000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Recibo do Pagador')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Top = 247.769016670000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 247.769016670000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Vencimento')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Top = 259.132653030000000000
          Width = 535.937007870000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 259.132653030000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."Vencimento"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Top = 278.072046970000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Benefici'#225'rio')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Top = 287.244094490000000000
          Width = 535.937007870000000000
          Height = 9.448818900000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            '[Cedente."Nome"] - CNPJ: [Cedente."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 278.072046970000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Ag'#234'ncia / C'#243'digo Benefici'#225'rio')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 293.435683330000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TITULO."CodCedente"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 308.031496062992000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' Nosso N'#250'mero')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 318.981137880000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."NossoNum"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 339.401574803150000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' ( = ) Valor do Documento')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 349.284168180000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 482.132653030000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 275.000000000000000000
          Top = 602.875683550000000000
          Width = 442.895795450000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '  [Titulo."LinhaDigitavel"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 600.284168180000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 180.417440000000000000
          Top = 602.875683540000000000
          Width = 94.488250000000000000
          Height = 37.039370080000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Banco."Numero"]-[Banco."Digito"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Logo_3: TfrxPictureView
          Align = baLeft
          AllowVectorExport = True
          Top = 602.728200300000000000
          Width = 180.060606060000000000
          Height = 37.000000000000000000
          Frame.Typ = [ftRight, ftBottom]
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Top = 639.747062420000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Local de pagamento')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 639.747062420000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Vencimento')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Top = 651.110698780000000000
          Width = 535.937007870000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Titulo."LocalPagamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 647.110698780000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."Vencimento"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Top = 666.050092720000000000
          Width = 535.829157720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Benefici'#225'rio')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Top = 677.413729080000000000
          Width = 535.937007870000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            '[Cedente."Nome"] - CNPJ: [Cedente."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 666.050092720000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Ag'#234'ncia / C'#243'digo Benefici'#225'rio')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 677.413729080000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TITULO."CodCedente"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Top = 310.375077270000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Data do Documento')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Top = 320.496289390000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."DataDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo78: TfrxMemoView
          AllowVectorExport = True
          Left = 132.909090910000000000
          Top = 310.375077270000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' N'#250'mero do Documento')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 132.909090910000000000
          Top = 320.496289390000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo80: TfrxMemoView
          AllowVectorExport = True
          Left = 265.121212120000000000
          Top = 310.375077270000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Esp'#233'cie Doc.')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 265.121212120000000000
          Top = 320.454784060000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."EspecieDoc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo82: TfrxMemoView
          AllowVectorExport = True
          Left = 331.030303030000000000
          Top = 310.375077270000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Aceite')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Left = 331.030303030000000000
          Top = 320.454784060000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IIF(<Titulo."Aceite"> = 0, '#39'Sim'#39', '#39'N'#227'o'#39')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo84: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696960000000000
          Top = 310.375077270000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Data do Processamento')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696960000000000
          Top = 320.496289390000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Top = 337.678107580000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Uso do Banco')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          AllowVectorExport = True
          Top = 348.799319700000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo88: TfrxMemoView
          AllowVectorExport = True
          Left = 132.575757580000000000
          Top = 337.678107580000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Carteira')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 132.575757580000000000
          Top = 348.757814370000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."Carteira"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 198.636363640000000000
          Top = 337.678107580000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Moeda')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          AllowVectorExport = True
          Left = 198.636363640000000000
          Top = 348.757814370000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 265.151515150000000000
          Top = 337.678107580000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Quantidade')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 265.151515150000000000
          Top = 348.799319700000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696970000000000
          Top = 337.678107580000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Valor')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696970000000000
          Top = 348.799319700000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Top = 370.437847880000000000
          Width = 534.556191840000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Instru'#231#245'es (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
              ' responsabilidade do benefici'#225'rio.)')
          ParentFont = False
        end
        object TituloInstrucao1: TfrxMemoView
          AllowVectorExport = True
          Top = 381.511811020000000000
          Width = 533.963513330000000000
          Height = 68.031496060000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Mensagem"]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Top = 483.890228790000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pagador:')
          ParentFont = False
        end
        object TituloSacado_NomeSacado1: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545450000000000
          Top = 483.890228790000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 486.346938790000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF / CNPJ')
          ParentFont = False
        end
        object TituloSacado_CNPJCPF: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 505.286332720000000000
          Width = 166.416203030000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_CNPJCPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloSacado_Logradouro: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545450000000000
          Top = 498.829622720000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_Logradouro"], [Titulo."Sacado_Numero"]')
          ParentFont = False
          WordWrap = False
        end
        object TituloSacado_Bairro: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545460000000000
          Top = 513.769016670000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_Bairro"]')
          ParentFont = False
        end
        object TituloSacado_Cidade: TfrxMemoView
          AllowVectorExport = True
          Left = 94.454545450000000000
          Top = 528.708410600000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[FormatMaskText('#39'99.999-99;0; '#39', <Titulo."Sacado_CEP">)] - [Titu' +
              'lo."Sacado_Cidade"] / [Titulo."Sacado_UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Line6: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 558.496289390000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo99: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 527.267470600000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo de Baixa')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Top = 544.617501510000000000
          Width = 495.118344570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Sacador/Avalista: [Titulo."Sacado_Avalista"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Top = 560.526592420000000000
          Width = 146.677403960000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Recebemos atrav'#233's do cheque n'#250'mero')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 222.727272730000000000
          Top = 560.526592420000000000
          Width = 272.434979720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'do banco')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 495.454545450000000000
          Top = 560.526592420000000000
          Width = 204.403439720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          AllowVectorExport = True
          Top = 572.647804540000000000
          Width = 495.162252440000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Esta quita'#231#227'o s'#243' ter'#225' validade ap'#243's o pagamento do cheque pelo')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          AllowVectorExport = True
          Top = 584.769016660000000000
          Width = 495.162252440000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' banco sacado.')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 696.041743940000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' Nosso N'#250'mero')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 706.647804540000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."NossoNum"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 726.344774240000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            ' ( = ) Valor do Documento')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 535.606060610000000000
          Top = 739.950834840000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Titulo."ValorDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 755.527559055118000000
          Width = 194.953461950000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8W = (
            ' ( - ) Desconto ')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 763.253865140000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 837.193259080000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( + ) Outros Acr'#233'scimos')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 847.556895440000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007874016000000
          Top = 866.496289390000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( = ) Valor Cobrado')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 873.859925750000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 892.799319690000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo106: TfrxMemoView
          AllowVectorExport = True
          Top = 696.041743930000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Data do Documento')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          AllowVectorExport = True
          Top = 707.162956050000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."DataDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo108: TfrxMemoView
          AllowVectorExport = True
          Left = 132.909090910000000000
          Top = 696.041743930000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' N'#250'mero do Documento')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          AllowVectorExport = True
          Left = 132.909090910000000000
          Top = 707.162956050000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."NumeroDocumento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo110: TfrxMemoView
          AllowVectorExport = True
          Left = 265.121212120000000000
          Top = 696.041743930000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Esp'#233'cie Doc.')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          AllowVectorExport = True
          Left = 265.121212120000000000
          Top = 707.121450720000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."EspecieDoc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 331.030303030000000000
          Top = 696.041743930000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Aceite')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          AllowVectorExport = True
          Left = 331.030303030000000000
          Top = 707.121450720000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IIF(<Titulo."Aceite"> = 0, '#39'Sim'#39', '#39'N'#227'o'#39')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696960000000000
          Top = 696.041743930000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Data do Processamento')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696960000000000
          Top = 707.162956050000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."DataProcessamento"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Top = 726.344774240000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Uso do Banco')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Top = 736.465986360000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 132.575757580000000000
          Top = 726.344774240000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Carteira')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          AllowVectorExport = True
          Left = 132.575757580000000000
          Top = 736.424481030000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."Carteira"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          AllowVectorExport = True
          Left = 198.636363640000000000
          Top = 726.344774240000000000
          Width = 66.141732280000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            'Moeda')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 197.878787880000000000
          Top = 736.424481030000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Titulo."EspecieMod"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Left = 265.151515150000000000
          Top = 726.344774240000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Quantidade')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 265.151515150000000000
          Top = 736.465986360000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696970000000000
          Top = 726.344774240000000000
          Width = 138.859460760000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            ' Valor')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 396.969696970000000000
          Top = 736.465986360000000000
          Width = 138.858983540000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
        end
        object Memo126: TfrxMemoView
          AllowVectorExport = True
          Top = 760.647804540000000000
          Width = 534.556191840000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Instru'#231#245'es (Todas as informa'#231#245'es deste bloqueto s'#227'o de exclusiva' +
              ' responsabilidade do benefici'#225'rio.)')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          AllowVectorExport = True
          Top = 776.216140910000000000
          Width = 527.162029090000000000
          Height = 115.783859090000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Mensagem"]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          AllowVectorExport = True
          Top = 893.556895450000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pagador:')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545450000000000
          Top = 893.556895450000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_NomeSacado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_NomeSacado"]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 893.556895450000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF / CNPJ')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 907.496289380000000000
          Width = 166.416203030000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_CNPJCPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545450000000000
          Top = 907.496289380000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_Logradouro"], [Titulo."Sacado_Numero"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545460000000000
          Top = 921.435683330000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Sacado_Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Titulo."Sacado_Bairro"]')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          AllowVectorExport = True
          Left = 95.454545450000000000
          Top = 935.375077260000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Titulo."Sacado_CEP"] - [Titulo."Sacado_Cidade"] / [Titulo."Saca' +
              'do_UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          AllowVectorExport = True
          Left = 537.121212120000000000
          Top = 935.375077260000000000
          Width = 132.283464570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo de Baixa')
          ParentFont = False
        end
        object Memo137: TfrxMemoView
          AllowVectorExport = True
          Top = 954.284168170000000000
          Width = 495.118344570000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' Sacador/Avalista: [Titulo."Sacado_Avalista"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 966.435683330000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo138: TfrxMemoView
          AllowVectorExport = True
          Left = 495.454545450000000000
          Top = 967.193259090000000000
          Width = 204.403439720000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Autentica'#231#227'o Mec'#226'nica - Ficha de Compensa'#231#227'o')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 5.303030310000000000
          Top = 968.708410610000000000
          Width = 330.000000000000000000
          Height = 40.440944880000000000
          BarType = bcCode_2_5_interleaved
          Expression = '<Titulo."CodBarras">'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '75691028460042664431623456720012150740000010000'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
        object Memo133: TfrxMemoView
          AllowVectorExport = True
          Top = 296.692913390000000000
          Width = 535.937007870000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8W = (
            
              '[Cedente."Logradouro"], [Cedente."NumeroRes"] - [Cedente."Cidade' +
              '"]-[Cedente."UF"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        object Memo139: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007874016000000
          Top = 808.921770000000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( + ) Mora / Multa / Juros')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 818.285406360000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo141: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 782.362710000000000000
          Width = 194.953461950000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8W = (
            ' ( - ) Outras Dedu'#231#245'es/ Abatimentos')
          ParentFont = False
        end
        object Memo142: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 790.726346360000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007874016000000
          Top = 367.370078740000000000
          Width = 194.953461950000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8W = (
            ' ( - ) Desconto ')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 369.978046360000000000
          Width = 167.923005760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 432.917440300000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( + ) Outros Acr'#233'scimos')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 436.737786660000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007874016000000
          Top = 455.543290610000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( = ) Valor Cobrado')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 410.645951220000000000
          Width = 195.711037710000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft]
          Memo.UTF8W = (
            ' ( + ) Mora / Multa / Juros')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 414.009587580000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo144: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 389.086891220000000000
          Width = 194.953461950000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Memo.UTF8W = (
            ' ( - ) Outras Dedu'#231#245'es/ Abatimentos')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 392.450527580000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
        object Memo146: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007874016000000
          Top = 463.102660000000000000
          Width = 183.041125760000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
end
