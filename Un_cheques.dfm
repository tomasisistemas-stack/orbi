object Fr_Emissao_cheques: TFr_Emissao_cheques
  Left = 207
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Cheques'
  ClientHeight = 627
  ClientWidth = 851
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
  object pc_cheque: TsPageControl
    Left = 0
    Top = 0
    Width = 851
    Height = 627
    ActivePage = tab_localizar
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_localizar: TsTabSheet
      Caption = 'Localizar'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 0
        Width = 843
        Height = 112
        Align = alTop
        Caption = 'Relatorio de Cheques'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object GroupBox3: TsGroupBox
          Left = 6
          Top = 14
          Width = 416
          Height = 91
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object Label16: TsLabel
            Left = 10
            Top = 12
            Width = 56
            Height = 13
            Caption = 'Data Inicial:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label17: TsLabel
            Left = 133
            Top = 13
            Width = 51
            Height = 13
            Caption = 'Data Final:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label1: TsLabel
            Left = 12
            Top = 52
            Width = 51
            Height = 13
            Caption = 'Conta C.C:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object lbl_conta_corrente: TsLabel
            Left = 80
            Top = 72
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
            Left = 243
            Top = 12
            Width = 55
            Height = 13
            Caption = 'N'#186' Cheque:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label12: TsLabel
            Left = 179
            Top = 52
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
          object zzconta_corrente: TsComboEdit
            Left = 10
            Top = 65
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
            OnExit = zzconta_correnteExit
            OnKeyPress = zzconta_correnteKeyPress
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
            OnButtonClick = zzconta_correnteButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object zzdta_inicial: TsDateEdit
            Left = 6
            Top = 25
            Width = 109
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
            Text = '01/01/2000'
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
            Date = 36526.000000000000000000
          end
          object zzdta_final: TsDateEdit
            Left = 129
            Top = 25
            Width = 104
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
            Text = '01/01/2099'
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
            Date = 72686.000000000000000000
          end
          object zznr_cheque: TsEdit
            Left = 239
            Top = 25
            Width = 117
            Height = 21
            Color = clWhite
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
          object zzHistorico: TsEdit
            Left = 178
            Top = 65
            Width = 231
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
        end
        object GroupBox5: TsGroupBox
          Left = 623
          Top = 17
          Width = 98
          Height = 78
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object quitado: TsRadioButton
            Left = 8
            Top = 10
            Width = 57
            Height = 20
            Caption = 'Quitado'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
          end
          object todos: TsRadioButton
            Left = 8
            Top = 56
            Width = 50
            Height = 20
            Caption = 'Todos'
            Checked = True
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            TabStop = True
            SkinData.SkinSection = 'CHECKBOX'
          end
          object nao_quitado: TsRadioButton
            Left = 8
            Top = 24
            Width = 80
            Height = 20
            Caption = 'N'#227'o Quitado'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
          end
          object cancelados: TsRadioButton
            Left = 8
            Top = 39
            Width = 76
            Height = 20
            Caption = 'Cancelados'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
          end
        end
        object BitBtn9: TsBitBtn
          Left = 736
          Top = 15
          Width = 89
          Height = 30
          Caption = 'Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B000000000000000000007F7E7E5B5D5D
            646B75CA9998FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFACA8A73B70A21F77B9768295CF9996FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF6392B23DA3FE278DEF1D74B37F8394D19A97FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4EB5FC5ABDFF41A3FF278DEF2076
            B37D8293CF9997FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF35A0FE53B9FE
            5BBDFE41A4FF268CED1E74B17C8294D09A97FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF34A0FE54BAFE5BBCFF3FA2FF258BEB1F74B1858593D29A97FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF35A0FE53B9FE59BBFE3FA2FF268CEC22
            75B0828493D09A98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF35A0FE54BA
            FE5ABCFF40A3FF248BEA1D74B1808291FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF35A0FE56BBFE5ABBFF38A1FF3487D556666FFF00FFFF00FF9F6F
            6DB38B85C8A79BD2B3A5D3AFA4CDA09CC69292FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF35A1FE50B8FF7AC6FCC0CCD89E9C9A
            816B6CAF8E83E2D4B8FAF8D5FFFFDAFFFFDBFFFFDAFCF8D6ECDDC4CAA399FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFEEE9E4C6ACADC9A895FDF5CBFFFFD7FFFFDBFFFFDAFFFFD9FFFFDAFFFFDC
            FFFFDFFCF9DFD0B2A9A77775FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFC5ABA9CBA596FCECBFFDEBBDFDF6CEFFFFDAFFFFD9FF
            FFDAFFFFDEFFFFE2FFFFE8FFFFFFFEFEFDC4A5A1FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0918CF3DFB8FBE3B1F6D9ABFDF5
            CDFFFFDAFFFFD9FFFFDDFFFFE8FFFFF2FFFFF7FFFFFFFFFFFFF3ECD8A47873FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7B5A3FFEFBF
            F5D09DF5D2A3FDF3CBFFFFDAFFFFDAFFFFE0FFFFEFFFFFFBFFFFFCFFFFF8FFFF
            EDFFFFDFBFA293FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4
            9292E7CDB1FFEDBAF1C490F4CB9BFBEDC3FFFFD9FFFFDAFFFFE0FFFFEEFFFFF9
            FFFFFBFFFFF2FFFFE2FFFFE1D8C6AEC49192FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFC79795EFD8B6FEEBB9F0BF8AF1C28FF8E0B3FEFBD3FFFFDAFF
            FFDDFFFFE5FFFFEEFFFFEFFFFFE7FFFFDEFFFFDFE3D7BABB9A8EFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFC79795EED7B5FFEEBCF1C18CEFB984F4CE
            9DFBECC2FFFED7FFFFDBFFFFDDFFFFE0FFFFE1FFFFDDFFFFDAFFFFDEE2D5B9BB
            9A8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC49192E6CBAFFFF3C1
            F5CD99EFBD87F2C995F6D8A9FBEEC4FFFDD6FFFFDBFFFFDAFFFFDAFFFFDAFFFF
            D9FFFFDDD6C2AAC49192FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFD4B0A0FFF1C1FCEABCF7DDB1F4CF9CF3CF9CF6D7A8FAE7BCFEF7CFFFFDD7
            FFFFD9FFFFD9FFFFD8FFFED7BB9A8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFBD8E8CF0DCB6FFFCDCFEF9F0FBEED9F4CF9FF2CB96F3
            CA98F7DAACF9E6BAFAEBC1FCF1C8FFFED0EDE1C0A17572FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC29C8EFBF7E5FFFFFFFFFF
            FFF9E2BBF2C996EFB883F0C08DF3CA98F7DAAAFFEFBEFAF0C6BE998FFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            BE9E98F5F0E8FFFFF3FFF5CFFCE7B4F9DDAAF9DDAAFCE6B3FFF0BEF5E3BCC59F
            94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFA67E77D5BEA5F5E4BCFCEDC0FDEFC1FCEDC1F7E5BD
            E5C7AEC49691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAF847FC39B90CC
            A699CEA49BCA9B98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn9Click
          SkinData.SkinSection = 'BUTTON'
        end
        object CBTOTDIA: TsCheckBox
          Left = 721
          Top = 49
          Width = 112
          Height = 20
          Caption = 'Totaliza'#231#227'o por Dia'
          TabOrder = 3
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object BitBtn1: TsBitBtn
          Left = 736
          Top = 71
          Width = 89
          Height = 26
          Caption = 'Imprimir Relat'#243'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtn1Click
          SkinData.SkinSection = 'BUTTON'
        end
        object rgORDEM: TsRadioGroup
          Left = 535
          Top = 11
          Width = 87
          Height = 91
          Caption = 'Ordem'
          ParentBackground = False
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          ItemIndex = 0
          Items.Strings = (
            'Emiss'#227'o'
            'Vencimento'
            'N'#186' Cheque'
            'Valor'
            'Nominal'
            'Conta')
        end
        object GroupBox4: TsGroupBox
          Left = 423
          Top = 32
          Width = 111
          Height = 48
          Caption = 'Buscar Por:'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object dta_vencimento: TsRadioButton
            Left = 7
            Top = 11
            Width = 102
            Height = 20
            Caption = 'Data Vencimento'
            Checked = True
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            TabStop = True
            SkinData.SkinSection = 'CHECKBOX'
          end
          object dta_emissao: TsRadioButton
            Left = 7
            Top = 26
            Width = 85
            Height = 20
            Caption = 'Data Emiss'#227'o'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
          end
        end
      end
      object Panel2: TsPanel
        Left = 0
        Top = 112
        Width = 843
        Height = 481
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        DragCursor = crNo
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object gdCheques: TDBGrid
          Left = 2
          Top = 2
          Width = 839
          Height = 477
          Align = alClient
          Color = clWhite
          DataSource = dsCheques
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
          OnDrawColumnCell = gdChequesDrawColumnCell
          OnDblClick = gdChequesDblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NR_CHEQUE'
              Title.Caption = 'N'#186' Cheque'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DTA_EMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'Emiss'#227'o'
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DTA_VENCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Vencimento'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMINAL'
              Title.Caption = 'Nominal'
              Width = 225
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_CONTA'
              Title.Caption = 'Conta'
              Width = 225
              Visible = True
            end>
        end
      end
    end
    object tab_dados: TsTabSheet
      Caption = 'Dados Cheque'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TsGroupBox
        Left = 1
        Top = 0
        Width = 745
        Height = 169
        Caption = 'Dados Cheque'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Lbnom_cc: TsLabel
          Left = 76
          Top = 38
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
        object Label2: TsLabel
          Left = 10
          Top = 64
          Width = 41
          Height = 13
          Caption = 'Nominal:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label3: TsLabel
          Left = 444
          Top = 63
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
        object Label4: TsLabel
          Left = 8
          Top = 20
          Width = 51
          Height = 13
          Caption = 'Conta C.C:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label5: TsLabel
          Left = 262
          Top = 20
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
        object Label6: TsLabel
          Left = 335
          Top = 20
          Width = 55
          Height = 13
          Caption = 'N'#186' Cheque:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label7: TsLabel
          Left = 482
          Top = 20
          Width = 68
          Height = 13
          Caption = 'Data Emiss'#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label8: TsLabel
          Left = 601
          Top = 20
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
        object Label9: TsLabel
          Left = 10
          Top = 104
          Width = 41
          Height = 13
          Caption = 'Hist'#243'rico'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label10: TsLabel
          Left = 514
          Top = 103
          Width = 72
          Height = 13
          Caption = 'Data Quitacao:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prid: TsEdit
          Left = 584
          Top = 80
          Width = 41
          Height = 21
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
        object Prcod_conta_corrente: TsComboEdit
          Left = 6
          Top = 33
          Width = 66
          Height = 21
          AutoSize = False
          TabOrder = 1
          Text = ''
          OnExit = Prcod_conta_correnteExit
          OnKeyPress = Prcod_conta_correnteKeyPress
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
          OnButtonClick = Prcod_conta_correnteButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object zznr_banco: TsEdit
          Left = 260
          Top = 33
          Width = 65
          Height = 21
          TabOrder = 2
          OnKeyPress = zznr_bancoKeyPress
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
        object Prnr_cheque: TsEdit
          Left = 330
          Top = 33
          Width = 143
          Height = 21
          MaxLength = 20
          TabOrder = 3
          OnExit = Prnr_chequeExit
          OnKeyPress = zznr_bancoKeyPress
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
        object Prdta_emissao: TsDateEdit
          Left = 479
          Top = 33
          Width = 112
          Height = 21
          AutoSize = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          ReadOnly = True
          TabOrder = 4
          Text = '  /  /    '
          OnKeyPress = zznr_bancoKeyPress
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
        object PrDta_vencimento: TsDateEdit
          Left = 598
          Top = 33
          Width = 112
          Height = 21
          AutoSize = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          ReadOnly = True
          TabOrder = 5
          Text = '  /  /    '
          OnKeyPress = zznr_bancoKeyPress
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
        object Prnominal: TsEdit
          Left = 6
          Top = 77
          Width = 425
          Height = 21
          MaxLength = 50
          TabOrder = 6
          OnKeyPress = zznr_bancoKeyPress
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
        object Prvalor: TsCurrencyEdit
          Left = 440
          Top = 76
          Width = 101
          Height = 21
          AutoSize = False
          TabOrder = 7
          OnKeyPress = zznr_bancoKeyPress
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
        object Prhistorico: TsEdit
          Left = 6
          Top = 117
          Width = 425
          Height = 21
          MaxLength = 60
          TabOrder = 8
          OnKeyPress = zznr_bancoKeyPress
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
        object Prquitado: TsCheckBox
          Left = 448
          Top = 119
          Width = 62
          Height = 19
          TabStop = False
          Caption = 'Quitado'
          TabOrder = 9
          OnClick = PrquitadoClick
          OnKeyPress = Prcod_conta_correnteKeyPress
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prdta_quitacao: TsDateEdit
          Left = 511
          Top = 116
          Width = 112
          Height = 21
          AutoSize = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          ReadOnly = True
          TabOrder = 10
          Text = '  /  /    '
          OnKeyPress = zznr_bancoKeyPress
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
        object PrExtrato: TsEdit
          Left = 656
          Top = 80
          Width = 41
          Height = 21
          TabOrder = 11
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
        object PrCancelado: TsCheckBox
          Left = 648
          Top = 119
          Width = 76
          Height = 19
          TabStop = False
          Caption = 'Cancelado'
          TabOrder = 12
          OnClick = PrquitadoClick
          OnKeyPress = Prcod_conta_correnteKeyPress
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object Panel1: TsPanel
        Left = 2
        Top = 169
        Width = 745
        Height = 41
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Btnov: TsBitBtn
          Left = 4
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
          TabOrder = 0
          OnClick = BtnovClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btalt: TsBitBtn
          Left = 86
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
          TabOrder = 1
          OnClick = btaltClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btgra: TsBitBtn
          Left = 168
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
          TabOrder = 2
          OnClick = btgraClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btcan: TsBitBtn
          Left = 250
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
          Left = 332
          Top = 5
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
        object BtLocalizar: TsBitBtn
          Left = 472
          Top = 5
          Width = 79
          Height = 31
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
        object BtnImprimir: TsBitBtn
          Left = 608
          Top = 6
          Width = 124
          Height = 29
          Caption = 'Imprimir Cheque'
          TabOrder = 6
          OnClick = BtnImprimirClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
  end
  object Q_cheques: TFDQuery
    Connection = dao.CN
    Left = 776
    Top = 16
  end
  object fr_relatorio: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40131.640360046300000000
    ReportOptions.LastChange = 40549.472863553240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fr_relatorioGetValue
    Left = 336
    Top = 65520
    Datasets = <
      item
        DataSet = Dm.dst_cheques_emitidos
        DataSetName = 'dst_cheque_emitidos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 38.118120000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de Cheques Emitidos entre:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 38.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtaini]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 38.118120000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 38.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtafin]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 7.559059999999999000
          Width = 517.795610000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.897650000000000000
        ParentFont = False
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        DataSet = Dm.dst_cheques_emitidos
        DataSetName = 'dst_cheque_emitidos'
        RowCount = 0
        object dst_cheque_emitidosNR_CHEQUE: TfrxMemoView
          AllowVectorExport = True
          Width = 52.913385830000000000
          Height = 15.118120000000000000
          DataField = 'NR_CHEQUE'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cheque_emitidos."NR_CHEQUE"]')
          ParentFont = False
        end
        object dst_cheque_emitidosDTA_EMISSAO: TfrxMemoView
          AllowVectorExport = True
          Left = 55.936995670000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'DTA_EMISSAO'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_cheque_emitidos."DTA_EMISSAO"]')
          ParentFont = False
        end
        object dst_cheque_emitidosDTA_VENCIMENTO1: TfrxMemoView
          AllowVectorExport = True
          Left = 123.212586220000000000
          Width = 64.251968500000000000
          Height = 15.118120000000000000
          DataField = 'DTA_VENCIMENTO'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_cheque_emitidos."DTA_VENCIMENTO"]')
          ParentFont = False
        end
        object dst_cheque_emitidosHISTORICO: TfrxMemoView
          AllowVectorExport = True
          Left = 567.709030000000000000
          Width = 472.441250000000000000
          Height = 15.118120000000000000
          DataField = 'HISTORICO'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cheque_emitidos."HISTORICO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 273.259842519685000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          DataField = 'NOMINAL'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cheque_emitidos."NOMINAL"]')
          ParentFont = False
        end
        object dst_cheque_emitidosVALOR: TfrxMemoView
          AllowVectorExport = True
          Left = 189.976500000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_cheque_emitidos."VALOR"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 472.441250000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 1046.929810000000000000
        Condition = 'dst_cheque_emitidos."NOM_CONTA"'
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clNavy
          Memo.UTF8W = (
            'Conta Corrente:')
          ParentFont = False
        end
        object dst_cheque_emitidosNOM_CONTA: TfrxMemoView
          AllowVectorExport = True
          Left = 112.606370000000000000
          Width = 929.764380000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_CONTA'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clNavy
          Memo.UTF8W = (
            '[dst_cheque_emitidos."NOM_CONTA"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        Condition = 'dst_cheque_emitidos."DTA_VENCIMENTO"'
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Data Vencimento:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677179999999990000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'N'#186' Chq.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 55.913420000000000000
          Top = 22.677179999999990000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dta Emis.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 123.165430000000000000
          Top = 22.677179999999990000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt. Vcto.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 190.196970000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 567.929499999999900000
          Top = 22.677179999999990000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
        object dst_cheque_emitidosDTA_VENCIMENTO: TfrxMemoView
          AllowVectorExport = True
          Left = 119.724490000000000000
          Width = 922.205320000000000000
          Height = 18.897650000000000000
          DataField = 'DTA_VENCIMENTO'
          DataSet = Dm.dst_cheques_emitidos
          DataSetName = 'dst_cheque_emitidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            '[dst_cheque_emitidos."DTA_VENCIMENTO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 273.126160000000000000
          Top = 22.677179999999990000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nominal')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            
              'Valor Total Dia: [SUM(<dst_cheque_emitidos."VALOR">,MasterData1)' +
              ']')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 3.779530000000022000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = []
          Fill.BackColor = clNavy
          HAlign = haRight
          Memo.UTF8W = (
            
              'Valor Total por Conta: [SUM(<dst_cheque_emitidos."VALOR">,Master' +
              'Data1)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 4.000000000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clWhite
          Frame.Typ = []
          Fill.BackColor = clRed
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Geral: [SUM(<dst_cheque_emitidos."VALOR">,MasterData1,2)]')
          ParentFont = False
        end
      end
    end
  end
  object RDIMPCHQ: TRDprint
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
    OpcoesPreview.PreviewZoom = 100
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
    CaptionSetup = 'Rdprint Setup'
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
    TamanhoQteLinhas = 24
    TamanhoQteColunas = 80
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnAfterPrint = RDIMPCHQAfterPrint
    Left = 780
    Top = 56
  end
  object dsCheques: TDataSource
    DataSet = mmCheques
    Left = 384
    Top = 168
  end
  object mmCheques: TRxMemoryData
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
    Left = 336
    Top = 168
    object mmChequesID: TIntegerField
      FieldName = 'ID'
    end
    object mmChequesNR_CHEQUE: TIntegerField
      FieldName = 'NR_CHEQUE'
    end
    object mmChequesVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmChequesDTA_EMISSAO: TDateField
      FieldName = 'DTA_EMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmChequesDTA_VENCIMENTO: TDateField
      FieldName = 'DTA_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmChequesNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 100
    end
    object mmChequesNOM_CONTA: TStringField
      FieldName = 'NOM_CONTA'
      Size = 100
    end
    object mmChequesCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Size = 1
    end
    object mmChequesQUITADO: TStringField
      FieldName = 'QUITADO'
      Size = 1
    end
  end
end
