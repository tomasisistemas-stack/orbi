object frm_alterar_status_pedido: Tfrm_alterar_status_pedido
  Left = 0
  Top = 0
  Caption = 'Alterar Status Pedido.'
  ClientHeight = 87
  ClientWidth = 202
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
    Width = 202
    Height = 37
    Align = alBottom
    TabOrder = 0
    object btOK: TButton
      Left = 61
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
    Width = 202
    Height = 50
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object gbStatus: TGroupBox
      Left = 5
      Top = 2
      Width = 193
      Height = 42
      Caption = 'Status'
      TabOrder = 0
      object cbStatus: TComboBox
        Left = 3
        Top = 16
        Width = 186
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = #192' DIGITAR'
        Items.Strings = (
          #192' DIGITAR'
          #192' CONFERIR'
          #192' FATURAR'
          'PENDENTE')
      end
    end
  end
end
