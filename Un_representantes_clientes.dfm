object Fr_representantes_clientes: TFr_representantes_clientes
  Left = 57
  Top = 32
  BorderIcons = [biSystemMenu]
  Caption = 'Representantes x Clientes'
  ClientHeight = 658
  ClientWidth = 1265
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
  object SBcarga: TStatusBar
    Left = 0
    Top = 639
    Width = 1265
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    ExplicitWidth = 1028
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1265
    Height = 211
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 1028
    object sGroupBox1: TsGroupBox
      Left = 4
      Top = 17
      Width = 226
      Height = 191
      Caption = 'Representantes Atual'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object dgRep: TDBGrid
        Left = 2
        Top = 15
        Width = 222
        Height = 174
        Align = alClient
        DataSource = dsRep
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgRepDrawColumnCell
        OnDblClick = dgRepDblClick
        OnKeyPress = dgRepKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
    end
    object sGroupBox2: TsGroupBox
      Left = 234
      Top = 17
      Width = 79
      Height = 191
      Caption = 'Estado'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object dgEstado: TDBGrid
        Left = 2
        Top = 15
        Width = 75
        Height = 174
        Align = alClient
        DataSource = dsUF
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgEstadoDrawColumnCell
        OnDblClick = dgEstadoDblClick
        OnKeyPress = dgEstadoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'UF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
    end
    object sGroupBox3: TsGroupBox
      Left = 315
      Top = 17
      Width = 226
      Height = 191
      Caption = 'Meso-Regi'#227'o'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object dgMeso: TDBGrid
        Left = 2
        Top = 15
        Width = 222
        Height = 174
        Align = alClient
        DataSource = dsMeso
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgMesoDrawColumnCell
        OnDblClick = dgMesoDblClick
        OnKeyPress = dgMesoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckMeso: TDBCheckBox
        Left = 51
        Top = 118
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsMeso
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object sGroupBox4: TsGroupBox
      Left = 543
      Top = 17
      Width = 235
      Height = 191
      Caption = 'Micro-Regi'#227'o'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object dgMicro: TDBGrid
        Left = 2
        Top = 15
        Width = 231
        Height = 174
        Align = alClient
        DataSource = dsMicro
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgMicroDrawColumnCell
        OnDblClick = dgMicroDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckMicro: TDBCheckBox
        Left = 19
        Top = 126
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsMicro
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object sGroupBox5: TsGroupBox
      Left = 783
      Top = 17
      Width = 235
      Height = 191
      Caption = 'Cidades'
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object dgCidade: TDBGrid
        Left = 2
        Top = 15
        Width = 231
        Height = 174
        Align = alClient
        DataSource = dsCidades
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgCidadeDrawColumnCell
        OnDblClick = dgCidadeDblClick
        OnKeyPress = dgCidadeKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckCidades: TDBCheckBox
        Left = 19
        Top = 126
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsCidades
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object CheckRep: TDBCheckBox
      Left = 88
      Top = 151
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsRep
      ParentColor = False
      TabOrder = 5
      Visible = False
    end
    object CheckUF: TDBCheckBox
      Left = 264
      Top = 191
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsUF
      ParentColor = False
      TabOrder = 6
      Visible = False
    end
    object sGroupBox6: TsGroupBox
      Left = 1022
      Top = 14
      Width = 235
      Height = 191
      Caption = 'Bairro'
      TabOrder = 7
      SkinData.SkinSection = 'GROUPBOX'
      object dgBairro: TDBGrid
        Left = 2
        Top = 15
        Width = 231
        Height = 174
        Align = alClient
        DataSource = dsBairro
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgBairroDrawColumnCell
        OnDblClick = dgBairroDblClick
        OnKeyPress = dgBairroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Title.Caption = ' '
            Width = 20
            Visible = True
          end>
      end
      object CheckBairro: TDBCheckBox
        Left = 19
        Top = 126
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsCidades
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
  end
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 211
    Width = 1265
    Height = 428
    Align = alClient
    Caption = 'Clientes'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    ExplicitWidth = 1028
    object dgCarga: TDBGrid
      Left = 2
      Top = 15
      Width = 1261
      Height = 369
      Align = alClient
      DataSource = dsClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dgCargaDrawColumnCell
      OnDblClick = dgCargaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Caption = 'Cliente'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REPRESENTANTE'
          Title.Caption = 'Representante'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Title.Caption = 'Cidade'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bairro'
          Title.Caption = 'Bairro'
          Width = 246
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Check'
          Width = 20
          Visible = True
        end>
    end
    object CheckClientes: TDBCheckBox
      Left = 88
      Top = 151
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsClientes
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
    object GroupBox3: TsGroupBox
      Left = 2
      Top = 384
      Width = 1261
      Height = 42
      Align = alBottom
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      ExplicitWidth = 1024
      object Lbperc_frete: TsLabel
        Left = 169
        Top = 71
        Width = 42
        Height = 13
        Caption = '              '
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Lbnom_representante: TsLabel
        Left = 409
        Top = 17
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
      object Label8: TsLabel
        Left = 264
        Top = 17
        Width = 73
        Height = 13
        Caption = 'Representante:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Prcod_representante: TsComboEdit
        Left = 339
        Top = 13
        Width = 66
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
        OnExit = Prcod_representanteExit
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
        OnButtonClick = Prcod_representanteButtonClick
        ClickKey = 0
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object btAltRep: TsBitBtn
        Left = 1138
        Top = 11
        Width = 117
        Height = 25
        Caption = 'Alterar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF95320999320899320899320899320899320899320899
          320899320899320899320899320899320899320899330A953209FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF953209953209993106B8370BE043
          28F24833F74B36F75039F85B40FA5D43F7533EFB4A37F44B35D041289D340D98
          3209953209FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF953209953209
          9A3107C03910E2452AF04C37F85C41FA6D4AFA6E48FA7E60FAA093F66B5AF444
          2FE6462FB73D2098330A953209FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF9532099532099F320AC93B14E7492EF76444FB7751FB724BF8603FFA9682
          FEFCFFF8B1A5F04B34D94027AF3B1C96340D953209FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF953209A3340DD13F19F25A3CFE7652FB744DFB
          6641FB6E50FCC6BCFFFFFFFFD1C7FA694ED54327A5361796340D953209FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF953209A03511CC421FFC68
          47FF7B56FF6F46FF6D48FFAB98FFFEFCFFFFFFFFD1C7FF7D5DE65937A63A1893
          310C953209FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          9E350FBF4622E05B35F87041EF643ECC6C58C1B8B7CCDCDEE2E6E2F7B09DFE75
          52F76E49B2441F96310AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFC54A25C04622813425602D41302F5B28396E33406D
          5156768C534CD1532CD8592EA53A12FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF070C5900157300
          167A001172000E6B000E650F114A5E2930FF00FFFF00FFFF00FF000000000000
          000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1117
          500224AA042C9E082C98092D98072A97032392001A8409176CFF00FFFF00FFFF
          00FF000109FF00FF0126FFFF00FF000316FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF01030C03227A0D43C20D37A30C37A30C38A40D36A30D36A00B35A10223
          92001384FF00FFFF00FF0004210125FFFF00FF0126FF00107EFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF020A1D0D3CA60F47C50D3DAA0D40B20D41B40E41B5
          0E41B20F44B70D3EAF092384FF00FFFF00FF00031DFF00FFFF00FFFF00FF0122
          F4FF00FFFF00FFFF00FFFF00FFFF00FF01010105183F145AE91156E01152D310
          4ECA0F4AC1104CC5104BC4114FC91150CA0C35A1FF00FFFF00FF000000000104
          000000000003000E6B0122FEFF00FFFF00FFFF00FFFF00FF000001051C40186C
          FE1869F31358CF1356CC1152CA0C38A41150C6135AD5145AD50F41B0FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF001CDE0120FFFF00FFFF00FFFF00FF
          01000101060D07234C09234E071F41124DA70C38A41762D90C38A4186AE61865
          DD0F3BA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF0303030707060403030000010719311D78D8208EFF1C78F6
          1C78F31F86FE1B78F00C3497FF00FFFF00FF0000000000000000000000000000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1E1C1B252624080705000F2218
          73D326A0FF2395FF249AFF2396FF1553C5FF00FFFF00FFFF00FF000109FF00FF
          0126FFFF00FF000316FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1F1C1B4547
          465A5957262729051326092F63114C901356A00C3E81091A5AFF00FFFF00FFFF
          00FF0004210125FFFF00FF0126FF00107EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3938375758586A696758534E2F2B280B0C0D030202090708FF00
          FFFF00FFFF00FFFF00FF00031DFF00FFFF00FFFF00FF0122F4FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6C6B77777663605F3B3B3C
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000104000000000003000E
          6B0122FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF001CDE0120FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        TabOrder = 1
        OnClick = btAltRepClick
        SkinData.SkinSection = 'BUTTON'
      end
      object CheckTodos: TsCheckBox
        Left = 4
        Top = 14
        Width = 119
        Height = 20
        Caption = 'Selecionar Todos'
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckTodosClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object fr_relatorio: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40124.577814571800000000
    ReportOptions.LastChange = 41250.715790289350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 816
    Top = 8
    Datasets = <
      item
        DataSet = Dm.dst_carga
        DataSetName = 'dst_carga'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 24.677180000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Left = 575.488560000000000000
          Top = 41.574830000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Left = 3.779530000000000000
          Top = 27.559060000000000000
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
            'Formul'#225'rio de Carga')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 50.472480000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome Carga:')
          ParentFont = False
        end
        object dst_cargaNOM_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 95.488250000000000000
          Top = 51.133890000000010000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."ID"]/ [dst_carga."NOM_CARGA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 410.850650000000000000
          Top = 53.133889999999990000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object dst_cargaDTA_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 461.764070000000000000
          Top = 52.472480000000010000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'DTA_CARGA'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."DTA_CARGA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Veiculo:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 67.031540000000000000
          Top = 71.811070000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_VEICULO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 70.811070000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Motorista:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 323.819110000000000000
          Top = 70.811070000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_MOTORISTA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 6.559060000000000000
          Top = 91.267780000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Transportadora:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 114.724490000000000000
          Top = 91.267780000000000000
          Width = 257.008040000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."NOM_TRANSPORTADORA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 123.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 104.606370000000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 205.874150000000000000
          Top = 124.724490000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 547.031849999999900000
          Top = 124.944960000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_carga
        DataSetName = 'dst_carga'
        RowCount = 0
        object dst_cargaID_PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'NUMDOC'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."NUMDOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaDTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 104.047310000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'DTADOC'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."DTADOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaNOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 203.535560000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_CLIENTE'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '[dst_carga."NOM_CLIENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaTOT_LIQUIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031849999999900000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_carga."TOT_LIQUIDO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
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
          Memo.UTF8W = (
            'Vlr Total:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 166.299320000000000000
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
          Memo.UTF8W = (
            'Vlr Frete:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 3.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Peso:')
          ParentFont = False
        end
        object dst_cargaTOT_FRETE: TfrxMemoView
          AllowVectorExport = True
          Left = 232.551330000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOT_FRETE'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."TOT_FRETE"]')
          ParentFont = False
        end
        object dst_cargaTOT_PESO: TfrxMemoView
          AllowVectorExport = True
          Left = 376.512060000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."TOT_PESO"]')
          ParentFont = False
        end
        object dst_cargaTOT_CARGA: TfrxMemoView
          AllowVectorExport = True
          Left = 70.590600000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOT_CARGA'
          DataSet = Dm.dst_carga
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_carga."TOT_CARGA"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 45.354359999999990000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ass Conferente')
          ParentFont = False
        end
      end
    end
  end
  object rd_vendas: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Visualiza'#231#227'o'
    OpcoesPreview.PreviewZoom = 95
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'CLAUDIO TOMASI'
    RegistroUsuario.SerieProduto = 'SINGLE-0415/02048'
    RegistroUsuario.AutorizacaoKey = 'O9IT-2CS2-OB3L-DAW1-8E87'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'CONFIGURA'#199#195'O'
    TitulodoRelatorio = 'Pedido'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 96
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 684
    Top = 65528
  end
  object mmRep: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 72
    Top = 184
    object mmRepID: TIntegerField
      FieldName = 'ID'
    end
    object mmRepNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmRepCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsRep: TDataSource
    DataSet = mmRep
    Left = 120
    Top = 192
  end
  object mmUF: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 248
    Top = 200
    object mmUFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmUFCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsUF: TDataSource
    DataSet = mmUF
    Left = 256
    Top = 232
  end
  object mmMeso: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 376
    Top = 200
    object mmMesoID: TIntegerField
      FieldName = 'ID'
    end
    object mmMesoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMesoCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMeso: TDataSource
    DataSet = mmMeso
    Left = 424
    Top = 208
  end
  object mmMicro: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 600
    Top = 216
    object mmMicroID: TIntegerField
      FieldName = 'ID'
    end
    object mmMicroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMicroCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMicro: TDataSource
    DataSet = mmMicro
    Left = 648
    Top = 224
  end
  object dsCidades: TDataSource
    DataSet = mmCidades
    Left = 880
    Top = 240
  end
  object mmCidades: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 832
    Top = 232
    object mmCidadesID: TIntegerField
      FieldName = 'ID'
    end
    object mmCidadesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmCidadesCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object mmClientes: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 328
    Top = 360
    object mmClientesCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object mmClientesCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmClientesREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
    object mmClientescod_cliente: TIntegerField
      FieldName = 'cod_cliente'
    end
    object mmClientescidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object mmClientesbairro: TStringField
      FieldName = 'bairro'
      Size = 100
    end
  end
  object dsClientes: TDataSource
    DataSet = mmClientes
    Left = 376
    Top = 368
  end
  object mmBairro: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 824
    Top = 320
    object mmBairroNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object mmBairroCheck: TBooleanField
      FieldName = 'Check'
    end
  end
  object dsBairro: TDataSource
    DataSet = mmBairro
    Left = 872
    Top = 328
  end
  object q_clientes: TFDQuery
    Connection = dao.CN
    Left = 624
    Top = 9
  end
end
