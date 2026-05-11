object fr_ultimas_vendas: Tfr_ultimas_vendas
  Left = 193
  Top = 21
  Caption = #218'ltimas Vendas.'
  ClientHeight = 544
  ClientWidth = 871
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
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 289
    Width = 871
    Height = 220
    Align = alBottom
    Caption = 'Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 8
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Produto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 8
      Top = 124
      Width = 63
      Height = 13
      Caption = 'Valor Unit'#225'rio'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX1: TsDBTextFX
      Left = 8
      Top = 133
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX1'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'PRECO'
      DataSource = ds_produto
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 155
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
    object sDBTextFX2: TsDBTextFX
      Left = 8
      Top = 164
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX2'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'QTD'
      DataSource = ds_produto
    end
    object sLabel4: TsLabel
      Left = 8
      Top = 186
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
    object sDBTextFX3: TsDBTextFX
      Left = 8
      Top = 194
      Width = 83
      Height = 24
      AutoSize = True
      Caption = 'sDBTextFX3'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'SUB_TOTAL'
      DataSource = ds_produto
    end
    object sDBTextFX4: TsDBTextFX
      Left = 53
      Top = 14
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX4'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'NOM_PRODUTO'
      DataSource = ds_produto
    end
    object sLabel7: TsLabel
      Left = 8
      Top = 42
      Width = 35
      Height = 13
      Caption = 'Cliente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX5: TsDBTextFX
      Left = 53
      Top = 38
      Width = 51
      Height = 22
      AutoSize = True
      Caption = '(Memo)'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'NOM_CLIENTE'
      DataSource = ds_produto
    end
    object sLabel8: TsLabel
      Left = 8
      Top = 91
      Width = 57
      Height = 13
      Caption = '% Desconto'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX6: TsDBTextFX
      Left = 8
      Top = 100
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX6'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'DESCONTO'
      DataSource = ds_produto
    end
    object sDBTextFX7: TsDBTextFX
      Left = 584
      Top = 100
      Width = 51
      Height = 22
      AutoSize = True
      Caption = '(Memo)'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'FORMA'
      DataSource = ds_produto
    end
    object sLabel9: TsLabel
      Left = 584
      Top = 91
      Width = 75
      Height = 13
      Caption = 'Forma de Pgto.:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel10: TsLabel
      Left = 584
      Top = 124
      Width = 122
      Height = 13
      Caption = 'Representante da Venda:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX8: TsDBTextFX
      Left = 584
      Top = 133
      Width = 51
      Height = 22
      AutoSize = True
      Caption = '(Memo)'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'REPRESENTANTE_VENDA'
      DataSource = ds_produto
    end
    object sLabel11: TsLabel
      Left = 584
      Top = 155
      Width = 123
      Height = 13
      Caption = 'Representante do Cliente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX9: TsDBTextFX
      Left = 584
      Top = 164
      Width = 51
      Height = 22
      AutoSize = True
      Caption = '(Memo)'
      DragMode = dmAutomatic
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'REPRESENTANTE_CLIENTE'
      DataSource = ds_produto
    end
    object sLabel12: TsLabel
      Left = 584
      Top = 186
      Width = 63
      Height = 13
      Caption = 'Tele-Vendas:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX10: TsDBTextFX
      Left = 584
      Top = 194
      Width = 77
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX10'
      DragMode = dmAutomatic
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'TELEMARKETING'
      DataSource = ds_produto
    end
    object sLabel15: TsLabel
      Left = 8
      Top = 60
      Width = 50
      Height = 13
      Caption = 'WhatsApp'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX11: TsDBTextFX
      Left = 9
      Top = 69
      Width = 71
      Height = 22
      AutoSize = True
      Caption = 'sDBTextFX6'
      ParentFont = False
      ShowAccelChar = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
      DataField = 'whastapp'
      DataSource = ds_produto
    end
  end
  object pnrodape: TsPanel
    Left = 0
    Top = 509
    Width = 871
    Height = 35
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Shape1: TShape
      Left = 846
      Top = 3
      Width = 20
      Height = 10
      Brush.Color = clGreen
    end
    object sLabel13: TsLabel
      Left = 790
      Top = 2
      Width = 31
      Height = 13
      Caption = 'Venda'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel14: TsLabel
      Left = 791
      Top = 14
      Width = 52
      Height = 13
      Caption = 'Or'#231'amento'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Shape2: TShape
      Left = 846
      Top = 16
      Width = 20
      Height = 10
      Brush.Color = 206
    end
    object sBitBtn1: TsBitBtn
      Left = 398
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 871
    Height = 89
    Align = alTop
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sLabel5: TsLabel
      Left = 9
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Produto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbNomeProduto: TsLabel
      Left = 137
      Top = 38
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
    object sLabel6: TsLabel
      Left = 8
      Top = 12
      Width = 35
      Height = 13
      Caption = 'Cliente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbNome_Cliente: TsLabel
      Left = 136
      Top = 12
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
    object sLabel16: TsLabel
      Left = 9
      Top = 65
      Width = 32
      Height = 13
      Caption = 'Grupo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_Grupo: TsLabel
      Left = 137
      Top = 66
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
    object Prcod_produto: TsComboEdit
      Left = 53
      Top = 35
      Width = 75
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '99999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 1
      Text = '        '
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
    object PrCod_Cliente: TsComboEdit
      Left = 52
      Top = 9
      Width = 76
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '99999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Text = '        '
      OnExit = PrCod_ClienteExit
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
      OnButtonClick = PrCod_ClienteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object btok: TsBitBtn
      Left = 751
      Top = 17
      Width = 116
      Height = 57
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
      TabOrder = 3
      OnClick = btokClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Prcod_grupo: TsComboEdit
      Left = 53
      Top = 62
      Width = 75
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '99999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 2
      Text = '        '
      OnExit = Prcod_grupoExit
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
      OnButtonClick = Prcod_grupoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 89
    Width = 871
    Height = 200
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 3
    SkinData.SkinSection = 'PANEL_LOW'
    object sDBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 869
      Height = 198
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
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = sDBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'numdoc'
          Title.Alignment = taCenter
          Title.Caption = 'Pedido'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtadoc'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_produto'
          Title.Caption = 'C'#243'd'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nom_produto'
          Title.Caption = 'Descri'#231#227'o'
          Width = 250
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'desconto'
          Title.Alignment = taCenter
          Title.Caption = '% Desc'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Quant.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub_total'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Visible = True
        end>
    end
  end
  object q_produto: TFDQuery
    AfterOpen = q_produtoAfterOpen
    Connection = dao.CN
    SQL.Strings = (
      ' SELECT c.COD_CLIENTE,'
      
        '        cast (c.NOM_CLIENTE || '#39' / '#39' || trim(c.cnpj) || '#39' / '#39' ||' +
        ' c.telefone || '#39' / '#39' || cd.NOM_CIDADE || '#39'-'#39' || cd.UF as varchar' +
        ' (200)) as nom_cliente'
      '  ,'
      '        c.CNPJ,'
      
        '        cast (cd.NOM_CIDADE || '#39'-'#39' || cd.UF as varchar (200)) as' +
        ' cidade,'
      '        ped1.NUMDOC,'
      '        ped1.DTADOC,'
      '        ped1.TOT_LIQUIDO,'
      
        '        cast (f.NOM_FOP || '#39' '#39' || pz.prazo as varchar (200)) as ' +
        'forma,'
      '        p.COD_PRODUTO,'
      '        p.NOM_PRODUTO,'
      '        ped2.QTD,'
      '        ped2.DESCONTO,'
      '        ped2.PRECO,'
      '        ped2.SUB_TOTAL,'
      '        ped1.nfe_dev,'
      '        ped1.faturado,'
      
        '        cast (vd.id || '#39'-'#39' || vd.nom_representante as varchar (2' +
        '00)) as representante_venda,'
      
        '        cast (r.id || '#39'-'#39' || r.nom_representante as varchar (200' +
        ')) as representante_cliente,'
      '        t.nom_representante as telemarketing,'
      '        ped1.orcamento,'
      '        c.WHASTAPP'
      ' FROM VENDAS2 ped2'
      '      inner join VENDAS1 ped1 on ped1.NUMDOC = ped2.NUMDOC'
      '      inner join CLIENTE c on c.COD_CLIENTE = ped1.COD_CLIENTE'
      '      inner join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE'
      '      inner join produto p on p.COD_PRODUTO = ped2.COD_PRODUTO'
      
        '      inner join REPRESENTANTE vd on vd.id = ped1.cod_representa' +
        'nte'
      '      inner join representante r on r.id = c.id_representante'
      
        '      LEFT OUTER JOIN REPRESENTANTE t on t.id = ped1.cod_supervi' +
        'sor'
      '      left outer join fop f on f.COD_FOP = ped1.COD_FOP'
      '      left outer join PRAZO pz on pz.ID = ped1.COD_PRAZO_PGTO'
      ' where ped1.faturado in (0, 1) and'
      '       ped1.COD_FISCAL not in ('#39'6152'#39', '#39'6409'#39') and'
      '       ped1.nfe_dev is null and'
      '       ped1.cod_cliente = 47'
      ' order by ped1.DTADOC desc ')
    Left = 320
    Top = 192
    object q_produtocod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_produtonom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      ReadOnly = True
      Size = 200
    end
    object q_produtocnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 40
    end
    object q_produtocidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ReadOnly = True
      Size = 200
    end
    object q_produtonumdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_produtodtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_produtotot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      currency = True
      Precision = 15
    end
    object q_produtoforma: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'forma'
      Origin = 'forma'
      ReadOnly = True
      Size = 200
    end
    object q_produtocod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_produtonom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_produtoqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_produtodesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      DisplayFormat = '##0.00'
      Precision = 15
    end
    object q_produtopreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      currency = True
      Precision = 15
    end
    object q_produtosub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      currency = True
      Precision = 15
    end
    object q_produtonfe_dev: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nfe_dev'
      Origin = 'nfe_dev'
    end
    object q_produtofaturado: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_produtorepresentante_venda: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante_venda'
      Origin = 'representante_venda'
      ReadOnly = True
      Size = 200
    end
    object q_produtorepresentante_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante_cliente'
      Origin = 'representante_cliente'
      ReadOnly = True
      Size = 200
    end
    object q_produtotelemarketing: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telemarketing'
      Origin = 'telemarketing'
      Size = 50
    end
    object q_produtoorcamento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'orcamento'
      Origin = 'orcamento'
    end
    object q_produtowhastapp: TStringField
      FieldName = 'whastapp'
      Origin = 'whastapp'
      FixedChar = True
      Size = 14
    end
  end
  object ds_produto: TDataSource
    AutoEdit = False
    DataSet = q_produto
    Left = 292
    Top = 256
  end
  object dsnone: TDataSource
    AutoEdit = False
    Left = 372
    Top = 248
  end
end
