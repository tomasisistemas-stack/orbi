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
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40038.450073275490000000
    ReportOptions.LastChange = 46127.409921319440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  saldo : Real;                                           '
      '  ZebraFlag: Integer;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Sender is TfrxBand then'
      '  begin'
      '    ZebraFlag := ZebraFlag + 1;'
      '    with TfrxMasterData(Sender) do'
      '    begin'
      '      if (ZebraFlag mod 2) = 0 then'
      '        TfrxBrushFill(Fill).BackColor := $00E0E0E0'
      '      else'
      '        TfrxBrushFill(Fill).BackColor := clwhite;'
      '    end;'
      '  end;'
      '    '
      '  if <dst_entrada_saidas_produtos."TIPO"> = '#39'ACERTO'#39' then'
      '  begin              '
      '    saldo := <dst_entrada_saidas_produtos."CONT">;'
      
        '    mmtipo.font.style    := fsBold;                             ' +
        '           '
      '    mmPedido.font.style  := fsBold;          '
      '    mmNF.font.style      := fsBold;    '
      '    mmData.font.style    := fsBold;    '
      '    mmCliente.font.style := fsBold;    '
      '    mmQtd.font.style     := fsBold;    '
      '    mmSaldo.font.style   := fsBold;      '
      '  end'
      
        '  else if <dst_entrada_saidas_produtos."TIPO"> = '#39'RESERVADO (-)'#39 +
        ' then '
      '  begin'
      '    saldo := saldo + <dst_entrada_saidas_produtos."CONT">;'
      
        '    mmtipo.font.style    := fsItalic;                           ' +
        '             '
      '    mmPedido.font.style  := fsItalic;          '
      '    mmNF.font.style      := fsItalic;    '
      '    mmData.font.style    := fsItalic;    '
      '    mmCliente.font.style := fsItalic;    '
      '    mmQtd.font.style     := fsItalic;    '
      '    mmSaldo.font.style   := fsItalic;      '
      '  end'
      
        '  else if <dst_entrada_saidas_produtos."TIPO"> = '#39'SA'#205'DA (-)'#39' the' +
        'n '
      '  begin'
      '    saldo := saldo + <dst_entrada_saidas_produtos."CONT">;'
      
        '    mmtipo.font.style    := fsItalic or fsBold;                 ' +
        '                       '
      '    mmPedido.font.style  := fsItalic or fsBold;          '
      '    mmNF.font.style      := fsItalic or fsBold;    '
      '    mmData.font.style    := fsItalic or fsBold;    '
      '    mmCliente.font.style := fsItalic or fsBold;    '
      '    mmQtd.font.style     := fsItalic or fsBold;    '
      '    mmSaldo.font.style   := fsItalic or fsBold;      '
      '  end'
      '  else begin'
      '    saldo := saldo + <dst_entrada_saidas_produtos."CONT">;'
      
        '    mmtipo.font.style    := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;'
      
        '    mmtipo.font.style    := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;'
      
        '    mmtipo.font.style    := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;'
      
        '    mmPedido.font.style  := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;          '
      
        '    mmNF.font.style      := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;    '
      
        '    mmData.font.style    := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;    '
      
        '    mmCliente.font.style := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;    '
      
        '    mmQtd.font.style     := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;    '
      
        '    mmSaldo.font.style   := dst_posicao_estoqueNOM_GRUPO.font.st' +
        'yle;      '
      '  end;                    '
      ''
      '  mmsaldo.text := formatfloat('#39'#,###,##0.00'#39',saldo);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  saldo := 0;'
      '  ZebraFlag := 0;      '
      'end;'
      ''
      'begin'
      'end.              ')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 119
    Top = 40
    Datasets = <
      item
        DataSet = Dm.dst_entrada_saidas_produtos
        DataSetName = 'dst_entrada_saidas_produtos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 618.842920000000000000
          Top = 4.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
          Left = 574.488560000000000000
          Top = 26.677180000000000000
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
          Top = 25.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hist'#243'rico de Movimenta'#231#227'o de Produto')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = Dm.dst_entrada_saidas_produtos
        DataSetName = 'dst_entrada_saidas_produtos'
        RowCount = 0
        object mmNF: TfrxMemoView
          AllowVectorExport = True
          Left = 169.622140000000000000
          Width = 64.251968500000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_entrada_saidas_produtos."NOTA_FISCAL"]')
          ParentFont = False
        end
        object mmPedido: TfrxMemoView
          AllowVectorExport = True
          Left = 101.811070000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_entrada_saidas_produtos."NUMDOC"]')
          ParentFont = False
        end
        object mmCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 303.921460000000000000
          Width = 257.007839840000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[dst_entrada_saidas_produtos."CODIGO_CLIENTE_FORNECEDOR"]-[dst_e' +
              'ntrada_saidas_produtos."NOME_CLIENTE_FORNECEDOR"]')
          ParentFont = False
        end
        object mmQtd: TfrxMemoView
          AllowVectorExport = True
          Left = 563.929500000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'QTD'
          DataSet = Dm.dst_entrada_saidas_produtos
          DataSetName = 'dst_entrada_saidas_produtos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_entrada_saidas_produtos."QTD"]')
          ParentFont = False
        end
        object mmData: TfrxMemoView
          AllowVectorExport = True
          Left = 237.212740000000000000
          Width = 64.251968500000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_entrada_saidas_produtos."DATA"]')
          ParentFont = False
        end
        object mmSaldo: TfrxMemoView
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          ParentFont = False
        end
        object mmtipo: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488188980000000000
          Height = 15.118120000000000000
          DataField = 'TIPO'
          DataSet = Dm.dst_entrada_saidas_produtos
          DataSetName = 'dst_entrada_saidas_produtos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_entrada_saidas_produtos."TIPO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 839.055660000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 50.133890000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        Condition = 'dst_entrada_saidas_produtos."COD_PRODUTO"'
        object dst_posicao_estoqueNOM_GRUPO: TfrxMemoView
          AllowVectorExport = True
          Left = 76.370130000000000000
          Top = 4.000000000000000000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_entrada_saidas_produtos
          DataSetName = 'dst_entrada_saidas_produtos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            
              '[dst_entrada_saidas_produtos."COD_PRODUTO"]-[dst_entrada_saidas_' +
              'produtos."NOM_PRODUTO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Produto:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 101.811070000000000000
          Top = 30.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176' Doc.')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 169.622140000000000000
          Top = 30.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176' N.F.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 304.700990000000000000
          Top = 30.236240000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente/Fornecedor')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 237.212740000000000000
          Top = 30.236240000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 564.709030000000000000
          Top = 30.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 639.520100000000000000
          Top = 30.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'TIPO')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 268.905690000000000000
          Top = 5.338590000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Estoque: [<dst_entrada_saidas_produtos."QTD_ESTOQUE"> + <dst_ent' +
              'rada_saidas_produtos."QTD_RESERVADO">]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 4.535430630000000000
          Top = 1.338590000000010000
          Width = 706.772110000000000000
          Height = 3.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 4.338590000000000000
          Top = 5.338590000000010000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Reservado: [dst_entrada_saidas_produtos."QTD_RESERVADO"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 537.252320000000000000
          Top = 5.338590000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_posicao_estoque_custo
          DataSetName = 'dst_posicao_estoque_custo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Dispon'#237'vel: [<dst_entrada_saidas_produtos."QTD_ESTOQUE">')
          ParentFont = False
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
