object Fr_montagem_carga: TFr_montagem_carga
  Left = 57
  Top = 32
  BorderIcons = [biSystemMenu]
  Caption = 'Montagem de Carga'
  ClientHeight = 741
  ClientWidth = 1029
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
  object PageControl1: TPageControl
    Left = 0
    Top = 141
    Width = 1029
    Height = 537
    ActivePage = tsCarga
    Align = alClient
    TabOrder = 0
    object tsCarga: TTabSheet
      Caption = 'Carga'
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 220
        Width = 1021
        Height = 174
        Align = alClient
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object CheckPedido: TDBCheckBox
          Left = 88
          Top = 151
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'Check'
          DataSource = dsCarga2
          ParentColor = False
          TabOrder = 0
          Visible = False
        end
        object CheckEntregue: TDBCheckBox
          Left = 104
          Top = 151
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'ENTREGUE'
          DataSource = dsCarga2
          ParentColor = False
          TabOrder = 3
          Visible = False
        end
        object CheckOutros: TDBCheckBox
          Left = 2
          Top = 151
          Width = 15
          Height = 17
          Color = clWhite
          DataField = 'Check'
          DataSource = dsCargaOutros
          ParentColor = False
          TabOrder = 2
          Visible = False
        end
        object pcPedidos: TPageControl
          Left = 2
          Top = 15
          Width = 1017
          Height = 157
          ActivePage = Pedidos
          Align = alClient
          TabOrder = 1
          object Pedidos: TTabSheet
            Caption = 'Pedidos'
            object dgCarga: TDBGrid
              Left = 0
              Top = 0
              Width = 1009
              Height = 105
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
                  FieldName = 'NFE'
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
                  FieldName = 'ENTREGUE'
                  Title.Alignment = taCenter
                  Title.Caption = 'En'
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
            object pnSelecionadosRodape: TPanel
              Left = 0
              Top = 105
              Width = 1009
              Height = 24
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object ckSelecionarTodos: TCheckBox
                Left = 856
                Top = 6
                Width = 105
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Selecionar Todos'
                TabOrder = 0
                OnClick = ckSelecionarTodosClick
              end
            end
          end
          object tabOutrasCargas: TTabSheet
            Caption = 'Outras Cargas'
            ImageIndex = 1
            TabVisible = False
            object dgCargaOutros: TDBGrid
              Left = 0
              Top = 0
              Width = 1009
              Height = 105
              Align = alClient
              DataSource = dsCargaOutros
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = dgCargaOutrosDrawColumnCell
              OnDblClick = dgCargaOutrosDblClick
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
                  FieldName = 'NFE'
                  Title.Alignment = taCenter
                  Title.Caption = 'NF-e'
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLIENTE'
                  Title.Caption = 'Cliente'
                  Width = 368
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
                  FieldName = 'COD_CARGA'
                  Title.Alignment = taCenter
                  Title.Caption = 'N'#186' Carga'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOM_CARGA'
                  Title.Caption = 'Nome da Carga'
                  Width = 276
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Check'
                  Width = 20
                  Visible = True
                end>
            end
            object pnOutrosRodape: TPanel
              Left = 0
              Top = 105
              Width = 1009
              Height = 24
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object btTransferirOutros: TsBitBtn
                Left = 771
                Top = 4
                Width = 100
                Height = 20
                Caption = 'Transferir'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333FF3333333333333744333333333333F773333333333337
                  44473333333333F777F3333333333744444333333333F7733733333333374444
                  4433333333F77333733333333744444447333333F7733337F333333744444444
                  433333F77333333733333744444444443333377FFFFFFF7FFFFF999999999999
                  9999733777777777777333CCCCCCCCCC33333773FF333373F3333333CCCCCCCC
                  C333333773FF3337F333333333CCCCCCC33333333773FF373F3333333333CCCC
                  CC333333333773FF73F33333333333CCCCC3333333333773F7F3333333333333
                  CCC333333333333777FF33333333333333CC3333333333333773}
                NumGlyphs = 2
                TabOrder = 0
                OnClick = btTransferirOutrosClick
                SkinData.SkinSection = 'BUTTON'
              end
              object ckSelecionarTodosOutros: TCheckBox
                Left = 877
                Top = 6
                Width = 105
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Selecionar Todos'
                TabOrder = 1
                OnClick = ckSelecionarTodosOutrosClick
              end
            end
          end
        end
      end
      object GroupBox3: TsGroupBox
        Left = 0
        Top = 394
        Width = 1021
        Height = 115
        Align = alBottom
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object Label5: TsLabel
          Left = 7
          Top = 63
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
          Left = 6
          Top = 35
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
          Left = 7
          Top = 90
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
        object Prtot_peso: TsCurrencyEdit
          Left = 64
          Top = 31
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
          DisplayFormat = '0.00'
        end
        object Prtot_carga: TsCurrencyEdit
          Left = 64
          Top = 59
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
        object Prtot_frete: TsCurrencyEdit
          Left = 64
          Top = 86
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
        object gbSeguro: TGroupBox
          Left = 188
          Top = 21
          Width = 828
          Height = 87
          Caption = 'Dados Seguro'
          TabOrder = 3
          object Label4: TLabel
            Left = 282
            Top = 21
            Width = 85
            Height = 13
            Caption = 'CNPJ Seguradora'
          end
          object Label11: TLabel
            Left = 400
            Top = 21
            Width = 86
            Height = 13
            Caption = 'Nome Seguradora'
          end
          object Label12: TLabel
            Left = 162
            Top = 21
            Width = 92
            Height = 13
            Caption = 'CNPJ Respons'#225'vel'
          end
          object Label13: TLabel
            Left = 654
            Top = 21
            Width = 35
            Height = 13
            Caption = 'Ap'#243'lice'
          end
          object Label14: TLabel
            Left = 740
            Top = 21
            Width = 67
            Height = 13
            Caption = 'N'#186' Averba'#231#227'o'
          end
          object PrResponsavelSeguro: TsRadioGroup
            Left = 11
            Top = 19
            Width = 142
            Height = 57
            Caption = 'Respons'#225'vel pelo Seguro'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            ItemIndex = 0
            Items.Strings = (
              'Emitente'
              'Tomador do Servi'#231'o')
          end
          object PrCNPJSeguradora: TsMaskEdit
            Left = 282
            Top = 37
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
            TabOrder = 2
            Text = '  .   .   /    -  '
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
          object PrNomeSeguradora: TsEdit
            Left = 400
            Top = 37
            Width = 251
            Height = 21
            TabOrder = 3
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object PrCNPJResponsavel: TsMaskEdit
            Left = 163
            Top = 37
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
            TabOrder = 1
            Text = '  .   .   /    -  '
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
          object PrApoliceSeguro: TsCurrencyEdit
            Left = 655
            Top = 37
            Width = 79
            Height = 21
            AutoSize = False
            TabOrder = 4
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
            DisplayFormat = '### ### ##0;-### ### ##0;0'
          end
          object PrNumAberbacao: TsCurrencyEdit
            Left = 738
            Top = 37
            Width = 79
            Height = 21
            AutoSize = False
            TabOrder = 5
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
            DisplayFormat = '### ### ##0;-### ### ##0;0'
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1021
        Height = 220
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object sbFiltro: TsSpeedButton
          Left = 927
          Top = 10
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
          Left = 293
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
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object dgRep: TDBGrid
            Left = 2
            Top = 36
            Width = 222
            Height = 153
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
          object edRep: TEdit
            Left = 2
            Top = 15
            Width = 222
            Height = 21
            Align = alTop
            TabOrder = 1
            OnChange = edRepChange
          end
        end
        object sGroupBox2: TsGroupBox
          Left = 234
          Top = 43
          Width = 79
          Height = 191
          Caption = 'Estado'
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object dgEstado: TDBGrid
            Left = 2
            Top = 36
            Width = 75
            Height = 153
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
          object edUF: TEdit
            Left = 2
            Top = 15
            Width = 75
            Height = 21
            Align = alTop
            TabOrder = 1
            OnChange = edUFChange
          end
        end
        object sGroupBox3: TsGroupBox
          Left = 315
          Top = 43
          Width = 226
          Height = 191
          Caption = 'Meso-Regi'#227'o'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object dgMeso: TDBGrid
            Left = 2
            Top = 36
            Width = 222
            Height = 153
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
          object edMeso: TEdit
            Left = 2
            Top = 15
            Width = 222
            Height = 21
            Align = alTop
            TabOrder = 2
            OnChange = edMesoChange
          end
        end
        object sGroupBox4: TsGroupBox
          Left = 543
          Top = 43
          Width = 235
          Height = 191
          Caption = 'Micro-Regi'#227'o'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object dgMicro: TDBGrid
            Left = 2
            Top = 36
            Width = 231
            Height = 153
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
          object edMicro: TEdit
            Left = 2
            Top = 15
            Width = 231
            Height = 21
            Align = alTop
            TabOrder = 2
            OnChange = edMicroChange
          end
        end
        object sGroupBox5: TsGroupBox
          Left = 783
          Top = 43
          Width = 235
          Height = 191
          Caption = 'Cidades'
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object dgCidade: TDBGrid
            Left = 2
            Top = 36
            Width = 231
            Height = 153
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
          object edCidades: TEdit
            Left = 2
            Top = 15
            Width = 231
            Height = 21
            Align = alTop
            TabOrder = 2
            OnChange = edCidadesChange
          end
        end
        object gbDtIni: TsGroupBox
          Left = 682
          Top = 4
          Width = 116
          Height = 41
          Caption = 'Data Inicial'
          TabOrder = 1
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
          Left = 803
          Top = 4
          Width = 116
          Height = 41
          Caption = 'Data Final'
          TabOrder = 2
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
          TabOrder = 8
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
          TabOrder = 9
          Visible = False
        end
        object edPedido: TsEdit
          Left = 68
          Top = 14
          Width = 219
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
        object ckSomenteNfes: TCheckBox
          Left = 575
          Top = 18
          Width = 97
          Height = 17
          Caption = 'Somente NFes'
          TabOrder = 10
        end
      end
    end
    object tsMDFe: TTabSheet
      Caption = 'MDFe'
      ImageIndex = 1
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
          OnChange = PrJUSTIF_CANC_MDFEChange
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
            180000000000A0050000C40E0000C40E00000000000000000000FFFFFFFDFDFD
            FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
            FEFEFEFFFFFFDBDACBD2CFC0FFFFFFFEFEFFFDFFFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFFFFFFFFFFFFC8C3A87D6A218D8142F4F5F4FFFFFFFDFFFDFEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFFFFFFF2F1EFD2D1CCACA99B6C5E248E7B318D7948FF
            FFFFFFFEFEFEFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C8A77124C1E037B5C7AA188365B
            394642148E7D3BFBFBF9FFFFFFFDFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFAFBCB286A1805DBBCA
            FEFFFFFFFFFFCCBA82667A3034360F968348E0DDC9F8F8F7FFFFFFFEFFFEFFFF
            FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFF66
            8760ABD4D3A1DEE5FFFEFBD4CB97B79F47B99349818F3F3F431591752C7F6819
            ACA37FFFFFFFFFFFFFFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
            FFFDFFFFFFFFFF728C6C9FD8E0DBF0F4F6F3E5CBB24DD4BB5BC4AA52C29C4E6B
            7934645C2DA798467D641DEBE9E1FFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFFFFFDFFFFFFFFFF81987C9DD2DCE3F6FDF9F1DED4B553BDA7
            67B0A37CA79852C0A44F3A551E9E8845978231B2A887FFFFFFFEFDFDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFFFFFF80967EADE1F1D1E0C1
            F5D769F1DF89F4F4E2E5CF82DFD8BCA99B5A928B45565423A2873BA59B69FFFF
            FFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFF87
            A286C7DDD1D4DB7FFFEC79FEEE98E4E0CEDCCC90C8BA92BDAC80AE9544445A23
            A59247978B45E1E1DAFFFFFFFEFEFEFEFFFFFFFFFFFFFFFFFFFDFEFFFFFFEBE7
            D3E2D89DFFFDF983924FD6D369FFF784FFF889FDF181F3F3E2DDD090EAD476E9
            EBE4A98743576C29927F41A38E407D6A2AFDFFFFFFFFFFFEFFFFFFFFFFFFFFFF
            FFFFFFBFAE6DC4A549D1B24BEACB67D2BD607A8E3EFBEE85E7E17DECE279EFDD
            79EDE9C2EDE7CCD0C5A3C3A34C838F416358289A7F3A7F622B91825BFFFFFFFE
            FFFFFFFFFFEBEBEAFFFFFFBFAD75BEA74CE3D586E5CF6CFFF8A4859B69F5F898
            EDE170FDFEA1F6EC8EF8DF6DE9CE6BC6A44CD2BA5D8D96435A5625A78D478061
            21796A33FFFFFFFEFFFFFFFFFFC5C5C5DFDFDED3D8E19A916DF1F2F7BFAF65F8
            FCFFF6F3E3DFE4E4EFE7B6F9F4B4EEEFF3E2C756E4CB5ECEB05BCCB257818F37
            5448139F7F2BACA67CFDFEFAFFFFFFFFFFFFFFFFFFF2F2F2BCBCBCCECECEDCD8
            D7BFBDABD6CA95DFDDCAFFF6C9CCBD5FFAFCFFFBE994FCFDFEF6F0DBEBE4C3BD
            A540C1A151648356A6B5A796AEA1FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
            A6A6A6B5B5B5FCFDFFCBC5C3E4DDC8B3A56FFFFEFFE2C87BFFFFFFAEB774FFFF
            EBCABFAEAD9962E0D3B7E6EEDA667D6155A9B6EAEAEDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFD8D8D8BFBFBFFFFFFFE6E6E7E7E8EDC8C2A7C9C7B8DCD8D5
            FFFEFF8E956B7A8E779FB4A39CB8A78EAE92043D1728727E9DB0B3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
            E7D9A0831EB1A561FFFFFFFFFFFFFFFFFFADB8A58298818F9E9193A9B1EAEBED
            FFFFFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFDFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
          ParentFont = False
          TabOrder = 1
          OnClick = BtnEnviarCancelamentoMDFEClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnEditarCancelamentoMDFE: TsBitBtn
          Left = 178
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
          OnClick = BtnEditarCancelamentoMDFEClick
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
        Left = 374
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
          46170000424D461700000000000036000000280000002F000000290000000100
          18000000000010170000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFEFBFEFEFAFEFFFEFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFBFBFCFFFFFFFDFCFDFFFDFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFABAB99FFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCFFFEFFFFFDFCFBFEFFFFFFFFFFF2F1D9564D16EFE8DAFFFFFFFCFB
          FCFFFEFEFFFEFFFAFFFFFEFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEFEFCFFFFFFFFFCD5
          D2BA746932807228AEA680FFFFFBFFFFFFFCFFFEFFFFFEFEFFFDFEFFFFFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFD
          FEFEFEFDFCFDFDFEFEFBFBF8908963806E25937D3886753985782F8D8556FFFF
          FFFCFDFFFDFDFFFFFEFDFDFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFDFDFDFFFFFFFFFFFFFFFFFFC3BDA181
          6F2D97883A9087399283357E6E2EA2947AFFFFFFFAFDFFFFFDFEFEFFFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFFFFFFFFFF
          FFFFFFCBD0CEB6B6AFC2C5CADCDDDE5F5845635C2F8D7A3E8F8144806B267D65
          31EEEBD6FAFFFFFFFFFFFFFEFEFFFFFEFFFEFFFFFEFFFFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFAFEFBF3F9F7FFFFFF919F92002A00003A00014E09003E0000240000
          1C00263925645026725F259B8C4B88762EEAE8D3F9FDFFFFFCFEFFFDFEFCFFF9
          FBFEFEFEFEFFFEFFFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFCFFFFFFFF5C6556003300
          7EA978076C5C1AAFB0A5EDECE0FFF1B1D4AB3C6E3C0E2D05514B216963308574
          31C4BB9BFFFFFFFCFFFBFDFFFFFEFEFEFDFFFFFEFEFFFEFFFFFFFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFEFE
          FEFCFFFFFFFFFF96A7A4002F00E9FAE36A98A41EA9BBDEFFFFFFFFFFFFFBFFFF
          FFFFD4D2A96C8B2E163F1036321777632A7C6C3AD3CDB8FFFFFFFFFEFFFCFEFC
          FCFFFDFBFDFCFEFEFEFFFFFDFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDFFFFFFFFFFFFFFFFFDFEFEFBFFFFFFFFFF002800B4D6AFDCE8F1
          00898ED4FEFEFFFFFAF6FBFDF9FDFFF8F4EC967C38B6A451A0A5522C5A1F3633
          19745C258C7C2E9C965CEBE8D2FFFFFFFFFFFFFFFFFFFCFBFCFFFFFDFEFEFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFEFDFD
          FEFFFFFF9DB7A4285D27FFFFFF549FA95FC7D1FFFFFFFBF8FCFEFFFFFFFFFFD2
          C899AF9842A47E45AF8C4894903F325614363E1C856F328F7A347C67297D662E
          95844A968D5CFFFFFCFBFEFFFBFDFCFEFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFEFFFEF9FBFBFFFFFF426542A4C39CFFFFFF12878C
          BDF4F9FFFEFFFEFFFFD8D4B4CFC084B1A54BC3AE54BFA254A78B40BAA352A3AA
          56275212584A2772682AB29450A38B3D89752D7D6928BFBB9FFFFFFFFAFEFDFE
          FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFEFFFEFBFD
          FDFFFFFF133F14EFF7E9EEFDFF0C8E95F9FFFFFDFAFBFFFFFFDCCF8FCDAE4EC5
          B153C7AC59C4B055B79F4CBA9958C2A6539697460D31006C5D32968543A0953C
          9C8F438C7033736126EAE9DBFFFFFFFFFFFFFFFEFFFFFFFFFFFFFEFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFEFFFFFDFFFEFFFFFC134715FFFFFFC7DFE236A7B1
          FFFFFFF7FCFDFFFFFCC5BA73D1BA5DD3BD60D4B960C4B355D3BB659E8037B494
          49C0A4587E97462735117D6A399E94459D8D42A48C49846B22AFA783FFFFFFFE
          FEFEFDFCFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFFFEFFFFFDFF
          FFE6EDE4265327FFFFFFADCFD54FB4BAFFFFFFF8FCFEFFFFFFD1C484DCC266E0
          C264DCC265D3BB69B69848CFB963B99C4EAE9043AF974A3A6224544C278D7F3D
          AB954D9B8F3F88742F7E6D36FDFCF7FFFFFEFDFDFFFFFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFFFDFFFEFEFFFEFCFFFDEDF2EB2B592DFFFFFFB8D4DE5EBBC0
          FFFFFFFAFDFFFFFFF8DFC987CDAB4FC6AC4F9E853E8670469B8C59857E3DA18D
          3ECCB361C4A856929549123A05836C3BA595489D8F40A78D45725E20E4DFCFFE
          FFFDFDFBFEFDFFFDFEFEFDFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFDFEFFFEFDFF
          FEF9FDF8305C36FFFFFFBCDFE34CB3B2FFFFFFF6F8E0F1DCA6E9C85DEED86ED6
          CA8FF9FDF4FFFFFFFFFCFBF2FBF2AEAF93806B29B5A656C1A252406E2A505128
          8E8038B1994A9F893F7B6622C3BDA2FFFFFFFFFBFEFFFDFFFFFCFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFFFDFEFFFEFCFEFCFFFFFF2C512FFFFFFFE2F9FF3B9BA6
          FFFFEEEACE6CEFDA69F8DD7AE5D36DFFFCF2F7F5E9D6C869CAAE55C8B270F9F6
          ECCDCFC0777232BB94449A94531B370C866D379F893E927A3797863CB5B08AFF
          FFFFFDFFFBFEFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFEFFFEFCFE
          FDFFFFFF2B5831F5FCF2FCFFFF29949DEBF0AFFFE272F9E578F9E37CF5DE7BFF
          FFFCCBC698F3D56AEED076D1AE4FDBC682F1E7B5BFAD5ECEBC68B09150355A1E
          605128978845AC955097873BB3A984FEFFFFFAFBFFFBFEFFFEFDFEFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFEFDFCFCFFFFFF6B8972C3D4B9FFFFFF599E9D
          E7E587FFEF7EFFEA7EFEE883F9E576FFFFEEDDD5C2C0B37ACBBE79B8A972A794
          63A18D5DA38C57967B37BCA15179923F3243198A7B3AA79A4B9E8D3D978D53C0
          C3A7FFFFFFFFFFFFFFFEFDFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFFFDFEFEFEFEFCFCFCF8FEFDFFFFFDFDFFFCFFFFF9FA
          FBFFFFFFA1AF95587F30FFEC93D4D586F9EF7DFAEF81FFF084FAEC85FCED7BF8
          F5CCFFFFFFFAFDECFFFFF4FFFFF3FFFFF6F3F7F2FAF9F8866C3CB49948B0B257
          203F11826E34A79C4DA2914497883E7B6B27C5BCACFFFFFFFDFFFDFEFEFEFEFE
          FEFFFFFFFEFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFDFDFEFDF9
          FFFFFFFFFFE0D9B7DDD198EFEECBFCFFFFFFFFF9BAAC69215306FFFA92EAD36E
          FFF888FEF288FEF386FBF787FFEF7FEEE895FFFFFFB4B075F2D36DE5D16AE1C4
          57D3C67EFAFDFE8C7D51BB9654B8A753254D15736433A29148A792459A8B4496
          7939797334EEF2E3FFFDFFFEFFFFFEFEFEFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFCFAFDFFFFFFE4E1C3D9CA99C6B75CDFC657D4BD6DD8C5
          9DEFE499FFF18A1F4201D4DE82EFE776FAFA89FFFB8EFCF789FBFA8AFFF28DFA
          EE82F2E8BBFFFFFFB5AF79D4C463E4C665E4DAA6FCFDFF877940C09C52C6A74F
          3C67235450259C8648A68D40A18B459D8345766122958B62FFFFFFFCFEFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFCFDFEFFFFFFD4D09FBA
          A44DCDB053CFB65DC8A552D7BA55F5CE6AD6B958E7C96B878C4C648637ECD776
          E4D576DED374EDE584DBD173E1D476E2D16FE0CB63F2E6ABFFFFF8E9E8DDECF0
          E8FFFFFFCCC2AB97823AD2B55ED3B35D678639394219836B3291773094793985
          72318C693D6E581BB1AA96FFFFFFFEFEFEFFFFFFFFFFFF000000FFFFFFFFFEFF
          FEFEFEFFFEFEFBFEFFFFFFFDA08A45B79243BA9B48C6A956E1C866E2D070E8D1
          72F2E17CFFEA7DD2B76C163C00F4F89AFFFA8CFFF896D6CE68FFFB91FCFB87FF
          F789FDF083FAE47AE7DE7CF3E49AEDDFA9C8B575C4A850C8AE57C8B45BC6AC59
          7E94412F3C13917C439A813C90783E816B2F89693B826B2DA08F70FFFFFFFDFE
          FEFFFFFFFDFFFF000000FFFFFFFFFFFFF9F9F9FFFFFFFCFDFBFFFFFEBEB377BA
          A24FD2BF5AD6C15BCDBD56DDC965F3D66EF3DE70F4E06FFFF68C526A24708E3D
          FFFE86FDF984E9E379FCF98BF3F689F2EC7BF5E980FCEB7CF8DF78F1D76AEACF
          6AD0B152D3B45BCFB55DC6B558C9AC588297402A3B1187743AA18341A18D478E
          743C886A367462208F805CFFFFFFFFFFFFFFFFFFFDFFFF000000FFFFFFFFFFFF
          E8E8E8B5B5B4E8EAE8FFFFFFD7CEC7DCD2BA998955B7A572F8F8E6F4E9C4BBA7
          49E4D9B1FBFDF1FDF9E9FAFDF4D2E1D2F7FAD1F8EFA7D8C060FEF890FFFDC9FE
          FFEBF1EFC7E1D06BFAE078EFD673EBCE6DD5B564B59349D2BA61C3B354C2AD56
          7D983F273E108A75389E813FA08B439F893B7E60216E621EC6C2ABFFFFFFFEFE
          FEFFFFFFFFFFFF000000FFFFFDFFFFFFFBFBFB999998C8C9C6FFFFFFCFD0D3C8
          CDD0BEB99F7D733BEEF0F4FBF5F2C9B65BB9AF84FFFFFFF1FEFCFDFEF5FFFFFD
          FFFFFFF9FFFBDDD1A8F7ED76F8F4B5F6FBFFFFFFFFC8B26DFADE71E6D46EE4CA
          6BE3C86DBFA04ECFB65CC2B055C6AE567D943F1D391287723A9E863EA68B4383
          7A2BA9A081F6F4E6FFFFFFFFFFFFFEFEFFFFFFFFFFFFFF000000FFFFFDFFFFFF
          FFFFFFB4B4B4ADAEAEFFFFFFCECDCCC1CAC9E3DFDA857748DED7C6EDF5F2E4D3
          939F8F45FFFFFFFFFFFFDDD3ADC3B9638D9473FFFFFFFFFEFFE9E390F7E988FF
          FFFFFEFFFFC2BD8BEED367E3D160DEC65EDDC664D6BB61B99B4EC7B257C1A651
          57812A343B11896D2DA18136887A34BDBC97FFFFFFFFFFFFFDFEF9FDFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFEFFFFFFFFFFFFD3D3D3A0A0A0F5F5F4D2CED0C1
          C5C2D8D5D9CAC0AEAAA27EECF3F5F3E8C69C8B35EAE8D7FEFEFFFFF8E5FAE776
          B1A551DBD7CBFFFFFFFBFBDDF0DE6AFEFCE1FEFBFFEDEBD9E8DAAEE9DFB4E2D8
          A1C9B260D1BE5BBCA14FBA9F49E1D2A724611D58543AB5C0A2416852EEEDDAFF
          FFFFFCFDFDFEFDFEFFFEFFFDFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFF2F2F29F9F9FD6D6D6D1D2D1C6C5C6FBFCFCDBD9DA9E9977EDEAEDF5F1
          DCB6A453BEB996FFFFFFFDFDF9F0DA7DFFE66FD7CBA2FDFFFFFDFFFFF4D673EF
          ECBDFEFFFFFFFEFEFFFFFFFCF9FFFFFFFE968650C8B150BAA344A28B4EF1FFE9
          002500FFFFFFAEEFF51F6672FFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFAEAEAEB1B1B1CBCBCBBD
          BDBDFFFFFFDEDDE0CEC2BFD1D1C9EFEAEED4C376988B4FFFFFFFFFFFFFDCCC93
          E1BE54D2C58CFFFFFFFFFFFFDAD68BF3DB8AFAFFFEFBFFFEA0906F917E408E88
          49857542C5B782DED7ABFFFFFB578E5C355138FFFFFF1B8D97849C9EFFFFFFFE
          FEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FEFEFEFFFFFFC4C4C4A7A7A7B3B3B3B9B9B9FFFFFFFBFDFCD4CECDD1D1D0E1DF
          EADBD3A28B7B31F8EAE1F2F1FFF4EFDEDFCDA7FAF3E5F9FAFEFFFFFF3C683099
          A452FFFEECEBEFF6DAD4C4C4B081DDC799F5F0E3FCFFFFFFFFFFBAD7BA002100
          E0E1DD76C5C1065460FEF7FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFCFCFCFFFFFFE9E9E9979797A6A6A6AE
          AEAEFFFFFFFFFFFFE1E2E0C5C3C7CED0CEEAE8E7BBBA90BDB493F7FBFFF8FDFC
          FFFEFFF0F0F6F4F1FBE7DFCF626731002700A6BFA1F9F6F9F3F0F1ECECF6E0E5
          E6D1D1DCE2EBE799C2990331036E8C8277BECC005451BABAC3FFFFFFFCFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFDFDFDFFFFFFF2F2F2F7F7F7F8F8F8FFFFFFFDFDFDFDFDFEFAFAFAFAFA
          FAF9FAFEFFFFFF988663A39A70A8976F9E906CEFEDE7FEFFFDFEFFF5FEFADEC1
          C2A5969F924C66513E6E3D487D49487E52497C4A396B31002F01063F33177B80
          00363FA8B3B8FFFFFFF1FCF9FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFA89F62A79240AF9940
          9E924DF8F7F1FFFEFFFDFBFFFFFFFFFFFFFFFFFFFFF8FDF65D70513855313959
          3A3C623F5163503256524A768282919BF1F2F6FFFFFFF7FEFCFAFFFCFEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFF
          FFFEFEFFFFFFFFCBBD8BBFA559BFA755B2A760F7FAECFFFFFDFDFEFEFBFDFCFC
          FDFDFCFCFEFFFCFEFFFEF8FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FAFEFDF9FAF9FCFEFDFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDFFFFFFFEFDF2FBFDF6
          FFFFF8FEFEFCFFFDFFFEFEFEFEFFFDFFFFFEFFFFFEFDFFFFFBFFFFFEFFFFFDFE
          FFFEFEFFFFFFFFFFFEFEFEFEFFFFFEFFFFFFFFFEFEFFFFFEFEFFFDFFFEFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFDFCFDFDFAFEFCFFFAFDFEFDFDFBFCFEFAFEFEFEFFFFFDFFFFFEFF
          FEFFFDFFFFFFFDFFFFFEFFFEFFFFFCFFFFFCFFFFFDFFFFFFFDFFFDFEFEFFFDFE
          FCFDFDFCFDFDFEFDFCFCFDFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFD000000}
        ParentFont = False
        TabOrder = 8
        OnClick = btnMDFEClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btEncerramentoMDFe: TsBitBtn
        Left = 248
        Top = 250
        Width = 188
        Height = 28
        Caption = 'Encerramento MDFe'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          D6050000424DD605000000000000360000002800000018000000140000000100
          180000000000A0050000C40E0000C40E00000000000000000000FFFFFFFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FEFEFEFFFFFFDBDACBD2CFC0FFFFFFFEFEFFFDFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFFFFFFFFFFFC8C3A87D6A218D8142F4F5F4FFFFFFFDFFFDFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFFFFFFF2F1EFD2D1CCACA99B6C5E248E7B318D7948FF
          FFFFFFFEFEFEFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C8A77124C1E037B5C7AA188365B
          394642148E7D3BFBFBF9FFFFFFFDFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFAFBCB286A1805DBBCA
          FEFFFFFFFFFFCCBA82667A3034360F968348E0DDC9F8F8F7FFFFFFFEFFFEFFFF
          FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFF66
          8760ABD4D3A1DEE5FFFEFBD4CB97B79F47B99349818F3F3F431591752C7F6819
          ACA37FFFFFFFFFFFFFFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FFFDFFFFFFFFFF728C6C9FD8E0DBF0F4F6F3E5CBB24DD4BB5BC4AA52C29C4E6B
          7934645C2DA798467D641DEBE9E1FFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFFFDFFFFFFFFFF81987C9DD2DCE3F6FDF9F1DED4B553BDA7
          67B0A37CA79852C0A44F3A551E9E8845978231B2A887FFFFFFFEFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFFFFFF80967EADE1F1D1E0C1
          F5D769F1DF89F4F4E2E5CF82DFD8BCA99B5A928B45565423A2873BA59B69FFFF
          FFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFF87
          A286C7DDD1D4DB7FFFEC79FEEE98E4E0CEDCCC90C8BA92BDAC80AE9544445A23
          A59247978B45E1E1DAFFFFFFFEFEFEFEFFFFFFFFFFFFFFFFFFFDFEFFFFFFEBE7
          D3E2D89DFFFDF983924FD6D369FFF784FFF889FDF181F3F3E2DDD090EAD476E9
          EBE4A98743576C29927F41A38E407D6A2AFDFFFFFFFFFFFEFFFFFFFFFFFFFFFF
          FFFFFFBFAE6DC4A549D1B24BEACB67D2BD607A8E3EFBEE85E7E17DECE279EFDD
          79EDE9C2EDE7CCD0C5A3C3A34C838F416358289A7F3A7F622B91825BFFFFFFFE
          FFFFFFFFFFEBEBEAFFFFFFBFAD75BEA74CE3D586E5CF6CFFF8A4859B69F5F898
          EDE170FDFEA1F6EC8EF8DF6DE9CE6BC6A44CD2BA5D8D96435A5625A78D478061
          21796A33FFFFFFFEFFFFFFFFFFC5C5C5DFDFDED3D8E19A916DF1F2F7BFAF65F8
          FCFFF6F3E3DFE4E4EFE7B6F9F4B4EEEFF3E2C756E4CB5ECEB05BCCB257818F37
          5448139F7F2BACA67CFDFEFAFFFFFFFFFFFFFFFFFFF2F2F2BCBCBCCECECEDCD8
          D7BFBDABD6CA95DFDDCAFFF6C9CCBD5FFAFCFFFBE994FCFDFEF6F0DBEBE4C3BD
          A540C1A151648356A6B5A796AEA1FFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          A6A6A6B5B5B5FCFDFFCBC5C3E4DDC8B3A56FFFFEFFE2C87BFFFFFFAEB774FFFF
          EBCABFAEAD9962E0D3B7E6EEDA667D6155A9B6EAEAEDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFD8D8D8BFBFBFFFFFFFE6E6E7E7E8EDC8C2A7C9C7B8DCD8D5
          FFFEFF8E956B7A8E779FB4A39CB8A78EAE92043D1728727E9DB0B3FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
          E7D9A0831EB1A561FFFFFFFFFFFFFFFFFFADB8A58298818F9E9193A9B1EAEBED
          FFFFFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFDFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        ParentFont = False
        TabOrder = 9
        OnClick = btEncerramentoMDFeClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BtnDaMDFe: TsBitBtn
        Left = 448
        Top = 250
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
        OnClick = BtnDaMDFeClick
        SkinData.SkinSection = 'BUTTON'
      end
      object sGroupBox13: TsGroupBox
        Left = 407
        Top = 6
        Width = 202
        Height = 42
        Caption = 'Digest Value'
        TabOrder = 11
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
    end
  end
  object pnRod: TPanel
    Left = 0
    Top = 678
    Width = 1029
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btAlt: TsBitBtn
      Left = 38
      Top = 10
      Width = 124
      Height = 25
      Caption = 'Alterar'
      Enabled = False
      TabOrder = 0
      OnClick = btAltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btgra: TsBitBtn
      Left = 167
      Top = 10
      Width = 124
      Height = 25
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 1
      OnClick = BtgraClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btcan: TsBitBtn
      Left = 297
      Top = 10
      Width = 124
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 2
      OnClick = btcanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btimp_separacao_itens: TsBitBtn
      Left = 427
      Top = 10
      Width = 145
      Height = 25
      Caption = 'Separa'#231#227'o de Carga'
      TabOrder = 3
      OnClick = Btimp_separacao_itensClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btimp_form_carga: TsBitBtn
      Left = 578
      Top = 10
      Width = 141
      Height = 25
      Caption = 'Formul'#225'rio de Carga!'
      TabOrder = 4
      OnClick = Btimp_form_cargaClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btloc: TsBitBtn
      Left = 871
      Top = 9
      Width = 124
      Height = 26
      Caption = 'Localizar'
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
      TabOrder = 5
      OnClick = btlocClick
      SkinData.SkinSection = 'BUTTON'
    end
    object SBcarga: TStatusBar
      Left = 0
      Top = 44
      Width = 1029
      Height = 19
      Panels = <
        item
          Width = 400
        end
        item
          Width = 50
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1029
    Height = 141
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TsGroupBox
      Left = 0
      Top = 0
      Width = 1029
      Height = 135
      Align = alTop
      TabOrder = 0
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
        Left = 967
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
        OnExit = PridExit
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
        CharCase = ecUpperCase
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
        TabOrder = 6
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
        TabOrder = 5
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
        TabOrder = 7
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
      object Pruf_destino: TsEdit
        Left = 967
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
  object fr_relatorio: TfrxReport
    Tag = 1
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40124.577814571800000000
    ReportOptions.LastChange = 46098.476514953720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fr_relatorioGetValue
    OnReportPrint = 'frxReportOnReportPrint'
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
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 948.662030000000000000
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
          Left = 903.307670000000000000
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
          Width = 1043.150280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'PLASFAN')
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
          Width = 461.102660000000000000
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
          Left = 565.811380000000000000
          Top = 51.133890000000000000
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
          Left = 616.724800000000000000
          Top = 51.133890000000000000
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
          Width = 491.338900000000000000
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
          Left = 566.929500000000000000
          Top = 71.811070000000000000
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
          Left = 637.520100000000000000
          Top = 71.811070000000000000
          Width = 400.630180000000000000
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
          Width = 68.031540000000000000
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
          Left = 147.960730000000000000
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
          Left = 237.771800000000000000
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
          Left = 839.055660000000000000
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
          Left = 76.047310000000000000
          Top = 124.724490000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' NFe')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 124.724490000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 718.110700000000000000
          Top = 124.724490000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Forma Pagamento')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 940.102970000000000000
          Top = 124.724490000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'OBS.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        DataSet = Dm.dst_carga
        DataSetName = 'dst_carga'
        RowCount = 0
        object dst_cargaID_PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Width = 71.811070000000000000
          Height = 15.118110240000000000
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
          Left = 147.960730000000000000
          Width = 86.929190000000000000
          Height = 15.118110240000000000
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
          Left = 237.771800000000000000
          Width = 325.039580000000000000
          Height = 15.118110240000000000
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
          Left = 839.055660000000000000
          Width = 98.267780000000000000
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
          Left = 76.047310000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataField = 'NFE'
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
            '[dst_carga."NFE"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 147.401670000000000000
          Height = 15.118110240000000000
          DataField = 'cidade'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."cidade"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 718.110700000000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          DataField = 'nom_fop'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."nom_fop"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 940.102970000000000000
          Width = 102.047310000000000000
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
          Frame.Typ = [ftBottom]
          HAlign = haRight
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 434.645950000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 967.559680000000000000
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
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 771.244590000000000000
          Top = 7.559060000000000000
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
          Left = 261.299320000000000000
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
          Left = 534.598640000000000000
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
          Left = 327.551330000000000000
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
          Left = 578.512060000000000000
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
          Left = 839.055660000000000000
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
          Left = 430.866420000000000000
          Top = 90.708720000000000000
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
          Width = 1041.260054880000000000
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
    Left = 552
    Top = 256
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
    object mmCarga2ENTREGUE: TBooleanField
      FieldName = 'ENTREGUE'
    end
    object mmCarga2Check: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmCarga2NFE: TStringField
      FieldName = 'NFE'
    end
    object mmCarga2VALOR_FRETE: TCurrencyField
      FieldName = 'VALOR_FRETE'
    end
  end
  object dsCarga2: TDataSource
    DataSet = mmCarga2
    Left = 376
    Top = 368
  end
  object mmCargaOutros: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Pedido'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NFE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'COD_CARGA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOM_CARGA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Check'
        DataType = ftBoolean
      end>
    Left = 432
    Top = 360
    object mmCargaOutrosPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object mmCargaOutrosNFE: TStringField
      FieldName = 'NFE'
    end
    object mmCargaOutrosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object mmCargaOutrosDATA: TDateField
      FieldName = 'DATA'
    end
    object mmCargaOutrosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmCargaOutrosCOD_CARGA: TStringField
      FieldName = 'COD_CARGA'
    end
    object mmCargaOutrosNOM_CARGA: TStringField
      FieldName = 'NOM_CARGA'
      Size = 100
    end
    object mmCargaOutrosCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsCargaOutros: TDataSource
    DataSet = mmCargaOutros
    Left = 520
    Top = 368
  end
  object ACBrMDFe1: TACBrMDFe
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpWinINet
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DAMDFE = ACBrMDFeDAMDFEFR1
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
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrMDFe = ACBrMDFe1
    ImprimeHoraSaida = False
    TipoDAMDFe = tiSemGeracao
    Cancelada = False
    Encerrado = False
    ImprimeDadosExtras = [deValorTotal, deRelacaoDFe]
    ExibirMunicipioDescarregamento = False
    SelecionaImpressora = False
    EspessuraBorda = 1
    Left = 844
    Top = 72
  end
  object q_xml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.xml_mdfe'
      'FROM carga1 a'
      'where a.id = :id')
    Left = 734
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_xmlxml_mdfe: TBlobField
      FieldName = 'xml_mdfe'
      Origin = 'xml_mdfe'
    end
  end
  object qrGravaXml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE CARGA1'
      'SET XML_MDFE =:arquivo'
      'WHERE ID =:ID')
    Left = 438
    Top = 272
    ParamData = <
      item
        Name = 'arquivo'
        DataType = ftBlob
        FDDataType = dtBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
