object Rl_etiqueta_cliente: TRl_etiqueta_cliente
  Left = 365
  Top = 138
  BorderIcons = [biSystemMenu]
  ClientHeight = 452
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RLetiqueta: TRLReport
    Left = 0
    Top = 0
    Width = 643
    Height = 1247
    Margins.LeftMargin = 12.000000000000000000
    Margins.TopMargin = 3.000000000000000000
    Margins.RightMargin = 12.000000000000000000
    Margins.BottomMargin = 0.000000000000000000
    DataSource = ds_etiqueta_cliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 170.000000000000000000
    PageSetup.PaperHeight = 330.000000000000000000
    object RLDetailGrid1: TRLDetailGrid
      Left = 45
      Top = 11
      Width = 553
      Height = 96
      ColCount = 2
      ColSpacing = 5.000000000000000000
      ColWidth = 70.000000000000000000
      object RLDBText2: TRLDBText
        Left = 3
        Top = 18
        Width = 57
        Height = 14
        DataField = 'ENDERECO'
        DataSource = ds_etiqueta_cliente
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 3
        Top = 34
        Width = 42
        Height = 14
        DataField = 'BAIRRO'
        DataSource = ds_etiqueta_cliente
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 187
        Top = 33
        Width = 22
        Height = 14
        DataField = 'CEP'
        DataSource = ds_etiqueta_cliente
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 3
        Top = 51
        Width = 69
        Height = 14
        DataField = 'NOM_CIDADE'
        DataSource = ds_etiqueta_cliente
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 72
        Height = 14
        DataField = 'NOM_CLIENTE'
        DataSource = ds_etiqueta_cliente
        Text = ''
      end
    end
  end
  object qu_etiqueta_cliente: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select nom_cliente, endereco, cep, bairro, c.cod_cidade, cd.nom_' +
        'cidade, cd.uf from cliente c'
      'left join cidades cd on cd.cod_cidade = c.cod_cidade ')
    Left = 24
    Top = 8
    object qu_etiqueta_clientenom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object qu_etiqueta_clienteendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 200
    end
    object qu_etiqueta_clientecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object qu_etiqueta_clientebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object qu_etiqueta_clientecod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object qu_etiqueta_clientenom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object qu_etiqueta_clienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
  end
  object ds_etiqueta_cliente: TDataSource
    DataSet = qu_etiqueta_cliente
    Left = 56
    Top = 8
  end
end
