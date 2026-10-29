object dao: Tdao
  Left = 538
  Top = 155
  BorderIcons = [biSystemMenu]
  Caption = 'dao'
  ClientHeight = 430
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PrintScale = poNone
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 256
    Top = 0
    Width = 345
    Height = 130
    Caption = 'controles'
    TabOrder = 0
    object Edit1: TsEdit
      Left = 7
      Top = 42
      Width = 111
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Edit1'
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
    object ZZfone_corretor: TMaskEdit
      Left = 13
      Top = 16
      Width = 115
      Height = 21
      EditMask = '(##)####-####;1;_'
      MaxLength = 13
      TabOrder = 1
      Text = '(  )    -    '
    end
    object PRcod_analista: TsComboEdit
      Left = 242
      Top = 16
      Width = 66
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = ''
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
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object zzdata_proposta: TsDateEdit
      Left = 134
      Top = 17
      Width = 91
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
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
    end
    object FNvl_honorario_inspecao: TsCurrencyEdit
      Left = 145
      Top = 68
      Width = 99
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
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
    end
    object RichEdit1: TRichEdit
      Left = 7
      Top = 66
      Width = 113
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
      ParentFont = False
      TabOrder = 6
      Zoom = 100
    end
    object ComboBox1: TComboBox
      Left = 240
      Top = 44
      Width = 97
      Height = 21
      TabOrder = 5
      Text = 'ComboBox1'
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 136
    Width = 284
    Height = 105
    Caption = 'conex'#227'o NET'
    TabOrder = 1
  end
  object GroupBox3: TGroupBox
    Left = 301
    Top = 136
    Width = 284
    Height = 105
    Caption = 'Conex'#227'o Frente de Caixa'
    TabOrder = 2
  end
  object GroupBox4: TGroupBox
    Left = 5
    Top = 248
    Width = 284
    Height = 97
    Caption = 'Conex'#227'o M'#243'dulo Vendor BD de Origem'
    TabOrder = 3
  end
  object Q_insert: TFDQuery
    Connection = CN
    Left = 44
    Top = 8
  end
  object Q_update: TFDQuery
    Connection = CN
    Left = 75
    Top = 8
  end
  object Q1: TFDQuery
    Connection = CN
    Left = 14
    Top = 72
  end
  object Q2: TFDQuery
    Connection = CN
    Left = 47
    Top = 73
  end
  object Q_delete: TFDQuery
    Connection = CN
    Left = 107
    Top = 8
  end
  object IB_Query1: TFDQuery
    Connection = CN
    Left = 134
    Top = 8
  end
  object geral: TFDQuery
    Connection = CN
    Left = 6
    Top = 8
  end
  object Exec_sql: TFDQuery
    Connection = CN
    Transaction = tr
    UpdateTransaction = tr
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockWait, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    Left = 6
    Top = 40
  end
  object q_log: TFDQuery
    Connection = CN
    Left = 167
    Top = 9
  end
  object Q1S: TFDQuery
    Connection = CN
    Left = 422
    Top = 96
  end
  object Q2S: TFDQuery
    Connection = CN
    Left = 415
    Top = 121
  end
  object Exec_sql2: TFDQuery
    Connection = CN
    Left = 46
    Top = 40
  end
  object Q_atualiza_estrutura: TFDQuery
    Connection = CN
    Left = 86
    Top = 40
  end
  object Q3: TFDQuery
    Connection = CN
    Transaction = tr
    Left = 85
    Top = 73
  end
  object q3_net: TFDQuery
    Connection = CN_NET
    Left = 154
    Top = 156
  end
  object q1_net: TFDQuery
    Connection = CN_NET
    Left = 89
    Top = 155
  end
  object q2_net: TFDQuery
    Connection = CN_NET
    Left = 122
    Top = 156
  end
  object exec_sql2_net: TFDQuery
    Connection = CN_NET
    Left = 249
    Top = 155
  end
  object exec_sql_net: TFDQuery
    Connection = CN_NET
    Left = 217
    Top = 155
  end
  object Q_update_net: TFDQuery
    Connection = CN_NET
    Left = 122
    Top = 186
  end
  object Q_insert_net: TFDQuery
    Connection = CN_NET
    Left = 89
    Top = 186
  end
  object Q_delete_net: TFDQuery
    Connection = CN_NET
    Left = 154
    Top = 186
  end
  object SMTP_suporte: TIdSMTP
    Password = 'pergher'
    SASLMechanisms = <>
    Username = 'felipesans'
    Left = 312
    Top = 78
  end
  object IMmail: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 552
    Top = 80
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    DrawNonClientArea = False
    SkinData.SkinManager = SkinData1
    SkinData.SkinSection = 'FORM'
    ScreenSnap = True
    TitleButtons = <>
    TitleSkin = 'FORMTITLE'
    Left = 512
    Top = 260
  end
  object SkinData1: TsSkinManager
    Active = False
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'MS Sans Serif'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'C:\orbi\trunk\Skin'
    SkinName = 'Zest'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = 
      ' '#13#10'TsEdit'#13#10'TMemo'#13#10'TMaskEdit'#13#10'tsLabeledEdit'#13#10'THotKey'#13#10'TListBox'#13#10'T' +
      'CheckListBox'#13#10'TRichEdit'#13#10'TDateTimePicker'#13#10'TDBListBox'#13#10'TDBMemo'#13#10'T' +
      'DBLookupListBox'#13#10'TDBRichEdit'#13#10'TDBCtrlGrid'#13#10'TDBEdit'#13#10'TTnTsEdit'#13#10'T' +
      'TntMemo'#13#10'TTntListBox'#13#10'TTntCheckListBox'#13#10'TTntRichEdit'#13#10'TTntDBEdit' +
      #13#10'TTntDBMemo'#13#10'TTntDBRichEdit'#13#10'TfrxPreviewWorkspace'#13#10'TfrxScrollBo' +
      'x'#13#10'TDBLUEdit'#13#10'TAdvSpinEdit'#13#10'TAdvLUEdit'#13#10'TAdvEditBtn'#13#10'TUnitAdvEdi' +
      'tBtn'#13#10'TAdvFileNameEdit'#13#10'TAdvDirectoryEdit'#13#10'TDBAdvLUEdit'#13#10'TDBAdvS' +
      'pinEdit'#13#10'TDBAdvEdit'#13#10'TDBAdvMaskEdit'#13#10'TsEditBtn'#13#10'TUniTsEditBtn'#13#10'T' +
      'MoneyEdit'#13#10'TDBMoneyEdit'#13#10'TMaskEditEx'#13#10'TsEditListBox'#13#10'TAdvEdit'#13#10'T' +
      'AdvMaskEdit'#13#10'TLUEdit'#13#10'TDBAdvEditBtn'#13#10'TAdvMoneyEdit'#13#10'TDBAdvMoneyE' +
      'dit'#13#10'THTMListBox'#13#10'THTMLCheckList'#13#10'TParamListBox'#13#10'TParamCheckList' +
      #13#10'TSynEdit'#13#10'TSynMemo'#13#10'TDBSynEdit'#13#10'TRzEdit'#13#10'TRzHotKeyEdit'#13#10'TRzMas' +
      'kEdit'#13#10'TRzNumericEdit'#13#10'TRzExpandEdit'#13#10'TRzMemo'#13#10'TRzListBox'#13#10'TRzRa' +
      'nkListBox'#13#10'TRzTabbedListBox'#13#10'TRzCheckList'#13#10'TRzEditListBox'#13#10'TRzRi' +
      'chEdit'#13#10
    ThirdParty.ThirdButtons = ' '#13#10'TButton'#13#10'TTntButton'#13#10
    ThirdParty.ThirdBitBtns = ' '#13#10'TsBitBtn'#13#10'TTnTsBitBtn'#13#10
    ThirdParty.ThirdCheckBoxes = 
      ' '#13#10'tscheckbox'#13#10'TRadioButton'#13#10'TGroupButton'#13#10'TDBCheckBox'#13#10'TTntChec' +
      'kBox'#13#10'TTntRadioButton'#13#10'TTntDBCheckBox'#13#10'TTntDBRadioButton'#13#10'TTntGr' +
      'oupButton'#13#10'TDBCheckBoxEh'#13#10
    ThirdParty.ThirdGroupBoxes = 
      ' '#13#10'TGroupBox'#13#10'TRadioGroup'#13#10'TDBRadioGroup'#13#10'TTntGroupBox'#13#10'TTntRadi' +
      'oGroup'#13#10'TTntDBRadioGroup'#13#10'TRzGroupBox'#13#10
    ThirdParty.ThirdListViews = ' '#13#10'TListView'#13#10'TTntListView'#13#10'TRzListView'#13#10'TRzShellList'#13#10
    ThirdParty.ThirdPanels = ' '#13#10'tsPanel'#13#10'TDBCtrlPanel'#13#10'TTntsPanel'#13#10'TfrxTBPanel'#13#10'TRzPanel'#13#10
    ThirdParty.ThirdGrids = 
      ' '#13#10'TStringGrid'#13#10'TDrawGrid'#13#10'TValueLisTsEditor'#13#10'Tdbgrid'#13#10'TTntStrin' +
      'gGrid'#13#10'TTntDrawGrid'#13#10'TTnTdbgrid'#13#10'TwwDBGrid'#13#10'TAdvStringGrid'#13#10'TDBA' +
      'dvGrid'#13#10'TRichView'#13#10'TDBRichViewEdit'#13#10'TRichViewEdit'#13#10'TDBRichView'#13#10
    ThirdParty.ThirdTreeViews = 
      ' '#13#10'TTreeView'#13#10'TDBTreeView'#13#10'TTntTreeView'#13#10'THTMLTreeview'#13#10'TParamTr' +
      'eeview'#13#10'TRzTreeView'#13#10'TRzCheckTree'#13#10'TRzShellTree'#13#10
    ThirdParty.ThirdComboBoxes = 
      ' '#13#10'TComboBox'#13#10'TColorBox'#13#10'TDBComboBox'#13#10'TTntComboBox'#13#10'TTntDBComboB' +
      'ox'#13#10'TDBLUCombo'#13#10'TAdvComboBox'#13#10'TLUCombo'#13#10'TAdvDBLookupComboBox'#13#10'TA' +
      'dvTreeComboBox'#13#10'THTMLComboBox'#13#10'TRzComboBox'#13#10'TRzImageComboBox'#13#10'TR' +
      'zMRUComboBox'#13#10'TRzShellCombo'#13#10
    ThirdParty.ThirdWWEdits = 
      ' '#13#10'TwwDBComboBox'#13#10'TwwDBCustomCombo'#13#10'TwwDBCustomLookupCombo'#13#10'TChe' +
      'ckLisTsEdit'#13#10'TRzDateTimeEdit'#13#10
    ThirdParty.ThirdVirtualTrees = 
      ' '#13#10'TVirtualStringTree'#13#10'TVirtualStringTreeDB'#13#10'TEasyListview'#13#10'TVir' +
      'tualExplorerListview'#13#10'TVirtualExplorerTreeview'#13#10'TVirtualExplorer' +
      'Tree'#13#10'TVirtualExplorerEasyListview'#13#10'TVirtualDrawTree'#13#10
    ThirdParty.ThirdGridEh = ' '#13#10'TdbgridEh'#13#10
    ThirdParty.ThirdPageControl = ' '#13#10'TPageControl'#13#10
    ThirdParty.ThirdTabControl = ' '#13#10'TTabControl'#13#10
    ThirdParty.ThirdToolBar = ' '#13#10'TToolBar'#13#10
    ThirdParty.ThirdStatusBar = ' '#13#10'TStatusBar'#13#10
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 472
    Top = 256
  end
  object Q5: TFDQuery
    Connection = CN
    Left = 180
    Top = 80
  end
  object q1_frente: TFDQuery
    Connection = CN_Frente
    Left = 385
    Top = 155
  end
  object q2_frente: TFDQuery
    Connection = CN_Frente
    Left = 417
    Top = 155
  end
  object q3_frente: TFDQuery
    Connection = CN_Frente
    Left = 449
    Top = 155
  end
  object exec_sql_frente: TFDQuery
    Connection = CN_Frente
    Left = 513
    Top = 155
  end
  object exec_sql_frente2: TFDQuery
    Connection = CN_Frente
    Left = 545
    Top = 155
  end
  object Q_insert_frente: TFDQuery
    Connection = CN_Frente
    Left = 385
    Top = 187
  end
  object Q_update_frente: TFDQuery
    Connection = CN_Frente
    Left = 417
    Top = 187
  end
  object Q_delete_frente: TFDQuery
    Connection = CN_Frente
    Left = 449
    Top = 187
  end
  object q1_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 89
    Top = 275
  end
  object q2_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 121
    Top = 275
  end
  object q3_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 153
    Top = 275
  end
  object exec_sql_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 217
    Top = 275
  end
  object exec_sql_vendor2: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 249
    Top = 275
  end
  object Q_delete_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 153
    Top = 307
  end
  object Q_update_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 121
    Top = 307
  end
  object Q_insert_vendor: TFDQuery
    Connection = CN_Vendor_Origem
    Left = 89
    Top = 307
  end
  object qrGravaFoto: TFDQuery
    Connection = CN
    SQL.Strings = (
      'UPDATE subcategoria '
      'SET imagem_bd =:bitmap_foto'
      'WHERE id =:id')
    Left = 214
    Top = 80
  end
  object Q4: TFDQuery
    Connection = CN
    Left = 124
    Top = 72
  end
  object q_nav: TFDQuery
    Connection = CN
    Left = 392
    Top = 288
  end
  object CN: TFDConnection
    Params.Strings = (
      'Database=orbi'
      'Password=123'
      'User_Name=postgres'
      'Server=172.16.1.250'
      'DriverID=PG')
    LoginPrompt = False
    Left = 496
    Top = 344
  end
  object CN_Export: TFDConnection
    Params.Strings = (
      'Database=C:\ORBI\ORBI.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    Transaction = tr
    Left = 528
    Top = 336
  end
  object CN_NET: TFDConnection
    Params.Strings = (
      'Database=C:\ORBI\ORBI.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=PG')
    LoginPrompt = False
    Left = 560
    Top = 336
  end
  object CN_Vendor_Origem: TFDConnection
    Params.Strings = (
      'Database=C:\ORBI\ORBI.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=PG')
    Left = 464
    Top = 336
  end
  object CN_store: TFDConnection
    Params.Strings = (
      'Database=C:\ORBI\ORBI.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=PG')
    LoginPrompt = False
    Left = 432
    Top = 336
  end
  object CN_Frente: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    LoginPrompt = False
    Left = 400
    Top = 336
  end
  object trservidor: TFDTransaction
    Connection = CN
    Left = 40
    Top = 352
  end
  object tr_atualiza_estrutura: TFDTransaction
    Connection = CN
    Left = 72
    Top = 352
  end
  object tr_net: TFDTransaction
    Connection = CN
    Left = 112
    Top = 352
  end
  object tr: TFDTransaction
    Connection = CN
    Left = 148
    Top = 352
  end
  object tr_export: TFDTransaction
    Connection = CN
    Left = 188
    Top = 352
  end
  object tr_vendor: TFDTransaction
    Connection = CN
    Left = 236
    Top = 352
  end
  object tr_frente: TFDTransaction
    Connection = CN
    Left = 284
    Top = 352
  end
  object TRS: TFDTransaction
    Connection = CN
    Left = 332
    Top = 352
  end
  object IS_IMPORTAR_DADOS: TFDScript
    SQLScripts = <
      item
        Name = 'Importar'
      end>
    Connection = CN
    Params = <>
    Macros = <>
    Left = 336
    Top = 240
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'fbclient.dll'
    Left = 560
    Top = 264
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'libpq.dll'
    Left = 424
    Top = 240
  end
end
