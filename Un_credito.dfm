object Fr_credito: TFr_credito
  Left = 363
  Top = 339
  Width = 770
  Height = 330
  Caption = 'Sele'#231#227'o de Cr'#233'ditos'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]  
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 252
    Width = 762
    Height = 51
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 8
      Top = 8
      Width = 130
      Height = 13
      Caption = 'Total de Cr'#233'ditos Marcados'
    end
    object EdValor: TsCurrencyEdit
      Left = 11
      Top = 23
      Width = 121
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn1: TsBitBtn
      Left = 560
      Top = 4
      Width = 175
      Height = 43
      Caption = 'Utilizar Cr'#233'ditos Marcados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 251
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Label2: TsLabel
      Left = 13
      Top = 38
      Width = 102
      Height = 13
      Caption = 'N'#186' Venda Original'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object Label3: TsLabel
      Left = 140
      Top = 38
      Width = 54
      Height = 13
      Caption = 'Nr_Troca'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object Label4: TsLabel
      Left = 271
      Top = 38
      Width = 28
      Height = 13
      Caption = 'Data'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object Label5: TsLabel
      Left = 405
      Top = 38
      Width = 30
      Height = 13
      Caption = 'Valor'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object zzcliente: TsLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 20
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object CL_creditos: TCheckListBox
      Left = 1
      Top = 53
      Width = 760
      Height = 197
      OnClickCheck = CL_creditosClickCheck
      Align = alBottom
      Flat = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
    end
  end
end
