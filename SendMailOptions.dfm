object FormSendMailOptions: TFormSendMailOptions
  Left = 529
  Top = 277
  ActiveControl = EditDestinatarios
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Enviar relat'#243'rio via E-mail'
  ClientHeight = 274
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelOpcoes: TsPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 11
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Destinat'#225'rio(s):'
    end
    object Label2: TsLabel
      Left = 12
      Top = 48
      Width = 244
      Height = 13
      Caption = 'Separe v'#225'rios destinat'#225'rios com ponto-e-v'#237'rgula ";".'
    end
    object Label3: TsLabel
      Left = 11
      Top = 68
      Width = 84
      Height = 13
      Caption = 'Linha de assunto:'
    end
    object GroupBoxFormato: TsGroupBox
      Left = 12
      Top = 112
      Width = 237
      Height = 89
      Caption = ' Escolha o formato do relat'#243'rio: '
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object RadioButtonEXE: TRadioButton
        Left = 8
        Top = 16
        Width = 217
        Height = 17
        Caption = 'Auto-imprim'#237'vel'
        Checked = True
        TabOrder = 0
        TabStop = True
        Visible = False
      end
      object RadioButtonPDF: TRadioButton
        Left = 8
        Top = 32
        Width = 217
        Height = 17
        Caption = 'Documento PDF (Acrobat Reader)'
        TabOrder = 1
      end
      object RadioButtonRTF: TRadioButton
        Left = 8
        Top = 48
        Width = 217
        Height = 17
        Caption = 'Formato RichText (Word e OpenOffice)'
        TabOrder = 2
      end
      object RadioButtonHTM: TRadioButton
        Left = 8
        Top = 64
        Width = 217
        Height = 17
        Caption = 'P'#225'gina Web (HTML)'
        TabOrder = 3
      end
    end
    object EditDestinatarios: TsEdit
      Left = 11
      Top = 24
      Width = 370
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
    object EditAssunto: TsEdit
      Left = 11
      Top = 84
      Width = 370
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
    object CheckBoxAbrir: TsCheckBox
      Left = 12
      Top = 212
      Width = 248
      Height = 20
      Caption = 'Abrir a mensagem para configurar outras op'#231#245'es'
      Checked = True
      State = cbChecked
      TabOrder = 3
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object PanelSubmit: TsPanel
    Left = 0
    Top = 233
    Width = 393
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      393
      41)
    object BitBtnEnviar: TsBitBtn
      Left = 212
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Enviar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      Style = bsNew
      TabOrder = 0
      OnClick = BitBtnEnviarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BitBtnCancelar: TsBitBtn
      Left = 300
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Style = bsNew
      TabOrder = 1
      OnClick = BitBtnCancelarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
