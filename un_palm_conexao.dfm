object FrPalmConexao: TFrPalmConexao
  Left = -37
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pedidos Enviados do Sistema Palm'
  ClientHeight = 711
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 670
    Width = 1014
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BtConferir: TsSpeedButton
      Left = 331
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Conferir'
      Enabled = False
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
      OnClick = BtConferirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object btImprimir: TsSpeedButton
      Left = 546
      Top = 6
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
    object btImportar: TsSpeedButton
      Left = 438
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Importar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btImportarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Shape1: TShape
      Left = 888
      Top = 11
      Width = 20
      Height = 10
      Brush.Color = clPurple
    end
    object Shape2: TShape
      Left = 888
      Top = 25
      Width = 20
      Height = 10
      Brush.Color = clGray
    end
    object sLabel1: TsLabel
      Left = 912
      Top = 9
      Width = 46
      Height = 13
      Caption = #192' Conferir'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 912
      Top = 23
      Width = 45
      Height = 13
      Caption = 'Conferido'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object CheckTodos: TsCheckBox
      Left = 9
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
      TabOrder = 0
      OnClick = CheckTodosClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 1014
    Height = 670
    ActivePage = TabConexao
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object TabConexao: TsTabSheet
      Caption = 'Conex'#245'es Palm'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object dgPalm: TDBGrid
        Left = 0
        Top = 0
        Width = 1006
        Height = 642
        Align = alClient
        Color = clWhite
        DataSource = dsPalm
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dgPalmCellClick
        OnDrawColumnCell = dgPalmDrawColumnCell
        OnDblClick = dgPalmDblClick
        OnEnter = dgPalmEnter
        OnKeyUp = dgPalmKeyUp
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_CONEXAO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#176' Conex'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTE'
            Title.Caption = 'Representante'
            Width = 615
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA_CONEXAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Width = 38
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTDE_PEDIDOS'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTDE_VISITAS_NEGATIVAS'
            Title.Alignment = taCenter
            Title.Caption = 'Visitas Neg.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'check'
            Title.Caption = ' '
            Width = 18
            Visible = True
          end>
      end
      object DBCheckBox1: TDBCheckBox
        Left = 248
        Top = 96
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'check'
        DataSource = dsPalm
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object TabPedido: TsTabSheet
      Caption = 'Pedidos'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TsPanel
        Left = 0
        Top = 209
        Width = 1006
        Height = 433
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object Panel5: TsPanel
          Left = 2
          Top = 2
          Width = 1002
          Height = 23
          Align = alTop
          Caption = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
        end
        object dgItem: TDBGrid
          Left = 2
          Top = 25
          Width = 1002
          Height = 406
          Align = alClient
          Color = clWhite
          DataSource = ds_itens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'produto'
              Title.Caption = 'Produto'
              Width = 546
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'volume'
              Title.Alignment = taCenter
              Title.Caption = 'Volume'
              Width = 46
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'qtd'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'preco_bruto'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Venda'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'preco'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o'
              Width = 65
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'perc_desc'
              Title.Alignment = taCenter
              Title.Caption = '% Desc.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sub_total'
              Title.Alignment = taCenter
              Title.Caption = 'Sub Tot.'
              Width = 70
              Visible = True
            end>
        end
      end
      object Panel3: TsPanel
        Left = 0
        Top = 0
        Width = 1006
        Height = 209
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Panel4: TsPanel
          Left = 2
          Top = 137
          Width = 1002
          Height = 23
          Align = alBottom
          Caption = 'OBSERVA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
        end
        object dgPedido: TDBGrid
          Left = 2
          Top = 25
          Width = 1002
          Height = 112
          Align = alClient
          Color = clWhite
          DataSource = ds_pedidos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = dgPedidoCellClick
          OnDrawColumnCell = dgPedidoDrawColumnCell
          OnEnter = dgPedidoEnter
          OnKeyUp = dgPedidoKeyUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'nr_pedido_palm'
              Title.Alignment = taCenter
              Title.Caption = 'N'#176' Palm'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'numdoc'
              Title.Alignment = taCenter
              Title.Caption = 'N'#176' Pedido'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'dtadoc'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliente'
              Title.Caption = 'Cliente'
              Width = 231
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'representante'
              Title.Caption = 'Representante'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fop'
              Title.Caption = 'Forma Pgto.'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prazo'
              Title.Caption = 'Prazo'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_bruto'
              Title.Alignment = taCenter
              Title.Caption = 'T.Bruto'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tot_liquido'
              Title.Alignment = taCenter
              Title.Caption = 'T.L'#237'quido'
              Width = 65
              Visible = True
            end>
        end
        object Panel6: TsPanel
          Left = 2
          Top = 2
          Width = 1002
          Height = 23
          Align = alTop
          Caption = 'PEDIDOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
        end
        object DBMemo1: TDBMemo
          Left = 2
          Top = 160
          Width = 1002
          Height = 47
          Align = alBottom
          DataField = 'OBSERVACOES_PEDIDO'
          DataSource = ds_pedidos
          TabOrder = 3
        end
      end
    end
    object tabConexaoVendor: TsTabSheet
      Caption = 'Conex'#245'es'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gdConexaoVendor: TDBGrid
        Left = 0
        Top = 0
        Width = 1006
        Height = 642
        Align = alClient
        Color = clWhite
        DataSource = ds_conexao_vendor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            FieldName = 'nr_conexao'
            Title.Alignment = taCenter
            Title.Caption = 'N'#176' Conex'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nom_representante'
            Title.Caption = 'Representante'
            Width = 509
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_conexao'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'hora_conexao'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 250
            Visible = True
          end>
      end
    end
  end
  object mmPalm: TRxMemoryData
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
    Left = 408
    Top = 64
    object mmPalmNR_CONEXAO: TIntegerField
      FieldName = 'NR_CONEXAO'
    end
    object mmPalmREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
    object mmPalmDATA_CONEXAO: TDateField
      FieldName = 'DATA_CONEXAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmPalmHORA: TTimeField
      FieldName = 'HORA'
      DisplayFormat = 'hh:mm'
    end
    object mmPalmQTDE_PEDIDOS: TIntegerField
      FieldName = 'QTDE_PEDIDOS'
    end
    object mmPalmQTDE_VISITAS_NEGATIVAS: TIntegerField
      FieldName = 'QTDE_VISITAS_NEGATIVAS'
    end
    object mmPalmCHECADO: TBooleanField
      FieldName = 'CHECADO'
    end
    object mmPalmcheck: TBooleanField
      FieldName = 'check'
    end
  end
  object dsPalm: TDataSource
    AutoEdit = False
    DataSet = mmPalm
    Left = 456
    Top = 64
  end
  object ds_pedidos: TDataSource
    DataSet = q_pedidos
    Left = 420
    Top = 252
  end
  object q_itens: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.ID,'
      '       a.NUMDOC,'
      
        '       cast(a.COD_PRODUTO || '#39'-'#39' || p.NOM_PRODUTO as varchar(100' +
        ')) as produto,'
      '       a.QTD,'
      '       a.PRECO,'
      '       a.SUB_TOTAL,'
      '       a.NR_PEDIDO_PALM,'
      '       a.PRECO_BRUTO,'
      
        '       (((a.PRECO_BRUTO - A.PRECO) / A.PRECO_BRUTO) * 100) AS PE' +
        'RC_DESC,'
      '       A.VOLUME'
      'FROM VENDAS2 a'
      '     inner join produto p on (p.COD_PRODUTO = a.COD_PRODUTO)'
      'where A.NUMDOC =:NUMDOC'
      'ORDER BY ID')
    Left = 528
    Top = 128
    ParamData = <
      item
        Name = 'NUMDOC'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_itensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_itensnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_itensproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      Size = 100
    end
    object q_itensqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_itenspreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_itenssub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_itensnr_pedido_palm: TStringField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      FixedChar = True
      Size = 7
    end
    object q_itenspreco_bruto: TBCDField
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      Precision = 15
      Size = 2
    end
    object q_itensperc_desc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_desc'
      Origin = 'perc_desc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_itensvolume: TBCDField
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
  end
  object ds_itens: TDataSource
    DataSet = q_itens
    Left = 468
    Top = 220
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
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 46135.398349791660000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var linhas, linha_final : integer;'
      '  '
      'procedure GroupHeader2OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '      linha_final := DetailData1.DataSet.RecNo;'
      'end;'
      '  '
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  linhas := DetailData1.DataSet.RecNo - linha_final;'
      '//  showmessage(floattostr(linhas));      '
      
        '  if ((engine.freespace) < (GroupHeader2.height + (DetailData1.h' +
        'eight * (linhas+1)) + (GroupFooter2.height))) then'
      '  begin'
      '//    showmessage(floattostr(linhas));'
      '    engine.NewPage;'
      '  end'
      '  else begin'
      
        '//    GroupFooter2.height := 5;                                 ' +
        '                                 '
      '  end;            '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 248
    Top = 296
    Datasets = <
      item
        DataSet = Dm.dst_configuracao
        DataSetName = 'dst_configuracao'
      end
      item
        DataSet = Dm.frxDBDataset2
        DataSetName = 'dst_pedidos_vendedor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
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
        Height = 7.559060000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = Dm.frxDBDataset2
        DataSetName = 'dst_pedidos_vendedor'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 684.094930000000000000
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 40.031540000000000000
        Top = 49.133890000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 622.176253330000000000
          Top = 0.333333330000002000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
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
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 8.892393330000001000
          Top = 21.354359999999990000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Listagem de Pedidos Digitados pelo Sistema WorbyRepres')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 511.569883330000000000
          Top = 21.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dtaini]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 598.499073330000000000
          Top = 21.133890000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 621.176253330000000000
          Top = 21.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtafin]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 638.740570000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 5.559060000000040000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            
              'Total Liquido Geral: [SUM(<dst_pedidos_vendedor."SUB_TOTAL">,Det' +
              'ailData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'dst_pedidos_vendedor."COD_REPRESENTANTE"'
        KeepTogether = True
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_vendas1
          DataSetName = 'dst_vendas1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Representante:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 3.779529999999990000
          Width = 608.504330000000000000
          Height = 15.118120000000000000
          DataField = 'REPRESENTANTE'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."REPRESENTANTE"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        DataSet = Dm.frxDBDataset2
        DataSetName = 'dst_pedidos_vendedor'
        KeepChild = True
        RowCount = 0
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.779530000000023000
          Width = 483.779564170000000000
          Height = 11.338590000000000000
          DataField = 'PRODUTO'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."PRODUTO"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 599.811057800000000000
          Top = 0.779530000000023000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'PRECO'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."PRECO"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 491.448745670000000000
          Top = 0.779530000000023000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."QTD"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 655.299630000000000000
          Top = 0.779530000000023000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DataField = 'SUB_TOTAL'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."SUB_TOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252002680000000000
          Top = 0.779530000000023000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."UNIDADE"]/[dst_pedidos_vendedor."VOLUME"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 118.724490000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'GroupHeader2OnAfterPrint'
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'dst_pedidos_vendedor."NUMDOC"'
        KeepChild = True
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.118119999999976000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' PEDIDO:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 3.559060000000000000
          Top = 17.795300000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE:')
          ParentFont = False
        end
        object dst_vendas1NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 73.811070000000000000
          Top = 0.755893309999976100
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'NUMDOC'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."NUMDOC"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 0.755893309999976100
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'DTADOC'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."DTADOC"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 74.590600000000000000
          Top = 17.433073309999900000
          Width = 657.638220000000000000
          Height = 15.118120000000000000
          DataField = 'CLIENTE'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."CLIENTE"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Top = 106.606370000000000000
          Width = 483.779840000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 599.811057800000000000
          Top = 106.385900000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 491.448745670000000000
          Top = 106.385900000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 655.197280000000000000
          Top = 106.385900000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Item')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252002680000000000
          Top = 106.385900000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Unid\Volume')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 34.157526689999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 34.795300000000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[<dst_pedidos_vendedor."ENDERECO">], [<dst_pedidos_vendedor."NR_' +
              'ENDERECO">]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 51.913419999999900000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP.:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 51.551193309999900000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'CEP'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."CEP"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 51.496116690000000000
          Width = 64.252010000000000000
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
            'CIDADE:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 256.228510000000000000
          Top = 51.133889999999900000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<dst_pedidos_vendedor."CIDADE">]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 68.393766690000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ\CPF:')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 69.031539999999900000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<dst_pedidos_vendedor."CNPJ">]\[<dst_pedidos_vendedor."CPF">]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 68.393766690000000000
          Width = 64.252010000000000000
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
            'I.E.\RG:')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 362.055350000000000000
          Top = 68.031539999999900000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<dst_pedidos_vendedor."IE">]\[<dst_pedidos_vendedor."RG">]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 85.929189999999900000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EMAIL:')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 86.566963310000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          DataField = 'EMAIL'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."EMAIL"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 430.866420000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Checado por:')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          DataField = 'USUARIO_CHECOU'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."USUARIO_CHECOU"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 53.055176689999900000
          Width = 75.590600000000000000
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
            'Forma Pgto.:')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 619.063390000000000000
          Top = 52.913419999999900000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'FOP'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."FOP"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 69.952826689999900000
          Width = 75.590600000000000000
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
            'Prazo Pgto.:')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 619.063390000000000000
          Top = 69.811069999999900000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'PRAZO'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."PRAZO"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 3.779530000000020000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            
              'Total Liquido: [SUM(<dst_pedidos_vendedor."SUB_TOTAL">,DetailDat' +
              'a1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000020000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'OBS.:')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Top = 22.677180000000000000
          Width = 710.551640000000000000
          Height = 71.811070000000000000
          DataField = 'OBSERVACOES_PEDIDO'
          DataSet = Dm.frxDBDataset2
          DataSetName = 'dst_pedidos_vendedor'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[dst_pedidos_vendedor."OBSERVACOES_PEDIDO"]')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            
              'Total Liquido Representante: [SUM(<dst_pedidos_vendedor."SUB_TOT' +
              'AL">,DetailData1)]')
          ParentFont = False
        end
      end
    end
  end
  object q_conexao_vendor: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, r.NOM_REPRESENTANTE, a' +
        '.DATA_CONEXAO, a.HORA_CONEXAO, a.TIPO'
      'FROM CONEXAO_VENDOR a'
      'inner join REPRESENTANTE r on r.id = a.COD_REPRESENTANTE')
    Left = 96
    Top = 120
    object q_conexao_vendornr_conexao: TIntegerField
      FieldName = 'nr_conexao'
      Origin = 'nr_conexao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_conexao_vendorcod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_conexao_vendordata_conexao: TDateField
      FieldName = 'data_conexao'
      Origin = 'data_conexao'
    end
    object q_conexao_vendorhora_conexao: TTimeField
      FieldName = 'hora_conexao'
      Origin = 'hora_conexao'
    end
    object q_conexao_vendortipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
    object q_conexao_vendornom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
  end
  object ds_conexao_vendor: TDataSource
    DataSet = q_conexao_vendor
    Left = 220
    Top = 84
  end
  object q_arquivos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select'
      '  NOME,'
      '  ANO,'
      '  ARQUIVO,'
      '  STATUS'
      'from'
      'PALM_ARQUIVOS'
      'where'
      ' status <> '#39'1'#39
      '')
    Left = 632
    Top = 136
    object q_arquivosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_arquivosano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_arquivosarquivo: TBlobField
      FieldName = 'arquivo'
      Origin = 'arquivo'
    end
    object q_arquivosstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
  end
  object q_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.NUMDOC,'
      '       a.DTADOC,'
      
        '       cast(a.COD_CLIENTE || '#39'-'#39' || c.NOM_CLIENTE as varchar(100' +
        ')) as cliente,'
      '       a.TOT_BRUTO,'
      '       a.TOT_LIQUIDO,'
      
        '       cast(a.COD_FOP || '#39'-'#39' || f.NOM_FOP as varchar(100)) as fo' +
        'p,'
      
        '       cast(a.COD_REPRESENTANTE || '#39'-'#39' || r.NOM_REPRESENTANTE as' +
        ' VARCHAR(100)) as representante,'
      '       p.PRAZO,'
      '       a.NR_PEDIDO_PALM,'
      '       a.PALM_NR_CONEXAO,'
      '       A.OBSERVACOES_PEDIDO,'
      '       a.pedido_vendedor,'
      '       a.processo_id'
      'FROM VENDAS1 a'
      '     inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE)'
      '     inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE)'
      '     left join prazo p on (p.ID = a.COD_PRAZO_PGTO)'
      '     left join fop f on (f.COD_FOP = a.COD_FOP)'
      
        '     inner join palm_lote l on l.nr_conexao = a.palm_nr_conexao ' +
        'and a.cod_representante = l.cod_representante'
      'where a.PALM_NR_CONEXAO = :nr_conexao and'
      '      l.data_conexao = :dt_conexao '
      'order by numdoc')
    Left = 416
    Top = 112
    ParamData = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
      end
      item
        Name = 'DT_CONEXAO'
        DataType = ftDate
        ParamType = ptInput
      end>
    object q_pedidosnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pedidosdtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_pedidoscliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      Size = 100
    end
    object q_pedidostot_bruto: TBCDField
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidostot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_pedidosfop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fop'
      Origin = 'fop'
      ReadOnly = True
      Size = 100
    end
    object q_pedidosrepresentante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      Size = 100
    end
    object q_pedidosprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_pedidosnr_pedido_palm: TStringField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      FixedChar = True
      Size = 7
    end
    object q_pedidospalm_nr_conexao: TIntegerField
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
    end
    object q_pedidosobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_pedidospedido_vendedor: TStringField
      FieldName = 'pedido_vendedor'
      Origin = 'pedido_vendedor'
      FixedChar = True
      Size = 1
    end
    object q_pedidosprocesso_id: TIntegerField
      FieldName = 'processo_id'
      Origin = 'processo_id'
    end
  end
end
