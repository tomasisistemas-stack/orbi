object fm_loc_pedido: Tfm_loc_pedido
  Left = 51
  Top = 278
  Width = 1009
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Nota Fiscal Eletr'#244'nica Envio de Lote.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: tsPanel
    Left = 0
    Top = 412
    Width = 1001
    Height = 41
    Align = alBottom
    TabOrder = 0
    object lbTotalNFs: tsLabel
      Left = 816
      Top = 14
      Width = 172
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas Fiscais Selecionadas: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnEnviarLoteNFE: TsBitBtn
      Left = 386
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
      ParentFont = False
      TabOrder = 0
      OnClick = BtnEnviarLoteNFEClick
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
    end
    object BtnSair: TsBitBtn
      Left = 514
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
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
      NumGlyphs = 2
    end
  end
  object Panel2: tsPanel
    Left = 0
    Top = 0
    Width = 1001
    Height = 209
    Align = alTop
    TabOrder = 1
    object gbPedido: TsGroupBox
      Left = 4
      Top = -1
      Width = 81
      Height = 39
      Caption = 'Pedido'
      TabOrder = 0
      object edPedido: TsCurrencyEdit
        Left = 2
        Top = 13
        Width = 75
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 0
      end
    end
    object gbDataSaida: TsGroupBox
      Left = 88
      Top = -1
      Width = 217
      Height = 39
      Caption = 'Data de Sa'#237'da'
      TabOrder = 1
      object Label2: tsLabel
        Left = 5
        Top = 16
        Width = 17
        Height = 13
        Caption = 'De:'
      end
      object Label1: tsLabel
        Left = 109
        Top = 16
        Width = 19
        Height = 13
        Caption = 'At'#233':'
      end
      object edSaidaDe: TsDateEdit
        Left = 25
        Top = 13
        Width = 81
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edSaidaAte: TsDateEdit
        Left = 131
        Top = 13
        Width = 81
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object gbCliente: TsGroupBox
      Left = 4
      Top = 39
      Width = 525
      Height = 39
      Caption = 'Cliente:'
      TabOrder = 2
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
      end
      object Lbnom_cliente: tsLabel
        Left = 100
        Top = 16
        Width = 9
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edCliente: TsComboEdit
        IsNumeric = true
        Left = 32
        Top = 13
        Width = 66
        Height = 21
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
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = edClienteButtonClick
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
      ParentFont = False
      TabOrder = 3
      OnClick = BtConsultaClick
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
    end
  end
  object Panel3: tsPanel
    Left = 0
    Top = 209
    Width = 1001
    Height = 203
    Align = alClient
    TabOrder = 2
    object dgListaNFe: Tdbgrid
      Left = 1
      Top = 1
      Width = 999
      Height = 201
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
          Width = 250
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
          Width = 280
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
      ValueChecked = 'True'
      ValueUnchecked = 'False'
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
end
