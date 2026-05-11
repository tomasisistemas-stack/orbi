object fr_plano_contas: Tfr_plano_contas
  Left = 124
  Top = 176
  BorderIcons = [biSystemMenu]
  Caption = 'Plano de Contas'
  ClientHeight = 453
  ClientWidth = 688
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
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object GroupBox1: TsGroupBox
      Left = 5
      Top = 2
      Width = 416
      Height = 43
      Caption = 'Informe a Descri'#231#227'o '#224' ser Pesquisada:'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edDesc: TsEdit
        Left = 8
        Top = 16
        Width = 401
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
    object BtLocalizar: TsBitBtn
      Left = 593
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Localizar'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000E78C3100B56B
        4A00E79C52008C635A0094635A00A5635A00A56B5A00BD7B5A00FFB55A004A52
        630094636300A5636B00A5736B00AD7B6B00BD846B00C6846B00D6946B00AD7B
        7300B58C7300DE9C7300AD847B00B58C7B00E7AD7B00EFBD7B00EFC67B005A63
        8400636B84006B6B8400B58C8400CEA58400EFBD8400EFC68400F7C68400AD8C
        8C00EFC68C00F7CE8C00BD949400B5AD9400EFC69400EFCE9400F7CE9400CEA5
        9C00D6B59C00EFCE9C00DEBDA500EFCEA500F7D6A500427BAD00EFD6AD00F7D6
        AD00DEC6B500DECEB500EFD6B500F7D6B500F7DEB500D6BDBD00DEC6BD00F7DE
        BD00186BC600DEC6C600DECEC600F7E7C600FFEFC600F7E7CE001073D600FFFF
        D600F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7F7EF00FFF7EF00FFFF
        EF00FFF7F700FFFFF700FF00FF0031A5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004C4C0B0B0B0B
        0B0B0B0B0B0B0B0B0B4C4C4C093E35302B27221E171E1E1F0B4C4C1A3A1A3930
        2D2B26221E17171F0B4C4C4C4D401B39342D2B26221E171F0B4C4C4C054D4019
        39302D2B26221E1F0B4C4C4C0C484D2F0311040D1D26221F0B4C4C4C0C4E4421
        1C2C342A121D26220B4C4C4C0E4E4814323F3D4B2A0D2B270B4C4C4C0E4E4E0A
        42423F4934042D2E0B4C4C4C104E4E1C3B4442412C11312D0B4C4C4C104E4E37
        243B42321C1533250B4C4C4C134E4E4E371C0A14290606060B4C4C4C134E4E4E
        4E4E4B4B37060200014C4C4C164E4E4E4E4E4E4E3B0608074C4C4C4C16474747
        4747474737060E4C4C4C4C4C161010101010101010064C4C4C4C}
      TabOrder = 1
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object RadioGroup1: TRadioGroup
      Left = 424
      Top = 2
      Width = 164
      Height = 43
      Caption = 'Expandir Tudo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 2
    end
  end
  object Q_Plano_Contas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select p1.descricao, p1.id, p1.operacao, p1.id_pai, p1.nivel, p1' +
        '.nr_conta, (select max(p2.NR_CONTA) as nr_conta from plano_conta' +
        's p2 where p2.ID_PAI = p1.ID_PAI) as nova_nr_conta from plano_co' +
        'ntas p1 where p1.id = 1')
    Left = 96
    Top = 82
    object Q_Plano_ContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object Q_Plano_ContasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_Plano_ContasOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      FixedChar = True
      Size = 1
    end
    object Q_Plano_ContasID_PAI: TIntegerField
      FieldName = 'ID_PAI'
      Origin = 'ID_PAI'
    end
    object Q_Plano_ContasNIVEL: TSmallintField
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
    end
    object Q_Plano_ContasNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'NR_CONTA'
      Required = True
      FixedChar = True
      Size = 8
    end
    object Q_Plano_ContasNOVA_NR_CONTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOVA_NR_CONTA'
      Origin = 'NOVA_NR_CONTA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  object IB_DataSource1: TDataSource
    DataSet = Q_Plano_Contas
    Left = 200
    Top = 80
  end
end
