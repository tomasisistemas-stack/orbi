object Fr_Cliente: TFr_Cliente
  Left = 640
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 695
  ClientWidth = 689
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
  object Pgcliente: TsPageControl
    Left = 0
    Top = 129
    Width = 689
    Height = 528
    ActivePage = tab_dados
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_dados: TsTabSheet
      Caption = 'Dados do Cliente'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object gbDados: TsGroupBox
        Left = 0
        Top = 0
        Width = 681
        Height = 500
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label4: TsLabel
          Left = 8
          Top = 41
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
        object Label5: TsLabel
          Left = 378
          Top = 41
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
        object Label6: TsLabel
          Left = 499
          Top = 41
          Width = 37
          Height = 13
          Caption = 'Pr'#243'ximo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label7: TsLabel
          Left = 7
          Top = 76
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
        object Label8: TsLabel
          Left = 8
          Top = 7
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
        object Label9: TsLabel
          Left = 200
          Top = 76
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
          Left = 281
          Top = 95
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
        object Label11: TsLabel
          Left = 380
          Top = 76
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
        object Label12: TsLabel
          Left = 7
          Top = 111
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
        object Label13: TsLabel
          Left = 94
          Top = 111
          Width = 29
          Height = 13
          Caption = 'E-Mail'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label14: TsLabel
          Left = 8
          Top = 145
          Width = 26
          Height = 13
          Caption = 'Aviso'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label40: TsLabel
          Left = 302
          Top = 111
          Width = 27
          Height = 13
          Caption = 'Limite'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbDescMaximo: TsLabel
          Left = 464
          Top = 111
          Width = 85
          Height = 13
          Caption = 'Desconto Maximo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label30: TsLabel
          Left = 319
          Top = 41
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
        object Label32: TsLabel
          Left = 368
          Top = 111
          Width = 66
          Height = 13
          Caption = 'Prazo M'#225'ximo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel1: TsLabel
          Left = 313
          Top = 220
          Width = 58
          Height = 13
          Caption = 'E-Mail NF-e:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 8
          Top = 236
          Width = 88
          Height = 13
          Caption = 'E-Mails Adicionais:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel3: TsLabel
          Left = 477
          Top = 76
          Width = 35
          Height = 13
          Caption = 'Celular '
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel4: TsLabel
          Left = 576
          Top = 76
          Width = 50
          Height = 13
          Caption = 'Operadora'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel5: TsLabel
          Left = 578
          Top = 8
          Width = 85
          Height = 13
          Caption = #218'lt. Cons. Serasa.'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel6: TsLabel
          Left = 374
          Top = 288
          Width = 89
          Height = 13
          Caption = 'Desconto Especial'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel9: TsLabel
          Left = 591
          Top = 292
          Width = 27
          Height = 13
          Caption = 'Saldo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object PrEndereco: TsEdit
          Left = 6
          Top = 54
          Width = 307
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
          OnKeyPress = PrNom_ClienteKeyPress
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
          Left = 372
          Top = 54
          Width = 122
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
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrProximo: TsEdit
          Left = 497
          Top = 54
          Width = 179
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
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrEmail: TsEdit
          Left = 92
          Top = 124
          Width = 178
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
          TabOrder = 16
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrAviso: TRichEdit
          Left = 5
          Top = 159
          Width = 483
          Height = 53
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Zoom = 100
        end
        object BtCDL: TsBitBtn
          Left = 480
          Top = 10
          Width = 49
          Height = 25
          Caption = 'C&DL'
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
          TabOrder = 10
          SkinData.SkinSection = 'BUTTON'
        end
        object PCCliente: TsPageControl
          Left = 2
          Top = 328
          Width = 677
          Height = 170
          ActivePage = TabSheet1
          Align = alBottom
          TabOrder = 39
          SkinData.SkinSection = 'PAGECONTROL'
          object TabSheet1: TsTabSheet
            Caption = 'Pessoa Jur'#237'dica'
            SkinData.CustomColor = False
            SkinData.CustomFont = False
            object GroupBox6: TsGroupBox
              Left = 0
              Top = 0
              Width = 669
              Height = 142
              Align = alClient
              TabOrder = 0
              SkinData.SkinSection = 'GROUPBOX'
              ExplicitLeft = 2
              ExplicitTop = 1
              object Label33: TsLabel
                Left = 8
                Top = 8
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
              object Label34: TsLabel
                Left = 161
                Top = 8
                Width = 58
                Height = 13
                Caption = 'Ins.Estadual'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label35: TsLabel
                Left = 317
                Top = 8
                Width = 62
                Height = 13
                Caption = 'Ins.Municipal'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label36: TsLabel
                Left = 448
                Top = 8
                Width = 68
                Height = 13
                Caption = 'Produtor Rural'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label37: TsLabel
                Left = 8
                Top = 42
                Width = 37
                Height = 13
                Caption = 'Contato'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label38: TsLabel
                Left = 208
                Top = 43
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
              object BitBtn4: TsBitBtn
                Left = 125
                Top = 19
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
                TabOrder = 1
                OnClick = BitBtn4Click
                SkinData.SkinSection = 'BUTTON'
              end
              object PrProd_Rural: TComboBox
                Left = 460
                Top = 20
                Width = 41
                Height = 21
                TabOrder = 5
                OnKeyPress = PrNom_ClienteKeyPress
              end
              object PrContato: TsEdit
                Left = 7
                Top = 55
                Width = 194
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 6
                OnKeyPress = PrNom_ClienteKeyPress
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
                Left = 161
                Top = 20
                Width = 122
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 18
                ParentFont = False
                TabOrder = 2
                OnExit = PrIEExit
                OnKeyPress = PrNom_ClienteKeyPress
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
              object PrIM: TsEdit
                Left = 315
                Top = 20
                Width = 122
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 18
                ParentFont = False
                TabOrder = 4
                OnKeyPress = PrNom_ClienteKeyPress
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
              object BitBtn5: TsBitBtn
                Left = 281
                Top = 19
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
                TabOrder = 3
                OnClick = BitBtn5Click
                SkinData.SkinSection = 'BUTTON'
              end
              object PrFone_Contato: TsMaskEdit
                Left = 207
                Top = 56
                Width = 83
                Height = 21
                Color = clWhite
                EditMask = '!\(99\)99999-9999;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 7
                Text = '(  )     -    '
                OnKeyDown = PrFone_ContatoKeyDown
                OnKeyPress = PrNom_ClienteKeyPress
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
              end
              object PrCNPJ: TsMaskEdit
                Left = 7
                Top = 20
                Width = 115
                Height = 21
                Color = clWhite
                EditMask = '##.###.###/####-##;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 18
                ParentFont = False
                TabOrder = 0
                Text = '  .   .   /    -  '
                OnExit = PrCNPJExit
                OnKeyDown = PrCNPJKeyDown
                OnKeyPress = PrNom_ClienteKeyPress
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
              end
            end
          end
          object TabSheet2: TsTabSheet
            Caption = 'Pessoa F'#237'sica'
            ImageIndex = 1
            SkinData.CustomColor = False
            SkinData.CustomFont = False
            object GroupBox4: TsGroupBox
              Left = 0
              Top = -1
              Width = 649
              Height = 114
              TabOrder = 0
              SkinData.SkinSection = 'GROUPBOX'
              object Label17: TsLabel
                Left = 8
                Top = 8
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
              object Label18: TsLabel
                Left = 142
                Top = 8
                Width = 16
                Height = 13
                Caption = 'RG'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label19: TsLabel
                Left = 248
                Top = 8
                Width = 60
                Height = 13
                Caption = 'Naturalidade'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label20: TsLabel
                Left = 446
                Top = 8
                Width = 40
                Height = 13
                Caption = 'Est. Civil'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label21: TsLabel
                Left = 8
                Top = 42
                Width = 54
                Height = 13
                Caption = 'Filia'#231#227'o Pai'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label22: TsLabel
                Left = 328
                Top = 41
                Width = 60
                Height = 13
                Caption = 'Filia'#231#227'o M'#227'e'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label23: TsLabel
                Left = 7
                Top = 76
                Width = 71
                Height = 13
                Caption = 'Tip.Resid'#234'ncia'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label24: TsLabel
                Left = 161
                Top = 75
                Width = 50
                Height = 13
                Caption = 'Vlr.Aluguel'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Label10: TsLabel
                Left = 253
                Top = 76
                Width = 78
                Height = 13
                Caption = 'Data Anivers'#225'rio'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object PrRG: TsEdit
                Left = 141
                Top = 20
                Width = 97
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 2
                OnKeyPress = PrNom_ClienteKeyPress
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
              object BitBtn2: TsBitBtn
                Left = 106
                Top = 19
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
                TabOrder = 1
                OnClick = BitBtn2Click
                SkinData.SkinSection = 'BUTTON'
              end
              object PrNaturalidade: TsEdit
                Left = 246
                Top = 20
                Width = 193
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 30
                ParentFont = False
                TabOrder = 3
                OnKeyPress = PrNom_ClienteKeyPress
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
              object PrEst_Civil: TComboBox
                Left = 446
                Top = 20
                Width = 121
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 4
                Text = 'Solteiro(a)'
                OnEnter = PrEst_CivilEnter
                OnKeyPress = PrNom_ClienteKeyPress
                Items.Strings = (
                  'Solteiro(a)'
                  'Casado(a)'
                  'Divorciado(a)'
                  'Viuvo(a)'
                  'Amaziado(a)')
              end
              object PrPai: TsEdit
                Left = 7
                Top = 55
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
                TabOrder = 5
                OnKeyPress = PrNom_ClienteKeyPress
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
              object PrMae: TsEdit
                Left = 326
                Top = 54
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
                TabOrder = 6
                OnKeyPress = PrNom_ClienteKeyPress
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
              object PrTip_Residencia: TComboBox
                Left = 7
                Top = 88
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 7
                Text = 'Propria'
                OnKeyPress = PrNom_ClienteKeyPress
                Items.Strings = (
                  'Propria'
                  'Alugada')
              end
              object PrAluguel: TsCurrencyEdit
                Left = 154
                Top = 88
                Width = 88
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
                OnKeyPress = PrNom_ClienteKeyPress
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
              object PrDta_aniversario: TsMaskEdit
                Left = 252
                Top = 88
                Width = 68
                Height = 21
                Color = clWhite
                EditMask = '!99/99;1;_'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 5
                ParentFont = False
                TabOrder = 9
                Text = '  /  '
                OnKeyDown = PrDta_aniversarioKeyDown
                OnKeyPress = PrNom_ClienteKeyPress
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
              end
              object PrCPF: TsMaskEdit
                Left = 8
                Top = 20
                Width = 94
                Height = 21
                Color = clWhite
                EditMask = '###.###.###-##'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                MaxLength = 14
                ParentFont = False
                TabOrder = 0
                Text = '   .   .   -  '
                OnExit = PrCPFExit
                OnKeyDown = PrCPFKeyDown
                OnKeyPress = PrNom_ClienteKeyPress
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
              end
            end
          end
          object TabSheet3: TsTabSheet
            Caption = 'Observa'#231#245'es'
            ImageIndex = 2
            SkinData.CustomColor = False
            SkinData.CustomFont = False
            object GroupBox7: TsGroupBox
              Left = 0
              Top = -1
              Width = 649
              Height = 114
              TabOrder = 0
              SkinData.SkinSection = 'GROUPBOX'
              object PrObservacoes: TRichEdit
                Left = 4
                Top = 9
                Width = 642
                Height = 101
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
          end
          object tabGeral: TsTabSheet
            Caption = 'Geral'
            SkinData.CustomColor = False
            SkinData.CustomFont = False
            object PageControl1: TsPageControl
              Left = 0
              Top = 0
              Width = 669
              Height = 142
              ActivePage = TabSheet4
              Align = alClient
              TabOrder = 0
              SkinData.SkinSection = 'PAGECONTROL'
              object TabSheet4: TsTabSheet
                Caption = 'Trabalho do Cliente'
                SkinData.CustomColor = False
                SkinData.CustomFont = False
                object GroupBox8: TsGroupBox
                  Left = 0
                  Top = 0
                  Width = 661
                  Height = 114
                  Align = alClient
                  TabOrder = 0
                  SkinData.SkinSection = 'GROUPBOX'
                  object Label39: TsLabel
                    Left = 8
                    Top = 7
                    Width = 41
                    Height = 13
                    Caption = 'Empresa'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object Label41: TsLabel
                    Left = 267
                    Top = 8
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
                  object Label44: TsLabel
                    Left = 8
                    Top = 40
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
                  object Label46: TsLabel
                    Left = 208
                    Top = 40
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
                  object Label47: TsLabel
                    Left = 8
                    Top = 74
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
                  object Lbcid_trabalho: TsLabel
                    Left = 272
                    Top = 57
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
                  object Label43: TsLabel
                    Left = 103
                    Top = 74
                    Width = 28
                    Height = 13
                    Caption = 'Cargo'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object Label45: TsLabel
                    Left = 248
                    Top = 74
                    Width = 32
                    Height = 13
                    Caption = 'Sal'#225'rio'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object PrEmpresa: TsEdit
                    Left = 7
                    Top = 19
                    Width = 250
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 40
                    ParentFont = False
                    TabOrder = 0
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrEnd_TraCli: TsEdit
                    Left = 265
                    Top = 19
                    Width = 320
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrBairro_Trabalho: TsEdit
                    Left = 7
                    Top = 52
                    Width = 194
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 30
                    ParentFont = False
                    TabOrder = 2
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrCargo: TsEdit
                    Left = 105
                    Top = 86
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
                    TabOrder = 5
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrFone_Trabalho: TsMaskEdit
                    Left = 8
                    Top = 87
                    Width = 75
                    Height = 21
                    EditMask = '!\(99\)99999-9999;1;_'
                    MaxLength = 14
                    TabOrder = 4
                    Text = '(  )     -    '
                    OnKeyDown = PrFone_TrabalhoKeyDown
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  end
                  object Prcid_trabalho: TsComboEdit
                    Left = 204
                    Top = 52
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
                    OnKeyPress = Prcid_trabalhoKeyPress
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
                    OnButtonClick = Prcid_trabalhoButtonClick
                    GlyphMode.Blend = 0
                    GlyphMode.Grayed = False
                  end
                  object PrSalario: TsCurrencyEdit
                    Left = 245
                    Top = 86
                    Width = 87
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
              object TabSheet5: TsTabSheet
                Caption = 'Dados do Conjug'#234
                ImageIndex = 1
                SkinData.CustomColor = False
                SkinData.CustomFont = False
                object GroupBox9: TsGroupBox
                  Left = 0
                  Top = -5
                  Width = 641
                  Height = 110
                  TabOrder = 0
                  SkinData.SkinSection = 'GROUPBOX'
                  object Label48: TsLabel
                    Left = 340
                    Top = 7
                    Width = 41
                    Height = 13
                    Caption = 'Empresa'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object Label49: TsLabel
                    Left = 10
                    Top = 40
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
                  object Label50: TsLabel
                    Left = 11
                    Top = 7
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
                  object Label51: TsLabel
                    Left = 337
                    Top = 40
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
                  object Label52: TsLabel
                    Left = 8
                    Top = 72
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
                  object Lbcid_emp_conj: TsLabel
                    Left = 400
                    Top = 55
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
                  object Label54: TsLabel
                    Left = 108
                    Top = 72
                    Width = 28
                    Height = 13
                    Caption = 'Cargo'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object PrEmp_Conj: TsEdit
                    Left = 336
                    Top = 19
                    Width = 251
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 40
                    ParentFont = False
                    TabOrder = 1
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrEnd_Emp_Conj: TsEdit
                    Left = 9
                    Top = 51
                    Width = 320
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrCargo_Conj: TsEdit
                    Left = 106
                    Top = 84
                    Width = 159
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 20
                    ParentFont = False
                    TabOrder = 5
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrNom_Conjugue: TsEdit
                    Left = 9
                    Top = 19
                    Width = 320
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrFone_Emp_Conj: TsMaskEdit
                    Left = 8
                    Top = 84
                    Width = 79
                    Height = 21
                    EditMask = '!\(99\)99999-9999;1;_'
                    MaxLength = 14
                    TabOrder = 4
                    Text = '(  )     -    '
                    OnKeyDown = PrFone_Emp_ConjKeyDown
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  end
                  object PrCid_emp_Conj: TsComboEdit
                    Left = 333
                    Top = 51
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
                    OnKeyPress = PrCid_emp_ConjKeyPress
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
                    OnButtonClick = PrCid_emp_ConjButtonClick
                    GlyphMode.Blend = 0
                    GlyphMode.Grayed = False
                  end
                end
              end
              object TabSheet6: TsTabSheet
                Caption = 'Refer'#234'ncias'
                ImageIndex = 2
                SkinData.CustomColor = False
                SkinData.CustomFont = False
                object GroupBox10: TsGroupBox
                  Left = 1
                  Top = 0
                  Width = 317
                  Height = 105
                  Caption = 'Refer'#234'ncia 1'
                  TabOrder = 0
                  SkinData.SkinSection = 'GROUPBOX'
                  object Label55: TsLabel
                    Left = 8
                    Top = 16
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
                  object Label56: TsLabel
                    Left = 8
                    Top = 49
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
                  object Label57: TsLabel
                    Left = 104
                    Top = 49
                    Width = 19
                    Height = 13
                    Caption = 'Obs'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object PrNom_Ref1: TsEdit
                    Left = 8
                    Top = 28
                    Width = 305
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrObs_Ref1: TsEdit
                    Left = 103
                    Top = 61
                    Width = 209
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 30
                    ParentFont = False
                    TabOrder = 2
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrFone_Ref1: TsMaskEdit
                    Left = 8
                    Top = 61
                    Width = 78
                    Height = 21
                    EditMask = '!\(99\)99999-9999;1;_'
                    MaxLength = 14
                    TabOrder = 1
                    Text = '(  )     -    '
                    OnKeyDown = PrFone_Ref1KeyDown
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  end
                end
                object GroupBox11: TsGroupBox
                  Left = 322
                  Top = 1
                  Width = 317
                  Height = 105
                  Caption = 'Refer'#234'ncia 2'
                  TabOrder = 1
                  SkinData.SkinSection = 'GROUPBOX'
                  object Label58: TsLabel
                    Left = 8
                    Top = 16
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
                  object Label59: TsLabel
                    Left = 8
                    Top = 49
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
                  object Label60: TsLabel
                    Left = 104
                    Top = 49
                    Width = 19
                    Height = 13
                    Caption = 'Obs'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object PrNom_Ref2: TsEdit
                    Left = 8
                    Top = 28
                    Width = 305
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
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrObs_Ref2: TsEdit
                    Left = 103
                    Top = 61
                    Width = 209
                    Height = 21
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 30
                    ParentFont = False
                    TabOrder = 2
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  object PrFone_Ref2: TsMaskEdit
                    Left = 8
                    Top = 61
                    Width = 79
                    Height = 21
                    EditMask = '!\(99\)99999-9999;1;_'
                    MaxLength = 14
                    TabOrder = 1
                    Text = '(  )     -    '
                    OnKeyDown = PrFone_Ref2KeyDown
                    OnKeyPress = PrNom_ClienteKeyPress
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
                  end
                end
              end
              object TabSheet7: TsTabSheet
                Caption = 'Dados SPC'
                ImageIndex = 3
                SkinData.CustomColor = False
                SkinData.CustomFont = False
                object GroupBox12: TsGroupBox
                  Left = 1
                  Top = 0
                  Width = 638
                  Height = 105
                  Caption = 'Refer'#234'ncia 1'
                  TabOrder = 0
                  SkinData.SkinSection = 'GROUPBOX'
                  object Label61: TsLabel
                    Left = 8
                    Top = 16
                    Width = 66
                    Height = 13
                    Caption = 'Cadastro.SPC'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object Label62: TsLabel
                    Left = 120
                    Top = 16
                    Width = 63
                    Height = 13
                    Caption = 'Dta.Cad.SPC'
                    ParentFont = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                  end
                  object PrCad_SPC: TComboBox
                    Left = 11
                    Top = 28
                    Width = 57
                    Height = 21
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'N'#227'o'
                    OnEnter = PrCad_SPCEnter
                    OnKeyPress = PrNom_ClienteKeyPress
                    Items.Strings = (
                      'N'#227'o'
                      'Sim')
                  end
                  object PrDta_Cad_SPC: TsDateEdit
                    Left = 120
                    Top = 28
                    Width = 121
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
                    TabOrder = 1
                    Text = '  /  /    '
                    OnKeyDown = PrDta_Cad_SPCKeyDown
                    OnKeyPress = PrNom_ClienteKeyPress
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
          end
        end
        object PrBairro: TsEdit
          Left = 6
          Top = 89
          Width = 193
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
          TabOrder = 8
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrTelefone: TsMaskEdit
          Left = 380
          Top = 89
          Width = 89
          Height = 21
          Color = clWhite
          EditMask = '!\(99\)9999-9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 11
          Text = '(  )    -    '
          OnKeyDown = PrTelefoneKeyDown
          OnKeyPress = PrNom_ClienteKeyPress
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
        end
        object PrCep: TsMaskEdit
          Left = 7
          Top = 19
          Width = 77
          Height = 21
          Color = clWhite
          EditMask = '!99999\-999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 0
          Text = '     -   '
          OnKeyDown = PrCepKeyDown
          OnKeyPress = PrNom_ClienteKeyPress
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
        end
        object PrWHASTAPP: TsMaskEdit
          Left = 6
          Top = 124
          Width = 80
          Height = 21
          Color = clWhite
          EditMask = '!\(99\)99999-9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 15
          Text = '(  )     -    '
          OnKeyDown = PrWHASTAPPKeyDown
          OnKeyPress = PrNom_ClienteKeyPress
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
        end
        object Prcliente_bloqueado: TsCheckBox
          Left = 493
          Top = 161
          Width = 123
          Height = 20
          Caption = 'Cliente Bloqueado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prdesconto_maximo: TsCurrencyEdit
          Left = 463
          Top = 124
          Width = 87
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrLimite: TsCurrencyEdit
          Left = 300
          Top = 124
          Width = 60
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          OnKeyPress = PrNom_ClienteKeyPress
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
        object Prnr_endereco: TsEdit
          Left = 316
          Top = 54
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
          OnKeyPress = PrNom_ClienteKeyPress
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
          Left = 179
          Top = 220
          Width = 122
          Height = 20
          Caption = 'Enviar NF-e por Email'
          TabOrder = 27
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrPRAZO_MAXIMO: TsCurrencyEdit
          Left = 367
          Top = 124
          Width = 87
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          OnKeyPress = PrNom_ClienteKeyPress
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
          DisplayFormat = '0'
        end
        object PrPre_Cadastro: TsCheckBox
          Left = 92
          Top = 220
          Width = 81
          Height = 20
          Caption = 'Pr'#233' Cadastro'
          TabOrder = 26
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object BtBuscaEnd: TsBitBtn
          Left = 91
          Top = 16
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
        object BtBuscaCEP: TsBitBtn
          Left = 193
          Top = 16
          Width = 96
          Height = 27
          Caption = 'Site'
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
          TabOrder = 2
          Visible = False
          OnClick = BtBuscaCEPClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrTip_pessoa: TsEdit
          Left = 313
          Top = 326
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
          TabOrder = 35
          Visible = False
          OnKeyPress = PrNom_ClienteKeyPress
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
        object rgTipoPessoa: TsRadioGroup
          Left = 375
          Top = 241
          Width = 145
          Height = 41
          Caption = 'Tipo de Pessoa'
          ParentBackground = False
          TabOrder = 30
          TabStop = True
          OnClick = rgTipoPessoaClick
          SkinData.SkinSection = 'GROUPBOX'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Jur'#237'dica'
            'F'#237'sica')
        end
        object PrCod_Cidade: TsComboEdit
          Left = 200
          Top = 89
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
          Text = ''
          OnExit = PrCod_CidadeExit
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
        object PrEMAIL_END_NFE: TsEdit
          Left = 376
          Top = 216
          Width = 300
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
          TabOrder = 29
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrEMAIL_ADICIONAL1: TsEdit
          Left = 8
          Top = 249
          Width = 361
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
          TabOrder = 28
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrEMAIL_ADICIONAL2: TsEdit
          Left = 8
          Top = 274
          Width = 361
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
          TabOrder = 32
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrEMAIL_ADICIONAL3: TsEdit
          Left = 8
          Top = 298
          Width = 361
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
          TabOrder = 33
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrCelular: TsMaskEdit
          Left = 476
          Top = 89
          Width = 93
          Height = 21
          Color = clWhite
          EditMask = '!\(99\)99999-9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 14
          ParentFont = False
          TabOrder = 12
          Text = '(  )     -    '
          OnKeyDown = PrTelefoneKeyDown
          OnKeyPress = PrNom_ClienteKeyPress
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
        end
        object PrACEITA_NOTA_SIMPLES: TsCheckBox
          Left = 494
          Top = 177
          Width = 134
          Height = 20
          Caption = 'Aceita NF-e Simples'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object BtnSimples: TsBitBtn
          Left = 651
          Top = 207
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
          TabOrder = 38
          OnClick = BtnSimplesClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnEmail: TsBitBtn
          Left = 271
          Top = 124
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
          TabOrder = 17
          OnClick = BtnEmailClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrConsumidor_Final: TsCheckBox
          Left = 493
          Top = 193
          Width = 116
          Height = 20
          Caption = 'Consumidor Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object btnOperadora: TsBitBtn
          Left = 650
          Top = 88
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
          TabOrder = 14
          OnClick = btnOperadoraClick
          SkinData.SkinSection = 'BUTTON'
        end
        object PrOperadora: TsEdit
          Left = 575
          Top = 89
          Width = 69
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
          TabOrder = 13
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrConstrutora: TsCheckBox
          Left = 5
          Top = 218
          Width = 80
          Height = 20
          Caption = 'Construtora?'
          TabOrder = 25
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrUltConsSerasa: TsDateEdit
          Left = 578
          Top = 21
          Width = 97
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
          TabOrder = 3
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
        object PrDESCONTO_ESPECIAL: TsCurrencyEdit
          Left = 390
          Top = 302
          Width = 57
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          OnKeyPress = PrNom_ClienteKeyPress
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
          DisplayFormat = '0.00%'
        end
        object PrSUSPENSAO_PIS_CONFINS: TsCheckBox
          Left = 390
          Top = 327
          Width = 139
          Height = 20
          Caption = 'Suspens'#227'o do Pis/Cofins'
          TabOrder = 36
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object GroupBox1: TGroupBox
          Left = 526
          Top = 238
          Width = 152
          Height = 55
          Caption = 'Benef'#237'cio Fiscal SC'
          TabOrder = 31
          TabStop = True
          object PrProNautica: TCheckBox
            Left = 16
            Top = 16
            Width = 81
            Height = 17
            Caption = 'Pr'#243'-Na'#250'tica'
            TabOrder = 0
          end
          object PrProEmprego: TCheckBox
            Left = 16
            Top = 36
            Width = 81
            Height = 17
            Caption = 'Pr'#243'-Emprego'
            TabOrder = 1
          end
        end
        object PrSaldo: TsCurrencyEdit
          Left = 588
          Top = 307
          Width = 87
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 37
          OnKeyPress = PrNom_ClienteKeyPress
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
      end
    end
    object tab_perfil: TsTabSheet
      Caption = 'Perfil do Cliente'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox5: TsGroupBox
        Left = 1
        Top = 0
        Width = 641
        Height = 241
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object lbest: TsLabel
          Left = 16
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Estilo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label26: TsLabel
          Left = 472
          Top = 16
          Width = 132
          Height = 13
          Caption = 'Forma de Contato Preferida:'
          ParentFont = False
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label27: TsLabel
          Left = 16
          Top = 55
          Width = 52
          Height = 13
          Caption = 'Manequim:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label28: TsLabel
          Left = 16
          Top = 93
          Width = 42
          Height = 13
          Caption = 'Cal'#231'ado:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label29: TsLabel
          Left = 16
          Top = 132
          Width = 61
          Height = 13
          Caption = 'Cor Preferida'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prestilo: TComboBox
          Left = 12
          Top = 29
          Width = 158
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnKeyPress = PrNom_ClienteKeyPress
          Items.Strings = (
            'Casual'
            'Elegante'
            'Classico'
            'Na Moda'
            'Urbano'
            'Esportivo'
            'B'#225'sico'
            'Sensual')
        end
        object PrContato_preferido: TComboBox
          Left = 468
          Top = 29
          Width = 158
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'E-mail'
          Visible = False
          OnKeyPress = PrNom_ClienteKeyPress
          Items.Strings = (
            'E-mail'
            'Telefone'
            'Correspondencia')
        end
        object PrManequim: TsEdit
          Left = 13
          Top = 68
          Width = 88
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          OnKeyPress = PrNom_ClienteKeyPress
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
        object PrCalcado: TsEdit
          Left = 13
          Top = 106
          Width = 88
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 3
          Text = 'Edit1'
          OnKeyPress = PrNom_ClienteKeyPress
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
        object Prcor_preferida: TsEdit
          Left = 13
          Top = 145
          Width = 308
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 4
          OnKeyPress = PrNom_ClienteKeyPress
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
        object GroupBox13: TsGroupBox
          Left = 13
          Top = 173
          Width = 441
          Height = 52
          Caption = 'Formas de Contato Preferida'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object Prcontato_fone: TsCheckBox
            Left = 7
            Top = 24
            Width = 62
            Height = 20
            TabStop = False
            Caption = 'Telefone'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object Prcontato_email: TsCheckBox
            Left = 143
            Top = 24
            Width = 45
            Height = 20
            TabStop = False
            Caption = 'Email'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object Prcontato_correspondencia: TsCheckBox
            Left = 287
            Top = 26
            Width = 100
            Height = 20
            TabStop = False
            Caption = 'Correspondencia'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
    end
    object TabLimite: TsTabSheet
      Caption = 'Limite de Bonifica'#231#245'es'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object DBGrid6: TDBGrid
        Left = 0
        Top = 0
        Width = 681
        Height = 412
        Align = alClient
        DataSource = dsLimiteBonificacao
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
            FieldName = 'cod_produto'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nom_produto'
            Title.Caption = 'Produto'
            Width = 525
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'limite'
            Title.Alignment = taCenter
            Title.Caption = 'Limite'
            Visible = True
          end>
      end
      object Panel11: TsPanel
        Left = 0
        Top = 412
        Width = 681
        Height = 88
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object gbUF: TsGroupBox
          Left = 10
          Top = 7
          Width = 597
          Height = 41
          Caption = 'Produto'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object DBText1: TDBText
            Left = 79
            Top = 18
            Width = 42
            Height = 13
            AutoSize = True
            DataField = 'nom_produto'
            DataSource = dsLimiteBonificacao
          end
          object edcodproduto: TRxDBComboEdit
            Left = 5
            Top = 15
            Width = 68
            Height = 21
            ClickKey = 120
            DataField = 'cod_produto'
            DataSource = dsLimiteBonificacao
            NumGlyphs = 1
            TabOrder = 0
            OnButtonClick = edcodprodutoButtonClick
            OnExit = edcodprodutoExit
          end
        end
        object Panel12: TsPanel
          Left = 2
          Top = 53
          Width = 677
          Height = 33
          Align = alBottom
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
          object BtNovoBonificacao: TsBitBtn
            Left = 62
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
            OnClick = BtNovoBonificacaoClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtAltBonificacao: TsBitBtn
            Left = 136
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
            OnClick = BtAltBonificacaoClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtGravarBonificacao: TsBitBtn
            Left = 210
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
            OnClick = BtGravarBonificacaoClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtCancBonificacao: TsBitBtn
            Left = 284
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
            OnClick = BtCancBonificacaoClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtExcBonificacao: TsBitBtn
            Left = 359
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
            OnClick = BtExcBonificacaoClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object gbLimite: TsGroupBox
          Left = 609
          Top = 7
          Width = 66
          Height = 41
          Caption = 'Limite'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object RxDBCalcEdit1: TRxDBCalcEdit
            Left = 4
            Top = 15
            Width = 59
            Height = 21
            DataField = 'limite'
            DataSource = dsLimiteBonificacao
            Alignment = taCenter
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
    end
    object TabVisitas: TsTabSheet
      Caption = 'Visitas'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object dgVisitas: TDBGrid
        Left = 0
        Top = 0
        Width = 681
        Height = 256
        Align = alClient
        DataSource = dsVisitas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dgVisitasCellClick
        OnDrawColumnCell = dgVisitasDrawColumnCell
        OnKeyDown = dgVisitasKeyDown
        OnKeyPress = dgVisitasKeyPress
        OnKeyUp = dgVisitasKeyUp
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data'
            Title.Alignment = taCenter
            Width = 97
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Vendeu'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Motivo'
            Title.Alignment = taCenter
            Width = 388
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taCenter
            Width = 112
            Visible = True
          end>
      end
      object sPanel1: TsPanel
        Left = 0
        Top = 256
        Width = 681
        Height = 244
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sPanel2: TsPanel
          Left = 2
          Top = 209
          Width = 677
          Height = 33
          Align = alBottom
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
          object sLabel7: TsLabel
            Left = 608
            Top = 4
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = #192' Enviar'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sLabel8: TsLabel
            Left = 609
            Top = 16
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enviado'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Shape1: TShape
            Left = 652
            Top = 7
            Width = 20
            Height = 10
            Brush.Color = clNavy
          end
          object Shape2: TShape
            Left = 652
            Top = 19
            Width = 20
            Height = 10
            Brush.Color = clGrayText
          end
          object BtNovoVisitas: TsBitBtn
            Left = 153
            Top = 6
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
            OnClick = BtNovoVisitasClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtAlterarVisitas: TsBitBtn
            Left = 229
            Top = 6
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
            OnClick = BtAlterarVisitasClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtSalvarVisitas: TsBitBtn
            Left = 304
            Top = 6
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
            OnClick = BtSalvarVisitasClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtCancelarVisitas: TsBitBtn
            Left = 379
            Top = 6
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
            OnClick = BtCancelarVisitasClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtExcluirVisitas: TsBitBtn
            Left = 454
            Top = 6
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
            OnClick = BtExcluirVisitasClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object gbData: TGroupBox
          Left = 8
          Top = 6
          Width = 113
          Height = 43
          Caption = 'Data'
          TabOrder = 1
          object edDataVisitas: TsDBDateEdit
            Left = 4
            Top = 14
            Width = 105
            Height = 21
            AutoSize = False
            EditMask = '!99/99/9999;1; '
            MaxLength = 10
            TabOrder = 0
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
            DataField = 'Data'
            DataSource = dsVisitas
          end
        end
        object gbValor: TGroupBox
          Left = 562
          Top = 6
          Width = 113
          Height = 43
          Caption = 'Valor'
          TabOrder = 3
          object edValorVisita: TsDBCalcEdit
            Left = 9
            Top = 14
            Width = 94
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
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
            DisplayFormat = '0.00'
            DataSource = dsVisitas
            DataField = 'Valor'
          end
        end
        object gbMotivo: TGroupBox
          Left = 8
          Top = 55
          Width = 667
          Height = 148
          Caption = 'Motivo da N'#227'o Venda'
          TabOrder = 4
          object DBMemo1: TDBMemo
            Left = 5
            Top = 15
            Width = 655
            Height = 128
            DataField = 'Motivo'
            DataSource = dsVisitas
            TabOrder = 0
          end
        end
        object CkVendeu: TDBCheckBox
          Left = 310
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Vendeu?'
          DataField = 'Vendeu'
          DataSource = dsVisitas
          TabOrder = 2
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 538
        Top = 109
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Vendeu'
        DataSource = dsVisitas
        ParentColor = False
        TabOrder = 2
        Visible = False
      end
    end
    object tabNCM: TsTabSheet
      Caption = 'NCM/CEST'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object dbNCM: TDBGrid
        Left = 0
        Top = 0
        Width = 681
        Height = 408
        Align = alClient
        DataSource = dsNCM
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
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
            FieldName = 'NCM'
            Title.Alignment = taCenter
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CEST'
            Title.Alignment = taCenter
            Title.Caption = 'Cest'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCTRIB_ICMS'
            Title.Alignment = taCenter
            Title.Caption = 'Trib. ICMS'
            Width = 232
            Visible = True
          end>
      end
      object sPanel3: TsPanel
        Left = 0
        Top = 408
        Width = 681
        Height = 92
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sPanel4: TsPanel
          Left = 2
          Top = 57
          Width = 677
          Height = 33
          Align = alBottom
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
          object btInsNCM: TsBitBtn
            Left = 153
            Top = 6
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
            OnClick = btInsNCMClick
            SkinData.SkinSection = 'BUTTON'
          end
          object btAltNCM: TsBitBtn
            Left = 229
            Top = 6
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
            OnClick = btAltNCMClick
            SkinData.SkinSection = 'BUTTON'
          end
          object btGravarNCM: TsBitBtn
            Left = 304
            Top = 6
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
            OnClick = btGravarNCMClick
            SkinData.SkinSection = 'BUTTON'
          end
          object btCancNCM: TsBitBtn
            Left = 379
            Top = 6
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
            OnClick = btCancNCMClick
            SkinData.SkinSection = 'BUTTON'
          end
          object btExcNCM: TsBitBtn
            Left = 454
            Top = 6
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
            OnClick = btExcNCMClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object gbNCM: TGroupBox
          Left = 8
          Top = 6
          Width = 141
          Height = 43
          Caption = 'NCM'
          TabOrder = 1
          object edNCM: TDBEdit
            Left = 11
            Top = 14
            Width = 121
            Height = 21
            AutoSize = False
            Color = clWhite
            DataField = 'NCM'
            DataSource = dsNCM
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object gbTribICMS: TGroupBox
          Left = 364
          Top = 6
          Width = 311
          Height = 43
          Caption = 'Trib. ICMS'
          TabOrder = 3
          object edTrib_icms: TDBComboBox
            Left = 7
            Top = 14
            Width = 297
            Height = 21
            Style = csDropDownList
            DataField = 'DESCTRIB_ICMS'
            DataSource = dsNCM
            Items.Strings = (
              '00 - Tributada integralmente'
              '10 - Trib. e com cobran'#231'a de ICMS'
              '20 - com redu'#231#227'o de base de c'#225'lculo'
              '30 - Isento ou n'#227'o tribut. com cobran'#231'a de ICMS'
              '40 - Isenta'
              '41 - N'#227'o tributada'
              '50 - Suspens'#227'o'
              '51 - Diferimento'
              '60 - ICMS cobrado anteriormente por subs. trib.'
              '70 - com redu. da base de c'#225'lculo e cob. do ICMs'
              '90 - Outras')
            TabOrder = 0
            OnChange = edTrib_icmsChange
          end
        end
        object GBCest: TGroupBox
          Left = 200
          Top = 6
          Width = 113
          Height = 43
          Caption = 'CEST'
          TabOrder = 2
          object edCest: TsDBEdit
            Left = 7
            Top = 14
            Width = 99
            Height = 21
            Color = clWhite
            DataField = 'CEST'
            DataSource = dsNCM
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
    Top = 0
    Width = 689
    Height = 129
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 12
      Top = 7
      Width = 83
      Height = 13
      Caption = 'C'#243'digo do Cliente'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 11
      Top = 47
      Width = 78
      Height = 13
      Caption = 'Nome do Cliente'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label3: TsLabel
      Left = 371
      Top = 47
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
    object Label31: TsLabel
      Left = 11
      Top = 88
      Width = 49
      Height = 13
      Caption = 'Vendedor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_representante: TsLabel
      Left = 85
      Top = 108
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
    object PrCod_Cliente: TsEdit
      Left = 10
      Top = 21
      Width = 65
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
    object PrNom_Cliente: TsEdit
      Left = 10
      Top = 60
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 150
      ParentFont = False
      TabOrder = 1
      OnKeyPress = PrNom_ClienteKeyPress
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
    object PrNom_Fantasia: TsEdit
      Left = 371
      Top = 60
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
      OnKeyPress = PrNom_FantasiaKeyPress
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
    object GroupBox2: TsGroupBox
      Left = 466
      Top = 1
      Width = 220
      Height = 49
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object Label15: TsLabel
        Left = 8
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Dta.Cadastro'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label16: TsLabel
        Left = 117
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Dta.1'#170'Compra'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object PrDta_Cad: TsDateEdit
        Left = 8
        Top = 21
        Width = 97
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
      object PrPri_Compra: TsDateEdit
        Left = 116
        Top = 21
        Width = 97
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
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
    object Prid_representante: TsComboEdit
      Left = 11
      Top = 102
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
      OnExit = Prid_representanteExit
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
      OnButtonClick = Prid_representanteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 657
    Width = 689
    Height = 38
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object SpeedButton1: TsSpeedButton
      Left = 8
      Top = 2
      Width = 46
      Height = 31
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
      PopupMenu = PopupMenu1
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtNov: TsBitBtn
      Left = 78
      Top = 5
      Width = 75
      Height = 28
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
      Left = 153
      Top = 5
      Width = 75
      Height = 28
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
      Left = 228
      Top = 5
      Width = 75
      Height = 28
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
      Left = 302
      Top = 5
      Width = 75
      Height = 28
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
      Left = 376
      Top = 5
      Width = 75
      Height = 28
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
      TabOrder = 5
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object q_cliente: TFDQuery
    Connection = dao.CN
    Left = 608
    Top = 517
  end
  object PopupMenu1: TPopupMenu
    TrackButton = tbLeftButton
    Left = 582
    Top = 518
    object RelaodeClientes1: TMenuItem
      Caption = 'Relat'#243'rio de Clientes'
      OnClick = RelaodeClientes1Click
    end
    object EtiquetasparaMalaDireta1: TMenuItem
      Caption = 'Etiquetas para Mala Direta'
      OnClick = EtiquetasparaMalaDireta1Click
    end
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 352
    Top = 8
  end
  object mmLimiteBonificacao: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <>
    Left = 376
    Top = 160
    object mmLimiteBonificacaocod_produto: TIntegerField
      FieldName = 'cod_produto'
    end
    object mmLimiteBonificacaonom_produto: TStringField
      FieldName = 'nom_produto'
      Size = 100
    end
    object mmLimiteBonificacaolimite: TIntegerField
      FieldName = 'limite'
    end
  end
  object dsLimiteBonificacao: TDataSource
    AutoEdit = False
    DataSet = mmLimiteBonificacao
    Left = 424
    Top = 160
  end
  object mmVisitas: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <>
    Left = 376
    Top = 312
    object mmVisitasData: TDateTimeField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmVisitasVendeu: TBooleanField
      FieldName = 'Vendeu'
    end
    object mmVisitasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mmVisitasMotivo: TStringField
      FieldName = 'Motivo'
      Size = 1000
    end
    object mmVisitasENVIADO: TBooleanField
      FieldName = 'ENVIADO'
    end
  end
  object dsVisitas: TDataSource
    AutoEdit = False
    DataSet = mmVisitas
    Left = 408
    Top = 312
  end
  object mmNCM: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <>
    Left = 224
    Top = 304
    object mmNCMNCM: TStringField
      FieldName = 'NCM'
      Size = 11
    end
    object mmNCMCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object mmNCMTRIB_ICMS: TStringField
      FieldName = 'TRIB_ICMS'
      Size = 2
    end
    object mmNCMDESCTRIB_ICMS: TStringField
      FieldName = 'DESCTRIB_ICMS'
      Size = 100
    end
  end
  object dsNCM: TDataSource
    AutoEdit = False
    DataSet = mmNCM
    Left = 312
    Top = 296
  end
end
