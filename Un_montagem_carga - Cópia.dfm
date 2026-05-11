object Fr_montagem_carga: TFr_montagem_carga
  Left = 57
  Top = 32
  BorderIcons = [biSystemMenu]
  Caption = 'Montagem de Carga'
  ClientHeight = 639
  ClientWidth = 1028
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1028
    Height = 639
    ActivePage = tsMDFe
    Align = alClient
    TabOrder = 0
    object tsCarga: TTabSheet
      Caption = '&1) Carga'
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 375
        Width = 1020
        Height = 87
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object dgCarga: TDBGrid
          Left = 2
          Top = 15
          Width = 1016
          Height = 70
          Align = alClient
          DataSource = dsCarga2
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dgCargaDrawColumnCell
          OnDblClick = dgCargaDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Pedido'
              Title.Caption = 'N'#186' Pedido'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MDFE'
              Title.Alignment = taCenter
              Title.Caption = 'NF-e'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Title.Caption = 'Cliente'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
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
              Expanded = False
              FieldName = 'PESO'
              Title.Alignment = taCenter
              Title.Caption = 'Peso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRETE_COMBINADO'
              Title.Alignment = taCenter
              Title.Caption = 'FC'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Check'
              Width = 20
              Visible = True
            end>
        end
        object CheckPedido: TDBCheckBox
          Left = 88
          Top = 151
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'Check'
          DataSource = dsCarga2
          ParentColor = False
          TabOrder = 1
          Visible = False
        end
      end
      object GroupBox3: TsGroupBox
        Left = 0
        Top = 462
        Width = 1020
        Height = 130
        Align = alBottom
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object Label5: TsLabel
          Left = 9
          Top = 44
          Width = 54
          Height = 13
          Caption = 'Valor Total:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label6: TsLabel
          Left = 8
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Peso Total:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label10: TsLabel
          Left = 9
          Top = 71
          Width = 27
          Height = 13
          Caption = 'Frete:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbperc_frete: TsLabel
          Left = 169
          Top = 71
          Width = 42
          Height = 13
          Caption = '              '
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Btgra: TsBitBtn
          Left = 890
          Top = 23
          Width = 124
          Height = 25
          Caption = 'Gravar Carga'
          Enabled = False
          TabOrder = 0
          OnClick = BtgraClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btcan: TsBitBtn
          Left = 890
          Top = 47
          Width = 124
          Height = 25
          Caption = 'Abandonar Carga'
          Enabled = False
          TabOrder = 1
          OnClick = btcanClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Btimp_separacao_itens: TsBitBtn
          Left = 328
          Top = 88
          Width = 145
          Height = 33
          TabOrder = 2
          OnClick = Btimp_separacao_itensClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Btimp_form_carga: TsBitBtn
          Left = 472
          Top = 88
          Width = 141
          Height = 33
          TabOrder = 3
          OnClick = Btimp_form_cargaClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btloc: TsBitBtn
          Left = 890
          Top = 81
          Width = 124
          Height = 26
          Caption = 'Localizar Carga'
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
          TabOrder = 4
          OnClick = btlocClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Prtot_peso: TsCurrencyEdit
          Left = 66
          Top = 12
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
          TabOrder = 5
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
        object Prtot_carga: TsCurrencyEdit
          Left = 66
          Top = 40
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
          TabOrder = 6
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
        object Prtot_frete: TsCurrencyEdit
          Left = 66
          Top = 67
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
          TabOrder = 7
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
      object SBcarga: TStatusBar
        Left = 0
        Top = 592
        Width = 1020
        Height = 19
        Panels = <
          item
            Width = 400
          end
          item
            Width = 50
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 135
        Width = 1020
        Height = 240
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object sbFiltro: TsSpeedButton
          Left = 915
          Top = 14
          Width = 89
          Height = 27
          Caption = 'Filtrar'
          Enabled = False
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00004B
            00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00
            5D9A5E98DAAC3FA52B2A8300004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF004B005D9A5E98DAAC3FA52B2A8300004B00FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF004B005D9A5E98DAAC3FA52B2A8300004B00FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B005D9A5E98DAAC3FA5
            2B2A8300004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00
            5D9A5E98DAAC3FA52B2A8300004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF004B0032A54B2EBB551CA92F149110004F00FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF004B00189D3323C5531AB64111A72D0A9A1A03810800
            4E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF004B001DA5392DD35E21C25018B23D10A5
            28099816038B07007700004E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0023AC4036E16A2ACF5B
            1FBF4D16B0390EA324079613028805008100007600004E00FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0028B44541
            EF7634DD6728CC591DBB4915AD350DA02106920F018603008100008100007600
            004E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B
            0028B54549FB803EEB7331D96426C9561CB84513AB300C9D1D05900D00830100
            8100008100008100007600004E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF004B0028B5454BFE8247F87E3BE76F2FD76223C55319B64111A72C0A9A
            19048E0A008200008100008100008100008100007600004E00FF00FFFF00FFFF
            00FFFF00FFFF00FF004B001E9E3434CC591E9E341C9A3110801E076A0F05670D
            04640A036006015D04005A01005800005800005E00006600006600007300006F
            00004E00FF00FFFF00FFFF00FF004B00004B00004B0000580000620001690203
            76080786120A8C1BC0F3F800D7F400D7F400D7F40D5A6428BD4C20A5391E9E34
            1488230C7315004B00004B00004B00FF00FF004B00005800007600008100C47B
            00C47B00C47B00C47B000A9A1A0FA42815AD35C0F3F800D7F400D7F400D7F40D
            5A6445F67B4BFE824BFE824BFE824BFE8234CC59055E08004B00FF00FF004B00
            005100C47B00E6C65BE3C152E0B73BDAAB1FC47B000FA42815AD351BB845C0F3
            F800D7F400D7F400D7F40D5A6433CC581E9E3419932BFF78FF004B00004B00FF
            00FFFF00FFFF00FFFF00FFB88F55EFDC98EDD78AE7C966E0B83BC47B00004B00
            004B00004B00004B00C0F3F800D7F40D5A64004B00004B00004B00FF78FFFF78
            FF760376FF00FFFF00FFFF00FFFF00FFFF00FFB88F55F8F2D4F6E9BDEDD78AE3
            C153C47B00FF00FFFF00FFFF00FFFF00FFFF00FF54E6F7FF00FFFF00FFFF00FF
            FAD5FAFF78FFFC00FC760376760376FF00FFFF00FFFF00FFFF00FFB88F55FFFF
            FFF8F2D4EFDC98E5C65BC47B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFAD5FAFAD5FAFC00FCFC00FCFC00FC760376760376FF00FFFF00FF
            FF00FFFF00FFB88F55B88F55B88F55C47B00FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFAD5FAFAD5FAFC00FC760376760376FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFAD5FAFF78
            FF760376FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF78FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = sbFiltroClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sLabel1: TsLabel
          Left = 13
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Pedido N'#176':'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label8: TsLabel
          Left = 357
          Top = 11
          Width = 267
          Height = 26
          Caption = 
            'Ex.: 5340;5320 => Para filtrar os pedidos 5340 e 5320'#13#10'       53' +
            '40-5350 => Para filtrar os Pedidos 5340 at'#233' 5350.'
          ParentFont = False
          WordWrap = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sGroupBox1: TsGroupBox
          Left = 7
          Top = 43
          Width = 226
          Height = 191
          Caption = 'Representantes'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object dgRep: TDBGrid
            Left = 2
            Top = 15
            Width = 222
            Height = 174
            Align = alClient
            DataSource = dsRep
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dgRepDrawColumnCell
            OnDblClick = dgRepDblClick
            OnKeyPress = dgRepKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 162
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Check'
                Width = 20
                Visible = True
              end>
          end
        end
        object sGroupBox2: TsGroupBox
          Left = 234
          Top = 43
          Width = 79
          Height = 191
          Caption = 'Estado'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object dgEstado: TDBGrid
            Left = 2
            Top = 15
            Width = 75
            Height = 174
            Align = alClient
            DataSource = dsUF
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dgEstadoDrawColumnCell
            OnDblClick = dgEstadoDblClick
            OnKeyPress = dgEstadoKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'UF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Check'
                Width = 20
                Visible = True
              end>
          end
        end
        object sGroupBox3: TsGroupBox
          Left = 315
          Top = 43
          Width = 226
          Height = 191
          Caption = 'Meso-Regi'#227'o'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object dgMeso: TDBGrid
            Left = 2
            Top = 15
            Width = 222
            Height = 174
            Align = alClient
            DataSource = dsMeso
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dgMesoDrawColumnCell
            OnDblClick = dgMesoDblClick
            OnKeyPress = dgMesoKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 162
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Check'
                Width = 20
                Visible = True
              end>
          end
          object CheckMeso: TDBCheckBox
            Left = 51
            Top = 118
            Width = 15
            Height = 17
            Color = clWhite
            DataField = 'Check'
            DataSource = dsMeso
            ParentColor = False
            TabOrder = 1
            Visible = False
          end
        end
        object sGroupBox4: TsGroupBox
          Left = 543
          Top = 43
          Width = 235
          Height = 191
          Caption = 'Micro-Regi'#227'o'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object dgMicro: TDBGrid
            Left = 2
            Top = 15
            Width = 231
            Height = 174
            Align = alClient
            DataSource = dsMicro
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dgMicroDrawColumnCell
            OnDblClick = dgMicroDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 171
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Check'
                Width = 20
                Visible = True
              end>
          end
          object CheckMicro: TDBCheckBox
            Left = 19
            Top = 126
            Width = 15
            Height = 17
            Color = clWhite
            DataField = 'Check'
            DataSource = dsMicro
            ParentColor = False
            TabOrder = 1
            Visible = False
          end
        end
        object sGroupBox5: TsGroupBox
          Left = 783
          Top = 43
          Width = 235
          Height = 191
          Caption = 'Cidades'
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object dgCidade: TDBGrid
            Left = 2
            Top = 15
            Width = 231
            Height = 174
            Align = alClient
            DataSource = dsCidades
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dgCidadeDrawColumnCell
            OnDblClick = dgCidadeDblClick
            OnKeyPress = dgCidadeKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Check'
                Width = 20
                Visible = True
              end>
          end
          object CheckCidades: TDBCheckBox
            Left = 19
            Top = 126
            Width = 15
            Height = 17
            Color = clWhite
            DataField = 'Check'
            DataSource = dsCidades
            ParentColor = False
            TabOrder = 1
            Visible = False
          end
        end
        object gbDtIni: TsGroupBox
          Left = 663
          Top = 4
          Width = 116
          Height = 41
          Caption = 'Data Inicial'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object ftDtIni: TsDateEdit
            Left = 5
            Top = 14
            Width = 106
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
            OnKeyPress = Prdta_cargaKeyPress
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
        object gbDtFim: TsGroupBox
          Left = 784
          Top = 4
          Width = 116
          Height = 41
          Caption = 'Data Final'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object ftDtFim: TsDateEdit
            Left = 5
            Top = 14
            Width = 106
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
            OnKeyPress = Prdta_cargaKeyPress
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
        object CheckRep: TDBCheckBox
          Left = 88
          Top = 151
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'Check'
          DataSource = dsRep
          ParentColor = False
          TabOrder = 7
          Visible = False
        end
        object CheckUF: TDBCheckBox
          Left = 264
          Top = 191
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'Check'
          DataSource = dsUF
          ParentColor = False
          TabOrder = 8
          Visible = False
        end
        object edPedido: TsEdit
          Left = 70
          Top = 14
          Width = 280
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
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
      object GroupBox1: TsGroupBox
        Left = 0
        Top = 0
        Width = 1020
        Height = 135
        Align = alTop
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object Label1: TsLabel
          Left = 96
          Top = 11
          Width = 45
          Height = 13
          Caption = 'N'#186' carga:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label2: TsLabel
          Left = 312
          Top = 10
          Width = 74
          Height = 13
          Caption = 'Nome da Carga'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label3: TsLabel
          Left = 355
          Top = 49
          Width = 46
          Height = 13
          Caption = 'Motorista:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbnom_motorista: TsLabel
          Left = 422
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
        object Label7: TsLabel
          Left = 209
          Top = 11
          Width = 54
          Height = 13
          Caption = 'Data Carga'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbnom_veiculo: TsLabel
          Left = 168
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
        object Label9: TsLabel
          Left = 96
          Top = 48
          Width = 38
          Height = 13
          Caption = 'Veiculo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object LbNom_transportadora: TsLabel
          Left = 630
          Top = 69
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
          Left = 560
          Top = 47
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
        object sLabel2: TsLabel
          Left = 954
          Top = 10
          Width = 53
          Height = 13
          Caption = 'UF Destino'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbempresa_faturamento: TsLabel
          Left = 168
          Top = 103
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
        object Label35: TsLabel
          Left = 97
          Top = 86
          Width = 89
          Height = 13
          Caption = 'Empresa Emissora:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object BtcriaCarga: TsBitBtn
          Left = 3
          Top = 38
          Width = 88
          Height = 76
          Caption = 'Criar '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF097711097711097711097711FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF06770CFFFFFF0EA41B0EA51C0EA51C097711FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06770CFFFFFF0EA41B0EA5
            1C0EA51C097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06770C
            FFFFFF0EA41B0EA51C0EA51C097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF06770DFFFFFF0EA41B0EA51C0EA51C097711FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF08780EFFFFFF10A61F0EA51B0EA51B097711FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780EFFFFFF17AB2911A8
            2111A821097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF09771109771109771109771109771109771108780E
            FFFFFF1DB13218AD2A18AD2A08780E0977110977110977110977110977110977
            11FF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF52DD7E4CD87546D46D41
            CF663CCC5F36C65529BA4324B53B1FB13319AC2B1BB02F17AC2812A8210EA51C
            0EA51B0EA51B0EA51B097711FF00FFFF00FFFF00FFFF00FF097711FFFFFF52DD
            7E4CD87546D46D41CF663CCC5F36C65530BE4C2BBA4426B63D20B2361BB02F17
            AC2812A8210EA51C0EA51B0EA51C0EA51C097711FF00FFFF00FFFF00FFFF00FF
            097711FFFFFF56E08551DA7C4CD67546D26D42CE663CC95E37C55631C04F2CBC
            4827B74022B4381EB03219AC2B13A8230FA41D0EA31B0EA41B097711FF00FFFF
            00FFFF00FFFF00FF097711FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF38C55833C1512EBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF097711FF00FFFF00FFFF00FFFF00FFFF00FF09771109771109771109771109
            771109771108780EFFFFFF3FCC633BC95C3BC95C08780E097711097711097711
            097711097711097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF46D36E42D06842D068097711FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF4DD87749D5
            7149D571097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711
            FFFFFF54DD8150DB7B50DB7B097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF097711FFFFFF59E28957E1855EE890097711FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF097711FFFFFF5AE38A5CE58C5EE890097711FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF097711FFFFFFFFFFFFFFFF
            FFFFFFFF097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            097711097711097711097711FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          TabOrder = 0
          OnClick = BtcriaCargaClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Prid: TsEdit
          Left = 96
          Top = 24
          Width = 92
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = PridKeyPress
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
        object Prnom_carga: TsEdit
          Left = 308
          Top = 24
          Width = 640
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyPress = Prnom_cargaKeyPress
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
        object Prid_motorista: TsComboEdit
          Left = 352
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
          TabOrder = 5
          Text = ''
          OnExit = Prid_motoristaExit
          OnKeyPress = Prid_motoristaKeyPress
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
          OnButtonClick = Prid_motoristaButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prdta_carga: TsDateEdit
          Left = 194
          Top = 24
          Width = 106
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
          OnKeyPress = Prdta_cargaKeyPress
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
        object Prid_veiculo: TsComboEdit
          Left = 96
          Top = 62
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
          OnExit = Prid_veiculoExit
          OnKeyPress = Prid_veiculoKeyPress
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
          OnButtonClick = Prid_veiculoButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prcod_transportadora: TsComboEdit
          Left = 560
          Top = 61
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
        object PRuf_destino: TsEdit
          Left = 954
          Top = 24
          Width = 40
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
          TabOrder = 7
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
          Left = 96
          Top = 100
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
          TabOrder = 8
          Text = ''
          OnChange = Prcod_empresaChange
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
      end
    end
    object tsMDFe: TTabSheet
      Caption = 'MDFe'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 28
      object sGroupBox6: TsGroupBox
        Left = 67
        Top = 6
        Width = 227
        Height = 42
        Caption = 'Chave N'#176
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object PrChave_MDFe: TsEdit
          Left = 6
          Top = 14
          Width = 214
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
      object sGroupBox7: TsGroupBox
        Left = 295
        Top = 6
        Width = 110
        Height = 42
        Caption = 'N'#176' Recibo'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object PrRECIBO_MDFE: TsEdit
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
      object sGroupBox8: TsGroupBox
        Left = 611
        Top = 6
        Width = 110
        Height = 42
        Caption = 'N'#176' Protocolo'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object PrPROTOCOLO_MDFE: TsEdit
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
      object sGroupBox9: TsGroupBox
        Left = 723
        Top = 6
        Width = 174
        Height = 42
        Caption = 'Data Recebimento'
        Enabled = False
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        object PrDATA_REC_MDFE: TDateTimePicker
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
      object sGroupBox10: TsGroupBox
        Left = 67
        Top = 54
        Width = 782
        Height = 42
        Caption = 'Motivo'
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object PrMotivo_MDFE: TsEdit
          Left = 6
          Top = 14
          Width = 771
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
      object sGroupBox11: TsGroupBox
        Left = 8
        Top = 54
        Width = 57
        Height = 42
        Caption = 'Situa'#231#227'o'
        TabOrder = 5
        SkinData.SkinSection = 'GROUPBOX'
        object PrStatus_MDFE: TsEdit
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
      object gbCancNFeMDFE: TsGroupBox
        Left = 8
        Top = 102
        Width = 841
        Height = 76
        Caption = 'Cancelamento Justificativa'
        TabOrder = 6
        SkinData.SkinSection = 'GROUPBOX'
        object LBsTATUSCANCEL_: TsLabel
          Left = 509
          Top = 49
          Width = 324
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prazo Limite para o Cancelamento: 15/12/2010 10:00:00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object PrJUSTIF_CANC_MDFE: TsEdit
          Left = 6
          Top = 14
          Width = 827
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
        object BtnEnviarCancelamentoMDFE: TsBitBtn
          Left = 284
          Top = 41
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
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnEditarCancelamentoMDFE: TsBitBtn
          Left = 173
          Top = 41
          Width = 100
          Height = 28
          Caption = 'Editar'
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
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnSairCancelamentoMDFE: TsBitBtn
          Left = 395
          Top = 41
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
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sGroupBox12: TsGroupBox
        Left = 8
        Top = 6
        Width = 57
        Height = 42
        Caption = 'N'#186' MDFe'
        TabOrder = 7
        SkinData.SkinSection = 'GROUPBOX'
        object PrMDFE: TsEdit
          Left = 6
          Top = 14
          Width = 44
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
      object btnMDFE: TsBitBtn
        Left = 372
        Top = 184
        Width = 129
        Height = 44
        Caption = 'MDFe'
        Enabled = False
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
        TabOrder = 8
        OnClick = btnMDFEClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btRecXml_Dev: TsBitBtn
        Left = 283
        Top = 245
        Width = 100
        Height = 28
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
        TabOrder = 9
        Visible = False
        SkinData.SkinSection = 'BUTTON'
      end
      object BtnDaMDFe: TsBitBtn
        Left = 395
        Top = 246
        Width = 100
        Height = 28
        Caption = 'DAMDFe'
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
        TabOrder = 10
        SkinData.SkinSection = 'BUTTON'
      end
      object BtnEmailMDFe: TsBitBtn
        Left = 507
        Top = 246
        Width = 100
        Height = 28
        Caption = 'Email MDFe'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        TabOrder = 11
        SkinData.SkinSection = 'BUTTON'
      end
      object sGroupBox13: TsGroupBox
        Left = 407
        Top = 6
        Width = 202
        Height = 42
        Caption = 'Digest Value'
        TabOrder = 12
        SkinData.SkinSection = 'GROUPBOX'
        object PrDIGEST_MDFE: TsEdit
          Left = 6
          Top = 14
          Width = 190
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
      object PrEntradaNaoDevolucao: TCheckBox
        Left = 520
        Top = 200
        Width = 117
        Height = 17
        Caption = 'N'#227'o '#233' Devolu'#231#227'o?'
        TabOrder = 13
      end
    end
  end
  object q_carga1: TFDQuery
    Connection = dao.CN
    Left = 896
    Top = 273
  end
  object Q_carga2: TFDQuery
    Connection = dao.CN
    Left = 880
    Top = 201
  end
  object MainMenu1: TMainMenu
    Left = 616
    Top = 65528
    object FecharCarga1: TMenuItem
      Caption = 'Fechar Carga'
      OnClick = FecharCarga1Click
    end
  end
  object fr_relatorio: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40124.577814571800000000
    ReportOptions.LastChange = 42889.929153067130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fr_relatorioGetValue
    Left = 872
    Top = 24
    Datasets = <
      item
        DataSet = Dm.dst_carga
        DataSetName = 'dst_carga'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 24.677180000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Left = 575.488560000000000000
          Top = 41.574830000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Left = 3.779530000000000000
          Top = 27.559060000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Formul'#225'rio de Carga')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 50.472480000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome Carga:')
          ParentFont = False
        end
        object dst_cargaNOM_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 95.488250000000000000
          Top = 51.133890000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."ID"]/ [dst_carga."NOM_CARGA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 410.850650000000000000
          Top = 53.133890000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object dst_cargaDTA_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 461.764070000000000000
          Top = 52.472480000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'DTA_CARGA'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."DTA_CARGA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Veiculo:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 67.031540000000000000
          Top = 71.811070000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_VEICULO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 70.811070000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Motorista:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 323.819110000000000000
          Top = 70.811070000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_MOTORISTA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 91.267780000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Transportadora:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 114.724490000000000000
          Top = 91.267780000000000000
          Width = 257.008040000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_TRANSPORTADORA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 191.535560000000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 285.244280000000000000
          Top = 124.724490000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 618.842920000000000000
          Top = 124.944960000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 99.047310000000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' MDFe')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_carga
        DataSetName = 'dst_carga'
        RowCount = 0
        object dst_cargaID_PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Width = 90.708720000000000000
          Height = 15.118110236220500000
          DataField = 'NUMDOC'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."NUMDOC"]')
          ParentFont = False
        end
        object dst_cargaDTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 190.976500000000000000
          Width = 86.929190000000000000
          Height = 15.118110236220500000
          DataField = 'DTADOC'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."DTADOC"]')
          ParentFont = False
        end
        object dst_cargaNOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 282.905690000000000000
          Width = 325.039580000000000000
          Height = 15.118110236220500000
          DataField = 'NOM_CLIENTE'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_CLIENTE"]')
          ParentFont = False
        end
        object dst_cargaTOT_LIQUIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_carga."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 95.267780000000000000
          Width = 90.708720000000000000
          Height = 15.118110236220500000
          DataField = 'MDFE'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."MDFE"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 434.645950000000000000
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
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 113.385900000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031850000000000000
          Top = 6.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr Total:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
          Top = 6.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr Frete:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 6.779530000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Peso:')
          ParentFont = False
        end
        object dst_cargaTOT_FRETE: TfrxMemoView
          AllowVectorExport = True
          Left = 232.551330000000000000
          Top = 6.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."TOT_FRETE"]')
          ParentFont = False
        end
        object dst_cargaTOT_PESO: TfrxMemoView
          AllowVectorExport = True
          Left = 376.512060000000000000
          Top = 6.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."TOT_PESO"]')
          ParentFont = False
        end
        object dst_cargaTOT_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 614.842920000000000000
          Top = 6.779530000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_carga."TOT_LIQUIDO">,MasterData1)]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 86.929190000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ass Conferente')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 6.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qtd. Notas:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 92.708720000000000000
          Top = 6.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 2.897650000000000000
          Top = 3.574830000000000000
          Width = 712.440944880000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object rd_vendas: TRDprint
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
    OpcoesPreview.PreviewZoom = 95
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
    CaptionSetup = 'CONFIGURA'#199#195'O'
    TitulodoRelatorio = 'Pedido'
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
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 96
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 932
    Top = 64
  end
  object mmRep: TRxMemoryData
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
    Left = 48
    Top = 264
    object mmRepID: TIntegerField
      FieldName = 'ID'
    end
    object mmRepNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmRepCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsRep: TDataSource
    DataSet = mmRep
    Left = 120
    Top = 264
  end
  object mmUF: TRxMemoryData
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
    Left = 200
    Top = 328
    object mmUFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmUFCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsUF: TDataSource
    DataSet = mmUF
    Left = 128
    Top = 320
  end
  object mmMeso: TRxMemoryData
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
    Left = 64
    Top = 320
    object mmMesoID: TIntegerField
      FieldName = 'ID'
    end
    object mmMesoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMesoCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMeso: TDataSource
    DataSet = mmMeso
    Left = 65528
    Top = 344
  end
  object mmMicro: TRxMemoryData
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
    Left = 664
    Top = 352
    object mmMicroID: TIntegerField
      FieldName = 'ID'
    end
    object mmMicroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMicroCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMicro: TDataSource
    DataSet = mmMicro
    Left = 768
    Top = 360
  end
  object dsCidades: TDataSource
    DataSet = mmCidades
    Left = 960
    Top = 304
  end
  object mmCidades: TRxMemoryData
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
    Left = 872
    Top = 320
    object mmCidadesID: TIntegerField
      FieldName = 'ID'
    end
    object mmCidadesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmCidadesCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object mmCarga2: TRxMemoryData
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
    Left = 328
    Top = 360
    object mmCarga2Pedido: TIntegerField
      FieldName = 'Pedido'
    end
    object mmCarga2DATA: TDateField
      FieldName = 'DATA'
    end
    object mmCarga2CLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object mmCarga2VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmCarga2PESO: TFloatField
      FieldName = 'PESO'
      DisplayFormat = '#,###,##0.00'
    end
    object mmCarga2FRETE_COMBINADO: TBooleanField
      FieldName = 'FRETE_COMBINADO'
    end
    object mmCarga2Check: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmCarga2NFE: TStringField
      FieldName = 'NFE'
    end
  end
  object dsCarga2: TDataSource
    DataSet = mmCarga2
    Left = 376
    Top = 368
  end
  object ACBrMDFe1: TACBrMDFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 460
    Top = 72
  end
  object ACBrMDFeDAMDFEFR1: TACBrMDFeDAMDFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
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
    ImprimeHoraSaida = False
    TipoDAMDFe = tiSemGeracao
    TamanhoPapel = tpA4
    Cancelada = False
    Encerrado = False
    ImprimeDadosExtras = [deValorTotal, deRelacaoDFe]
    SelecionaImpressora = False
    EspessuraBorda = 1
    Left = 844
    Top = 72
  end
  object q_xml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.xml'
      'FROM carga1 a'
      'where a.id = :id')
    Left = 720
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
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
end
