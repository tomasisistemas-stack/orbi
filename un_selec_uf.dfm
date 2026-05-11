object fm_selec_uf: Tfm_selec_uf
  Left = 423
  Top = 171
  Caption = 'Consulta'
  ClientHeight = 331
  ClientWidth = 209
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
    Top = 0
    Width = 209
    Height = 226
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 207
      Height = 205
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitTop = -5
    end
    object LabAtualizarCaptcha: TsLabel
      Left = 1
      Top = 206
      Width = 207
      Height = 19
      Cursor = crHandPoint
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'Atualizar Captcha'
      ParentFont = False
      OnClick = LabAtualizarCaptchaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 226
    Width = 209
    Height = 105
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object lbCaptcha: TsLabel
      Left = 66
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Digite o Captcha'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbuf: TsLabel
      Left = 42
      Top = 53
      Width = 64
      Height = 13
      Caption = 'Informe a UF:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cbUF: TsComboBox
      Left = 108
      Top = 49
      Width = 57
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'SC'
      Items.Strings = (
        'SC'
        'PR'
        'RS')
    end
    object BtnOK: TsBitBtn
      Left = 79
      Top = 75
      Width = 50
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edCaptcha: TsEdit
      Left = 12
      Top = 24
      Width = 185
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 184
    Top = 290
  end
  object ACBrConsultaCNPJ1: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 96
    Top = 168
  end
  object ACBrConsultaCPF1: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 160
    Top = 160
  end
end
