object Fr_fornecedor: TFr_fornecedor
  Left = 371
  Top = 79
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fornecedor'
  ClientHeight = 526
  ClientWidth = 532
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCFornecedor: TsPageControl
    Left = 0
    Top = 92
    Width = 532
    Height = 399
    ActivePage = Tab_fornecedor
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object Tab_fornecedor: TsTabSheet
      Caption = 'Dados'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object gb1: TsGroupBox
        Left = 0
        Top = 0
        Width = 524
        Height = 371
        Align = alClient
        Caption = 'Dados do Fornecedor'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label1: TsLabel
          Left = 8
          Top = 54
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label2: TsLabel
          Left = 9
          Top = 93
          Width = 27
          Height = 13
          Caption = 'Bairro'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label3: TsLabel
          Left = 128
          Top = 93
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
        object Label4: TsLabel
          Left = 336
          Top = 16
          Width = 21
          Height = 13
          Caption = 'CEP'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label5: TsLabel
          Left = 9
          Top = 130
          Width = 42
          Height = 13
          Caption = 'Telefone'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label6: TsLabel
          Left = 126
          Top = 130
          Width = 50
          Height = 13
          Caption = 'WhastApp'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label8: TsLabel
          Left = 8
          Top = 16
          Width = 52
          Height = 13
          Caption = 'CNPJ/CPF'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label9: TsLabel
          Left = 389
          Top = 128
          Width = 31
          Height = 13
          Caption = 'IE/RG'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label10: TsLabel
          Left = 9
          Top = 238
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label15: TsLabel
          Left = 9
          Top = 164
          Width = 28
          Height = 13
          Caption = 'E-mail'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label16: TsLabel
          Left = 8
          Top = 202
          Width = 56
          Height = 13
          Caption = 'Home-Page'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object LbNom_cidade: TsLabel
          Left = 211
          Top = 112
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
        object Label20: TsLabel
          Left = 374
          Top = 54
          Width = 64
          Height = 13
          Caption = 'Complemento'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label30: TsLabel
          Left = 319
          Top = 54
          Width = 15
          Height = 13
          Caption = 'N'#186':'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object PREndereco: TsEdit
          Left = 8
          Top = 67
          Width = 305
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
          TabOrder = 4
          OnKeyPress = PRRazao_SocialKeyPress
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
        object PRBairro: TsEdit
          Left = 9
          Top = 106
          Width = 113
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
          TabOrder = 7
          OnKeyPress = PRRazao_SocialKeyPress
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
        object PREmail: TsEdit
          Left = 8
          Top = 177
          Width = 313
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
          TabOrder = 13
          OnKeyPress = PRRazao_SocialKeyPress
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
        object PRHome_Page: TsEdit
          Left = 8
          Top = 215
          Width = 313
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
          TabOrder = 14
          OnKeyPress = PRRazao_SocialKeyPress
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
        object ZZBt_Email: TsBitBtn
          Left = 322
          Top = 176
          Width = 26
          Height = 21
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000BD8081C58980
            DDA381DC9E7FDC9E80DC9E80DC9E80DC9E80DC9E80DC9E80DC9E80DC9E80DC9F
            7FDE9F80C0827EB87B7BC68982CC9182EDB791FFD098FECC96FFCC97FFCC97FF
            CC97FFCC97FFCC97FFCC97FFCC96FFD399E9B28FC98C83C0837EC48B84E6B08F
            C78F87F0CEACF4D3AFF2CFADF2D0ADF2D0ADF2D0ADF2D0ADF2CFADF4D3AFEBC4
            A6C68B84EABB9CC48982C08886F0D3B6DDA48ACEA09AEFDEC9EDD8C4EDD8C4ED
            D8C4EDD8C4EDD8C4EDD8C4EFDDC7C99791DAA996EFD8C1C08784C08886EADCD0
            F3D7B7C78C7FDDC6BDEFE7D9EEE2D7EEE2D7EEE2D7EEE2D7F2EADCD5B5ADCB92
            87F4E2CCEADCD0C08887C18988EFE3DDF8F3E7F2C9AABF8982E9D7D0F2E5DCEF
            E2D9EFE2D9F0E3DAE5CBC5C58A86F0D8C5F7F4EAF0E3DCC18988C18A88F7F2EE
            FAF8F3D7AAA1C28984C59191C18786C18887C18886C48E8EC49593C28683E7CC
            C6FFFFFEF6EFEDC28B88C58F8EEBD3D3CA9796CEA1A3F2EEEEF0F0F0E7E2E3E6
            E3E5E3E3E3E2E9EAE9F7F7D9D3D1C19090D3A5A5F0E2E2C48E8CBF8382BF9091
            E1C6C6FFFFFFFBFFFFF8FFFFF4FFFFF2FFFFEEFFFFEBFFFFEAFFFFEBFFFFE6F6
            F6CFB5B4C99592BD8281B7807FA3DCE0FFFFFFFCFFFFFAFFFFFAFFFFFAFFFFF7
            FFFFF7FFFFF0FEFCEBF8F8E1F4F4D5EDEEC5EDF2ABBCC1B57F7EBC807EB4A3A4
            FFFFFFFFFFFFFFFFFFF0F7F8E1EDEEC9E2E5A6CCD193C1CA84B8C67AB1C56EAF
            CB72A1BFA08388B87D7BFF00FFC07675C09190A7D8DE8BFCFF7DDEEA73D4E16C
            D8E36ADAE96CD8EE6DD8F26CDAFC87BAD3B78A8EC47F7DFF00FFFF00FFFF00FF
            FF00FFB2838392B7BD70F0FC6EF7FF73F2FF73F3FF6FF7FF76E6FA9CAAB6C081
            80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC47A78AB9C9E82D8E073
            F0FA74EFF883D7E0AF9798C47B78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFBF8180B09395B19293BF8080FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 16
          OnClick = ZZBt_EmailClick
          SkinData.SkinSection = 'BUTTON'
        end
        object ZzBt_HomePage: TsBitBtn
          Left = 323
          Top = 214
          Width = 26
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFAF7E6AAF7E6AAF7E6AAF7E6AFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF7E6AD9A47EEEC093EAC7A1DD
            B189AF7E6AAF7E6AAF7E6AAF7E6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            AF7E6AE2B589EFB67EEEC29CEFD5B6F0CC9FC599777B4B47885751AF7E6AAF7E
            6AAF7E6AFF00FFFF00FFFF00FFAF7E6AEAC191F3C68EEAB17BEFC7A3F3E0CAF3
            D5B1C69E827B4C487B4B47CFA47EEAC08ED5A783AF7E6AFF00FFAF7E6AF2CE9A
            F8D497F0C28CEAB17BF2CCABF8EDDEF8E2C5CBA68F7B4B477D4D49CEA17DEABF
            8CE0B288AF7E6AFF00FFAF7E6AF8D89EF6D096F4C58AF4B476F4D0AFFEFAF2FE
            F0DACCAB987746437A4A47CEA17DE9BD8CDDB087AF7E6AFF00FFAF7E6AF7D79E
            FED191E6C091B5A391F6D1AFFFFEF8FFFAEDDDC4B490635A80504CCEA380E9BD
            8CDDB087AF7E6AFF00FFAF7E6AFFD998D0CBA751A6E72080F480AADDFFFFF0FF
            F8EFFCF3E5F4E0CAE0C0A7E5C19DE7BD90DDB186AF7E6AFF00FFAF7E6A9DC1C6
            44B4FC35AAFF2F9AFF1D83FF82BBF6FFFFEFFFF8EFFCF2E3FAE6CEF0D5B6EECA
            A0DDB48BA67F7EFF00FF469EF73FA3FE43AFFE46B4FE3CA9FE2D97FF1C82FF8C
            C0F6FFFFEFFFF7EEFAEEDEFFE7CAE2CAB19788969A7B86FF00FFFF00FF419FFC
            43A5FC46B0FE44B4FE3AA5FE2C95FE1C81FF8EC1F6FFFFEFFFFFF0D4D1D4747D
            A9787295FF00FFFF00FFFF00FFFF00FF42A0FB44A9FC46B1FE42B1FE37A3FE29
            90FE1C80FF95C7F8B5C9E14C6FBA5369A7FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF43A1FC44ABFC46B5FE41AFFE359EFE278FFF1D84FF316CE13563C7FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42A3FB45ACFC46B4FE3D
            AFFF3B96F31C33B43A50DDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF44A5FC46B0FEFF00FFFF00FF1D1795384DD8FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF1C1F9D384ED9FF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 17
          OnClick = ZzBt_HomePageClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PRObservacao: TRichEdit
          Left = 8
          Top = 253
          Width = 338
          Height = 104
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'PRObservacao')
          ParentFont = False
          TabOrder = 15
          Zoom = 100
        end
        object PRCod_cidade: TsComboEdit
          Left = 128
          Top = 106
          Width = 81
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
          Text = ''
          OnExit = PRCod_cidadeExit
          OnKeyPress = PRRazao_SocialKeyPress
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
          OnButtonClick = PRCod_cidadeButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object PRCNPCPF: TMaskEdit
          Left = 8
          Top = 30
          Width = 116
          Height = 21
          EditMask = '##.###.###/####-##;1;_'
          MaxLength = 18
          TabOrder = 0
          Text = '  .   .   /    -  '
          OnExit = PRCNPCPFExit
          OnKeyDown = PRCNPCPFKeyDown
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object PRIERG: TMaskEdit
          Left = 386
          Top = 142
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 12
          Text = ''
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object PRcep: TMaskEdit
          Left = 336
          Top = 30
          Width = 68
          Height = 21
          EditMask = '99999\-999;1;_'
          MaxLength = 9
          TabOrder = 2
          Text = '     -   '
          OnKeyDown = PRcepKeyDown
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object PRfone: TMaskEdit
          Left = 9
          Top = 142
          Width = 105
          Height = 21
          EditMask = '!\(99\)9999-9999;1;_'
          MaxLength = 13
          TabOrder = 10
          Text = '(  )    -    '
          OnKeyDown = PRfoneKeyDown
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object PRWhastApp: TMaskEdit
          Left = 123
          Top = 142
          Width = 102
          Height = 21
          EditMask = '!\(99\)99999-9999;1;_'
          MaxLength = 14
          TabOrder = 11
          Text = '(  )     -    '
          OnKeyDown = PRWhastAppKeyDown
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object GroupBox3: TsGroupBox
          Left = 356
          Top = 275
          Width = 149
          Height = 82
          Caption = 'Tipo de Empresa'
          TabOrder = 18
          SkinData.SkinSection = 'GROUPBOX'
          object ZZempresa_simples: TsRadioButton
            Left = 8
            Top = 19
            Width = 100
            Height = 20
            Caption = 'Empresa Simples'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
          end
          object ZZempresa_epp: TsRadioButton
            Left = 8
            Top = 39
            Width = 135
            Height = 20
            Caption = 'Empresa Pequeno Porte'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
          end
          object ZZempresa_grande_porte: TsRadioButton
            Left = 8
            Top = 60
            Width = 127
            Height = 20
            Caption = 'Empresa Grande Porte'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
          end
        end
        object PRuso_prepedido: TsCheckBox
          Left = 373
          Top = 180
          Width = 109
          Height = 20
          TabStop = False
          Caption = 'Uso no Pr'#233'-Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PRinativo: TsCheckBox
          Left = 373
          Top = 208
          Width = 52
          Height = 20
          TabStop = False
          Caption = 'Inativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PRComplemento: TsEdit
          Left = 374
          Top = 67
          Width = 133
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 6
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
        object PRnr_endereco: TsEdit
          Left = 318
          Top = 67
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
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
        object PrNFE_EMAIL: TsCheckBox
          Left = 373
          Top = 237
          Width = 122
          Height = 20
          TabStop = False
          Caption = 'Enviar NF-e por Email'
          TabOrder = 21
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object BtBuscaEnd: TsBitBtn
          Left = 408
          Top = 27
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
          TabOrder = 3
          OnClick = BtBuscaEndClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtBuscaCEP: TsBitBtn
          Left = 411
          Top = 104
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
          TabOrder = 9
          Visible = False
          OnClick = BtBuscaCEPClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnBuscarCNPJ: TsBitBtn
          Left = 128
          Top = 27
          Width = 122
          Height = 26
          Hint = 'Buscar por CNPJ'
          Caption = 'Buscar por CNPJ'
          Glyph.Data = {
            16080000424D160800000000000036000000280000001C000000180000000100
            180000000000E0070000C40E0000C40E00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            001B1A1A00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000C7AB8F655A500000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000161717FFDBB4FFE0B3FFF5C41F1D1B0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000DBBC9DFFE1B2
            FFD6ACFFDDBB0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000B09C89FDD9B5FFEEC4000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000F6D2AFFFD7AAFFD9B0D3B69B000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000271665CFFE1B9F8D3AEF9
            D3ADFFDBADFFE9C3DDC3AAB69D84000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000B39980FFEBBBFFD4A9F9D2AEFFD4A8F8D3AEFDD3ABFFD8ABFF
            E8C3806F5F000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000937E69FFDE
            B1FFD4A8F7D3AEF0D1B3FAD3ACFFD4A9FFD4A9FFD8ACE5CAAE00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000D1B69CFFD8B1F1D1B2FFD4A9FFD4A8F9D2
            ADFFD4A9FFD4A9FFD4A9FFEAC02F2C2900000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            FFE3BEFFDCAFFFD4A9FFD3A9F9D2AEFFD4A8F6D2AFF3D1B1FAD3ADF9D3ADFFE0
            B77A675700000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000003695D51FFE1B6FFD4A9FFD4AAFFD4A9
            FCD3ACF8D2AEFAD3ACF8D2AEFED3AAFFD4A9FFDBAEBFA58A0000000000000000
            00000000000000000000000000000000000000000000161514433D3800000062
            564BFFF5C5FFE2B6F6D2B0FFD4A9FFD4A9FFD4A9FFD4A8F4D2B0FFD4A8F7D2AF
            FFD4A9FFD4A9FFD4A9FFE7BA766A5E0000000000000000000000000000000000
            000000000000008F7D6CE2C09EFFF2C3A5917ECFB295FFD9ACF8D2AEFFD4A9FF
            D4A9F9D3ADF9D3ADFAD3ADF7D2AEFFD4A8F3D1B2F6D2AFF9D3ADF9D3ADF7D2AE
            FFEFC75B534B000000000000000000000000000000000000433C35FFF2C5FFD7
            B1FCD3ABFFDCAFFFD8AFF7D2AEF9D3ADF9D3ADF3D2B1FFD4A9FFD4A9FFD4A9FC
            D3ABFDD3ABF4D2B1FDD3ABFFD4A8F7D2AEF5D2B0FFD8B2E2C2A2000000000000
            000000000000000000000000000308FFF9C8FFD9ADFFD4A9FFD4AAFFD4A9FFD4
            A9FFD4A9FFD4A9F9D2ADFFD4A9FFD4AAFFD4AAFFD4A8F0D2B3FFD4A8FCD3ACF9
            D2ADFBD3ACFCD4AEFFEDC4D4B99D000000000000000000000000000000000000
            000000443E39E4C2A0FFD8ADFFD4AAFFD4AAFFD4AAFFD4AAFFD4A9F8D2ADFFD4
            A9FFD4AAFFD4AAFFD4A9F8D2AEFDD3ABFFD9ACFFE0B7FFE7BDFFEABE1D1E1E00
            0000000000000000000000000000000000000000000000000000000000FFEABB
            FFD4AAFFD4AAFFD4A9FFD4A9FFD4A9FDD3ABF9D3ADFFD4A9FFD4A9FFD4AAFFDF
            B1FFE7BDE3C1A073645735312D00000000000000000000000000000000000000
            000000000000000000000000000022201FFFE9B9FFDBAFFFDDB0FBD3ACF6D2AF
            FFD7AEFFD8B1FFD5A9FFD4A9F5D3B1FFDEB484786C61564B0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00002C2A29FFFFD8AF967E9B8671FFDCB6FFD8ABD5BAA0D0B192FFE5B9FFE8C0
            FFE5B59D89760000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFF8CCFFF6C41A1A19000000131414111213E4C4A6000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000029262400000280706037312C00
            0000000000000000030506000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BtnBuscarCNPJClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object tab_contato: TsTabSheet
      Caption = 'Contatos'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 0
        Width = 521
        Height = 129
        Caption = 'Contatos Cadastrados'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object dg_contato: TDBGrid
          Left = 2
          Top = 15
          Width = 517
          Height = 112
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object zzDados_Contato: TsGroupBox
        Left = 0
        Top = 136
        Width = 521
        Height = 137
        Caption = 'Dados do Contrato'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object Label11: TsLabel
          Left = 8
          Top = 16
          Width = 83
          Height = 13
          Caption = 'Nome do Contato'
        end
        object Label12: TsLabel
          Left = 8
          Top = 54
          Width = 42
          Height = 13
          Caption = 'Telefone'
        end
        object Label13: TsLabel
          Left = 114
          Top = 54
          Width = 28
          Height = 13
          Caption = 'Cargo'
        end
        object Label14: TsLabel
          Left = 8
          Top = 93
          Width = 28
          Height = 13
          Caption = 'E-mail'
        end
        object CFNom_contato: TsEdit
          Left = 8
          Top = 29
          Width = 257
          Height = 21
          MaxLength = 40
          TabOrder = 0
          OnKeyPress = PRRazao_SocialKeyPress
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
        object CFCargo_Contato: TsEdit
          Left = 112
          Top = 67
          Width = 137
          Height = 21
          MaxLength = 20
          TabOrder = 2
          OnKeyPress = PRRazao_SocialKeyPress
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
        object CFEmail_Contato: TsEdit
          Left = 8
          Top = 106
          Width = 313
          Height = 21
          MaxLength = 50
          TabOrder = 3
          OnKeyPress = PRRazao_SocialKeyPress
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
        object CFFone_Contato: TMaskEdit
          Left = 8
          Top = 67
          Width = 98
          Height = 21
          EditMask = '!\(99\)99999-9999;1;_'
          MaxLength = 14
          TabOrder = 1
          Text = '(  )     -    '
          OnKeyDown = CFFone_ContatoKeyDown
          OnKeyPress = PRRazao_SocialKeyPress
        end
        object CFcod_fornecedor: TsEdit
          Left = 360
          Top = 8
          Width = 25
          Height = 21
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
      end
      object BtNov_Cont: TsBitBtn
        Left = 64
        Top = 277
        Width = 75
        Height = 25
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
        TabOrder = 2
        OnClick = BtNov_ContClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtAlt_Cont: TsBitBtn
        Left = 138
        Top = 277
        Width = 75
        Height = 25
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
        TabOrder = 3
        OnClick = BtAlt_ContClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtGra_Cont: TsBitBtn
        Left = 212
        Top = 277
        Width = 75
        Height = 25
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
        TabOrder = 4
        OnClick = BtGra_ContClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtCan_Cont: TsBitBtn
        Left = 286
        Top = 277
        Width = 75
        Height = 25
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
        TabOrder = 5
        OnClick = BtCan_ContClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtExc_Cont: TsBitBtn
        Left = 360
        Top = 277
        Width = 75
        Height = 25
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
        TabOrder = 6
        OnClick = BtExc_ContClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object tab_adicionais: TsTabSheet
      Caption = 'Dados Adicionais '
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel2: TsPanel
        Left = 0
        Top = 0
        Width = 524
        Height = 66
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object GroupBox1: TsGroupBox
          Left = 8
          Top = 0
          Width = 153
          Height = 57
          Caption = 'Taxa de Lucro Pr'#233'-definida'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object Label19: TsLabel
            Left = 84
            Top = 23
            Width = 16
            Height = 20
            Caption = '%'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object PRlucro_definido: TsCurrencyEdit
            Left = 33
            Top = 22
            Width = 48
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
            DisplayFormat = '0'
          end
        end
        object btcalcula_preco_venda: TsBitBtn
          Left = 336
          Top = 6
          Width = 177
          Height = 49
          TabOrder = 1
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object Panel3: TsPanel
        Left = 0
        Top = 66
        Width = 524
        Height = 305
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Lbcolecao: TsLabel
          Left = 76
          Top = 34
          Width = 9
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lblcod_colecao: TsLabel
          Left = 10
          Top = 15
          Width = 39
          Height = 13
          Caption = 'Cole'#231#227'o'
        end
        object zzcod_colecao: TsComboEdit
          Left = 7
          Top = 28
          Width = 66
          Height = 21
          AutoSize = False
          TabOrder = 0
          Text = ''
          OnExit = zzcod_colecaoExit
          OnKeyPress = zzcod_colecaoKeyPress
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
          OnButtonClick = zzcod_colecaoButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object zzgiro: TsCurrencyEdit
          Left = 249
          Top = 26
          Width = 99
          Height = 21
          AutoSize = False
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
          DisplayFormat = '0.00'
        end
        object Button1: TButton
          Left = 376
          Top = 13
          Width = 137
          Height = 36
          Caption = 'Inserir Giro'
          TabOrder = 2
          OnClick = Button1Click
        end
        object IB_Grid1: TDBGrid
          Left = 2
          Top = 58
          Width = 516
          Height = 210
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 92
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Label7: TsLabel
      Left = 8
      Top = 9
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label17: TsLabel
      Left = 144
      Top = 9
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label18: TsLabel
      Left = 144
      Top = 49
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Gbtipo: TsGroupBox
      Left = 8
      Top = 45
      Width = 121
      Height = 41
      Caption = 'Pessoa'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object ZZjuridica: TsRadioButton
        Left = 5
        Top = 16
        Width = 58
        Height = 20
        Caption = 'Jur'#237'dica'
        TabOrder = 0
        OnClick = ZZjuridicaClick
        SkinData.SkinSection = 'CHECKBOX'
      end
      object ZZfisica: TsRadioButton
        Left = 66
        Top = 16
        Width = 49
        Height = 20
        Caption = 'F'#237'sica'
        TabOrder = 1
        OnClick = ZZfisicaClick
        SkinData.SkinSection = 'CHECKBOX'
      end
    end
    object PRCod_Fornecedor: TsEdit
      Left = 8
      Top = 22
      Width = 73
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    object PRRazao_Social: TsEdit
      Left = 144
      Top = 22
      Width = 313
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
      OnKeyPress = PRRazao_SocialKeyPress
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
    object PRFantasia: TsEdit
      Left = 144
      Top = 62
      Width = 313
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
      OnKeyPress = PRFantasiaKeyPress
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
  object Panel4: TsPanel
    Left = 0
    Top = 491
    Width = 532
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object BtNov: TsBitBtn
      Left = 38
      Top = 5
      Width = 75
      Height = 25
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
      Left = 112
      Top = 5
      Width = 75
      Height = 25
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
      OnClick = BtAltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtGra: TsBitBtn
      Left = 186
      Top = 5
      Width = 75
      Height = 25
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
      Left = 260
      Top = 5
      Width = 75
      Height = 25
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
      Left = 334
      Top = 5
      Width = 75
      Height = 25
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
      Visible = False
      OnClick = BtExcClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtLocalizar: TsBitBtn
      Left = 432
      Top = 5
      Width = 75
      Height = 25
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
  end
  object Q_fornecedor: TFDQuery
    Connection = dao.CN
    Left = 360
    Top = 248
  end
  object q_contato: TFDQuery
    Connection = dao.CN
    Left = 432
    Top = 142
  end
  object q_giro: TFDQuery
    Connection = dao.CN
    Left = 264
    Top = 286
  end
  object q_loja_fornecedor: TFDQuery
    Connection = dao.CN
    Left = 424
    Top = 232
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 296
    Top = 104
  end
  object ds_contato: TDataSource
    DataSet = q_contato
    Left = 256
    Top = 264
  end
  object ds_giro: TDataSource
    DataSet = q_giro
    Left = 292
    Top = 228
  end
  object ds_loja_fornecedor: TDataSource
    DataSet = q_loja_fornecedor
    Left = 252
    Top = 220
  end
end
