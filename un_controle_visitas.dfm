object fr_controle_visitas: Tfr_controle_visitas
  Left = 0
  Top = 0
  Caption = 'Controle de Visitas.'
  ClientHeight = 478
  ClientWidth = 740
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
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 41
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object gbData: TsGroupBox
      Left = 3
      Top = -2
      Width = 88
      Height = 39
      Caption = 'Data'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edData: TsDateEdit
        Left = 3
        Top = 14
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
    end
    object BtConsulta: TsBitBtn
      Left = 97
      Top = 7
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
      TabOrder = 1
      OnClick = BtConsultaClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object dgVisitas: TDBGrid
    Left = 0
    Top = 41
    Width = 740
    Height = 193
    Align = alClient
    DataSource = dsVisitas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dgVisitasDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cod_Cliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Cliente'
        Title.Caption = 'Cliente'
        Width = 410
        Visible = True
      end
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
        Width = 41
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
  object sPanel2: TsPanel
    Left = 0
    Top = 234
    Width = 740
    Height = 244
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sPanel3: TsPanel
      Left = 2
      Top = 209
      Width = 736
      Height = 33
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sLabel1: TsLabel
        Left = 667
        Top = 5
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
      object sLabel2: TsLabel
        Left = 668
        Top = 17
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
        Left = 712
        Top = 7
        Width = 20
        Height = 10
        Brush.Color = clNavy
      end
      object Shape2: TShape
        Left = 712
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
    object gbCliente: TGroupBox
      Left = 8
      Top = 6
      Width = 537
      Height = 43
      Caption = 'Cliente'
      TabOrder = 1
      object LbNom_cliente1: TsLabel
        Left = 78
        Top = 22
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
      object edcod_cliente: TRxDBComboEdit
        Left = 6
        Top = 16
        Width = 66
        Height = 21
        ClickKey = 120
        DataField = 'Cod_Cliente'
        DataSource = dsVisitas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDD333DDDDDDDDDDDD33603DDDDDDDDDD3B7871D
          33DDDDD3BBB88803333DDD3B888F873887033388FF7883BBB86133FFFF83333B
          B873383888BB333BBB33D3333BBBBB333DDDDDDDD33333DDDDDDDDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        NumGlyphs = 1
        ParentFont = False
        TabOrder = 0
        OnButtonClick = edcod_clienteButtonClick
        OnExit = edcod_clienteExit
      end
    end
    object gbValor: TGroupBox
      Left = 621
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
        DataSource = dsVisitas
        DataField = 'Valor'
      end
    end
    object gbMotivo: TGroupBox
      Left = 8
      Top = 55
      Width = 726
      Height = 148
      Caption = 'Motivo da N'#227'o Venda'
      TabOrder = 4
      object DBMemo1: TDBMemo
        Left = 5
        Top = 15
        Width = 715
        Height = 128
        DataField = 'Motivo'
        DataSource = dsVisitas
        TabOrder = 0
      end
    end
    object CkVendeu: TDBCheckBox
      Left = 551
      Top = 24
      Width = 64
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
    TabOrder = 3
    Visible = False
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
    object mmVisitasCod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object mmVisitasNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 100
    end
  end
  object dsVisitas: TDataSource
    AutoEdit = False
    DataSet = mmVisitas
    Left = 408
    Top = 312
  end
end
