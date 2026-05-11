object fm_aviso_representantes: Tfm_aviso_representantes
  Left = 219
  Top = 222
  BorderIcons = [biSystemMenu]
  Caption = 'Aviso aos Representantes.'
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
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BtOK: TsBitBtn
      Left = 246
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
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BitBtn1: TsBitBtn
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object CheckTodos: TsCheckBox
      Left = 9
      Top = 14
      Width = 119
      Height = 20
      Caption = 'Selecionar Todos'
      Alignment = taLeftJustify
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = CheckTodosClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 371
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object dgRepresentantes: TDBGrid
      Left = 2
      Top = 2
      Width = 684
      Height = 367
      Align = alClient
      DataSource = dsRepresentantes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dgRepresentantesDrawColumnCell
      OnDblClick = dgRepresentantesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Representante'
          Width = 626
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHECK'
          Title.Caption = ' '
          Width = 20
          Visible = True
        end>
    end
    object DBCheckBox1: TDBCheckBox
      Left = 248
      Top = 96
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'CHECK'
      DataSource = dsRepresentantes
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 371
    Width = 688
    Height = 41
    Align = alBottom
    BevelInner = bvSpace
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object rgEnvio: TsRadioGroup
      Left = 8
      Top = 3
      Width = 673
      Height = 30
      Caption = 'Forma de Envio'
      ParentBackground = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Email'
        'SMS (Torpedo Celular)')
    end
  end
  object dsRepresentantes: TDataSource
    DataSet = mmRepresentantes
    Left = 256
    Top = 72
  end
  object mmRepresentantes: TRxMemoryData
    FieldDefs = <>
    Left = 208
    Top = 72
    object mmRepresentantesID: TIntegerField
      FieldName = 'ID'
    end
    object mmRepresentantesNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object mmRepresentantesCHECK: TBooleanField
      FieldName = 'CHECK'
    end
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'http://www.naoligo.com.br/ws/server.php?wsdl'
    Service = 'ServerSendSMS'
    Port = 'ServerSendSMSPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 184
    Top = 168
  end
end
