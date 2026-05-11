object fr_etiquetas_multiplos_produtos: Tfr_etiquetas_multiplos_produtos
  Left = 0
  Top = 0
  Caption = 'Impressao de Etiquetas - Multiplos Produtos'
  ClientHeight = 560
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbInfo: TLabel
      Left = 12
      Top = 8
      Width = 378
      Height = 13
      Caption = 
        'Informe Codigo e Qtde por linha. A coluna Produto e preenchida n' +
        'a impressao.'
    end
    object lbProduto: TLabel
      Left = 12
      Top = 35
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object lbQtd: TLabel
      Left = 176
      Top = 35
      Width = 28
      Height = 13
      Caption = 'Qtde:'
    end
    object lbDescricao: TLabel
      Left = 281
      Top = 35
      Width = 50
      Height = 13
      Caption = 'Descricao:'
    end
    object Menom_produto: TDBText
      Left = 337
      Top = 35
      Width = 548
      Height = 17
      DataField = 'PRODUTO'
      DataSource = dsItens
    end
    object Mecod_produto: TRxDBComboEdit
      Left = 58
      Top = 31
      Width = 106
      Height = 21
      ClickKey = 120
      DataField = 'CODIGO'
      DataSource = dsItens
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = Mecod_produtoButtonClick
      OnExit = Mecod_produtoExit
    end
    object Meqtd: TDBEdit
      Left = 206
      Top = 31
      Width = 57
      Height = 21
      DataField = 'QTDE'
      DataSource = dsItens
      TabOrder = 1
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 508
    Width = 900
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnov: TBitBtn
      Left = 8
      Top = 12
      Width = 66
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnovClick
    end
    object btalt: TBitBtn
      Left = 78
      Top = 12
      Width = 66
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btaltClick
    end
    object btgra: TBitBtn
      Left = 148
      Top = 12
      Width = 66
      Height = 25
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = btgraClick
    end
    object btcan: TBitBtn
      Left = 218
      Top = 12
      Width = 66
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btcanClick
    end
    object btexc: TBitBtn
      Left = 288
      Top = 12
      Width = 66
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btexcClick
    end
    object btImprimir: TBitBtn
      Left = 630
      Top = 12
      Width = 120
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = btImprimirClick
    end
    object btFechar: TBitBtn
      Left = 758
      Top = 12
      Width = 120
      Height = 25
      Caption = 'Fechar'
      ModalResult = 2
      TabOrder = 6
    end
  end
  object dbItens: TDBGrid
    Left = 0
    Top = 74
    Width = 900
    Height = 434
    Align = alClient
    DataSource = dsItens
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEnter = dbItensEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'Codigo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        ReadOnly = True
        Title.Caption = 'Produto'
        Width = 720
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde'
        Width = 80
        Visible = True
      end>
  end
  object dsItens: TDataSource
    AutoEdit = False
    DataSet = mmItens
    Left = 744
    Top = 8
  end
  object mmItens: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'QTDE'
        DataType = ftInteger
      end>
    Left = 776
    Top = 8
    object mmItensCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object mmItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 120
    end
    object mmItensQTDE: TIntegerField
      FieldName = 'QTDE'
    end
  end
end
