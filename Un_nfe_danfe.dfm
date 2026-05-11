object fm_nfe_danfe: Tfm_nfe_danfe
  Left = 49
  Top = 205
  BorderIcons = [biSystemMenu]
  Caption = 'Nota Fiscal Eletr'#244'nica - DANFe.'
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
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object BtnImprimir: TsBitBtn
      Left = 386
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Imprimir'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BtnImprimirClick
      SkinData.SkinSection = 'BUTTON'
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
      end
      object Label1: TsLabel
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
      Left = 600
      Top = -1
      Width = 265
      Height = 39
      Caption = 'Cliente:'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_cliente: TsLabel
        Left = 72
        Top = 16
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
      object edCliente: TsComboEdit
        Left = 4
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
      Width = 209
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
        Font.Color = clNavy
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
        OnButtonClick = edEmpresaFaturadaButtonClick
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
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 448
    Top = 136
  end
end
