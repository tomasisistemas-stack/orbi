object Fr_representante: TFr_representante
  Left = 473
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastros de Representantes e Funcion'#225'rios.'
  ClientHeight = 678
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 32
    Top = 64
    Width = 105
    Height = 105
  end
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 740
    Height = 54
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Label1: TsLabel
      Left = 13
      Top = 11
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 83
      Top = 11
      Width = 28
      Height = 13
      Caption = 'Nome'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel12: TsLabel
      Left = 677
      Top = 11
      Width = 30
      Height = 13
      Caption = 'Tablet'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Prid: TsEdit
      Left = 8
      Top = 24
      Width = 65
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
    object Prnom_representante: TsEdit
      Left = 79
      Top = 24
      Width = 345
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
      TabOrder = 1
      OnKeyPress = Prnom_representanteKeyPress
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
    object Prcod_tablet: TsEdit
      Left = 672
      Top = 24
      Width = 65
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 2
      OnExit = Prcod_tabletExit
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
  object pcrep: TsPageControl
    Left = 0
    Top = 54
    Width = 740
    Height = 580
    ActivePage = tab_dados
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_dados: TsTabSheet
      Caption = 'Dados'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Label4: TsLabel
        Left = 4
        Top = 3
        Width = 44
        Height = 13
        Caption = 'Empresa:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label5: TsLabel
        Left = 4
        Top = 77
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label6: TsLabel
        Left = 357
        Top = 77
        Width = 30
        Height = 13
        Caption = 'Bairro:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label7: TsLabel
        Left = 541
        Top = 44
        Width = 22
        Height = 13
        Caption = 'Cep:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label13: TsLabel
        Left = 4
        Top = 152
        Width = 30
        Height = 13
        Caption = 'CNPJ:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label14: TsLabel
        Left = 309
        Top = 113
        Width = 45
        Height = 13
        Caption = 'Telefone:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label15: TsLabel
        Left = 415
        Top = 113
        Width = 50
        Height = 13
        Caption = 'WhatsApp'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label16: TsLabel
        Left = 521
        Top = 112
        Width = 35
        Height = 13
        Caption = 'Celular:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label17: TsLabel
        Left = 184
        Top = 152
        Width = 16
        Height = 13
        Caption = 'I.E:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label18: TsLabel
        Left = 545
        Top = 152
        Width = 22
        Height = 13
        Caption = 'R.G:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label19: TsLabel
        Left = 362
        Top = 152
        Width = 23
        Height = 13
        Caption = 'CPF:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label24: TsLabel
        Left = 4
        Top = 189
        Width = 28
        Height = 13
        Caption = 'Email:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label25: TsLabel
        Left = 279
        Top = 189
        Width = 59
        Height = 13
        Caption = 'Home-Page:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label3: TsLabel
        Left = 4
        Top = 113
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
        Left = 94
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
      object lbSalario: TsLabel
        Left = 574
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Sal'#225'rio:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label22: TsLabel
        Left = 2
        Top = 414
        Width = 25
        Height = 13
        Caption = 'Obs.:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object lbPLR: TsLabel
        Left = 649
        Top = 3
        Width = 24
        Height = 13
        Caption = 'PLR:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel9: TsLabel
        Left = 4
        Top = 42
        Width = 89
        Height = 13
        Caption = 'Data de Admiss'#227'o:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel10: TsLabel
        Left = 280
        Top = 42
        Width = 90
        Height = 13
        Caption = 'Data de Demiss'#227'o:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel11: TsLabel
        Left = 628
        Top = 113
        Width = 53
        Height = 13
        Caption = 'Operadora:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Prnom_empresa: TsEdit
        Left = 0
        Top = 16
        Width = 129
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
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prendereco: TsEdit
        Left = 1
        Top = 90
        Width = 345
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
        TabOrder = 8
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prbairro: TsEdit
        Left = 352
        Top = 86
        Width = 227
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 9
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prcep: TMaskEdit
        Left = 540
        Top = 57
        Width = 79
        Height = 21
        EditMask = '99999-999;1;_'
        MaxLength = 9
        TabOrder = 6
        Text = '     -   '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prcnpj: TMaskEdit
        Left = 1
        Top = 166
        Width = 163
        Height = 21
        EditMask = '##.###.###/####-##'
        MaxLength = 18
        TabOrder = 17
        Text = '  .   .   /    -  '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prfone: TMaskEdit
        Left = 312
        Top = 125
        Width = 93
        Height = 21
        EditMask = '!\(99\)9999-9999;1;_'
        MaxLength = 13
        TabOrder = 12
        Text = '(  )    -    '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object PrWhatsApp: TMaskEdit
        Left = 415
        Top = 127
        Width = 101
        Height = 21
        EditMask = '!\(99\)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 13
        Text = '(  )     -    '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prcelular: TMaskEdit
        Left = 521
        Top = 126
        Width = 97
        Height = 21
        EditMask = '!\(99\)99999-9999;1;_'
        MaxLength = 14
        TabOrder = 14
        Text = '(  )     -    '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prie: TMaskEdit
        Left = 180
        Top = 166
        Width = 172
        Height = 21
        MaxLength = 20
        TabOrder = 18
        Text = ''
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prcpf: TMaskEdit
        Left = 358
        Top = 166
        Width = 171
        Height = 21
        EditMask = '###.###.###-##;1;_'
        MaxLength = 14
        TabOrder = 19
        Text = '   .   .   -  '
        OnKeyPress = Prnom_representanteKeyPress
      end
      object Prrg: TMaskEdit
        Left = 542
        Top = 166
        Width = 172
        Height = 21
        MaxLength = 20
        TabOrder = 20
        Text = ''
        OnKeyPress = Prnom_representanteKeyPress
      end
      object grDadosBancarios: TsGroupBox
        Left = 1
        Top = 314
        Width = 721
        Height = 58
        Caption = 'Dados Bancarios'
        TabOrder = 26
        SkinData.SkinSection = 'GROUPBOX'
        object Label20: TsLabel
          Left = 288
          Top = 13
          Width = 46
          Height = 13
          Caption = 'N'#186' Conta:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label21: TsLabel
          Left = 188
          Top = 13
          Width = 57
          Height = 13
          Caption = 'N'#186' Agencia:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lb_banco: TsLabel
          Left = 74
          Top = 31
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
        object Banco: TsLabel
          Left = 5
          Top = 13
          Width = 34
          Height = 13
          Caption = 'Banco:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label23: TsLabel
          Left = 419
          Top = 13
          Width = 75
          Height = 13
          Caption = 'Titular da Conta'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prnr_conta_corrente: TsEdit
          Left = 288
          Top = 26
          Width = 129
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 2
          OnKeyPress = Prnom_representanteKeyPress
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
        object Prnr_agencia: TsEdit
          Left = 188
          Top = 26
          Width = 98
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          OnKeyPress = Prnom_representanteKeyPress
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
        object Prnr_banco: TsComboEdit
          Left = 4
          Top = 26
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnExit = Prnr_bancoExit
          OnKeyPress = Prnr_bancoKeyPress
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
          OnButtonClick = Prnr_bancoButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prtitular_conta: TsEdit
          Left = 419
          Top = 26
          Width = 294
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 3
          OnKeyPress = Prnom_representanteKeyPress
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
      object Premail: TsEdit
        Left = 1
        Top = 202
        Width = 225
        Height = 21
        CharCase = ecLowerCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 21
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prhome_page: TsEdit
        Left = 277
        Top = 202
        Width = 197
        Height = 21
        CharCase = ecLowerCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 22
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prid_cidade: TsComboEdit
        Left = 1
        Top = 126
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
        TabOrder = 10
        Text = ''
        OnExit = Prid_cidadeExit
        OnKeyPress = Prid_cidadeKeyPress
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
        OnButtonClick = PRCod_cidadeButtonClick2
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object grDadosSite: TsGroupBox
        Left = 1
        Top = 225
        Width = 721
        Height = 87
        Caption = 'Dados no Site'
        TabOrder = 25
        SkinData.SkinSection = 'GROUPBOX'
        object Label9: TsLabel
          Left = 4
          Top = 15
          Width = 116
          Height = 13
          Caption = 'Nome divulgado no Site:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label10: TsLabel
          Left = 5
          Top = 49
          Width = 99
          Height = 13
          Caption = 'Cidades de Atua'#231#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label11: TsLabel
          Left = 693
          Top = 49
          Width = 17
          Height = 13
          Caption = 'UF:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object PrWeb_Nome: TsEdit
          Left = 4
          Top = 27
          Width = 709
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = Prnom_representanteKeyPress
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
        object PrWEB_CIDADES_ATUACAO: TsEdit
          Left = 4
          Top = 61
          Width = 685
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = Prnom_representanteKeyPress
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
        object PrUF_ATUACAO: TsEdit
          Left = 692
          Top = 61
          Width = 21
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 2
          OnKeyPress = Prnom_representanteKeyPress
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
      object PrSalario: TsCurrencyEdit
        Left = 572
        Top = 16
        Width = 73
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
        TabOrder = 2
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
      object PrAtivo: TsCheckBox
        Left = 659
        Top = 203
        Width = 50
        Height = 20
        Caption = 'Ativo?'
        TabOrder = 24
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object PrSupervisor: TsCheckBox
        Left = 515
        Top = 203
        Width = 76
        Height = 20
        Caption = 'Supervisor?'
        TabOrder = 23
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object BtBuscaEnd: TsBitBtn
        Left = 625
        Top = 55
        Width = 96
        Height = 26
        Hint = 'Buscar Endere'#231'o pelo CEP...'
        Caption = 'Buscar End.'
        Glyph.Data = {
          76060000424D760600000000000036000000280000001A000000140000000100
          18000000000040060000C40E0000C40E00000000000000000000724633886132
          7C5B3083563078524189552F8D54319154308455318254317D582E7C56308555
          2A80523084552B815431825431795C2E8254318354317A5B2E815631845A328C
          57319A563071443200005C1F00793C00743B007F3800883A00843A0087390086
          3A00823B00762F006A2D006C2E006D2900762B007E3502843900833B00813800
          833A008639008337008339007E3700763600873B006222020000792E028A4901
          7E48008743027843067E43027E46027E4605612E088A61389E7F5D96785CA681
          5EAF8464763F15793E057D45047C41087B40087C40087641087A40077F40077C
          4601884B006F321200006B28048B49047A46007E400585410485440087430277
          3C00592600CAB398C2AC91B9A390DDC3B59781776531027D4105834200854004
          8241038441038341038241018840058B44047D4A00602C110000762D02844107
          743E097D3F05854200864200894301662300AF8458C5AA8BA48C83BEA392C9A6
          806A25007E37008542017E44007F45008B42018941017C430283420088400083
          4100894A00582D120000752D029046018744009146008C44018A460179330081
          4F1FC6A88CAF978DB3968BC6AC949B622F792D009549008243017C4901844500
          8940028241067D42028244008944008044009549005F36210000762C01813600
          6D25007129006F27006B2900723304B48666B59B8D9C8F90BBA08DAE84605318
          006925006529006C27006A28007A3A008136007934006E34007D3600863F0082
          4702934A00652C1000006E2E06A8764A907152896647886A41875B34774C26BC
          A486B79073A38E7FAF99816F46269B6C4E906E458267408B684780603E613606
          93582C8C4F2787562C895529612A00754005954B005A2A0E0000531C02CAAE91
          FFFFFFFFFFFFFFFFFFFFFFFFAC9B939D7361C19B7EC09F79B6A086784D3DCFBE
          B5FFFFFFFFFFFFFFFFFFFFFFFF9C857DA38A7FCBB29BC1AB8FD7BFAB8F70666B
          2900954A00632C1100006726006C391DD9CFCDFFFFFFF4FCFDFFFFFFDFD7D474
          5549B99985B09A7DBBA18CBC94805C2412F3F1E8FFFFFFFBFCFEFFFFFFDDD5D0
          7B5A4BB09384AA9279BA9F8FBFA086793F1A873B005E2F100000763001672800
          8E6C57FDFCF5FEFFFFFCFAF8FFFFFFAB978C836356C7A180B49A7EC5AF9F8963
          587D6856FFFFFFFCFDFDF1FDFEFFFFFFB69988A27A60AC9991A99289C2A6959E
          73547A34005D2C0F00006B2B067D4211552400DBD0C4FFFFFFFFFFFFFFFFFFFF
          FFFF715042C2A08AC6A28DB89E97D0C9C55E3323DACCBEFFFFFFE4FBFDFFFFFF
          E8DCD68A6552A39381B29C91CFAB99D0B1A194532754240900006A2803924A02
          5C2900724023ECE4DCE7E3DDE4E0DAEFECE6C0B2A782614BBFA27BBB9776CE9E
          74C2926667422BF4F4ECF9FFFFFCFCFEFFFFFFC1B4ADA1755CC59773B99C74BF
          A485C392625C2D1100006929048F49027D480175330073380C6A330C6A330B6F
          38107E4311793400703D0B7739067E3802682C048A6555FBF9F8FFF9FFFCFDFD
          FFFFFFBBA2996C26088036026E3B0C67340E84460E6131110000732B01904803
          8045008645007F38007E39007F39007E39007F3C00813E01753900853E008235
          00552913EEE4DEFFFFFFFCF7FBFFFFFFE8E8DD6F4929772B008D3C00793D0073
          38048B3F006030100000652C108A46007B46018642007943038141057F430376
          4306773E0A7942058640069347004A0B00B89F85FFFFFFFDFDFEFBFEFFFFFFFF
          AB8A746728008344008245008544008144019447006434130000772D018B4605
          7F44008342018744008442008645008B45008543008044008C42026C26007A4E
          1AFFFFFFFEFFFFF8FFFFFFFFFFE1D7CC5C1F007E38007E48007943037F420382
          41019348006332120000702B028E4601864102823F048242017F42018344007F
          44017D42028344017D3B006F3000DAD4C1FFF7ECF8EEE3F5EEE9FCF7EC835B2E
          5C1F0083450C854100804302823B037741088549007030110000692902944800
          8D44008B44008E44008E43008F43008F43008E42008F44008B43008845029A67
          448E56338F57329359389457316B32008543038E4A069144008F44008F420081
          4303824A00682F0F000059290E713D086C37086A37077C34106B37076C360770
          3C096D37076F3B0B69380F6E3A07652D00612C016A2D00722E00662D006B4601
          743E0A773E09763F08713E096F40157D370D7C4309572A0F0000}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BtBuscaEndClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtBuscaCEP: TsBitBtn
        Left = 212
        Top = 125
        Width = 96
        Height = 25
        Hint = 'Buscar CEP pelo Endere'#231'o...'
        Caption = 'Buscar CEP'
        Glyph.Data = {
          76060000424D760600000000000036000000280000001A000000140000000100
          18000000000040060000C40E0000C40E00000000000000000000724633886132
          7C5B3083563078524189552F8D54319154308455318254317D582E7C56308555
          2A80523084552B815431825431795C2E8254318354317A5B2E815631845A328C
          57319A563071443200005C1F00793C00743B007F3800883A00843A0087390086
          3A00823B00762F006A2D006C2E006D2900762B007E3502843900833B00813800
          833A008639008337008339007E3700763600873B006222020000792E028A4901
          7E48008743027843067E43027E46027E4605612E088A61389E7F5D96785CA681
          5EAF8464763F15793E057D45047C41087B40087C40087641087A40077F40077C
          4601884B006F321200006B28048B49047A46007E400585410485440087430277
          3C00592600CAB398C2AC91B9A390DDC3B59781776531027D4105834200854004
          8241038441038341038241018840058B44047D4A00602C110000762D02844107
          743E097D3F05854200864200894301662300AF8458C5AA8BA48C83BEA392C9A6
          806A25007E37008542017E44007F45008B42018941017C430283420088400083
          4100894A00582D120000752D029046018744009146008C44018A460179330081
          4F1FC6A88CAF978DB3968BC6AC949B622F792D009549008243017C4901844500
          8940028241067D42028244008944008044009549005F36210000762C01813600
          6D25007129006F27006B2900723304B48666B59B8D9C8F90BBA08DAE84605318
          006925006529006C27006A28007A3A008136007934006E34007D3600863F0082
          4702934A00652C1000006E2E06A8764A907152896647886A41875B34774C26BC
          A486B79073A38E7FAF99816F46269B6C4E906E458267408B684780603E613606
          93582C8C4F2787562C895529612A00754005954B005A2A0E0000531C02CAAE91
          FFFFFFFFFFFFFFFFFFFFFFFFAC9B939D7361C19B7EC09F79B6A086784D3DCFBE
          B5FFFFFFFFFFFFFFFFFFFFFFFF9C857DA38A7FCBB29BC1AB8FD7BFAB8F70666B
          2900954A00632C1100006726006C391DD9CFCDFFFFFFF4FCFDFFFFFFDFD7D474
          5549B99985B09A7DBBA18CBC94805C2412F3F1E8FFFFFFFBFCFEFFFFFFDDD5D0
          7B5A4BB09384AA9279BA9F8FBFA086793F1A873B005E2F100000763001672800
          8E6C57FDFCF5FEFFFFFCFAF8FFFFFFAB978C836356C7A180B49A7EC5AF9F8963
          587D6856FFFFFFFCFDFDF1FDFEFFFFFFB69988A27A60AC9991A99289C2A6959E
          73547A34005D2C0F00006B2B067D4211552400DBD0C4FFFFFFFFFFFFFFFFFFFF
          FFFF715042C2A08AC6A28DB89E97D0C9C55E3323DACCBEFFFFFFE4FBFDFFFFFF
          E8DCD68A6552A39381B29C91CFAB99D0B1A194532754240900006A2803924A02
          5C2900724023ECE4DCE7E3DDE4E0DAEFECE6C0B2A782614BBFA27BBB9776CE9E
          74C2926667422BF4F4ECF9FFFFFCFCFEFFFFFFC1B4ADA1755CC59773B99C74BF
          A485C392625C2D1100006929048F49027D480175330073380C6A330C6A330B6F
          38107E4311793400703D0B7739067E3802682C048A6555FBF9F8FFF9FFFCFDFD
          FFFFFFBBA2996C26088036026E3B0C67340E84460E6131110000732B01904803
          8045008645007F38007E39007F39007E39007F3C00813E01753900853E008235
          00552913EEE4DEFFFFFFFCF7FBFFFFFFE8E8DD6F4929772B008D3C00793D0073
          38048B3F006030100000652C108A46007B46018642007943038141057F430376
          4306773E0A7942058640069347004A0B00B89F85FFFFFFFDFDFEFBFEFFFFFFFF
          AB8A746728008344008245008544008144019447006434130000772D018B4605
          7F44008342018744008442008645008B45008543008044008C42026C26007A4E
          1AFFFFFFFEFFFFF8FFFFFFFFFFE1D7CC5C1F007E38007E48007943037F420382
          41019348006332120000702B028E4601864102823F048242017F42018344007F
          44017D42028344017D3B006F3000DAD4C1FFF7ECF8EEE3F5EEE9FCF7EC835B2E
          5C1F0083450C854100804302823B037741088549007030110000692902944800
          8D44008B44008E44008E43008F43008F43008E42008F44008B43008845029A67
          448E56338F57329359389457316B32008543038E4A069144008F44008F420081
          4303824A00682F0F000059290E713D086C37086A37077C34106B37076C360770
          3C096D37076F3B0B69380F6E3A07652D00612C016A2D00722E00662D006B4601
          743E0A773E09763F08713E096F40157D370D7C4309572A0F0000}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Visible = False
        OnClick = BtBuscaCEPClick
        SkinData.SkinSection = 'BUTTON'
      end
      object PrObs: TRichEdit
        Left = 0
        Top = 427
        Width = 723
        Height = 97
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 29
        Zoom = 100
      end
      object PrFuncionario: TsRadioGroup
        Left = 133
        Top = 3
        Width = 436
        Height = 38
        BiDiMode = bdLeftToRight
        Caption = 'Tipo'
        ParentBackground = False
        ParentBiDiMode = False
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        Columns = 5
        ItemIndex = 0
        Items.Strings = (
          'Repr. - Terceiros'
          'Repr. - Interno       '
          'Funcion'#225'rio'
          'Func. F'#225'brica'
          'TeleVendas')
      end
      object PrTipo_Sistema: TsRadioGroup
        Left = 1
        Top = 374
        Width = 542
        Height = 38
        BiDiMode = bdLeftToRight
        Caption = 'Tipo de Sistema'
        ParentBackground = False
        ParentBiDiMode = False
        TabOrder = 27
        SkinData.SkinSection = 'GROUPBOX'
        Columns = 5
        ItemIndex = 2
        Items.Strings = (
          'Tablet'
          'Smartphone'
          'Notebook'
          'Todos'
          'Nenhum')
      end
      object PrPLR_Valor: TsCurrencyEdit
        Left = 647
        Top = 16
        Width = 73
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
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object PrAdmissao: TsDateEdit
        Left = 1
        Top = 55
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
        TabOrder = 4
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
      object PrDemissao: TsDateEdit
        Left = 281
        Top = 55
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
        TabOrder = 5
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
      object btnOperadora: TsBitBtn
        Left = 697
        Top = 126
        Width = 25
        Height = 22
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
        TabOrder = 16
        OnClick = btnOperadoraClick
        SkinData.SkinSection = 'BUTTON'
      end
      object PrOperadora: TsEdit
        Left = 628
        Top = 126
        Width = 67
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 15
        OnKeyPress = Prnom_representanteKeyPress
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
      object Prsomente_consumidor_final: TsCheckBox
        Left = 549
        Top = 385
        Width = 169
        Height = 20
        Caption = 'Somente para Consumidor Final'
        TabOrder = 28
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Grupo de Produtos - Desconto Especial'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 0
        Width = 732
        Height = 552
        Align = alClient
        Caption = 'Desconto Especiais'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object sPanel7: TsPanel
          Left = 2
          Top = 15
          Width = 728
          Height = 58
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
          object ft_lb_nom_representante: TsLabel
            Left = 85
            Top = 31
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
          object sLabel13: TsLabel
            Left = 11
            Top = 7
            Width = 227
            Height = 13
            Caption = 'Copiar registros de Desconto do Representante:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object BtPesqDesc: TsBitBtn
            Left = 643
            Top = 17
            Width = 75
            Height = 25
            Caption = '&Copiar'
            TabOrder = 0
            OnClick = BtPesqDescClick
            SkinData.SkinSection = 'BUTTON'
          end
          object ft_representante: TsComboEdit
            Left = 11
            Top = 23
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
            OnExit = ft_representanteExit
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
            OnButtonClick = ft_representanteButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object Panel11: TsPanel
          Left = 2
          Top = 462
          Width = 728
          Height = 88
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
          object gbRepre: TsGroupBox
            Left = 8
            Top = 5
            Width = 488
            Height = 41
            Caption = 'Grupo'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object Lbnom_grupo: TDBText
              Left = 75
              Top = 18
              Width = 65
              Height = 13
              AutoSize = True
              DataField = 'DESCRICAO'
              DataSource = dsDescEspecial
            end
            object edcod_grupo: TRxDBComboEdit
              Left = 10
              Top = 14
              Width = 55
              Height = 21
              DataField = 'COD_GRUPO'
              DataSource = dsDescEspecial
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
              TabOrder = 0
            end
          end
          object gbDescMax: TsGroupBox
            Left = 575
            Top = 6
            Width = 66
            Height = 41
            Caption = 'Desc. M'#225'x.'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
            object edDescMaximo: TDBEdit
              Left = 6
              Top = 14
              Width = 53
              Height = 21
              DataField = 'DESCONTO_MAXIMO'
              DataSource = dsDescEspecial
              TabOrder = 0
            end
          end
          object Panel12: TsPanel
            Left = 2
            Top = 53
            Width = 724
            Height = 33
            Align = alBottom
            TabOrder = 2
            SkinData.SkinSection = 'PANEL'
            object BtNovoDescEsp: TsBitBtn
              Left = 135
              Top = 5
              Width = 75
              Height = 23
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
              OnClick = BtNovoDescEspClick
              SkinData.SkinSection = 'BUTTON'
            end
            object BtAltDescEsp: TsBitBtn
              Left = 209
              Top = 5
              Width = 75
              Height = 23
              Caption = '&Alterar'
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
              OnClick = BtAltDescEspClick
              SkinData.SkinSection = 'BUTTON'
            end
            object BtGravarDescEsp: TsBitBtn
              Left = 283
              Top = 5
              Width = 75
              Height = 23
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
              OnClick = BtGravarDescEspClick
              SkinData.SkinSection = 'BUTTON'
            end
            object BtCancDescEsp: TsBitBtn
              Left = 357
              Top = 5
              Width = 75
              Height = 23
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
              OnClick = BtCancDescEspClick
              SkinData.SkinSection = 'BUTTON'
            end
            object BtExcDescEsp: TsBitBtn
              Left = 432
              Top = 5
              Width = 75
              Height = 23
              Caption = '&Excluir'
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
              OnClick = BtExcDescEspClick
              SkinData.SkinSection = 'BUTTON'
            end
          end
          object ckAltTodos: TCheckBox
            Left = 512
            Top = 21
            Width = 54
            Height = 17
            Caption = 'Todos'
            TabOrder = 3
          end
        end
        object DBGrid6: TDBGrid
          Left = 2
          Top = 73
          Width = 728
          Height = 389
          Align = alClient
          DataSource = dsDescEspecial
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COD_GRUPO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Representante'
              Width = 571
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO_MAXIMO'
              Title.Alignment = taCenter
              Title.Caption = 'Desc.M'#225'x.'
              Visible = True
            end>
        end
      end
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 634
    Width = 740
    Height = 44
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object Btnov: TsBitBtn
      Left = 144
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BtnovClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btalt: TsBitBtn
      Left = 226
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btaltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btgra: TsBitBtn
      Left = 308
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 2
      OnClick = btgraClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btcan: TsBitBtn
      Left = 390
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btcanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btexc: TsBitBtn
      Left = 472
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Excluir'
      TabOrder = 4
      Visible = False
      OnClick = btexcClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BitBtn1: TsBitBtn
      Left = 592
      Top = 8
      Width = 91
      Height = 31
      Caption = 'Localizar'
      TabOrder = 5
      OnClick = BitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object q_representante: TFDQuery
    Connection = dao.CN
    Left = 264
    Top = 269
  end
  object q_comissao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.REP, r.NOM_REPRESENTANTE, a.COD_PRODUTO, a.NOM_PRODUTO,' +
        ' a.CUSTO_TOTAL, a.PRECO_VENDA, a.PRECO_PROMOCAO, a.PROMOCAO, a.M' +
        'ARGEM_IDEAL, a.MARGEM_MINIMA, a.INDICE_ABAIXO, a.INDICE_ACIMA, a' +
        '.MARGEM_ITEM, a.PRECO_VENDIDO, a.PERC_DESCONTO, a.DIFERENCA_MARG' +
        'EM, a.PERC_COMISSAO FROM V_GRADE_COMISSAO2 a inner join REPRESEN' +
        'TANTE r on r.ID = a.rep WHERE a.MARGEM_ITEM <= 100 and A.REP = 8' +
        '9 AND A.COD_PRODUTO = 89'
      '')
    Left = 320
    Top = 277
  end
  object XMLGeral: TXMLDocument
    Left = 376
    Top = 280
    DOMVendorDesc = 'MSXML'
  end
  object idHttpGeral: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 420
    Top = 254
  end
  object dsGradeComissao: TDataSource
    AutoEdit = False
    DataSet = mmGradeComissao
    Left = 80
    Top = 272
  end
  object mmGradeComissao: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 56
    Top = 272
    object mmGradeComissaoMargem: TFloatField
      FieldName = 'Margem'
      DisplayFormat = '#0.00%'
    end
    object mmGradeComissaopreco_dado: TCurrencyField
      FieldName = 'Preco_dado'
    end
    object mmGradeComissaoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.00%'
    end
    object mmGradeComissaoDiferenca: TFloatField
      FieldName = 'Diferenca'
      DisplayFormat = '#0.00%'
    end
    object mmGradeComissaoPerc_Comissao: TFloatField
      FieldName = 'Perc_Comissao'
      DisplayFormat = '#0.00%'
    end
  end
  object mmAnaliseVendas: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 176
    Top = 192
    object mmAnaliseVendasMes: TStringField
      FieldName = 'Mes'
    end
    object mmAnaliseVendasTotal: TCurrencyField
      FieldName = 'Total'
    end
    object mmAnaliseVendasMargem: TFloatField
      FieldName = 'Margem'
      DisplayFormat = '##0.00%'
    end
    object mmAnaliseVendasMes_ord: TDateField
      FieldName = 'Mes_ord'
    end
    object mmAnaliseVendasMeta: TCurrencyField
      FieldName = 'Meta'
    end
    object mmAnaliseVendasID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsAnaliseVendas: TDataSource
    AutoEdit = False
    DataSet = mmAnaliseVendas
    Left = 224
    Top = 184
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
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 42521.437233449080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 512
    Top = 272
    Datasets = <
      item
        DataSet = dst_comissao
        DataSetName = 'dst_comissao'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 63.333333333333300000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 612.283860000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 49.133890000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 616.842920000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 573.488560000000000000
          Top = 19.897650000000010000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 67.354360000000010000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Grade de Comiss'#245'es')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 200.315090000000000000
          Height = 56.692950000000000000
          DataField = 'LOGO'
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D6167657D0F0000FFD8FFE000104A46494600010101006000
            600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC0001108003A00CC03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F6DB
            8CF9EDB860F1FCAA2A96E33E7B6E393C7F2AA57B7B0E9F68F7139C22F6EE4FA0
            ADB9946377B10A2E52E55BB269258E18CC92BAA20EACC700563BF883CF731E99
            672DDB0E378184FCEA0B6D3EE35A75BDD50B2C1D62B507000F535BF1C6914623
            8D151074551802B04EA55D57BABF1FF8074B8D2A3A4BDE97E0BFCCC52BE239C6
            77DA5B0F41F31FEB51BC1E278FE64BAB7971FC3B40FE95A93EA76903F9664F32
            5FF9E710DEDF90A8CDF5E05F38E9ECB6E3EF02E3CCC7A851FCB3512A70DB9E57
            F26FF4348D4A9BFB38DBCD2FD753197C4D7B65308B53B1DBEEA369FF00035D05
            95FDB6A10F9B6D2071DC775FA8A5961B5D4ED007549A090654FF0051E95C55DC
            173E1BD595E07250F28C7A3AF706B29D4AB86B4A4F9A1F8A35852A38BBC62B92
            6BA747FE477B4541677497B6715CC7F7645CE3D3D453AE65682D669963695A38
            D9C46BD58819C0FAD7A09A6AE8F325171767B92D15E43A3FC47F1DF8904F368B
            E17B39A08A4F2DB2E46D3D7049239AD19FE23789F40513789BC1B2C169BB0F71
            6D26E0BFCC7E6452E741CACF4DA2B80F0FF8FA4F11FC469F4AB2689F475B1134
            6DB7E72F852493F8E31ED5DFD34EE26AC145145300A28A2800A5208EA0D797F8
            975FD73C4FE353E0EF0D5D358C36C375FDF27DE5F500F60381EE6B2B58F0EF8E
            FC1BA9D9DDE81ABEA3AD5BC8E04914996C37A32E48DA7D7B54F30F94F64A29A8
            58C685D42B9505941CE0F714EAA105145140055EB2FF0052DFEF7F41546AF597
            FA96FF007BFA0A99EC38EE56B8044EC09C9E39FC2B9A980D5FC4A2DDB9B5B21B
            997B33FF009FE55D2CE00B860391915CBF86583DE6A8E7EF997F4C9AE7ADEF4A
            14DECDFE5A9D787F76152A2DD2D3E6EC744CCA8859885551924F402B24EA17D7
            F93A5C28215FF96F3E4073E8A3FAD5BD5BFE40F79FF5C5BF954D6831656E074F
            2D7F95693BCA7C89D958CA1CB0873B5777B6BB14349BD85DDED9ED92D2F57992
            2031BBDC1EE2B56A96A1A6C5A82292C639E3E63993EF29FF000ACDB33A9EAA92
            4735DAC3142E62768570F211EFDAA14E54ED06AFDBFE09A3A70AA9D44EDDEFD3
            D3B935CDD43A66A28B6F20733BE24B54E4827F887A1F51DE99E2BB75974732E3
            E685C303EC78356D34A82D8DBFD96255D928791C9CB30C1EA7BF5AA5AFCAD7C5
            348B4F9E691834A4748D47AD6555354A6A5D765E7FF0E6D465175E9CA1D376FB
            2EFF00224F0AEEFEC34DDD3CC6DBF4ADACE39AAD043169D611C2BF72250A3D49
            FF00EB9AB406481EB5D3461C94E307BA4726226AA5594D6CDB3CF3E0FF003E18
            D49BBB6A9393F98AB5F1635B834AF03DD5A37CF73A88FB34310E49C91938F61F
            A915C2785FC49E22D17C397D07877461A8C8BAB4E2E0ED2E63CE36FCA39E79E7
            DABACF0E783F59D6B5D8BC51E36646BA880FB1E9EBF720F723A67BE3D7934D3B
            AB221AB3BB399F849A1DC68BF10753B4BB1B67B7D3D1997D0BED38FC338AF6A9
            658A089A59A448E35EAEEC140FC4D79FDB38B2F8F17D1B1005FE96ACBEE571FE
            06B03E2C69DB75BB6D435BD6CFF6210A22D2E1CF9D211F7828FBBCFF0078F4CD
            34F9509EACF56B2D574ED48B0B1BFB5B92BF78432AB11F91AB95F2F6B3771E97
            3DA6A9A3787F51F0E5D2BEE85DA5664957FE0401CFE608AF79D5F51F105E7816
            DF52F0D470C9A94F0C53059003952016DA0F19FAD0A57071B1D39207520738E4
            F7A70FBC3EB5F3EC1717DE2CD523D3BC63E2AD4346BF8E50D0DBCB6E228F3D88
            390037D7F3AF67D775697C33E186BE8ED6E75592DD1176C7CBC9D06E381F8920
            5352B89AB1C3FC2A571E2AF1A1B807ED62F00627AE373FFF005ABD4ABE7DD1BE
            21CBA5F8EF59D561D02E58EA71AFFA0AB1DCB20C7CDD391D7B77AEAB49F895E2
            CD63C4369609E1636F6F3C811DDA39331A9EAD9200E3AD4C64AD629C59E9D7BA
            9D869AA1AFAF6DED81E9E74A133F9D4B6F736F7902CD6D3C53C4DD1E370C0FE2
            2BE79BFD3ED74CF14DE41AF79BE2FD69C90B6D6CEE123C9CE598739C7F08E055
            8F006AD268DF1360D3ACEDEF2C2C6F58C53D85D3926362A48EA07423838CE29F
            3EA2E53E83C1F4A2BC23C41A878A6F3E296B5E1DD1F509626BF748866420451A
            A86C8FEEF19CE39AD3F0E5BEAFF0F7E24596857FA9BDF58EAF170EC5B1BF9C10
            0938208C7B834730729EC957ACBFD4B7FBDFD0551ABD65FEA5BFDEFE829CF614
            772ACFB44EDB7A0C63F2AE2E1B8FEC3F14DC24DF2C13B727D8F20FE75DA5C106
            762071C63F2AC5D73465D56DC14216E63FB8C7A11E86B9B134E728A9C3E28EA7
            5E0EAC23370A9F0CB47FE65EBD85AE74F9E18C8DD246554F6E4565DAEB6B6AB1
            DAEA76F25AC8A02EF2328D8F7AC7D3B5DBBD1DFEC77F13B469C60FDE4FA7A8AE
            9A0D474ED4E2DAB2C522B758E4C67F23510AF1ACF9A12B4BB335A9879505CB52
            3CD1DD35FD7E65C8E449503C6EAE87A153915950BC5A24374F7B322896769100
            39241E9C52B6810C6E64B1B89ECC9EA226CA9FC0D496FA35A5ACBF689CB5C4FD
            7CDB86C91F4EC2B57ED5B4F9526BADF4FF003318FB18A6B99B4FA5B5FF002FCF
            D0AA2E354D5F8B65363687FE5AB8FDE30F61DAB4AC74FB7D3A1290AF2797918E
            598FA93505D6B9A7DA1DA6712C9DA38BE627F2AAC23BED608FB50369647FE580
            6FDE4A3FDAF41529C54B47CD2FCBF45F9FA9725394755C90FCFF0056FF000F42
            D432FF0068DD89133F6481BE56ED2BFA8F61FCEB457EF0FAD311238512340A8A
            0615471C7B53ABA211696BB9C939293D363C93E0FB3C7E25F175B9076ADC06FA
            1DEE2BD6EAADA69D636135CBDA5B430C973279D398D403237F78D590CAD9C303
            8EB83551565625BBB3C73E21EA4DE1CF8BDA06B536E4B558543B81D537307FD0
            D4FE289AC63F8CDA1EA3ADCA83467B40F6B349FEAB760919EDD483F957A7EA9A
            3699ADC090EA76305DC68DBD1664CED3EA28D4748D3357B3FB1EA1656F756EBD
            2391010BF4F4FC2A7958F98F36F8B5E2EF0E5F783A4D3ADEFEDEFAF65911A210
            B6FF002F0725891D38C8FC6B52F7C5527823E14E8B746DC497B25B450C314990
            3715CE5BD80AE92CFC0FE16D3A4F36DB41B0471C8668F711FF007D6715A3A8E9
            9A66B765F64D42DADEF2D98EE08F86191DC7FF005A9D9EE174709A96ABE12F12
            783A04F186A7A49D4043B9DAD640CF0BFF00B18C9CF4E3A1A8BE0B6ADA8DEE89
            7F6970D34D6167285B3B894609539CAFE1807DB38AEA22F87BE0FB67122F87EC
            411CE5D4B01F99C574504305BC090DB451C50A0C2A46A0281EC05093BDC1B56B
            1E67F14AE3FE11DF117863C5510F9ADE7682603F8A33C91F916AF4D8E61716E9
            340FB92440F1B7A82320D55D4B4AD3B5BB3FB2EA3690DDDBEE0DB241B86E1DEA
            DA04540A8142A8DA02F418ED4D2D44DE878EFC2DD4748D06F3C40BAFDE4367AE
            1BB2B235D36D629D4E09FF006B24FE1506BBAD699E25F8D3E1B6D1255B836EE8
            B34F18E1F049383DC01DEBD4755F0B78775EB9F3752D2ECEEAE1060BB2FCE076
            048E7F3A9F4DF0FE8BA27CDA76996768718DF1C615B1FEF75A9E57B0EEB73CDF
            CBDDFB479310CEDB6DEF8EDFBAFF00F553FE2A164F1D782E44C87139008FFAE8
            95E9E96562B7CD7C96F6E2EE54DAD3AA8DECA3B6EEA454779A569DA85D5A5C5E
            5A4335C5A3F996EEE32D1B7A8A7CBA073179BEF1FAD5DB2FF52DFEF7F41546AF
            597FA96FF7BFA0A27B0A3B95AE0933B1231D38FC2A2A9AEBFE3E5FF0FE550D35
            B09EE57BBB1B5BE4D9730AC807427A8FA1AC49BC1F68ED986E258FD880D8AE8E
            8ACAA61E954D671B9BD2C556A5A42563998FC2F771F09ABCAABE8A08FEB53AF8
            5A276DD757D733FB16C56FD159AC1D15D3F166AF1F887F6BF05FE454B4D2ECAC
            7FE3DEDD11BFBD8CB7E66B0FC4961ABDE6AF67369C1D2386265699240AC3730D
            C067BED5C67FDAAE9E8AE8508C55A2AC8E594E527CD277679E0D33C5C6FADAEE
            E3ED334B68A391326D7CF960841EB80FB89EB9E2A5934FF16CC924572D752214
            80B159D572C1959C2E3A8E0F5C1EDCD77D453E515CE01F4DF17C12C0F1493CB3
            3183CEB86953771F338C71F2E59801EC3D6A2B2D23C4D60D1F9504E87E691BCA
            9D02B109F2A3E7920BB31CF38C0F5AF44A297285CE060B0F1B7D9A391AF2759E
            30DB51A4520E7CC3F375C9FF0056073C53F48D2BC496BAAC32B35DA413DC79D3
            19674621738224C7DE250205C74E6BBBA28E50B9C74965E2696DBC4A970EF279
            F1BC5671AB281824E0A9CF1F21039C73594340D7ACE19E4D32CDECD1B2D6F6D1
            48998725148CE782C132DB4F1BBBD7A3514F942E708FA3788A49AF896B8D924B
            BC46F3AB24A4BA8E98E8114F1C726ABD869DE31B3B5820885C4711F94AB4E8C6
            362537B67FBA7F79B457A1D14B942E7010E97E2DB78D59659D53077C30CA8320
            EC2DB78C0724C873EDEF573C35A5F886C351B54BA6952D555A49B74AAC8C5812
            411D4C9BCE4B74C0AECE8A7CA173CE2CF49F11D8DFBCD0E9863BA8C626B88E65
            CDF9690B1624F4C60000F3863E94EB8D2BC6178D245701E489445B55A752ACE8
            09DDF890323DFDABD168A5CA173CE25D1BC5B11924B6598CF1C62DA293CF550A
            BB89CC60745C2C6083EF4B71A4F8CE5BD92ED25996607C92E254E54B31CC638D
            ABC45907D0D7A35147285C4190A013938E4D5FB2FF0052DFEF7F41546AF597FA
            96FF007BFA0A27B04773FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 3.779530000000001000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 20.456709999999990000
          Width = 415.748300000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'www.plasfan.ind.br'
            'Email: plasfan@terra.com.br'
            'Fone: (47)3346-2052')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 63.590600000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'dst_comissao."COD_PRODUTO"'
        KeepTogether = True
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Representante:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779529999999994000
          Width = 619.842920000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_comissao."REP"]-[dst_comissao."NOM_REPRESENTANTE"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 4.063080000000000000
          Top = 22.559059999999990000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 94.771800000000000000
          Top = 22.559059999999990000
          Width = 619.842920000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_comissao."COD_PRODUTO"]-[dst_comissao."NOM_PRODUTO"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 45.472479999999990000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Margem %')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 399.850650000000000000
          Top = 45.472479999999990000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 479.000310000000000000
          Top = 45.472479999999990000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Desconto %')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 557.811380000000000000
          Top = 45.472479999999990000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Diferen'#231'a %')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 636.961040000000000000
          Top = 45.354360000000010000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Comiss'#227'o %')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 45.354360000000010000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Custo:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 45.354359999999990000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'CUSTO_TOTAL'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_comissao."CUSTO_TOTAL"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 45.354360000000010000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pre'#231'o Venda:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 45.354359999999990000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataField = 'PRECO_VENDA'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_comissao."PRECO_VENDA"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 226.771800000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000022000
          Width = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        DataSet = dst_comissao
        DataSetName = 'dst_comissao'
        RowCount = 0
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 321.259945040000000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 11.338590000000000000
          DataField = 'MARGEM_ITEM'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_comissao."MARGEM_ITEM"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 399.874118270000000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 11.338590000000000000
          DataField = 'PRECO_VENDIDO'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_comissao."PRECO_VENDIDO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 478.866244250000000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 11.338590000000000000
          DataField = 'PERC_DESCONTO'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_comissao."PERC_DESCONTO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 557.858370240000000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 11.338590000000000000
          DataField = 'DIFERENCA_MARGEM'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_comissao."DIFERENCA_MARGEM"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 636.850496220000000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 11.338590000000000000
          DataField = 'PERC_COMISSAO'
          DataSet = dst_comissao
          DataSetName = 'dst_comissao'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_comissao."PERC_COMISSAO"]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 576
    Top = 265
  end
  object dst_comissao: TfrxDBDataset
    UserName = 'dst_comissao'
    CloseDataSource = True
    FieldAliases.Strings = (
      'REP=REP'
      'NOM_REPRESENTANTE=NOM_REPRESENTANTE'
      'COD_PRODUTO=COD_PRODUTO'
      'NOM_PRODUTO=NOM_PRODUTO'
      'CUSTO_TOTAL=CUSTO_TOTAL'
      'PRECO_VENDA=PRECO_VENDA'
      'PRECO_PROMOCAO=PRECO_PROMOCAO'
      'PROMOCAO=PROMOCAO'
      'MARGEM_IDEAL=MARGEM_IDEAL'
      'MARGEM_MINIMA=MARGEM_MINIMA'
      'INDICE_ABAIXO=INDICE_ABAIXO'
      'INDICE_ACIMA=INDICE_ACIMA'
      'MARGEM_ITEM=MARGEM_ITEM'
      'PRECO_VENDIDO=PRECO_VENDIDO'
      'PERC_DESCONTO=PERC_DESCONTO'
      'DIFERENCA_MARGEM=DIFERENCA_MARGEM'
      'PERC_COMISSAO=PERC_COMISSAO')
    DataSet = q_comissao
    BCDToCurrency = False
    Left = 296
    Top = 240
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 472
    Top = 168
  end
  object q_cidades_atuacao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT CD.COD_CIDADE, CD.COD_IBGE, cd.NOM_CIDADE, cd.UF from CID' +
        'ADES CD where  cd.COD_CIDADE in'
      
        '(SELECT CL.COD_CIDADE FROM CLIENTE CL where cl.ID_REPRESENTANTE ' +
        '= 89)')
    Left = 376
    Top = 389
  end
  object mmTeto: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 112
    Top = 400
    object mmTetoID_REPRESENTANTE: TIntegerField
      FieldName = 'ID_REPRESENTANTE'
    end
    object mmTetoTETO: TCurrencyField
      FieldName = 'TETO'
    end
    object mmTetoCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      DisplayFormat = '##0.00%'
    end
  end
  object dsTeto: TDataSource
    AutoEdit = False
    DataSet = mmTeto
    Left = 160
    Top = 400
  end
  object q_teto: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.ID_REPRESENTANTE, a.TETO, a.COMISSAO'
      'FROM REPRESENTANTE_TETO_COMISSAO a'
      '')
    Left = 152
    Top = 317
  end
  object mmDescEspecial: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 248
    Top = 352
    object mmDescEspecialCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object mmDescEspecialDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object mmDescEspecialCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 200
    end
    object mmDescEspecialDESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
      DisplayFormat = '##0.00%'
    end
  end
  object dsDescEspecial: TDataSource
    DataSet = mmDescEspecial
    Left = 338
    Top = 352
  end
end
