object fm_teste_imagens_bd: Tfm_teste_imagens_bd
  Left = 218
  Top = 161
  BorderIcons = [biSystemMenu]
  Caption = 'An'#225'lise das Imagens de Produtos.'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 248
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 686
      Height = 246
      Align = alClient
      DataSource = dsSubCategoria
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBCATEGORIA'
          Title.Caption = 'Descri'#231#227'o'
          Width = 597
          Visible = True
        end>
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 248
    Width = 688
    Height = 164
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TsLabel
      Left = 8
      Top = 40
      Width = 51
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object DBText1: TDBText
      Left = 72
      Top = 9
      Width = 65
      Height = 17
      DataField = 'ID'
      DataSource = dsSubCategoria
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 72
      Top = 41
      Width = 65
      Height = 17
      DataField = 'SUBCATEGORIA'
      DataSource = dsSubCategoria
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBImage1: TDBImage
      Left = 480
      Top = 1
      Width = 207
      Height = 162
      Align = alRight
      DataField = 'IMAGEM_BD'
      DataSource = dsSubCategoria
      TabOrder = 0
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
  end
  object dsSubCategoria: TDataSource
    DataSet = mmSubCategoria
    Left = 456
    Top = 56
  end
  object mmSubCategoria: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <>
    Left = 416
    Top = 56
    object mmSubCategoriaID: TIntegerField
      FieldName = 'ID'
    end
    object mmSubCategoriaSUBCATEGORIA: TStringField
      FieldName = 'SUBCATEGORIA'
      Size = 200
    end
    object mmSubCategoriaIMAGEM_BD: TBlobField
      FieldName = 'IMAGEM_BD'
    end
  end
end
