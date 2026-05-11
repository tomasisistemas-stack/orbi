object FmCalcularSalario: TFmCalcularSalario
  Left = 103
  Top = 54
  BorderIcons = [biSystemMenu]
  Caption = 'Calcular - Sal'#225'rios'
  ClientHeight = 543
  ClientWidth = 785
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
  object Panel3: TsPanel
    Left = 0
    Top = 124
    Width = 785
    Height = 291
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object dgSalario: TDBGrid
      Left = 2
      Top = 2
      Width = 781
      Height = 287
      Align = alClient
      DataSource = dsSalario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_REPRESENTANTE'
          Title.Caption = 'Funcion'#225'rio'
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTAVEN'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Sal'#225'rio(+)'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISSOES'
          Title.Alignment = taCenter
          Title.Caption = 'Comiss'#245'es(+)'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLR'
          Title.Alignment = taCenter
          Title.Caption = 'PLR(+)'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALES'
          Title.Alignment = taCenter
          Title.Caption = 'Vales(-)'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total(=)'
          Width = 84
          Visible = True
        end>
    end
  end
  object Panel4: TsPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 73
    Align = alTop
    BevelOuter = bvSpace
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Lbl_Colaborador: TsLabel
      Left = 9
      Top = 10
      Width = 133
      Height = 13
      Caption = 'Funcion'#225'rio/Representante:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_funcionario: TsLabel
      Left = 231
      Top = 11
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
    object sbFunc: TsSpeedButton
      Left = 754
      Top = 5
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      OnClick = sbFuncClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label1: TsLabel
      Left = 498
      Top = 44
      Width = 55
      Height = 13
      Caption = 'Vencto. de:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 659
      Top = 44
      Width = 18
      Height = 13
      Caption = 'at'#233':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cod_funcionario: TsComboEdit
      Left = 149
      Top = 6
      Width = 77
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      OnExit = cod_funcionarioExit
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
      OnButtonClick = cod_funcionarioButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object edFuncionario: TsEdit
      Left = 600
      Top = 6
      Width = 150
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edFuncionarioChange
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
    object ftMovDe: TsDateEdit
      Left = 554
      Top = 41
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
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
      DialogTitle = 'Selecione uma Data'
    end
    object ftMovAte: TsDateEdit
      Left = 679
      Top = 41
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
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
      DialogTitle = 'Selecione uma Data'
    end
    object Tipo: TsGroupBox
      Left = 9
      Top = 26
      Width = 479
      Height = 39
      Caption = 'Tipo'
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object ckRepTerc: TsCheckBox
        Left = 8
        Top = 16
        Width = 74
        Height = 20
        Caption = 'Repr. Terc.'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object ckRepInt: TsCheckBox
        Left = 84
        Top = 16
        Width = 64
        Height = 20
        Caption = 'Repr. Int.'
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object ckFuncEsc: TsCheckBox
        Left = 154
        Top = 15
        Width = 74
        Height = 20
        Caption = 'Func. Escr.'
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object ckFuncFab: TsCheckBox
        Left = 232
        Top = 15
        Width = 85
        Height = 20
        Caption = 'Func. F'#225'brica'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object ckTodos: TsCheckBox
        Left = 414
        Top = 15
        Width = 50
        Height = 20
        Caption = 'Todos'
        TabOrder = 4
        OnClick = ckTodosClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object ckTelemarketing: TsCheckBox
        Left = 322
        Top = 15
        Width = 87
        Height = 20
        Caption = 'Telemarketing'
        TabOrder = 5
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object Panel5: TsPanel
    Left = 0
    Top = 73
    Width = 785
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object btok: TsBitBtn
      Left = 336
      Top = 6
      Width = 112
      Height = 38
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
      TabOrder = 0
      OnClick = btokClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 461
    Width = 785
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object Label4: TsLabel
      Left = 416
      Top = 13
      Width = 100
      Height = 13
      Caption = 'Data de Vencimento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label5: TsLabel
      Left = 105
      Top = 13
      Width = 68
      Height = 13
      Caption = 'Data Mov. de:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label6: TsLabel
      Left = 289
      Top = 13
      Width = 18
      Height = 13
      Caption = 'at'#233':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btCalcular: TsSpeedButton
      Left = 625
      Top = 5
      Width = 86
      Height = 30
      Caption = 'Calcular'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btCalcularClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object edMovDe: TsDateEdit
      Left = 181
      Top = 10
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
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
      DialogTitle = 'Selecione uma Data'
    end
    object edMovAte: TsDateEdit
      Left = 309
      Top = 10
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
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
      DialogTitle = 'Selecione uma Data'
    end
    object edVcto: TsDateEdit
      Left = 520
      Top = 10
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
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
      DialogTitle = 'Selecione uma Data'
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 502
    Width = 785
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    object btImprimir: TsSpeedButton
      Left = 400
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
    object btnSalvar: TsSpeedButton
      Left = 299
      Top = 5
      Width = 97
      Height = 30
      Caption = 'Salvar'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnSalvarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 415
    Width = 785
    Height = 46
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 5
    SkinData.SkinSection = 'PANEL'
    object sbAlterar: TsSpeedButton
      Left = 617
      Top = 8
      Width = 80
      Height = 30
      Caption = '&Alterar'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbAlterarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sbSalvar: TsBitBtn
      Left = 702
      Top = 8
      Width = 80
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = sbSalvarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gbSalario: TsGroupBox
      Left = 174
      Top = 1
      Width = 87
      Height = 42
      Caption = 'Sal'#225'rio(+)'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sDBText1: TsDBText
        Left = 25
        Top = 18
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'sDBText1'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DataField = 'VALOR'
        DataSource = dsSalario
      end
    end
    object sGroupBox1: TsGroupBox
      Left = 262
      Top = 1
      Width = 87
      Height = 42
      Caption = 'Comiss'#245'es(+)'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object sDBText2: TsDBText
        Left = 25
        Top = 18
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'sDBText2'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DataField = 'COMISSOES'
        DataSource = dsSalario
      end
    end
    object gbPLR: TsGroupBox
      Left = 350
      Top = 1
      Width = 87
      Height = 42
      Caption = 'PLR(+)'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object edPLR: TsDBEdit
        Left = 4
        Top = 15
        Width = 78
        Height = 21
        Color = clWhite
        DataField = 'PLR'
        DataSource = dsSalario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = edPLRExit
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
    object GBVales: TsGroupBox
      Left = 438
      Top = 1
      Width = 87
      Height = 42
      Caption = 'Vales(-)'
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object sDBText3: TsDBText
        Left = 25
        Top = 18
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'sDBText3'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DataField = 'VALES'
        DataSource = dsSalario
      end
    end
    object sGroupBox2: TsGroupBox
      Left = 526
      Top = 1
      Width = 87
      Height = 42
      Caption = 'Total(=)'
      TabOrder = 5
      SkinData.SkinSection = 'GROUPBOX'
      object sDBText4: TsDBText
        Left = 25
        Top = 18
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'sDBText4'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DataField = 'TOTAL'
        DataSource = dsSalario
      end
    end
    object sGroupBox3: TsGroupBox
      Left = 3
      Top = 1
      Width = 170
      Height = 42
      Caption = 'Func./Representante'
      TabOrder = 6
      SkinData.SkinSection = 'GROUPBOX'
      object sDBText5: TsDBText
        Left = 6
        Top = 19
        Width = 56
        Height = 13
        Caption = 'sDBText5'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DataField = 'NOME_REPRESENTANTE'
        DataSource = dsSalario
      end
    end
  end
  object mmSalario: TRxMemoryData
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
    Left = 464
    object mmSalarioID: TIntegerField
      FieldName = 'ID'
    end
    object mmSalarioCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object mmSalarioNR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Size = 8
    end
    object mmSalarioTITULO: TStringField
      FieldName = 'TITULO'
      Size = 12
    end
    object mmSalarioSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object mmSalarioDTAVEN: TDateField
      Alignment = taCenter
      FieldName = 'DTAVEN'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmSalarioDTAPAG: TDateField
      Alignment = taCenter
      FieldName = 'DTAPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmSalarioVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmSalarioCOD_REPRESENTANTE: TIntegerField
      FieldName = 'COD_REPRESENTANTE'
    end
    object mmSalarioNOME_REPRESENTANTE: TStringField
      FieldName = 'NOME_REPRESENTANTE'
      Size = 100
    end
    object mmSalarioPLR: TCurrencyField
      FieldName = 'PLR'
    end
    object mmSalarioTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
    object mmSalarioVALES: TCurrencyField
      FieldName = 'VALES'
    end
    object mmSalarioCOMISSOES: TCurrencyField
      FieldName = 'COMISSOES'
    end
    object mmSalarioID_PLR: TIntegerField
      FieldName = 'ID_PLR'
    end
  end
  object dsSalario: TDataSource
    AutoEdit = False
    DataSet = mmSalario
    Left = 528
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
    ReportOptions.CreateDate = 40258.419605752300000000
    ReportOptions.LastChange = 41738.404974490740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var total, total_banda : real;  '
      'procedure lbGrupoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  case <dst_lista_func_sal."FUNCIONARIO"> of         '
      
        '    0 : lbGrupo.memo.text := '#39'Grupo: Representantes - Terceiros'#39 +
        ';  '
      
        '    1 : lbGrupo.memo.text := '#39'Grupo: Representantes - Funcion'#225'ri' +
        'os'#39';  '
      
        '    2 : lbGrupo.memo.text := '#39'Grupo: Funcion'#225'rios - Escrit'#243'rio'#39';' +
        '  '
      '    3 : lbGrupo.memo.text := '#39'Grupo: Funcion'#225'rios - F'#225'brica'#39';  '
      '  end;              '
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      
        'var total_item : real;                                          ' +
        '                     '
      'begin'
      
        ' total_item := <dst_lista_func_sal."SALARIO">+<dst_lista_func_sa' +
        'l."PLR">+<dst_lista_func_sal."COMISSOES">-<dst_lista_func_sal."A' +
        'DIANTAMENTOS">;'
      ' if total_item < 0 then'
      
        '   total_item := 0;                                             ' +
        ' '
      ''
      
        ' mmTotalItem.memo.text := formatfloat('#39'R$ #,###,##0.00'#39', total_i' +
        'tem);'
      ''
      ' total := total + total_item;'
      ' total_banda := total_banda + total_item;'
      'end;'
      '                                             '
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmtotal_band.memo.text := formatfloat('#39'R$ #,###,##0.00'#39', total' +
        '_banda);             '
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mmtotal_geral.memo.text := formatfloat('#39'R$ #,###,##0.00'#39', tota' +
        'l);  '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  total := 0;                           '
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  total_banda := 0;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 184
    Top = 216
    Datasets = <
      item
        DataSet = Dm.dst_lista_func_sal
        DataSetName = 'dst_lista_func_sal'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 32.236240000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de CC de Funcion'#225'rios e Representantes')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779530000000001000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 944.882500000000000000
          Top = 3.779530000000001000
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
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 899.528140000000000000
          Top = 22.677180000000000000
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
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913730000000000000
          Top = 34.015770000000010000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'De [dtaini] at'#233' [dtafin].')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 16.897650000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = Dm.dst_lista_func_sal
        DataSetName = 'dst_lista_func_sal'
        RowCount = 0
        object dst_niverNOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 5.291338580000000000
          Top = 1.559059999999988000
          Width = 323.149511100000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[dst_lista_func_sal."ID"]-[dst_lista_func_sal."NOM_REPRESENTANTE' +
              '"]')
          ParentFont = False
        end
        object dst_niverTELEFONE: TfrxMemoView
          AllowVectorExport = True
          Left = 332.929185120000000000
          Top = 1.559059999999988000
          Width = 86.929133860000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_lista_func_sal."NOM_BANCO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 423.503998030000000000
          Top = 1.220470000000006000
          Width = 56.692913390000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_lista_func_sal."NR_AGENCIA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 483.976429210000000000
          Top = 1.779529999999994000
          Width = 86.929133860000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_lista_func_sal."NR_CONTA_CORRENTE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 644.653526220000000000
          Top = 1.000000000000000000
          Width = 68.031503390000000000
          Height = 15.118120000000000000
          DataField = 'SALARIO'
          DataSet = Dm.dst_lista_func_sal
          DataSetName = 'dst_lista_func_sal'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_lista_func_sal."SALARIO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 797.102347560000000000
          Top = 1.000000000000000000
          Width = 79.370090940000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_sal
          DataSetName = 'dst_lista_func_sal'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_lista_func_sal."PLR"]')
          ParentFont = False
        end
        object mmTotalItem: TfrxMemoView
          AllowVectorExport = True
          Left = 950.417501020000000000
          Top = 1.133858269999990000
          Width = 86.929138740000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<dst_lista_func_sal."SALARIO">+<dst_lista_func_sal."PLR">+<dst_' +
              'lista_func_sal."COMISSOES">-<dst_lista_func_sal."ADIANTAMENTOS">' +
              ']')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 576.708724880000000000
          Top = 1.220470000000006000
          Width = 64.251968500000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
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
            '[dst_lista_func_sal."DTAVEN"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 718.488174330000000000
          Top = 1.000000000000000000
          Width = 75.590560940000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_sal
          DataSetName = 'dst_lista_func_sal'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_lista_func_sal."COMISSOES"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 878.630490000000000000
          Top = 1.000000000000000000
          Width = 68.031498500000000000
          Height = 15.118120000000000000
          DataField = 'ADIANTAMENTOS'
          DataSet = Dm.dst_lista_func_sal
          DataSetName = 'dst_lista_func_sal'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_lista_func_sal."ADIANTAMENTOS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 963.780150000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 537.472790000000000000
          Top = 1.220469999999977000
          Width = 102.047273390000000000
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
            'Total Geral:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 645.165354330709000000
          Top = 2.000000000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."SALARIO">,MasterData1)]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 717.354330708661000000
          Top = 2.000000000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."COMISSOES">,MasterData1)]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 795.968503937008000000
          Top = 2.000000000000000000
          Width = 79.370090940000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."PLR">,MasterData1)]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 878.740157480315000000
          Top = 2.000000000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."ADIANTAMENTOS">,MasterData1)]')
          ParentFont = False
        end
        object mmtotal_geral: TfrxMemoView
          AllowVectorExport = True
          Left = 950.551181100000000000
          Top = 2.000000000000000000
          Width = 86.929133859999990000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dst_lista_func_sal."SALARIO">+<dst_lista_func_sal."PLR">+<' +
              'dst_lista_func_sal."COMISSOES">-<dst_lista_func_sal."ADIANTAMENT' +
              'OS">'
            ',MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 136.063080000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'dst_lista_func_sal."FUNCIONARIO"'
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 5.220470000000000000
          Top = 31.000000000000000000
          Width = 323.015894650000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Funcion'#225'rio/Representante')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 333.039580000000000000
          Top = 31.000000000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Banco')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 424.283528030000000000
          Top = 30.779529999999990000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Ag'#234'ncia')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 485.755959210000000000
          Top = 30.779529999999990000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'CC')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 644.543375430000000000
          Top = 30.779529999999990000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Sal'#225'rio (+)')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 796.945035670000000000
          Top = 31.000000000000000000
          Width = 79.370093390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'PLR (+)')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 950.417501020000000000
          Top = 30.779529999999990000
          Width = 86.929138740000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 576.709030000000000000
          Top = 30.779529999999990000
          Width = 64.251973390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vcto.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 718.331170000000000000
          Top = 31.000000000000000000
          Width = 75.590563390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Comiss'#227'o (+)')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 878.850960000000000000
          Top = 30.779529999999990000
          Width = 68.031503390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Vales (-)')
          ParentFont = False
        end
        object lbGrupo: TfrxMemoView
          AllowVectorExport = True
          Left = 5.779530000000000000
          Top = 3.779529999999994000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'lbGrupoOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            'Grupo: ')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 253.228510000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 4.000000000000028000
          Width = 56.692913390000000000
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
            'Total:')
          ParentFont = False
        end
        object mmtotal_band: TfrxMemoView
          AllowVectorExport = True
          Left = 950.551181100000000000
          Top = 3.779529999999994000
          Width = 86.929138740000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dst_lista_func_sal."SALARIO">+<dst_lista_func_sal."PLR">+<' +
              'dst_lista_func_sal."COMISSOES">-<dst_lista_func_sal."ADIANTAMENT' +
              'OS">'
            ',MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 645.079160000000000000
          Top = 3.779529999999994000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."SALARIO">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 717.267704330000000000
          Top = 3.779529999999994000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."COMISSOES">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 795.881877560000000000
          Top = 3.779529999999994000
          Width = 79.370090940000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."PLR">,MasterData1)]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 878.740157480000000000
          Top = 3.779529999999994000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_lista_func_cc
          DataSetName = 'dst_lista_func_cc'
          DisplayFormat.DecimalSeparator = ','
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
            '[SUM(<dst_lista_func_sal."ADIANTAMENTOS">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 232
    Top = 217
  end
end
