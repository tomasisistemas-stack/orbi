object Fr_Transportadora: TFr_Transportadora
  Left = 412
  Top = 103
  Width = 472
  Height = 529
  Caption = 'Cadastro de Transportadora'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]
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
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 464
    Height = 50
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Label1: TsLabel
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
    object Label2: TsLabel
      Left = 62
      Top = 9
      Width = 118
      Height = 13
      Caption = 'Nome da Transportadora'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object PrCod_transportadora: TsEdit
      Left = 8
      Top = 21
      Width = 49
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
    object PrNome: TsEdit
      Left = 62
      Top = 21
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
      TabOrder = 1
      OnKeyPress = PrNomeKeyPress
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
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 50
    Width = 464
    Height = 416
    Align = alClient
    Caption = 'Dados da Transportadora'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Label3: TsLabel
      Left = 8
      Top = 50
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
      Left = 9
      Top = 86
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
    object Label5: TsLabel
      Left = 8
      Top = 14
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
    object Label6: TsLabel
      Left = 9
      Top = 166
      Width = 27
      Height = 13
      Caption = 'CNPJ'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label7: TsLabel
      Left = 131
      Top = 167
      Width = 13
      Height = 13
      Caption = 'I.E'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label9: TsLabel
      Left = 216
      Top = 85
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
    object Label10: TsLabel
      Left = 8
      Top = 239
      Width = 75
      Height = 13
      Caption = 'Motorista Titular'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label11: TsLabel
      Left = 272
      Top = 238
      Width = 27
      Height = 13
      Caption = 'Placa'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label12: TsLabel
      Left = 8
      Top = 205
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
      Left = 79
      Top = 223
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
    object lbpercentual_frete: TsLabel
      Left = 89
      Top = 273
      Width = 93
      Height = 13
      Caption = 'Percentual do Frete'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label14: TsLabel
      Left = 8
      Top = 305
      Width = 22
      Height = 13
      Caption = 'Obs.'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label17: TsLabel
      Left = 160
      Top = 123
      Width = 20
      Height = 13
      Caption = 'CPF'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object PrEndereco: TsEdit
      Left = 8
      Top = 62
      Width = 313
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
      TabOrder = 2
      OnKeyPress = PrNomeKeyPress
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
    object PrIE: TsEdit
      Left = 131
      Top = 179
      Width = 137
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 8
      OnKeyPress = PrNomeKeyPress
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
    object PrMotorista: TsEdit
      Left = 8
      Top = 251
      Width = 257
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
      TabOrder = 11
      OnKeyPress = PrNomeKeyPress
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
    object PrPlaca: TsEdit
      Left = 272
      Top = 250
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 12
      OnKeyPress = PrNomeKeyPress
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
    object PrBairro: TsEdit
      Left = 7
      Top = 98
      Width = 194
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
      TabOrder = 3
      OnKeyPress = PrNomeKeyPress
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
    object PrCod_cidade: TsComboEdit
      Left = 8
      Top = 218
      Width = 65
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
      OnExit = PrCod_cidadeExit
      OnKeyPress = PrNomeKeyPress
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
      OnButtonClick = PrCod_cidadeButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object PrFone: TMaskEdit
      Left = 216
      Top = 98
      Width = 101
      Height = 21
      EditMask = '!\(99\)9999-9999;1;_'
      MaxLength = 13
      TabOrder = 4
      Text = '(  )    -    '
      OnKeyPress = PrNomeKeyPress
    end
    object PrCep: TMaskEdit
      Left = 8
      Top = 27
      Width = 79
      Height = 21
      EditMask = '99999\-999;1;_'
      MaxLength = 9
      TabOrder = 0
      Text = '     -   '
      OnKeyPress = PrNomeKeyPress
    end
    object PrCNPJ: TMaskEdit
      Left = 7
      Top = 179
      Width = 115
      Height = 21
      EditMask = '##.###.###/####-##;1;_'
      MaxLength = 18
      TabOrder = 7
      Text = '  .   .   /    -  '
      OnKeyPress = PrNomeKeyPress
    end
    object Prfrete_fixo: TsCheckBox
      Left = 12
      Top = 286
      Width = 71
      Height = 19
      TabStop = False
      Caption = 'Frete Fixo'
      TabOrder = 13
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object Prpercentual_frete: TsEdit
      Left = 88
      Top = 287
      Width = 65
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 14
      OnEnter = Prpercentual_freteEnter
      OnKeyPress = PrNomeKeyPress
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
    object PrObs: TRichEdit
      Left = 7
      Top = 317
      Width = 450
      Height = 93
      TabOrder = 15
    end
    object BtBuscaEnd: TsBitBtn
      Left = 92
      Top = 24
      Width = 96
      Height = 26
      Hint = 'Buscar Endere'#231'o pelo CEP...'
      Caption = 'Buscar End.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtBuscaEndClick
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
      SkinData.SkinSection = 'BUTTON'
    end
    object BtBuscaCEP: TsBitBtn
      Left = 360
      Top = 212
      Width = 96
      Height = 25
      Hint = 'Buscar CEP pelo Endere'#231'o...'
      Caption = 'Buscar CEP'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      OnClick = BtBuscaCEPClick
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
      SkinData.SkinSection = 'BUTTON'
    end
    object rgTipoPessoa: TsRadioGroup
      Left = 7
      Top = 120
      Width = 145
      Height = 41
      Caption = 'Tipo de Pessoa'
      ParentBackground = False
      TabOrder = 5
      OnClick = rgTipoPessoaClick
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Jur'#237'dica'
        'F'#237'sica')
    end
    object PrCPF: TMaskEdit
      Left = 160
      Top = 135
      Width = 94
      Height = 21
      EditMask = '###.###.###-##'
      MaxLength = 14
      TabOrder = 6
      Text = '   .   .   -  '
    end
    object PrTip_pessoa: TsEdit
      Left = 413
      Top = 118
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
      TabOrder = 16
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
    object PrInterno: TsCheckBox
      Left = 380
      Top = 286
      Width = 58
      Height = 19
      TabStop = False
      Caption = 'Interna'
      TabOrder = 17
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 466
    Width = 464
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object BtNov: TsBitBtn
      Left = 6
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
      OnClick = BtNovClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      SkinData.SkinSection = 'BUTTON'
    end
    object BtAlt: TsBitBtn
      Left = 80
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = BtAltClick
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
      SkinData.SkinSection = 'BUTTON'
    end
    object BtGra: TsBitBtn
      Left = 154
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      Enabled = False
      TabOrder = 2
      OnClick = BtGraClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
      SkinData.SkinSection = 'BUTTON'
    end
    object BtCan: TsBitBtn
      Left = 228
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = BtCanClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777778477777444447777748777744447777777477774447777777
        7477774474777777747777477748777748777777777844448777777777777777
        7777777777777777777777777777777777777777777777777777}
      SkinData.SkinSection = 'BUTTON'
    end
    object BtExc: TsBitBtn
      Left = 302
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = BtExcClick
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
      SkinData.SkinSection = 'BUTTON'
    end
    object BtLocalizar: TsBitBtn
      Left = 384
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 5
      OnClick = BtLocalizarClick
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
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object q_transportadora: TFDQuery
    Connection = dao.CN
    Left = 420
    Top = 303
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ParseText = True
    WebService = wsPlasfan
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 296
    Top = 104
  end
end
