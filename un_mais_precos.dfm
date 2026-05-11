object fm_mais_precos: Tfm_mais_precos
  Left = 361
  Top = 158
  BorderIcons = [biSystemMenu]
  Caption = 'Mais Pre'#231'os'
  ClientHeight = 441
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 400
    Width = 437
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object BtnOk: TsBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object dgGradeComissoes: TDBGrid
    Left = 0
    Top = 0
    Width = 437
    Height = 400
    Align = alClient
    DataSource = dsGradeComissao
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Inicio'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Fim'
        Title.Alignment = taCenter
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ComissaoOutros'
        Title.Alignment = taCenter
        Title.Caption = 'Comiss'#227'o'
        Width = 80
        Visible = True
      end>
  end
  object mmGradeComissao: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 96
    Top = 136
    object mmGradeComissaoInicio: TFloatField
      FieldName = 'Inicio'
      currency = True
    end
    object mmGradeComissaoFim: TFloatField
      FieldName = 'Fim'
      currency = True
    end
    object mmGradeComissaoComissaoInterno: TFloatField
      FieldName = 'ComissaoInterno'
      DisplayFormat = '##0.00%'
    end
    object mmGradeComissaoComissaoOutros: TFloatField
      FieldName = 'ComissaoOutros'
      DisplayFormat = '##0.00%'
    end
  end
  object dsGradeComissao: TDataSource
    AutoEdit = False
    DataSet = mmGradeComissao
    Left = 128
    Top = 136
  end
end
