object frm_controle_status_pedido: Tfrm_controle_status_pedido
  Left = 0
  Top = 0
  Caption = 'Controle de Status de Pedido'
  ClientHeight = 571
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TsPanel
    Left = 0
    Top = 401
    Width = 1022
    Height = 129
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Panel5: TsPanel
      Left = 2
      Top = 2
      Width = 1018
      Height = 23
      Align = alTop
      Caption = 'ITENS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
    end
    object dgItem: TDBGrid
      Left = 2
      Top = 25
      Width = 1018
      Height = 102
      Align = alClient
      Color = clWhite
      DataSource = ds_itens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'produto'
          Title.Caption = 'Produto'
          Width = 546
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'volume'
          Title.Alignment = taCenter
          Title.Caption = 'Volume'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_bruto'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Venda'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o'
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'perc_desc'
          Title.Alignment = taCenter
          Title.Caption = '% Desc.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub_total'
          Title.Alignment = taCenter
          Title.Caption = 'Sub Tot.'
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 79
    Width = 1022
    Height = 322
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Panel4: TsPanel
      Left = 2
      Top = 224
      Width = 1018
      Height = 23
      Align = alBottom
      Caption = 'OBSERVA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
    end
    object dgPedido: TDBGrid
      Left = 2
      Top = 25
      Width = 1018
      Height = 199
      Align = alClient
      Color = clWhite
      DataSource = ds_pedidos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dgPedidoDrawColumnCell
      OnDblClick = dgPedidoDblClick
      OnEnter = dgPedidoEnter
      OnKeyUp = dgPedidoKeyUp
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Width = 88
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMDOC'
          Title.Alignment = taCenter
          Title.Caption = 'N'#176' Pedido'
          Width = 54
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTADOC'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_CLIENTE'
          Title.Caption = 'Cliente'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_REPRESENTANTE'
          Title.Caption = 'Representante'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_FOP'
          Title.Caption = 'Forma Pgto.'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOM_PRAZO'
          Title.Caption = 'Prazo'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOT_BRUTO'
          Title.Alignment = taCenter
          Title.Caption = 'T.Bruto'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOT_LIQUIDO'
          Title.Alignment = taCenter
          Title.Caption = 'T.L'#237'quido'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'check'
          Width = 20
          Visible = True
        end>
    end
    object Panel6: TsPanel
      Left = 2
      Top = 2
      Width = 1018
      Height = 23
      Align = alTop
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
    end
    object DBMemo1: TDBMemo
      Left = 2
      Top = 247
      Width = 1018
      Height = 73
      Align = alBottom
      DataField = 'OBSERVACOES_PEDIDO'
      TabOrder = 3
    end
    object DBCheckBox1: TDBCheckBox
      Left = 244
      Top = 92
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'check'
      DataSource = ds_pedidos
      ParentColor = False
      TabOrder = 4
      Visible = False
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 530
    Width = 1022
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object BtAlterarStatus: TsSpeedButton
      Left = 239
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Alterar Status'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BtAlterarStatusClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object btImprimir: TsSpeedButton
      Left = 345
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btImprimirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Shape1: TShape
      Left = 541
      Top = 23
      Width = 20
      Height = 10
      Brush.Color = 1993170
    end
    object Shape2: TShape
      Left = 634
      Top = 23
      Width = 20
      Height = 10
      Brush.Color = clMaroon
    end
    object sLabel1: TsLabel
      Left = 566
      Top = 21
      Width = 54
      Height = 13
      Caption = 'Desativado'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 660
      Top = 20
      Width = 97
      Height = 13
      Caption = 'Faturado-Devolu'#231#227'o'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Shape3: TShape
      Left = 634
      Top = 9
      Width = 20
      Height = 9
      Brush.Color = clGray
    end
    object sLabel5: TsLabel
      Left = 658
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Cancelado'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel6: TsLabel
      Left = 797
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Entregue'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Shape4: TShape
      Left = 771
      Top = 23
      Width = 20
      Height = 10
      Brush.Color = 3107669
    end
    object Shape5: TShape
      Left = 453
      Top = 24
      Width = 20
      Height = 10
      Brush.Color = clOlive
    end
    object sLabel7: TsLabel
      Left = 479
      Top = 21
      Width = 40
      Height = 13
      Caption = #192' Digitar'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel8: TsLabel
      Left = 564
      Top = 7
      Width = 43
      Height = 13
      Caption = #192' Faturar'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Shape6: TShape
      Left = 541
      Top = 9
      Width = 20
      Height = 10
      Brush.Color = clGreen
    end
    object Shape7: TShape
      Left = 453
      Top = 9
      Width = 20
      Height = 10
      Brush.Color = 7451452
    end
    object sLabel9: TsLabel
      Left = 477
      Top = 7
      Width = 46
      Height = 13
      Caption = #192' Conferir'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Shape8: TShape
      Left = 771
      Top = 9
      Width = 20
      Height = 10
      Brush.Color = clNavy
    end
    object sLabel10: TsLabel
      Left = 797
      Top = 6
      Width = 81
      Height = 13
      Caption = 'Faturado-Vendas'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btConfirmarEntrega: TsSpeedButton
      Left = 134
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Confirmar Entrega'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btConfirmarEntregaClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Shape9: TShape
      Left = 915
      Top = 9
      Width = 20
      Height = 10
      Brush.Color = 7405793
    end
    object sLabel11: TsLabel
      Left = 941
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Pendente'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object CheckTodos: TsCheckBox
      Left = 9
      Top = 11
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
      TabOrder = 0
      OnClick = CheckTodosClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 79
    Align = alTop
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object gbPedido: TsGroupBox
      Left = 4
      Top = -1
      Width = 213
      Height = 39
      Caption = 'Pedido'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel3: TsLabel
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
      object sLabel4: TsLabel
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
      object edPedidoIni: TsCurrencyEdit
        Left = 26
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
      object edPedidoFim: TsCurrencyEdit
        Left = 132
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
        DecimalPlaces = 0
        DisplayFormat = '0'
      end
    end
    object gbDataSaida: TsGroupBox
      Left = 219
      Top = -1
      Width = 217
      Height = 39
      Caption = 'Data de Sa'#237'da'
      TabOrder = 1
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
      Left = 438
      Top = -1
      Width = 362
      Height = 39
      Caption = 'Cliente:'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_cliente: TsLabel
        Left = 72
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
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object BtConsulta: TsBitBtn
      Left = 463
      Top = 44
      Width = 75
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
      TabOrder = 3
      OnClick = BtConsultaClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gbStatus: TGroupBox
      Left = 803
      Top = -1
      Width = 193
      Height = 39
      Caption = 'Status'
      TabOrder = 4
      object cbStatus: TComboBox
        Left = 4
        Top = 13
        Width = 186
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'TODOS'
        Items.Strings = (
          'TODOS'
          #192' DIGITAR'
          #192' CONFERIR'
          #192' FATURAR'
          'FATURADO-VENDAS'
          'FATURADO-DEVOLU'#199#195'O'
          'DESATIVADO'
          'CANCELADO'
          'ENTREGUE'
          'PENDENTE')
      end
    end
  end
  object q_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.NUMDOC, a.DTADOC, a.COD_CLIENTE, c.NOM_CLIENTE, a.TOT_B' +
        'RUTO, a.TOT_LIQUIDO, '
      
        'a.COD_FOP, f.NOM_FOP, a.COD_REPRESENTANTE, r.NOM_REPRESENTANTE, ' +
        'a.cod_prazo_pgto, p.PRAZO, '
      
        'A.OBSERVACOES_PEDIDO, a.pedido_vendedor, pp.STATUS, a.PROCESSO_I' +
        'D, a.nr_pedido_palm'
      'FROM VENDAS1 a'
      'left outer join PROCESSO_PEDIDO pp on pp.ID = a.PROCESSO_ID'
      'inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE)'
      'inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE)'
      'left  join prazo p on (p.ID = a.COD_PRAZO_PGTO)'
      'left join fop f on (f.COD_FOP = a.COD_FOP)'
      'where 1 = 1'
      'and a.PROCESSO_ID is not null'
      'order by numdoc')
    Left = 416
    Top = 112
    object q_pedidosnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pedidosdtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_pedidoscod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_pedidosnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_pedidostot_bruto: TBCDField
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidostot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_pedidoscod_fop: TIntegerField
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_pedidosnom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_pedidoscod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_pedidosnom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_pedidoscod_prazo_pgto: TIntegerField
      FieldName = 'cod_prazo_pgto'
      Origin = 'cod_prazo_pgto'
    end
    object q_pedidosprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_pedidosobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_pedidospedido_vendedor: TStringField
      FieldName = 'pedido_vendedor'
      Origin = 'pedido_vendedor'
      FixedChar = True
      Size = 1
    end
    object q_pedidosstatus: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'status'
      Origin = 'status'
      Size = 30
    end
    object q_pedidosprocesso_id: TIntegerField
      FieldName = 'processo_id'
      Origin = 'processo_id'
    end
    object q_pedidosnr_pedido_palm: TStringField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      FixedChar = True
      Size = 7
    end
  end
  object q_itens: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NUMDOC, CAST(a.COD_PRODUTO||'#39'-'#39'||p.NOM_PRODUTO AS' +
        ' VARCHAR(100)) as produto, a.QTD, a.PRECO, a.SUB_TOTAL, a.NR_PED' +
        'IDO_PALM, a.PRECO_BRUTO, (((a.PRECO_BRUTO - A.PRECO)/A.PRECO_BRU' +
        'TO) * 100) AS PERC_DESC, A.VOLUME'
      'FROM VENDAS2 a'
      'inner join produto p on (p.COD_PRODUTO = a.COD_PRODUTO)'
      'where A.NUMDOC=:NUMDOC'
      'ORDER BY ID')
    Left = 528
    Top = 136
    ParamData = <
      item
        Name = 'numdoc'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_itensproduto: TStringField
      FieldName = 'produto'
    end
    object q_itensvolume: TBCDField
      FieldName = 'volume'
      DisplayFormat = '#,###,##0.00'
      Size = 2
    end
    object q_itensqtd: TBCDField
      FieldName = 'qtd'
      DisplayFormat = '#,###,##0.00'
      Size = 2
    end
    object q_itenssub_total: TBCDField
      FieldName = 'sub_total'
      DisplayFormat = 'R$ #,###,##0.00'
    end
    object q_itenspreco: TBCDField
      FieldName = 'preco'
      DisplayFormat = 'R$ #,###,##0.00'
    end
    object q_itenspreco_bruto: TBCDField
      FieldName = 'preco_bruto'
      DisplayFormat = 'R$ #,###,##0.00'
      Size = 2
    end
    object q_itensperc_desc: TFMTBCDField
      FieldName = 'perc_desc'
      DisplayFormat = '##0.00'
      Size = 2
    end
  end
  object ds_itens: TDataSource
    DataSet = q_itens
    Left = 468
    Top = 220
  end
  object ds_pedidos: TDataSource
    DataSet = m_pedidos
    Left = 420
    Top = 252
  end
  object fR_RELATORIO: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 42639.461633715280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 248
    Top = 296
    Datasets = <
      item
        DataSet = dst_pedidos_status
        DataSetName = 'dst_pedidos_status'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338582677165350000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = dst_pedidos_status
        DataSetName = 'dst_pedidos_status'
        RowCount = 0
        object dst_vendas1NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Width = 34.015748030000000000
          Height = 11.338590000000000000
          DataField = 'NUMDOC'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_pedidos_status."NUMDOC"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 40.913420000000000000
          Width = 39.685039370000000000
          Height = 11.338590000000000000
          DataField = 'DTADOC'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_status."DTADOC"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 83.905511810000000000
          Width = 132.283388900000000000
          Height = 11.338590000000000000
          DataField = 'NOM_CLIENTE'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_status."NOM_CLIENTE"]')
          ParentFont = False
          WordWrap = False
        end
        object dst_vendas1TOT_LIQUIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 518.283464570000000000
          Width = 64.251958740000000000
          Height = 11.338590000000000000
          DataField = 'TOT_LIQUIDO'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_pedidos_status."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 338.850393700000000000
          Width = 86.929116770000000000
          Height = 11.338590000000000000
          DataField = 'NOM_FOP'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_status."NOM_FOP"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 585.826771653543300000
          Width = 130.826766770000000000
          Height = 11.338590000000000000
          DataField = 'STATUS'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_pedidos_status."STATUS"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 428.000000000000000000
          Width = 86.929116770000000000
          Height = 11.338590000000000000
          DataField = 'PRAZO'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_status."PRAZO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 218.078671810000000000
          Width = 119.055118110000000000
          Height = 11.338590000000000000
          DataField = 'NOM_REPRESENTANTE'
          DataSet = dst_pedidos_status
          DataSetName = 'dst_pedidos_status'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_status."NOM_REPRESENTANTE"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 302.362400000000000000
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
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.677180000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 6.559060000000000000
          Width = 204.094620000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total Geral Qtd Pedidos: [COUNT(MasterData1,2)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 522.575088740000000000
          Top = 5.456710000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Geral Liquido Pedidos: [SUM(<dst_pedidos_status."TOT_LIQUI' +
              'DO">,MasterData1,2)]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 103.181102362204700000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 6.779530000000000000
          Top = 87.094620000000000000
          Width = 34.015748030000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Doc')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 42.913420000000000000
          Top = 87.094620000000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 83.826840000000000000
          Top = 87.094620000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 518.283860000000000000
          Top = 87.094620000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Liquido')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 338.685220000000000000
          Top = 87.315090000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Forma Pgto.')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 618.842920000000000000
          Top = 3.779529999999990000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
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
          Left = 573.488560000000000000
          Top = 34.338590000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
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
          Left = 11.338590000000000000
          Top = 34.338590000000000000
          Width = 234.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de Status de Pedido entre:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 249.480520000000000000
          Top = 34.338590000000000000
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
          Left = 336.409710000000000000
          Top = 34.338590000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 359.086890000000000000
          Top = 34.338590000000000000
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 11.826840000000000000
          Top = 3.779530000000000000
          Width = 509.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pl'#225'sticos Fantoni Ltda.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 586.000000000000000000
          Top = 87.102350000000000000
          Width = 129.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 428.000000000000000000
          Top = 87.102350000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Prazo Pgto.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 218.000000000000000000
          Top = 87.102350000000000000
          Width = 119.055118110000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Representante')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 67.000000000000000000
          Top = 53.102350000000000000
          Width = 179.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[status]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 53.102350000000000000
          Width = 52.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
      end
    end
  end
  object m_pedidos: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 408
    Top = 64
    object m_pedidosNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object m_pedidosDTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object m_pedidosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object m_pedidosNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 100
    end
    object m_pedidosCOD_FOP: TIntegerField
      FieldName = 'COD_FOP'
    end
    object m_pedidosNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 50
    end
    object m_pedidosCOD_PRAZO: TIntegerField
      FieldName = 'COD_PRAZO'
    end
    object m_pedidosNOM_PRAZO: TStringField
      FieldName = 'NOM_PRAZO'
      Size = 100
    end
    object m_pedidosTOT_BRUTO: TCurrencyField
      FieldName = 'TOT_BRUTO'
    end
    object m_pedidosTOT_LIQUIDO: TCurrencyField
      FieldName = 'TOT_LIQUIDO'
    end
    object m_pedidoscheck: TBooleanField
      FieldName = 'check'
    end
    object m_pedidosPROCESSO: TIntegerField
      FieldName = 'PROCESSO'
    end
    object m_pedidosCOD_REPRESENTANTE: TIntegerField
      FieldName = 'COD_REPRESENTANTE'
    end
    object m_pedidosNOM_REPRESENTANTE: TStringField
      FieldName = 'NOM_REPRESENTANTE'
      Size = 100
    end
    object m_pedidosSTATUS: TStringField
      FieldName = 'STATUS'
    end
  end
  object dst_pedidos_status: TfrxDBDataset
    UserName = 'dst_pedidos_status'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUMDOC=NUMDOC'
      'DTADOC=DTADOC'
      'COD_CLIENTE=COD_CLIENTE'
      'NOM_CLIENTE=NOM_CLIENTE'
      'TOT_BRUTO=TOT_BRUTO'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'COD_FOP=COD_FOP'
      'NOM_FOP=NOM_FOP'
      'COD_REPRESENTANTE=COD_REPRESENTANTE'
      'NOM_REPRESENTANTE=NOM_REPRESENTANTE'
      'COD_PRAZO_PGTO=COD_PRAZO_PGTO'
      'PRAZO=PRAZO'
      'OBSERVACOES_PEDIDO=OBSERVACOES_PEDIDO'
      'PEDIDO_VENDEDOR=PEDIDO_VENDEDOR'
      'STATUS=STATUS'
      'PROCESSO_ID=PROCESSO_ID'
      'NR_PEDIDO_PALM=NR_PEDIDO_PALM')
    DataSet = q_pedidos
    BCDToCurrency = False
    Left = 408
    Top = 176
  end
end
