object Fr_relatorio_cliente_vendedor: TFr_relatorio_cliente_vendedor
  Left = 678
  Top = 213
  BorderIcons = [biSystemMenu]
  Caption = 'Fr_relatorio_cliente_vendedor'
  ClientHeight = 501
  ClientWidth = 266
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
  object Label1: TsLabel
    Left = 24
    Top = 0
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object LKCODUF: TDBLookupComboBox
    Left = 5
    Top = 13
    Width = 55
    Height = 21
    DataSource = DSCODUF
    TabOrder = 0
  end
  object LKLBCODUF: TDBLookupComboBox
    Left = 8
    Top = 40
    Width = 42
    Height = 21
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
    TabOrder = 5
    OnClick = BTTODClick
    SkinData.SkinSection = 'BUTTON'
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
  object CBRELSIM: TsCheckBox
    Left = 10
    Top = 95
    Width = 176
    Height = 20
    Caption = 'Relatorio Simplificado de Clientes'
    TabOrder = 7
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object lkcodrep: TComboBox
    Left = 56
    Top = 43
    Width = 145
    Height = 21
    TabOrder = 8
    Text = 'lkcodrep'
  end
  object QUUF: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT UF FROM uf ')
    Left = 104
    Top = 64
  end
  object DSCODUF: TDataSource
    DataSet = QUUF
    Left = 112
    Top = 48
  end
  object QUGERREL: TFDQuery
    Connection = dao.CN
    Left = 184
    Top = 40
  end
  object DSQUGERREL: TDataSource
    DataSet = QUGERREL
    Left = 208
    Top = 48
  end
  object QUCLI: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select cli.*,cid.nom_cidade from cliente cli'
      'left join cidades cid on cid.cod_cidade=cli.cod_cidade'
      'order by cid.nom_cidade')
    Left = 200
    Top = 96
  end
  object DSQUCLI: TDataSource
    DataSet = QUCLI
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
    CaptionSetup = 'Configura'#231#227'o'
    TitulodoRelatorio = 'Gerado por RDprint'
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
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poLandscape
    Left = 224
    Top = 64
  end
  object QUREP: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select id, nom_representante from representante')
    Left = 160
    Top = 96
  end
  object DSREP: TDataSource
    DataSet = QUREP
    Left = 176
    Top = 152
  end
end
