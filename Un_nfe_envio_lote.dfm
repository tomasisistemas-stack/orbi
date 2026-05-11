object fm_nfe_envio_lote: Tfm_nfe_envio_lote
  Left = -167
  Top = 307
  BorderIcons = [biSystemMenu]
  Caption = 'Nota Fiscal Eletr'#244'nica Envio de Lote.'
  ClientHeight = 453
  ClientWidth = 1001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 412
    Width = 1001
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object lbTotalNFs: TsLabel
      Left = 816
      Top = 14
      Width = 172
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas Fiscais Selecionadas: 0'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object Label3: TsLabel
      Left = 136
      Top = 14
      Width = 87
      Height = 13
      Caption = 'Status do Servi'#231'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbStatusServico: TsLabel
      Left = 225
      Top = 14
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
    object BtnEnviarLoteNFE: TsBitBtn
      Left = 531
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Enviar Lote'
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
      TabOrder = 0
      OnClick = BtnEnviarLoteNFEClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtnSair: TsBitBtn
      Left = 659
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object CheckTodos: TsCheckBox
      Left = 9
      Top = 12
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
      TabOrder = 2
      OnClick = CheckTodosClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 1001
    Height = 41
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object gbPedido: TsGroupBox
      Left = 4
      Top = -1
      Width = 81
      Height = 39
      Caption = 'Pedido'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edPedido: TsCurrencyEdit
        Left = 2
        Top = 13
        Width = 75
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
        DecimalPlaces = 0
        DisplayFormat = '0'
      end
    end
    object gbDataSaida: TsGroupBox
      Left = 170
      Top = -1
      Width = 217
      Height = 39
      Caption = 'Data de Sa'#237'da'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object Label2: TsLabel
        Left = 5
        Top = 16
        Width = 17
        Height = 13
        Caption = 'De:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label1: TsLabel
        Left = 109
        Top = 16
        Width = 19
        Height = 13
        Caption = 'At'#233':'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object edSaidaDe: TsDateEdit
        Left = 25
        Top = 13
        Width = 81
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
      object edSaidaAte: TsDateEdit
        Left = 131
        Top = 13
        Width = 81
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
    object gbCliente: TsGroupBox
      Left = 616
      Top = -1
      Width = 241
      Height = 39
      Caption = 'Cliente:'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object btBuscaDadosCliente: TsSpeedButton
        Left = 6
        Top = 13
        Width = 23
        Height = 20
        Caption = 'I'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btBuscaDadosClienteClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Lbnom_cliente: TsLabel
        Left = 100
        Top = 16
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
      object edCliente: TsComboEdit
        Left = 32
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
        OnButtonClick = edClienteButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object BtConsulta: TsBitBtn
      Left = 869
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = BtConsultaClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gbNFe: TsGroupBox
      Left = 87
      Top = -1
      Width = 81
      Height = 39
      Caption = 'Nota Fiscal'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object edNFe: TsCurrencyEdit
        Left = 2
        Top = 13
        Width = 75
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
        DecimalPlaces = 0
        DisplayFormat = '0'
      end
    end
    object GroupBox1: TsGroupBox
      Left = 389
      Top = -1
      Width = 224
      Height = 39
      Caption = 'Empresa Faturada'
      TabOrder = 5
      SkinData.SkinSection = 'GROUPBOX'
      object lbEmpresaFat: TsLabel
        Left = 73
        Top = 16
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
      object edEmpresaFaturada: TsComboEdit
        Left = 5
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
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 41
    Width = 1001
    Height = 371
    Align = alClient
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object dgListaNFe: TDBGrid
      Left = 1
      Top = 1
      Width = 999
      Height = 369
      Align = alClient
      DataSource = dsListaNFe
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColExit = dgListaNFeColExit
      OnDrawColumnCell = dgListaNFeDrawColumnCell
      OnDblClick = dgListaNFeDblClick
      OnKeyPress = dgListaNFeKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Num_Doc'
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NFE'
          Title.Caption = 'N'#176' Nota Fiscal'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data_Saida'
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          ReadOnly = True
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Chave_NFE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StatusNFe'
          Title.Caption = 'Status'
          Width = 256
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Check'
          Title.Alignment = taCenter
          Width = 18
          Visible = True
        end>
    end
    object DBCheckBox1: TDBCheckBox
      Left = 248
      Top = 96
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsListaNFe
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
  end
  object mmListaNFe: TRxMemoryData
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
    Left = 528
    Top = 32
    object mmListaNFeNum_Doc: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'Num_Doc'
    end
    object mmListaNFeNFE: TIntegerField
      FieldName = 'NFE'
    end
    object mmListaNFeData_Saida: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'Data_Saida'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmListaNFeCliente: TStringField
      FieldName = 'Cliente'
      Size = 100
    end
    object mmListaNFeChave_NFE: TStringField
      DisplayLabel = 'Chave NF-e'
      FieldName = 'Chave_NFE'
      Size = 44
    end
    object mmListaNFeStatusNFe: TStringField
      FieldName = 'StatusNFe'
      Size = 200
    end
    object mmListaNFeCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmListaNFedata_rec: TDateTimeField
      FieldName = 'data_rec'
    end
    object mmListaNFeprotocolo: TLargeintField
      FieldName = 'protocolo'
    end
    object mmListaNFeCliente_Email: TStringField
      FieldName = 'Cliente_Email'
    end
    object mmListaNFeNFE_Email: TStringField
      FieldName = 'NFE_Email'
      Size = 200
    end
    object mmListaNFeCOD_FISCAL: TStringField
      FieldName = 'COD_FISCAL'
    end
  end
  object dsListaNFe: TDataSource
    DataSet = mmListaNFe
    Left = 576
    Top = 32
  end
  object XMLNFe: TXMLDocument
    Left = 488
    Top = 56
    DOMVendorDesc = 'MSXML'
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFEFR1
    Left = 592
    Top = 80
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    PathPDF = 'C:\Program Files (x86)\Embarcadero\Studio\15.0\bin\'
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
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 280
    Top = 392
  end
end
