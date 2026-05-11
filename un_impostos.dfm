object FrImpostos: TFrImpostos
  Left = 1
  Top = 1
  BorderIcons = [biSystemMenu]
  Caption = 'Saldo de Impostos'
  ClientHeight = 699
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 658
    Width = 1006
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btImprimir: TsSpeedButton
      Left = 516
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Imprimir'
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
    object btok: TsSpeedButton
      Left = 401
      Top = 6
      Width = 112
      Height = 30
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F0000
        000000000000000000000000000000000000000000007F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000007F
        7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        00000000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F000000000000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF00000000007F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
        FFFFFFFFFFFF7F7F7F000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00000000007F7F7F7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF
        FFFFFF7F7F7F0000007F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00000000007F7F7F7F00007F0000FF0000FFFFFFFFFFFF
        7F7F7F0000007F0000FF00007F0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00007F00007F00007F0000FF0000FFFF00FFFFFFFFFFFF
        7F7F7F000000FF00007F0000FF00007F0000FF0000FF0000FF0000FF0000FF00
        00000000000000000000000000000000000000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00007F0000FF0000FF0000FFFF00FFFFFFFFFFFF
        000000FF00007F0000FF00007F0000FF00007F0000FF00007F00000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFFFFFFFF
        7F00007F00007F00007F0000FF00007F0000FF00007F00000000007F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F00007F0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFF000000
        7F00007F00007F00007F00007F00007F00007F0000FF00000000007F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
        7F00007F00007F00007F00007F00007F00007F00000000007F7F7F7F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
        7F00007F0000FFFFFFFFFFFF7F00007F00007F00007F7F7F7F7F7F7F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
        7F00007F0000FFFFFFFF00FFFFFFFFFFFFFF7F00000000007F7F7F7F7F7F7F7F
        7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
        FF00FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
        7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
        007FFFFF00FFFF00FF0000FFFF007F007F7F007F0000007F7F7FFFFFFF000000
        7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFF
        FF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
        007F7F007F7F007FFFFF00FFFF007F007F7F007F0000007F7F7FFFFFFF000000
        FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F
        007F7F007F7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFF000000
        FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF7F007F7F007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FF00FF7F
        007FFF00FF7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFFFFFFFF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F007F7F007F7F00
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000007F007FFF
        00FF7F007FFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000
        007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000FF00FFFF00FF7F
        007FFF00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF
        00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FF
        FF00FF7F007FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFF00FF7F007F
        7F007F7F007F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFF
        FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = btokClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 1006
    Height = 658
    ActivePage = TabImpostos
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object TabImpostos: TsTabSheet
      Caption = 'Impostos'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TsPanel
        Left = 0
        Top = 310
        Width = 998
        Height = 320
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object Panel5: TsPanel
          Left = 2
          Top = 2
          Width = 994
          Height = 23
          Align = alTop
          Caption = 'NOTAS'
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
          Width = 994
          Height = 293
          Align = alClient
          Color = clWhite
          DataSource = ds_itens1
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
              FieldName = 'cliente_fornecedor'
              Title.Caption = 'Cliente/Fornecedor'
              Width = 148
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dta_emissao'
              Title.Alignment = taCenter
              Title.Caption = 'Emiss'#227'o'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'numdoc'
              Title.Alignment = taCenter
              Title.Caption = 'Pedido'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nfe'
              Title.Alignment = taCenter
              Title.Caption = 'NF-e'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'chave_nfe'
              Title.Alignment = taCenter
              Title.Caption = 'Chave NF-e'
              Width = 242
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_liquido'
              Title.Alignment = taCenter
              Title.Caption = 'Total L'#237'quido'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_bc_icms'
              Title.Alignment = taCenter
              Title.Caption = 'Base ICMS'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_icms'
              Title.Alignment = taCenter
              Title.Caption = 'Valor ICMS'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_st'
              Title.Alignment = taCenter
              Title.Caption = 'Valor ST'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_ipi'
              Title.Alignment = taCenter
              Title.Caption = 'Valor IPI'
              Width = 75
              Visible = True
            end>
        end
      end
      object Panel3: TsPanel
        Left = 0
        Top = 32
        Width = 998
        Height = 257
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object dgPedido: TDBGrid
          Left = 2
          Top = 25
          Width = 994
          Height = 230
          Align = alClient
          Color = clWhite
          DataSource = ds_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dgPedidoCellClick
          OnEnter = dgPedidoEnter
          OnKeyPress = dgPedidoKeyPress
          OnKeyUp = dgPedidoKeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Width = 211
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Caption = 'Empresa'
              Width = 285
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_liquido'
              Title.Alignment = taCenter
              Title.Caption = 'Total L'#237'quido'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_bc_icms'
              Title.Alignment = taCenter
              Title.Caption = 'Base ICMS'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_icms'
              Title.Alignment = taCenter
              Title.Caption = 'Valor ICMS'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_st'
              Title.Alignment = taCenter
              Title.Caption = 'Valor ST'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vlr_ipi'
              Title.Alignment = taCenter
              Title.Caption = 'Valor IPI'
              Width = 90
              Visible = True
            end>
        end
        object Panel6: TsPanel
          Left = 2
          Top = 2
          Width = 994
          Height = 23
          Align = alTop
          Caption = 'GERAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
        end
      end
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 998
        Height = 32
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object Label1: TsLabel
          Left = 742
          Top = 10
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
        object Label2: TsLabel
          Left = 867
          Top = 10
          Width = 18
          Height = 13
          Caption = 'at'#233':'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbl_Colaborador: TsLabel
          Left = 17
          Top = 10
          Width = 44
          Height = 13
          Caption = 'Empresa:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbnom_empresa: TsLabel
          Left = 145
          Top = 11
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
        object sLabel2: TsLabel
          Left = 453
          Top = 10
          Width = 94
          Height = 13
          Caption = 'Cliente/Fornecedor:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object ftMovDe: TsDateEdit
          Left = 762
          Top = 6
          Width = 99
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
          DialogTitle = 'Selecione uma Data'
        end
        object ftMovAte: TsDateEdit
          Left = 887
          Top = 6
          Width = 99
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
          DialogTitle = 'Selecione uma Data'
        end
        object cod_empresa: TsComboEdit
          Left = 64
          Top = 6
          Width = 77
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
          OnExit = cod_empresaExit
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
          OnButtonClick = cod_empresaButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object edClienteForn: TsEdit
          Left = 552
          Top = 6
          Width = 181
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
      object pnSaldo: TsPanel
        Left = 0
        Top = 289
        Width = 998
        Height = 21
        Align = alTop
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        SkinData.SkinSection = 'PANEL_LOW'
        object sBevel5: TsBevel
          Left = 604
          Top = 2
          Width = 92
          Height = 17
        end
        object sBevel3: TsBevel
          Left = 880
          Top = 2
          Width = 90
          Height = 17
        end
        object sBevel4: TsBevel
          Left = 788
          Top = 2
          Width = 92
          Height = 17
        end
        object sBevel2: TsBevel
          Left = 696
          Top = 2
          Width = 92
          Height = 17
        end
        object sBevel1: TsBevel
          Left = 513
          Top = 2
          Width = 92
          Height = 17
        end
        object sDBTextFX1: TsDBTextFX
          Left = 513
          Top = 1
          Width = 88
          Height = 18
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'TOT_LIQUIDO'
          DataSource = ds_saldo
        end
        object sDBTextFX2: TsDBTextFX
          Left = 699
          Top = 1
          Width = 86
          Height = 18
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'VLR_ICMS'
          DataSource = ds_saldo
        end
        object sDBTextFX3: TsDBTextFX
          Left = 790
          Top = 1
          Width = 88
          Height = 18
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'VLR_ST'
          DataSource = ds_saldo
        end
        object sDBTextFX4: TsDBTextFX
          Left = 881
          Top = 1
          Width = 87
          Height = 18
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'VLR_IPI'
          DataSource = ds_saldo
        end
        object sLabel1: TsLabel
          Left = 476
          Top = 2
          Width = 33
          Height = 15
          Caption = 'Saldo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
        end
        object sDBTextFX5: TsDBTextFX
          Left = 604
          Top = 1
          Width = 88
          Height = 18
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'VLR_BC_ICMS'
          DataSource = ds_saldo
        end
      end
    end
  end
  object q_total: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT *'
      'from'
      '('
      
        '  SELECT '#39'1 - SAIDA (+)'#39' AS TIPO, A.EMPRESA_FATURAR, E.NOM_EMPRE' +
        'SA, CAST(c.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS VARCHAR(200)) AS C' +
        'LIENTE_FORNECEDOR, A.DTA_EMISSAO, a.NUMDOC, a.NFE, A.CHAVE_NFE, ' +
        'A.TOT_LIQUIDO, A.VLR_BC_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A' +
        '.VLR_TOT_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE'
      '  WHERE NFE IS NOT NULL AND CHAVE_NFE IS NOT NULL'
      ''
      '  union'
      ''
      
        '  SELECT '#39'2 - ENTRADA (-)'#39' AS TIPO, A.EMPRESA AS EMPRESA_FATURAR' +
        ', E.NOM_EMPRESA, CAST(F.COD_FORNECEDOR||'#39'-'#39'||F.RAZAO_SOCIAL AS V' +
        'ARCHAR(200)) AS CLIENTE_FORNECEDOR, A.DTA_DOCUMENTO AS DTA_EMISS' +
        'AO, a.NR_DOCUMENTO, a.NR_DOCUMENTO, '#39#39' AS CHAVE_NFE, A.VL_TOTAL ' +
        'AS TOT_LIQUIDO, a.BASE_ICMS AS VLR_BC_ICMS, A.VALOR_ICMS AS VLR_' +
        'ICMS, A.VALOR_ICMS_SUBST AS VLR_ST, A.TOTAL_IPI AS VLR_IPI, A.VL' +
        '_TOTAL AS VLR_TOT_NF '
      '  FROM ENTRADA1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA'
      '  INNER JOIN FORNECEDOR F ON A.COD_FORNECEDOR = F.COD_FORNECEDOR'
      '  --WHERE A.TIPO_NF = '#39'S'#39' '
      ''
      '  union'
      
        '  SELECT '#39'3 - ENTRADA - DEVOLU'#199#195'O (-)'#39' AS TIPO, A.EMPRESA_FATURA' +
        'R, E.NOM_EMPRESA, CAST(C.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS VARC' +
        'HAR(200)) AS CLIENTE_FORNECEDOR, CAST(A.DATA_REC_NFE_DEV AS DATE' +
        ') AS DTA_EMISSAO, a.NUMDOC, a.NFE_DEV, A.CHAVE_NFE_DEV, A.TOT_LI' +
        'QUIDO, A.VLR_BC_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A.VLR_TOT' +
        '_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE  '
      '  WHERE NFE_DEV IS NOT NULL AND CHAVE_NFE_DEV IS NOT NULL'
      ') Q1'
      ''
      
        'WHERE DTA_EMISSAO between :data_ini AND :data_fim AND EMPRESA_FA' +
        'TURAR = :empresa'
      'AND CLIENTE_FORNECEDOR LIKE '#39'%'#39'||:cliente ||'#39'%'#39' '
      '')
    Left = 320
    Top = 288
    ParamData = <
      item
        Name = 'DATA_INI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_totaltipo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_totalempresa_faturar: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'empresa_faturar'
      Origin = 'empresa_faturar'
      ReadOnly = True
    end
    object q_totalnom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      ReadOnly = True
      Size = 50
    end
    object q_totalcliente_fornecedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_fornecedor'
      Origin = 'cliente_fornecedor'
      ReadOnly = True
      Size = 200
    end
    object q_totaldta_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
      ReadOnly = True
    end
    object q_totalnumdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_totalnfe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nfe'
      Origin = 'nfe'
      ReadOnly = True
    end
    object q_totalchave_nfe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'chave_nfe'
      Origin = 'chave_nfe'
      ReadOnly = True
      Size = 8190
    end
    object q_totaltot_liquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_totalvlr_bc_icms: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_bc_icms'
      Origin = 'vlr_bc_icms'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_totalvlr_icms: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_icms'
      Origin = 'vlr_icms'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_totalvlr_st: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_st'
      Origin = 'vlr_st'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_totalvlr_ipi: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_ipi'
      Origin = 'vlr_ipi'
      ReadOnly = True
    end
    object q_totalvlr_tot_nf: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_tot_nf'
      Origin = 'vlr_tot_nf'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_total: TDataSource
    DataSet = q_total
    Left = 348
    Top = 232
  end
  object q_itens1: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT *'
      'from'
      '('
      
        '  SELECT '#39'1 - SAIDA (+)'#39' AS TIPO, A.EMPRESA_FATURAR, E.NOM_EMPRE' +
        'SA, CAST(c.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS VARCHAR(200)) AS C' +
        'LIENTE_FORNECEDOR, A.DTA_EMISSAO, a.NUMDOC, a.NFE, A.CHAVE_NFE, ' +
        'A.TOT_LIQUIDO, A.VLR_BC_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A' +
        '.VLR_TOT_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE'
      '  WHERE NFE IS NOT NULL AND CHAVE_NFE IS NOT NULL'
      ''
      '  union'
      ''
      
        '  SELECT '#39'2 - ENTRADA (-)'#39' AS TIPO, A.EMPRESA AS EMPRESA_FATURAR' +
        ', E.NOM_EMPRESA, CAST(F.COD_FORNECEDOR||'#39'-'#39'||F.RAZAO_SOCIAL AS V' +
        'ARCHAR(200)) AS CLIENTE_FORNECEDOR, A.DTA_DOCUMENTO AS DTA_EMISS' +
        'AO, a.NR_DOCUMENTO, a.NR_DOCUMENTO, '#39#39' AS CHAVE_NFE, A.VL_TOTAL ' +
        'AS TOT_LIQUIDO, a.BASE_ICMS AS VLR_BC_ICMS, A.VALOR_ICMS AS VLR_' +
        'ICMS, A.VALOR_ICMS_SUBST AS VLR_ST, A.TOTAL_IPI AS VLR_IPI, A.VL' +
        '_TOTAL AS VLR_TOT_NF '
      '  FROM ENTRADA1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA'
      '  INNER JOIN FORNECEDOR F ON A.COD_FORNECEDOR = F.COD_FORNECEDOR'
      '  --WHERE A.TIPO_NF = '#39'S'#39' '
      ''
      '  union'
      
        '  SELECT '#39'3 - ENTRADA - DEVOLU'#199#195'O (-)'#39' AS TIPO, A.EMPRESA_FATURA' +
        'R, E.NOM_EMPRESA, CAST(C.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS VARC' +
        'HAR(200)) AS CLIENTE_FORNECEDOR, CAST(A.DATA_REC_NFE_DEV AS DATE' +
        ') AS DTA_EMISSAO, a.NUMDOC, a.NFE_DEV, A.CHAVE_NFE_DEV, A.TOT_LI' +
        'QUIDO, A.VLR_BC_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A.VLR_TOT' +
        '_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE  '
      '  WHERE NFE_DEV IS NOT NULL AND CHAVE_NFE_DEV IS NOT NULL'
      ') Q1'
      
        'WHERE DTA_EMISSAO between :data_ini AND :data_fim AND EMPRESA_FA' +
        'TURAR = :empresa and TIPO =:tipo'
      'AND CLIENTE_FORNECEDOR LIKE '#39'%'#39'||:cliente ||'#39'%'#39' '
      'ORDER BY TIPO, DTA_EMISSAO')
    Left = 312
    Top = 256
    ParamData = <
      item
        Name = 'DATA_INI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_itens1tipo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_itens1empresa_faturar: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'empresa_faturar'
      Origin = 'empresa_faturar'
      ReadOnly = True
    end
    object q_itens1nom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      ReadOnly = True
      Size = 50
    end
    object q_itens1cliente_fornecedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_fornecedor'
      Origin = 'cliente_fornecedor'
      ReadOnly = True
      Size = 200
    end
    object q_itens1dta_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
      ReadOnly = True
    end
    object q_itens1numdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_itens1nfe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nfe'
      Origin = 'nfe'
      ReadOnly = True
    end
    object q_itens1chave_nfe: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'chave_nfe'
      Origin = 'chave_nfe'
      ReadOnly = True
      Size = 8190
    end
    object q_itens1tot_liquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_itens1vlr_bc_icms: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_bc_icms'
      Origin = 'vlr_bc_icms'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_itens1vlr_icms: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_icms'
      Origin = 'vlr_icms'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_itens1vlr_st: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_st'
      Origin = 'vlr_st'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_itens1vlr_ipi: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_ipi'
      Origin = 'vlr_ipi'
      ReadOnly = True
    end
    object q_itens1vlr_tot_nf: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_tot_nf'
      Origin = 'vlr_tot_nf'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_itens1: TDataSource
    DataSet = q_itens1
    Left = 380
    Top = 228
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
    ReportOptions.LastChange = 41621.702765138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 512
    Top = 288
    Datasets = <
      item
        DataSet = dst_itens
        DataSetName = 'dst_itens'
      end
      item
        DataSet = dst_saldo
        DataSetName = 'dst_saldo'
      end
      item
        DataSet = dst_entradas_resumido
        DataSetName = 'dst_total'
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
        Height = 3.779530000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        DataSet = dst_itens
        DataSetName = 'dst_itens'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 445.984540000000000000
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
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object Subreport1: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = fR_RELATORIO.Page2
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        Condition = 'dst_itens."TIPO"'
        ReprintOnNewPage = True
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Top = 24.456709999999990000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 57.031540000000000000
          Top = 24.456709999999990000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 146.078850000000000000
          Top = 24.456709999999990000
          Width = 187.086609290000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente / Fornecedor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 335.700990000000000000
          Top = 24.456709999999990000
          Width = 75.590551181102400000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Liquido')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.000000000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo:[dst_itens."TIPO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 102.267780000000000000
          Top = 24.677179999999990000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'NF-e')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 494.323130000000000000
          Top = 24.677179999999990000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor ICMS')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 565.134200000000000000
          Top = 24.677179999999990000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor ST')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 639.520100000000000000
          Top = 24.456709999999990000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor IPI')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 414.307360000000000000
          Top = 24.677179999999990000
          Width = 77.480314960629900000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Base ICMS')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = dst_itens
        DataSetName = 'dst_itens'
        RowCount = 0
        object dst_vendas1NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'DTA_EMISSAO'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_itens."DTA_EMISSAO"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 56.031540000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DataField = 'NUMDOC'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_itens."NUMDOC"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 146.287521390000000000
          Width = 187.086609290000000000
          Height = 15.118120000000000000
          DataField = 'CLIENTE_FORNECEDOR'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_itens."CLIENTE_FORNECEDOR"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 102.267780000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DataField = 'NFE'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_itens."NFE"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 334.700990000000000000
          Width = 75.590551181102400000
          Height = 15.118120000000000000
          DataField = 'TOT_LIQUIDO'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_itens."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 493.323130000000000000
          Top = 0.220469999999977500
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ICMS'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_itens."VLR_ICMS"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 564.134200000000000000
          Top = 0.220469999999977500
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ST'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_itens."VLR_ST"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 638.520100000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_IPI'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_itens."VLR_IPI"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 413.307360000000000000
          Top = 0.220469999999977500
          Width = 77.480314960000000000
          Height = 15.118120000000000000
          DataField = 'VLR_BC_ICMS'
          DataSet = dst_itens
          DataSetName = 'dst_itens'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_itens."VLR_BC_ICMS"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = -30.236240000000000000
          Top = 3.000000000000000000
          Width = 325.039580000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total: [dst_itens."TIPO"]  >> Total Qtd Notas: [COUNT(DetailData' +
              '1,1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 298.385755980000000000
          Top = 2.779530000000022000
          Width = 111.496062992126000000
          Height = 15.118120000000000000
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
            '[SUM(<dst_itens."TOT_LIQUIDO">,DetailData1,1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 1.897649999999999000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 494.118430000000000000
          Top = 2.779530000000022000
          Width = 68.031493620000000000
          Height = 15.118120000000000000
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
            '[SUM(<dst_itens."VLR_ICMS">,DetailData1,1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 564.149970000000000000
          Top = 2.779530000000022000
          Width = 71.811023620000000000
          Height = 15.118120000000000000
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
            '[SUM(<dst_itens."VLR_ST">,DetailData1,1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 639.496744020000000000
          Top = 2.779530000000022000
          Width = 71.811023620000000000
          Height = 15.118120000000000000
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
            '[SUM(<dst_itens."VLR_IPI">,DetailData1,1)]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 413.307360000000000000
          Top = 2.779530000000022000
          Width = 77.480314960000000000
          Height = 15.118120000000000000
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
            '[SUM(<dst_itens."VLR_BC_ICMS">,DetailData1,1)]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
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
          Top = 34.338590000000010000
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
          Top = 34.338590000000010000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Impostos entre:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 34.338590000000010000
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
          Left = 404.409710000000000000
          Top = 34.338590000000010000
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
          Left = 427.086890000000000000
          Top = 34.338590000000010000
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
          Left = 105.826840000000000000
          Top = 3.779529999999990000
          Width = 415.748300000000000000
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
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        Condition = 'dst_itens."EMPRESA_FATURAR"'
        ReprintOnNewPage = True
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.000000000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Empresa: [dst_itens."EMPRESA_FATURAR"]-[dst_itens."NOM_EMPRESA"]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 60.472480000000000000
        Width = 718.110700000000000000
        DataSet = dst_entradas_resumido
        DataSetName = 'dst_total'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 8.456710000000000000
          Width = 268.346468900000000000
          Height = 15.118110240000000000
          DataField = 'TIPO'
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dst_total."TIPO"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 277.433210000000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          DataField = 'TOT_LIQUIDO'
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_total."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 467.307360000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ICMS'
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_total."VLR_ICMS"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 542.897960000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ST'
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_total."VLR_ST"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 618.283860000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_IPI'
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_total."VLR_IPI"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 372.323252050000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          DataSet = dst_entradas_resumido
          DataSetName = 'dst_total'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_total."VLR_BC_ICMS"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 8.456710000000000000
          Top = 3.559059999999999000
          Width = 268.346630000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 277.433210000000000000
          Top = 3.559059999999999000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total Liquido')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 467.307360000000000000
          Top = 3.401574799999999000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor ICMS')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 542.897960000000000000
          Top = 3.401574799999999000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor ST')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 618.283860000000000000
          Top = 3.401574799999999000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor IPI')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 372.323252050000000000
          Top = 3.401574799999999000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total BC ICMS')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 277.433210000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'TOT_LIQUIDO'
          DataSet = dst_saldo
          DataSetName = 'dst_saldo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_saldo."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 466.307360000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ICMS'
          DataSet = dst_saldo
          DataSetName = 'dst_saldo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_saldo."VLR_ICMS"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 542.897960000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_ST'
          DataSet = dst_saldo
          DataSetName = 'dst_saldo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_saldo."VLR_ST"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 618.283860000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'VLR_IPI'
          DataSet = dst_saldo
          DataSetName = 'dst_saldo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_saldo."VLR_IPI"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 372.323252050000000000
          Top = 0.220470000000006000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataSet = dst_saldo
          DataSetName = 'dst_saldo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_saldo."VLR_BC_ICMS"]')
          ParentFont = False
        end
      end
      object Memo41: TfrxMemoView
        AllowVectorExport = True
        Left = 33.795300000000000000
        Top = 97.606370000000000000
        Width = 234.330860000000000000
        Height = 15.118120000000000000
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          'Saldo:')
        ParentFont = False
      end
    end
  end
  object q_saldo: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT EMPRESA||'#39'-'#39'||NOM_EMPRESA AS EMPRESA, SUM(TOT_LIQUIDO) AS' +
        ' TOT_LIQUIDO, SUM(VLR_BC_ICMS) AS VLR_BC_ICMS, SUM(VLR_ICMS) AS ' +
        'VLR_ICMS, SUM(VLR_ST) AS VLR_ST, SUM(VLR_IPI) AS VLR_IPI'
      'from'
      '('
      
        '  SELECT '#39'1 - SAIDA (+)'#39' AS TIPO, A.EMPRESA_FATURAR AS EMPRESA, ' +
        'E.NOM_EMPRESA, C.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS CLIENTE_FORN' +
        'ECEDOR, A.DTA_EMISSAO, a.NUMDOC, a.NFE, A.CHAVE_NFE, A.TOT_LIQUI' +
        'DO, A.VLR_BC_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI'
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE'
      '  WHERE NFE IS NOT NULL AND CHAVE_NFE IS NOT NULL'
      ''
      '  union'
      ''
      
        '  SELECT '#39'2 - ENTRADA (-)'#39' AS TIPO, A.EMPRESA, E.NOM_EMPRESA, F.' +
        'COD_FORNECEDOR||'#39'-'#39'||F.RAZAO_SOCIAL AS CLIENTE_FORNECEDOR, A.DTA' +
        '_DOCUMENTO AS DTA_EMISSAO, a.NR_DOCUMENTO, a.NR_DOCUMENTO, '#39#39' AS' +
        ' CHAVE_NFE, A.VL_TOTAL * (-1) AS TOT_LIQUIDO, a.BASE_ICMS * (-1)' +
        ' AS VLR_BC_ICMS, A.VALOR_ICMS * (-1) AS VLR_ICMS, A.VALOR_ICMS_S' +
        'UBST * (-1) AS VLR_ST, A.TOTAL_IPI * (-1) AS VLR_IPI'
      '  FROM ENTRADA1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA'
      '  INNER JOIN FORNECEDOR F ON A.COD_FORNECEDOR = F.COD_FORNECEDOR'
      '  --WHERE A.TIPO_NF = '#39'S'#39' '
      ''
      '  union'
      ''
      
        '  SELECT '#39'3 - ENTRADA - DEVOLU'#199#195'O (-)'#39' AS TIPO, A.EMPRESA_FATURA' +
        'R AS EMPRESA, E.NOM_EMPRESA, C.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE A' +
        'S CLIENTE_FORNECEDOR, CAST(A.DATA_REC_NFE_DEV AS DATE) AS DTA_EM' +
        'ISSAO, a.NUMDOC, a.NFE_DEV, A.CHAVE_NFE_DEV, A.TOT_LIQUIDO * (-1' +
        ') AS TOT_LIQUIDO,  A.VLR_BC_ICMS * (-1) AS VLR_BC_ICMS, A.VLR_IC' +
        'MS * (-1) AS VLR_ICMS, A.VLR_ST * (-1) AS VLR_ST, A.VLR_IPI * (-' +
        '1) AS VLR_IPI'
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE  '
      '  WHERE NFE_DEV IS NOT NULL AND CHAVE_NFE_DEV IS NOT NULL'
      ')'
      
        'WHERE DTA_EMISSAO between :data_ini AND :data_fim AND EMPRESA = ' +
        ':empresa'
      'AND CLIENTE_FORNECEDOR LIKE '#39'%'#39'||:cliente ||'#39'%'#39' '
      'GROUP BY EMPRESA')
    Left = 408
    Top = 232
  end
  object ds_saldo: TDataSource
    DataSet = q_saldo
    Left = 436
    Top = 236
  end
  object dst_entradas_resumido: TfrxDBDataset
    UserName = 'dst_total'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPO=TIPO'
      'EMPRESA=EMPRESA'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'VLR_ICMS=VLR_ICMS'
      'VLR_ST=VLR_ST'
      'VLR_IPI=VLR_IPI'
      'CODEMP=CODEMP'
      'VLR_BC_ICMS=VLR_BC_ICMS')
    DataSource = ds_total
    BCDToCurrency = False
    Left = 344
    Top = 192
  end
  object dst_itens: TfrxDBDataset
    UserName = 'dst_itens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPO=TIPO'
      'EMPRESA_FATURAR=EMPRESA_FATURAR'
      'NOM_EMPRESA=NOM_EMPRESA'
      'CLIENTE_FORNECEDOR=CLIENTE_FORNECEDOR'
      'DTA_EMISSAO=DTA_EMISSAO'
      'NUMDOC=NUMDOC'
      'NFE=NFE'
      'CHAVE_NFE=CHAVE_NFE'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'VLR_ICMS=VLR_ICMS'
      'VLR_ST=VLR_ST'
      'VLR_IPI=VLR_IPI'
      'VLR_TOT_NF=VLR_TOT_NF'
      'VLR_BC_ICMS=VLR_BC_ICMS')
    DataSet = q_itens2
    BCDToCurrency = False
    Left = 504
    Top = 432
  end
  object dst_saldo: TfrxDBDataset
    UserName = 'dst_saldo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'VLR_ICMS=VLR_ICMS'
      'VLR_ST=VLR_ST'
      'VLR_IPI=VLR_IPI'
      'VLR_BC_ICMS=VLR_BC_ICMS')
    DataSource = ds_saldo
    BCDToCurrency = False
    Left = 472
    Top = 240
  end
  object q_itens2: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT *'
      'from'
      '('
      
        '  SELECT '#39'1 - SAIDA (+)'#39' AS TIPO, A.EMPRESA_FATURAR, E.NOM_EMPRE' +
        'SA, c.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS CLIENTE_FORNECEDOR, A.D' +
        'TA_EMISSAO, a.NUMDOC, a.NFE, A.CHAVE_NFE, A.TOT_LIQUIDO, A.VLR_B' +
        'C_ICMS, A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A.VLR_TOT_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE'
      '  WHERE NFE IS NOT NULL AND CHAVE_NFE IS NOT NULL'
      ''
      '  union'
      ''
      
        '  SELECT '#39'2 - ENTRADA (-)'#39' AS TIPO, A.EMPRESA AS EMPRESA_FATURAR' +
        ', E.NOM_EMPRESA, F.COD_FORNECEDOR||'#39'-'#39'||F.RAZAO_SOCIAL AS CLIENT' +
        'E_FORNECEDOR, A.DTA_DOCUMENTO AS DTA_EMISSAO, a.NR_DOCUMENTO, a.' +
        'NR_DOCUMENTO, '#39#39' AS CHAVE_NFE, A.VL_TOTAL AS TOT_LIQUIDO, a.BASE' +
        '_ICMS AS VLR_BC_ICMS, A.VALOR_ICMS AS VLR_ICMS, A.VALOR_ICMS_SUB' +
        'ST AS VLR_ST, A.TOTAL_IPI AS VLR_IPI, A.VL_TOTAL AS VLR_TOT_NF '
      '  FROM ENTRADA1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA'
      '  INNER JOIN FORNECEDOR F ON A.COD_FORNECEDOR = F.COD_FORNECEDOR'
      '  --WHERE A.TIPO_NF = '#39'S'#39' '
      ''
      '  union'
      
        '  SELECT '#39'3 - ENTRADA - DEVOLU'#199#195'O (-)'#39' AS TIPO, A.EMPRESA_FATURA' +
        'R, E.NOM_EMPRESA, C.COD_CLIENTE||'#39'-'#39'||C.NOM_CLIENTE AS CLIENTE_F' +
        'ORNECEDOR, CAST(A.DATA_REC_NFE_DEV AS DATE) AS DTA_EMISSAO, a.NU' +
        'MDOC, a.NFE_DEV, A.CHAVE_NFE_DEV, A.TOT_LIQUIDO, A.VLR_BC_ICMS, ' +
        'A.VLR_ICMS, A.VLR_ST, A.VLR_IPI, A.VLR_TOT_NF '
      '  FROM VENDAS1 a '
      '  INNER JOIN EMPRESA E ON E.COD_EMPRESA = A.EMPRESA_FATURAR'
      '  INNER JOIN CLIENTE C ON A.COD_CLIENTE = C.COD_CLIENTE  '
      '  WHERE NFE_DEV IS NOT NULL AND CHAVE_NFE_DEV IS NOT NULL)'
      
        'WHERE DTA_EMISSAO between :data_ini AND :data_fim AND EMPRESA_FA' +
        'TURAR = :empresa'
      'AND CLIENTE_FORNECEDOR LIKE '#39'%'#39'||:cliente ||'#39'%'#39' '
      'ORDER BY TIPO, DTA_EMISSAO')
    Left = 504
    Top = 360
  end
  object ds_itens2: TDataSource
    DataSet = q_itens2
    Left = 508
    Top = 396
  end
end
