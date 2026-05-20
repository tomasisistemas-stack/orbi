object Fr_vendas_industria2: TFr_vendas_industria2
  Left = 195
  Top = 110
  Anchors = [akLeft, akTop, akRight, akBottom]
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Pedidos'
  ClientHeight = 674
  ClientWidth = 1272
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  ObjectMenuItem = CancelamentoAvulso1
  ParentBiDiMode = False
  Position = poDesigned
  PrintScale = poNone
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gbdados: TsGroupBox
    Left = 0
    Top = 0
    Width = 1272
    Height = 241
    Align = alTop
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    DesignSize = (
      1272
      241)
    object Label1: TsLabel
      Left = 10
      Top = 9
      Width = 73
      Height = 13
      Caption = 'N'#186' Documento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 104
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Data:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label11: TsLabel
      Left = 7
      Top = 46
      Width = 37
      Height = 13
      Caption = 'Cliente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lbnom_representante: TsLabel
      Left = 372
      Top = 25
      Width = 160
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label8: TsLabel
      Left = 279
      Top = 9
      Width = 50
      Height = 13
      Caption = 'Vendedor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lbnom_cliente: TsLabel
      Left = 115
      Top = 62
      Width = 788
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lbnom_fop: TsLabel
      Left = 91
      Top = 97
      Width = 3
      Height = 13
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label16: TsLabel
      Left = 9
      Top = 81
      Width = 106
      Height = 13
      Caption = 'Forma de Pagamento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label17: TsLabel
      Left = 177
      Top = 81
      Width = 88
      Height = 13
      Caption = 'Prazo Pagamento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lbprazo_pgto: TsLabel
      Left = 260
      Top = 99
      Width = 3
      Height = 13
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbObs: TsLabel
      Left = 9
      Top = 160
      Width = 62
      Height = 13
      Caption = 'Observa'#231#227'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lb_orcamento: TsLabel
      Left = 1139
      Top = 9
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Or'#231'amento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ExplicitLeft = 1225
    end
    object Lb_consignacao: TsLabel
      Left = 1139
      Top = 44
      Width = 65
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Consigna'#231#227'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Lbnom_supervisor: TsLabel
      Left = 743
      Top = 25
      Width = 260
      Height = 13
      AutoSize = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbSupervisor: TsLabel
      Left = 657
      Top = 9
      Width = 104
      Height = 13
      Caption = 'Vendedor Supervisor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object LbNom_fornecedor: TsLabel
      Left = 80
      Top = 224
      Width = 3
      Height = 13
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbForn: TsLabel
      Left = 9
      Top = 203
      Width = 120
      Height = 13
      Caption = 'Fornecedor (Devolu'#231#227'o):'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbcidade_forn: TsLabel
      Left = 597
      Top = 220
      Width = 41
      Height = 13
      Caption = 'Cidade:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object lbCnpj_forn: TsLabel
      Left = 429
      Top = 220
      Width = 28
      Height = 13
      Caption = 'Cnpj:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object lbcontabanco: TsLabel
      Left = 9
      Top = 115
      Width = 83
      Height = 13
      Caption = 'Banco CC Boleto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbCCBoleto: TsLabel
      Left = 77
      Top = 131
      Width = 3
      Height = 13
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stOrigem: TsLabel
      Left = 1015
      Top = 56
      Width = 3
      Height = 13
      Alignment = taRightJustify
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object btAltRep: TSpeedButton
      Left = 211
      Top = 19
      Width = 66
      Height = 25
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
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
      OnClick = btAltRepClick
    end
    object btAltSup: TSpeedButton
      Left = 589
      Top = 19
      Width = 66
      Height = 25
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
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
      OnClick = btAltSupClick
    end
    object status: TsLabel
      Left = 1260
      Top = 56
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ExplicitLeft = 1346
    end
    object SpeedButton1: TSpeedButton
      Left = 7
      Top = 60
      Width = 23
      Height = 20
      Caption = 'I'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Prnumdoc: TsEdit
      Left = 6
      Top = 22
      Width = 95
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object Prcod_representante: TsComboEdit
      Left = 279
      Top = 22
      Width = 80
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = ''
      OnExit = Prcod_representanteExit
      OnKeyPress = Prcod_representanteKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
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
    object Probservacoes_pedido: TsRichEdit
      Left = 14
      Top = 175
      Width = 1255
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Zoom = 100
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
    object Prorcamento: TComboBox
      Left = 1139
      Top = 21
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 11
      Text = 'N'#227'o'
      OnKeyPress = PrdtadocKeyPress
      Items.Strings = (
        'N'#227'o'
        'Sim')
    end
    object Prconsignacao: TComboBox
      Left = 1139
      Top = 56
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      ItemIndex = 0
      TabOrder = 12
      Text = 'N'#227'o'
      OnKeyPress = PrdtadocKeyPress
      Items.Strings = (
        'N'#227'o'
        'Sim'
        'Fechamento')
    end
    object Prcod_empresa: TsEdit
      Left = 832
      Top = 13
      Width = 40
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Visible = False
      OnKeyPress = PrdtadocKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object Prcod_usuario: TsEdit
      Left = 387
      Top = 13
      Width = 40
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Visible = False
      OnKeyPress = PrdtadocKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object Prtipo_venda: TsEdit
      Left = 776
      Top = 13
      Width = 40
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      Text = 'O'
      Visible = False
      OnKeyPress = PrdtadocKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object Prvlr_tot_nf: TsCurrencyEdit
      Left = 861
      Top = 117
      Width = 36
      Height = 18
      TabStop = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      Visible = False
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object gbtotal: TsGroupBox
      Left = 376
      Top = 75
      Width = 888
      Height = 100
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 14
      SkinData.SkinSection = 'GROUPBOX'
      DesignSize = (
        888
        100)
      object Label21: TsLabel
        Left = 28
        Top = 13
        Width = 44
        Height = 13
        Caption = 'T.Bruto:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object Label48: TsLabel
        Left = 257
        Top = 13
        Width = 33
        Height = 13
        Caption = 'Desc.:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object Label50: TsLabel
        Left = 712
        Top = 14
        Width = 38
        Height = 16
        Caption = 'T.Liq.:'
        Color = clAqua
        ParentColor = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel2: TsLabel
        Left = 450
        Top = 13
        Width = 63
        Height = 13
        Caption = 'Desc. Adic.:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object Prtot_bruto: TsCurrencyEdit
        Left = 75
        Top = 10
        Width = 120
        Height = 20
        TabStop = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 5
        DisplayFormat = 'R$ #,###,##0.00'
      end
      object Prtot_liquido: TsCurrencyEdit
        Left = 756
        Top = 10
        Width = 120
        Height = 25
        TabStop = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnExit = Prtot_liquidoExit
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 4
        DisplayFormat = 'R$ #,###,##0.00'
      end
      object Prdesconto: TsCurrencyEdit
        Left = 294
        Top = 10
        Width = 120
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DisplayFormat = '% ,0.00;-% ,0.00'
      end
      object gbImpostos: TsGroupBox
        Left = 3
        Top = 33
        Width = 877
        Height = 61
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Impostos e Comiss'#245'es'
        Enabled = False
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object Label60: TsLabel
          Left = 10
          Top = 19
          Width = 59
          Height = 13
          Caption = 'T.BC.ICMS:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label61: TsLabel
          Left = 27
          Top = 40
          Width = 42
          Height = 13
          Caption = 'T.ICMS:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label62: TsLabel
          Left = 243
          Top = 19
          Width = 44
          Height = 13
          Caption = 'T.BC.ST:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label63: TsLabel
          Left = 260
          Top = 40
          Width = 27
          Height = 13
          Caption = 'T.ST:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label64: TsLabel
          Left = 480
          Top = 19
          Width = 30
          Height = 13
          Caption = 'T.IPI:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object lbLucro: TsLabel
          Left = 457
          Top = 40
          Width = 53
          Height = 13
          Caption = '%  Lucro:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label71: TsLabel
          Left = 674
          Top = 19
          Width = 73
          Height = 13
          Caption = '% Comiss'#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label72: TsLabel
          Left = 677
          Top = 40
          Width = 70
          Height = 13
          Caption = 'T. Comiss'#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Prvlr_bc_icms: TsCurrencyEdit
          Left = 72
          Top = 16
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 5
          DisplayFormat = 'R$ #,###,##0.00'
        end
        object Prvlr_icms: TsCurrencyEdit
          Left = 72
          Top = 37
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 5
          DisplayFormat = 'R$ #,###,##0.00'
        end
        object Prvlr_ipi: TsCurrencyEdit
          Left = 512
          Top = 16
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 5
          DisplayFormat = 'R$ #,###,##0.00'
        end
        object PrVLR_BC_ICMS_ST: TsCurrencyEdit
          Left = 291
          Top = 16
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 5
          DisplayFormat = 'R$ #,###,##0.00'
        end
        object Prvlr_st: TsCurrencyEdit
          Left = 291
          Top = 37
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 5
          DisplayFormat = 'R$ #,###,##0.00'
        end
        object edMargemLucro: TsCurrencyEdit
          Left = 512
          Top = 37
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '% ,0.00;-% ,0.00'
        end
        object edPercComissao: TsCurrencyEdit
          Left = 753
          Top = 16
          Width = 120
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '%0.00;0'
        end
        object edTotComissao: TsCurrencyEdit
          Left = 753
          Top = 37
          Width = 120
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = 'R$ #,###,##0.00'
        end
      end
      object PrValorDescontoAdic: TsCurrencyEdit
        Left = 515
        Top = 10
        Width = 120
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnExit = PrValorDescontoAdicExit
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      end
    end
    object Prcod_supervisor: TsComboEdit
      Left = 657
      Top = 22
      Width = 80
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = ''
      OnExit = Prcod_supervisorExit
      OnKeyPress = Prcod_supervisorKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_supervisorButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_fornecedor: TsComboEdit
      Left = 8
      Top = 216
      Width = 66
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Text = ''
      OnExit = Prcod_fornecedorExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_fornecedorButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prdtadoc: TsDateEdit
      Left = 104
      Top = 22
      Width = 91
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = PrdtadocKeyPress
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object gbPedidoAssociar: TsGroupBox
      Left = 913
      Top = 41
      Width = 105
      Height = 38
      Caption = 'Pedido '#224' Associar'
      TabOrder = 19
      Visible = False
      SkinData.SkinSection = 'GROUPBOX'
      object PrNUMDOC_DESTINO: TComboBox
        Left = 8
        Top = 13
        Width = 91
        Height = 19
        Style = csDropDownList
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = PrNUMDOC_DESTINOChange
      end
    end
    object gbDesconto: TsGroupBox
      Left = 174
      Top = 118
      Width = 196
      Height = 44
      Caption = 'Desconto Geral'
      TabOrder = 8
      TabStop = True
      SkinData.SkinSection = 'GROUPBOX'
      object PrDESCONTO_GERAL: TsCurrencyEdit
        Left = 6
        Top = 16
        Width = 74
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = PrDESCONTO_GERALExit
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DisplayFormat = '% ,0.0000;-% ,0.0000'
      end
      object PrVLR_DESCONTO_GERAL: TsCurrencyEdit
        Left = 83
        Top = 16
        Width = 107
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = PrVLR_DESCONTO_GERALExit
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      end
    end
    object sGroupBox10: TsGroupBox
      Left = 1010
      Top = 6
      Width = 115
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Processo'
      TabOrder = 18
      SkinData.SkinSection = 'GROUPBOX'
      object btHistorico: TSpeedButton
        Left = 77
        Top = 13
        Width = 34
        Height = 20
        Hint = 'Ver Hist'#243'rico do Processo'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
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
        OnClick = btHistoricoClick
      end
      object PrProcesso_id: TsEdit
        Left = 4
        Top = 11
        Width = 69
        Height = 21
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = PrdtadocKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object Prcod_cliente: TsComboEdit
      Left = 32
      Top = 59
      Width = 80
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = ''
      OnChange = Prcod_clienteChange
      OnExit = Prcod_clienteExit
      OnKeyPress = Prcod_clienteKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_clienteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_fop: TsComboEdit
      Left = 8
      Top = 94
      Width = 80
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = ''
      OnExit = Prcod_fopExit
      OnKeyPress = Prcod_fopKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_fopButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_prazo_pgto: TsComboEdit
      Left = 176
      Top = 94
      Width = 80
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = ''
      OnExit = Prcod_prazo_pgtoExit
      OnKeyPress = Prcod_prazo_pgtoKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_prazo_pgtoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object PrCONTA_BOLETO: TsComboEdit
      Left = 7
      Top = 129
      Width = 66
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = ''
      OnExit = PrCONTA_BOLETOExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = PrCONTA_BOLETOButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object gbNumOC: TsGroupBox
      Left = 1020
      Top = 41
      Width = 105
      Height = 38
      Caption = 'N'#186' Ordem Compra'
      TabOrder = 20
      TabStop = True
      SkinData.SkinSection = 'GROUPBOX'
      object Prnum_oc: TEdit
        Left = 4
        Top = 13
        Width = 97
        Height = 21
        TabOrder = 0
      end
    end
  end
  object sbvendas: TStatusBar
    Left = 0
    Top = 655
    Width = 1272
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Text = 'VENDA FATURADA DIA 02/03/2009'
        Width = 300
      end
      item
        Text = 'CLIENTE COM PENDENDIA'
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Pc_vendas: TsPageControl
    Left = 0
    Top = 241
    Width = 1272
    Height = 378
    HelpType = htKeyword
    HelpKeyword = 's'
    ActivePage = tab_mercadorias
    Align = alClient
    TabOrder = 2
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_mercadorias: TsTabSheet
      Caption = '&1) Mercadorias'
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object pnWait: TPanel
        Left = 0
        Top = 0
        Width = 1264
        Height = 180
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 2
        Visible = False
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1264
        Height = 180
        Align = alClient
        Color = clWhite
        DataSource = dsVendas2
        DefaultDrawing = False
        DrawingStyle = gdsGradient
        FixedColor = clWhite
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnEnter = DBGrid1Enter
        OnKeyDown = DBGrid1KeyDown
        OnKeyUp = DBGrid1KeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_PRODUTO'
            Title.Caption = 'Produto'
            Width = 333
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEST'
            Title.Alignment = taCenter
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_FISCAL_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Cod. Fiscal'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRIB_ICMS'
            Title.Alignment = taCenter
            Title.Caption = 'CST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CESTA_BASICA'
            Title.Alignment = taCenter
            Title.Caption = 'C.B.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtd.'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_VENDA'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_LIQUIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Liq.'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUB_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Sub-Total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Alignment = taCenter
            Title.Caption = 'Desc.%'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO_VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Desc. R$'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO_MAXIMO'
            Title.Caption = 'Desc. M'#225'x.%'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'IPI_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'IPI %'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_IPI_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Valor IPI'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ICMS_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'ICMS %'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_BC'
            Title.Alignment = taCenter
            Title.Caption = 'BC ICMS'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Valor ICMS'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_AGR_ITEM'
            Title.Alignment = taCenter
            Title.Caption = '% Agreg.'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_BC_ST'
            Title.Alignment = taCenter
            Title.Caption = 'BC ST'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ST'
            Title.Alignment = taCenter
            Title.Caption = 'Valor ST'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO'
            Title.Alignment = taCenter
            Title.Caption = 'Peso'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Peso Total'
            Width = 75
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 180
        Width = 1264
        Height = 170
        Align = alBottom
        Color = clWhite
        TabOrder = 1
        DesignSize = (
          1264
          170)
        object Label9: TsLabel
          Left = 2
          Top = 20
          Width = 42
          Height = 13
          Caption = 'Produto:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label18: TsLabel
          Left = 1072
          Top = 3
          Width = 25
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Unid:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ExplicitLeft = 1142
        end
        object Label19: TsLabel
          Left = 1107
          Top = 3
          Width = 24
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Emb.'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ExplicitLeft = 1177
        end
        object Label20: TsLabel
          Left = 197
          Top = 54
          Width = 22
          Height = 13
          Caption = 'Qtd.'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbDesc: TsLabel
          Left = 334
          Top = 54
          Width = 45
          Height = 13
          Caption = '% Desc.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbPrecoLiq: TsLabel
          Left = 393
          Top = 54
          Width = 51
          Height = 13
          Caption = 'Pre'#231'o Liq.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbTotalLiq: TsLabel
          Left = 470
          Top = 54
          Width = 48
          Height = 13
          Caption = 'Total Liq.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label37: TsLabel
          Left = 104
          Top = 54
          Width = 38
          Height = 13
          Caption = 'Volume:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label6: TsLabel
          Left = 145
          Top = 54
          Width = 34
          Height = 13
          Caption = 'Pre'#231'o :'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbCST: TsLabel
          Left = 6
          Top = 54
          Width = 27
          Height = 13
          Caption = 'CST.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbIPIitem: TsLabel
          Left = 1039
          Top = 52
          Width = 28
          Height = 13
          Caption = '% IPI'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbTotalIPI: TsLabel
          Left = 1106
          Top = 52
          Width = 45
          Height = 13
          Caption = 'Total IPI:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label67: TsLabel
          Left = 36
          Top = 54
          Width = 56
          Height = 13
          Caption = 'C'#243'd. Fiscal:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbICMSItem: TsLabel
          Left = 754
          Top = 52
          Width = 39
          Height = 13
          Caption = '% ICMS'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbTotalICMS: TsLabel
          Left = 813
          Top = 52
          Width = 56
          Height = 13
          Caption = 'Total ICMS:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Lbnom_produto_db: TsDBText
          Left = 73
          Top = 39
          Width = 93
          Height = 13
          AutoSize = True
          Caption = 'Lbnom_produto_db'
          ParentFont = False
          ShowAccelChar = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          DataField = 'NOM_PRODUTO'
          DataSource = dsVendas2
        end
        object Shape2: TShape
          Left = 1834
          Top = 133
          Width = 14
          Height = 15
          Anchors = [akTop, akRight]
          Brush.Color = clPurple
          Visible = False
          ExplicitLeft = -251
        end
        object sLabel3: TsLabel
          Left = 1853
          Top = 133
          Width = 150
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Produtos em Promo'#231#227'o'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ExplicitLeft = 2108
        end
        object lbPrecoBase: TsLabel
          Left = 261
          Top = 54
          Width = 47
          Height = 13
          Caption = 'Pre'#231'o CS:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbDescValor: TsLabel
          Left = 620
          Top = 52
          Width = 40
          Height = 13
          Caption = '$ Desc.:'
          ParentFont = False
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbBC_ST: TsLabel
          Left = 888
          Top = 52
          Width = 33
          Height = 13
          Caption = 'BC-ST:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lb_valor_st: TsLabel
          Left = 960
          Top = 52
          Width = 44
          Height = 13
          Caption = 'Valor-ST:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbBC_ICMS: TsLabel
          Left = 688
          Top = 52
          Width = 46
          Height = 13
          Caption = 'BC-ICMS:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbComis: TsLabel
          Left = 556
          Top = 52
          Width = 50
          Height = 13
          Caption = '% Comis.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object BtnMaisPrecos: TSpeedButton
          Left = 757
          Top = 14
          Width = 87
          Height = 37
          Caption = '+ Pre'#231'os'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
            69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
            00FFFF00FFFF00FFFF00FF93655EFFDCB7FFDAB5FED9B1FED8AFFED7ABFED5A7
            FED4A5FED3A3FED0A0FECF9FFECE9DFECE9AFECC98FECB96FECB96FECB96FECB
            969F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FFEDEBCFEDDB8FFDAB5FE
            D9B2FED8AFFED7ABFED5AAFED4A6FED3A4FED0A0FECF9EFECF9DFECE9CFECE99
            FECC97FECB96FECB969F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FFFE1
            C1FEE0BDFEDDBAFEDCB6FEDAB2FED8B0FED8ADFED5AAFED4A7FED3A4FED1A300
            8100FECF9DFFCE9CFECE99FECC98FECC979F6F60FF00FFFF00FFFF00FFFF00FF
            FF00FF93655FFFE3C5FEE1C1FFE0BDFFDEBBFEDCB7FEDAB4FED9B1FFD8ADFED5
            ABFED4A9008100008100008100FED09EFECF9DFECC99FECC989F6F60FF00FFFF
            00FFFF00FFFF00FFFF00FF936560FFE5CAFEE3C6D58127D58127D58127D58127
            D58127D58127FED8AF008100327725648E43008100548437FECF9EFECE9CFECE
            9A9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660FFE7CEFFE5CBFFE5C7FE
            E2C4FEE0C0FEE0BCFFDDBAFEDCB6FFDAB2008100F6D3A7FFD5AAAFB174008100
            008100F8CE9CFECF9D9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963FFEA
            D3FEE9CFFFE6CCFEE5C9FEE3C4FEE1C1FEE0BDFFDEBBFEDCB6FEDAB4FED9B1FE
            D7ADFED5ABEECE9E008100008100FFD09F9F6F60FF00FFFF00FFFF00FFFF00FF
            FF00FF9E6E64FFEBD8FEEBD4FEE9D0FEE6CEFEE5CAFEE3C6FFE1C2FEE0BFFFDE
            BCFEDCB7FEDAB5FED9B1FED7AFFED7ABFED4A9FFD4A5FED1A39F6F60FF00FFFF
            00FFFF00FFFF00FFFF00FFA37266FEEEDCFFEDD8FEEAD4FEE9D1FFE7CEFEE6CB
            FFE3C6FEE2C4FEE1C0FEDEBCFFDDB8008100FED9B2FED9AFFED7ABFED5A9FED4
            A69F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568FFF0E0FEEEDDFEEDD9FF
            EBD5FFE9D1FFE7CFFEE6CBFFE3C7FEE3C4FEE1C1008100008100008100FFDAB2
            FED8B0FED8ADFED5AA9F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FFF2
            E5FFF2E2D58127D58127D58127D58127D58127D58127FFE5C9008100327A2964
            934C00810054893EFEDAB5FED9B1FED7ADA07063FF00FFFF00FFFF00FFFF00FF
            FF00FFB17E6BFFF4E9FFF2E6FFF0E2FEEFE0FFEEDCFFEBD8FFEAD4FEE9D1FEE7
            CC008100F6E0C0FEE2C2AFBA84008100008100F8D9B1FED9B1A07264FF00FFFF
            00FFFF00FFFF00FFFF00FFB6816CFFF7EDFFF4EAFFF3E7FFF2E2FEEFE0FFEEDC
            FFEDD9FFEBD5FEEAD1FFE7CFFEE6CAFFE3C7FFE2C2EED9B5008100008100FEDC
            B69D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFFF8EFFEF7EEFEF6EBFF
            F3E7FEF2E5FFF0E1FFEEDEFFEDD9FEEBD7FEEAD3FEE9CFFEE6CCFFE5C7FEE3C5
            FEE1C1FEE0BDFEDDBB896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFFFA
            F3FFF8F2FFF7EEFFF6EAFFF4E7FEF3E6FFF2E1FFEFDEFFEDDAFFEDD7FFEAD400
            8100FEE7CCFEE5C9FFE3C6FFE1C2FEE1BF806762FF00FFFF00FFFF00FFFF00FF
            FF00FFC58C70FFFCF7FEFAF4FFF8F2FFF7EFFFF6EDFFF4E9FFF3E6FFF0E3FFF0
            DEFEEEDC008100008100008100FFE7CEFFE6CBFEE3C7FFE2C2846964FF00FFFF
            00FFFF00FFFF00FFFF00FFCB9173FFFCFAFFFBF8D58127D58127D58127D58127
            D58127D58127FEF2E3008100327D2E649956008100548F47FFE7CFFFE6CBFFE5
            C7986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FFFEFCFFFEFBFFFBF8FF
            FAF6FEFAF3FFF8F0FFF6EEFFF4EBFEF3E7008100F7EEDAFFEFDEAFC497008100
            008100F8E6CBFFE7CBA5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFE
            FFFFFEFCFFFEFAFFFBF8FFFBF6FFFAF3FFF8F2FFF8EFFFF6EBFFF4E9FFF3E5FF
            F2E2FFEFE0EFE6CF008100008100FEE9D0846964FF00FFFF00FFFF00FFFF00FF
            FF00FFD49875FFFFFFFFFFFFFFFEFEFFFEFBFFFCFAFFFBF7FFFBF4FFF8F2FFF7
            EFFFF6EBFEF4E9FFF3E6FEF2E3FFF0E0FFEFDDFEEDD9FEEBD5846964FF00FFFF
            00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFFFFFEFFFEFBFEFEFB
            FFFBF8FFFBF4FFF8F3FEF8F0FFF7EEFFF4EAFFF4E7FEF2E5FEF0E1FEEFDDFFED
            DA846964FF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
            8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68
            CF8E68CF8E68CF8E68846964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = BtnMaisPrecosClick
        end
        object BtnEtiqueta: TSpeedButton
          Left = 407
          Top = 11
          Width = 87
          Height = 37
          Caption = 'Etiquetas'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF000000000000000000000000000000000000000000000000
            000000FF00FFFF00FF0000000000000000000000000000000000000000000000
            00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F9346
            0F93460F93460F93460F93460F93460F93460FFF00FFFF00FF93460F93460F93
            460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FFFF00FF
            93460F38EBFF3DE2FF3AE4FF36E5FF35E7FF35E9FF3DE0FF93460FFF00FFFF00
            FF93460F38EBFF3DE2FF3AE4FF36E5FF35E7FF35E9FF3DE0FF93460FFF00FFFF
            00FFFF00FFFF00FF93460F32EAFF33E3FF47DEF759D5E262CDD259D0D84AD5EB
            93460FFF00FFFF00FF93460F32EAFF33E3FF47DEF759D5E262CDD259D0D84AD5
            EB93460FFF00FFFF00FFFF00FFFF00FF93460F9AD9D090CCBFACBC99C5A56BD0
            9145BF8C439C935F93460FFF00FFFF00FF93460F9AD9D090CCBFACBC99C5A56B
            D09145BF8C439C935F93460FFF00FFFF00FFFF00FFFF00FF93460FFFC889FFB1
            6BFFA358EA9643E0882FDC7919D6650093460FFF00FFFF00FF93460FFFC889FF
            B16BFFA358EA9643E0882FDC7919D6650093460FFF00FFFF00FFFF00FFFF00FF
            93460F9DBE6E8AAB53AA9C45E38F3DDD8328D47312CB630093460FFF00FFFF00
            FF93460F9DBE6E8AAB53AA9C45E38F3DDD8328D47312CB630093460FFF00FFFF
            00FFFF00FFFF00FF93460F37CD611CAD3788BC77F8DBC4F4D4B4F1D2AFECC7A2
            93460FFF00FFFF00FF93460F37CD611CAD3788BC77F8DBC4F4D4B4F1D2AFECC7
            A293460FFF00FFFF00FFFF00FFFF00FF93460F40CE6A92D19AEDF4EAFFFFFFFF
            FFFFFFFFFFFDFBFA93460FFF00FFFF00FF93460F40CE6A92D19AEDF4EAFFFFFF
            FFFFFFFFFFFFFDFBFA93460FFF00FFFF00FFFF00FFFF00FF93460F93460F9346
            0F93460F93460F93460F93460F93460F93460FFF00FFFF00FF93460F93460F93
            460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF000000000000000000000000000000000000000000000000
            000000FF00FFFF00FF0000000000000000000000000000000000000000000000
            00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F93460F9346
            0F93460F93460F93460F93460F93460F93460FFF00FFFF00FF93460F93460F93
            460F93460F93460F93460F93460F93460F93460FFF00FFFF00FFFF00FFFF00FF
            93460F38EBFF3DE2FF3AE4FF36E5FF35E7FF35E9FF3DE0FF93460FFF00FFFF00
            FF93460F38EBFF3DE2FF3AE4FF36E5FF35E7FF35E9FF3DE0FF93460FFF00FFFF
            00FFFF00FFFF00FF93460F32EAFF33E3FF47DEF759D5E262CDD259D0D84AD5EB
            93460FFF00FFFF00FF93460F32EAFF33E3FF47DEF759D5E262CDD259D0D84AD5
            EB93460FFF00FFFF00FFFF00FFFF00FF93460F9AD9D090CCBFACBC99C5A56BD0
            9145BF8C439C935F93460FFF00FFFF00FF93460F9AD9D090CCBFACBC99C5A56B
            D09145BF8C439C935F93460FFF00FFFF00FFFF00FFFF00FF93460FFFC889FFB1
            6BFFA358EA9643E0882FDC7919D6650093460FFF00FFFF00FF93460FFFC889FF
            B16BFFA358EA9643E0882FDC7919D6650093460FFF00FFFF00FFFF00FFFF00FF
            93460F9DBE6E8AAB53AA9C45E38F3DDD8328D47312CB630093460FFF00FFFF00
            FF93460F9DBE6E8AAB53AA9C45E38F3DDD8328D47312CB630093460FFF00FFFF
            00FFFF00FFFF00FF93460F37CD611CAD3788BC77F8DBC4F4D4B4F1D2AFECC7A2
            93460FFF00FFFF00FF93460F37CD611CAD3788BC77F8DBC4F4D4B4F1D2AFECC7
            A293460FFF00FFFF00FFFF00FFFF00FF93460F40CE6A92D19AEDF4EAFFFFFFFF
            FFFFFFFFFFFDFBFA93460FFF00FFFF00FF93460F40CE6A92D19AEDF4EAFFFFFF
            FFFFFFFFFFFFFDFBFA93460FFF00FFFF00FFFF00FFFF00FF93460F93460F9346
            0F93460F93460F93460F93460F93460F93460FFF00FFFF00FF93460F93460F93
            460F93460F93460F93460F93460F93460F93460FFF00FFFF00FF}
          OnClick = BtnEtiquetaClick
        end
        object sLabel15: TsLabel
          Left = 721
          Top = 99
          Width = 107
          Height = 13
          Caption = 'Observa'#231#227'o Adicional:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object BtnAltObs: TSpeedButton
          Left = 831
          Top = 92
          Width = 66
          Height = 25
          Caption = 'Alterar Obs.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = BtnAltObsClick
        end
        object Meid: TsDBEdit
          Left = 3
          Top = 8
          Width = 78
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'ID'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Panel1: TPanel
          Left = 1
          Top = 137
          Width = 1262
          Height = 32
          Align = alBottom
          Color = clWhite
          ParentBackground = False
          TabOrder = 30
          object btnov: TSpeedButton
            Left = 4
            Top = 5
            Width = 78
            Height = 25
            Caption = 'I&nserir'
            Enabled = False
            OnClick = btnovClick
          end
          object btalt: TSpeedButton
            Left = 88
            Top = 4
            Width = 78
            Height = 25
            Caption = 'Al&terar'
            Enabled = False
            OnClick = btaltClick
          end
          object btgra: TSpeedButton
            Left = 170
            Top = 4
            Width = 78
            Height = 25
            Caption = 'Gra&var'
            Enabled = False
            OnClick = btgraClick
          end
          object btcan: TSpeedButton
            Left = 253
            Top = 5
            Width = 78
            Height = 25
            Caption = 'Canc&elar'
            Enabled = False
            OnClick = btcanClick
          end
          object btexc: TSpeedButton
            Left = 334
            Top = 4
            Width = 78
            Height = 25
            Caption = 'E&xcluir'
            Enabled = False
            OnClick = btexcClick
          end
        end
        object zzunidade: TsEdit
          Left = 1056
          Top = 16
          Width = 30
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Meqtd: TsDBCalcEdit
          Left = 197
          Top = 67
          Width = 62
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = MeqtdExit
          OnKeyPress = MeqtdKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.0000'
          DataSource = dsVendas2
          DataField = 'QTD'
        end
        object Medesconto: TsDBCalcEdit
          Left = 327
          Top = 67
          Width = 60
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = MedescontoChange
          OnEnter = MedescontoEnter
          OnExit = MedescontoExit
          OnKeyPress = MedescontoKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00%'
          DataSource = dsVendas2
          DataField = 'DESCONTO'
        end
        object Mepreco: TsDBCalcEdit
          Left = 389
          Top = 67
          Width = 78
          Height = 21
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 8
          OnExit = MeprecoExit
          OnKeyPress = MeprecoKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'PRECO_LIQUIDO'
        end
        object Mesub_total: TsDBCalcEdit
          Left = 470
          Top = 67
          Width = 83
          Height = 21
          AutoSize = False
          BiDiMode = bdRightToLeft
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          OnExit = Mesub_totalExit
          OnKeyPress = Mesub_totalKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'SUB_TOTAL'
        end
        object zzqtd_embalagem: TsCurrencyEdit
          Left = 1089
          Top = 16
          Width = 58
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00;'
        end
        object Mevolume: TsDBCalcEdit
          Left = 103
          Top = 67
          Width = 39
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyPress = MevolumeKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          DataSource = dsVendas2
          DataField = 'VOLUME'
        end
        object Gbanalise_custo: TsGroupBox
          Left = 5
          Top = 93
          Width = 366
          Height = 40
          Caption = 'An'#225'lise do Produto'
          TabOrder = 22
          SkinData.SkinSection = 'GROUPBOX'
          object Label3: TsLabel
            Left = 5
            Top = 17
            Width = 41
            Height = 13
            Caption = '$ Custo:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object Label4: TsLabel
            Left = 126
            Top = 17
            Width = 52
            Height = 13
            Caption = 'Tot.Custo:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object Label5: TsLabel
            Left = 257
            Top = 17
            Width = 41
            Height = 13
            Caption = '% lucro:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object zz_lucro_produto: TsCurrencyEdit
            Left = 297
            Top = 14
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = '0.000'
          end
          object Zztot_custo: TsCurrencyEdit
            Left = 178
            Top = 14
            Width = 74
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = 'R$ #,###,##0.00;-R$ #,###,##0.00'
          end
          object Zzcusto: TsCurrencyEdit
            Left = 49
            Top = 14
            Width = 74
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = 'R$ #,###,##0.00;-R$ #,###,##0.00'
          end
        end
        object Menumdoc: TsDBEdit
          Left = 75
          Top = 28
          Width = 32
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'NUMDOC'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Medtadoc: TsDateEdit
          Left = 328
          Top = 8
          Width = 53
          Height = 18
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          Text = '  /  /    '
          Visible = False
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Mecod_cliente: TsDBEdit
          Left = 138
          Top = 27
          Width = 32
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'COD_CLIENTE'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Mevlr_icms_st: TsDBCalcEdit
          Left = 959
          Top = 65
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_ICMS_ST'
        end
        object Mevlr_bc_st: TsDBCalcEdit
          Left = 886
          Top = 65
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_BC_ST'
        end
        object MeNCM: TsDBEdit
          Left = 218
          Top = 7
          Width = 98
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'NCM'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Mevlr_bc: TsDBCalcEdit
          Left = 183
          Top = 7
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          ShowButton = False
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_BC'
        end
        object Meipi_item: TsDBCalcEdit
          Left = 1037
          Top = 65
          Width = 60
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnExit = Meipi_itemExit
          OnKeyPress = Meipi_itemKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = '0.00%'
          DataSource = dsVendas2
          DataField = 'IPI_ITEM'
        end
        object Mevlr_ipi_item: TsDBCalcEdit
          Left = 1103
          Top = 65
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          OnKeyPress = Mevlr_ipi_itemKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_IPI_ITEM'
          NullIfZero = True
        end
        object Mevlr_agr_item: TsDBCalcEdit
          Left = 205
          Top = 29
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          ShowButton = False
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_AGR_ITEM'
        end
        object MeCesta_Basica: TsDBEdit
          Left = 240
          Top = 29
          Width = 20
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object MeTrib_ICMS: TsDBEdit
          Left = 6
          Top = 67
          Width = 30
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          DataField = 'TRIB_ICMS'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = MeTrib_ICMSExit
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Panel4: TPanel
          Left = 633
          Top = 93
          Width = 77
          Height = 75
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 31
          object Shape1: TShape
            Left = 2
            Top = 2
            Width = 73
            Height = 71
            Align = alClient
            Pen.Color = clWhite
            Pen.Style = psClear
            ExplicitWidth = 130
            ExplicitHeight = 125
          end
          object Foto: TImage
            Left = 2
            Top = 2
            Width = 73
            Height = 71
            Align = alClient
            Center = True
            Proportional = True
            ExplicitLeft = 40
            ExplicitTop = 56
            ExplicitHeight = 57
          end
        end
        object MePreco_venda: TsDBEdit
          Left = 142
          Top = 67
          Width = 55
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'PRECO_VENDA'
          DataSource = dsVendas2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnKeyPress = MePreco_vendaKeyPress
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Mecod_fiscal_item: TRxDBComboEdit
          Left = 36
          Top = 67
          Width = 66
          Height = 19
          DataField = 'COD_FISCAL_ITEM'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDD333DDDDDDDDDDDD33603DDDDDDDDDD3B7871D
            33DDDDD3BBB88803333DDD3B888F873887033388FF7883BBB86133FFFF83333B
            B873383888BB333BBB33D3333BBBBB333DDDDDDDD33333DDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 2
          OnButtonClick = Mecod_fiscal_itemButtonClick
        end
        object Meicms_item: TsDBCalcEdit
          Left = 753
          Top = 67
          Width = 60
          Height = 21
          AutoSize = False
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 13
          OnExit = Meicms_itemExit
          OnKeyPress = Meicms_itemKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          HideSelection = False
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00%'
          DataSource = dsVendas2
          DataField = 'ICMS_ITEM'
        end
        object Mevlr_icms_item: TsDBCalcEdit
          Left = 813
          Top = 67
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnKeyPress = Mevlr_icms_itemKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = 'R$ #,##0.00'
          DataSource = dsVendas2
          DataField = 'VLR_ICMS_ITEM'
        end
        object MePRECO_CUSTO: TsDBCalcEdit
          Left = 323
          Top = 0
          Width = 78
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          ShowButton = False
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DataSource = dsVendas2
          DataField = 'PRECO_CUSTO'
        end
        object MePromocao: TsDBEdit
          Left = 170
          Top = 31
          Width = 23
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'PROMOCAO'
          DataSource = dsVendas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object meDESCONTO_MAX: TsDBCalcEdit
          Left = 293
          Top = 29
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DataSource = dsVendas2
          DataField = 'DESCONTO_MAXIMO'
        end
        object gbTotalFaturado: TsGroupBox
          Left = 500
          Top = 3
          Width = 757
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Total Faturado Por Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 35
          SkinData.SkinSection = 'GROUPBOX'
          object sLabel6: TsLabel
            Left = 6
            Top = 13
            Width = 43
            Height = 11
            Caption = 'Empresa'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sLabel7: TsLabel
            Left = 316
            Top = 10
            Width = 20
            Height = 11
            Caption = 'M'#234's'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sLabel8: TsLabel
            Left = 813
            Top = 14
            Width = 27
            Height = 11
            Caption = 'Valor'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sLabel11: TsLabel
            Left = 483
            Top = 9
            Width = 46
            Height = 11
            Caption = 'Sem Dev.'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object lbTotalFaturado: TsLabel
            Left = 723
            Top = 31
            Width = 117
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'R$ 0,00'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object cbEmpresa: TComboBox
            Left = 4
            Top = 26
            Width = 306
            Height = 19
            Style = csDropDownList
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = cbEmpresaChange
          end
          object cbMes: TComboBox
            Left = 314
            Top = 26
            Width = 112
            Height = 19
            Style = csDropDownList
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = cbMesChange
          end
          object ckSemDev: TsCheckBox
            Left = 482
            Top = 26
            Width = 20
            Height = 20
            TabOrder = 2
            OnClick = ckSemDevClick
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object MePrecoBase: TsDBCalcEdit
          Left = 259
          Top = 67
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnExit = MePrecoBaseExit
          OnKeyPress = MePrecoBaseKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'PRECO_BASE'
        end
        object Medesconto_Valor: TsDBCalcEdit
          Left = 621
          Top = 67
          Width = 59
          Height = 21
          AutoSize = False
          BiDiMode = bdRightToLeft
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          Visible = False
          OnExit = Medesconto_ValorExit
          OnKeyPress = Medesconto_ValorKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'DESCONTO_VALOR'
        end
        object Mevlr_bc_icms: TsDBCalcEdit
          Left = 687
          Top = 67
          Width = 65
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Visible = False
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DecimalPlaces = 4
          DisplayFormat = 'R$ #,##0.0000'
          DataSource = dsVendas2
          DataField = 'VLR_BC'
        end
        object MePERC_COMISSAO: TsDBCalcEdit
          Left = 555
          Top = 67
          Width = 60
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnExit = MePERC_COMISSAOExit
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00%'
          DataSource = dsVendas2
          DataField = 'PERC_COMISSAO'
        end
        object Mecod_produto: TRxDBComboEdit
          Left = 3
          Top = 35
          Width = 66
          Height = 21
          DataField = 'COD_PRODUTO'
          DataSource = dsVendas2
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDD333DDDDDDDDDDDD33603DDDDDDDDDD3B7871D
            33DDDDD3BBB88803333DDD3B888F873887033388FF7883BBB86133FFFF83333B
            B873383888BB333BBB33D3333BBBBB333DDDDDDDD33333DDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = Mecod_produtoButtonClick
          OnChange = Mecod_produtoChange
          OnEnter = Mecod_produtoEnter
          OnExit = Mecod_produtoExit
          OnKeyDown = Mecod_produtoKeyDown
          OnKeyPress = Mecod_produtoKeyPress
        end
        object Probs_adicional: TsRichEdit
          Left = 719
          Top = 118
          Width = 541
          Height = 47
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
          Zoom = 100
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
        end
        object pnEstoque: TPanel
          Left = 375
          Top = 98
          Width = 251
          Height = 35
          Alignment = taLeftJustify
          Color = clWhite
          ParentBackground = False
          TabOrder = 37
          object Label15: TsLabel
            Left = 8
            Top = -1
            Width = 21
            Height = 13
            Caption = 'Real'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object Label12: TsLabel
            Left = 96
            Top = 0
            Width = 52
            Height = 13
            Caption = 'Reservado'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object Label13: TsLabel
            Left = 184
            Top = 0
            Width = 24
            Height = 13
            Caption = 'Total'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
          end
          object zzreal: TsCurrencyEdit
            Left = 5
            Top = 13
            Width = 62
            Height = 18
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = '0.00;'
          end
          object zzreservado: TsCurrencyEdit
            Left = 93
            Top = 13
            Width = 62
            Height = 18
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = '0.00;'
          end
          object zztotal: TsCurrencyEdit
            Left = 181
            Top = 13
            Width = 62
            Height = 18
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'EDIT'
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
            DisplayFormat = '0.00;'
          end
        end
      end
    end
    object tab_finalizar: TsTabSheet
      Caption = '&2) Finalizar Pedido'
      ImageIndex = 1
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object Label36: TsLabel
        Left = 768
        Top = 127
        Width = 49
        Height = 13
        Caption = 'Ultima N.F'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object Label49: TsLabel
        Left = 469
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Observa'#231#227'o N.F:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      object btnExportaFrente: TSpeedButton
        Left = 878
        Top = 210
        Width = 129
        Height = 103
        Caption = 'Exportar Frente de Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFA46769A66A6BA6696BA6696AA6696AA5696AA5696AA5696AA6696AA6696AA4
          6769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFAA7070FFFED7FAE2B7FBE0ADF8D9A0F6D191F4CC86F3CA
          82F8D484FCD484A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA6F70FFF6D8F2D9BB8087CF2C46E6
          0323FB2B44DE7B79AFEEC280F4CB82A5696AFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB7572FFFCE682
          8CDC0222FE001EFF001EFF001EFF0221FC7F7EB0F4CB82A5696AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFAC7F75FFFFF62D4BF2001EFF001EFF001EFF001EFF001EFF2C46DEF6CE89A5
          696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB58374FFFFFF0323FE001EFF001EFF001EFF001EFF001E
          FF0323FBF8D396A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9575FFFFFF2D4EFA001EFF001EFF
          001EFF001EFF001EFF2D48E6FFE0A4A6696AFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD59A77FFFFFF88
          9DFC0222FF001EFF001EFF001EFF0222FE8692D7E0C2A0A5686AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFDCA17DFFFFFFFFFFFF889EFF2E50FC0324FE2D4DF47E84D5CBAF98AF8B7BA3
          676BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFDCA37EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF8F0E7BD90
          82A36B649F6B65AC6959A46769A46769A46769A46769A46769A46769A46769A4
          6769A46769A46769A46769A46769FF00FFE7B082FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4F6FAAF8282D18A4FD4894AFF00FFA46769FEE9C7F4DAB5F6D9ABF4D4
          A0F2CE95F0C788EFC581EEC580F4CC83EFC480A46769FF00FFE9B081FBFAFBFA
          F3EFFAF3EFFAF3EFFCF8F4EEE0D8B07F76B67660FF00FFFF00FFA46769FCEACE
          F3DABCF0D5B4F0D0A9EECB9EEDC693EAC088E9BC7FEFC581EFC480A46769FF00
          FFE6A978CF906CD1926DD1926DD1926DD1926D05620A0A6E12FF00FFFF00FFFF
          00FFA46769E7C6AC973D17963D16963C15963B13963A1395391195380FB4642F
          EFC480A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0052011A922F42E0
          75015503FF00FFFF00FFA7756BFFF4E5A4512C811E00811E00811E00811E0081
          1E00832001E0AB6FEFC583A46769FF00FFFF00FFFF00FFFF00FFFF00FF004F00
          1384233ED96F45E67A2DC24F015503FF00FFA7756BFFFFFCE6C7B2832101811E
          00811E00811E00811E00B06437F0CE93F2C98CA46769FF00FFFF00FFFF00FFFF
          00FF0155030F821C35C6603FDC6F30C65618A92D15A428015503BC8268FFFFFC
          FAF0E6B87555811E00811E00811E008A2B07EBC59CF3D3A0F3CE97A46769FF00
          FFFF00FFFF00FFFF00FF0155030155030155031CA03523BC4101550301550301
          5503D1926DFFFFFCFEF7F2F6E9E18E2F0C811E00811E00C48662F4D7B5FBDCAD
          F6D3A0A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004C000B7B161BB7
          33015503FF00FFFF00FFD1926DFFFFFCFFFFFFFFFEFECF9D84811E00983E19F8
          E5CCF8E3C5EBD9B7C5A48FA46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0154030978110EA51D015503FF00FFFF00FFDA9D75FFFFFCFFFFFFFFFFFFFFFE
          FE9A4420E0BBA5F4E3D1D5B19FB79280A77D70A46769FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF035F06067F0D069810015503FF00FFFF00FFDA9D75FFFFFC
          FFFFFFFFFFFFFFFFFFF3E7E0FFFEF8E6D5CCA56B5FA56B5FA56B5FAF6A56FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF03690706920E05840C015503FF00FFFF
          00FFE7AB79FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9DCA56B5FE1974E
          D38749FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF036E07068F0D05890C0155
          03FF00FFFF00FFFF00FFE7AB79FAF3EFFAF3EFFAF3EFFAF3EFFAF3EFFAF3EFDC
          C2B8A56B5FBF7D60FF00FF015503015503015403025C05056F0C057E0C04800B
          037208015503FF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD192
          6DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FF015503015503025C0402
          5B05025C04025803015403FF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        Visible = False
        OnClick = btnExportaFrenteClick
      end
      object gbFaturamento: TsGroupBox
        Left = 3
        Top = 182
        Width = 457
        Height = 143
        Caption = 'Faturamento'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label35: TsLabel
          Left = 8
          Top = 45
          Width = 125
          Height = 13
          Caption = 'Empresa de Faturamento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Lbempresa_faturamento: TsLabel
          Left = 79
          Top = 61
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label45: TsLabel
          Left = 10
          Top = 13
          Width = 65
          Height = 13
          Caption = 'DataEmiss'#227'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label46: TsLabel
          Left = 110
          Top = 13
          Width = 56
          Height = 13
          Caption = 'Data Saida:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label59: TsLabel
          Left = 10
          Top = 77
          Width = 66
          Height = 13
          Caption = 'C'#243'digo Fiscal:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Lbnom_cod_fiscal: TsLabel
          Left = 79
          Top = 92
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label58: TsLabel
          Left = 211
          Top = 14
          Width = 56
          Height = 13
          Caption = 'Nota Fiscal:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label65: TsLabel
          Left = 317
          Top = 14
          Width = 94
          Height = 13
          Caption = 'N. Fiscal Eletr'#244'nica:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Prempresa_faturar: TsComboEdit
          Left = 7
          Top = 58
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = ''
          OnChange = Prempresa_faturarChange
          OnExit = Prempresa_faturarExit
          OnKeyPress = Prempresa_faturarKeyPress
          CheckOnExit = True
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          OnButtonClick = Prempresa_faturarButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prdta_emissao: TsDateEdit
          Left = 9
          Top = 27
          Width = 91
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prdta_saida: TsDateEdit
          Left = 108
          Top = 26
          Width = 91
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prpedido: TsCheckBox
          Left = 114
          Top = 107
          Width = 58
          Height = 20
          TabStop = False
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prboleto_anexo: TsCheckBox
          Left = 10
          Top = 107
          Width = 84
          Height = 20
          TabStop = False
          Caption = 'Boleto Anexo'
          TabOrder = 5
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prcod_fiscal: TsComboEdit
          Left = 9
          Top = 89
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = ''
          OnExit = Prcod_fiscalExit
          OnKeyPress = Prcod_fiscalKeyPress
          CheckOnExit = True
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          OnButtonClick = Prcod_fiscalButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object PrNF: TsEdit
          Left = 207
          Top = 26
          Width = 97
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object PrNFE: TsEdit
          Left = 313
          Top = 26
          Width = 97
          Height = 21
          TabStop = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Prconsumidor_final: TCheckBox
          Left = 307
          Top = 107
          Width = 148
          Height = 17
          Caption = #201' para Consumidor Final?'
          TabOrder = 4
        end
      end
      object gbTransp: TsGroupBox
        Left = 3
        Top = -4
        Width = 457
        Height = 189
        Caption = 'Transporte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object Label38: TsLabel
          Left = 8
          Top = 46
          Width = 79
          Height = 13
          Caption = 'Transportadora:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object LbNom_transportadora: TsLabel
          Left = 147
          Top = 64
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label39: TsLabel
          Left = 8
          Top = 83
          Width = 81
          Height = 13
          Caption = 'Frete por Conta:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label41: TsLabel
          Left = 8
          Top = 116
          Width = 64
          Height = 13
          Caption = 'Volume Nota:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label42: TsLabel
          Left = 203
          Top = 117
          Width = 53
          Height = 13
          Caption = 'Peso Nota:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label44: TsLabel
          Left = 123
          Top = 150
          Width = 43
          Height = 13
          Caption = 'Contato:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label43: TsLabel
          Left = 12
          Top = 149
          Width = 57
          Height = 13
          Caption = 'Valor Frete:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object sLabel4: TsLabel
          Left = 79
          Top = 117
          Width = 54
          Height = 13
          Caption = 'Peso Total:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object sLabel5: TsLabel
          Left = 149
          Top = 117
          Width = 37
          Height = 13
          Caption = 'Decr'#233's.'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object BtAltTransp: TSpeedButton
          Left = 5
          Top = 60
          Width = 66
          Height = 25
          Caption = 'Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
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
          OnClick = BtAltTranspClick
        end
        object sLabel14: TsLabel
          Left = 9
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Carga:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object lbDescCarga: TsLabel
          Left = 68
          Top = 31
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Prcod_transportadora: TsComboEdit
          Left = 77
          Top = 61
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = ''
          OnExit = Prcod_transportadoraExit
          OnKeyPress = Prcod_transportadoraKeyPress
          CheckOnExit = True
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          OnButtonClick = Prcod_transportadoraButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prpeso_nota: TsCurrencyEdit
          Left = 203
          Top = 130
          Width = 64
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00;'
        end
        object Prcod_carga: TsEdit
          Left = 8
          Top = 27
          Width = 56
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnExit = Prcod_cargaExit
          OnKeyPress = PrdtadocKeyPress
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Prcontato_frete: TsEdit
          Left = 124
          Top = 163
          Width = 245
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 6
          OnKeyPress = Prcontato_freteKeyPress
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Prvl_frete: TsCurrencyEdit
          Left = 8
          Top = 163
          Width = 99
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prvolume_nota: TsCurrencyEdit
          Left = 8
          Top = 130
          Width = 64
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00;'
        end
        object Prtipo_frete: TComboBox
          Left = 8
          Top = 97
          Width = 78
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = '1=CIF'
          Items.Strings = (
            ''
            '1=CIF'
            '2=FOB')
        end
        object edPesoTotal: TsCurrencyEdit
          Left = 79
          Top = 130
          Width = 64
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '0.00;'
        end
        object edDecTransp: TsCurrencyEdit
          Left = 149
          Top = 130
          Width = 48
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnExit = edDecTranspExit
          OnKeyPress = PrdtadocKeyPress
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
          DisplayFormat = '% ,0.00;-% ,0.00'
        end
      end
      object gbAtalhos: TsGroupBox
        Left = 555
        Top = 201
        Width = 257
        Height = 120
        Caption = 'Atalhos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object Label52: TsLabel
          Left = 8
          Top = 24
          Width = 242
          Height = 13
          Caption = 'Ctrl + F1 - Imprimir Etiqueta de Transporte'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label54: TsLabel
          Left = 8
          Top = 43
          Width = 232
          Height = 13
          Caption = 'Ctrl + F2 - Historico de Compra do Cliente'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label55: TsLabel
          Left = 8
          Top = 62
          Width = 150
          Height = 13
          Caption = 'Ctrl + F3 - Imprimir Pedido'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Label56: TsLabel
          Left = 8
          Top = 80
          Width = 201
          Height = 13
          Caption = 'Ctrl + F4 - Imprimir Lote de Pedidos'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
      end
      object edUltimaNf: TsEdit
        Left = 768
        Top = 140
        Width = 97
        Height = 21
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'edUltimaNf'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object Probservacoes_nota: TsRichEdit
        Left = 466
        Top = 13
        Width = 519
        Height = 92
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Zoom = 100
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
    end
    object tab_cr1: TsTabSheet
      Caption = '&3) Contas a Receber'
      ImageIndex = 3
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object Btinsere_cheque: TSpeedButton
        Left = 755
        Top = 200
        Width = 128
        Height = 42
        Caption = 'Inserir Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnAltFormaPrazo: TSpeedButton
        Left = 188
        Top = 199
        Width = 254
        Height = 43
        Caption = 'Alterar Forma e Prazo de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          4A090000424D4A09000000000000420000002800000021000000220000000100
          100003000000080900000000000000000000000000000000000000F80000E007
          00001F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFBEF7FFFFBEF7FFFF
          DFFFDFFFDFFFFFFFFFFFFFFFFFFFDFFFDFFFDFFFDFFFFFFFFFFFDFFFDFFFDFFF
          DFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFE782003184
          9EF7BEF7BEF7FFFFFFFFFFFFFFFFDFFFDFFFDEFFDDFFDDFFBDF7DEFFDFFFBEF7
          BEF7BEFFBEFFDFFFDFFFFFFF0000FFFFFFFFFFFFDFF7FFFFDFFFBFFFFFEFE300
          188642000108631083109EEFFFFFFFF7DEF7FFFFFFFFBBFF6010A0186010DDF7
          BDEF8210411041184118DEFFDFF7FFFF0000DFFFDFFFDFF7FFFFDFFFFFF7FFEF
          A200176EA20011743ACE97B5F07B8310DEF7FFFFFFFF9EEFDDFF8010F3E60FCE
          F5DE40008108D7BDD7C5F7CDF7CD4108FFFFDFFF00009FFFDFFFDFFFDFF7BFFF
          FFEF0401985E0D1C220138AE9EF739CED6BD61107CEFBEF7BEF7FFFF601031EF
          F2FF2EEF4ECE600817BE38C6BEFFF7C538C6D7B56208DFF70000DFFFDFFFDFFF
          FFF7DFE7C300995E6F0CAB13E00017A67ACEDFFFF7BD20002F84DFFFDFFF7CEF
          80108DD64BEFAAD630DF801095B5DFFF18C638C659C6F7B58208DFF70000DFFF
          FFFFFEF7FFDF05015966101CCD1BF696C0006F6CF7B5F9BD117C60004F74F083
          BFFFDEFF801010E7F1FFAFEFF4FF801839CEBFF719C638C6DEF739BE6200DFF7
          0000FEFFFEEFFEDF2301595E10040D1C378F8E65D3960001C0008100A2006B33
          E1007174317CDEFFDBFFA01811E76FCED3DE4010B7BD1ACEDFFFBEF7F7BD39BE
          8308DFF70000DEF7FFE72301B95E2F0C4E14346F0C5630870C5E460CCF45CA1B
          CB1B4B0C7456C200716470849CF7FCFF401040108010DDF78210B7BDF9C5F8C5
          38C641089EEFDFFF0000DFF7A300786E0E044E0457676D46AF774A568F778C46
          86042F46756F502ECB04965E230150643084BFF7BFFFBFFFBEF7DEEFDEEF4108
          621042104108BEFFDFFFDFFF0000DFFFFFEF030176661336AB04F25F8B3ECF77
          4946CF6F8B4EA50C4C3EF2676E36AB04B656C2005274F17BDFFFDFF7FFF7FFFF
          FEFFBDEFDEFFBEFF9EFFDEFFDEFFDFFF0000BFFFBFE7FFD7620196568B04AF2E
          E5048B36F06F694E2D678B46D1676B36F25F7026AC047766E400316C5284FFF7
          FFF7FFFFBEF7FEFFBDF79DF7DEFFDFFFDFFFDFFF0000DFFFFFF7FFD702014401
          D8568A04CF2606054A2EAF77AB5EB26FC6040505E504E9043126AC04B656E200
          51740F74FFFFBEF7FFFFBEF78218200881189EF7BFFFFFFF0000DFFFBEE7C200
          376ECE138401F64EEB04AF260605AB466F6787046F366E2E6E26A904A904B126
          AA0475664301306C5184DFF79EF76210F7BDF6C5D6BD6210BFF7FFFF0000FFFF
          A300596E300C4D0C386F6201955ECC046F16E5048B2EE904312EAD046D04AB04
          A904B25F6D36CA049556C2007274317C9EF74210D7BDDEFF18BE4308BFF7FFFF
          0000FFFFDEDF25015856F4354C0C177F8101D646EC04CF260705A9044A044E04
          6E04112E68046C4EF1778E2E8A04D76EA200516C317C6210D7BDF7BD18BE4208
          DFF7FFFF0000BEF7FFF7FFE7E3009956AE04303648048101F74ECC04711E8A04
          AB046B043236323EA9149077294EB06F4E3E8B04B65623015164AF7341106110
          82109EF7DFF7FFFF0000FFFFDFF7DEF7FFE745019756AA046F2E6B048101D74E
          AD04322E8A04A904C904890494770B56B0872B56B2776F2ECA04B6562301716C
          30847DEF9DF7FFFFDFFFFFFF0000FFFFDFF7FFF7FFF7DFE70301D656CB046F26
          AA042101B75E8B04701E09058D2EB2672C4E3287072C548F0E5691672805311E
          1757030131647184BEFFFFFFDFFFFFFF0000DFFFFFFFFFFFBFFF9FFFDFEF4301
          1657AA04302E3777C301D44ECA046E1EE604AC3ED16FEC55338F0724737F4D46
          2E2EED044D04F66DC300317CFFFFBFF7FFFFFFFF0000DDFFFEFFDFFFDFFFDFFF
          FFF7FFE7E200D85E4C04113E346F60011567EB04AF1EE504AB36B0770A4EB187
          2D4E56774E144F04585EC2000F7CBEF7DFFFFFFFFFF7FFFF0000FEFFBEFF9EF7
          FFFF9EF79DF7DDFFDDE7E400F9668B040F3E357F6001154FCB04CF26E5046A3E
          F1770B467477ED0BF00B5A5604017174BDFFDFFFBFFFBEEFFFF7FFFF0000BEFF
          DFFFDFFFFDFF801080108018DBF7FFE7240156568D042F4674772101D766AA04
          AF2EF1672C3E366F0D1471149A56460104011074EF8BDFFFDFFFFFFFFFFFFFFF
          0000DFFFFFFFBDF7800833E74ECE53EF6010BCF7DEDF4501B85E69040F3E587F
          4101D54EEB04A6046F36AE14CF037A4E67011104F765A20010841084BFFFDFFF
          DFFFFFFF0000DFFF9DF7A01034DFF3FF90F7B1FF52EF6010FFF7BFDFE400B85E
          6C042F2EA904C201B54E7226CB046E04DA562501110411047114B67D82009184
          FEF7FFFFDFFFFFFF0000DFFFDCFF80104FCE90EF8ACEAEF72CCE80189EF7DFFF
          FFE70501B756A9048F266B0482011647AE04B746A501F003110451045956E300
          9174DDE7FEF7DFF7DFFFFFFF0000BEF7FDFFA018F1DEF3FF6DE7F0FF30EF8018
          9EF7FFFFFFF7DFDF2301D74EED04712E4A04620198662401EF0B510430045966
          C3007174DDF7FFFFFFFFBFF7DFFFFFFF0000FFFFBDF7DAFF8018F1DE6DC671E7
          A0109BF7FFFF9DEFDEF7FEFFFFDF4401D74EAB043136F7762301CE13EF0B3004
          595EE400726CFEF7FEFFDFFFFFFFDFFFDFFFFFFF0000DFFFFFFFDDF7FDFFA018
          40104008DBFF9CEF611061086008BCEFFDEFFFE70301B7566D042B1458772D04
          700C386604015264DFEFFEFFBDF7DFFFDFFFFFFFFFFFFFFF0000DFFFDFFFFFFF
          DFF79EF7BEFFDFFF9EFFA318B6B517C6F6BDA110BDF79EFFFFE74401975ED33D
          4C042E04575EE300716CFFEFFFFF9DF7FEFFDFFFDFFFDFFFFFFFFFFF0000DFFF
          DFFFBFF7FFFFFFFFDFFFBFFF7FFF2210F8BDBEF7F8BD2108DFFFBFFFDFF7FFDF
          040199565004596EA300716CFEF7DEF7DEF7DFFFFFFFDEF7FFFFBFFFBFFFDFFF
          0000DEFFDEFFDFFFDFF7DFF7DFFF7FFFBFFF4210F8BD39C6B7B522107FFFDFFF
          DFFFFFF7FFD765017A66C400B37CBDEFDDF7FFFFFFFFBEFFBEFFFFFFFFFFDFFF
          DFFFDFFF0000FDFFDEFFDFFFBFF7FFFFFFFFDFFFDEFFDEF7610862086208BFFF
          DFFFFEFFFEFFFEFFFFF7FFDFC2001174BFF7FEFFFEFFBEF7FFFFDFFFDFFFDFFF
          BFFFFFFFDEF7FFFF0000FDF7FEFFDFFFDFFFDFFFBFF7FFFFFEFFFDF7FEF79EEF
          DFFFBEFFDEFFFDFFFEFFFEFFFEFFFEFFBDF7DFFFDFFFBEFFFFFFFFF7FFF7DEFF
          DFFF9FFFDFFFFEFFFEF7FFFF0000}
        ParentFont = False
        OnClick = BtnAltFormaPrazoClick
      end
      object BtnBoleto: TSpeedButton
        Left = 466
        Top = 200
        Width = 129
        Height = 42
        Caption = 'Emitir Boletos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          26100000424D2610000000000000360000002800000028000000220000000100
          180000000000F00F0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F5B5B5B404040
          404040C8C8C8F1F1F17676763232324D4D4DBBBBBBFFFFFF323232C8C8C8F1F1
          F16969693232324D4D4DD6D6D6E5E4E5404040404040F1F1F17676763232324D
          4D4DBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F404040F1F1F19F9F9F4D4D4D9292
          92696969F1F1F1BBBBBB404040F1F1F1323232C8C8C8848484696969FFFFFFBB
          BBBBC8C8C8C8C8C8323232FFFFFF929292696969F1F1F1BBBBBB404040F1F1F1
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF9F9F9F696969FFFFFFC8C8C83232326969699F9F9FFFFFFFFF
          FFFF323232C8C8C8323232C8C8C86969694D4D4D696969696969929292C8C8C8
          323232FFFFFF6969699F9F9FFFFFFFFFFFFF323232C8C8C8FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F
          9F9F404040F1F1F19F9F9F4D4D4D929292696969F1F1F1BBBBBB323232F1F1F1
          323232C8C8C8848484767676FFFFFF767676848484C8C8C8323232FFFFFF9292
          92696969F1F1F1BBBBBB323232F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F4D4D4D4D4D4D
          404040AEADAEF1F1F17676763232324D4D4DAEADAEFFFFFF323232C8C8C8F1F1
          F1696969323232696969F1F1F1696969323232323232F1F1F17676763232324D
          4D4DAEADAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F696969FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF323232C8C8C8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD6D6D6323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8F9FCFBFDFFFEFFFDFCFDFAFA
          F9FDFCFDFDFCFDC5C5C6ACACADFAFAF9F7F6F7FEFDFFFDFCFEF9F8FAFDFCFEFD
          FCFDFAF9FBFDFCFE9F9F9FE3E3E4FFFEFFFCFAFCFAF9FBFDFCFDFDFCFDFDFCFD
          C8C8C8FDFCFDFCFBFDFEFDFFF9F8F8FBFCFBFDFCFDF9F8F8FDFCFDFFFEFFFCFB
          FDF8F7F9FEFDFFF9F8FAF7F8F9FDFCFDF8FAFBFBFAFBF7F6F8F9FBFCFEFDFFF8
          FAFBF7F8F9FCFBFDF8FAFBF9FBFCF9FBFCF9FBFCFBFDFFFDFEFFFBFBFCFDFCFE
          F4F3F5FDFCFEFEFDFFFCFAFCFCFBFDFDFCFDFBFAFBF8F7F9FCFBFDFBFBFCFBFB
          FCFDFCFDF9F8FAFDFCFDFAF9FBFBFAFBFBFCFDFDFEFFFBFBFCF7F8F9F8F7FAF7
          F6F8FBFCFDF9FBFCFFFFFFFFFFFFFDFEFFFFFFFFF7F9FAFFFFFFF7FAFBFFFFFF
          FFFFFFFDFEFFFAFEFFFFFFFFF2F7F7F5F8F8FFFFFFF9FDFEF4F3F5FDFCFEFFFF
          FFFFFFFFFFFFFFFDFCFEFEFDFFFFFFFFFCFBFDFFFFFFF3F3F4EFEDEFFFFFFFFA
          F9FBFFFFFFFFFFFFF7FBFCF7FBFCF7F9FAF8FAFBF7F9FAFAF9FBF8FAFBFFFFFF
          DCDEDFA6A8A9DADDDEDADBDCE8EAEBE4E6E6E2E1E3C5C5C6A8AAABDADDDECED3
          D4C5C9CAFDFEFFEEF0F1DADBDCE8EAEBF1EFF1D6D5D7E5E4E6B6B5B6DADBDCFA
          F9FBF1EFF1DCDBDDD9D7D9BABABCF9F8FAEBEBECBFBEC1EFEDEFBCBBBDC1C0C2
          D7D9DAE4E6E6DCDEDFFDFEFFF3F4F5F3F1F3F8FAFBFFFFFFAAADAE040506A1A4
          A4919394D5D7D8A7AAABADAFB057595A0000009BA1A2898E8F595D5EFDFEFFE8
          EAEB878A8BD6D8D9E2E1E3949395B6B5B60D0C0E9F9F9FFFFFFFD5D2D48E8D8F
          919293403F41F9F8FAD6D5D7313032D6D5D7393A3B4342448E9192B1B4B5A0A3
          A3FBFDFFF3F4F5FCFBFDF8FAFBFFFFFFB3B5B6000000A6A8A9959798D5D7D8AA
          ADAEAFB2B35C5E5F000000999FA08F9394646869FBFCFDF5F8F87E8081D3D6D7
          E3E3E4949395BFBEC1131314A6A5A7FFFFFFD4D5D69795978A8A8B494A4BFAF9
          FBCCCBCD434244CFCED03E3F40444345919596B1B5B6A7A9AAFFFFFFFDFEFFFC
          FBFDFBFCFDFFFFFFB4B7B8010304A4A6A79A9C9DD4D6D7A7A9AAAFB2B3606062
          010304979D9E8B8F90666A6BF7F8F9F0F3F3878A8BD4D8D9E2E1E3999799B8B7
          B91D1A1DA2A2A4FFFFFFD7D9DA949697959798464849F7F8F9D4D6D7424546C8
          CACB40424347494A919596B1B5B6A7A9AAFFFFFFF7F8F9FBFAFBFDFEFFFFFFFF
          B2B4B5010203A4A6A7929495D5D7D8A6A8A9B2B4B55C5E5F000000A1A5A68D92
          92616566FFFFFFF1F4F5898B8CD7D9DAE2E1E3979597BCBBBD181618A3A5A6FF
          FFFFD4D6D791929397999A424546FFFFFFD2D4D5363839D2D4D5393A3B464849
          929697B4B7B8A3A5A6FFFFFFF9FBFCFFFEFFFBFDFFFFFFFFB2B4B5020405A4A6
          A7939597D6D8D9A9ABACB1B3B45C5E5F0000009EA3A38C9191646869FDFEFFF3
          F5F6888A8BD7D9DAE5E4E6979597BCBBBD1B181AA6A5A7FFFFFFD5D7D8939597
          929495474A4BFAFEFFD1D3D43C4041D0D2D33F4142464849929697B4B7B8A8AA
          ABFFFFFFFDFEFFFEFDFFFBFDFFFFFFFFB2B4B5020405A4A6A7939597D6D8D9A9
          ABACB1B3B45C5E5F0000009EA3A38C9191646869FDFEFFF3F5F6888A8BD7D9DA
          E5E4E6979597BCBBBD1B181AA4A5A7FFFFFFD3D7D891959691959645494AFAFE
          FFCED3D43B4041CED3D43C4041434748929697B4B7B8A7A9AAFFFFFFFDFEFFFE
          FDFFFBFDFFFFFFFFB2B4B5020405A4A6A7939597D6D8D9A9ABACB1B3B45C5E5F
          0000009EA3A38C9191646869FDFEFFF3F5F6888A8BD7D9DAE5E4E6979597BCBB
          BD1B181AA4A5A7FFFFFFD3D7D891959691959645494AFAFEFFCED3D43C4041D0
          D4D53C4041424546919596B4B7B8A6A8A9FFFFFFFDFCFEFFFEFFFBFDFFFFFFFF
          B2B4B5020405A4A6A7939597D6D8D9A9ABACB1B3B45C5E5F0000009EA3A38C91
          91646869FDFEFFF3F5F6888A8BD7D9DAE5E4E6979597BCBBBD1B181AA4A5A7FF
          FFFFD3D7D891959691959645494AF9FDFECED3D43D4142D1D5D63C4041404445
          929697B4B7B8A5A7A8FFFFFFFDFCFEFFFEFFFBFDFFFFFFFFB2B4B5020405A4A6
          A7939597D6D8D9A9ABACB1B3B45C5E5F0000009EA3A38C9191646869FDFEFFF3
          F5F6888A8BD7D9DAE5E4E6979597BCBBBD1B181AA4A5A7FFFFFFD3D7D8919596
          91959645494AF9FDFECFD4D53C4243D1D5D63B40413E4344929697B5B9BAA5A7
          A8FFFFFFFBFDFFFFFEFFFAFEFFFFFFFFB1B6B7000506A2A6A7919697D4D8D9A5
          AAABAFB2B35B5F600000009EA3A38C919164696AFFFFFFF2F7F7878A8BD5D7D8
          E3E5E6959798BABABC181618A3A5A6FFFFFFD1D6D79195968F949545494AF9FD
          FECED3D43C4243D3D7D83C4243404445939798B4B7B8A4A6A7FFFFFFFDFEFFFE
          FDFFFAFEFFFFFFFFB1B6B7000506A1A6A7919697D3D8D9A5AAABAFB2B35B5F60
          0000009EA3A38C919164696AFFFFFFF2F7F7878A8BD5D7D8E3E5E6959798BABA
          BC181618A3A5A6FFFFFFD1D6D79195968F949545494AF9FDFECED3D43D4142D1
          D6D73D41423E4344929697B4B7B8A4A6A7FFFFFFFDFEFFFEFDFFFAFEFFFFFFFF
          B1B5B6000506A2A6A7929697D4D8D9A5AAABAFB2B35B5F600000009EA3A38B90
          91636869FFFFFFF2F7F7878A8BD6D8D9E5E4E6979698BCBBBD181618A3A5A6FF
          FFFFD1D6D791959690949545494AF9FDFECED3D43C4041D0D4D53C4041404445
          939798B4B7B8A4A6A7FFFFFFFDFEFFFEFDFFFAFEFFFFFFFFB1B5B6000405A1A5
          A6929697D4D8D9A5AAABAFB2B35B5F600000009EA3A38C9191646869FDFEFFF3
          F5F6888A8BD7D9DAE7E5E6999799BCBBBD1B181AA6A5A7FFFFFFD1D6D7919596
          90949545494AFAFEFFD0D4D53D4142D1D5D63D4142424546939798B4B7B8A4A6
          A7FFFFFFFDFEFFFEFDFFF9FDFEFFFFFFB1B4B5000405A1A5A6929697D4D8D9A7
          AAABB1B3B45B5F600000009EA3A38C9191646768FFFFFFF4F6F7888A8BD7D9DA
          E6E6E6999799BCBBBD1B181AA6A5A7FFFFFFD3D6D791959690949545494AFAFE
          FFD0D4D53D4142D1D5D63D4142434748939798B3B7B8A4A6A7FFFFFFFDFEFFFE
          FDFFF9FDFEFFFFFFB2B4B5010304A3A5A6949697D6D8D9A8AAABB1B3B45C5E5F
          0000009EA3A38B8F90646768FFFFFFF3F5F688898BD9D9DAE7E5E69A989ABEBC
          BE1B181AA6A5A7FFFFFFD4D6D793959792949547494AFDFEFFD1D3D43E3F40D0
          D2D33E3F40434748939798B3B7B8A4A6A7FFFFFFFDFEFFFEFDFFF7F9FAFFFFFF
          B1B3B4020405A5A7A8959798D6D8D9AAADAEAFB2B3595B5C000000A1A4A4898B
          8C646768FCFBFDF3F3F4888789D9D7D9E5E4E59A989ABEB9BB1B181AA9A7A9FF
          FFFFD2D4D5919394919293474A4BFDFEFFD2D4D5404243D3D5D6424546404445
          939798B1B5B6A5A7A8FFFFFFF9FBFCFCFBFDFDFEFFFFFFFFB8B8B9040506A2A2
          A49A9B9CD7D9DAA9ABACB1B1B35C5E5F000000A0A3A3888A8B69696BF7F6F8F5
          F4F68C8A8CD5D2D4E2E1E3999799BEB9BB201A1DA9A7A9FFFFFFDADDDE919293
          919394494A4BFBFCFDD4D5D63E3F40CFCED04042434C4D4E919596BABABC9FA1
          A2FFFFFFFBFCFDFAF9FBFDFCFEFEFDFFB1B1B30D0C0EACACAD9F9F9FD6D5D7AE
          ADAEB7B6B8606062131314A7AAAB9796986D6C6EFFFFFFF4F2F3989497D5D2D4
          E1DFE1A49FA1C2BDBF241E20ACA9ABFEFDFFD6D5D79A989A9D9C9E535254FCFA
          FCD9D9DA464447D6D5D75352544C4B4D919394BABEBFA7A9AAFFFFFFF3F3F4F7
          F6F7FEFDFFF5F4F5F4F3F5E7E6E9F1EFF1EFEDEFF7F6F8F6F5F7F7F6F7F1F0F2
          E1DFE1F1F0F2F3F1F3F1F0F2FAF9FBF9F8FAEFEDEFFBF7F9F9F8F8F1EFF1F9F3
          F6EDEBEDF8F7F9F1F0F2FAF9FBF6F5F7F5F4F6EBEBECFBFAFBF7F6F8EDEBEDF6
          F5F7E8E6E8EBEBECF4F6F7E8EAEBF7F6F8F1F4F5F1F4F5F5F4F6FCFAFCFDFCFE
          FBFAFBFEFDFFFDFCFEFDFCFDFDFCFDFFFFFFFAF9FBFCFAFCFFFEFFFAF9FBFAF9
          FBF8F7FAFBFAFBFBF7F9FFFBFDFEFCFDFBF7F9FFFBFDFFF9FCFFFFFFFFFBFDFD
          FCFDF8F7F9FDFCFEFEFDFFFCFBFDF8F7F9FAF9FBFEFDFFFDFCFEFDFCFDFAF9FB
          FBFCFDF0F3F3FFFFFFF4F6F7F5F8F8FAF9FBFCFBFDFAF9FBFFFEFFFFFEFFFCFA
          FCFDFCFDFCFAFCFEFDFFFCFBFDFCFBFDFAF9FBFAF9FBF7F6F8FAF8F9FCFAFCFE
          FCFDFEFDFFFBF7F9FEFCFDFEFCFDFFF9FCFFFBFDFCFAFCFDFCFEFBFAFBFCFBFD
          FEFDFFFEFDFFF9F8FAFDFCFDFCFAFCF9F8FAFBFAFBFEFDFFF7FBFCF7FAFBF7F9
          FAF0F3F3F9FBFCF8F7F9}
        ParentFont = False
        OnClick = BtnBoletoClick
      end
      object BtnEmailBoleto: TSpeedButton
        Left = 606
        Top = 200
        Width = 128
        Height = 42
        Caption = 'Email Boletos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000BF8281BC8181
          BA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B
          7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA
          7B7ABF8281BC8181D99D83FFC988FFC587FFC487FFC487FFC487FFC487FFC487
          FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC587FFC2
          87CB8F82BB7F81BA7B7ABF8281D79983C18781E0A98EFCCB99F8C697F8C697F8
          C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697
          F8C697FCCB99D8A18BC18481CC9286BA7B7ABA7F80E1A98AD99E86BC8282EFC5
          A1F7D0A6F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4
          CCA5F4CCA5F4CCA5F7D0A6E7BA9DBC8181E2AB8EDDA990BA7B7ABA7E7ED9AB98
          F7C99CC98A7FCE9D92F3D7B7F2D4B6F0D3B5F0D3B5F0D3B5F0D3B5F0D3B5F0D3
          B5F0D3B5F0D3B5F0D3B5F0D3B5F2D4B6EDCBB1C18987CC9286F8D5AFD8AB9CBA
          7B7ABA7D7BD4ACA3F7DCBBEDB791BF817FDAB6AAEFDCC6EDD8C4EDD8C4EDD8C4
          EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4F0DEC7D3A99FBD7F7BE7BD
          A1F3E1C9D4ACA3BA7B7ABA7D7BD4AFA7EFE3D3F4D5B4D79C86BC8484E7D5C9ED
          E1D1EBDDCEEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCEEDE3D3DDC2B7
          BC807FDEAF97F0DEC7EEE5D5D4AFA7BA7B7ABA7D7BD5B1ACF3EBE0F2E2D1F2C7
          A4C7897BCCA19EEDE2D7EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9F0
          E7DCEDDED4C18B8ACB9186F3DCC4F0E5D9F3EBE0D5B1ACBA7B7ABA7B7AD8B5B1
          F7F3EAF3EBE3F8E6D0F2C09CB67B77D3B5B1F7F2E9F4EDE3F4EDE3F4EDE3F4ED
          E3F4EDE3F4EDE3F4EDE3CFA4A1C1827BEECCB5F6EFE3F3EBE3F8F3EAD8B5B1BA
          7B7ABA7B7ADAB8B5FBFBF3F8F4EFFAF4EDEDCAB5C1837ABC807FCB9C99CC9E9A
          CC9D9ACC9D9ACC9E9ACC9D9ACC9C99C6908EB87777D19E96F7EBDEFAF8F2F7F3
          EBFBFBF3DAB8B5BA7B7ABA7A79DDBCBBFFFFFFFCFBF7D5AFACBA7B7AC69393D8
          B8B8C69393BD8382BF8484BF8484BD8483BF8686C49593CFB5B4CBA7A6BC7D7D
          C99392EFE0DDFFFFFFFFFFFFDDBCBBBA7B7ABA7A79E1C4C2F0E2E2CB9A99BC80
          7FD7B2B2F3F2F0FBFFFFF4FBFCEFF6F7EFF6F7EDF6F7EDF6F7E9F6F7E9FBFBED
          FFFFE9FFFFD7CCCBC19291BD7F7ED9B5B4FBF7F7E1C4C2BA7B7ABC7F7FCE9D9C
          C48684C08686E9D7D7FFFFFFFBFFFFF7FFFFF7FFFFF3FFFFF3FFFFEFFFFFEFFF
          FFEDFFFFE9FFFFE9FFFFE7FFFFE9FFFFE2F4F4C9A9A9BA7D7BC99392CFA4A1BA
          7B7ABF8281B68080BAB4B6F7F2F2FFFFFFFBFFFFFAFFFFF7FFFFF7FFFFF3FFFF
          F2FFFFEFFFFFEDFFFFEDFFFFE9FFFFE9FFFFE7FFFFE7FFFFE7FFFFE7FFFFDCE3
          E3CBA5A4BF8281BA7B7AC17E7DA19DA09EFCFFFFFFFFFEFFFFFBFFFFFAFFFFF7
          FFFFF7FFFFF3FFFFF2FFFFEFFFFFEFFFFFF2FFFFEFFFFFF2FFFFEFFFFFE9FFFF
          E2F8FADCF4F6CFEEF2B7DEE3AD9EA0BA7B7AC0817FAB9092ACE3E9FFFFFFFEFF
          FFFBFFFFFBFFFFFAFFFFFBFFFFFBFFFFFBFFFFF2FFFFE9F6F7D3E7E9C1DADDAF
          CCD3A0C1C990B4C183A9B8739EB26C9DB57F8E9CA48082BA7B7AFF00FFBB7A79
          BA7D7BFFFFFFFFFFFFFBFFFFF7FFFFEBFAFBD4EAEBC0DEE1AFD5D992C6CC75B1
          BA6CADBA6BB0BF69B1C668B2CA6CB6D46DBBDE72BFE591A4BABC807FBF817FFF
          00FFFF00FFFF00FFC17E7DBA7D7BA19FA397F4FF86F7FF78E5F26FD3DE6CD1DE
          68D7E26BDDEA6FE5F372E6F874E2F775DEF776DCF873DCFC7ACCEDA997A0C081
          7FBF8180FF00FFFF00FFFF00FFFF00FFFF00FFBA7D7BB87E7BA19FA37EDAE56F
          F3FF72F0FF74EFFF74F0FF74F0FF74F0FF74EFFF75EBFC74E7FE73E5FE87C2D7
          AF9298C27F7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFC17E7DBD838299B5BA73F3FF70F6FF74F0FF74EFFF74EFFF72F0FF70F6FF76
          E7F89EAAB1BF8180C17E7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFBF817FC07F7EA7A1A583D7E072F4FF6FF7FF6FF7
          FF74F0FF83D8E1AC9C9DC27D7ABF8180FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC27D7ABC8483
          A6A1A499B5BA99B5BAAB9C9DBC8282C17E7DFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBF8180C17E7DC27D7AC27D7AC17E7DFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        Visible = False
        OnClick = BtnEmailBoletoClick
      end
      object Btgrava_cr1: TSpeedButton
        Left = 0
        Top = 199
        Width = 169
        Height = 43
        Caption = 'Gravar Altera'#231#245'es'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Btgrava_cr1Click
      end
      object GroupBox8: TsGroupBox
        Left = 0
        Top = 121
        Width = 1264
        Height = 76
        Align = alTop
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label30: TsLabel
          Left = 126
          Top = 25
          Width = 85
          Height = 13
          Caption = 'Data Vencimento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label31: TsLabel
          Left = 231
          Top = 25
          Width = 28
          Height = 13
          Caption = 'Valor:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label32: TsLabel
          Left = 718
          Top = 29
          Width = 28
          Height = 13
          Caption = 'Valor:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label33: TsLabel
          Left = 598
          Top = 28
          Width = 92
          Height = 13
          Caption = 'Data Recebimento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label51: TsLabel
          Left = 330
          Top = 25
          Width = 106
          Height = 13
          Caption = 'Forma de Pagamento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label34: TsLabel
          Left = 78
          Top = 26
          Width = 26
          Height = 13
          Caption = 'Seq.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label53: TsLabel
          Left = 7
          Top = 25
          Width = 45
          Height = 13
          Caption = 'N'#186' Titulo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Lbforma_pgto: TsLabel
          Left = 399
          Top = 44
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object sLabel12: TsLabel
          Left = 726
          Top = 37
          Width = 28
          Height = 13
          Caption = 'Valor:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object sLabel13: TsLabel
          Left = 606
          Top = 36
          Width = 92
          Height = 13
          Caption = 'Data Recebimento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Crdtaven: TsDateEdit
          Left = 124
          Top = 39
          Width = 93
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Crvalor: TsCurrencyEdit
          Left = 227
          Top = 39
          Width = 95
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Crcod_fop: TsComboEdit
          Left = 330
          Top = 39
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = ''
          CheckOnExit = True
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Crtitulo: TsEdit
          Left = 5
          Top = 39
          Width = 56
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Crsequencia: TsEdit
          Left = 76
          Top = 39
          Width = 35
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Crdtarec: TsDateEdit
          Left = 596
          Top = 42
          Width = 108
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 5
          Text = '  /  /    '
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Crvalor_recebido: TsCurrencyEdit
          Left = 712
          Top = 41
          Width = 104
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Crid: TsEdit
          Left = 824
          Top = 24
          Width = 49
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = 'Crid'
          Visible = False
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object Pacheque: TPanel
        Left = 0
        Top = 248
        Width = 865
        Height = 161
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 2
        object Label57: TsLabel
          Left = 8
          Top = 4
          Width = 222
          Height = 13
          Caption = 'Cheque Usados na Parcela Selecionada:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object Sg_cheque: TAdvStringGrid
          Left = 0
          Top = 19
          Width = 862
          Height = 132
          Cursor = crDefault
          ColCount = 7
          DefaultRowHeight = 21
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          HoverRowCells = [hcNormal, hcSelected]
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          CellNode.ShowTree = False
          ControlLook.FixedGradientHoverFrom = clGray
          ControlLook.FixedGradientHoverTo = clWhite
          ControlLook.FixedGradientDownFrom = clWhite
          ControlLook.FixedGradientDownTo = clWhite
          ControlLook.ControlStyle = csClassic
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Tahoma'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'Tahoma'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          EnhRowColMove = False
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'Tahoma'
          FilterDropDown.Font.Style = []
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Clear')
          FixedColWidth = 94
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HoverButtons.Position = hbLeftFromColumnLeft
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'Tahoma'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'Tahoma'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'Tahoma'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'Tahoma'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbNoborder
          PrintSettings.Centered = False
          PrintSettings.PageNumSep = '/'
          ScrollWidth = 16
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'Tahoma'
          SearchFooter.Font.Style = []
          SelectionColor = clHighlight
          SelectionTextColor = clHighlightText
          SortSettings.DefaultFormat = ssAutomatic
          SortSettings.Column = 0
          Version = '7.4.6.3'
          WordWrap = False
          ColWidths = (
            94
            69
            92
            91
            81
            86
            265)
        end
      end
      object sDBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1264
        Height = 121
        Align = alTop
        Color = clWhite
        DataSource = DS_CR2
        DrawingStyle = gdsGradient
        FixedColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tab_analise: TsTabSheet
      Caption = 'An'#225'lise do Pedido'
      ImageIndex = 2
      TabVisible = False
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object GroupBox1: TsGroupBox
        Left = 0
        Top = 281
        Width = 1264
        Height = 136
        Align = alTop
        Caption = 'Totalizadores'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label24: TsLabel
          Left = 40
          Top = 21
          Width = 40
          Height = 13
          Caption = 'T.Bruto:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label26: TsLabel
          Left = 29
          Top = 45
          Width = 49
          Height = 13
          Caption = 'Desconto:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object Label27: TsLabel
          Left = 30
          Top = 69
          Width = 47
          Height = 13
          Caption = 'T.Liquido:'
        end
        object Label28: TsLabel
          Left = 20
          Top = 93
          Width = 59
          Height = 13
          Caption = 'Custo Total:'
        end
        object Label29: TsLabel
          Left = 17
          Top = 117
          Width = 61
          Height = 13
          Caption = 'Lucro M'#233'dio:'
        end
        object Zztot_bruto: TsCurrencyEdit
          Left = 88
          Top = 14
          Width = 99
          Height = 21
          AutoSize = False
          TabOrder = 0
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Zzdesconto: TsCurrencyEdit
          Left = 88
          Top = 38
          Width = 99
          Height = 21
          AutoSize = False
          TabOrder = 1
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Zztot_liquido: TsCurrencyEdit
          Left = 88
          Top = 62
          Width = 99
          Height = 21
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prcusto_total: TsCurrencyEdit
          Left = 88
          Top = 86
          Width = 99
          Height = 21
          AutoSize = False
          TabOrder = 3
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object Prlucro_medio: TsCurrencyEdit
          Left = 88
          Top = 110
          Width = 99
          Height = 21
          AutoSize = False
          TabOrder = 4
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
      object GroupBox5: TsGroupBox
        Left = 0
        Top = 0
        Width = 1264
        Height = 281
        Align = alTop
        Caption = 'Ultimas 3 Compras do Cliente'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
      end
    end
    object TaNFe: TsTabSheet
      Caption = '&4) Nota Fiscal Eletr'#244'nica'
      ImageIndex = 4
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object pgNFE: TsPageControl
        Left = 0
        Top = 0
        Width = 1264
        Height = 350
        ActivePage = TabDadosNFE
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'PAGECONTROL'
        object TabDadosNFE: TsTabSheet
          Caption = 'Nota Fiscal Eletr'#244'nica'
          SkinData.CustomColor = True
          SkinData.CustomFont = False
          object GroupBox9: TsGroupBox
            Left = 0
            Top = 0
            Width = 1256
            Height = 322
            Align = alClient
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object BtnDanfe: TSpeedButton
              Left = 564
              Top = 238
              Width = 100
              Height = 28
              Caption = 'DANFe'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
                FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
                9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
                FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
                C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
                FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
                16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
                F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
                A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
                00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
                928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
                89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
                D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
                9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
                C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
                ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
                C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
                D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
                00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
                66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
                99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
                A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
                ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
                C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
                D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
                E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
                B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
                FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
                DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
                FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
                00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
                9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
                36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
                FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
                D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
                000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
                00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
                9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
                FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
                FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
                B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
                00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
              ParentFont = False
              OnClick = BtnDanfeClick
            end
            object BtnEmailNFe: TSpeedButton
              Left = 676
              Top = 238
              Width = 100
              Height = 28
              Caption = 'Email NFe'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000BF8281BC8181
                BA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B
                7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA
                7B7ABF8281BC8181D99D83FFC988FFC587FFC487FFC487FFC487FFC487FFC487
                FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC587FFC2
                87CB8F82BB7F81BA7B7ABF8281D79983C18781E0A98EFCCB99F8C697F8C697F8
                C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697
                F8C697FCCB99D8A18BC18481CC9286BA7B7ABA7F80E1A98AD99E86BC8282EFC5
                A1F7D0A6F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4
                CCA5F4CCA5F4CCA5F7D0A6E7BA9DBC8181E2AB8EDDA990BA7B7ABA7E7ED9AB98
                F7C99CC98A7FCE9D92F3D7B7F2D4B6F0D3B5F0D3B5F0D3B5F0D3B5F0D3B5F0D3
                B5F0D3B5F0D3B5F0D3B5F0D3B5F2D4B6EDCBB1C18987CC9286F8D5AFD8AB9CBA
                7B7ABA7D7BD4ACA3F7DCBBEDB791BF817FDAB6AAEFDCC6EDD8C4EDD8C4EDD8C4
                EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4F0DEC7D3A99FBD7F7BE7BD
                A1F3E1C9D4ACA3BA7B7ABA7D7BD4AFA7EFE3D3F4D5B4D79C86BC8484E7D5C9ED
                E1D1EBDDCEEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCEEDE3D3DDC2B7
                BC807FDEAF97F0DEC7EEE5D5D4AFA7BA7B7ABA7D7BD5B1ACF3EBE0F2E2D1F2C7
                A4C7897BCCA19EEDE2D7EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9F0
                E7DCEDDED4C18B8ACB9186F3DCC4F0E5D9F3EBE0D5B1ACBA7B7ABA7B7AD8B5B1
                F7F3EAF3EBE3F8E6D0F2C09CB67B77D3B5B1F7F2E9F4EDE3F4EDE3F4EDE3F4ED
                E3F4EDE3F4EDE3F4EDE3CFA4A1C1827BEECCB5F6EFE3F3EBE3F8F3EAD8B5B1BA
                7B7ABA7B7ADAB8B5FBFBF3F8F4EFFAF4EDEDCAB5C1837ABC807FCB9C99CC9E9A
                CC9D9ACC9D9ACC9E9ACC9D9ACC9C99C6908EB87777D19E96F7EBDEFAF8F2F7F3
                EBFBFBF3DAB8B5BA7B7ABA7A79DDBCBBFFFFFFFCFBF7D5AFACBA7B7AC69393D8
                B8B8C69393BD8382BF8484BF8484BD8483BF8686C49593CFB5B4CBA7A6BC7D7D
                C99392EFE0DDFFFFFFFFFFFFDDBCBBBA7B7ABA7A79E1C4C2F0E2E2CB9A99BC80
                7FD7B2B2F3F2F0FBFFFFF4FBFCEFF6F7EFF6F7EDF6F7EDF6F7E9F6F7E9FBFBED
                FFFFE9FFFFD7CCCBC19291BD7F7ED9B5B4FBF7F7E1C4C2BA7B7ABC7F7FCE9D9C
                C48684C08686E9D7D7FFFFFFFBFFFFF7FFFFF7FFFFF3FFFFF3FFFFEFFFFFEFFF
                FFEDFFFFE9FFFFE9FFFFE7FFFFE9FFFFE2F4F4C9A9A9BA7D7BC99392CFA4A1BA
                7B7ABF8281B68080BAB4B6F7F2F2FFFFFFFBFFFFFAFFFFF7FFFFF7FFFFF3FFFF
                F2FFFFEFFFFFEDFFFFEDFFFFE9FFFFE9FFFFE7FFFFE7FFFFE7FFFFE7FFFFDCE3
                E3CBA5A4BF8281BA7B7AC17E7DA19DA09EFCFFFFFFFFFEFFFFFBFFFFFAFFFFF7
                FFFFF7FFFFF3FFFFF2FFFFEFFFFFEFFFFFF2FFFFEFFFFFF2FFFFEFFFFFE9FFFF
                E2F8FADCF4F6CFEEF2B7DEE3AD9EA0BA7B7AC0817FAB9092ACE3E9FFFFFFFEFF
                FFFBFFFFFBFFFFFAFFFFFBFFFFFBFFFFFBFFFFF2FFFFE9F6F7D3E7E9C1DADDAF
                CCD3A0C1C990B4C183A9B8739EB26C9DB57F8E9CA48082BA7B7AFF00FFBB7A79
                BA7D7BFFFFFFFFFFFFFBFFFFF7FFFFEBFAFBD4EAEBC0DEE1AFD5D992C6CC75B1
                BA6CADBA6BB0BF69B1C668B2CA6CB6D46DBBDE72BFE591A4BABC807FBF817FFF
                00FFFF00FFFF00FFC17E7DBA7D7BA19FA397F4FF86F7FF78E5F26FD3DE6CD1DE
                68D7E26BDDEA6FE5F372E6F874E2F775DEF776DCF873DCFC7ACCEDA997A0C081
                7FBF8180FF00FFFF00FFFF00FFFF00FFFF00FFBA7D7BB87E7BA19FA37EDAE56F
                F3FF72F0FF74EFFF74F0FF74F0FF74F0FF74EFFF75EBFC74E7FE73E5FE87C2D7
                AF9298C27F7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFC17E7DBD838299B5BA73F3FF70F6FF74F0FF74EFFF74EFFF72F0FF70F6FF76
                E7F89EAAB1BF8180C17E7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFBF817FC07F7EA7A1A583D7E072F4FF6FF7FF6FF7
                FF74F0FF83D8E1AC9C9DC27D7ABF8180FF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC27D7ABC8483
                A6A1A499B5BA99B5BAAB9C9DBC8282C17E7DFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFBF8180C17E7DC27D7AC27D7AC17E7DFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              OnClick = BtnEmailNFeClick
            end
            object btXml: TSpeedButton
              Left = 452
              Top = 238
              Width = 100
              Height = 28
              Caption = ' Xml'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000018000000140000000100
                180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
                E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
                F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
                C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
                E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
                FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
                A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
                FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
                CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
                EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
                D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
                C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
                B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
                9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
                FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
                8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
                FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
                77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
                866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
                F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
                88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
                F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
                EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
                89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
                A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
                A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
                FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
                D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
                FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
                7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
                F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
                E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
                DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
                EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
                32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
                FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
                FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
              ParentFont = False
              OnClick = btXmlClick
            end
            object sbClonar: TSpeedButton
              Left = 1144
              Top = 9
              Width = 100
              Height = 98
              Caption = 'Clonar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
                6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
                6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
                5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
                727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
                5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
                888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
                D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
                7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
                8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
                8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
                FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
                6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              OnClick = sbClonarClick
            end
            object BtnNFE: TSpeedButton
              Left = 666
              Top = 188
              Width = 129
              Height = 44
              Caption = 'NFe'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                B6160000424DB61600000000000036000000280000002F000000280000000100
                1800000000008016000000000000000000000000000000000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F3F4F4F5
                F5F5F3F1EDF1F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F3F4F3F4F3F5F4F7F7F1E4D9F1D3C1F3E8E2F4F5F6F3F4F3F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F5F5F5F4F4F4F5F5F5F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F3F5F5F3EEEBF9
                D1AEE7AC84EFCDB9F5EEEAF3F4F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F5F5F5F1F1F1E9E9E9E5E5E5E6E6E6EAEAEAF0F0F0F4F4F4
                F4F4F4F2F6F4F4F3F5F1DED4F4CDAEFFD8B6F8CDA6EBB088EFD4BFF5F1F1F4F5
                F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F5F4ECEAECD9D3D8D3CC
                D0D2CBD1D0CCCFCFCECED2D4D3DCDDDDE9E9E9F1F1F0F5DCCDFBD0ACFFD7B3FF
                D5B5FFD8B7FBD4AFEAA982F0DFCEF6F3F4F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F5F5F3EEF1CFD2CDA6C8AC7FB78D77B58694BDA0B8C4B9BBB4B7B1ABAE
                B5B4B6C9C1BAFACDABFFD7B5FFD6B5FFD6B5FFD5B5FFDBBBE9AB80ECAF89F2E6
                DEF4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3FBF5FCCCDCCD65B3791D883F4DA0
                6361A76B479D54258C413B985884AD959CACAFACA3AABBADA4F4C8A6FCD5B2FE
                D8B6FED7B6FBD3B2FAD2ABEDB286F2D8CAF4F5F7F3F4F4F3F4F3F3F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F6
                F5F6EDF0EB7FBD8D2B8C4CE8EBE5FFFFFF58DCE127C4BC5BC9B163B485238D44
                22945245B1A074AAB4B8A8A7E0BAA0F8CBA9F8CDADFCD4B3FFDAB9F4C39AF1D2
                C0F3F5F7F4F5F5F4F4F4F4F4F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F9F6F9CBE2CD419B5CA3C1ADFFF6FD63DD
                DD08B9B269C4C0DAE7ECF3FAFBD7E9DB6FB6841A8739249E6F22AAAD83A1A0E7
                B999F8CCA6F9CFAAFAD2B1F0BB94EFB38FF3E2DAF4F3F5F1F6F5F2F4F5F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FC
                F7FBB6DBBB2F924BD2CFCFE1EFF120CBC941BCB0E0CCCDF3F1F0F7F5F5F9F7FA
                FCF9F8BAD9C0439A56178F4E9EAE95DDB098DAB99CF4CBAEFED7B8F9D2ACE698
                66ECAF84EED0B9F3E4DCF4F1F3F4F2F2F3F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FCF7FBB2D5B5329250D5CFCFB6E4E412C6
                BE8AC2BDD6CED0F1F1F1F4F4F4F4F3F4F5F4F5FFFAFFDDECDD69B37F1C873BBF
                B993E0B099DBB79CF1C8A9FAD1B0FDD8B3E9A272E69967EDAF87EEC3A5EFC3A6
                F0D6C5F3EFF1F4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FB
                F7FBB7D9BC369551D0CAC9A0DDDF13C2BD9BC4C2D0CCCDEEEEEEF4F5F5F5F3F4
                F2F6F5F5F2F0F9D5C3EBCCAE8CC79312853AA4AD87D1A48FD5AF92F8CFAEFFD9
                B7FEDCBAFACFADEB9E6BEA9E6DEA9C6BEBA579F0D7C7F6F4F5F3F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FAF6F9C5E0CA409E5ABAC0B7A6D5DB15C4
                BD91C6C3CFC8C8EAEAEAF5F5F5F4F4F5F6F4F3D1B59E936A4E8265527C6A5881
                AC851083366A7D5B8A6A5DA68E76E8C1A5FCD2AFFAD3B1F9D0ADF9D5B2FBD8B6
                EAA778EDB18DF2E6DEF2F6F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8
                F5F7D7E9DA59AB7090B299BED0D51EC5C06CC6BECFC6C6E1E1E1F5F5F5F2F2F1
                E0E3E0E3DED9FDFFFFFFFFFFFFFFFFF6F6F49BC8A3188C3F5D6E515E4740927D
                67F5CBAAFFD7B8FFD7B6FFD8B5F9CEAEF6C99FE79863ECC5AAF4F1EEF3F4F5F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F4F5F2F3F17EBD8A5EA26FDBCED62DC4
                C43AC0B4D6C9CAD5D5D5F1F1F1FBFCFCFFFFFFFFFFFFFFFFFFFEFFFCFDFEFCFF
                FFFFFFFFFF9DD0AA1A8F43878969987162DBB99EF8D1B2FFD7B6FFD6B4FCD4B2
                FBD7B7EEAF84EBAE85F5E7E2F4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F3F4FCFAFCA9D3B0399656D5CBC95EC4C50EB9AECCCFCFCBC8C8F4F4F4FFFFFF
                FFFFFFC5BFB8CEAE96FDD2ADFBD2AEF9D0ACF7D0B4F8E3CE8DC79C1B8941D2B7
                9AD3AD95E6BFA1FDD3B3FFD6B5FFD6B6F8D0ABFAD3AFE89A6AF0D5C1F6F3F8F3
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3FBF5F9D4E6D553AB6C99B79C96C4
                C914BBB38CCBC5CAC3C4FFFFFFFFFFFFCCCBC8725C4AFCD2B0FED4B3FAD0ADF8
                CAA8FFD8B5FFD5B4F0D9B875B582268C44E5B9A0D0AE95EBC5A6FED5B3FFD7B6
                F9D0AFFAD2ACE99E6BEEC2A2F2F0EFF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3
                F4F3F5F4F5F7F6F691C497459C63DACDD32CB8B92DBCADDFD3D6FFFFFFFFFFFF
                847263987C68FDD3B1FFD9B7FFD7B5FDD4AEFFDCB9FFDAB8FFDCB9E8DDBE53A7
                69589B5FE3B59FD4B397F4CBACFFD6B5FFD8B5FAD4B4EEAE80EBB48FF2EEEAF4
                F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F4F3F3FAF8FAC4E0C74AA260B3C0
                AD74BDC20AB4A5AAD7D3FFFFFFFFFFFF7866547B6552AF927CB1937BB0937AB3
                9277AF8E76B2937BB1927BB69078AAB797228D4697A97ED9B096DCBA9DFAD3B1
                F9D1AFFAD3B2F3BE92ECB08BF5ECEAF4F6F6F3F4F4F3F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F4
                F4F4F4F4F4F5F4F5F4F5F386C2904E9E64CCCBD22BB0AE4FAF9CFFFFFFFFFFFF
                B8B0A8A89F94A99F95A99F95A99F96A99F96A99E94A99D94A99E95AAA2989381
                748EB68D12823AD8B89AD0A98CE7BF9DFFD6B6FFDABAEFB589EAAB81F2E4DBF2
                F4F6F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F3F4F4F3F4F4F4F4F5F4F4F4F4F4F5FCF9FCC7DFCD4DA6
                67A1AE8D99937B8E865AFFFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD7D37D6F5C70B27D44934EE5B4A0D8B397
                F7CDAEFFDABAEFB78AE99966ECB696F1E2D8F5F4F8F2F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F5F5F3F7F2
                ECEAF0D8C9F2D8CBF6EAE6F9F6F893C89F3F9A54CE9E7CE1B598F2E5DDFFFFFF
                EEECEA907F71B09E91FADCC7FDE2C9FAE0C7FBE1C8F7D8C0F8E4D0FFFFFFF4F5
                F1644334B1BB9B2C944FA0AF82D7AE95E1BDA1FED5B6FCD5B4E7A374E89B66EE
                C1A5F6EEEAF5F5F6F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F3F4F5F3EEEBF0D7C9ECC3A5EDA375E99E6EEAB997F8DBD0D8D5
                B663B37D77A878DFAF96DDBEA5FCFFFFFFFFFF8C76636C5945BA9B83FFD6B3FF
                D9B7FFD8B1FCD1ABFBE0C4FFFFFFFEFFFD634B3AC7A68EA4CCA421873DE0B89E
                D2AF95F2CCACFFD9B9F9D2AFE4935EEBA376EECAB4F3EEEBF2F5F6F4F4F4F3F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F3F5EFD3C0E99E70F3
                BF96F5CAA5F4C49AE99B69E69F70FFD3AEB4D2AF41A061B0AF86D5A589E3D9D3
                FFFFFFF7F4EF7F634F73604EAA927BE7C3A7FAD4B2F7CBA7F2E1CEFFFFFFEFEE
                EE6C5745E7B897E5D9B6449E6085A673DAAE97E4BD9EFFD6B6FAD4B3F2C398E6
                965EE9A473EFCFB9F7F1F4F3F4F4F4F3F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F3F2F5F6F3E8E4F1C09FF7CAA5F6CAA4FFDAB9FDD6B6FAD6B1F1B992F9CF
                A8FED8B88DC79B3F9D5CDCB599D1AD8FECEAEAFFFFFFF8F4F1967C6D69503F74
                5B478165519B8471FEFFFFFFFFFFBDB9B3AE8B6FFDD4B0FFD9BBACCAA01D8740
                DCB49BD3AE92F5CFAEF7CBAAF9D4B4F2BF93EA9763E9AD85F3E4DAF2F6F6F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F3F3F6F8F4E4D9FED5B1FED7B9FC
                D4B4FBD1B1FED5B4FED6B6FFD9B8FED4B5FDCFADE4D4B16CB7865BA565DEAF96
                D3A98CF1E6E6FFFFFFFFFFFFF5F4F2D9D5D4E1E1DEFFFFFFFFFFFFFCFFFFC0A0
                87F8CCA7FBD3AFFFD7B7E5D8B94AA1628BA071D5AC92E4BD9EFCD4B1FAD5B0FD
                DABAE9A16FE9A170F1D5C6F5F5F7F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F3F7FAF5D4B3FDD2B0FCD3B1FED6B5FFD6B5FFD6B5FFD5B5FFD5B4FFD6
                B5FED5B5FFD7B5C7D4B152A87083AE7DDFAB93D4AE8FEFD8C3FEF9F6FFFFFFFF
                FFFFFFFFFFFEFFFFFAF4EDEFCCB0FDD0A8FDD6B3FAD2AFFAD1AFFFD9BA9FC89D
                308C47DDAF95D6AD8FFACDADF9D0A9FAD6B6EDAF7DE7A06FF1D7C9F3F6F7F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F4F4F5F6F4EBE0FFD5B0FFD8B7FF
                D6B5FFD5B4FFD6B5FFD8B6FFD8B7FFD7B6FED6B4FFD7B6FFDABBB6D1AA40A061
                A1B084DBB096DAB495F3C6A4FCD2B2FDDABCFDDBBCFCD3B3FFD2AEF9D0ACFBD3
                B2FFD6B5FFD6B5FCD4B3FECDACD5D9B42F934EB8AE8BD4AB92F0C5A0F6CDA9FD
                D8B6E9A174EAAF85F2E3DAF4F4F6F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F3F3F4F4F4F4F5F6F8E9C4ACF3CAA8FFD6B3FFD6B5FCD4B2EFC7AAF1C8ABFCD2
                B3FFD7B5F5CDADF2C9AAFCD1B4A4CEA6399C5AB2B891DAAF94D9B59CF3C9ABFF
                D4B3FFD5B4FFD5B4FFD6B5F9CEAAF9D0ACFFD6B6FFD5B5FFD6B5FCD2AFF3D7B6
                6CB3796D9E67DBAE98EEC4A3FFD3B0F3CBA5DFBCA8F4E0D4F2F1F1F3F5F4F4F3
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F5F5F5EEEFF08F918E7F736CE9
                CAB0FFDABAE0BFA38A7768766350C7A78EFFE0C2C7AC95766354AE927AFEDCBB
                9AC99E399A5DBBB995D8B196D8B498EEC8A9FED5B3FFD6B5FFD6B5FFD7B6F9CF
                AFFFD6B5FFD6B4FFD6B5FAD1B0FFD7B7A5CA9E388C4CDFB29BC7A27F999F7DCF
                BBB1D7D6D7F0F5F4F4F4F5F4F3F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F3F3F3F5F5F5FFFFFFEEEEEE616465D0CDCBFBEFE1FFFFFFFFFFFF736154A688
                6FFFFFFEFFFFFF9A8E878D735DFFD6B5FAD9B98EC89B389B5BB7BA95DDB098D4
                B296EBC4A4FCD2B1FFD6B6FED6B5FFD6B5F7CFADFED6B6FFD8B6FFD8B5FECCA7
                C6D1AF2A8F46CCAC967DA69336BCB0D5CCCFCFCED0F2F2F2F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F3F3F3FFFFFFFFFFFF5F6062B3
                ABA9FFFFFFFFFFFFFFFFFF998C8191725CFDF0E1FFFFFFBDB7AE7A624FF4CEB0
                FFDEBDFCD9BA99CB9F379B5DACB88EE5B49BD0B094E5BEA2F8CFAFFFD5B5FFD7
                B6FAD2AFFFD9B9EFBF95F2D0B9F8E6DCD4E2D0399857B6BFB482C3C51BBEB5CA
                CFCECDCBCCEFEFEFF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F2F2F2FEFEFEFFFFFF767877A5A09FFFFFFFF1EFEFFFFFFFBDB5AE7B62
                4CEFDBC8FFFFFFDFDCD85E46369C7F68A7866CAF8B71CDB096A2CFA4399E5B8D
                B283E4B497D3AF96DDB89BFAC9ACFFD2AFF0C29EE9BF9FF0DED3F5F0F3F9F8FC
                DDEBDE439E60A9B7A895CCC91EC1B7BEC9CBCECBCBEFEFEFF4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3FBFBFBFFFFFF989796C0
                C2C0FFFFFF9B8C82FFFFFFDEDBD8695543DCC2A6FFFFFFFEFFFFD2CDC9D4D0CF
                D8D4D3908177997F67FFD8B9B4D2AB4CA5685EA66ED7BB9AD8AB926A967EA0AB
                A2C8BABACCCCCEE2E2E3EFF0F0FAF6F9D9E7D93E9A59AFBAAE96D3D319C0B5BC
                C4C5D3CFD0F2F2F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F3F3F3F8F8F8FFFFFFB3B3B3FBFCFCE7E5E2896C57FFFFFFFFFFFF644F
                43C5A489FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECD8F9CDABFFDAB7FFD6B5CB
                D1AE6FB4833E9C5A7DA97D40AAA204989053A7A5B0B2B1BFB5B6C7C3C3D6D0D5
                B5D5BA298B48DACCCE6DD5D21FB9AFCAC3C4E1DDDEF5F5F5F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3F5F5F5FFFFFFF7F7F7FF
                FFFFA9A6A5B09F91FFFFFFFFFFFF6D6E6DA07C63FFFFF9FFFFFF88796C684E3D
                AEA7A3B2A293BAA28DDFB698F9CFB3FFD5B4F2D8B69CC9A04BA3624FA36957BB
                A126ACA1119D9651A4A590A3A8AFB8AD6FB17B59976599CFD426C4B85EBBB5DB
                CFD0EFEFEFF5F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F3F3F3F3F3F3FFFFFFFFFFFFFFFFFF777A79D7DBDCFEFFFFFFFFFF9695
                9493725DFBEFE2FFFFFFDFDCD8BBB2ACBDBEBFC4C4C86F7073A5A4A3F9F9FAF2
                F7F7FCD4B4FCC7A9DAE2CE88C2984FA05E4A9E5B54AC794FAE8155B38846A463
                27904E34BDB313BBAF34BBB2E0D7D8EEECECF5F5F5F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2FFFFFFFFFFFFF9
                F9F9D9D9D9F3F3F3FAFAFAFFFFFFEEE8E3DDCABEF5EFECFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFE5E5E5E2E2E3F5F5F5F3F5F7F4E8DFF4E1D3F9F3F3FDFAFFE1ED
                E4B4D5B97EB98B62AA7462AB757AC3A057D1CB56CDCCA0DEDAF8EEEFF6F3F3F5
                F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
                F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3F4F4F4F6F6F6F4F4F4F3F3F3F4F3F3F3F7
                F6F5F8FAF5F5F4F2F3F5F0DDCFF3ECEBF2F3F3F3F3F3F6F6F6F6F6F6F4F4F4F4
                F4F3F4F4F7F3F4F7F4F4F4F2F4F4F7F5F6FBF8FBFFFBFFFFFCFFFFFCFFFFF9FE
                FFF8FAFFF8F8FEF6F7F7F4F4F6F4F4F3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3
                F3F3F4F4F4F4F4F4F3F3F3F3F3F3F4F3F4F4F4F3F3F3F4F4F4F4F5F5F7F5F4F4
                F3F3F3F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F4F4F3F4F3F3F4F3
                F4F4F3F4F3F3F4F4F3F4F4F3F3F3F4F3F4F4F4F4F4F4F4F4F4F3F4F4F3F4F3F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000}
              ParentFont = False
              OnClick = BtnNFEClick
            end
            object gbChaveNfe: TsGroupBox
              Left = 8
              Top = 9
              Width = 844
              Height = 42
              Caption = 'Chave N'#176
              TabOrder = 0
              SkinData.SkinSection = 'GROUPBOX'
              object PrChave_NFe: TsEdit
                Left = 6
                Top = 14
                Width = 830
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                SkinData.SkinSection = 'EDIT'
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
              end
            end
            object gbMotivo: TsGroupBox
              Left = 71
              Top = 51
              Width = 1067
              Height = 42
              Caption = 'Motivo'
              TabOrder = 1
              SkinData.SkinSection = 'GROUPBOX'
              object PrMotivo_nfe: TsEdit
                Left = 6
                Top = 14
                Width = 1052
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                SkinData.SkinSection = 'EDIT'
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
              end
            end
            object GbStat: TsGroupBox
              Left = 8
              Top = 51
              Width = 57
              Height = 42
              Caption = 'Situa'#231#227'o'
              TabOrder = 2
              SkinData.SkinSection = 'GROUPBOX'
              object PrStatus_Nfe: TsEdit
                Left = 11
                Top = 14
                Width = 35
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                SkinData.SkinSection = 'EDIT'
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
              end
            end
            object gbProtocolo: TsGroupBox
              Left = 858
              Top = 9
              Width = 110
              Height = 42
              Caption = 'N'#176' Protocolo'
              TabOrder = 3
              SkinData.SkinSection = 'GROUPBOX'
              object PrPROTOCOLO_NFE: TsEdit
                Left = 6
                Top = 14
                Width = 99
                Height = 21
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                SkinData.SkinSection = 'EDIT'
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
              end
            end
            object gbDataRecNFe: TsGroupBox
              Left = 974
              Top = 9
              Width = 164
              Height = 42
              Caption = 'Data Recebimento'
              Enabled = False
              TabOrder = 4
              SkinData.SkinSection = 'GROUPBOX'
              object PrDATA_REC_NFE: TDateTimePicker
                Left = 6
                Top = 14
                Width = 153
                Height = 21
                Date = 36892.000011574070000000
                Format = 'dd/MM/yyyy HH:mm:ss'
                Time = 36892.000011574070000000
                DateMode = dmUpDown
                TabOrder = 0
              end
            end
            object gbCancNfe: TsGroupBox
              Left = 8
              Top = 92
              Width = 1130
              Height = 96
              Caption = 'Cancelamento Justificativa'
              TabOrder = 5
              SkinData.SkinSection = 'GROUPBOX'
              object lbStatusCancel: TsLabel
                Left = 662
                Top = 67
                Width = 318
                Height = 13
                Alignment = taRightJustify
                Caption = 'Prazo Limite para o Cancelamento: 15/12/2010 10:00:00'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
              end
              object sLabel1: TsLabel
                Left = 6
                Top = 44
                Width = 75
                Height = 13
                Caption = 'Motivo Interno:'
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
              end
              object lbMotivo: TsLabel
                Left = 153
                Top = 44
                Width = 3
                Height = 13
                ParentFont = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
              end
              object BtnEnviarCancelamentoNFe: TSpeedButton
                Left = 431
                Top = 59
                Width = 100
                Height = 28
                Caption = 'Enviar'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  D6050000424DD605000000000000360000002800000018000000140000000100
                  180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
                  E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
                  F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
                  C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
                  E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
                  FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                  F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
                  A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
                  F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
                  FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
                  CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
                  EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
                  D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
                  C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                  F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
                  B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
                  F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
                  9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
                  FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
                  8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
                  FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
                  77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
                  866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
                  F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
                  88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
                  F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
                  EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
                  89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
                  A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
                  A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
                  FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
                  D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
                  FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
                  7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
                  F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
                  E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
                  DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
                  EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
                  32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
                  FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
                  FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
                ParentFont = False
                OnClick = BtnEnviarCancelamentoNFeClick
              end
              object BtnEditarCancelamentoNFe: TSpeedButton
                Left = 321
                Top = 60
                Width = 100
                Height = 28
                Caption = 'Editar'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
                  8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
                  F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
                  83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
                  A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
                  F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
                  83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
                  6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
                  FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
                  79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
                  A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
                  FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
                  69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
                  7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
                  FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
                  5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
                  F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
                  F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
                  FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
                  CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
                  A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
                ParentFont = False
                Spacing = 10
                OnClick = BtnEditarCancelamentoNFeClick
              end
              object BtnSairCancelamentoNFe: TSpeedButton
                Left = 542
                Top = 59
                Width = 100
                Height = 28
                Caption = 'Cancelar'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
                  6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
                  669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
                  6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
                  9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
                  5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
                  727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
                  9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
                  5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
                  888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
                  9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
                  D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
                  7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
                  9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
                  DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
                  8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
                  9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
                  DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
                  8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
                  FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
                  669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
                  6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentFont = False
                OnClick = BtnSairCancelamentoNFeClick
              end
              object PrJUSTIF_CANC_NFE: TsEdit
                Left = 6
                Top = 14
                Width = 1115
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                MaxLength = 255
                ParentFont = False
                TabOrder = 0
                OnChange = PrJUSTIF_CANC_NFEChange
                SkinData.SkinSection = 'EDIT'
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
              end
              object PrMOTIVO_NFE_CANCEL_INTERNO: TsComboEdit
                Left = 83
                Top = 41
                Width = 66
                Height = 21
                AutoSize = False
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                Text = ''
                OnExit = PrMOTIVO_NFE_CANCEL_INTERNOExit
                CheckOnExit = True
                BoundLabel.Indent = 0
                BoundLabel.Font.Charset = DEFAULT_CHARSET
                BoundLabel.Font.Color = clWindowText
                BoundLabel.Font.Height = -11
                BoundLabel.Font.Name = 'Tahoma'
                BoundLabel.Font.Style = []
                BoundLabel.Layout = sclLeft
                BoundLabel.MaxWidth = 0
                BoundLabel.UseSkinColor = True
                SkinData.SkinSection = 'EDIT'
                OnButtonClick = PrMOTIVO_NFE_CANCEL_INTERNOButtonClick
                GlyphMode.Blend = 0
                GlyphMode.Grayed = False
              end
            end
            object gbTipoNFe: TsGroupBox
              Left = 439
              Top = 194
              Width = 105
              Height = 38
              Caption = 'Tipo de NFe'
              TabOrder = 6
              SkinData.SkinSection = 'GROUPBOX'
              object PrTipoNFe: TComboBox
                Left = 8
                Top = 13
                Width = 91
                Height = 19
                Style = csDropDownList
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                ItemIndex = 0
                ParentFont = False
                TabOrder = 0
                Text = 'Normal'
                Items.Strings = (
                  'Normal'
                  'Complementar')
              end
            end
            object gbEntrada_Saida: TsGroupBox
              Left = 547
              Top = 194
              Width = 113
              Height = 38
              Caption = 'NFe Entrada / Sa'#237'da'
              TabOrder = 7
              SkinData.SkinSection = 'GROUPBOX'
              object PrNfeEntradaSaida: TComboBox
                Left = 6
                Top = 15
                Width = 91
                Height = 19
                Style = csDropDownList
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = []
                ItemIndex = 0
                ParentFont = False
                TabOrder = 0
                Text = 'Sa'#237'da'
                OnChange = PrNfeEntradaSaidaChange
                Items.Strings = (
                  'Sa'#237'da'
                  'Entrada')
              end
            end
          end
        end
        object TabCCe: TsTabSheet
          Caption = 'Carta de Corre'#231#227'o Eletr'#244'nica'
          SkinData.CustomColor = True
          SkinData.CustomFont = False
          object gbCC: TsGroupBox
            Left = 0
            Top = 211
            Width = 995
            Height = 81
            Caption = 'Carta de Corre'#231#227'o'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object BtnEnviarCC: TSpeedButton
              Left = 885
              Top = 10
              Width = 100
              Height = 28
              Caption = 'Enviar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000018000000140000000100
                180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
                E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
                F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
                C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
                E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
                FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
                A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
                FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
                F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
                CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
                EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
                D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
                C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
                F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
                B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
                F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
                9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
                FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
                8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
                FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
                77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
                866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
                F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
                88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
                F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
                EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
                89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
                A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
                A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
                FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
                D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
                FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
                7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
                F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
                E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
                DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
                EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
                32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
                FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
                FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
              ParentFont = False
              OnClick = BtnEnviarCCClick
            end
            object BtnEditarCC: TSpeedButton
              Left = 345
              Top = 42
              Width = 100
              Height = 28
              Caption = 'Editar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
                8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
                F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
                83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
                A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
                F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
                83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
                6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
                FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
                79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
                A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
                FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
                69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
                7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
                FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
                5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
                F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
                F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
                FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
                CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
                A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
              ParentFont = False
              Spacing = 0
              OnClick = BtnEditarCCClick
            end
            object BtnInsCC: TSpeedButton
              Left = 234
              Top = 42
              Width = 100
              Height = 28
              Caption = 'Inserir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Spacing = 0
              OnClick = BtnInsCCClick
            end
            object BtnCancelCC: TSpeedButton
              Left = 453
              Top = 42
              Width = 100
              Height = 28
              Caption = 'Cancelar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
                6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
                6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
                5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
                727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
                5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
                888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
                D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
                7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
                8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
                8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
                FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
                6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              OnClick = BtnCancelCCClick
            end
            object BtnGravarCC: TSpeedButton
              Left = 560
              Top = 42
              Width = 100
              Height = 28
              Caption = 'Gravar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbDANFCe: TSpeedButton
              Left = 885
              Top = 43
              Width = 100
              Height = 28
              Caption = 'DANFCe'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
                FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
                9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
                FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
                C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
                FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
                16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
                F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
                A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
                00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
                928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
                89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
                D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
                9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
                C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
                ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
                C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
                D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
                00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
                66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
                99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
                A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
                ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
                C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
                D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
                E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
                B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
                FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
                DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
                FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
                00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
                9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
                36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
                FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
                D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
                000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
                00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
                9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
                FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
                FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
                B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
                00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
              ParentFont = False
              OnClick = sbDANFCeClick
            end
            object PrCartaCorrecao: TsDBEdit
              Left = 6
              Top = 14
              Width = 827
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'CARTACORRECAO'
              DataSource = ds_cce
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 0
              OnChange = PrCartaCorrecaoChange
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = []
              BoundLabel.Layout = sclLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
            object rgTipoCarta: TRadioGroup
              Left = 7
              Top = 36
              Width = 185
              Height = 37
              Caption = 'Tipo'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Sa'#237'da'
                'Entrada')
              TabOrder = 1
            end
          end
          object dgCCe: TDBGrid
            Left = 0
            Top = 0
            Width = 1256
            Height = 205
            Align = alTop
            Color = clWhite
            DataSource = ds_cce
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Title.Alignment = taCenter
                Title.Caption = 'Ord'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CARTACORRECAO'
                Title.Caption = 'Corre'#231#227'o'
                Width = 940
                Visible = True
              end>
          end
        end
        object TabNfeRef: TsTabSheet
          Caption = 'NF-e Referente (Devolu'#231#227'o)'
          TabVisible = False
          SkinData.CustomColor = True
          SkinData.CustomFont = False
          object sDBGrid3: TDBGrid
            Left = 0
            Top = 0
            Width = 1256
            Height = 185
            Align = alTop
            Color = clWhite
            DataSource = ds_nfe_ref
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Title.Alignment = taCenter
                Title.Caption = 'Ord'
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAVE_NFE'
                Title.Caption = 'Chave NF-e'
                Width = 930
                Visible = True
              end>
          end
          object gbChaveRef: TsGroupBox
            Left = 0
            Top = 190
            Width = 841
            Height = 74
            Caption = 'Chave NF-e Ref.'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
            object btnExcNfeDev: TSpeedButton
              Left = 370
              Top = 39
              Width = 100
              Height = 28
              Caption = 'Excluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
                33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
                03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
                33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
                0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
                3333333337FFF7F3333333333000003333333333377777333333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = btnExcNfeDevClick
            end
            object btnInsNfeDev: TSpeedButton
              Left = 259
              Top = 39
              Width = 100
              Height = 28
              Caption = 'Inserir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333333FF33333333FF333993333333300033377F3333333777333993333333
                300033F77FFF3333377739999993333333333777777F3333333F399999933333
                33003777777333333377333993333333330033377F3333333377333993333333
                3333333773333333333F333333333333330033333333F33333773333333C3333
                330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                333333333337733333FF3333333C333330003333333733333777333333333333
                3000333333333333377733333333333333333333333333333333}
              NumGlyphs = 2
              ParentFont = False
              OnClick = btnInsNfeDevClick
            end
            object btnCanNfeDev: TSpeedButton
              Left = 481
              Top = 39
              Width = 100
              Height = 28
              Caption = 'Cancelar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
                6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
                6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
                5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
                727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
                5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
                888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
                D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
                7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
                8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
                9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
                DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
                8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
                FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
                669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
                6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              OnClick = btnCanNfeDevClick
            end
            object edChaveNfeRef: TsEdit
              Left = 6
              Top = 14
              Width = 827
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 1000
              ParentFont = False
              TabOrder = 0
              OnChange = edChaveNfeRefChange
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = []
              BoundLabel.Layout = sclLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
          end
        end
        object tbRefComplementar: TsTabSheet
          Caption = 'NFe Ref. Complementar'
          TabVisible = False
          SkinData.CustomColor = True
          SkinData.CustomFont = False
          object gbNumDocRef: TsGroupBox
            Left = 5
            Top = 16
            Width = 96
            Height = 41
            Caption = 'N'#176' Documento'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object PrNumdoc_Ref: TsComboEdit
              Left = 4
              Top = 14
              Width = 89
              Height = 21
              AutoSize = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnExit = PrNumdoc_RefExit
              CheckOnExit = True
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = []
              BoundLabel.Layout = sclLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
              SkinData.SkinSection = 'EDIT'
              OnButtonClick = PrNumdoc_RefButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
          end
          object gbNFeRef: TsGroupBox
            Left = 103
            Top = 16
            Width = 67
            Height = 41
            Caption = 'NF-e'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
            object edNfe_Ref: TsEdit
              Left = 4
              Top = 14
              Width = 58
              Height = 21
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = []
              BoundLabel.Layout = sclLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
          end
          object gbChaveNfeRef: TsGroupBox
            Left = 172
            Top = 16
            Width = 362
            Height = 41
            Caption = 'Chave NF-e'
            TabOrder = 2
            SkinData.SkinSection = 'GROUPBOX'
            object ed_Chave_nfe_ref: TsEdit
              Left = 4
              Top = 14
              Width = 349
              Height = 21
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = []
              BoundLabel.Layout = sclLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
          end
        end
      end
    end
    object TaNFeDevol: TsTabSheet
      Caption = '&5) Nota Fiscal de Devolu'#231#227'o de Clientes'
      TabVisible = False
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object btnNfeDev: TSpeedButton
        Left = 372
        Top = 184
        Width = 129
        Height = 44
        Caption = 'NFe'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          B6160000424DB61600000000000036000000280000002F000000280000000100
          1800000000008016000000000000000000000000000000000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F3F4F4F5
          F5F5F3F1EDF1F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F3F4F3F4F3F5F4F7F7F1E4D9F1D3C1F3E8E2F4F5F6F3F4F3F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F5F5F5F4F4F4F5F5F5F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F3F5F5F3EEEBF9
          D1AEE7AC84EFCDB9F5EEEAF3F4F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F5F5F5F1F1F1E9E9E9E5E5E5E6E6E6EAEAEAF0F0F0F4F4F4
          F4F4F4F2F6F4F4F3F5F1DED4F4CDAEFFD8B6F8CDA6EBB088EFD4BFF5F1F1F4F5
          F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F5F4ECEAECD9D3D8D3CC
          D0D2CBD1D0CCCFCFCECED2D4D3DCDDDDE9E9E9F1F1F0F5DCCDFBD0ACFFD7B3FF
          D5B5FFD8B7FBD4AFEAA982F0DFCEF6F3F4F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F5F5F3EEF1CFD2CDA6C8AC7FB78D77B58694BDA0B8C4B9BBB4B7B1ABAE
          B5B4B6C9C1BAFACDABFFD7B5FFD6B5FFD6B5FFD5B5FFDBBBE9AB80ECAF89F2E6
          DEF4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3FBF5FCCCDCCD65B3791D883F4DA0
          6361A76B479D54258C413B985884AD959CACAFACA3AABBADA4F4C8A6FCD5B2FE
          D8B6FED7B6FBD3B2FAD2ABEDB286F2D8CAF4F5F7F3F4F4F3F4F3F3F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F6
          F5F6EDF0EB7FBD8D2B8C4CE8EBE5FFFFFF58DCE127C4BC5BC9B163B485238D44
          22945245B1A074AAB4B8A8A7E0BAA0F8CBA9F8CDADFCD4B3FFDAB9F4C39AF1D2
          C0F3F5F7F4F5F5F4F4F4F4F4F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F9F6F9CBE2CD419B5CA3C1ADFFF6FD63DD
          DD08B9B269C4C0DAE7ECF3FAFBD7E9DB6FB6841A8739249E6F22AAAD83A1A0E7
          B999F8CCA6F9CFAAFAD2B1F0BB94EFB38FF3E2DAF4F3F5F1F6F5F2F4F5F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FC
          F7FBB6DBBB2F924BD2CFCFE1EFF120CBC941BCB0E0CCCDF3F1F0F7F5F5F9F7FA
          FCF9F8BAD9C0439A56178F4E9EAE95DDB098DAB99CF4CBAEFED7B8F9D2ACE698
          66ECAF84EED0B9F3E4DCF4F1F3F4F2F2F3F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FCF7FBB2D5B5329250D5CFCFB6E4E412C6
          BE8AC2BDD6CED0F1F1F1F4F4F4F4F3F4F5F4F5FFFAFFDDECDD69B37F1C873BBF
          B993E0B099DBB79CF1C8A9FAD1B0FDD8B3E9A272E69967EDAF87EEC3A5EFC3A6
          F0D6C5F3EFF1F4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FB
          F7FBB7D9BC369551D0CAC9A0DDDF13C2BD9BC4C2D0CCCDEEEEEEF4F5F5F5F3F4
          F2F6F5F5F2F0F9D5C3EBCCAE8CC79312853AA4AD87D1A48FD5AF92F8CFAEFFD9
          B7FEDCBAFACFADEB9E6BEA9E6DEA9C6BEBA579F0D7C7F6F4F5F3F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FAF6F9C5E0CA409E5ABAC0B7A6D5DB15C4
          BD91C6C3CFC8C8EAEAEAF5F5F5F4F4F5F6F4F3D1B59E936A4E8265527C6A5881
          AC851083366A7D5B8A6A5DA68E76E8C1A5FCD2AFFAD3B1F9D0ADF9D5B2FBD8B6
          EAA778EDB18DF2E6DEF2F6F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8
          F5F7D7E9DA59AB7090B299BED0D51EC5C06CC6BECFC6C6E1E1E1F5F5F5F2F2F1
          E0E3E0E3DED9FDFFFFFFFFFFFFFFFFF6F6F49BC8A3188C3F5D6E515E4740927D
          67F5CBAAFFD7B8FFD7B6FFD8B5F9CEAEF6C99FE79863ECC5AAF4F1EEF3F4F5F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F4F5F2F3F17EBD8A5EA26FDBCED62DC4
          C43AC0B4D6C9CAD5D5D5F1F1F1FBFCFCFFFFFFFFFFFFFFFFFFFEFFFCFDFEFCFF
          FFFFFFFFFF9DD0AA1A8F43878969987162DBB99EF8D1B2FFD7B6FFD6B4FCD4B2
          FBD7B7EEAF84EBAE85F5E7E2F4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F3F4FCFAFCA9D3B0399656D5CBC95EC4C50EB9AECCCFCFCBC8C8F4F4F4FFFFFF
          FFFFFFC5BFB8CEAE96FDD2ADFBD2AEF9D0ACF7D0B4F8E3CE8DC79C1B8941D2B7
          9AD3AD95E6BFA1FDD3B3FFD6B5FFD6B6F8D0ABFAD3AFE89A6AF0D5C1F6F3F8F3
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3FBF5F9D4E6D553AB6C99B79C96C4
          C914BBB38CCBC5CAC3C4FFFFFFFFFFFFCCCBC8725C4AFCD2B0FED4B3FAD0ADF8
          CAA8FFD8B5FFD5B4F0D9B875B582268C44E5B9A0D0AE95EBC5A6FED5B3FFD7B6
          F9D0AFFAD2ACE99E6BEEC2A2F2F0EFF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3
          F4F3F5F4F5F7F6F691C497459C63DACDD32CB8B92DBCADDFD3D6FFFFFFFFFFFF
          847263987C68FDD3B1FFD9B7FFD7B5FDD4AEFFDCB9FFDAB8FFDCB9E8DDBE53A7
          69589B5FE3B59FD4B397F4CBACFFD6B5FFD8B5FAD4B4EEAE80EBB48FF2EEEAF4
          F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F4F3F3FAF8FAC4E0C74AA260B3C0
          AD74BDC20AB4A5AAD7D3FFFFFFFFFFFF7866547B6552AF927CB1937BB0937AB3
          9277AF8E76B2937BB1927BB69078AAB797228D4697A97ED9B096DCBA9DFAD3B1
          F9D1AFFAD3B2F3BE92ECB08BF5ECEAF4F6F6F3F4F4F3F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F4
          F4F4F4F4F4F5F4F5F4F5F386C2904E9E64CCCBD22BB0AE4FAF9CFFFFFFFFFFFF
          B8B0A8A89F94A99F95A99F95A99F96A99F96A99E94A99D94A99E95AAA2989381
          748EB68D12823AD8B89AD0A98CE7BF9DFFD6B6FFDABAEFB589EAAB81F2E4DBF2
          F4F6F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F3F4F4F3F4F4F4F4F5F4F4F4F4F4F5FCF9FCC7DFCD4DA6
          67A1AE8D99937B8E865AFFFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD7D37D6F5C70B27D44934EE5B4A0D8B397
          F7CDAEFFDABAEFB78AE99966ECB696F1E2D8F5F4F8F2F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F5F5F3F7F2
          ECEAF0D8C9F2D8CBF6EAE6F9F6F893C89F3F9A54CE9E7CE1B598F2E5DDFFFFFF
          EEECEA907F71B09E91FADCC7FDE2C9FAE0C7FBE1C8F7D8C0F8E4D0FFFFFFF4F5
          F1644334B1BB9B2C944FA0AF82D7AE95E1BDA1FED5B6FCD5B4E7A374E89B66EE
          C1A5F6EEEAF5F5F6F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F3F4F5F3EEEBF0D7C9ECC3A5EDA375E99E6EEAB997F8DBD0D8D5
          B663B37D77A878DFAF96DDBEA5FCFFFFFFFFFF8C76636C5945BA9B83FFD6B3FF
          D9B7FFD8B1FCD1ABFBE0C4FFFFFFFEFFFD634B3AC7A68EA4CCA421873DE0B89E
          D2AF95F2CCACFFD9B9F9D2AFE4935EEBA376EECAB4F3EEEBF2F5F6F4F4F4F3F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F3F5EFD3C0E99E70F3
          BF96F5CAA5F4C49AE99B69E69F70FFD3AEB4D2AF41A061B0AF86D5A589E3D9D3
          FFFFFFF7F4EF7F634F73604EAA927BE7C3A7FAD4B2F7CBA7F2E1CEFFFFFFEFEE
          EE6C5745E7B897E5D9B6449E6085A673DAAE97E4BD9EFFD6B6FAD4B3F2C398E6
          965EE9A473EFCFB9F7F1F4F3F4F4F4F3F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F3F2F5F6F3E8E4F1C09FF7CAA5F6CAA4FFDAB9FDD6B6FAD6B1F1B992F9CF
          A8FED8B88DC79B3F9D5CDCB599D1AD8FECEAEAFFFFFFF8F4F1967C6D69503F74
          5B478165519B8471FEFFFFFFFFFFBDB9B3AE8B6FFDD4B0FFD9BBACCAA01D8740
          DCB49BD3AE92F5CFAEF7CBAAF9D4B4F2BF93EA9763E9AD85F3E4DAF2F6F6F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F3F3F6F8F4E4D9FED5B1FED7B9FC
          D4B4FBD1B1FED5B4FED6B6FFD9B8FED4B5FDCFADE4D4B16CB7865BA565DEAF96
          D3A98CF1E6E6FFFFFFFFFFFFF5F4F2D9D5D4E1E1DEFFFFFFFFFFFFFCFFFFC0A0
          87F8CCA7FBD3AFFFD7B7E5D8B94AA1628BA071D5AC92E4BD9EFCD4B1FAD5B0FD
          DABAE9A16FE9A170F1D5C6F5F5F7F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F3F7FAF5D4B3FDD2B0FCD3B1FED6B5FFD6B5FFD6B5FFD5B5FFD5B4FFD6
          B5FED5B5FFD7B5C7D4B152A87083AE7DDFAB93D4AE8FEFD8C3FEF9F6FFFFFFFF
          FFFFFFFFFFFEFFFFFAF4EDEFCCB0FDD0A8FDD6B3FAD2AFFAD1AFFFD9BA9FC89D
          308C47DDAF95D6AD8FFACDADF9D0A9FAD6B6EDAF7DE7A06FF1D7C9F3F6F7F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F4F4F5F6F4EBE0FFD5B0FFD8B7FF
          D6B5FFD5B4FFD6B5FFD8B6FFD8B7FFD7B6FED6B4FFD7B6FFDABBB6D1AA40A061
          A1B084DBB096DAB495F3C6A4FCD2B2FDDABCFDDBBCFCD3B3FFD2AEF9D0ACFBD3
          B2FFD6B5FFD6B5FCD4B3FECDACD5D9B42F934EB8AE8BD4AB92F0C5A0F6CDA9FD
          D8B6E9A174EAAF85F2E3DAF4F4F6F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F3F3F4F4F4F4F5F6F8E9C4ACF3CAA8FFD6B3FFD6B5FCD4B2EFC7AAF1C8ABFCD2
          B3FFD7B5F5CDADF2C9AAFCD1B4A4CEA6399C5AB2B891DAAF94D9B59CF3C9ABFF
          D4B3FFD5B4FFD5B4FFD6B5F9CEAAF9D0ACFFD6B6FFD5B5FFD6B5FCD2AFF3D7B6
          6CB3796D9E67DBAE98EEC4A3FFD3B0F3CBA5DFBCA8F4E0D4F2F1F1F3F5F4F4F3
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F5F5F5EEEFF08F918E7F736CE9
          CAB0FFDABAE0BFA38A7768766350C7A78EFFE0C2C7AC95766354AE927AFEDCBB
          9AC99E399A5DBBB995D8B196D8B498EEC8A9FED5B3FFD6B5FFD6B5FFD7B6F9CF
          AFFFD6B5FFD6B4FFD6B5FAD1B0FFD7B7A5CA9E388C4CDFB29BC7A27F999F7DCF
          BBB1D7D6D7F0F5F4F4F4F5F4F3F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F3F3F3F5F5F5FFFFFFEEEEEE616465D0CDCBFBEFE1FFFFFFFFFFFF736154A688
          6FFFFFFEFFFFFF9A8E878D735DFFD6B5FAD9B98EC89B389B5BB7BA95DDB098D4
          B296EBC4A4FCD2B1FFD6B6FED6B5FFD6B5F7CFADFED6B6FFD8B6FFD8B5FECCA7
          C6D1AF2A8F46CCAC967DA69336BCB0D5CCCFCFCED0F2F2F2F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F3F3F3FFFFFFFFFFFF5F6062B3
          ABA9FFFFFFFFFFFFFFFFFF998C8191725CFDF0E1FFFFFFBDB7AE7A624FF4CEB0
          FFDEBDFCD9BA99CB9F379B5DACB88EE5B49BD0B094E5BEA2F8CFAFFFD5B5FFD7
          B6FAD2AFFFD9B9EFBF95F2D0B9F8E6DCD4E2D0399857B6BFB482C3C51BBEB5CA
          CFCECDCBCCEFEFEFF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F2F2F2FEFEFEFFFFFF767877A5A09FFFFFFFF1EFEFFFFFFFBDB5AE7B62
          4CEFDBC8FFFFFFDFDCD85E46369C7F68A7866CAF8B71CDB096A2CFA4399E5B8D
          B283E4B497D3AF96DDB89BFAC9ACFFD2AFF0C29EE9BF9FF0DED3F5F0F3F9F8FC
          DDEBDE439E60A9B7A895CCC91EC1B7BEC9CBCECBCBEFEFEFF4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3FBFBFBFFFFFF989796C0
          C2C0FFFFFF9B8C82FFFFFFDEDBD8695543DCC2A6FFFFFFFEFFFFD2CDC9D4D0CF
          D8D4D3908177997F67FFD8B9B4D2AB4CA5685EA66ED7BB9AD8AB926A967EA0AB
          A2C8BABACCCCCEE2E2E3EFF0F0FAF6F9D9E7D93E9A59AFBAAE96D3D319C0B5BC
          C4C5D3CFD0F2F2F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F3F3F3F8F8F8FFFFFFB3B3B3FBFCFCE7E5E2896C57FFFFFFFFFFFF644F
          43C5A489FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECD8F9CDABFFDAB7FFD6B5CB
          D1AE6FB4833E9C5A7DA97D40AAA204989053A7A5B0B2B1BFB5B6C7C3C3D6D0D5
          B5D5BA298B48DACCCE6DD5D21FB9AFCAC3C4E1DDDEF5F5F5F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3F5F5F5FFFFFFF7F7F7FF
          FFFFA9A6A5B09F91FFFFFFFFFFFF6D6E6DA07C63FFFFF9FFFFFF88796C684E3D
          AEA7A3B2A293BAA28DDFB698F9CFB3FFD5B4F2D8B69CC9A04BA3624FA36957BB
          A126ACA1119D9651A4A590A3A8AFB8AD6FB17B59976599CFD426C4B85EBBB5DB
          CFD0EFEFEFF5F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F3F3F3F3F3F3FFFFFFFFFFFFFFFFFF777A79D7DBDCFEFFFFFFFFFF9695
          9493725DFBEFE2FFFFFFDFDCD8BBB2ACBDBEBFC4C4C86F7073A5A4A3F9F9FAF2
          F7F7FCD4B4FCC7A9DAE2CE88C2984FA05E4A9E5B54AC794FAE8155B38846A463
          27904E34BDB313BBAF34BBB2E0D7D8EEECECF5F5F5F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2FFFFFFFFFFFFF9
          F9F9D9D9D9F3F3F3FAFAFAFFFFFFEEE8E3DDCABEF5EFECFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5E5E5E2E2E3F5F5F5F3F5F7F4E8DFF4E1D3F9F3F3FDFAFFE1ED
          E4B4D5B97EB98B62AA7462AB757AC3A057D1CB56CDCCA0DEDAF8EEEFF6F3F3F5
          F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
          F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3F4F4F4F6F6F6F4F4F4F3F3F3F4F3F3F3F7
          F6F5F8FAF5F5F4F2F3F5F0DDCFF3ECEBF2F3F3F3F3F3F6F6F6F6F6F6F4F4F4F4
          F4F3F4F4F7F3F4F7F4F4F4F2F4F4F7F5F6FBF8FBFFFBFFFFFCFFFFFCFFFFF9FE
          FFF8FAFFF8F8FEF6F7F7F4F4F6F4F4F3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3
          F3F3F4F4F4F4F4F4F3F3F3F3F3F3F4F3F4F4F4F3F3F3F4F4F4F4F5F5F7F5F4F4
          F3F3F3F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F4F4F3F4F3F3F4F3
          F4F4F3F4F3F3F4F4F3F4F4F3F3F3F4F3F4F4F4F4F4F4F4F4F4F3F4F4F3F4F3F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000}
        ParentFont = False
        OnClick = btnNfeDevClick
      end
      object btRecXml_Dev: TSpeedButton
        Left = 283
        Top = 245
        Width = 100
        Height = 28
        Caption = 'Rec. Xml'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          D6050000424DD605000000000000360000002800000018000000140000000100
          180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
          E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
          F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
          C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
          E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
          FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
          A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
          FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
          CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
          EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
          D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
          C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
          B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
          9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
          FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
          8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
          FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
          77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
          866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
          F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
          88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
          F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
          EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
          89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
          A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
          A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
          FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
          D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
          FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
          7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
          F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
          E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
          DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
          EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
          32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
          FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
          FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
        ParentFont = False
        Visible = False
      end
      object BtnDanfe_Dev: TSpeedButton
        Left = 395
        Top = 246
        Width = 100
        Height = 28
        Caption = 'DANFe'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
          FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
          9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
          FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
          C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
          FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
          16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
          F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
          A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
          00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
          928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
          89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
          D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
          9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
          C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
          ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
          C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
          D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
          00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
          66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
          99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
          A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
          ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
          C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
          D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
          E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
          B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
          FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
          DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
          FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
          00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
          9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
          36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
          FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
          D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
          000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
          00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
          9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
          FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
          FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
          B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
          00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
        ParentFont = False
        OnClick = BtnDanfe_DevClick
      end
      object BtnEmailNFe_Dev: TSpeedButton
        Left = 507
        Top = 246
        Width = 100
        Height = 28
        Caption = 'Email NFe'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000BF8281BC8181
          BA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B
          7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA
          7B7ABF8281BC8181D99D83FFC988FFC587FFC487FFC487FFC487FFC487FFC487
          FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC587FFC2
          87CB8F82BB7F81BA7B7ABF8281D79983C18781E0A98EFCCB99F8C697F8C697F8
          C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697
          F8C697FCCB99D8A18BC18481CC9286BA7B7ABA7F80E1A98AD99E86BC8282EFC5
          A1F7D0A6F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4
          CCA5F4CCA5F4CCA5F7D0A6E7BA9DBC8181E2AB8EDDA990BA7B7ABA7E7ED9AB98
          F7C99CC98A7FCE9D92F3D7B7F2D4B6F0D3B5F0D3B5F0D3B5F0D3B5F0D3B5F0D3
          B5F0D3B5F0D3B5F0D3B5F0D3B5F2D4B6EDCBB1C18987CC9286F8D5AFD8AB9CBA
          7B7ABA7D7BD4ACA3F7DCBBEDB791BF817FDAB6AAEFDCC6EDD8C4EDD8C4EDD8C4
          EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4F0DEC7D3A99FBD7F7BE7BD
          A1F3E1C9D4ACA3BA7B7ABA7D7BD4AFA7EFE3D3F4D5B4D79C86BC8484E7D5C9ED
          E1D1EBDDCEEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCEEDE3D3DDC2B7
          BC807FDEAF97F0DEC7EEE5D5D4AFA7BA7B7ABA7D7BD5B1ACF3EBE0F2E2D1F2C7
          A4C7897BCCA19EEDE2D7EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9F0
          E7DCEDDED4C18B8ACB9186F3DCC4F0E5D9F3EBE0D5B1ACBA7B7ABA7B7AD8B5B1
          F7F3EAF3EBE3F8E6D0F2C09CB67B77D3B5B1F7F2E9F4EDE3F4EDE3F4EDE3F4ED
          E3F4EDE3F4EDE3F4EDE3CFA4A1C1827BEECCB5F6EFE3F3EBE3F8F3EAD8B5B1BA
          7B7ABA7B7ADAB8B5FBFBF3F8F4EFFAF4EDEDCAB5C1837ABC807FCB9C99CC9E9A
          CC9D9ACC9D9ACC9E9ACC9D9ACC9C99C6908EB87777D19E96F7EBDEFAF8F2F7F3
          EBFBFBF3DAB8B5BA7B7ABA7A79DDBCBBFFFFFFFCFBF7D5AFACBA7B7AC69393D8
          B8B8C69393BD8382BF8484BF8484BD8483BF8686C49593CFB5B4CBA7A6BC7D7D
          C99392EFE0DDFFFFFFFFFFFFDDBCBBBA7B7ABA7A79E1C4C2F0E2E2CB9A99BC80
          7FD7B2B2F3F2F0FBFFFFF4FBFCEFF6F7EFF6F7EDF6F7EDF6F7E9F6F7E9FBFBED
          FFFFE9FFFFD7CCCBC19291BD7F7ED9B5B4FBF7F7E1C4C2BA7B7ABC7F7FCE9D9C
          C48684C08686E9D7D7FFFFFFFBFFFFF7FFFFF7FFFFF3FFFFF3FFFFEFFFFFEFFF
          FFEDFFFFE9FFFFE9FFFFE7FFFFE9FFFFE2F4F4C9A9A9BA7D7BC99392CFA4A1BA
          7B7ABF8281B68080BAB4B6F7F2F2FFFFFFFBFFFFFAFFFFF7FFFFF7FFFFF3FFFF
          F2FFFFEFFFFFEDFFFFEDFFFFE9FFFFE9FFFFE7FFFFE7FFFFE7FFFFE7FFFFDCE3
          E3CBA5A4BF8281BA7B7AC17E7DA19DA09EFCFFFFFFFFFEFFFFFBFFFFFAFFFFF7
          FFFFF7FFFFF3FFFFF2FFFFEFFFFFEFFFFFF2FFFFEFFFFFF2FFFFEFFFFFE9FFFF
          E2F8FADCF4F6CFEEF2B7DEE3AD9EA0BA7B7AC0817FAB9092ACE3E9FFFFFFFEFF
          FFFBFFFFFBFFFFFAFFFFFBFFFFFBFFFFFBFFFFF2FFFFE9F6F7D3E7E9C1DADDAF
          CCD3A0C1C990B4C183A9B8739EB26C9DB57F8E9CA48082BA7B7AFF00FFBB7A79
          BA7D7BFFFFFFFFFFFFFBFFFFF7FFFFEBFAFBD4EAEBC0DEE1AFD5D992C6CC75B1
          BA6CADBA6BB0BF69B1C668B2CA6CB6D46DBBDE72BFE591A4BABC807FBF817FFF
          00FFFF00FFFF00FFC17E7DBA7D7BA19FA397F4FF86F7FF78E5F26FD3DE6CD1DE
          68D7E26BDDEA6FE5F372E6F874E2F775DEF776DCF873DCFC7ACCEDA997A0C081
          7FBF8180FF00FFFF00FFFF00FFFF00FFFF00FFBA7D7BB87E7BA19FA37EDAE56F
          F3FF72F0FF74EFFF74F0FF74F0FF74F0FF74EFFF75EBFC74E7FE73E5FE87C2D7
          AF9298C27F7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFC17E7DBD838299B5BA73F3FF70F6FF74F0FF74EFFF74EFFF72F0FF70F6FF76
          E7F89EAAB1BF8180C17E7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFBF817FC07F7EA7A1A583D7E072F4FF6FF7FF6FF7
          FF74F0FF83D8E1AC9C9DC27D7ABF8180FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC27D7ABC8483
          A6A1A499B5BA99B5BAAB9C9DBC8282C17E7DFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBF8180C17E7DC27D7AC27D7AC17E7DFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        OnClick = BtnEmailNFe_DevClick
      end
      object sGroupBox1: TsGroupBox
        Left = 67
        Top = 6
        Width = 227
        Height = 42
        Caption = 'Chave N'#176
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object PrChave_NFe_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 214
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox2: TsGroupBox
        Left = 295
        Top = 6
        Width = 110
        Height = 42
        Caption = 'N'#176' Recibo'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object PrRECIBO_NFE_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 99
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox4: TsGroupBox
        Left = 611
        Top = 6
        Width = 110
        Height = 42
        Caption = 'N'#176' Protocolo'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object PrPROTOCOLO_NFE_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 99
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox5: TsGroupBox
        Left = 723
        Top = 6
        Width = 174
        Height = 42
        Caption = 'Data Recebimento'
        Enabled = False
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        object PrDATA_REC_NFE_DEV: TDateTimePicker
          Left = 6
          Top = 14
          Width = 153
          Height = 21
          Date = 36892.000011574070000000
          Format = 'dd/MM/yyyy HH:mm:ss'
          Time = 36892.000011574070000000
          DateMode = dmUpDown
          TabOrder = 0
        end
      end
      object sGroupBox6: TsGroupBox
        Left = 67
        Top = 54
        Width = 782
        Height = 42
        Caption = 'Motivo'
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object PrMotivo_nfe_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 771
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox7: TsGroupBox
        Left = 8
        Top = 54
        Width = 57
        Height = 42
        Caption = 'Situa'#231#227'o'
        TabOrder = 5
        SkinData.SkinSection = 'GROUPBOX'
        object PrStatus_Nfe_DEV: TsEdit
          Left = 11
          Top = 14
          Width = 35
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object gbCancNFeDev: TsGroupBox
        Left = 8
        Top = 102
        Width = 841
        Height = 76
        Caption = 'Cancelamento Justificativa'
        TabOrder = 6
        SkinData.SkinSection = 'GROUPBOX'
        object LBsTATUSCANCEL_DEV: TsLabel
          Left = 515
          Top = 49
          Width = 318
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prazo Limite para o Cancelamento: 15/12/2010 10:00:00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object BtnEnviarCancelamentoNFeDev: TSpeedButton
          Left = 284
          Top = 41
          Width = 100
          Height = 28
          Caption = 'Enviar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            D6050000424DD605000000000000360000002800000018000000140000000100
            180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
            E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
            F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
            C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
            E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
            FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
            A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
            FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
            CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
            EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
            D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
            C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
            B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
            9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
            FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
            8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
            FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
            77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
            866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
            F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
            88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
            F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
            EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
            89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
            A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
            A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
            FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
            D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
            FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
            7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
            F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
            E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
            DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
            EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
            32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
            FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
            FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
          ParentFont = False
          OnClick = BtnEnviarCancelamentoNFeDevClick
        end
        object BtnEditarCancelamentoNFeDev: TSpeedButton
          Left = 173
          Top = 41
          Width = 100
          Height = 28
          Caption = 'Editar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
            8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
            F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
            83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
            A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
            F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
            83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
            6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
            FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
            79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
            A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
            FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
            69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
            7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
            FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
            5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
            F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
            F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
            FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
            CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
            A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
          ParentFont = False
          Spacing = 0
          OnClick = BtnEditarCancelamentoNFeDevClick
        end
        object BtnSairCancelamentoNFeDev: TSpeedButton
          Left = 395
          Top = 41
          Width = 100
          Height = 28
          Caption = 'Cancelar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
            6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
            669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
            6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
            9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
            5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
            727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
            9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
            5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
            888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
            9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
            D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
            7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
            9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
            DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
            8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
            9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
            DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
            8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
            FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
            669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
            6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          OnClick = BtnSairCancelamentoNFeClick
        end
        object PrJUSTIF_CANC_NFE_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 827
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 255
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = PrJUSTIF_CANC_NFE_DEVChange
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox9: TsGroupBox
        Left = 8
        Top = 6
        Width = 57
        Height = 42
        Caption = 'N'#186' NFe'
        TabOrder = 7
        SkinData.SkinSection = 'GROUPBOX'
        object PrNFE_Dev: TsEdit
          Left = 6
          Top = 14
          Width = 44
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object sGroupBox3: TsGroupBox
        Left = 407
        Top = 6
        Width = 202
        Height = 42
        Caption = 'Digest Value'
        TabOrder = 8
        SkinData.SkinSection = 'GROUPBOX'
        object PrDIGEST_NFE_DEV: TsEdit
          Left = 6
          Top = 14
          Width = 190
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
      object PrEntradaNaoDevolucao: TCheckBox
        Left = 520
        Top = 200
        Width = 117
        Height = 17
        Caption = 'N'#227'o '#233' Devolu'#231#227'o?'
        TabOrder = 9
      end
    end
    object TaAgrupar: TsTabSheet
      Caption = '&6) Agrupar Pedidos'
      TabVisible = False
      SkinData.CustomColor = True
      SkinData.CustomFont = False
      object sPanel7: TPanel
        Left = 0
        Top = 0
        Width = 1264
        Height = 23
        Align = alTop
        Caption = 'AGRUPAR PEDIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          1264
          23)
        object Shape10: TShape
          Left = -711
          Top = 5
          Width = 14
          Height = 15
          Anchors = [akTop, akRight]
          ExplicitLeft = 1102
        end
        object sLabel10: TsLabel
          Left = -692
          Top = 5
          Width = 112
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'N'#227'o Selecionados'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ExplicitLeft = -268
        end
        object Shape6: TShape
          Left = -853
          Top = 5
          Width = 14
          Height = 15
          Anchors = [akTop, akRight]
          Brush.Color = clTeal
          ExplicitLeft = 960
        end
        object sLabel9: TsLabel
          Left = -834
          Top = 5
          Width = 84
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Selecionados'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ExplicitLeft = -410
        end
      end
      object dgPedidosAgrupar: TDBGrid
        Left = 0
        Top = 23
        Width = 1264
        Height = 106
        Align = alTop
        Color = clWhite
        DataSource = ds_pedidos_agrupar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dgPedidosAgruparCellClick
        OnDrawColumnCell = dgPedidosAgruparDrawColumnCell
        OnDblClick = dgPedidosAgruparDblClick
        OnEnter = dgPedidosAgruparEnter
        OnKeyDown = dgPedidosAgruparKeyDown
        OnKeyUp = dgPedidosAgruparKeyUp
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMDOC'
            Title.Alignment = taCenter
            Title.Caption = 'N'#176' Pedido'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTADOC'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 399
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTE'
            Title.Caption = 'Vendedor'
            Width = 288
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_BRUTO'
            Title.Alignment = taCenter
            Title.Caption = 'T.Bruto'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOT_LIQUIDO'
            Title.Alignment = taCenter
            Title.Caption = 'T.L'#237'quido'
            Width = 65
            Visible = True
          end
          item
            ButtonStyle = cbsNone
            Expanded = False
            FieldName = 'AGRUPADO'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Width = 20
            Visible = True
          end>
      end
      object sPanel6: TPanel
        Left = 0
        Top = 129
        Width = 1264
        Height = 24
        Align = alTop
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBMemo2: TDBMemo
        Left = 0
        Top = 153
        Width = 1264
        Height = 65
        Align = alTop
        DataField = 'OBSERVACOES_PEDIDO'
        DataSource = ds_pedidos_agrupar
        TabOrder = 3
      end
      object sPanel4: TPanel
        Left = 24
        Top = 218
        Width = 1016
        Height = 23
        Caption = 'ITENS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object sDBGrid2: TDBGrid
        Left = 0
        Top = 241
        Width = 1264
        Height = 109
        Align = alClient
        Color = clWhite
        DataSource = ds_itens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Produto'
            Width = 513
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VOLUME'
            Title.Alignment = taCenter
            Title.Caption = 'Volume'
            Width = 46
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ESTOQUE'
            Title.Alignment = taCenter
            Title.Caption = 'Estoque'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_BRUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Venda'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o'
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PERC_DESC'
            Title.Alignment = taCenter
            Title.Caption = '% Desc.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUB_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'Sub Tot.'
            Width = 70
            Visible = True
          end>
      end
      object sPanel1: TPanel
        Left = 0
        Top = 218
        Width = 1264
        Height = 23
        Align = alTop
        Caption = 'ITENS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object ckAgrupar: TDBCheckBox
        Left = 696
        Top = 184
        Width = 97
        Height = 17
        Caption = 'Agrupar'
        DataField = 'AGRUPADO'
        DataSource = ds_pedidos_agrupar
        TabOrder = 7
        Visible = False
      end
    end
  end
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 619
    Width = 1272
    Height = 36
    Align = alBottom
    Color = clWhite
    ParentColor = False
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object lbSituacao: TsLabel
      Left = 555
      Top = 13
      Width = 4
      Height = 16
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Btnovped: TSpeedButton
      Left = 25
      Top = 6
      Width = 95
      Height = 25
      Caption = '&INSERIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtnovpedClick
    end
    object Btaltped: TSpeedButton
      Left = 124
      Top = 6
      Width = 95
      Height = 25
      Caption = '&ALTERAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtaltpedClick
    end
    object Btgraped: TSpeedButton
      Left = 224
      Top = 6
      Width = 95
      Height = 25
      Caption = '&GRAVAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtgrapedClick
    end
    object Btcanped: TSpeedButton
      Left = 322
      Top = 6
      Width = 95
      Height = 25
      Caption = '&CANCELAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtcanpedClick
    end
    object Btexcped: TSpeedButton
      Left = 421
      Top = 6
      Width = 95
      Height = 25
      Caption = '&DESATIVAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtexcpedClick
    end
    object Btlocped: TSpeedButton
      Left = 619
      Top = 6
      Width = 95
      Height = 25
      Caption = '&LOCALIZAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtlocpedClick
    end
    object BtnEmailPedido: TSpeedButton
      Left = 1142
      Top = 6
      Width = 114
      Height = 25
      Caption = 'Email Pedido'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000BF8281BC8181
        BA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B
        7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA7B7ABA
        7B7ABF8281BC8181D99D83FFC988FFC587FFC487FFC487FFC487FFC487FFC487
        FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC487FFC587FFC2
        87CB8F82BB7F81BA7B7ABF8281D79983C18781E0A98EFCCB99F8C697F8C697F8
        C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697F8C697
        F8C697FCCB99D8A18BC18481CC9286BA7B7ABA7F80E1A98AD99E86BC8282EFC5
        A1F7D0A6F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4CCA5F4
        CCA5F4CCA5F4CCA5F7D0A6E7BA9DBC8181E2AB8EDDA990BA7B7ABA7E7ED9AB98
        F7C99CC98A7FCE9D92F3D7B7F2D4B6F0D3B5F0D3B5F0D3B5F0D3B5F0D3B5F0D3
        B5F0D3B5F0D3B5F0D3B5F0D3B5F2D4B6EDCBB1C18987CC9286F8D5AFD8AB9CBA
        7B7ABA7D7BD4ACA3F7DCBBEDB791BF817FDAB6AAEFDCC6EDD8C4EDD8C4EDD8C4
        EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4F0DEC7D3A99FBD7F7BE7BD
        A1F3E1C9D4ACA3BA7B7ABA7D7BD4AFA7EFE3D3F4D5B4D79C86BC8484E7D5C9ED
        E1D1EBDDCEEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCFEBDDCEEDE3D3DDC2B7
        BC807FDEAF97F0DEC7EEE5D5D4AFA7BA7B7ABA7D7BD5B1ACF3EBE0F2E2D1F2C7
        A4C7897BCCA19EEDE2D7EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9EFE5D9F0
        E7DCEDDED4C18B8ACB9186F3DCC4F0E5D9F3EBE0D5B1ACBA7B7ABA7B7AD8B5B1
        F7F3EAF3EBE3F8E6D0F2C09CB67B77D3B5B1F7F2E9F4EDE3F4EDE3F4EDE3F4ED
        E3F4EDE3F4EDE3F4EDE3CFA4A1C1827BEECCB5F6EFE3F3EBE3F8F3EAD8B5B1BA
        7B7ABA7B7ADAB8B5FBFBF3F8F4EFFAF4EDEDCAB5C1837ABC807FCB9C99CC9E9A
        CC9D9ACC9D9ACC9E9ACC9D9ACC9C99C6908EB87777D19E96F7EBDEFAF8F2F7F3
        EBFBFBF3DAB8B5BA7B7ABA7A79DDBCBBFFFFFFFCFBF7D5AFACBA7B7AC69393D8
        B8B8C69393BD8382BF8484BF8484BD8483BF8686C49593CFB5B4CBA7A6BC7D7D
        C99392EFE0DDFFFFFFFFFFFFDDBCBBBA7B7ABA7A79E1C4C2F0E2E2CB9A99BC80
        7FD7B2B2F3F2F0FBFFFFF4FBFCEFF6F7EFF6F7EDF6F7EDF6F7E9F6F7E9FBFBED
        FFFFE9FFFFD7CCCBC19291BD7F7ED9B5B4FBF7F7E1C4C2BA7B7ABC7F7FCE9D9C
        C48684C08686E9D7D7FFFFFFFBFFFFF7FFFFF7FFFFF3FFFFF3FFFFEFFFFFEFFF
        FFEDFFFFE9FFFFE9FFFFE7FFFFE9FFFFE2F4F4C9A9A9BA7D7BC99392CFA4A1BA
        7B7ABF8281B68080BAB4B6F7F2F2FFFFFFFBFFFFFAFFFFF7FFFFF7FFFFF3FFFF
        F2FFFFEFFFFFEDFFFFEDFFFFE9FFFFE9FFFFE7FFFFE7FFFFE7FFFFE7FFFFDCE3
        E3CBA5A4BF8281BA7B7AC17E7DA19DA09EFCFFFFFFFFFEFFFFFBFFFFFAFFFFF7
        FFFFF7FFFFF3FFFFF2FFFFEFFFFFEFFFFFF2FFFFEFFFFFF2FFFFEFFFFFE9FFFF
        E2F8FADCF4F6CFEEF2B7DEE3AD9EA0BA7B7AC0817FAB9092ACE3E9FFFFFFFEFF
        FFFBFFFFFBFFFFFAFFFFFBFFFFFBFFFFFBFFFFF2FFFFE9F6F7D3E7E9C1DADDAF
        CCD3A0C1C990B4C183A9B8739EB26C9DB57F8E9CA48082BA7B7AFF00FFBB7A79
        BA7D7BFFFFFFFFFFFFFBFFFFF7FFFFEBFAFBD4EAEBC0DEE1AFD5D992C6CC75B1
        BA6CADBA6BB0BF69B1C668B2CA6CB6D46DBBDE72BFE591A4BABC807FBF817FFF
        00FFFF00FFFF00FFC17E7DBA7D7BA19FA397F4FF86F7FF78E5F26FD3DE6CD1DE
        68D7E26BDDEA6FE5F372E6F874E2F775DEF776DCF873DCFC7ACCEDA997A0C081
        7FBF8180FF00FFFF00FFFF00FFFF00FFFF00FFBA7D7BB87E7BA19FA37EDAE56F
        F3FF72F0FF74EFFF74F0FF74F0FF74F0FF74EFFF75EBFC74E7FE73E5FE87C2D7
        AF9298C27F7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFC17E7DBD838299B5BA73F3FF70F6FF74F0FF74EFFF74EFFF72F0FF70F6FF76
        E7F89EAAB1BF8180C17E7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBF817FC07F7EA7A1A583D7E072F4FF6FF7FF6FF7
        FF74F0FF83D8E1AC9C9DC27D7ABF8180FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC27D7ABC8483
        A6A1A499B5BA99B5BAAB9C9DBC8282C17E7DFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFBF8180C17E7DC27D7AC27D7AC17E7DFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      Visible = False
      OnClick = BtnEmailPedidoClick
    end
    object BtnEnviarPedido: TSpeedButton
      Left = 1017
      Top = 6
      Width = 121
      Height = 27
      Caption = 'Enviar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFA46769A66A6BA6696BA6696AA6696AA5696AA5696AA5696AA6696AA6696AA4
        6769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFAA7070FFFED7FAE2B7FBE0ADF8D9A0F6D191F4CC86F3CA
        82F8D484FCD484A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA6F70FFF6D8F2D9BB8087CF2C46E6
        0323FB2B44DE7B79AFEEC280F4CB82A5696AFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB7572FFFCE682
        8CDC0222FE001EFF001EFF001EFF0221FC7F7EB0F4CB82A5696AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFAC7F75FFFFF62D4BF2001EFF001EFF001EFF001EFF001EFF2C46DEF6CE89A5
        696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB58374FFFFFF0323FE001EFF001EFF001EFF001EFF001E
        FF0323FBF8D396A5696AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9575FFFFFF2D4EFA001EFF001EFF
        001EFF001EFF001EFF2D48E6FFE0A4A6696AFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD59A77FFFFFF88
        9DFC0222FF001EFF001EFF001EFF0222FE8692D7E0C2A0A5686AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFDCA17DFFFFFFFFFFFF889EFF2E50FC0324FE2D4DF47E84D5CBAF98AF8B7BA3
        676BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDCA37EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF8F0E7BD90
        82A36B649F6B65AC6959A46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769FF00FFE7B082FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF4F6FAAF8282D18A4FD4894AFF00FFA46769FEE9C7F4DAB5F6D9ABF4D4
        A0F2CE95F0C788EFC581EEC580F4CC83EFC480A46769FF00FFE9B081FBFAFBFA
        F3EFFAF3EFFAF3EFFCF8F4EEE0D8B07F76B67660FF00FFFF00FFA46769FCEACE
        F3DABCF0D5B4F0D0A9EECB9EEDC693EAC088E9BC7FEFC581EFC480A46769FF00
        FFE6A978CF906CD1926DD1926DD1926DD1926D05620A0A6E12FF00FFFF00FFFF
        00FFA46769E7C6AC973D17963D16963C15963B13963A1395391195380FB4642F
        EFC480A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0052011A922F42E0
        75015503FF00FFFF00FFA7756BFFF4E5A4512C811E00811E00811E00811E0081
        1E00832001E0AB6FEFC583A46769FF00FFFF00FFFF00FFFF00FFFF00FF004F00
        1384233ED96F45E67A2DC24F015503FF00FFA7756BFFFFFCE6C7B2832101811E
        00811E00811E00811E00B06437F0CE93F2C98CA46769FF00FFFF00FFFF00FFFF
        00FF0155030F821C35C6603FDC6F30C65618A92D15A428015503BC8268FFFFFC
        FAF0E6B87555811E00811E00811E008A2B07EBC59CF3D3A0F3CE97A46769FF00
        FFFF00FFFF00FFFF00FF0155030155030155031CA03523BC4101550301550301
        5503D1926DFFFFFCFEF7F2F6E9E18E2F0C811E00811E00C48662F4D7B5FBDCAD
        F6D3A0A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004C000B7B161BB7
        33015503FF00FFFF00FFD1926DFFFFFCFFFFFFFFFEFECF9D84811E00983E19F8
        E5CCF8E3C5EBD9B7C5A48FA46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0154030978110EA51D015503FF00FFFF00FFDA9D75FFFFFCFFFFFFFFFFFFFFFE
        FE9A4420E0BBA5F4E3D1D5B19FB79280A77D70A46769FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF035F06067F0D069810015503FF00FFFF00FFDA9D75FFFFFC
        FFFFFFFFFFFFFFFFFFF3E7E0FFFEF8E6D5CCA56B5FA56B5FA56B5FAF6A56FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF03690706920E05840C015503FF00FFFF
        00FFE7AB79FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9DCA56B5FE1974E
        D38749FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF036E07068F0D05890C0155
        03FF00FFFF00FFFF00FFE7AB79FAF3EFFAF3EFFAF3EFFAF3EFFAF3EFFAF3EFDC
        C2B8A56B5FBF7D60FF00FF015503015503015403025C05056F0C057E0C04800B
        037208015503FF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD192
        6DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FF015503015503025C0402
        5B05025C04025803015403FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentFont = False
      Visible = False
      OnClick = BtnEnviarPedidoClick
    end
    object BtStatus: TSpeedButton
      Left = 520
      Top = 6
      Width = 95
      Height = 25
      Caption = '&STATUS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtStatusClick
    end
  end
  object ActionList1: TActionList
    Left = 736
    Top = 624
    object Ac_inserir: TAction
      Caption = 'Inserir'
      ShortCut = 112
    end
    object Ac_alterar: TAction
      Caption = 'Alterar'
      ShortCut = 113
    end
    object Ac_gravar: TAction
      Caption = 'Gravar'
      ShortCut = 114
    end
    object Ac_cancelar: TAction
      Caption = 'Cancelar'
      ShortCut = 115
    end
    object ac_localizar: TAction
      Caption = 'Localizar'
      ShortCut = 116
    end
  end
  object q_vendas1: TFDQuery
    Connection = dao.CN
    Left = 600
    Top = 384
  end
  object q_vendas2: TFDQuery
    Connection = dao.CN
    Left = 488
    Top = 304
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
    CorForm = clWhite
    CorFonte = clBlack
    Impressora = Grafico
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
    Left = 868
    Top = 336
  end
  object RDNOVNOT: TRDprint
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
    OpcoesPreview.PreviewZoom = 90
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
    CorForm = clWhite
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
    TamanhoQteLinhas = 98
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 739
    Top = 354
  end
  object RDIMPNOT: TRDprint
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
    OpcoesPreview.PreviewZoom = 90
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
    CorForm = clWhite
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
    TamanhoQteLinhas = 126
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 592
    Top = 642
  end
  object OD: TOpenDialog
    Filter = 'Arquivos XML|*.xml|Todos Arquivos|*.*'
    Title = 'Abrir Arquivo XML'
    Left = 704
    Top = 640
  end
  object XMLNFe: TXMLDocument
    Left = 696
    DOMVendorDesc = 'MSXML'
  end
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 612
    Top = 322
  end
  object mmVendas2: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'NOM_PRODUTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NCM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CESTA_BASICA'
        DataType = ftBoolean
      end
      item
        Name = 'QTD'
        DataType = ftFloat
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'IPI_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_IPI_ITEM'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_BC'
        DataType = ftCurrency
      end
      item
        Name = 'ICMS_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_ICMS_ITEM'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_AGR_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_BC_ST'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_ICMS_ST'
        DataType = ftCurrency
      end
      item
        Name = 'NUMDOC'
        DataType = ftInteger
      end
      item
        Name = 'DTADOC'
        DataType = ftDate
      end
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'COD_REPRESENTANTE'
        DataType = ftInteger
      end
      item
        Name = 'ID_COR'
        DataType = ftInteger
      end
      item
        Name = 'ID_TAMANHO'
        DataType = ftInteger
      end
      item
        Name = 'QTD_DEVOLVIDA'
        DataType = ftFloat
      end
      item
        Name = 'DEVOLVIDO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VOLUME'
        DataType = ftFloat
      end
      item
        Name = 'COD_EMPRESA'
        DataType = ftInteger
      end
      item
        Name = 'NR_PEDIDO_PALM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'SUB_TOTAL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_COMISSAO'
        DataType = ftCurrency
      end
      item
        Name = 'TROCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_FISCAL_ITEM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COD_SUPERVISOR'
        DataType = ftInteger
      end
      item
        Name = 'PRECO_LIQUIDO'
        DataType = ftFloat
      end
      item
        Name = 'QTD_ESTOQUE'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUE_MINIMO'
        DataType = ftFloat
      end
      item
        Name = 'QTD_RESERVADO'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'TRIB_ICMS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PRECO_CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'DESCONTO_MAXIMO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftCurrency
      end
      item
        Name = 'PERC_COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'GRADE_COMISSAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PROMOCAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PESO'
        DataType = ftFloat
      end
      item
        Name = 'PESO_TOTAL'
        DataType = ftFloat
      end
      item
        Name = 'CODIGO_BARRAS'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'PRECO_BASE'
        DataType = ftCurrency
      end>
    Left = 464
    Top = 368
    object mmVendas2ID: TIntegerField
      FieldName = 'ID'
    end
    object mmVendas2COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object mmVendas2NOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 100
    end
    object mmVendas2NCM: TStringField
      FieldName = 'NCM'
    end
    object mmVendas2CESTA_BASICA: TBooleanField
      FieldName = 'CESTA_BASICA'
    end
    object mmVendas2QTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '#,###,##0.00'
      EditFormat = '0.00'
    end
    object mmVendas2SUB_TOTAL: TFloatField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2IPI_ITEM: TFloatField
      FieldName = 'IPI_ITEM'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2VLR_IPI_ITEM: TFloatField
      FieldName = 'VLR_IPI_ITEM'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2VLR_BC: TFloatField
      FieldName = 'VLR_BC'
      EditFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2ICMS_ITEM: TFloatField
      FieldName = 'ICMS_ITEM'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2VLR_ICMS_ITEM: TFloatField
      FieldName = 'VLR_ICMS_ITEM'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2VLR_AGR_ITEM: TFloatField
      FieldName = 'VLR_AGR_ITEM'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2VLR_BC_ST: TFloatField
      FieldName = 'VLR_BC_ST'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2VLR_ICMS_ST: TFloatField
      FieldName = 'VLR_ICMS_ST'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2NUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object mmVendas2DTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object mmVendas2COD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object mmVendas2COD_REPRESENTANTE: TIntegerField
      FieldName = 'COD_REPRESENTANTE'
    end
    object mmVendas2ID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object mmVendas2ID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object mmVendas2QTD_DEVOLVIDA: TFloatField
      FieldName = 'QTD_DEVOLVIDA'
    end
    object mmVendas2DEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      Size = 1
    end
    object mmVendas2VOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object mmVendas2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object mmVendas2NR_PEDIDO_PALM: TStringField
      FieldName = 'NR_PEDIDO_PALM'
      Size = 7
    end
    object mmVendas2SUB_TOTAL_BRUTO: TFloatField
      FieldName = 'SUB_TOTAL_BRUTO'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2VLR_COMISSAO: TFloatField
      FieldName = 'VLR_COMISSAO'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2TROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object mmVendas2COD_FISCAL_ITEM: TStringField
      Alignment = taCenter
      FieldName = 'COD_FISCAL_ITEM'
      Size = 5
    end
    object mmVendas2COD_SUPERVISOR: TIntegerField
      FieldName = 'COD_SUPERVISOR'
    end
    object mmVendas2PRECO_LIQUIDO: TFloatField
      FieldName = 'PRECO_LIQUIDO'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2QTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object mmVendas2ESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object mmVendas2QTD_RESERVADO: TFloatField
      FieldName = 'QTD_RESERVADO'
    end
    object mmVendas2DESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2TRIB_ICMS: TStringField
      Alignment = taCenter
      FieldName = 'TRIB_ICMS'
      Size = 5
    end
    object mmVendas2PRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2DESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2PRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2PERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2GRADE_COMISSAO: TStringField
      FieldName = 'GRADE_COMISSAO'
      Size = 1
    end
    object mmVendas2PROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      Size = 1
    end
    object mmVendas2PESO: TFloatField
      FieldName = 'PESO'
    end
    object mmVendas2PESO_TOTAL: TFloatField
      FieldName = 'PESO_TOTAL'
    end
    object mmVendas2CODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Size = 13
    end
    object mmVendas2PRECO_BASE: TFloatField
      FieldName = 'PRECO_BASE'
    end
    object mmVendas2DESCONTO_VALOR: TFloatField
      FieldName = 'DESCONTO_VALOR'
      DisplayFormat = 'R$ #,###,##0.0000'
    end
    object mmVendas2NAO_VALIDAR_MARGEM: TStringField
      FieldName = 'NAO_VALIDAR_MARGEM'
      Size = 1
    end
    object mmVendas2CEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object mmVendas2DESCONTO_VALOR_GERAL: TFloatField
      FieldName = 'DESCONTO_VALOR_GERAL'
    end
  end
  object dsVendas2: TDataSource
    AutoEdit = False
    DataSet = mmVendas2
    Left = 520
    Top = 368
  end
  object ImageList1: TImageList
    Left = 152
    Top = 160
    Bitmap = {
      494C010101006409640910001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00F7FFF700EFFFFF00E7FFF700B5E7CE008CBDAD00E7FFFF00E7FFEF00FFFF
      FF00FFFFF700FFFFF700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      F700F7FFF700E7FFF700BDFFDE006BBD9C0052A57B00C6FFE700E7FFF700F7FF
      F700FFFFFF00FFF7F700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFF700FFFF
      F700EFFFF700D6FFEF007BDEAD00299C6300299C6B006BC69400DEFFEF00E7FF
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFF700FFFF
      F700EFFFEF00A5EFC60039B57B0018AD6B0021B5730029A56B009CE7B500DEFF
      E700FFFFF700FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF00FFFFFF00FFFFFF00F7FF
      F700D6FFE70063C68C0018A5630039D68C0031CE840029B57300399C6300DEFF
      EF00F7FFF700FFFFF700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00EFFFF700E7FF
      F70094DEB500218C52004AD6940042D6940052E79C0031BD7B0031A56B0073C6
      9C00DEFFEF00EFFFF700F7FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFEFF700FFFFFF00EFFFFF00CEFF
      F700429C730042B584005AD6940052D6940031B5730052D6940039B57B00319C
      6B0094E7BD00DEFFF700F7FFFF00F7F7EF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFF7F700D6FFF70063B5
      9C00319C73006BD6A5006BCE9C004AA56B0052AD73005AC68C0039BD840029AD
      7B00299C6B00C6FFF700E7FFF700FFFFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFEFF700FFFFFF00C6EFE7003984
      730052B5940052AD8C00529C73009CD6AD00A5E7BD004A9C6B0042C68C0031BD
      8C0031AD7B0063C69C00DEFFEF00F7FFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFF7FF00E7FFFF00CEFF
      FF007BC6AD0094DEC600D6FFEF00EFFFF700DEFFE7009CDEBD00319C6B005AD6
      A50029AD7B0029946B00ADF7CE00EFFFF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF7FF00FFFFFF00DEEFEF00DEFF
      F700DEFFFF00DEFFFF00EFFFF700F7FFF700EFFFF700CEFFE70094EFC6002994
      63004ABD8C00319C6B006BBD8C00CEFFDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF00FFFFFF00FFFFFF00F7F7
      F700FFFFFF00F7F7F700F7FFFF00EFFFF700EFFFFF00DEFFF700D6FFF70073BD
      94004AA5730063C6940021945A0084DEAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFFF00F7FFFF00FFFFFF00FFFF
      FF00FFEFEF00FFFFFF00FFFFFF00F7FFFF00E7FFF700E7FFF700D6FFE700D6FF
      EF0073C6940031945A0042BD8400399C6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 160
    object Funes1: TMenuItem
      Caption = 'Fun'#231#245'es'
      object ImprimirEtiquetadeTransporte1: TMenuItem
        Caption = 'Imprimir Etiqueta de Transportadora'
        ShortCut = 16496
        OnClick = ImprimirEtiquetadeTransporte1Click
      end
      object HistoricodeCompradoCliente1: TMenuItem
        Caption = 'Historico de Compra do Cliente'
        Visible = False
      end
      object ImprimirPedido1: TMenuItem
        Caption = 'Imprimir Pedido'
        object M1: TMenuItem
          Caption = 'Matricial'
          ShortCut = 16500
          OnClick = M1Click
        end
        object L2: TMenuItem
          Caption = 'Laser Sem Desconto'
          ShortCut = 16507
          OnClick = L2Click
        end
      end
      object imprimirLotedePedidos1: TMenuItem
        Caption = 'Imprimir Lote de Pedidos'
        ShortCut = 16499
        OnClick = imprimirLotedePedidos1Click
      end
      object CrditoCliente1: TMenuItem
        Caption = 'Cr'#233'dito Cliente'
        ShortCut = 16500
        Visible = False
      end
      object FaturamentoAvulso1: TMenuItem
        Caption = 'Faturamento Avulso'
        ShortCut = 16507
        Visible = False
        OnClick = FaturamentoAvulso1Click
      end
      object DesfaturarPedido1: TMenuItem
        Caption = 'Desfaturar Pedido'
        ShortCut = 16503
        Visible = False
        OnClick = DesfaturarPedido1Click
      end
      object CancelamentoAvulso1: TMenuItem
        Caption = 'Cancelamento Avulso'
        Enabled = False
        ShortCut = 16504
        Visible = False
        OnClick = CancelamentoAvulso1Click
      end
      object ImprimirPedidoDetalhado1: TMenuItem
        Caption = 'Imprimir Pedido Detalhado'
        ShortCut = 16501
        OnClick = ImprimirPedidoDetalhado1Click
      end
      object I1: TMenuItem
        Caption = 'Imprimir Original no Tablet/Notebook'
        ShortCut = 16502
        OnClick = I1Click
      end
    end
  end
  object q_foto: TFDQuery
    Connection = dao.CN
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode, uvRefreshMode, uvRefreshDelete, uvCountUpdatedRecords, uvCheckRequired, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.RefreshDelete = False
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'select p.cod_produto, p.subcategoria, s.imagem_bd, p.QTD_ESTOQUE' +
        ', p.QTD_RESERVADO, (p.QTD_ESTOQUE + p.QTD_RESERVADO) as qtd_tota' +
        'l, p.QTD_EMBALAGEM, p.UNIDADE'
      'from'
      '  produto p'
      'inner join subcategoria s on (s.ID = p.SUBCATEGORIA)'
      'where p.cod_produto =:produto')
    Left = 784
    Top = 624
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
      end>
    object q_fotocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_fotosubcategoria: TIntegerField
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
    end
    object q_fotoimagem_bd: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'imagem_bd'
      Origin = 'imagem_bd'
    end
    object q_fotoqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object q_fotoqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object q_fotoqtd_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_total'
      Origin = 'qtd_total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_fotoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_fotounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
  end
  object fR_RELATORIO: TfrxReport
    Tag = 1
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 46157.386623101860000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var linhas, linha_final : integer;'
      ''
      'procedure GroupHeader2OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '      linha_final := DetailData1.DataSet.RecNo;'
      'end;'
      ''
      'procedure GroupHeader2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  linhas := DetailData1.DataSet.RecNo - linha_final;'
      '//  showmessage(floattostr(linhas));'
      
        '  if ((engine.freespace) < (GroupHeader2.height + (DetailData1.h' +
        'eight * (linhas+1)) + (GroupFooter2.height))) then'
      '  begin'
      '//    showmessage(floattostr(linhas));'
      '    engine.NewPage;'
      '  end'
      '  else begin'
      '//    GroupFooter2.height := 5;'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 352
    Top = 160
    Datasets = <
      item
        DataSet = Dm.dst_configuracao
        DataSetName = 'dst_configuracao'
      end
      item
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
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
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 665.197280000000000000
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
        Height = 102.047310000000000000
        Top = 49.133890000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 616.842920000000000000
          Top = 1.000000000000000000
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
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 573.488560000000000000
          Top = 19.897650000000000000
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
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 67.354359999999990000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Listagem de  Pedido')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 99.180580000000000000
          Height = 101.149040000000000000
          Center = True
          DataField = 'LOGO'
          DataSet = Dm.dst_configuracao
          DataSetName = 'dst_configuracao'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        Condition = 'dst_palm_pedidos."COD_REPRESENTANTE"'
        KeepTogether = True
        ReprintOnNewPage = True
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
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."REPRESENTANTE"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 13.228346456692900000
        Top = 464.882190000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_palm_pedidos
        DataSetName = 'dst_palm_pedidos'
        KeepChild = True
        RowCount = 0
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 597.251997800000000000
          Top = 0.779530000000023000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'PRECO'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
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
            '[dst_palm_pedidos."PRECO"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 447.889685670000000000
          Top = 0.779530000000023000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          DataField = 'QTD'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
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
            '[dst_palm_pedidos."QTD"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 652.740570000000000000
          Top = 0.779530000000023000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          DataField = 'SUB_TOTAL'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
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
            '[dst_palm_pedidos."SUB_TOTAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 499.692942680000000000
          Top = 0.779530000000023000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
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
            '[dst_palm_pedidos."UNIDADE"]/[dst_palm_pedidos."VOLUME"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 391.645950000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'NCM'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_palm_pedidos."NCM"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 555.929500000000000000
          Width = 37.795278030000000000
          Height = 11.338590000000000000
          DataField = 'PERC_DESC'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
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
            '[dst_palm_pedidos."PERC_DESC"]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Width = 385.511699300000000000
          Height = 12.269572130000000000
          DataField = 'PRODUTO'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."PRODUTO"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 141.401670000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'GroupHeader2OnAfterPrint'
        OnBeforePrint = 'GroupHeader2OnBeforePrint'
        Condition = 'dst_palm_pedidos."NUMDOC"'
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
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."NUMDOC"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 0.755893309999976100
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'DTADOC'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_palm_pedidos."DTADOC"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 74.590600000000000000
          Top = 17.433073310000000000
          Width = 657.638220000000000000
          Height = 15.118120000000000000
          DataField = 'CLIENTE'
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."CLIENTE"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Top = 127.606370000000000000
          Width = 385.512060000000000000
          Height = 12.269572130000000000
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
          Left = 597.251997800000000000
          Top = 128.385900000000000000
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
          Left = 447.889685670000000000
          Top = 128.385900000000000000
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
          Left = 652.638220000000000000
          Top = 128.385900000000000000
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
          Left = 499.692942680000000000
          Top = 128.385900000000000000
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
          Top = 34.157526690000000000
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
            
              '[<dst_palm_pedidos."ENDERECO">], [<dst_palm_pedidos."NR_ENDERECO' +
              '">]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 51.913420000000000000
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
          Top = 51.551193310000000000
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
            '[dst_palm_pedidos."CEP"]')
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
          Top = 51.133890000000000000
          Width = 200.315090000000000000
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
            '[dst_palm_pedidos."CIDADE"]')
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
          Top = 69.031540000000000000
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
            '[<dst_palm_pedidos."CNPJ">]\[<dst_palm_pedidos."CPF">]')
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
          Top = 68.031540000000000000
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
            '[<dst_palm_pedidos."IE">]\[<dst_palm_pedidos."RG">]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 85.929190000000000000
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
          Width = 381.732530000000000000
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
            '[dst_palm_pedidos."EMAIL"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Forma de Pagto.:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 105.047310000000000000
          Top = 106.464613310000000000
          Width = 608.504330000000000000
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
            '[dst_palm_pedidos."FOP"] - [dst_palm_pedidos."PRAZO"] dias.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 86.929190000000000000
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
            'FONE:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 532.134200000000000000
          Top = 87.566963310000000000
          Width = 381.732530000000000000
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
            '[dst_palm_pedidos."TELEFONE"]')
          ParentFont = False
        end
        object mmPedidoDestino: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_palm_pedidos."NUMDOC_DESTINO"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 391.645950000000000000
          Top = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'NCM')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 555.929500000000000000
          Top = 128.944960000000000000
          Width = 37.795300000000000000
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
            '% Desc')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 102.047310000000000000
        Top = 502.677490000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
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
            '[SUM(<dst_palm_pedidos."SUB_TOTAL">,DetailData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 22.677180000000100000
          Width = 702.992580000000000000
          Height = 71.811070000000000000
          DataSet = Dm.dst_palm_pedidos
          DataSetName = 'dst_palm_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[dst_palm_pedidos."OBSERVACOES_PEDIDO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000020000
          Width = 37.795300000000000000
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
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 517.795610000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Liquido:')
          ParentFont = False
        end
      end
    end
  end
  object DS_CR2: TDataSource
    DataSet = q_cr1
    Left = 696
    Top = 304
  end
  object Q2S: TFDQuery
    Connection = dao.CN
    Left = 240
    Top = 48
  end
  object q_cr1: TFDQuery
    BeforeOpen = q_cr1BeforeOpen
    AfterScroll = q_cr1AfterScroll
    Connection = dao.CN
    SQL.Strings = (
      
        'select cr.id, cr.titulo, cr.sequencia, cr.dtaven, cast(coalesce(' +
        'cr.valor, 0) as numeric(15,2)) as valor, cr.cod_fop, fp.nom_fop,' +
        ' cr.dtarec, cast(Coalesce(cr.valor_recebido,0) as numeric(15,2))' +
        ' as valor_recebido, cr.BOLETO_REMESSA_ORDEM, fp.conta_padrao fro' +
        'm cr1 cr left join fop fp on fp.cod_fop=cr.cod_fop where cr.nr_d' +
        'ocumento ='#39'43398'#39' order by cr.dtaven')
    Left = 408
    Top = 288
    object q_cr1id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_cr1instrucao_boleto: TStringField
      FieldName = 'instrucao_boleto'
      Origin = 'instrucao_boleto'
      Size = 50
    end
    object q_cr1titulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      FixedChar = True
      Size = 6
    end
    object q_cr1sequencia: TIntegerField
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_cr1dtaven: TDateField
      FieldName = 'dtaven'
      Origin = 'dtaven'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object q_cr1valor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ReadOnly = True
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cr1cod_fop: TIntegerField
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_cr1nom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_cr1dtarec: TDateField
      FieldName = 'dtarec'
      Origin = 'dtarec'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object q_cr1valor_recebido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_recebido'
      Origin = 'valor_recebido'
      ReadOnly = True
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cr1boleto_remessa_ordem: TIntegerField
      FieldName = 'boleto_remessa_ordem'
      Origin = 'boleto_remessa_ordem'
    end
    object q_cr1conta_padrao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'conta_padrao'
      Origin = 'conta_padrao'
    end
  end
  object q_pedidos_agrupar: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        '        SELECT distinct a.NUMDOC, a.DTADOC, a.cod_cliente, a.COD' +
        '_CLIENTE||'#39'-'#39'||c.NOM_CLIENTE as cliente, a.TOT_BRUTO, a.TOT_LIQU' +
        'IDO,'
      
        '        a.COD_REPRESENTANTE||'#39'-'#39'||r.NOM_REPRESENTANTE as represe' +
        'ntante, '
      '        A.OBSERVACOES_PEDIDO,'
      
        '       case when A.NUMDOC_GRUPO is null then '#39'N'#39' else '#39'S'#39' end ag' +
        'rupado'
      '      FROM VENDAS1 a'
      '      INNER JOIN CLIENTE C ON C.COD_CLIENTE = A.COD_CLIENTE'
      
        '      left outer join REPRESENTANTE r on r.ID = a.COD_REPRESENTA' +
        'NTE'
      '      where'
      
        '            a.consignacao  <> '#39'1'#39' and a.orcamento= '#39'0'#39' and a.cod' +
        '_fop <> '#39'9'#39
      '        and A.FATURADO = 0 and'
      '        A.COD_CLIENTE = :cliente and'
      '        A.NUMDOC <> :grupo and '
      
        '        0 = (select faturado from vendas1 where numdoc = :grupo)' +
        ' and'
      '        (A.NUMDOC_GRUPO = :grupo OR A.NUMDOC_GRUPO IS NULL)'
      '      order by'
      '        numdoc desc, A.DTADOC desc')
    Left = 928
    Top = 312
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_pedidos_agruparNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'NUMDOC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_pedidos_agruparDTADOC: TDateField
      FieldName = 'DTADOC'
      Origin = 'DTADOC'
    end
    object q_pedidos_agruparCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
    end
    object q_pedidos_agruparCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 162
    end
    object q_pedidos_agruparTOT_BRUTO: TBCDField
      FieldName = 'TOT_BRUTO'
      Origin = 'TOT_BRUTO'
      Precision = 18
      Size = 2
    end
    object q_pedidos_agruparTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'TOT_LIQUIDO'
      Precision = 18
    end
    object q_pedidos_agruparREPRESENTANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTE'
      Origin = 'REPRESENTANTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 62
    end
    object q_pedidos_agruparOBSERVACOES_PEDIDO: TMemoField
      FieldName = 'OBSERVACOES_PEDIDO'
      Origin = 'OBSERVACOES_PEDIDO'
      BlobType = ftMemo
    end
    object q_pedidos_agruparAGRUPADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AGRUPADO'
      Origin = 'AGRUPADO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object ds_pedidos_agrupar: TDataSource
    DataSet = q_pedidos_agrupar
    Left = 932
    Top = 356
  end
  object q_itens: TFDQuery
    Connection = dao.CN
    Left = 968
    Top = 312
  end
  object ds_itens: TDataSource
    DataSet = q_itens
    Left = 972
    Top = 356
  end
  object XPManifest1: TXPManifest
    Left = 696
    Top = 376
  end
  object q_cce: TFDQuery
    Connection = dao.CN
    Left = 288
    Top = 168
  end
  object ds_cce: TDataSource
    AutoEdit = False
    DataSet = q_cce
    Left = 336
    Top = 200
  end
  object q_NFe_Ref: TFDQuery
    AfterOpen = q_NFe_RefAfterOpen
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.ID, a.CHAVE_NFE'
      'FROM NFE_REF_DEV a'
      'where a.NUMDOC = 28660')
    Left = 456
    Top = 200
    object q_NFe_RefID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object q_NFe_RefCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Origin = 'CHAVE_NFE'
      Size = 44
    end
  end
  object ds_nfe_ref: TDataSource
    DataSet = q_NFe_Ref
    Left = 488
    Top = 192
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpWinINet
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SC'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFEFR1
    Left = 372
    Top = 401
  end
  object qrGravaXmlCCe: TFDQuery
    Connection = dao.CN
    Left = 286
    Top = 48
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 4.000000000000000000
    MargemEsquerda = 4.000000000000000000
    MargemDireita = 0.500000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    ImprimeDetalhamentoEspecifico = False
    ExibeCampoFatura = False
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 399
    Top = 380
  end
  object qrGravaXml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE VENDAS1'
      'SET XML =:arquivo'
      'WHERE numdoc =:numdoc')
    Left = 342
    Top = 24
    ParamData = <
      item
        Name = 'arquivo'
        DataType = ftBlob
        FDDataType = dtBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'numdoc'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = Null
      end>
  end
  object q_xml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.xml, a.XML_DEV'
      'FROM vendas1 a'
      'where a.NUMDOC = :numdoc')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'NUMDOC'
        DataType = ftInteger
        FDDataType = dtUInt64
        ParamType = ptInput
      end>
    object q_xmlXML: TBlobField
      FieldName = 'XML'
      Origin = 'XML'
    end
    object q_xmlXML_DEV: TBlobField
      FieldName = 'XML_DEV'
      Origin = 'XML_DEV'
    end
  end
  object ds_xml: TDataSource
    DataSet = q_xml
    Left = 112
    Top = 160
  end
  object qrGravaXmlDev: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE VENDAS1'
      'SET XML_DEV =:arquivo'
      'WHERE numdoc =:numdoc')
    Left = 406
    Top = 8
    ParamData = <
      item
        Name = 'arquivo'
        DataType = ftBlob
        FDDataType = dtBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'numdoc'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = Null
      end>
  end
  object SaveFileDlg: TSaveTextFileDialog
    Filter = '*.xml'
    Left = 312
    Top = 576
  end
end
