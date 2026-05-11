object frm_alterar_status_ordem_producao: Tfrm_alterar_status_ordem_producao
  Left = 0
  Top = 0
  Caption = 'Alterar Status Ordem de Produ'#231#227'o.'
  ClientHeight = 87
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 50
    Width = 274
    Height = 37
    Align = alBottom
    TabOrder = 0
    object btOK: TButton
      Left = 93
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 50
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object gbStatus: TGroupBox
      Left = 5
      Top = 2
      Width = 264
      Height = 42
      Caption = 'Status'
      TabOrder = 0
      object cbStatus: TComboBox
        Left = 3
        Top = 18
        Width = 258
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = #192' PRODUZIR'
        Items.Strings = (
          #192' PRODUZIR'
          'EM PRODU'#199#195'O'
          'CANCELADO'
          'FINALIZADO')
      end
    end
  end
end
