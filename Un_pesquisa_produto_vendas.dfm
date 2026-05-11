object Fr_pesquisa_produto_venda: TFr_pesquisa_produto_venda
  Left = 311
  Top = 175
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa de Produtos nas Vendas'
  ClientHeight = 512
  ClientWidth = 795
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 69
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Lbnom_produto: TsLabel
      Left = 89
      Top = 29
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
    object Label15: TsLabel
      Left = 9
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object Emcod_produto: TsComboEdit
      Left = 5
      Top = 26
      Width = 79
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
      OnExit = Emcod_produtoExit
      OnKeyPress = Emcod_produtoKeyPress
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
      OnButtonClick = Emcod_produtoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object BitBtn1: TsBitBtn
      Left = 664
      Top = 8
      Width = 123
      Height = 41
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object IB_Grid1: TDBGrid
    Left = 0
    Top = 69
    Width = 795
    Height = 443
    Align = alClient
    DataSource = IB_DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Q_produto: TFDQuery
    Connection = dao.CN
    Left = 152
    Top = 9
  end
  object q_resultado: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select v1.numdoc,  v1.dtadoc, c.nom_cliente, cr.cor, tm.tamanho,' +
        'v2.qtd, v2.preco from vendas2 v2 '
      'left join vendas1 v1 on v1.numdoc=v2.numdoc '
      'left join produto p on p.cod_produto=v2.cod_produto '
      'left join cores cr on cr.id=v2.id_cor '
      'left join tamanho tm on tm.id=v2.id_tamanho '
      'left join cliente c on c.cod_cliente = v1.cod_cliente ')
    Left = 488
    Top = 25
  end
  object IB_DataSource1: TDataSource
    DataSet = Q_produto
    Left = 640
    Top = 24
  end
end
