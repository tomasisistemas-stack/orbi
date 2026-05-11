object FMCIDREL: TFMCIDREL
  Left = 616
  Top = 210
  Width = 275
  Height = 527
  Caption = 'Relatorio Detalhado de Clientes'
  Color = clInfoBk
  Ctl3D = False
  BorderIcons = [biSystemMenu]
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: tsLabel
    Left = 24
    Top = 0
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object LKCODUF: TIB_LookupCombo
    Left = 5
    Top = 13
    Width = 55
    Height = 21
    DataSource = DSCODUF
    TabOrder = 0
    CustomPopup = LKLBCODUF
    ShowButton = True
  end
  object LKLBCODUF: TIB_LookupList
    Left = 6
    Top = 16
    Width = 42
    Height = 25
    CustomGlyphsSupplied = []
    DataSource = DSCODUF
    TabOrder = 1
  end
  object Button1: TButton
    Left = 63
    Top = 12
    Width = 90
    Height = 25
    Caption = 'Mostrar Cidades'
    TabOrder = 2
    OnClick = Button1Click
  end
  object LBCID: TCheckListBox
    Left = 3
    Top = 114
    Width = 261
    Height = 347
    ItemHeight = 13
    TabOrder = 3
  end
  object BTIMP: TButton
    Left = 89
    Top = 463
    Width = 90
    Height = 28
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BTIMPClick
  end
  object BTTOD: TsBitBtn
    Left = 155
    Top = 12
    Width = 108
    Height = 25
    Caption = 'Marcar Todos'
    TabOrder = 5
    OnClick = BTTODClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF905F5A905F5A905F5A905F5A905F5A905F5A905F5A90
      5F5A905F5A905F5AFF00FF000000000000000000000000FF00FF905F5AEDD8CA
      E9D0BFE6CAB5E3C4ABE0BDA1DDB898DAB28FD7AD86905F5AFF00FF000000FF00
      FF0001DC000000FF00FF905F5AFBF4EEF8EDE0F7E6D1F4E0C5F2D9B8F0D3ACEF
      CCA0EDC793905F5AFF00FF0000000001DC0001DC000000FF00FF905F5A905F5A
      905F5A905F5A905F5A905F5A905F5A905F5A905F5A905F5AFF00FF0000000000
      000000000000BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001DC905F5A905F5A
      905F5A905F5A905F5A905F5A905F5A905F5A905F5A905F5AFF00FF0000000000
      00000000000000FF00FF905F5AEDD8CAE9D0BFE6CAB5E3C4ABE0BDA1DDB898DA
      B28FD7AD86905F5AFF00FF000000FF00FF0001DC000000FF00FF905F5AFBF4EE
      F8EDE0F7E6D1F4E0C5F2D9B8F0D3ACEFCCA0EDC793905F5AFF00FF0000000001
      DC0001DC000000FF00FF905F5A905F5A905F5A905F5A905F5A905F5A905F5A90
      5F5A905F5A905F5AFF00FF0000000000000000000000BBFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF0001DC905F5A905F5A905F5A905F5A905F5A905F5A905F5A90
      5F5A905F5A905F5AFF00FF000000000000000000000000FF00FF905F5AEDD8CA
      E9D0BFE6CAB5E3C4ABE0BDA1DDB898DAB28FD7AD86905F5AFF00FF000000FF00
      FF0001DC000000FF00FF905F5AFBF4EEF8EDE0F7E6D1F4E0C5F2D9B8F0D3ACEF
      CCA0EDC793905F5AFF00FF0000000001DC0001DC000000FF00FF905F5A905F5A
      905F5A905F5A905F5A905F5A905F5A905F5A905F5A905F5AFF00FF0000000000
      000000000000BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001DC}
  end
  object rb_tod_rep: TRadioButton
    Left = 65
    Top = 79
    Width = 113
    Height = 17
    Caption = 'Todos Representantes'
    TabOrder = 6
    OnClick = rb_tod_repClick
  end
  object lkcodrep: TIB_LookupCombo
    Left = 7
    Top = 54
    Width = 235
    Height = 21
    DataSource = DSREP
    TabOrder = 7
    OnEnter = lkcodrepEnter
    DisplayField = 'NOMREP'
    ShowButton = True
  end
  object CBRELSIM: tscheckbox
    Left = 10
    Top = 95
    Width = 239
    Height = 17
    Caption = 'Relatorio Simplificado de Clientes'
    TabOrder = 8
  end
  object QUUF: TFDQuery
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    FieldsCharCase.Strings = (
      'UF=UPPER')
    FieldsVisible.Strings = (
      'DB_KEY=FALSE')
    Connection = dao.CN
    SQL.Strings = (
      'SELECT UF FROM uf'
      'order by uf')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    OrderingItemNo = 1
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 104
    Top = 64
  end
  object DSCODUF: TIB_DataSource
    Dataset = QUUF
    Left = 136
    Top = 56
  end
  object QUGERREL: TFDQuery
    DatabaseName = 'localhost:c:\cg7\dados\cg.gdb'
    Connection = dao.CN_store
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 184
    Top = 40
  end
  object DSQUGERREL: TIB_DataSource
    Dataset = QUGERREL
    Left = 208
    Top = 48
  end
  object QUCLI: TFDQuery
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    SQL.Strings = (
      'select cli.*,cid.nom_cidade from cliente cli'
      'left join cidade cid on cid.cod_cidade=cli.cod_cidade'
      'order by cid.nom_cidade')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    
    FetchWholeRows = True
    Left = 200
    Top = 96
  end
  object DSQUCLI: TIB_DataSource
    Dataset = QUCLI
    Left = 208
    Top = 152
  end
  object RDCLICID: TRDprint
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
    OpcoesPreview.PaginaZebrada = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    Autor = Deltress
    About = 'RDprint 3.0h - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Configura'#231#227'o'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    PortaComunicacao = 'LPT1'
    TestarPorta = False
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumeroPaginaInicial = 1
    PaginaInicial = 1
    PaginaFinal = 9999
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poLandscape
    Left = 224
    Top = 64
  end
  object QUREP: TFDQuery
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    FieldsCharCase.Strings = (
      'NOMREP=UPPER')
    FieldsVisible.Strings = (
      'CODREP=FALSE')
    Connection = dao.CN
    SQL.Strings = (
      'select id, nom_representante from representante'
      'order by nom_representante')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    OrderingItemNo = 1
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 160
    Top = 96
  end
  object DSREP: TIB_DataSource
    Dataset = QUREP
    Left = 176
    Top = 152
  end
end
