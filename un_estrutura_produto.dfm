object frm_estrutura_produto: Tfrm_estrutura_produto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Estrutura de Produto'
  ClientHeight = 710
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 35
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Lbl_produto: TsLabel
      Left = 9
      Top = 12
      Width = 86
      Height = 13
      Caption = 'Produto Acabado:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_produto: TsLabelFX
      Left = 181
      Top = 8
      Width = 20
      Height = 21
      Caption = '...'
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
    end
    object sbClonar: TSpeedButton
      Left = 680
      Top = 7
      Width = 76
      Height = 24
      Caption = 'Clonar'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbClonarClick
    end
    object Prcod_produto: TsComboEdit
      Left = 98
      Top = 8
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
      OnEnter = Prcod_produtoEnter
      OnExit = Prcod_produtoExit
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
      OnButtonClick = Prcod_produtoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 35
    Width = 760
    Height = 675
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object dgLista: TDBGrid
      Left = 2
      Top = 25
      Width = 756
      Height = 143
      Align = alTop
      DataSource = dsInsumos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'Ordem'
          Width = 36
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IDPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 440
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Custo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Custo Total'
          Visible = True
        end>
    end
    object PnInsumo: TPanel
      Left = 2
      Top = 168
      Width = 756
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      Enabled = False
      TabOrder = 1
      object sLabel2: TsLabel
        Left = 7
        Top = 9
        Width = 42
        Height = 13
        Caption = 'Insumos:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object lbProdutoDesc: TsDBTextFX
        Left = 127
        Top = 6
        Width = 20
        Height = 21
        AutoSize = True
        Caption = '...'
        ShowAccelChar = False
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
        DataField = 'NOME_PRODUTO'
        DataSource = dsInsumos
      end
      object sLabel3: TsLabel
        Left = 584
        Top = 9
        Width = 58
        Height = 13
        Caption = 'Quantidade:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel1: TsLabel
        Left = 478
        Top = 9
        Width = 34
        Height = 13
        Caption = 'Ordem:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Mecod_produto: TRxDBComboEdit
        Left = 55
        Top = 6
        Width = 66
        Height = 21
        DataField = 'IDPRODUTO'
        DataSource = dsInsumos
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
        TabOrder = 0
        OnButtonClick = Mecod_produtoButtonClick
        OnExit = Mecod_produtoExit
      end
      object Meqtd: TsDBCalcEdit
        Left = 648
        Top = 6
        Width = 91
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
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
        DecimalPlaces = 3
        DisplayFormat = '0.000'
        DataSource = dsInsumos
        DataField = 'QUANTIDADE'
      end
      object sDBEdit1: TsDBEdit
        Left = 517
        Top = 6
        Width = 57
        Height = 21
        DataField = 'ORDEM'
        DataSource = dsInsumos
        TabOrder = 1
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
    end
    object Panel5: TPanel
      Left = 2
      Top = 200
      Width = 756
      Height = 39
      Align = alTop
      TabOrder = 2
      object Btnovped: TsBitBtn
        Left = 179
        Top = 6
        Width = 75
        Height = 25
        Caption = '&INSERIR'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnovpedClick
        SkinData.SkinSection = 'BUTTON'
      end
      object Btaltped: TsBitBtn
        Left = 260
        Top = 6
        Width = 75
        Height = 25
        Caption = '&ALTERAR'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BtaltpedClick
        SkinData.SkinSection = 'BUTTON'
      end
      object Btgraped: TsBitBtn
        Left = 341
        Top = 6
        Width = 75
        Height = 25
        Caption = '&GRAVAR'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtgrapedClick
        SkinData.SkinSection = 'BUTTON'
      end
      object Btcanped: TsBitBtn
        Left = 503
        Top = 6
        Width = 75
        Height = 25
        Caption = '&CANCELAR'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtcanpedClick
        SkinData.SkinSection = 'BUTTON'
      end
      object BTEXCLUIR: TsBitBtn
        Left = 422
        Top = 6
        Width = 75
        Height = 25
        Caption = '&EXCLUIR'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BTEXCLUIRClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object Panel8: TPanel
      Left = 2
      Top = 274
      Width = 756
      Height = 399
      Align = alClient
      Caption = 'Panel8'
      TabOrder = 3
      object sPanel1: TsPanel
        Left = 1
        Top = 1
        Width = 754
        Height = 23
        Align = alTop
        Caption = 'PROCESSOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
      end
      object pnProcesso: TPanel
        Left = 1
        Top = 123
        Width = 754
        Height = 162
        Align = alBottom
        BevelInner = bvLowered
        Enabled = False
        TabOrder = 1
        object sLabel4: TsLabel
          Left = 10
          Top = 9
          Width = 34
          Height = 13
          Caption = 'Se'#231#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbEtapa: TsDBTextFX
          Left = 143
          Top = 6
          Width = 20
          Height = 21
          AutoSize = True
          Caption = '...'
          ShowAccelChar = False
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'ETAPA_DESCRICAO'
          DataSource = dsProcessos
        end
        object sLabel5: TsLabel
          Left = 464
          Top = 9
          Width = 65
          Height = 13
          Caption = 'Tempo (Min.):'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBTextFX1: TsDBTextFX
          Left = 382
          Top = 6
          Width = 46
          Height = 21
          AutoSize = True
          Caption = 'R$ 0,00'
          ShowAccelChar = False
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'CUSTO_HORA'
          DataSource = dsProcessos
        end
        object sLabel6: TsLabel
          Left = 319
          Top = 9
          Width = 58
          Height = 13
          Caption = 'Custo/Hora:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel7: TsLabel
          Left = 607
          Top = 9
          Width = 27
          Height = 13
          Caption = 'Total:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBTextFX2: TsDBTextFX
          Left = 670
          Top = 6
          Width = 46
          Height = 21
          AutoSize = True
          Caption = 'R$ 0,00'
          ShowAccelChar = False
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
          DataField = 'CUSTO_TOTAL'
          DataSource = dsProcessos
        end
        object sLabel8: TsLabel
          Left = 10
          Top = 33
          Width = 51
          Height = 13
          Caption = 'Descri'#231#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sbInsSecao: TSpeedButton
          Left = 46
          Top = 6
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbInsSecaoClick
        end
        object meEtapaId: TRxDBComboEdit
          Left = 71
          Top = 6
          Width = 66
          Height = 21
          DataField = 'ETAPA_ID'
          DataSource = dsProcessos
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
          TabOrder = 0
          OnButtonClick = meEtapaIdButtonClick
          OnExit = meEtapaIdExit
        end
        object edDesc: TsDBMemo
          Left = 10
          Top = 52
          Width = 735
          Height = 101
          DataField = 'DESCRICAO'
          DataSource = dsProcessos
          TabOrder = 2
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
        end
        object edtempo: TsDBCalcEdit
          Left = 535
          Top = 6
          Width = 43
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = edTempoExit
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
          ShowButton = False
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0'
          DataSource = dsProcessos
          DataField = 'TEMPO'
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 285
        Width = 754
        Height = 39
        Align = alBottom
        TabOrder = 2
        object btInsSec: TsBitBtn
          Left = 178
          Top = 6
          Width = 75
          Height = 26
          Caption = '&INSERIR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btInsSecClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btAltSec: TsBitBtn
          Left = 259
          Top = 6
          Width = 75
          Height = 25
          Caption = '&ALTERAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btAltSecClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btGravSec: TsBitBtn
          Left = 340
          Top = 6
          Width = 75
          Height = 25
          Caption = '&GRAVAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btGravSecClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btCanSec: TsBitBtn
          Left = 502
          Top = 6
          Width = 75
          Height = 25
          Caption = '&CANCELAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btCanSecClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btExcSec: TsBitBtn
          Left = 421
          Top = 6
          Width = 75
          Height = 25
          Caption = '&EXCLUIR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btExcSecClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object gbProcessos: TDBGrid
        Left = 1
        Top = 24
        Width = 754
        Height = 99
        Align = alClient
        DataSource = dsProcessos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ETAPA_ID'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ETAPA_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o(Se'#231#227'o)'
            Width = 450
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO_HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Custo/Hora'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEMPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tempo (Min.)'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTO_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Custo Total'
            Width = 70
            Visible = True
          end>
      end
      object pngeral: TPanel
        Left = 1
        Top = 359
        Width = 754
        Height = 39
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = clBlack
        ParentBackground = False
        TabOrder = 4
      end
      object pntotalprocessos: TPanel
        Left = 1
        Top = 324
        Width = 754
        Height = 35
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Color = clBlack
        ParentBackground = False
        TabOrder = 5
      end
    end
    object sPanel2: TsPanel
      Left = 2
      Top = 2
      Width = 756
      Height = 23
      Align = alTop
      Caption = 'INSUMOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      SkinData.SkinSection = 'PANEL'
    end
    object Panel2: TPanel
      Left = 2
      Top = 239
      Width = 756
      Height = 35
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Color = clBlack
      ParentBackground = False
      TabOrder = 5
    end
  end
  object mmInsumos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'IDPRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'NOME_PRODUTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'QTD_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'DT_ULTIMA_COMPRA'
        DataType = ftDate
      end
      item
        Name = 'QTD_ULTIMA_COMPRA'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_ULTIMA_COMPRA'
        DataType = ftCurrency
      end
      item
        Name = 'FORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'NR_DCTO_ULTIMA_COMPRA'
        DataType = ftInteger
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'QTD_EMBALAGEM'
        DataType = ftFloat
      end
      item
        Name = 'COD_PRODUTO_FORNECEDOR'
        DataType = ftString
        Size = 10
      end>
    Left = 304
    Top = 64
    object mmInsumosIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
    end
    object mmInsumosNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object mmInsumosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,###,##0.00'
    end
    object mmInsumosORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object mmInsumosCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmInsumosCUSTO_TOTAL: TCurrencyField
      FieldName = 'CUSTO_TOTAL'
    end
    object mmInsumosTOTAL_GERAL: TCurrencyField
      FieldName = 'TOTAL_GERAL'
    end
  end
  object dsInsumos: TDataSource
    AutoEdit = False
    DataSet = mmInsumos
    Left = 344
    Top = 64
  end
  object mmProcessos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'IDPRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'NOME_PRODUTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'QTD_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'DT_ULTIMA_COMPRA'
        DataType = ftDate
      end
      item
        Name = 'QTD_ULTIMA_COMPRA'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_ULTIMA_COMPRA'
        DataType = ftCurrency
      end
      item
        Name = 'FORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'NR_DCTO_ULTIMA_COMPRA'
        DataType = ftInteger
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'QTD_EMBALAGEM'
        DataType = ftFloat
      end
      item
        Name = 'COD_PRODUTO_FORNECEDOR'
        DataType = ftString
        Size = 10
      end>
    Left = 312
    Top = 360
    object mmProcessosETAPA_ID: TIntegerField
      FieldName = 'ETAPA_ID'
    end
    object mmProcessosETAPA_DESCRICAO: TStringField
      FieldName = 'ETAPA_DESCRICAO'
      Size = 100
    end
    object mmProcessosCUSTO_HORA: TCurrencyField
      FieldName = 'CUSTO_HORA'
    end
    object mmProcessosTEMPO: TIntegerField
      DisplayWidth = 10
      FieldName = 'TEMPO'
    end
    object mmProcessosCUSTO_TOTAL: TCurrencyField
      FieldName = 'CUSTO_TOTAL'
    end
    object mmProcessosCOD_PRODUTO_ACABADO: TIntegerField
      FieldName = 'COD_PRODUTO_ACABADO'
    end
    object mmProcessosCOD_PRODUTO_INSUMO: TIntegerField
      FieldName = 'COD_PRODUTO_INSUMO'
    end
    object mmProcessosDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
    end
  end
  object dsProcessos: TDataSource
    AutoEdit = False
    DataSet = mmProcessos
    Left = 360
    Top = 368
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 16
    object I1: TMenuItem
      Caption = 'Imprimir'
      object I2: TMenuItem
        Caption = 'Insumos'
        ShortCut = 32883
        OnClick = I2Click
      end
      object P1: TMenuItem
        Caption = 'Processos'
        ShortCut = 32884
      end
      object N1: TMenuItem
        Caption = 'Geral'
        ShortCut = 32885
      end
    end
  end
  object frxReport1: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 42705.363689340280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var somatotal : real;  '
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      'end;          '
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      
        'procedure AjusteTam(x:integer);                                 ' +
        '                              '
      '                                              '
      'begin'
      '  mmInsumo.font.size := x;'
      '  mmord.font.size    := x;'
      '  mmQtd.font.size    := x;'
      '  mmCusto.font.size  := x;'
      '  mmcod.font.size  := x;        '
      '  mmTotal.font.size  := x;'
      '  mmord.left := ( 12 * (<dst_Estrutura."NIVEL">-1) );'
      
        '  mmcod.left := 38 + ( 12 * (<dst_Estrutura."NIVEL">-1) );      ' +
        '                                 '
      '  mmInsumo.left := 94 + ( 12 * (<dst_Estrutura."NIVEL">-1) );'
      '  //mmInsumo.width := mmInsumo.width - mmInsumo.left;'
      '  linha.visible := <dst_Estrutura."NIVEL"> = 1;'
      '    '
      
        '  if <dst_Estrutura."NIVEL"> = 1 then somatotal := somatotal + <' +
        'dst_Estrutura."CUSTO_TOTAL">;                                   ' +
        '                                                               '
      'end;'
      'begin'
      '  //if <dst_Estrutura."NIVEL"> = 1 then AjusteTam();'
      '    '
      '  AjusteTam(13-(<dst_Estrutura."NIVEL">*2));'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  somatotal := 0;                                          '
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '                                                                ' +
        '                   '
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmTotalGeral.text := '#39'Custo Material: '#39'+formatfloat('#39'R$ #,###,' +
        '##0.00'#39', somatotal);  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 192
    Top = 212
    Datasets = <
      item
        DataSet = dst_Estrutura
        DataSetName = 'dst_Estrutura'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 17.305956880000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dst_Estrutura
        DataSetName = 'dst_Estrutura'
        RowCount = 0
        object mmInsumo: TfrxMemoView
          AllowVectorExport = True
          Left = 94.726659160000000000
          Top = 0.742662550000000000
          Width = 381.074240730000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_Estrutura."PRODUTO_INSUMO"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '000000'
              Kind = fkNumeric
            end
            item
            end>
        end
        object mmTotal: TfrxMemoView
          AllowVectorExport = True
          Left = 641.763779530000000000
          Top = 0.742662550000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'CUSTO_TOTAL'
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_Estrutura."CUSTO_TOTAL"]')
          ParentFont = False
        end
        object mmOrd: TfrxMemoView
          AllowVectorExport = True
          Left = 2.229471310000000000
          Top = 0.669140010000000000
          Width = 36.047310000000000000
          Height = 15.118120000000000000
          DataField = 'ORDEM'
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_Estrutura."ORDEM"]')
          ParentFont = False
        end
        object mmQtd: TfrxMemoView
          AllowVectorExport = True
          Left = 508.890888640000000000
          Top = 0.742662550000000000
          Width = 55.181102360000000000
          Height = 15.118120000000000000
          DataField = 'QUANTIDADE'
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_Estrutura."QUANTIDADE"]')
          ParentFont = False
        end
        object mmCusto: TfrxMemoView
          AllowVectorExport = True
          Left = 566.173228350000000000
          Top = 0.669140000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'CUSTO'
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_Estrutura."CUSTO"]')
          ParentFont = False
        end
        object Linha: TfrxLineView
          AllowVectorExport = True
          Left = 2.857142860000000000
          Width = 715.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mmcod: TfrxMemoView
          AllowVectorExport = True
          Left = 41.000000000000000000
          Top = 0.669140000000000000
          Width = 51.779527560000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_Estrutura."COD_INSUMO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 477.732283460000000000
          Top = 0.669140000000000000
          Width = 28.724409450000000000
          Height = 15.118120000000000000
          DataField = 'UNIDADE'
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_Estrutura."UNIDADE"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 129.611935720000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 638.948671430000000000
          Top = 107.857142860000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object mmTotalGeral: TfrxMemoView
          AllowVectorExport = True
          Left = 3.571428580000000000
          Top = 3.667902860000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 2.142857150000000000
          Top = 0.096474289999999990
          Width = 715.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 2.857142870000000000
          Top = 18.810760000000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CUSTO M.O.D.: [dst_Estrutura."TOTALPROCESSOS"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 3.142857150000000000
          Top = 86.096474290000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Custo Total: [dst_Estrutura."CUSTO_GERAL"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 377.142857130000000000
          Top = 83.667902860000000000
          Width = 336.833520810000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.285714280000000000
          Top = 34.441867150000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CUSTO M.O.I.: R$ 0,00')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 2.857142850000000000
          Top = 49.584724290000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CUSTO G.G.F.: R$ 0,00')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 2.857142860000000000
          Top = 65.156152860000000000
          Width = 711.096735460000000000
          Height = 15.118120000000000000
          DataSet = dst_Estrutura
          DataSetName = 'dst_Estrutura'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CUSTO SERV.EXT.: R$ 0,00')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 124.708720000000000000
        Top = 49.133890000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 616.842920000000000000
          Top = 1.000000000000000000
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
          Top = 19.897650000000000000
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
          Left = 4.559060000000000000
          Top = 43.782931430000000000
          Width = 710.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Estrutura de Produtos - insumos')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 10.653680000000000000
          Top = 3.779530000000000000
          Width = 616.748300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.726659150000000000
          Top = 109.320584920000000000
          Width = 381.074252950000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Insumo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 641.761904760000000000
          Top = 109.606299210000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 2.142857140000000000
          Top = 109.606299210000000000
          Width = 36.047310000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Ord.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 477.571428570000000000
          Top = 109.228346460000000000
          Width = 28.578231430000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 566.047619040000000000
          Top = 109.104205230000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Custo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 5.142857140000000000
          Top = 74.008967140000000000
          Width = 710.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '000000'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[acabado]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 40.714285710000000000
          Top = 109.437538570000000000
          Width = 51.761595710000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'C'#243'd.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 508.724409448819000000
          Top = 109.151824280000000000
          Width = 55.181102360000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtd.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 112
    Top = 244
  end
  object mmRelatorio: TRxMemoryDataEx
    FieldDefs = <
      item
        Name = 'mmRelatorioNIVEL'
        DataType = ftInteger
      end
      item
        Name = 'mmRelatorioPRODUTO_ACABADO'
        DataType = ftString
        Size = 200
      end>
    SortOrder = soAsc
    SortCaseSens = scYes
    SortFields = 'ORDEM_GERAL'
    AutoSortOnOpen = True
    AutoRefreshOnFilterChanged = True
    Left = 256
    Top = 136
    object mmRelatorioNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object mmRelatorioPRODUTO_ACABADO: TStringField
      FieldName = 'PRODUTO_ACABADO'
      Size = 200
    end
    object mmRelatorioPRODUTO_INSUMO: TStringField
      FieldName = 'PRODUTO_INSUMO'
      Size = 200
    end
    object mmRelatorioORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object mmRelatorioQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object mmRelatorioCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmRelatorioCUSTO_TOTAL: TCurrencyField
      FieldName = 'CUSTO_TOTAL'
    end
    object mmRelatorioQUANT_NIVEL: TIntegerField
      FieldName = 'QUANT_NIVEL'
    end
    object mmRelatorioCOD_INSUMO: TIntegerField
      FieldName = 'COD_INSUMO'
    end
    object mmRelatorioORDEMGERAL: TFloatField
      FieldName = 'ORDEMGERAL'
    end
    object mmRelatorioTOTALPROCESSOS: TFloatField
      FieldName = 'TOTALPROCESSOS'
    end
    object mmRelatorioCUSTO_GERAL: TFloatField
      FieldName = 'CUSTO_GERAL'
    end
    object mmRelatorioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
  end
  object dsRelatorio: TDataSource
    AutoEdit = False
    DataSet = mmRelatorio
    Left = 344
    Top = 128
  end
  object dst_Estrutura: TfrxDBDataset
    UserName = 'dst_Estrutura'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NIVEL=NIVEL'
      'PRODUTO_ACABADO=PRODUTO_ACABADO'
      'PRODUTO_INSUMO=PRODUTO_INSUMO'
      'ORDEM=ORDEM'
      'QUANTIDADE=QUANTIDADE'
      'CUSTO=CUSTO'
      'CUSTO_TOTAL=CUSTO_TOTAL'
      'QUANT_NIVEL=QUANT_NIVEL'
      'COD_INSUMO=COD_INSUMO'
      'ORDEMGERAL=ORDEMGERAL'
      'TOTALPROCESSOS=TOTALPROCESSOS'
      'CUSTO_GERAL=CUSTO_GERAL'
      'UNIDADE=UNIDADE')
    DataSource = dsRelatorio
    BCDToCurrency = False
    Left = 576
    Top = 128
  end
end
