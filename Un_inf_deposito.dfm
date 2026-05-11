object fr_inf_deposito: Tfr_inf_deposito
  Left = 353
  Top = 324
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es Sobre o Deposito'
  ClientHeight = 237
  ClientWidth = 412
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
  object Label1: TsLabel
    Left = 67
    Top = 71
    Width = 63
    Height = 13
    Caption = 'Nome Titular:'
  end
  object Label2: TsLabel
    Left = 59
    Top = 122
    Width = 71
    Height = 13
    Caption = 'Data Deposito:'
  end
  object Label3: TsLabel
    Left = 71
    Top = 97
    Width = 60
    Height = 13
    Caption = 'N'#186' Deposito:'
  end
  object Label4: TsLabel
    Left = 57
    Top = 151
    Width = 72
    Height = 13
    Caption = 'Valor Deposito:'
  end
  object Label5: TsLabel
    Left = 12
    Top = 42
    Width = 119
    Height = 13
    Caption = 'Referente ao Titulo/Nota'
  end
  object Label7: TsLabel
    Left = 11
    Top = 12
    Width = 85
    Height = 13
    Caption = 'Nome Fornecedor'
  end
  object Lbnom_fornecedor: TsLabel
    Left = 112
    Top = 13
    Width = 9
    Height = 13
    Caption = '...'
  end
  object IB_Edit1: TDBEdit
    Left = 136
    Top = 65
    Width = 265
    Height = 21
    DataField = 'TITULAR'
    TabOrder = 1
    OnKeyPress = IB_Edit7KeyPress
  end
  object IB_Edit2: TDBEdit
    Left = 136
    Top = 91
    Width = 153
    Height = 21
    DataField = 'NUMDEP'
    TabOrder = 2
    OnKeyPress = IB_Edit7KeyPress
  end
  object IB_Edit4: TDBEdit
    Left = 136
    Top = 145
    Width = 89
    Height = 21
    DataField = 'VALOR'
    TabOrder = 4
    OnKeyPress = IB_Edit7KeyPress
  end
  object IB_Edit7: TDBEdit
    Left = 136
    Top = 38
    Width = 175
    Height = 21
    DataField = 'REFERENTE'
    TabOrder = 0
    OnKeyPress = IB_Edit7KeyPress
  end
  object IB_Date1: TDBEdit
    Left = 136
    Top = 117
    Width = 100
    Height = 21
    DataField = 'DTADEPOSITO'
    TabOrder = 3
    OnKeyPress = IB_Edit7KeyPress
  end
  object bt_gra: TsBitBtn
    Left = 56
    Top = 176
    Width = 113
    Height = 53
    Caption = 'Gravar Informa'#231#245'es'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      AD5A59AA5454A24D4EAA9595C1C8C7CCCBCACECBCACAC8C7C6CAC9B79E9E9840
      41994444A65151FF00FFFF00FFBC7871CF6666D26868B95A5B9B8080BEA1A0E2
      D0CEFEF9F5FFFDFAF2F6F4D2B3B3962D2C993232C25B5BB05859FF00FFBB7871
      CB6565CE6767B85D5D9E7B7C9D4343B77675E7DFDDFDFBF9FEFFFDD9BAB9962E
      2E993333C05A5AAF5859FF00FFBB7871CB6565CE6667B85D5DA884839939399B
      3636CDBCBBF2F0EEFFFFFFE2C3C1962D2D983333C05A5AAF5859FF00FFBB7871
      CB6565CE6666B75C5CB28F8E9F4848943232A69A9AD5DBD8FAFFFEE6C9C8932B
      2B963030BF5959AF5859FF00FFBB7871CB6565CF6666BB5C5CC3908FC29695B3
      8686AA8D8EBAA2A1E1CAC8DCA9A9A33A3AA43E3EC35D5DAE5758FF00FFBB7871
      CC6566CB6464CB6464CB6364CC6767CD6767CC6464C85B5BC95E5ECA6161CC65
      65CD6666CF6868AC5657FF00FFBC7972B75351B25B57C68684D2A4A2D5ABAAD5
      AAA9D5ABAAD5A5A4D5A8A7D5AAA9D6AEACD39C9CCD6666AC5556FF00FFBC7871
      B14F4CE4CDCBFAF7F7F8F4F3F9F5F4F9F5F4F9F5F4F9F6F5F9F5F4F9F5F4FBFB
      FADEBEBDC45C5DAD5657FF00FFBC7871B3514EEBD7D6FCFBFAF7F0EFF7F1F0F7
      F1F0F7F1F0F7F1F0F7F1F0F6F1F0FBF9F8DEBCBBC35B5BAD5657FF00FFBC7871
      B3514EEBD7D4F0EFEFD8D5D4DAD7D7DAD7D7DAD7D7DAD7D7DAD7D7D8D5D5ECEC
      EBE0BDBCC25B5BAD5657FF00FFBC7871B3514EEBD7D5F3F1F1DEDAD9DFDBDBDF
      DBDBDFDBDBDFDBDBDFDBDBDDDAD9EEEEEEE0BDBCC35B5BAD5657FF00FFBC7871
      B3514EEAD7D5F5F4F3E4DFDEE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDFF2F1
      F0DFBDBBC35B5BAD5657FF00FFBC7871B3514EEBD7D6F1F0EFD9D5D5DAD8D7DA
      D8D7DAD8D7DAD8D7DAD8D7D8D5D5EDECEBE1BEBDC35B5BAD5657FF00FFBC7870
      B3514EE9D6D4FEFBFBFAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FDFA
      F9DEBCBBC35C5CAD5657FF00FFFF00FFA8504CC9B6B5D3D5D4D1CECED1CECED1
      CECED1CECED1CECED1CECED1CECED3D4D4CBAEADA34D4EFF00FF}
    Layout = blGlyphTop
    TabOrder = 5
    SkinData.SkinSection = 'BUTTON'
  end
  object bt_envia: TsBitBtn
    Left = 179
    Top = 176
    Width = 129
    Height = 53
    Caption = '...'
    TabOrder = 6
    SkinData.SkinSection = 'BUTTON'
  end
end
