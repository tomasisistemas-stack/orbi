object fr_produtos_detalhes: Tfr_produtos_detalhes
  Left = 429
  Top = 148
  Caption = 'Produtos'
  ClientHeight = 247
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 33
    Width = 235
    Height = 172
    Align = alClient
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
      Width = 90
      Height = 13
      Caption = 'C'#243'digo - Descri'#231#227'o'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 174
      Top = 75
      Width = 44
      Height = 13
      Caption = 'Qtd. Est.:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX1: TsDBTextFX
      Left = 173
      Top = 89
      Width = 11
      Height = 22
      AutoSize = True
      Caption = '.'
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
      DataField = 'QTD_ESTOQUE'
      DataSource = ds_produto
    end
    object sLabel2: TsLabel
      Left = 110
      Top = 127
      Width = 43
      Height = 13
      Caption = 'Unidade:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX2: TsDBTextFX
      Left = 109
      Top = 142
      Width = 11
      Height = 22
      AutoSize = True
      Caption = '.'
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
      DataField = 'UNIDADE'
      DataSource = ds_produto
    end
    object lbPromocao: TsLabel
      Left = 174
      Top = 127
      Width = 31
      Height = 13
      Caption = 'Pre'#231'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX3: TsDBTextFX
      Left = 173
      Top = 142
      Width = 12
      Height = 24
      AutoSize = True
      Caption = '.'
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
      DataField = 'PRECO_VENDA'
      DataSource = ds_produto
    end
    object sDBTextFX4: TsDBTextFX
      Left = 10
      Top = 33
      Width = 23
      Height = 22
      AutoSize = True
      Caption = '. . .'
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
    object sLabel4: TsLabel
      Left = 110
      Top = 75
      Width = 50
      Height = 13
      Caption = 'Qtd. Emb.:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sDBTextFX5: TsDBTextFX
      Left = 109
      Top = 89
      Width = 11
      Height = 22
      AutoSize = True
      Caption = '.'
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
      DataField = 'QTD_EMBALAGEM'
      DataSource = ds_produto
    end
    object Panel4: TsPanel
      Left = 7
      Top = 69
      Width = 100
      Height = 100
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clWhite
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object Shape1: TShape
        Left = 2
        Top = 2
        Width = 96
        Height = 96
        Align = alClient
        Pen.Color = clWhite
        Pen.Style = psClear
      end
      object imgProduto: TImage
        Left = 2
        Top = 2
        Width = 96
        Height = 96
        Align = alClient
        Center = True
        Proportional = True
      end
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 235
    Height = 33
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel5: TsLabel
      Left = 8
      Top = 10
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
    object btMovimento: TsSpeedButton
      Left = 144
      Top = 3
      Width = 85
      Height = 27
      Caption = 'Movimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
        9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
        B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
        E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
        97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
        2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
        FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
        805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
        00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
        8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
        2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
        9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
        918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
        A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
        8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
        9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
        EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
        00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
        B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
        A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
        D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
        D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
        CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
        ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
        FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
        E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
        BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
        F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
        A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
        D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
        A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
        FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
        E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
        A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
        FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
        E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
        9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      OnClick = btMovimentoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Prcod_produto: TsComboEdit
      Left = 52
      Top = 7
      Width = 74
      Height = 21
      AutoSize = False
      Color = clWhite
      DragCursor = crHandPoint
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
  object Panel1: TsPanel
    Left = 0
    Top = 205
    Width = 235
    Height = 42
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sBitBtn1: TsBitBtn
      Left = 155
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      OnClick = sBitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sGroupBox2: TsGroupBox
      Left = 4
      Top = 3
      Width = 105
      Height = 35
      TabOrder = 1
      CaptionLayout = clTopCenter
      SkinData.SkinSection = 'GROUPBOX'
      object btEtiquetas: TsSpeedButton
        Left = 24
        Top = 9
        Width = 77
        Height = 22
        Caption = 'Etiquetas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
          9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
          B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
          E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
          97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
          2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
          FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
          805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
          00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
          8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
          2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
          9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
          918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
          A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
          8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
          9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
          EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
          00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
          B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
          A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
          D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
          D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
          CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
          ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
          FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
          E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
          BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
          F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
          A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
          D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
          A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
          FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
          E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
          A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
          FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
          E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
          9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        OnClick = btEtiquetasClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object edQtde: TsCurrencyEdit
        Left = 3
        Top = 9
        Width = 20
        Height = 22
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
        Value = 1.000000000000000000
      end
    end
  end
  object ds_produto: TDataSource
    DataSet = q_produto
    Left = 180
    Top = 96
  end
  object fR_RELATORIO: TfrxReport
    Tag = 1
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 46295.369056400470000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       if <Parametros."Imagem"> = '#39#39' then'
      '       begin'
      '               ReportTitle1.Visible := false;'
      '       end;'
      '       // esconde informa'#231#227'o do protocolo quando em contingencia'
      '       if <Parametros."Contingencia_Valor"> = '#39#39' then'
      '       begin'
      '               Memo5.Visible := false;'
      '       end;'
      'end;'
      ''
      'procedure DadosProdutosOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  DadosDesconto.Visible  := <DadosProdutos."vDesc"> > 0;'
      '  DadosAcrescimo.Visible := <DadosProdutos."vOutro"> > 0;'
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Observacoes.Visible := Trim(<InformacoesAdicionais."OBS">) <> ' +
        #39#39
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 119
    Top = 40
    Datasets = <
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'DadosProdutos'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'Duplicatas'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Eventos'
      end
      item
        DataSetName = 'Fatura'
      end
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'ISSQN'
      end
      item
        DataSetName = 'LocalEntrega'
      end
      item
        DataSetName = 'LocalRetirada'
      end
      item
        DataSetName = 'Pagamento'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Transportador'
      end
      item
        DataSetName = 'Veiculo'
      end
      item
        DataSetName = 'Volumes'
      end>
    Variables = <
      item
        Name = ' User'
        Value = Null
      end
      item
        Name = 'LinhasImpressas'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 48.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      TopMargin = 0.500000000000000000
      Frame.Typ = []
      EndlessHeight = True
      LargeDesignHeight = True
      MirrorMode = []
      PrintIfEmpty = False
      OnBeforePrint = 'Page1OnBeforePrint'
      object ValorTributos: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 32.015752910000000000
        Top = 699.213050000000000000
        Width = 181.417440000000000000
        RowCount = 1
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000022000
          Width = 86.929214410000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'Informa'#231#227'o dos Tributos Totais Incidentes '
            '(Lei Federal 12.741/2012): ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 86.929214410000000000
          Top = 3.779530000000022000
          Width = 94.488225590000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[CalculoImposto."vTotTrib" #n%2,2f] [CalculoImposto."VTribFonte"' +
              ']')
          ParentFont = False
          WordWrap = False
        end
      end
      object MensagemFiscal: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 111.385882910000000000
        Top = 797.480830000000000000
        Width = 181.417440000000000000
        RowCount = 1
        Stretched = True
        object Memo3: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 48.897650000000000000
          Width = 181.417440000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulte pela chave de acesso em:'
            '[Identificacao."URL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.472480000000000000
          Width = 181.417440000000000000
          Height = 11.338590000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.559060000000000000
          Width = 181.417440000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'N'#250'mero: [Identificacao."NNF"] - S'#233'rie: [Identificacao."Serie" #n' +
              '#000]'
            
              'Emiss'#227'o [Identificacao."DEmi"] - [Parametros."DescricaoViaEstabe' +
              'lec"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 91.267762910000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 1.220470000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."MensagemFiscal"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object Consumidor: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574768980000000000
        Top = 933.543910000000000000
        Width = 181.417440000000000000
        RowCount = 1
        Stretched = True
        object Memo58: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 0.779530000000000000
          Width = 181.417440000000000000
          Height = 16.251970940000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CONSUMIDOR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 20.787369840000000000
          Width = 181.417440000000000000
          Height = 17.007839840000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Destinatario."Consumidor"]')
          ParentFont = False
        end
      end
      object Rodape: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 175.637892910000000000
        Top = 997.795920000000000000
        Width = 181.417440000000000000
        RowCount = 1
        object ImgQrCode: TfrxPictureView
          Align = baWidth
          AllowVectorExport = True
          Top = 20.322834650000000000
          Width = 181.417440000000000000
          Height = 117.165322600000000000
          Center = True
          Frame.Color = clFuchsia
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 158.181200000000000000
          Width = 181.417440000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulta via leitor de QR Code')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 141.401670000000000000
          Width = 181.417440000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Protocolo de Autoriza'#231#227'o')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object DadosProdutos: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456702680000000000
        Top = 389.291590000000000000
        Width = 181.417440000000000000
        OnBeforePrint = 'DadosProdutosOnBeforePrint'
        DataSetName = 'DadosProdutos'
        RowCount = 0
        Stretched = True
        object Memo131: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Width = 26.456670940000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."CProd"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 26.338550940000000000
          Width = 154.960620160000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."DescricaoProduto"]')
          ParentFont = False
        end
        object memqCom: TfrxMemoView
          AllowVectorExport = True
          Top = 13.496065430000000000
          Width = 60.472443390000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."QCom"] [DadosProdutos."UCom"]')
          ParentFont = False
          WordWrap = False
        end
        object memvUnCom: TfrxMemoView
          AllowVectorExport = True
          Left = 60.370078740000000000
          Top = 13.496065429999990000
          Width = 60.472418980000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VUnTrib"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo140: TfrxMemoView
          AllowVectorExport = True
          Left = 117.283462120000000000
          Top = 13.496065429999990000
          Width = 63.874013310000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VProd"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosProdutosHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.590560940000000000
        Top = 340.157700000000000000
        Width = 181.417440000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        object Memo121: TfrxMemoView
          AllowVectorExport = True
          Left = 37.692913390000000000
          Top = 14.472448270000000000
          Width = 22.677165350000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          AllowVectorExport = True
          Left = 60.370078740000000000
          Top = 14.472448270000000000
          Width = 56.692888980000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VL.UNIT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Top = 1.354328270000000000
          Width = 26.456670940000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'C'#211'D.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 26.338550940000000000
          Top = 1.354328270000000000
          Width = 154.960620160000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          AllowVectorExport = True
          Top = 14.472448270000000000
          Width = 37.795263390000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          AllowVectorExport = True
          Left = 117.283462120000000000
          Top = 14.472448270000000000
          Width = 63.874013310000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'VL.TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object DadosPagamentoHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.401630940000000000
        Top = 536.693260000000000000
        Width = 181.417440000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object memTitDadosPagamento: TfrxMemoView
          AllowVectorExport = True
          Top = 6.338589999999954000
          Width = 117.165430000000000000
          Height = 91.842570940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'QTD. TOTAL DE ITENS'
            ''
            'Valor Produtos'
            'Descontos'
            'Acr'#233'scimos'
            'VALOR A PAGAR'
            ''
            'FORMA DE PAGAMENTO  ')
          ParentFont = False
          WordWrap = False
        end
        object memDadosPagamento: TfrxMemoView
          AllowVectorExport = True
          Left = 116.905465430000000000
          Top = 6.338589999999954000
          Width = 64.252010000000000000
          Height = 91.842570940000000000
          DataSetName = 'Parametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Parametros."QtdeItens"]'
            ''
            '[CalculoImposto."VProd" #n%2.2f]'
            '[CalculoImposto."VDesc" #n%2.2f]'
            '[CalculoImposto."VOutro" #n%2.2f]'
            
              '[<CalculoImposto."VProd"> - <CalculoImposto."VDesc"> + <CalculoI' +
              'mposto."VOutro"> #n%2.2f]'
            ''
            'VALOR')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 181.417440000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object DadosPagamento: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.251970940000000000
        Top = 657.638220000000000000
        Width = 181.417440000000000000
        DataSetName = 'Pagamento'
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 117.165430000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Pagamento."tPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 116.905465430000000000
          Top = 2.000000000000000000
          Width = 64.252010000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Pagamento."vPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 181.417440000000000000
        PrintChildIfInvisible = True
        object ImgLogo: TfrxPictureView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 2.677180000000000000
          Width = 177.637910000000000000
          Height = 64.252010000000000000
          Center = True
          DataField = 'LogoCarregado'
          DataSetName = 'Parametros'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object DadosDesconto: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 438.425480000000000000
        Width = 181.417440000000000000
        RowCount = 1
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 82.889583150000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '- [DadosProdutos."vDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 75.590712280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 82.889583150000000000
          Top = 11.338590000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."vProd"> - <DadosProdutos."vDesc">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 11.338590000000000000
          Width = 75.590712280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosAcrescimo: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 487.559370000000000000
        Width = 181.417440000000000000
        RowCount = 1
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 82.889583150000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '+ [DadosProdutos."VOutro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 75.590712280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Acr'#233'scimo')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 82.889583150000010000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."vProd"> + <DadosProdutos."VOutro">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 11.338590000000010000
          Width = 75.590712280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object Observacoes: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 755.906000000000000000
        Width = 181.417440000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        RowCount = 1
        Stretched = True
        object Memo21: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '[InformacoesAdicionais."OBS"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 165.078850000000000000
        Top = 113.385900000000000000
        Width = 181.417440000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 102.842610000000000000
          Width = 181.417440000000000000
          Height = 34.015769999999990000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE NFC-e - Documento Auxiliar '
            'da Nota Fiscal de Consumidor Eletr'#244'nica')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Width = 181.417440000000000000
          Height = 96.377991810000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '[Emitente."XNome"]'
            
              'CNPJ: [Emitente."CNPJ"] - IE: [Emitente."IE"] - IM: [Emitente."I' +
              'M"]'
            '[Emitente."XLgr"], [Emitente."nro"] - [Emitente."xBairro"]'
            '[Emitente."XMun"] - [Emitente."UF"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          ShiftMode = smWhenOverlapped
          Top = 137.283550000000000000
          Width = 181.417440000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#227'o permite aproveitamento de cr'#233'dito do ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object q_produto: TFDQuery
    AfterOpen = q_produtoAfterOpen
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.cod_produto, a.promocao, a.nom_produto, a.qtd_embalagem' +
        ', a.COD_PRODUTO||'#39'-'#39'||a.NOM_PRODUTO as produto, s.IMAGEM_BD, a.q' +
        'td_estoque, a.preco_venda, a.unidade, a.codigo_barra '
      
        'FROM PRODUTO a left outer join SUBCATEGORIA s on s.ID = a.SUBCAT' +
        'EGORIA where a.cod_produto  = 2')
    Left = 152
    Top = 80
    object q_produtocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_produtopromocao: TStringField
      FieldName = 'promocao'
      Origin = 'promocao'
      FixedChar = True
      Size = 1
    end
    object q_produtonom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_produtoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_produtoproduto: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_produtoimagem_bd: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'imagem_bd'
      Origin = 'imagem_bd'
    end
    object q_produtoqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object q_produtopreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object q_produtounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_produtocodigo_barra: TStringField
      FieldName = 'codigo_barra'
      Origin = 'codigo_barra'
    end
  end
end
