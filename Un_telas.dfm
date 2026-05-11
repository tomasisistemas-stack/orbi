object Fr_telas: TFr_telas
  Left = 338
  Top = 166
  BorderStyle = bsSingle
  Caption = 'Consulta ao Log do Sistema'
  ClientHeight = 505
  ClientWidth = 1001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pncab: TsPanel
    Left = 0
    Top = 0
    Width = 1001
    Height = 35
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 5
      Top = 9
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 647
      Top = 9
      Width = 44
      Height = 13
      Caption = 'M'#225'quina:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label3: TsLabel
      Left = 357
      Top = 9
      Width = 56
      Height = 13
      Caption = 'Hora Inicial:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label4: TsLabel
      Left = 165
      Top = 9
      Width = 51
      Height = 13
      Caption = 'Data Final:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label5: TsLabel
      Left = 499
      Top = 9
      Width = 51
      Height = 13
      Caption = 'Hora Final:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object btok: TsBitBtn
      Left = 889
      Top = 4
      Width = 95
      Height = 27
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btokClick
      SkinData.SkinSection = 'BUTTON'
    end
    object cbMaquina: TComboBox
      Left = 697
      Top = 6
      Width = 176
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object Ed_Hr_ini: TMaskEdit
      Left = 416
      Top = 6
      Width = 65
      Height = 21
      EditMask = '!99:99;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object Ed_Hr_Fim: TMaskEdit
      Left = 552
      Top = 6
      Width = 67
      Height = 21
      EditMask = '!99:99;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
    end
    object Eddt_Fim: TsDateEdit
      Left = 223
      Top = 6
      Width = 91
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
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
    object EdDt_ini: TsDateEdit
      Left = 63
      Top = 6
      Width = 91
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
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
  end
  object pnfile: TsPanel
    Left = 0
    Top = 35
    Width = 193
    Height = 429
    Align = alLeft
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object FileList: TFileListBoxEx
      Left = 1
      Top = 1
      Width = 191
      Height = 427
      Align = alClient
      Mask = '*.asf'
      ShowGlyphs = True
      TabOrder = 0
      OnClick = FileListClick
      Version = '1.2.1.1'
    end
  end
  object Panel3: TsPanel
    Left = 193
    Top = 35
    Width = 808
    Height = 429
    Align = alClient
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object video: TVideoGrabber
      Left = 1
      Top = 1
      Width = 806
      Height = 427
      Align = alClient
      Caption = 'video'
      Color = clBlack
      AspectRatioToUse = -1.000000000000000000
      AudioCompressor = 0
      AutoFileNameDateTimeFormat = 'yymmdd_hhmmss_zzz'
      AutoFilePrefix = 'vg'
      Cropping_Zoom = 1.000000000000000000
      ImageOverlayEnabled = False
      ImageOverlay_AlphaBlend = False
      ImageOverlay_AlphaBlendValue = 180
      ImageOverlay_ChromaKey = False
      ImageOverlay_ChromaKeyLeewayPercent = 25
      ImageOverlay_ChromaKeyRGBColor = 0
      ImageOverlay_Height = -1
      ImageOverlay_LeftLocation = 10
      ImageOverlay_VideoAlignment = oa_LeftTop
      ImageOverlay_StretchToVideoSize = False
      ImageOverlay_TopLocation = 10
      ImageOverlay_Transparent = False
      ImageOverlay_TransparentColorValue = 0
      ImageOverlay_UseTransparentColor = False
      ImageOverlay_Width = -1
      ImageOverlay_TargetDisplay = -1
      LicenseString = 'N/A'
      MotionDetector_Grid = 
        '5555555555 5555555555 5555555555 5555555555 5555555555 555555555' +
        '5 5555555555 5555555555 5555555555 5555555555'
      PlayerSpeedRatio = 1.000000000000000000
      TextOverlay_Enabled = False
      TextOverlay_Font.Charset = DEFAULT_CHARSET
      TextOverlay_Font.Color = clAqua
      TextOverlay_Font.Height = -16
      TextOverlay_Font.Name = 'Arial'
      TextOverlay_Font.Style = []
      TextOverlay_FontColor = clAqua
      TextOverlay_FontSize = 12
      TextOverlay_HighResFont = True
      TextOverlay_Left = 0
      TextOverlay_Top = 0
      TextOverlay_Right = -1
      TextOverlay_Orientation = to_Horizontal
      TextOverlay_Scrolling = False
      TextOverlay_ScrollingSpeed = 1
      TextOverlay_Shadow = True
      TextOverlay_ShadowColor = clBlack
      TextOverlay_ShadowDirection = cd_SouthEast
      TextOverlay_BkColor = clWhite
      TextOverlay_Align = tf_Left
      TextOverlay_AlphaBlend = False
      TextOverlay_AlphaBlendValue = 180
      TextOverlay_GradientMode = gm_Disabled
      TextOverlay_GradientColor = clNavy
      TextOverlay_VideoAlignment = oa_LeftTop
      TextOverlay_String = 
        'Note: the date/time formats '#13#10'can be easily modified.'#13#10#13#10'system ' +
        'date/time: %sys_time[dd/mm/yy hh:nn:ss]%'#13#10'DV time code: %time_co' +
        'de%'#13#10'DV date/time: %dv_time[dd/mm/yy hh:nn:ss]%'#13#10'frame number: %' +
        'frame_count%'#13#10'time (full): %time_full%'#13#10'time (sec): %time_sec%'#13#10 +
        'time (ns): %time_100ns%'
      TextOverlay_TargetDisplay = -1
      TextOverlay_Transparent = True
      VideoCompression_Quality = 1.000000000000000000
      VideoCompressor = 0
      VideoDelay = 0
      VideoFromImages_TemporaryFile = 'SetOfBitmaps01.dat'
      VideoProcessing_RotationCustomAngle = 45.500000000000000000
      ExplicitLeft = 5
      ExplicitTop = 6
      ExplicitWidth = 320
      ExplicitHeight = 240
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 464
    Width = 1001
    Height = 41
    Align = alBottom
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    DesignSize = (
      1001
      41)
    object grbPlayerControl: TGroupBox
      Left = 5
      Top = -1
      Width = 1154
      Height = 41
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akLeft, akTop, akRight]
      Caption = 'player control'
      TabOrder = 0
      DesignSize = (
        1154
        41)
      object btnPlayerBackwards: TSpeedButton
        Left = 12
        Top = 16
        Width = 28
        Height = 17
        Hint = 'play backwards'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333FF3337F3E0F33333033370E337F3333FF73337F3E0F333300333
          70E337F333FF773337F3E0F33300033370E337F333F7773337F3E0F330000333
          70E337F33377773337F3E0F33300033370E337F33337773337F3E0F333300333
          70E337F33333773337F3E0F33333033370E337F33333373337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerBackwardsClick
      end
      object btnPlayerPause: TSpeedButton
        Left = 44
        Top = 16
        Width = 28
        Height = 17
        Hint = 'pause'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333333337F3E0F33333333370E337F333FF3FF337F3E0F330030033
          70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
          70E337F3377F77F337F3E0F33003003370E337F3377F77F337F3E0F330030033
          70E337F33773773337F3E0F33333333370E337F33333333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerPauseClick
      end
      object btnPlayerStop: TSpeedButton
        Left = 75
        Top = 16
        Width = 28
        Height = 17
        Hint = 'stop'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
          70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
          70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
          70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerStopClick
      end
      object btnPlayerStartPlaying: TSpeedButton
        Left = 107
        Top = 16
        Width = 28
        Height = 17
        Hint = 'play'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
          70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
          70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
          70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerStartPlayingClick
      end
      object btnPlayerRewind: TSpeedButton
        Left = 170
        Top = 16
        Width = 28
        Height = 17
        Hint = 'rewinds'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333333337F3E0F33333333370E337F3333F3FF337F3E0F333030033
          70E337F3337F77F337F3E0F33003003370E337F3377F77F337F3E0F300030033
          70E337F3777F77F337F3E0F33003003370E337F3377F77F337F3E0F333030033
          70E337F33373773337F3E0F33333333370E337F33333333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerRewindClick
      end
      object btnPlayerFastForward: TSpeedButton
        Left = 202
        Top = 16
        Width = 28
        Height = 17
        Hint = 'fast forwards'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
          70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
          70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
          70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerFastForwardClick
      end
      object btnPlayerFrameStep: TSpeedButton
        Left = 139
        Top = 16
        Width = 28
        Height = 17
        Hint = 'move to next frame step-by-step (when the clip is paused)'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F33333333737F3E0F33333330370E337F33333333737F3E0F303333303
          70E337F33733333737F3E0F30333330370E337F33733333737F3E00000033303
          70E337F77777333737F3E0F30333030370E337F33733373737F3E0F303333003
          70E337F33733337737F3E0F33333330370E337F33333333737F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = btnPlayerFrameStepClick
      end
      object tbrPlayerProgress: TTrackBar
        Left = 234
        Top = 13
        Width = 742
        Height = 22
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akLeft, akTop, akRight]
        Max = 1
        Min = 1
        PageSize = 1
        Position = 1
        TabOrder = 0
        ThumbLength = 15
      end
    end
  end
  object mmLog: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 432
    Top = 144
    object mmLogID: TIntegerField
      FieldName = 'ID'
    end
    object mmLogLOGUSU: TStringField
      FieldName = 'LOGUSU'
    end
    object mmLogDATA: TDateField
      FieldName = 'DATA'
    end
    object mmLogHORA: TTimeField
      FieldName = 'HORA'
    end
    object mmLogDESCRICAO: TBlobField
      FieldName = 'DESCRICAO'
    end
    object mmLogIP: TStringField
      FieldName = 'IP'
    end
    object mmLogCOMPUTADOR: TStringField
      FieldName = 'COMPUTADOR'
    end
  end
  object dsLog: TDataSource
    AutoEdit = False
    DataSet = mmLog
    Left = 472
    Top = 104
  end
  object IdFTPTelas: TIdFTP
    IPVersion = Id_IPv4
    Host = '172.16.1.250'
    Password = '123456'
    TransferType = ftBinary
    Username = 'telas'
    Port = 2121
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    UseHOST = False
    Left = 552
    Top = 65520
  end
end
