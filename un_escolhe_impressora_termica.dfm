object fr_escolhe_impressora_termica: Tfr_escolhe_impressora_termica
  Left = 350
  Top = 251
  Caption = 'Selecione a Impressora'
  ClientHeight = 127
  ClientWidth = 645
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
  object sPanel1: TsPanel
    Left = 0
    Top = 86
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BtSelecione: TsBitBtn
      Left = 279
      Top = 8
      Width = 96
      Height = 25
      Caption = 'Selecione'
      Default = True
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
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtSelecioneClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 86
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL_LOW'
    object gdZebras: TDBGrid
      Left = 1
      Top = 1
      Width = 643
      Height = 84
      Align = alClient
      Color = clWhite
      DataSource = dsZebras
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NomeImpressora'
          Title.Caption = 'Impressora'
          Visible = True
        end>
    end
  end
  object mmZebras: TRxMemoryData
    FieldDefs = <>
    Left = 472
    Top = 8
    object mmZebrasNomeImpressora: TStringField
      FieldName = 'NomeImpressora'
      Size = 100
    end
  end
  object dsZebras: TDataSource
    DataSet = mmZebras
    Left = 432
    Top = 8
  end
end
