object FrAvisosDiretoria: TFrAvisosDiretoria
  Left = 24
  Top = 13
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Avisos'
  ClientHeight = 415
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 374
    Width = 805
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      805
      41)
    object btImprimir: TsSpeedButton
      Left = 387
      Top = 5
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
    object btSair: TsSpeedButton
      Left = 1205
      Top = 5
      Width = 86
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
        34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
        A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      OnClick = btSairClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ExplicitLeft = 504
    end
  end
  object pg: TsPageControl
    Left = 0
    Top = 0
    Width = 805
    Height = 374
    ActivePage = TbPedido
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object TbPedido: TsTabSheet
      Caption = 'Pedidos'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel2: TsPanel
        Left = 0
        Top = 337
        Width = 797
        Height = 9
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object Panel5: TsPanel
          Left = 2
          Top = 2
          Width = 793
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
          DesignSize = (
            793
            23)
          object Shape4: TShape
            Left = 680
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clOlive
            ExplicitLeft = 851
          end
          object sLabel4: TsLabel
            Left = 699
            Top = 5
            Width = 73
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Falta Estoque'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 870
          end
        end
        object dgItem: TDBGrid
          Left = 2
          Top = 25
          Width = 793
          Height = 1
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
          OnDrawColumnCell = dgItemDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'PRODUTO'
              Title.Caption = 'Produto'
              Width = 512
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Caption = 'Volume'
              Width = 46
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QTD'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_ESTOQUE'
              Title.Alignment = taCenter
              Title.Caption = 'Estoque'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_BRUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Venda'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o'
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERC_DESC'
              Title.Alignment = taCenter
              Title.Caption = '% Desc.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUB_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Sub Tot.'
              Width = 70
              Visible = True
            end>
        end
      end
      object Panel3: TsPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 337
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Panel4: TsPanel
          Left = 2
          Top = 264
          Width = 793
          Height = 24
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
          Width = 793
          Height = 239
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
          OnCellClick = dgPedidoCellClick
          OnDrawColumnCell = dgPedidoDrawColumnCell
          OnEnter = dgPedidoEnter
          OnKeyDown = dgPedidoKeyDown
          OnKeyUp = dgPedidoKeyUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'numdoc'
              Title.Alignment = taCenter
              Title.Caption = 'N'#176' Pedido'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dtadoc'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Caption = 'Cliente'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'representante'
              Title.Caption = 'Representante'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fop'
              Title.Caption = 'Forma Pgto.'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prazo'
              Title.Caption = 'Prazo'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_bruto'
              Title.Alignment = taCenter
              Title.Caption = 'T.Bruto'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_liquido'
              Title.Alignment = taCenter
              Title.Caption = 'T.L'#237'quido'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'margem_lucro'
              Title.Caption = 'Marg.L.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'margem_minima'
              Title.Caption = 'Mrg.M.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'cliente_bloqueado'
              Title.Alignment = taCenter
              Title.Caption = 'CB'
              Width = 20
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'atraso'
              Title.Alignment = taCenter
              Title.Caption = 'FV'
              Width = 20
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'estoque'
              Title.Alignment = taCenter
              Title.Caption = 'FE'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'margem_abaixo'
              Title.Caption = 'MA'
              Visible = True
            end>
        end
        object Panel6: TsPanel
          Left = 2
          Top = 2
          Width = 793
          Height = 23
          Align = alTop
          Caption = 
            'PEDIDOS EM ATRASO OU IRREGULARES                                ' +
            '                                                              '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
          DesignSize = (
            793
            23)
          object Shape1: TShape
            Left = 302
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clMaroon
            ExplicitLeft = 473
          end
          object sLabel1: TsLabel
            Left = 321
            Top = 4
            Width = 100
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Cliente Bloqueado'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 492
          end
          object sLabel2: TsLabel
            Left = 448
            Top = 5
            Width = 114
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Faturas Vencidas (F9)'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 619
          end
          object Shape2: TShape
            Left = 429
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clTeal
            ExplicitLeft = 600
          end
          object sLabel3: TsLabel
            Left = 590
            Top = 5
            Width = 73
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Falta Estoque'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 761
          end
          object Shape3: TShape
            Left = 571
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clOlive
            ExplicitLeft = 742
          end
          object Shape5: TShape
            Left = 675
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clGray
            ExplicitLeft = 846
          end
          object sLabel5: TsLabel
            Left = 694
            Top = 5
            Width = 86
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Margem Abaixo'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 865
          end
        end
        object DBMemo1: TDBMemo
          Left = 2
          Top = 288
          Width = 793
          Height = 47
          Align = alBottom
          DataField = 'OBSERVACOES_PEDIDO'
          DataSource = ds_pedidos
          TabOrder = 3
        end
        object ckBloqueado: TsDBCheckBox
          Left = 664
          Top = 112
          Width = 20
          Height = 20
          Hint = 'Cliente Bloqueado'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'CLIENTE_BLOQUEADO'
          DataSource = ds_pedidos
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object ckAtraso: TsDBCheckBox
          Left = 664
          Top = 152
          Width = 20
          Height = 20
          Hint = 'Contas Vencidas n'#227'o Pagas'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'ATRASO'
          DataSource = ds_pedidos
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
        object ckEstoque: TsDBCheckBox
          Left = 664
          Top = 184
          Width = 20
          Height = 20
          Hint = 'Sem Estoque'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'ESTOQUE'
          DataSource = ds_pedidos
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
        object ckMargemAbaixo: TsDBCheckBox
          Left = 664
          Top = 216
          Width = 20
          Height = 20
          Hint = 'Sem Estoque'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'MARGEM_ABAIXO'
          DataSource = ds_pedidos
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
      end
    end
    object tbEstoque: TsTabSheet
      Caption = 'Estoque'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 23
        Align = alTop
        Caption = 'GRUPO DE PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
      end
      object dg_grupo: TDBGrid
        Left = 0
        Top = 23
        Width = 797
        Height = 282
        Align = alTop
        Color = clWhite
        DataSource = ds_grupo
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
        OnCellClick = dg_grupoCellClick
        OnEnter = dg_grupoEnter
        OnKeyUp = dg_grupoKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'cod_grupo'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nom_grupo'
            Title.Caption = 'Nome'
            Width = 914
            Visible = True
          end>
      end
      object sPanel2: TsPanel
        Left = 0
        Top = 305
        Width = 797
        Height = 23
        Align = alTop
        Caption = 'PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
      end
      object dg_produtos: TDBGrid
        Left = 0
        Top = 328
        Width = 797
        Height = 18
        Align = alClient
        Color = clWhite
        DataSource = ds_produto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_PRODUTO'
            Title.Caption = 'Produto'
            Width = 609
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ESTOQUE_MINIMO'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque M'#237'nimo'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_RESERVADO'
            Title.Alignment = taCenter
            Title.Caption = 'Reservado'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Width = 100
            Visible = True
          end>
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Pedidos '#224' serem liberados'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel3: TsPanel
        Left = 0
        Top = 337
        Width = 797
        Height = 9
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sPanel4: TsPanel
          Left = 2
          Top = 2
          Width = 793
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
        object sDBGrid1: TDBGrid
          Left = 2
          Top = 25
          Width = 793
          Height = 265
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
          OnDrawColumnCell = dgItemDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'PRODUTO'
              Title.Caption = 'Produto'
              Width = 513
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Caption = 'Volume'
              Width = 46
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QTD'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_ESTOQUE'
              Title.Alignment = taCenter
              Title.Caption = 'Estoque'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_BRUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Venda'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o'
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERC_DESC'
              Title.Alignment = taCenter
              Title.Caption = '% Desc.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUB_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Sub Tot.'
              Width = 70
              Visible = True
            end>
        end
      end
      object sPanel5: TsPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 337
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sPanel6: TsPanel
          Left = 2
          Top = 264
          Width = 793
          Height = 24
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
        object dgPedidosLiberacao: TDBGrid
          Left = 2
          Top = 25
          Width = 793
          Height = 239
          Align = alClient
          Color = clWhite
          DataSource = ds_pedidos_liberacao
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
          OnCellClick = dgPedidosLiberacaoCellClick
          OnDrawColumnCell = dgPedidosLiberacaoDrawColumnCell
          OnDblClick = dgPedidosLiberacaoDblClick
          OnEnter = dgPedidosLiberacaoEnter
          OnKeyDown = dgPedidosLiberacaoKeyDown
          OnKeyUp = dgPedidosLiberacaoKeyUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'numdoc'
              Title.Alignment = taCenter
              Title.Caption = 'N'#176' Pedido'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dtadoc'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Title.Caption = 'Cliente'
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REPRESENTANTE'
              Title.Caption = 'Representante'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOP'
              Title.Caption = 'Forma Pgto.'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRAZO'
              Title.Caption = 'Prazo'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOT_BRUTO'
              Title.Alignment = taCenter
              Title.Caption = 'T.Bruto'
              Width = 65
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
              FieldName = 'MARGEM_LUCRO'
              Title.Caption = 'Marg.L.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEM_MINIMA'
              Title.Caption = 'Mrg.M.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'atraso'
              Title.Alignment = taCenter
              Title.Caption = 'FA'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEM_ABAIXO'
              Title.Caption = 'MA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIBERAR_FATURAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'LP'
              Width = 20
              Visible = True
            end>
        end
        object sPanel7: TsPanel
          Left = 2
          Top = 2
          Width = 793
          Height = 23
          Align = alTop
          Caption = 
            'PEDIDOS - SOLICITA'#199#195'O DE LIBERA'#199#195'O DE FATURAMENTO               ' +
            '                                            '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
          DesignSize = (
            793
            23)
          object Shape10: TShape
            Left = 333
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clGray
            ExplicitLeft = 846
          end
          object sLabel10: TsLabel
            Left = 352
            Top = 5
            Width = 86
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Margem Abaixo'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 865
          end
          object Shape6: TShape
            Left = 191
            Top = 5
            Width = 14
            Height = 15
            Anchors = [akTop, akRight]
            Brush.Color = clTeal
            ExplicitLeft = 704
          end
          object sLabel6: TsLabel
            Left = 210
            Top = 5
            Width = 114
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Faturas Vencidas (F9)'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ExplicitLeft = 723
          end
        end
        object DBMemo2: TDBMemo
          Left = 2
          Top = 288
          Width = 793
          Height = 47
          Align = alBottom
          DataField = 'OBSERVACOES_PEDIDO'
          DataSource = ds_pedidos
          TabOrder = 3
        end
        object ckAtrasoLib: TsDBCheckBox
          Left = 736
          Top = 152
          Width = 20
          Height = 20
          Hint = 'Contas Vencidas n'#227'o Pagas'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'ATRASO'
          DataSource = ds_pedidos_liberacao
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
        object ckMargemLib: TsDBCheckBox
          Left = 736
          Top = 216
          Width = 20
          Height = 20
          Hint = 'Margem'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'MARGEM_ABAIXO'
          DataSource = ds_pedidos_liberacao
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
        object ckLiberarPedido: TsDBCheckBox
          Left = 784
          Top = 176
          Width = 20
          Height = 20
          Hint = 'Liberar Pedido?'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Visible = False
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          DataField = 'LIBERAR_FATURAMENTO'
          DataSource = ds_pedidos_liberacao
          ValueChecked = #39'S'#39
          ValueUnchecked = #39'N'#39
        end
      end
    end
  end
  object q_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT distinct a.NUMDOC, a.DTADOC, a.cod_cliente, cast(a.COD_CL' +
        'IENTE||'#39'-'#39'||c.NOM_CLIENTE as VARCHAR(200)) as cliente, a.TOT_BRU' +
        'TO, a.TOT_LIQUIDO,'
      
        'cast(a.COD_FOP||'#39'-'#39'||f.NOM_FOP as VARCHAR(200)) as fop, cast(a.C' +
        'OD_REPRESENTANTE||'#39'-'#39'||r.NOM_REPRESENTANTE as VARCHAR(200)) as r' +
        'epresentante, p.PRAZO, a.NR_PEDIDO_PALM, a.PALM_NR_CONEXAO, A.OB' +
        'SERVACOES_PEDIDO,'
      
        'COALESCE((select DISTINCT '#39'S'#39' as situacao_estoque from produto p' +
        'd inner join vendas2 vd2 on a.NUMDOC = vd2.NUMDOC where pd.COD_P' +
        'RODUTO = vd2.COD_PRODUTO and pd.QTD_ESTOQUE < 1), '#39'N'#39') AS ESTOQU' +
        'E,'
      'c.CLIENTE_BLOQUEADO,'
      
        '(select case when coalesce(sum(cr.VALOR), 0) > 0 then '#39'S'#39' else '#39 +
        'N'#39' end as ATRASO from cr1 cr where (cr.cod_cliente= a.COD_CLIENT' +
        'E) and (cr.dtaven+5 < current_date) and (cr.dtarec is null)),'
      
        'CASE WHEN V.MARGEM_LUCRO < R.MARGEM_MINIMA THEN '#39'S'#39' ELSE '#39'N'#39' END' +
        ' MARGEM_ABAIXO,'
      'v.MARGEM_LUCRO,'
      'r.MARGEM_MINIMA'
      ''
      'FROM VENDAS1 a'
      'INNER JOIN V_COMISSAO_NOVA V ON V.NUMDOC = A.NUMDOC'
      'left outer join vendas2 v2 on (v2.numdoc = a.numdoc) '
      'left outer join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) '
      'left outer join cliente c on c.cod_cliente=a.cod_cliente '
      'left outer join cidades cd on (c.cod_cidade = cd.cod_cidade) '
      'left outer join cadmicro mc on (mc.microcod = cd.microcod) '
      'left outer join cadmeso ms on (ms.mesocod = mc.mesocod) '
      'left outer join REPRESENTANTE r on r.ID = a.COD_REPRESENTANTE '
      'left outer join BANCO b on b.ID = cast(r.NR_BANCO as INTEGER) '
      'left outer join prazo p on (p.ID = a.COD_PRAZO_PGTO)'
      'left outer join fop f on (f.COD_FOP = a.COD_FOP)'
      ''
      
        'where  (a.DTADOC <= current_date - 3 or  V.MARGEM_LUCRO < R.MARG' +
        'EM_MINIMA ) AND A.DTADOC >= '#39'01.11.2012'#39'  AND A.FATURADO NOT IN ' +
        '(1,2,3)'
      
        'and a.consignacao<> '#39'1'#39' and a.orcamento= '#39'0'#39' and a.cod_fop <> '#39'9' +
        #39' order by numdoc, A.DTADOC')
    Left = 440
    Top = 120
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
    object q_pedidoscliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      Size = 200
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
    object q_pedidosfop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fop'
      Origin = 'fop'
      ReadOnly = True
      Size = 200
    end
    object q_pedidosrepresentante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      Size = 200
    end
    object q_pedidosprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_pedidosnr_pedido_palm: TStringField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      FixedChar = True
      Size = 7
    end
    object q_pedidospalm_nr_conexao: TIntegerField
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
    end
    object q_pedidosobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_pedidosestoque: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'estoque'
      Origin = 'estoque'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidoscliente_bloqueado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_bloqueado'
      Origin = 'cliente_bloqueado'
      FixedChar = True
      Size = 1
    end
    object q_pedidosatraso: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'atraso'
      Origin = 'atraso'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidosmargem_abaixo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'margem_abaixo'
      Origin = 'margem_abaixo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidosmargem_lucro: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_lucro'
      Origin = 'margem_lucro'
      Precision = 64
      Size = 0
    end
    object q_pedidosmargem_minima: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_minima'
      Origin = 'margem_minima'
      Precision = 15
      Size = 2
    end
  end
  object ds_pedidos: TDataSource
    DataSet = q_pedidos
    Left = 444
    Top = 156
  end
  object q_itens: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NUMDOC, a.COD_PRODUTO||'#39'-'#39'||p.NOM_PRODUTO as prod' +
        'uto, a.QTD, a.PRECO, a.SUB_TOTAL, a.NR_PEDIDO_PALM, a.PRECO_BRUT' +
        'O, (((a.PRECO_BRUTO - A.PRECO)/A.PRECO_BRUTO) * 100) AS PERC_DES' +
        'C, A.VOLUME, p.QTD_ESTOQUE'
      'FROM VENDAS2 a'
      'inner join produto p on (p.COD_PRODUTO = a.COD_PRODUTO)'
      'where A.NUMDOC=:NUMDOC'
      'ORDER BY ID')
    Left = 472
    Top = 120
  end
  object ds_itens: TDataSource
    DataSet = q_itens
    Left = 476
    Top = 156
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
    ReportOptions.LastChange = 41240.742826967600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var linhas, linha_final : integer;'
      '  '
      'procedure GroupHeader2OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '      linha_final := DetailData1.DataSet.RecNo;'
      'end;'
      '  '
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  linhas := DetailData1.DataSet.RecNo - linha_final;'
      '//  showmessage(floattostr(linhas));      '
      
        '  if ((engine.freespace) < (GroupHeader2.height + (DetailData1.h' +
        'eight * (linhas+1)) + (GroupFooter2.height))) then'
      '  begin'
      '//    showmessage(floattostr(linhas));'
      '    engine.NewPage;'
      '  end'
      '  else begin'
      
        '//    GroupFooter2.height := 5;                                 ' +
        '                                 '
      '  end;            '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 552
    Top = 136
    Datasets = <
      item
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
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
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 631.181510000000000000
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
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
          Top = 19.897650000000010000
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
          Left = 7.559060000000000000
          Top = 67.354360000000010000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Listagem de  Pedido')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 200.315090000000000000
          Height = 56.692950000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D6167657D0F0000FFD8FFE000104A46494600010101006000
            600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC0001108003A00CC03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F6DB
            8CF9EDB860F1FCAA2A96E33E7B6E393C7F2AA57B7B0E9F68F7139C22F6EE4FA0
            ADB9946377B10A2E52E55BB269258E18CC92BAA20EACC700563BF883CF731E99
            672DDB0E378184FCEA0B6D3EE35A75BDD50B2C1D62B507000F535BF1C6914623
            8D151074551802B04EA55D57BABF1FF8074B8D2A3A4BDE97E0BFCCC52BE239C6
            77DA5B0F41F31FEB51BC1E278FE64BAB7971FC3B40FE95A93EA76903F9664F32
            5FF9E710DEDF90A8CDF5E05F38E9ECB6E3EF02E3CCC7A851FCB3512A70DB9E57
            F26FF4348D4A9BFB38DBCD2FD753197C4D7B65308B53B1DBEEA369FF00035D05
            95FDB6A10F9B6D2071DC775FA8A5961B5D4ED007549A090654FF0051E95C55DC
            173E1BD595E07250F28C7A3AF706B29D4AB86B4A4F9A1F8A35852A38BBC62B92
            6BA747FE477B4541677497B6715CC7F7645CE3D3D453AE65682D669963695A38
            D9C46BD58819C0FAD7A09A6AE8F325171767B92D15E43A3FC47F1DF8904F368B
            E17B39A08A4F2DB2E46D3D7049239AD19FE23789F40513789BC1B2C169BB0F71
            6D26E0BFCC7E6452E741CACF4DA2B80F0FF8FA4F11FC469F4AB2689F475B1134
            6DB7E72F852493F8E31ED5DFD34EE26AC145145300A28A2800A5208EA0D797F8
            975FD73C4FE353E0EF0D5D358C36C375FDF27DE5F500F60381EE6B2B58F0EF8E
            FC1BA9D9DDE81ABEA3AD5BC8E04914996C37A32E48DA7D7B54F30F94F64A29A8
            58C685D42B9505941CE0F714EAA105145140055EB2FF0052DFEF7F41546AF597
            FA96FF007BFA0A99EC38EE56B8044EC09C9E39FC2B9A980D5FC4A2DDB9B5B21B
            997B33FF009FE55D2CE00B860391915CBF86583DE6A8E7EF997F4C9AE7ADEF4A
            14DECDFE5A9D787F76152A2DD2D3E6EC744CCA8859885551924F402B24EA17D7
            F93A5C28215FF96F3E4073E8A3FAD5BD5BFE40F79FF5C5BF954D6831656E074F
            2D7F95693BCA7C89D958CA1CB0873B5777B6BB14349BD85DDED9ED92D2F57992
            2031BBDC1EE2B56A96A1A6C5A82292C639E3E63993EF29FF000ACDB33A9EAA92
            4735DAC3142E62768570F211EFDAA14E54ED06AFDBFE09A3A70AA9D44EDDEFD3
            D3B935CDD43A66A28B6F20733BE24B54E4827F887A1F51DE99E2BB75974732E3
            E685C303EC78356D34A82D8DBFD96255D928791C9CB30C1EA7BF5AA5AFCAD7C5
            348B4F9E691834A4748D47AD6555354A6A5D765E7FF0E6D465175E9CA1D376FB
            2EFF00224F0AEEFEC34DDD3CC6DBF4ADACE39AAD043169D611C2BF72250A3D49
            FF00EB9AB406481EB5D3461C94E307BA4726226AA5594D6CDB3CF3E0FF003E18
            D49BBB6A9393F98AB5F1635B834AF03DD5A37CF73A88FB34310E49C91938F61F
            A915C2785FC49E22D17C397D07877461A8C8BAB4E2E0ED2E63CE36FCA39E79E7
            DABACF0E783F59D6B5D8BC51E36646BA880FB1E9EBF720F723A67BE3D7934D3B
            AB221AB3BB399F849A1DC68BF10753B4BB1B67B7D3D1997D0BED38FC338AF6A9
            658A089A59A448E35EAEEC140FC4D79FDB38B2F8F17D1B1005FE96ACBEE571FE
            06B03E2C69DB75BB6D435BD6CFF6210A22D2E1CF9D211F7828FBBCFF0078F4CD
            34F9509EACF56B2D574ED48B0B1BFB5B92BF78432AB11F91AB95F2F6B3771E97
            3DA6A9A3787F51F0E5D2BEE85DA5664957FE0401CFE608AF79D5F51F105E7816
            DF52F0D470C9A94F0C53059003952016DA0F19FAD0A57071B1D39207520738E4
            F7A70FBC3EB5F3EC1717DE2CD523D3BC63E2AD4346BF8E50D0DBCB6E228F3D88
            390037D7F3AF67D775697C33E186BE8ED6E75592DD1176C7CBC9D06E381F8920
            5352B89AB1C3FC2A571E2AF1A1B807ED62F00627AE373FFF005ABD4ABE7DD1BE
            21CBA5F8EF59D561D02E58EA71AFFA0AB1DCB20C7CDD391D7B77AEAB49F895E2
            CD63C4369609E1636F6F3C811DDA39331A9EAD9200E3AD4C64AD629C59E9D7BA
            9D869AA1AFAF6DED81E9E74A133F9D4B6F736F7902CD6D3C53C4DD1E370C0FE2
            2BE79BFD3ED74CF14DE41AF79BE2FD69C90B6D6CEE123C9CE598739C7F08E055
            8F006AD268DF1360D3ACEDEF2C2C6F58C53D85D3926362A48EA07423838CE29F
            3EA2E53E83C1F4A2BC23C41A878A6F3E296B5E1DD1F509626BF748866420451A
            A86C8FEEF19CE39AD3F0E5BEAFF0F7E24596857FA9BDF58EAF170EC5B1BF9C10
            0938208C7B834730729EC957ACBFD4B7FBDFD0551ABD65FEA5BFDEFE829CF614
            772ACFB44EDB7A0C63F2AE2E1B8FEC3F14DC24DF2C13B727D8F20FE75DA5C106
            762071C63F2AC5D73465D56DC14216E63FB8C7A11E86B9B134E728A9C3E28EA7
            5E0EAC23370A9F0CB47FE65EBD85AE74F9E18C8DD246554F6E4565DAEB6B6AB1
            DAEA76F25AC8A02EF2328D8F7AC7D3B5DBBD1DFEC77F13B469C60FDE4FA7A8AE
            9A0D474ED4E2DAB2C522B758E4C67F23510AF1ACF9A12B4BB335A9879505CB52
            3CD1DD35FD7E65C8E449503C6EAE87A153915950BC5A24374F7B322896769100
            39241E9C52B6810C6E64B1B89ECC9EA226CA9FC0D496FA35A5ACBF689CB5C4FD
            7CDB86C91F4EC2B57ED5B4F9526BADF4FF003318FB18A6B99B4FA5B5FF002FCF
            D0AA2E354D5F8B65363687FE5AB8FDE30F61DAB4AC74FB7D3A1290AF2797918E
            598FA93505D6B9A7DA1DA6712C9DA38BE627F2AAC23BED608FB50369647FE580
            6FDE4A3FDAF41529C54B47CD2FCBF45F9FA9725394755C90FCFF0056FF000F42
            D432FF0068DD89133F6481BE56ED2BFA8F61FCEB457EF0FAD311238512340A8A
            0615471C7B53ABA211696BB9C939293D363C93E0FB3C7E25F175B9076ADC06FA
            1DEE2BD6EAADA69D636135CBDA5B430C973279D398D403237F78D590CAD9C303
            8EB83551565625BBB3C73E21EA4DE1CF8BDA06B536E4B558543B81D537307FD0
            D4FE289AC63F8CDA1EA3ADCA83467B40F6B349FEAB760919EDD483F957A7EA9A
            3699ADC090EA76305DC68DBD1664CED3EA28D4748D3357B3FB1EA1656F756EBD
            2391010BF4F4FC2A7958F98F36F8B5E2EF0E5F783A4D3ADEFEDEFAF65911A210
            B6FF002F0725891D38C8FC6B52F7C5527823E14E8B746DC497B25B450C314990
            3715CE5BD80AE92CFC0FE16D3A4F36DB41B0471C8668F711FF007D6715A3A8E9
            9A66B765F64D42DADEF2D98EE08F86191DC7FF005A9D9EE174709A96ABE12F12
            783A04F186A7A49D4043B9DAD640CF0BFF00B18C9CF4E3A1A8BE0B6ADA8DEE89
            7F6970D34D6167285B3B894609539CAFE1807DB38AEA22F87BE0FB67122F87EC
            411CE5D4B01F99C574504305BC090DB451C50A0C2A46A0281EC05093BDC1B56B
            1E67F14AE3FE11DF117863C5510F9ADE7682603F8A33C91F916AF4D8E61716E9
            340FB92440F1B7A82320D55D4B4AD3B5BB3FB2EA3690DDDBEE0DB241B86E1DEA
            DA04540A8142A8DA02F418ED4D2D44DE878EFC2DD4748D06F3C40BAFDE4367AE
            1BB2B235D36D629D4E09FF006B24FE1506BBAD699E25F8D3E1B6D1255B836EE8
            B34F18E1F049383DC01DEBD4755F0B78775EB9F3752D2ECEEAE1060BB2FCE076
            048E7F3A9F4DF0FE8BA27CDA76996768718DF1C615B1FEF75A9E57B0EEB73CDF
            CBDDFB479310CEDB6DEF8EDFBAFF00F553FE2A164F1D782E44C87139008FFAE8
            95E9E96562B7CD7C96F6E2EE54DAD3AA8DECA3B6EEA454779A569DA85D5A5C5E
            5A4335C5A3F996EEE32D1B7A8A7CBA073179BEF1FAD5DB2FF52DFEF7F41546AF
            597FA96FF7BFA0A27B0A3B95AE0933B1231D38FC2A2A9AEBFE3E5FF0FE550D35
            B09EE57BBB1B5BE4D9730AC807427A8FA1AC49BC1F68ED986E258FD880D8AE8E
            8ACAA61E954D671B9BD2C556A5A42563998FC2F771F09ABCAABE8A08FEB53AF8
            5A276DD757D733FB16C56FD159AC1D15D3F166AF1F887F6BF05FE454B4D2ECAC
            7FE3DEDD11BFBD8CB7E66B0FC4961ABDE6AF67369C1D2386265699240AC3730D
            C067BED5C67FDAAE9E8AE8508C55A2AC8E594E527CD277679E0D33C5C6FADAEE
            E3ED334B68A391326D7CF960841EB80FB89EB9E2A5934FF16CC924572D752214
            80B159D572C1959C2E3A8E0F5C1EDCD77D453E515CE01F4DF17C12C0F1493CB3
            3183CEB86953771F338C71F2E59801EC3D6A2B2D23C4D60D1F9504E87E691BCA
            9D02B109F2A3E7920BB31CF38C0F5AF44A297285CE060B0F1B7D9A391AF2759E
            30DB51A4520E7CC3F375C9FF0056073C53F48D2BC496BAAC32B35DA413DC79D3
            19674621738224C7DE250205C74E6BBBA28E50B9C74965E2696DBC4A970EF279
            F1BC5671AB281824E0A9CF1F21039C73594340D7ACE19E4D32CDECD1B2D6F6D1
            48998725148CE782C132DB4F1BBBD7A3514F942E708FA3788A49AF896B8D924B
            BC46F3AB24A4BA8E98E8114F1C726ABD869DE31B3B5820885C4711F94AB4E8C6
            362537B67FBA7F79B457A1D14B942E7010E97E2DB78D59659D53077C30CA8320
            EC2DB78C0724C873EDEF573C35A5F886C351B54BA6952D555A49B74AAC8C5812
            411D4C9BCE4B74C0AECE8A7CA173CE2CF49F11D8DFBCD0E9863BA8C626B88E65
            CDF9690B1624F4C60000F3863E94EB8D2BC6178D245701E489445B55A752ACE8
            09DDF890323DFDABD168A5CA173CE25D1BC5B11924B6598CF1C62DA293CF550A
            BB89CC60745C2C6083EF4B71A4F8CE5BD92ED25996607C92E254E54B31CC638D
            ABC45907D0D7A35147285C4190A013938E4D5FB2FF0052DFEF7F41546AF597FA
            96FF007BFA0A27B04773FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 3.779530000000001000
          Width = 415.748300000000000000
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
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 20.456709999999990000
          Width = 415.748300000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'www.plasfan.ind.br'
            'Email: plasfan@terra.com.br'
            'Fone: (47)3346-2052')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        Condition = 'dst_palm_pedidos."COD_REPRESENTANTE"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_vendas1
          DataSetName = 'dst_vendas1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Representante:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779529999999994000
          Width = 608.504330000000000000
          Height = 15.118120000000000000
          DataField = 'REPRESENTANTE'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."REPRESENTANTE"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
        KeepChild = True
        RowCount = 0
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.779530000000022500
          Width = 483.779564170000000000
          Height = 11.338590000000000000
          DataField = 'PRODUTO'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."PRODUTO"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 599.811057800000000000
          Top = 0.779530000000022500
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'PRECO'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_palm_pedidos."PRECO"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 491.448745670000000000
          Top = 0.779530000000022500
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DataField = 'QTD'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_palm_pedidos."QTD"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 655.299630000000000000
          Top = 0.779530000000022500
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DataField = 'SUB_TOTAL'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
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
            '[dst_palm_pedidos."SUB_TOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252002680000000000
          Top = 0.779530000000022500
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_palm_pedidos."UNIDADE"]/[dst_palm_pedidos."VOLUME"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 118.724490000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'GroupHeader2OnAfterPrint'
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'dst_palm_pedidos."NUMDOC"'
        KeepChild = True
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.118119999999976200
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' PEDIDO:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 3.559060000000000000
          Top = 17.795300000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE:')
          ParentFont = False
        end
        object dst_vendas1NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 73.811070000000000000
          Top = 0.755893309999976300
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'NUMDOC'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."NUMDOC"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 0.755893309999976300
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'DTADOC'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_palm_pedidos."DTADOC"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 74.590600000000000000
          Top = 17.433073310000000000
          Width = 657.638220000000000000
          Height = 15.118120000000000000
          DataField = 'CLIENTE'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."CLIENTE"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Top = 106.606370000000000000
          Width = 483.779840000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 599.811057800000000000
          Top = 106.385900000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 491.448745670000000000
          Top = 106.385900000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 655.197280000000000000
          Top = 106.385900000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Item')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252002680000000000
          Top = 106.385900000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Unid\Volume')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 34.157526690000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 34.795300000000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[<dst_palm_pedidos."ENDERECO">], [<dst_palm_pedidos."NR_ENDERECO' +
              '">]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 51.913419999999970000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP.:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 51.551193309999970000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."CEP"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 51.496116690000010000
          Width = 64.252010000000000000
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
            'CIDADE:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 256.228510000000000000
          Top = 51.133890000000010000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."CIDADE"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 68.393766690000010000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ\CPF:')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 69.031540000000010000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<dst_palm_pedidos."CNPJ">]\[<dst_palm_pedidos."CPF">]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 68.393766690000010000
          Width = 64.252010000000000000
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
            'I.E.\RG:')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 362.055350000000000000
          Top = 68.031540000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<dst_palm_pedidos."IE">]\[<dst_palm_pedidos."RG">]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 85.929190000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EMAIL:')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 86.566963310000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."EMAIL"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 102.047310000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 3.779530000000022000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Liquido: [SUM(<dst_palm_pedidos."SUB_TOTAL">,DetailData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 22.677180000000020000
          Width = 702.992580000000000000
          Height = 71.811070000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[dst_palm_pedidos."QTD"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'OBS.:')
          ParentFont = False
        end
      end
    end
  end
  object q_grupo: TFDQuery
    AfterOpen = q_pedidosAfterOpen
    Connection = dao.CN
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct g.COD_GRUPO, g.nom_grupo '
      'from grupo g '
      
        'where g.COD_GRUPO in (select pro.cod_grupo from PRODUTO pro wher' +
        'e pro.ESTOQUE_MINIMO >= pro.QTD_ESTOQUE)'
      'order by g.nom_grupo')
    Left = 464
    Top = 208
    object q_grupocod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_gruponom_grupo: TStringField
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
  end
  object ds_grupo: TDataSource
    DataSet = q_grupo
    Left = 492
    Top = 420
  end
  object q_produto: TFDQuery
    AfterOpen = q_pedidosAfterOpen
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select pro.cod_produto, pro.nom_produto, pro.grade, pro.estoque_' +
        'minimo, pro.QTD_EMBALAGEM, pro.UNIDADE, pro.qtd_estoque, pro.qtd' +
        '_reservado, pro.cod_grupo, g.nom_grupo, pro.preco_venda, f.razao' +
        '_social from produto pro '
      
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_prin' +
        'cipal'
      'left join grupo g on g.cod_grupo = pro.cod_grupo'
      'where pro.cod_grupo = :grupo'
      'and pro.ESTOQUE_MINIMO >= pro.QTD_ESTOQUE'
      'and pro.status <> '#39'S'#39
      'order by f.razao_social, g.nom_grupo')
    Left = 552
    Top = 448
    ParamData = <
      item
        Name = 'grupo'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_produtoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object q_produtoNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Required = True
      Size = 70
    end
    object q_produtoGRADE: TIntegerField
      FieldName = 'GRADE'
    end
    object q_produtoESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Precision = 18
      Size = 2
    end
    object q_produtoQTD_EMBALAGEM: TBCDField
      FieldName = 'QTD_EMBALAGEM'
      Precision = 18
      Size = 3
    end
    object q_produtoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object q_produtoQTD_ESTOQUE: TBCDField
      FieldName = 'QTD_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object q_produtoQTD_RESERVADO: TBCDField
      FieldName = 'QTD_RESERVADO'
      Precision = 18
      Size = 2
    end
    object q_produtoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object q_produtoNOM_GRUPO: TStringField
      FieldName = 'NOM_GRUPO'
      Size = 60
    end
    object q_produtoPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
    end
    object q_produtoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
  end
  object ds_produto: TDataSource
    DataSet = q_produto
    Left = 540
    Top = 420
  end
  object q_pedidos_liberacao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT distinct a.NUMDOC, a.DTADOC, a.cod_cliente, cast(a.COD_CL' +
        'IENTE||'#39'-'#39'||c.NOM_CLIENTE as VARCHAR(200)) as cliente, a.TOT_BRU' +
        'TO, a.TOT_LIQUIDO,'
      
        'cast(a.COD_FOP||'#39'-'#39'||f.NOM_FOP as VARCHAR(200)) as fop, cast(a.C' +
        'OD_REPRESENTANTE||'#39'-'#39'||r.NOM_REPRESENTANTE as VARCHAR(200)) as r' +
        'epresentante, p.PRAZO, a.NR_PEDIDO_PALM, a.PALM_NR_CONEXAO, A.OB' +
        'SERVACOES_PEDIDO,'
      
        'COALESCE((select DISTINCT '#39'S'#39' as situacao_estoque from produto p' +
        'd inner join vendas2 vd2 on a.NUMDOC = vd2.NUMDOC where pd.COD_P' +
        'RODUTO = vd2.COD_PRODUTO and pd.QTD_ESTOQUE < 1), '#39'N'#39') AS ESTOQU' +
        'E,'
      'c.CLIENTE_BLOQUEADO,'
      
        '(select case when coalesce(sum(cr.VALOR), 0) > 0 then '#39'S'#39' else '#39 +
        'N'#39' end as ATRASO from cr1 cr where (cr.cod_cliente= a.COD_CLIENT' +
        'E) and (cr.dtaven+5 < current_date) and (cr.dtarec is null)),'
      
        'CASE WHEN V.MARGEM_LUCRO < R.MARGEM_MINIMA THEN '#39'S'#39' ELSE '#39'N'#39' END' +
        ' MARGEM_ABAIXO,'
      'v.MARGEM_LUCRO,'
      'r.MARGEM_MINIMA'
      ''
      'FROM VENDAS1 a'
      'INNER JOIN V_COMISSAO_NOVA V ON V.NUMDOC = A.NUMDOC'
      'left outer join vendas2 v2 on (v2.numdoc = a.numdoc) '
      'left outer join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) '
      'left outer join cliente c on c.cod_cliente=a.cod_cliente '
      'left outer join cidades cd on (c.cod_cidade = cd.cod_cidade) '
      'left outer join cadmicro mc on (mc.microcod = cd.microcod) '
      'left outer join cadmeso ms on (ms.mesocod = mc.mesocod) '
      'left outer join REPRESENTANTE r on r.ID = a.COD_REPRESENTANTE '
      'left outer join BANCO b on b.ID = cast(r.NR_BANCO as INTEGER) '
      'left outer join prazo p on (p.ID = a.COD_PRAZO_PGTO)'
      'left outer join fop f on (f.COD_FOP = a.COD_FOP)'
      ''
      
        'where  (a.DTADOC <= current_date - 3 or  V.MARGEM_LUCRO < R.MARG' +
        'EM_MINIMA ) AND A.DTADOC >= '#39'01.11.2012'#39'  AND A.FATURADO NOT IN ' +
        '(1,2,3)'
      
        'and a.consignacao<> '#39'1'#39' and a.orcamento= '#39'0'#39' and a.cod_fop <> '#39'9' +
        #39' order by numdoc, A.DTADOC')
    Left = 288
    Top = 136
    object q_pedidos_liberacaonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pedidos_liberacaodtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_pedidos_liberacaocod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_pedidos_liberacaocliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      Size = 200
    end
    object q_pedidos_liberacaotot_bruto: TBCDField
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidos_liberacaotot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_pedidos_liberacaofop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fop'
      Origin = 'fop'
      ReadOnly = True
      Size = 200
    end
    object q_pedidos_liberacaorepresentante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      Size = 200
    end
    object q_pedidos_liberacaoprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_pedidos_liberacaonr_pedido_palm: TStringField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      FixedChar = True
      Size = 7
    end
    object q_pedidos_liberacaopalm_nr_conexao: TIntegerField
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
    end
    object q_pedidos_liberacaoobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_pedidos_liberacaoestoque: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'estoque'
      Origin = 'estoque'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_liberacaocliente_bloqueado: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_bloqueado'
      Origin = 'cliente_bloqueado'
      FixedChar = True
      Size = 1
    end
    object q_pedidos_liberacaoatraso: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'atraso'
      Origin = 'atraso'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_liberacaomargem_abaixo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'margem_abaixo'
      Origin = 'margem_abaixo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_liberacaomargem_lucro: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_lucro'
      Origin = 'margem_lucro'
      Precision = 64
      Size = 0
    end
    object q_pedidos_liberacaomargem_minima: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_minima'
      Origin = 'margem_minima'
      Precision = 15
      Size = 2
    end
  end
  object ds_pedidos_liberacao: TDataSource
    DataSet = q_pedidos_liberacao
    Left = 292
    Top = 172
  end
end
