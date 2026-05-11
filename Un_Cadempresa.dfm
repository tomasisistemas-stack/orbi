object Fr_Empresa: TFr_Empresa
  Left = 338
  Top = 110
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro da Empresa'
  ClientHeight = 443
  ClientWidth = 556
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
  object pg_empresa: TsPageControl
    Left = 0
    Top = 52
    Width = 556
    Height = 353
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = 'Dados da Empresa'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TsGroupBox
        Left = 0
        Top = 0
        Width = 548
        Height = 325
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label3: TsLabel
          Left = 8
          Top = 64
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
        object Label4: TsLabel
          Left = 8
          Top = 17
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
          Left = 445
          Top = 106
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
          Left = 205
          Top = 104
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
        object Label7: TsLabel
          Left = 7
          Top = 191
          Width = 21
          Height = 13
          Caption = 'Tipo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label8: TsLabel
          Left = 159
          Top = 191
          Width = 62
          Height = 13
          Caption = 'Respons'#225'vel'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbnom_cidade: TsLabel
          Left = 265
          Top = 124
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
        object Label9: TsLabel
          Left = 7
          Top = 232
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
        object Label10: TsLabel
          Left = 8
          Top = 270
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
        object Label21: TsLabel
          Left = 8
          Top = 145
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
        object Label22: TsLabel
          Left = 332
          Top = 145
          Width = 13
          Height = 13
          Caption = 'IE:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel1: TsLabel
          Left = 381
          Top = 65
          Width = 12
          Height = 13
          Caption = 'N'#186
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 426
          Top = 65
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
        object sLabel3: TsLabel
          Left = 9
          Top = 105
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
        object PrEndereco: TsEdit
          Left = 8
          Top = 78
          Width = 369
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 2
          OnKeyPress = PrCod_EmpresaKeyPress
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
        object PrCEP: TMaskEdit
          Left = 8
          Top = 30
          Width = 78
          Height = 21
          EditMask = '!99999\-999;1;_'
          MaxLength = 9
          TabOrder = 0
          Text = '     -   '
          OnKeyPress = PrCod_EmpresaKeyPress
        end
        object PrFone: TMaskEdit
          Left = 446
          Top = 118
          Width = 91
          Height = 21
          EditMask = '(##)#####-####;1;_'
          MaxLength = 14
          TabOrder = 7
          Text = '(  )     -    '
          OnKeyPress = PrCod_EmpresaKeyPress
        end
        object PrCod_Cidade: TsComboEdit
          Left = 205
          Top = 118
          Width = 57
          Height = 21
          AutoSize = False
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = ''
          OnKeyPress = PrCod_CidadeKeyPress
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
          OnButtonClick = PrCod_CidadeButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object PrTipo: TComboBox
          Left = 7
          Top = 205
          Width = 138
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 8
          Text = 'Filial'
          OnKeyPress = PrCod_EmpresaKeyPress
          Items.Strings = (
            'Filial'
            'Matriz')
        end
        object PrResponsavel: TsEdit
          Left = 159
          Top = 205
          Width = 383
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 9
          OnKeyPress = PrCod_EmpresaKeyPress
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
        object Premail: TsEdit
          Left = 7
          Top = 246
          Width = 330
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 10
          OnKeyPress = PrCod_EmpresaKeyPress
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
        object Prhomepage: TsEdit
          Left = 7
          Top = 283
          Width = 535
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 14
          OnKeyPress = PrCod_EmpresaKeyPress
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
        object PrCNPJ: TMaskEdit
          Left = 8
          Top = 158
          Width = 145
          Height = 21
          EditMask = '##.###.###/####-##;1;_'
          MaxLength = 18
          TabOrder = 15
          Text = '  .   .   /    -  '
          OnKeyPress = PrCod_EmpresaKeyPress
        end
        object PrIE: TMaskEdit
          Left = 332
          Top = 158
          Width = 209
          Height = 21
          TabOrder = 16
          Text = 'PrIE'
          OnKeyPress = PrCod_EmpresaKeyPress
        end
        object PrENQUADRADA_SIMPLES: TsCheckBox
          Left = 342
          Top = 227
          Width = 163
          Height = 20
          Caption = 'Enquadrada no SIMPLES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrNR_ENDERECO: TsEdit
          Left = 381
          Top = 78
          Width = 41
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 3
          OnKeyPress = PrCod_EmpresaKeyPress
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
        object PrComplemento: TsEdit
          Left = 426
          Top = 78
          Width = 117
          Height = 21
          CharCase = ecUpperCase
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
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
        object BtBuscaEnd: TsBitBtn
          Left = 92
          Top = 28
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
          TabOrder = 1
          OnClick = BtBuscaEndClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrBairro: TsEdit
          Left = 8
          Top = 118
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
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
        object BtnBuscarCNPJ: TsBitBtn
          Left = 156
          Top = 156
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
          TabOrder = 17
          OnClick = BtnBuscarCNPJClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrIndustria: TsCheckBox
          Left = 342
          Top = 246
          Width = 69
          Height = 20
          Caption = 'Ind'#250'stria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrConsumidorFinal: TsCheckBox
          Left = 341
          Top = 264
          Width = 116
          Height = 20
          Caption = 'Consumidor Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
    end
    object TabSheet2: TsTabSheet
      Caption = 'Configura'#231#227'o de E-mail'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GB_contas: TsGroupBox
        Left = 63
        Top = -4
        Width = 373
        Height = 242
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label11: TsLabel
          Left = 22
          Top = 12
          Width = 115
          Height = 13
          Caption = 'Nome de Apresenta'#231#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label12: TsLabel
          Left = 21
          Top = 90
          Width = 75
          Height = 13
          Caption = 'Servidor SMTP:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label13: TsLabel
          Left = 22
          Top = 128
          Width = 29
          Height = 13
          Caption = 'Login:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label14: TsLabel
          Left = 22
          Top = 165
          Width = 34
          Height = 13
          Caption = 'Senha:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label15: TsLabel
          Left = 23
          Top = 202
          Width = 25
          Height = 13
          Caption = 'Porta'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label16: TsLabel
          Left = 22
          Top = 52
          Width = 31
          Height = 13
          Caption = 'E-mail:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prema_nom_apresentacao: TsEdit
          Left = 16
          Top = 26
          Width = 329
          Height = 21
          Color = 16118514
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
        object Prema_smtp: TsEdit
          Left = 16
          Top = 103
          Width = 329
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
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
        object Prema_login: TsEdit
          Left = 16
          Top = 142
          Width = 161
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
        object Prema_senha: TMaskEdit
          Left = 16
          Top = 178
          Width = 161
          Height = 21
          PasswordChar = '*'
          TabOrder = 4
          Text = ''
        end
        object Prema_porta: TsEdit
          Left = 17
          Top = 215
          Width = 64
          Height = 21
          Color = 16118514
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
        object Prema_autenticacao: TsCheckBox
          Left = 107
          Top = 218
          Width = 163
          Height = 20
          Caption = 'Servidor Requer Autentica'#231#227'o'
          TabOrder = 6
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prema_email: TsEdit
          Left = 16
          Top = 65
          Width = 329
          Height = 21
          Color = 16118514
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
      end
    end
    object TabSheet3: TsTabSheet
      Caption = 'Configura'#231#227'o de FTP'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox2: TsGroupBox
        Left = 64
        Top = 48
        Width = 353
        Height = 209
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label17: TsLabel
          Left = 9
          Top = 30
          Width = 25
          Height = 13
          Caption = 'Host:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label18: TsLabel
          Left = 8
          Top = 109
          Width = 29
          Height = 13
          Caption = 'Login:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label19: TsLabel
          Left = 8
          Top = 146
          Width = 34
          Height = 13
          Caption = 'Senha:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label20: TsLabel
          Left = 211
          Top = 110
          Width = 25
          Height = 13
          Caption = 'Porta'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label23: TsLabel
          Left = 9
          Top = 70
          Width = 82
          Height = 13
          Caption = 'Caminho do FTP:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prftp_host: TsEdit
          Left = 5
          Top = 44
          Width = 329
          Height = 21
          Color = 16118514
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
        object Prftp_login: TsEdit
          Left = 5
          Top = 123
          Width = 161
          Height = 21
          Color = 16118514
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
        object Prftp_senha: TMaskEdit
          Left = 5
          Top = 159
          Width = 161
          Height = 21
          PasswordChar = '*'
          TabOrder = 2
          Text = ''
        end
        object Prftp_porta: TsEdit
          Left = 209
          Top = 123
          Width = 64
          Height = 21
          Color = 16118514
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
        object Prftp_habilita_transferencia: TsCheckBox
          Left = 6
          Top = 8
          Width = 167
          Height = 20
          Caption = 'Habilitar Transfer'#234'ncia por FTP'
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prcaminho_ftp: TsEdit
          Left = 5
          Top = 84
          Width = 329
          Height = 21
          Color = 16118514
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
      end
      object TsPanel
        Left = 64
        Top = 8
        Width = 353
        Height = 41
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sdf: TsLabel
          Left = 8
          Top = 2
          Width = 98
          Height = 13
          Caption = 'IP v'#225'lido da Internet:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prip_valido: TsEdit
          Left = 7
          Top = 16
          Width = 161
          Height = 21
          Color = 16118514
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
    object tab_nfe: TsTabSheet
      Caption = 'Dados NF-E -  PAF-ECF'
      ImageIndex = 3
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbImagem: TsSpeedButton
        Left = 230
        Top = 4
        Width = 23
        Height = 25
        Hint = 'Carregar Imagem'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbImagemClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object gbLogo: TsGroupBox
        Left = 4
        Top = -4
        Width = 221
        Height = 203
        Caption = 'Logo'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object BtAnt: TsSpeedButton
          Left = 21
          Top = 272
          Width = 35
          Height = 25
          Flat = True
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A
            614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
            BA7AFFFFFF6D615C925C428D5439FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
            7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
            BA7AFFFFFF875237BC9A818A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA7A4FBA
            7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
            BA7A915B41A97F65DBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA7A4FBA
            7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A85
            593AA77D63D6C2ACDBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFF4CA8774CA8774CA8774CA877347B9A549FD3549FD3347B9A3F9A673F9A
            673F9A673F9A673F9A6757946D57946D57946D57946D57946D618662865537A5
            7C62D1BEA7CAA686DBC7B0AD836995604797634A8A5034FFFFFFFFFFFF666666
            FFFFFFF9EAE1F9EAE1F9EAE1F9EAE1347B9A549FD3549FD3347B9AF9EAE1F9EA
            E1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1935D41B19077CC
            BAA3C3A080C39772D1AD8CDFCBB4DAC1ABD8BFA98A5034FFFFFFFFFFFF666666
            FFFFFFF6E3D7F6E3D7F6E3D7F6E3D7568380418B87418B87568380F6E3D7F6E3
            D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7925B3FA47B61C9B8A1B6
            8A63BC906AC39772CB9F79D1A680D8B18FE2CDB78A5034FFFFFFFFFFFF666666
            FFFFFFF6DECEF6DECEF6DECE63C58F4FBA7A4FBA7A4AAB713A9A613A9A61F6DE
            CEF6DECEF6DECEF6DECEF6DECEF6DECEF6DECE9B674DA47B61C9B8A1BA9876B6
            8A63BC906AC39772CB9F79D1A680D5AA84E2CDB78A5034FFFFFFFFFFFF666666
            FFFFFFF9D5BFF9D5BF7DCDA063C58F65BD8A4FBA7A4AAB714AAB713A9A613A9A
            61F9D5BFF9D5BFF9D5BFF9D5BFF9D5BFF9D5BFF9D5BF935A3EA47B61C9B8A1BE
            9B7ABC906AC39772CB9F79D1A680D8B18FE2CDB78A5034FFFFFFFFFFFF666666
            FFFFFFF1C9B0F1C9B0ACD4B563C58F65BD8A4FBA7A4FBA7A4AAB714AAB713A9A
            61F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0935A3EA47B61CC
            BAA3C3A080C39772CDA581DFCBB4D9C1AAD8BFA88A5034FFFFFFFFFFFF666666
            FFFFFFE7BB9FE7BB9FACD4B57DCDA065BD8A65BD8A4FBA7A4FBA7A4AAB713A9A
            61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F91573CA5
            7C62D1BEA7CAA686DBC7B0B6907795614897644B8A5034FFFFFFFFFFFF666666
            FFFFFFE7BB9FE7BB9FACD4B57DCDA063C58F65BD8A65BD8A65BD8A4AAB713A9A
            61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F92
            5A3EA77D63D6C2ACDBC7B0935E41F2ECE9FFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFFE7BB9FE7BB9FE7BB9FACD4B57DCDA063C58F63C58F63C58F3A9A61E7BB
            9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
            BB9F925C41A97F65DBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FACD4B57DCDA07DCDA07DCDA0E7BB9FE7BB
            9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
            BB9FFFFFFF875238AB81678A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB
            9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
            BB9FFFFFFF666666935D438D553AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Visible = False
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object SpeedButton1: TsSpeedButton
          Left = 60
          Top = 272
          Width = 34
          Height = 25
          Flat = True
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A
            613A9A614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A88533586
            57384FBA7AFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A
            614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A8A5034A5
            7C62855A3AFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
            7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A8A5034CC
            BAA3A77D63925C41666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
            7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A54AE72915B3FCC
            BAA3D1BEA7A97F65875238FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFF4CA8774CA8774CA8774CA877347B9A549FD3549FD3347B9A3F9A
            673F9A673F9A673F9A673F9A6757946D57946D8A503484573A85573AAB866DCC
            BAA3C3A080D6C2ACAB8167935D43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFF9EAE1F9EAE1F9EAE1F9EAE1347B9A549FD3549FD3347B9AF9EA
            E1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE18A5034C2AC95C3AE96C9B8A1B9
            916CBC906ACAA686DBC7B0AD8369945F46FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFF6E3D7F6E3D7F6E3D7F6E3D7568380418B87418B87568380F6E3
            D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D78A5034C9B8A1B7906DB2865FB6
            8A63BC906AC39772D1AD8CDFCBB4AE836A935E44FFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFF6DECEF6DECEF6DECE63C58F4FBA7A4FBA7A4AAB713A9A613A9A
            61F6DECEF6DECEF6DECEF6DECEF6DECEF6DECE8A5034C9B8A1B2865FB2865FB6
            8A63BC906AC39772CB9F79D6B392E2CDB7AE836A9D6C55FFFFFFFFFFFFFFFFFF
            666666FFFFFFF9D5BFF9D5BF7DCDA063C58F65BD8A4FBA7A4AAB714AAB713A9A
            613A9A61F9D5BFF9D5BFF9D5BFF9D5BFF9D5BF8A5034C9B8A1B7906DB2865FB6
            8A63BC906AC39772CB9F79DFCBB4AE836A935D43FFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFF1C9B0F1C9B0ACD4B563C58F65BD8A4FBA7A4FBA7A4AAB714AAB
            713A9A61F1C9B0F1C9B0F1C9B0F1C9B0F1C9B08A5034C2AD95C3AE97C9B8A1BE
            9B7ABC906ACAA686DBC7B0BE9B82945E45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFE7BB9FE7BB9FACD4B57DCDA065BD8A65BD8A4FBA7A4FBA7A4AAB
            713A9A61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034945C3F935A3EA47B61CC
            BAA3C3A080D6C2ACAB8167925C42E8DCD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFE7BB9FE7BB9FACD4B57DCDA063C58F65BD8A65BD8A65BD8A4AAB
            713A9A61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034CC
            BAA3D1BEA7A97F65875237FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFE7BB9FE7BB9FE7BB9FACD4B57DCDA063C58F63C58F63C58F3A9A
            61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034CC
            BAA3A77D63915B41666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FACD4B57DCDA07DCDA07DCDA0E7BB
            9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034B3
            927992593CFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB
            9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8C533791
            573CD4A589FFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666666666666666666666666666666666666666666666
            6666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Visible = False
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sLabel4: TsLabel
          Left = 9
          Top = 299
          Width = 196
          Height = 13
          Caption = 'Clique 2x na Imagem para Ampliar.'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object zzDescricao: TsEdit
          Left = 115
          Top = 271
          Width = 226
          Height = 21
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
        object BtExc_fot: TsBitBtn
          Left = 330
          Top = 208
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 4
          SkinData.SkinSection = 'BUTTON'
        end
        object BtCan_fot: TsBitBtn
          Left = 330
          Top = 184
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 3
          SkinData.SkinSection = 'BUTTON'
        end
        object BtGra_fot: TsBitBtn
          Left = 330
          Top = 160
          Width = 75
          Height = 25
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 2
          SkinData.SkinSection = 'BUTTON'
        end
        object BtAlt_fot: TsBitBtn
          Left = 330
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          SkinData.SkinSection = 'BUTTON'
        end
        object bt_Sel_foto: TsBitBtn
          Left = 330
          Top = 68
          Width = 75
          Height = 65
          Caption = 'bt_Sel_foto'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000420B0000420B0000000100000001000000730800087B
            080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
            6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
            E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
            FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
            FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
            19191919191919191919190F100E191919191919191919191919190F141A120E
            0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
            1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
            1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
            0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
            1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
            0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
            1900010303011919191919191919191919191919191919191919}
          Layout = blGlyphTop
          TabOrder = 6
          SkinData.SkinSection = 'BUTTON'
        end
        object BtIns_fot: TsBitBtn
          Left = 330
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Inserir'
          TabOrder = 0
          SkinData.SkinSection = 'BUTTON'
        end
        object Panel7: TsPanel
          Left = 2
          Top = 15
          Width = 217
          Height = 186
          Align = alClient
          BevelInner = bvLowered
          Color = clWhite
          TabOrder = 7
          SkinData.SkinSection = 'PANEL'
          object Shape1: TShape
            Left = 2
            Top = 2
            Width = 213
            Height = 182
            Align = alClient
            Pen.Color = clWhite
          end
          object Logo: TImage
            Left = 2
            Top = 2
            Width = 213
            Height = 182
            Align = alClient
            Center = True
            Proportional = True
            Transparent = True
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 231
        Top = 35
        Width = 314
        Height = 122
        Caption = 'Certificado'
        TabOrder = 1
        object sLabel5: TsLabel
          Left = 5
          Top = 18
          Width = 27
          Height = 13
          Caption = 'S'#233'rie:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object TsLabel
          Left = 3
          Top = 67
          Width = 50
          Height = 13
          Caption = 'V'#225'lido at'#233':'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sbBuscaCert: TSpeedButton
          Left = 284
          Top = 32
          Width = 26
          Height = 25
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbBuscaCertClick
        end
        object NfeContigencialb: TsLabel
          Left = 188
          Top = 88
          Width = 96
          Height = 13
          Caption = 'NFe em Contig'#234'ncia'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object PrSERIE_CERTIFICADO: TsEdit
          Left = 5
          Top = 34
          Width = 276
          Height = 21
          CharCase = ecUpperCase
          Color = 16118514
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
        object PrCERTIFICADO_VCTO: TsDateEdit
          Left = 5
          Top = 86
          Width = 110
          Height = 21
          AutoSize = False
          Color = 16118514
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object PrNFECONTIGENCIA: TsCheckBox
          Left = 290
          Top = 86
          Width = 20
          Height = 20
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 556
    Height = 52
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 8
      Top = 8
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
    object Label2: TsLabel
      Left = 84
      Top = 5
      Width = 87
      Height = 13
      Caption = 'Nome da Empresa'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object PrCod_Empresa: TsEdit
      Left = 7
      Top = 21
      Width = 65
      Height = 21
      Color = 16118514
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = PrCod_EmpresaKeyPress
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
    object PrNom_Empresa: TsEdit
      Left = 84
      Top = 21
      Width = 461
      Height = 21
      Color = 16118514
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
      OnKeyPress = PrCod_EmpresaKeyPress
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
  object Panel2: TsPanel
    Left = 0
    Top = 405
    Width = 556
    Height = 38
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sBitBtn6: TsBitBtn
      Left = 592
      Top = 5
      Width = 75
      Height = 28
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
      TabOrder = 0
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtNov: TsBitBtn
      Left = 35
      Top = 7
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
      TabOrder = 1
      OnClick = BtNovClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtAlt: TsBitBtn
      Left = 109
      Top = 7
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
      TabOrder = 2
      OnClick = BtAltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtGra: TsBitBtn
      Left = 183
      Top = 7
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
      TabOrder = 3
      OnClick = BtGraClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtCan: TsBitBtn
      Left = 257
      Top = 7
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
      TabOrder = 4
      OnClick = BtCanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtExc: TsBitBtn
      Left = 331
      Top = 7
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
      TabOrder = 5
      OnClick = BtExcClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtLocalizar: TsBitBtn
      Left = 445
      Top = 7
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
      TabOrder = 6
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object q_empresa: TFDQuery
    Connection = dao.CN
    Left = 186
    Top = 336
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 336
    Top = 88
  end
  object qrGravaLogo: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE empresa '
      'SET LOGO=decode(:bitmap_foto, '#39'hex'#39')'
      'where'
      '  cod_empresa = :empresa'
      '')
    Left = 110
    Top = 336
    ParamData = <
      item
        Name = 'BITMAP_FOTO'
        DataType = ftMemo
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 296
    Top = 360
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SC'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 300
    Top = 177
  end
end
