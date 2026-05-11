object Fr_contas_pagar: TFr_contas_pagar
  Left = 206
  Top = 76
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar'
  ClientHeight = 537
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pccop: TsPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 537
    ActivePage = tab_localizar
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object tab_localizar: TsTabSheet
      Caption = 'Localizar'
      OnShow = tab_localizarShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel1: TsPanel
        Left = 0
        Top = 460
        Width = 593
        Height = 49
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvNone
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object BtnLimpar: TsBitBtn
          Left = 58
          Top = 3
          Width = 75
          Height = 43
          Hint = 'Limpar os Filtros de Pesquisa'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BtnLimparClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btok: TsBitBtn
          Left = 139
          Top = 3
          Width = 75
          Height = 43
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F0000
            000000000000000000000000000000000000000000007F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000000000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000007F
            7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F000000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
            00000000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7F7F7F000000000000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF00000000007F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
            FFFFFFFFFFFF7F7F7F000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF00000000007F7F7F7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF
            FFFFFF7F7F7F0000007F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00000000007F7F7F7F00007F0000FF0000FFFFFFFFFFFF
            7F7F7F0000007F0000FF00007F0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF00007F00007F00007F0000FF0000FFFF00FFFFFFFFFFFF
            7F7F7F000000FF00007F0000FF00007F0000FF0000FF0000FF0000FF0000FF00
            00000000000000000000000000000000000000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF00007F0000FF0000FF0000FFFF00FFFFFFFFFFFF
            000000FF00007F0000FF00007F0000FF00007F0000FF00007F00000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFFFFFFFF
            7F00007F00007F00007F0000FF00007F0000FF00007F00000000007F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F00007F0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFF000000
            7F00007F00007F00007F00007F00007F00007F0000FF00000000007F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
            7F00007F00007F00007F00007F00007F00007F00000000007F7F7F7F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
            7F00007F0000FFFFFFFFFFFF7F00007F00007F00007F7F7F7F7F7F7F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
            7F00007F0000FFFFFFFF00FFFFFFFFFFFFFF7F00000000007F7F7F7F7F7F7F7F
            7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
            FF00FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
            7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
            007FFFFF00FFFF00FF0000FFFF007F007F7F007F0000007F7F7FFFFFFF000000
            7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFF
            FF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
            007F7F007F7F007FFFFF00FFFF007F007F7F007F0000007F7F7FFFFFFF000000
            FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F
            007F7F007F7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFF000000
            FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF7F007F7F007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FF00FF7F
            007FFF00FF7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFFFFFFFF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F007F7F007F7F00
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000007F007FFF
            00FF7F007FFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000
            007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000FF00FFFF00FF7F
            007FFF00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF
            00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FF
            FF00FF7F007FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFF00FF7F007F
            7F007F7F007F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFF
            FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 0
          OnClick = btokClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BitBtn2: TsBitBtn
          Left = 249
          Top = 3
          Width = 51
          Height = 43
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
            34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
            A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
            6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
            66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
            66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
            34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
            D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
            7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
            33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
            7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
            CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
            3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
            E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
            8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
            33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
            88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
            DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
            ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
            8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
            FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
            95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
            FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
            FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
            C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
            999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
            FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
            97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
            FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
            FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
            34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
            FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
            669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 2
          OnClick = BitBtn2Click
          SkinData.SkinSection = 'BUTTON'
        end
        object Bt_imp_cop: TsBitBtn
          Left = 400
          Top = 3
          Width = 139
          Height = 43
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAEABACCCCACB
            B1AFAFA09D9EFF00FFFF00FFACAAABD3D3D3DBDADAC0BEBEADAAABFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAEABACC7
            C5C6F4F3F3F7F6F6BCBABAB1AFAF5D5C5D615F60888687AEACACCBCACAE3E2E2
            E7E7E7D5D4D4B6B4B5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADAB
            ACBBB8B9EAE9E9FFFEFEFDFCFCF3F2F2BAB8B8B2B0B04C4B4D23232530303242
            4244626062878486AFADADD2D1D1E9E8E8DEDDDDAAA7A8FF00FFFF00FFFF00FF
            FF00FFAFADAEE1DFDFFDFCFCFCFBFBFAF9F9FCFBFBEDEBECB6B4B4B6B4B49897
            986F6E6F4C4B4D33333528282A2E2E30414143605F608C898AA7A5A5FF00FFFF
            00FFFF00FFA4A1A2D1CFCFF8F7F7FBFAFAF7F6F6F7F6F6EAE9E9C8C7C7ADABAC
            A09D9EA3A1A1AFACADB8B5B6B3B1B19E9D9D7B7A7B57565738383A2627294342
            44A19E9FFF00FFFF00FFFF00FFA4A1A2F0F0F0F4F4F4F1F0F0E2E1E1C1BFBFAB
            A8A9B9B7B7D4D3D3B7B5B5A8A5A5A29FA09F9C9DA2A0A0ABA8A9B5B3B2B5B3B3
            A7A5A68483846C6C6DA2A0A0FF00FFFF00FFFF00FFA4A1A2E6E5E5DBDADABAB8
            B8A9A6A7BAB8B8D6D5D6DFE0DFE4E3E3E8E7E7D8D6D6C9C7C7BAB8B8AFACADA5
            A2A3A19E9FA09D9EA7A4A4B1AEAEB6B4B4A7A5A5FF00FFFF00FFFF00FFA4A1A2
            B2B0B1A9A7A7BBBABAD4D4D4DCDDDDD9D9D9D5D5D5ECEBEBF8F7F7F6F6F6F1F0
            F0E7E6E6DAD9D9CDCCCCC0BEBEB5B3B3AAA8A8A3A1A1A19E9F9D9A9BFF00FFFF
            00FFFF00FFA4A1A2BCBABBD5D4D4DADADAD7D7D7D6D6D6D3D3D3E3E3E3F7F6F6
            C5C3C4C6BCC4D1CFD0E1E0E0E8E8E8E9E9E9E2E2E2D9D9D9CFCECEC4C3C3BCBA
            BAA8A5A6FF00FFFF00FFFF00FFA4A1A2D6D6D6D8D8D8D6D6D6D6D6D6D4D4D4E0
            E0E0F7F6F6C0BCBEAEB2AD80C184B2B6B1AEAAACB0AFAFBCBBBBCAC9C9D8D7D7
            DCDCDCDCDCDCDADADAAFAEAEFF00FFFF00FFFF00FFFF00FFBFBDBEDBDBDBD8D9
            D9D9D9D9E6E6E6EAE9E9B7B5B5BDBBBCF2F2F1D4F1D5EBEEEBE7E5E6FAC0AFC1
            BFC0B3B1B1AAA7A8AFACADBDBBBBBDBBBCB6B3B4FF00FFFF00FFFF00FFFF00FF
            FF00FFB5B3B4CAC9C9D6D5D5C6C4C4AEACACCCCACAF7F6F6F7F6F6F7F2F6EFED
            EDEBEAEAE9E9E9E8E8E8E2E2E2D9D9D9CDCDCDAAA8A9A5A2A3FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFA19E9FBBBABADCDCDCCDCDCDADAEAE
            C9C9C9DDDCDCE6E5E5E8E7E7E6E6E6E4E4E4E5E5E5E0E0E0C5C5C5BAB7B8FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1AFB0F6F7F7F7
            F6F5E2DFDEBCBABABABBBBC4C7C8D4D7D8D5D8D8D8D9D9D8D8D8C6C5C6ADABAC
            BAB7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFEED9D8FFEAE2FFE5DAFEDFD4FADDD3F6DCD3F1DCD6ECDEDAE6E1DFDB
            DBDBC8C7C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFE5C4C1FFE7DDFFE1D5FFDACEFFD4C5FFCEBCFFC9
            B7FFC7B3FDC1AEEBD2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C5C1FFEBE1FFE1D5FFDACE
            FFD5C7FECFBFFECAB8FFC4B0F9B9A7FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFECCDC8FF
            EBE1FFE1D5FFDACEFFD5C7FECFBFFECAB8FFC5B1F0B4A5FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFE8CCC8FFE9DFFFE1D5FFDACEFFD5C7FECFBFFECAB8FFC5B1FAC0AFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFE8CCC8FFE7DDFFE1D5FFDACEFFD5C7FECFBFFFCA
            B8FAC0AFFAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7C9C5FFF1E9FFE7DDFFE1D5FFDACE
            FED5C7FED0BFFFCCB9FAC0AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8CCC8FFF4EBFF
            EBE1FFE6D9FFDFD2FFD9CAFFD4C3F1BDB0FAC0AFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9B3
            B1E8CCC8E7C7C3E7C5BFE7C2BBE7BEB8E7BCB4E5B6AFFAC0AFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 3
          OnClick = Bt_imp_copClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object Panel15: TsPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 460
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object gbDTIni: TsGroupBox
          Left = 10
          Top = -1
          Width = 127
          Height = 46
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object EDdtaini: TsDateEdit
            Left = 6
            Top = 17
            Width = 115
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
            TabOrder = 0
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
            DialogTitle = 'Selecione uma Data'
          end
        end
        object gbDTFim: TsGroupBox
          Left = 140
          Top = -1
          Width = 127
          Height = 46
          Caption = 'Data Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object Eddtafin: TsDateEdit
            Left = 6
            Top = 17
            Width = 117
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
            TabOrder = 0
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
            DialogTitle = 'Selecione uma Data'
          end
        end
        object gbTipoData: TsGroupBox
          Left = 270
          Top = -1
          Width = 315
          Height = 46
          Caption = 'Filtrar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object Rb_filtro_vencimento: TsRadioButton
            Left = 5
            Top = 18
            Width = 79
            Height = 20
            Caption = 'Vencimento '
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_filtro_pagamento: TsRadioButton
            Left = 94
            Top = 18
            Width = 74
            Height = 20
            Caption = 'Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object gbLoja: TsGroupBox
          Left = 10
          Top = 44
          Width = 575
          Height = 46
          Caption = 'Loja:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_empresa1: TsLabel
            Left = 77
            Top = 26
            Width = 9
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Zzcod_empresa: TsComboEdit
            Left = 6
            Top = 18
            Width = 66
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnExit = Zzcod_empresaExit
            OnKeyPress = Zzcod_empresaKeyPress
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
            OnButtonClick = Zzcod_empresaButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbForn: TsGroupBox
          Left = 10
          Top = 90
          Width = 575
          Height = 46
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object LbNom_fornecedor1: TsLabel
            Left = 78
            Top = 25
            Width = 9
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Zzcod_fornecedor1: TsComboEdit
            Left = 8
            Top = 17
            Width = 66
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnExit = Zzcod_fornecedor1Exit
            OnKeyPress = Zzcod_fornecedor1KeyPress
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
            OnButtonClick = Zzcod_fornecedor1ButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbFormaPgto: TsGroupBox
          Left = 10
          Top = 182
          Width = 575
          Height = 46
          Caption = 'Forma de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_fop1: TsLabel
            Left = 78
            Top = 27
            Width = 9
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Zzcod_fop1: TsComboEdit
            Left = 8
            Top = 20
            Width = 66
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnExit = Zzcod_fop1Exit
            OnKeyPress = Zzcod_fop1KeyPress
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
            OnButtonClick = Zzcod_fop1ButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbTituloDe: TsGroupBox
          Left = 127
          Top = 228
          Width = 113
          Height = 46
          Caption = 'T'#237'tulo de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          SkinData.SkinSection = 'GROUPBOX'
          object Ed_titulo1: TsEdit
            Left = 6
            Top = 17
            Width = 100
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbTituloAte: TsGroupBox
          Left = 251
          Top = 228
          Width = 113
          Height = 46
          Caption = 'T'#237'tulo at'#233':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          SkinData.SkinSection = 'GROUPBOX'
          object ed_titulo2: TsEdit
            Left = -5
            Top = 19
            Width = 100
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = ed_titulo2Exit
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
        object gbVlrIni: TsGroupBox
          Left = 371
          Top = 228
          Width = 96
          Height = 46
          Caption = 'Valor R$ de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          SkinData.SkinSection = 'GROUPBOX'
          object edValorIni: TsCurrencyEdit
            Left = 6
            Top = 16
            Width = 83
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = edValorIniExit
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
        object gbVlrFim: TsGroupBox
          Left = 489
          Top = 228
          Width = 96
          Height = 46
          Caption = 'Valor R$ at'#233':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          SkinData.SkinSection = 'GROUPBOX'
          object edValorFim: TsCurrencyEdit
            Left = 6
            Top = 15
            Width = 83
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
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
        object gbFiltro: TsGroupBox
          Left = 10
          Top = 390
          Width = 575
          Height = 33
          Caption = 'Filtrar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          SkinData.SkinSection = 'GROUPBOX'
          object Rb_efetivados: TsRadioButton
            Left = 8
            Top = 12
            Width = 70
            Height = 20
            Caption = 'Efetivados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_nao_efetivados: TsRadioButton
            Left = 117
            Top = 12
            Width = 93
            Height = 20
            Caption = 'N'#227'o Efetivados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object rbVencidos: TsRadioButton
            Left = 266
            Top = 12
            Width = 64
            Height = 20
            Caption = 'Vencidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object Rb_todos: TsRadioButton
            Left = 504
            Top = 12
            Width = 50
            Height = 20
            Caption = 'Todos'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object rbParciais: TsRadioButton
            Left = 386
            Top = 12
            Width = 57
            Height = 20
            Caption = 'Parciais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object gbOrd: TsGroupBox
          Left = 10
          Top = 422
          Width = 575
          Height = 33
          Caption = 'Ordenar por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          SkinData.SkinSection = 'GROUPBOX'
          object zz_ord_titulo: TsRadioButton
            Left = 8
            Top = 12
            Width = 46
            Height = 20
            Caption = 'Titulo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_vencimento: TsRadioButton
            Left = 93
            Top = 12
            Width = 102
            Height = 20
            Caption = 'Data Vencimento'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_pagamento: TsRadioButton
            Left = 232
            Top = 12
            Width = 100
            Height = 20
            Caption = 'Data Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_fornecedor: TsRadioButton
            Left = 360
            Top = 12
            Width = 74
            Height = 20
            Caption = 'Fornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            SkinData.SkinSection = 'TRANSPARENT'
          end
          object zz_ord_valor: TsRadioButton
            Left = 477
            Top = 12
            Width = 44
            Height = 20
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            SkinData.SkinSection = 'TRANSPARENT'
          end
        end
        object gbRepres: TsGroupBox
          Left = 10
          Top = 136
          Width = 575
          Height = 46
          Caption = 'Funcion'#225'rio ou Representante (Controle de Vales):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object lbNom_Representante1: TsLabel
            Left = 78
            Top = 25
            Width = 9
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object zzRepresentante: TsComboEdit
            Left = 8
            Top = 17
            Width = 66
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnExit = zzRepresentanteExit
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
            OnButtonClick = zzRepresentanteButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbPlanoContas: TsGroupBox
          Left = 10
          Top = 320
          Width = 575
          Height = 71
          Caption = 'Plano De Contas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          SkinData.SkinSection = 'GROUPBOX'
          object zLbnom_plano_contas_N1: TsLabel
            Left = 64
            Top = 13
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zLbnom_plano_contas_N2: TsLabel
            Left = 64
            Top = 26
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zLbnom_plano_contas_N3: TsLabel
            Left = 64
            Top = 39
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zLbnom_plano_contas_N4: TsLabel
            Left = 64
            Top = 53
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zPrId_Plano_Contas: TsComboEdit
            Left = 6
            Top = 31
            Width = 52
            Height = 21
            AutoSize = False
            Color = clWhite
            TabOrder = 0
            Text = ''
            OnExit = zPrId_Plano_ContasExit
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
            OnButtonClick = zPrId_Plano_ContasButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbHistorico: TsGroupBox
          Left = 10
          Top = 274
          Width = 575
          Height = 46
          Caption = 'Hist'#243'rico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          SkinData.SkinSection = 'GROUPBOX'
          object edHistorico: TsEdit
            Left = 6
            Top = 17
            Width = 562
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
        object gbNF: TsGroupBox
          Left = 10
          Top = 228
          Width = 111
          Height = 46
          Caption = 'N'#176' NF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object ED_NF: TsEdit
            Left = 6
            Top = 17
            Width = 98
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = Ed_titulo1Exit
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
      end
    end
    object tab_resultado: TsTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      OnShow = tab_resultadoShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Sg_cop: TAdvStringGrid
        Left = 240
        Top = 448
        Width = 594
        Height = 472
        Cursor = crDefault
        ColCount = 10
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        FixedColor = clActiveBorder
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
        OnMouseMove = Sg_copMouseMove
        HoverRowCells = [hcNormal, hcSelected]
        OnDblClickCell = Sg_copDblClickCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clBlue
        Bands.Active = True
        Bands.PrimaryColor = clSilver
        CellNode.Color = clGray
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
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
        FixedColWidth = 56
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
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
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
        SelectionColor = clActiveBorder
        SelectionTextColor = clDefault
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        Version = '7.4.6.3'
        WordWrap = False
        ColWidths = (
          56
          56
          31
          173
          207
          71
          67
          69
          62
          64)
        RowHeights = (
          21
          21)
      end
      object Panel10: TsPanel
        Left = 0
        Top = 475
        Width = 593
        Height = 34
        Align = alBottom
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sbAbrir: TsSpeedButton
          Left = 193
          Top = 6
          Width = 86
          Height = 30
          Caption = '    Abrir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbAbrirClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sbConfPgto: TsSpeedButton
          Left = 285
          Top = 2
          Width = 150
          Height = 30
          Caption = ' Confirmar Pgto.'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbConfPgtoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sbCancPgto: TsSpeedButton
          Left = 432
          Top = 2
          Width = 150
          Height = 30
          Caption = ' Cancelar Pgto.'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033337733333333333333333F333333333333
            0000333911733333973333333377F333333F3333000033391117333911733333
            37F37F333F77F33300003339111173911117333337F337F3F7337F3300003333
            911117111117333337F3337F733337F3000033333911111111733333337F3337
            3333F7330000333333911111173333333337F333333F73330000333333311111
            7333333333337F3333373333000033333339111173333333333337F333733333
            00003333339111117333333333333733337F3333000033333911171117333333
            33337333337F333300003333911173911173333333373337F337F33300003333
            9117333911173333337F33737F337F33000033333913333391113333337FF733
            37F337F300003333333333333919333333377333337FFF730000333333333333
            3333333333333333333777330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbCancPgtoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object sBExcluirPgto: TsSpeedButton
          Left = 588
          Top = 2
          Width = 101
          Height = 30
          Caption = 'Excluir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            06020000424D0602000000000000760000002800000019000000190000000100
            0400000000009001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            8FFFFFFFFFFFF0000000FFFFFF87777777788FFFFFFFF0000000FFFFF8778888
            8770788FFFFFF0000000FFFF878888888888788FFFFFF0000000FFFF87888888
            888F788FFFFFF0000000FFFF88888888888888FFFFFFF0000000FFFF8F877678
            888F8FFFFFFFF0000000FFFF8888888FF8FF8FFFFFFFF0000000FFFF888FF878
            F8FF8FFFFFFFF0000000FFFF888FF87FFFFF8FFFFFFFF0000000FFFF8888888F
            FFFFF8FFFFFFF0000000FFFF8F8878FFFFFFF8FFFFFFF0000000FFF88F8878FF
            FFFFF8FFFFFFF0000000FFF8FF888FFFFFFFF8FFFFFFF0000000FFF8FFFF88FF
            FFFFF8FFFFFFF0000000FFF8FFFFFFFFFFFFF8FFFFFFF0000000FFF8FFF88888
            88FFF8FFFFFFF0000000FFF8F8777787777788FFFFFFF0000000FFF887888F88
            887777FFFFFFF0000000FFF88888FF888F88778FFFFFF0000000FFF78888FF88
            8888878FFFFFF0000000FFF78888FF88F88887FFFFFFF0000000FFF87888FFFF
            FF8778FFFFFFF0000000FFFFF88888888878FFFFFFFFF0000000FFFFFFFFFFFF
            FFFFFFFFFFFFF0000000}
          ParentFont = False
          OnClick = sBExcluirPgtoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object CheckTodos: TsCheckBox
          Left = 800
          Top = 9
          Width = 119
          Height = 20
          Caption = 'Selecionar Todos'
          Alignment = taLeftJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = CheckTodosClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 248
        Top = 96
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsContapagar
        ParentColor = False
        TabOrder = 2
        Visible = False
      end
      object Panel11: TsPanel
        Left = 0
        Top = 431
        Width = 593
        Height = 44
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        SkinData.SkinSection = 'PANEL'
        object GroupBox4: TsGroupBox
          Left = 482
          Top = 2
          Width = 114
          Height = 38
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object stTotal: TsLabel
            Left = 4
            Top = 14
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
        object GroupBox5: TsGroupBox
          Left = 364
          Top = 2
          Width = 114
          Height = 38
          Caption = 'Total Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object stTotalSel: TsLabel
            Left = 4
            Top = 14
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
      end
      object dgContasPagar: TDBGrid
        Left = 0
        Top = 0
        Width = 593
        Height = 431
        Align = alClient
        Color = clWhite
        DataSource = dsContapagar
        DefaultDrawing = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dgContasPagarDrawColumnCell
        OnDblClick = dgContasPagarDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TITULO'
            Title.Alignment = taCenter
            Title.Caption = 'T'#237'tulo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEQUENCIA'
            Title.Caption = 'Seq.'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAO_SOCIAL'
            Title.Caption = 'Fornecedor'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 249
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTE'
            Title.Caption = 'Repres./Funcion'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTAVEN'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Vcto.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor R$'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTAPAG'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Pag.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr.Pag.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_FOP'
            Title.Caption = 'Forma Pgto.'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 18
            Visible = True
          end>
      end
    end
    object tab_dados: TsTabSheet
      Caption = 'Dados'
      ImageIndex = 2
      OnShow = tab_dadosShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SpeedButton1: TsSpeedButton
        Left = 543
        Top = 71
        Width = 47
        Height = 35
        Hint = 'INFORMA'#199#213'ES  SOBRE O FORNECEDOR'
        Flat = True
        Glyph.Data = {
          FE0A0000424DFE0A00000000000036000000280000001E0000001E0000000100
          180000000000C80A0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6
          F6EDEDEDE7E7E7E6E6E6E8E8E8EFEFEFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5DCDCDCB7B7B79595958181817D7D7D
          7E7E7E7F7F7F8080808181818585859D9D9DBEBEBEE0E0E0F6F6F6FEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEE7E7E7AFAFAF7D7D7D727272828282969696A5A5A5B2B2B2B9
          B9B9B7B7B7B3B3B39E9E9E7171716C6C6C808080AEAEAEE4E4E4FDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4F4F4A7A7A77E7E7E8787879B9B9BAFAFAFC1C1C1CCCCCCD4D4D4D6D6D6D4D4
          D4D2D2D2C5C5C59494948C8C8C949494949494AEAEAEEDEDEDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDA1A1A16E
          6E6E888888B0B0B0D5D5D5EBEBEBF7F8F9F8FBFDF3F6F9EDF1F4E8EBEEE4E6E8
          DDDEDFCECECEBDBDBDB1B1B1B4B4B4BCBCBCC6C6C6EEEEEEFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFE8E8E89F9F9F777777959595DCDC
          DCFEFFFFFFFFFFF7FBFFE2E1E1D2CAC4C8BCB2C4B6AAC1B5ABBFB9B5C3C4C6CD
          D1D6D0D3D6CBCCCCC4C4C4C3C3C3CCCCCCCACACAECECECFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFF1F1F19F9F9F8D8D8DC2C2C2FAFBFBFFFFFFF2F2F4
          CFC0AFB49065B07839B36F22B96C17BC6D15BA6E1BB77127B0783DAA8763AB9F
          95B4B6BAC1C3C6CCCCCCCFCFCFCFCFCFCACACAF2F2F2FFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFB0B0B08A8A8AD6D6D6FFFFFFFEFFFFD6C9BBAE8449AF6D10C1
          740CD18011DA8511D28111D18113E08A14E78F19E18B18D78416C17B1FA9804D
          ADA59ECACED2DADBDBD7D7D7CACACAD0D0D0FDFDFDFFFFFF0000FFFFFFFFFFFF
          D9D9D9848484D1D1D1FFFFFFF8F9FCC1A985A97115BE7B09D08A15D89219DB95
          19BE9248B4A388B4A68EB5925CDC9822EFA41FEEA31FEFA31EE39817BE8627B3
          A186D9DBE0E7E8E8DBDBDBC2C2C2E5E5E5FFFFFF0000FFFFFFFEFEFE9D9D9DB3
          B3B3FFFFFFF9FAFDBBA173AB7307C5880ECF9315D89B18E4A317D1A33FCACCCD
          E5EAF3DDDBD0CCB16DD2A94BF8B61EF8B621F6B520F6B51FF2B01ACD941ABAA7
          82EBECF1F4F4F4D3D3D3C7C7C7FEFEFE0000FFFFFFE2E2E2949494F2F2F2FEFF
          FFC6B28EA97406C28B0ECB9413D59E16E0A819EAB016CDB676DFE1E8E5E6E7CF
          CCC5D8AB2EFDC522FDC420FDC420FDC420FBC220F9C01FF4BA1ACA991ACABDA3
          FCFEFFF2F2F3BEBEBEEDEDED0000FFFFFFC0C0C0BEBEBEFFFFFFE1D9CDA47617
          BB850AC48F10CE9913D9A415E4AE18EEB714D7C285DDDFE4DDDDDDD8D9DFC0AE
          75F9C216FFCA1EFFCA1EFECA1EFDC81EFBC51DF6C01DEDB615BC952EE6E2DEFF
          FFFFD2D2D2DDDDDD0000FFFFFFBBBBBBE7E7E8FBFCFDB59760AE7703BC870EC4
          8E10CE9812D9A314E4AE17EEB813E8C866E9EBF1E5E5E5E2E3E5C3C1B8DCB128
          FFC91BFEC71DFDC71DFDC61DFBC41CF5BE1BEFB81AD5A00EC2AC7CFEFFFFE9EA
          EADADADA0000FFFFFFCBCBCBFCFDFEE4DED6A37419B47D09BA840DC28C0FCC95
          11D6A013E2AA16ECB315EEBC2DEBE6D9EFF0F3EFEFEFE1E4E9C8AD60F8BF14FC
          C31BFBC31BFAC21BF8BF1AF2BA19EAB217E0A711B78F31EAE9E9F9FAFAE1E1E1
          0000FFFFFFDFDFDFFCFFFFD3C6B0A57008B27B09B7800CBF870DC89010D29911
          DCA313E6AC16EDB110E6D096ECEEF5EDEDEDF0F1F5CAC0A5E7B018FABD19F8BC
          1AF6BA1AF3B818EDB217E4AB15DCA213B98611D5CBBAFFFFFFE9E9E90000FBFB
          FBE9E9E9F9FBFECCBAA1B58733AF7707B47A09BB810CC2890ECC900FD59911DF
          A113E7A80FE5B747E7E8E9EAEAEBEDEDEED7D6D4D3A430F5B313F2B217F0B116
          ECAD16E5A714DDA013D59811BC8309C8B594FDFFFFEDEEEE0000FAFAFAEAEAEA
          F7F9FBCAB79BC29B5EB98935AF7405B57908BC800CC4870DCD8E0FD59510DE9C
          10E2A015E3D6BAE9EBEFEAEAEAE1E3E8C9A453EAA50EEAA613E7A413E3A012DC
          9B11D49410CD8D0EB97D07C0A981FCFFFFEDEDEE0000FEFEFEEBEBEBF4F5F8CE
          BCA6C5A16CC8A36DBC8C3EB07407B47604BC7C0AC4820CCB880DD28E0ED28A03
          D7AE63EBEDF1EAEAEAE5E9EFCBA153E0960ADF9810DC9510D7910FD18D0DCA87
          0DC3810BB27305C1A986F9FCFFEBEBEB0000FFFFFFEAEAEBF1F2F4D6CABBC8A7
          7ACCA97ACCA979C39754B47916B37000BA7606C17C0AC77F08B58B46B69D70F0
          F3F9F4FAFFE2DBCFCD8C20D5890AD3880CD0860CCB830CC67F0BC07B0ABB7808
          A66702C8B69EF3F6FBECEDED0000FFFFFFEBEBEBEAEBEDE1DBD5CAAE8AD0B087
          CFAE84D0AF85CCA573BE8A3BB4710BB56D00BB7100BE8126CDB390EADBC5E4CB
          A9CE9034CA7B03C87C0AC77B09C47909C07708BC7407B77107B26E049E640FD6
          CDC3E8EBEEF2F2F20000FFFFFFF3F3F3DFE0E0EBEAE9D0BDA5D3B693D2B591D2
          B38ED2B38DD2B28BCBA36FC0883CB67213B56800B86800BA6C00B36300AA5E00
          B36600BD6F03BB6F06B96E06B66C06B26A05AF6905A86200A1763BE3E3E6DFE0
          E0F9F9F90000FFFFFFFDFDFDDADADAEAEBECDDD4CBD4BB9FD7BD9ED6BB9BD5B8
          97D4B694D5B795D5B593CFA97DC69458BC7C2CB26B12AE8A5EB8AD9EA58A66A2
          5E06B06100AE6200AB6100A96000A85F00965400BDAA94E1E5E9E3E3E3FFFFFF
          0000FFFFFFFFFFFFEAEAEAD6D6D6ECECECD8C9B9DAC2A9DAC2A7D9C0A4D8BEA1
          D7BC9DD7B99AD7B99AD7B89AD5B391D0B293EFF1F3FFFFFFEFF4FAB39672AE6B
          1AAF6C19AE6B18AD6C19A86818A98356E1E1E2D9DADBF6F6F6FFFFFF0000FFFF
          FFFFFFFFFEFEFED5D5D5DFDFE0E8E5E3DAC9B8DDC8B1DDC7B0DCC5ADDBC3A9DA
          C1A6D9BEA3D8BCA0D7B99BDAC2AAFDFCFBFFFFFFFFFFFFE1D6CDCBA782CCA67F
          CAA37AC69E74C1A487E4E1E0E0E1E2E7E6E7FFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFF7F7F7C5C5C5E1E2E2EAE6E2DECFC0E0CCB8E0CCB7DFCAB5DEC9B2DDC6
          AFDCC4ACDBC2A9D9BFA4E5D4C3F7F1EBF2ECE4D9C1A9D3B494D2B293CCAC8AC8
          B097E2DEDAE5E6E7DFDFDFFDFDFDFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFEFEFEFC5C5C5E5E6E6F0EEEDE3D8CEE0CFBFE2CFBCE2CFBBE1CDB9E0CCB7
          DFCAB4DEC8B1DBC3AADBC3AAD9C1A6D8BDA1D6BA9ED0B69CD4C4B3EAE8E6E6E7
          E9DDDEDDFBFBFBFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF3F3F3D0D0D0E3E4E4F7F7F6EEEAE5E5DAD0E2D3C4E2D1C0E1D0BDE1CFBBE1
          CDB9E0CBB6DDC7B1DBC5AFD9C5B0DCCCBDE8E2DCF2F2F3E2E3E4E1E1E1FCFCFC
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FBFBFBE0E0E0E1E1E2F4F4F5FBFAFBF5F3F1EFE9E3E9E0D7E7DCD2E5DACFE5DA
          CFE7DCD3ECE5DEF3F0EDF6F6F6EAECEDDCDDDDE9E9E9FEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5F5F5EBEBEBEDEDEEF3F4F5F7F8F9FBFCFDFCFCFDFCFCFCFCFCFDFBFCFD
          F5F6F7EAEAEBE0E0E0E6E6E6F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDF5F5F5EFEFF0EBEBECE9E9E9EAEAEAEBEBECEDEDEDF0F0F0F2
          F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000}
        OnClick = SpeedButton1Click
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label18: TsLabel
        Left = 7
        Top = 73
        Width = 57
        Height = 13
        Caption = 'Fornecedor:'
      end
      object Lbnom_fornecedor: TsLabel
        Left = 74
        Top = 89
        Width = 9
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object GroupBox1: TsGroupBox
        Left = 0
        Top = 0
        Width = 593
        Height = 69
        Align = alTop
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'GROUPBOX'
        object Label8: TsLabel
          Left = 7
          Top = 15
          Width = 77
          Height = 13
          Caption = 'N'#186' Titulo...........:'
        end
        object Label10: TsLabel
          Left = 238
          Top = 15
          Width = 25
          Height = 13
          Caption = 'Seq.:'
        end
        object Label22: TsLabel
          Left = 8
          Top = 46
          Width = 77
          Height = 13
          Caption = 'Loja..................:'
        end
        object Lbnom_empresa: TsLabel
          Left = 161
          Top = 46
          Width = 9
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prtitulo: TsEdit
          Left = 89
          Top = 11
          Width = 106
          Height = 21
          Color = clWhite
          MaxLength = 6
          TabOrder = 0
          OnExit = PrtituloExit
          OnKeyPress = PrtituloKeyPress
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
        object Prsequencia: TsEdit
          Left = 268
          Top = 11
          Width = 35
          Height = 21
          Color = clWhite
          TabOrder = 2
          OnKeyPress = PrtituloKeyPress
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
        object Prconferido: TsCheckBox
          Left = 507
          Top = 15
          Width = 74
          Height = 20
          TabStop = False
          Caption = 'Conferido'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prid: TsEdit
          Left = 460
          Top = 11
          Width = 35
          Height = 21
          TabStop = False
          Color = clWhite
          TabOrder = 5
          Visible = False
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
        object BTSEQ: TButton
          Left = 196
          Top = 11
          Width = 33
          Height = 21
          Caption = 'Seq...'
          Enabled = False
          TabOrder = 1
          OnClick = BTSEQClick
        end
        object Prcod_empresa: TsComboEdit
          Left = 90
          Top = 40
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 3
          Text = ''
          OnExit = Prcod_empresaExit
          OnKeyPress = Prcod_empresaKeyPress
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
          OnButtonClick = Prcod_empresaButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object ckParcelado: TsCheckBox
          Left = 507
          Top = 42
          Width = 77
          Height = 20
          Caption = 'Parcelado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          Visible = False
          OnClick = ckParceladoClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrExtrato: TsEdit
          Left = 460
          Top = 35
          Width = 35
          Height = 21
          TabStop = False
          Color = clWhite
          TabOrder = 7
          Visible = False
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
        object PrCHEQUE: TsEdit
          Left = 404
          Top = 35
          Width = 35
          Height = 21
          TabStop = False
          Color = clWhite
          TabOrder = 8
          Visible = False
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
      object GroupBox2: TsGroupBox
        Left = 0
        Top = 187
        Width = 592
        Height = 262
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        object Label11: TsLabel
          Left = 7
          Top = 55
          Width = 85
          Height = 13
          Caption = 'Data Vencimento:'
        end
        object Label12: TsLabel
          Left = 178
          Top = 55
          Width = 27
          Height = 13
          Caption = 'Valor:'
        end
        object Label13: TsLabel
          Left = 179
          Top = 218
          Width = 27
          Height = 13
          Caption = 'Valor:'
        end
        object Label15: TsLabel
          Left = 7
          Top = 216
          Width = 83
          Height = 13
          Caption = 'Data Pagamento:'
        end
        object Label16: TsLabel
          Left = 7
          Top = 96
          Width = 44
          Height = 13
          Caption = 'Hist'#243'rico:'
        end
        object Label17: TsLabel
          Left = 297
          Top = 55
          Width = 104
          Height = 13
          Caption = 'Forma de Pagamento:'
        end
        object Lbnom_fop: TsLabel
          Left = 367
          Top = 73
          Width = 9
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label1: TsLabel
          Left = 5
          Top = 12
          Width = 235
          Height = 13
          Caption = 'Funcion'#225'rio ou Representante (Controle de Vales)'
        end
        object Lbnom_representante: TsLabel
          Left = 75
          Top = 30
          Width = 9
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Prdtaven: TsDateEdit
          Left = 5
          Top = 69
          Width = 108
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
          OnExit = PrdtavenExit
          OnKeyPress = PrtituloKeyPress
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
        object Prvalor: TsCurrencyEdit
          Left = 172
          Top = 69
          Width = 104
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 2
          OnKeyPress = PrtituloKeyPress
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
        object Prhistorico1: TsMemo
          Left = 5
          Top = 109
          Width = 580
          Height = 105
          Color = clWhite
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
        end
        object Prdtapag: TsDateEdit
          Left = 5
          Top = 230
          Width = 108
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          TabOrder = 5
          Text = '  /  /    '
          OnKeyPress = PrtituloKeyPress
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
        object Prvalor_pago: TsCurrencyEdit
          Left = 172
          Top = 231
          Width = 104
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 6
          OnKeyPress = PrtituloKeyPress
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
        object Prcod_fop: TsComboEdit
          Left = 297
          Top = 69
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 3
          Text = ''
          OnExit = Prcod_fopExit
          OnKeyPress = Prcod_fopKeyPress
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
          OnButtonClick = Prcod_fopButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object PrCOD_REPRESENTANTE: TsComboEdit
          Left = 5
          Top = 26
          Width = 66
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 0
          Text = ''
          OnExit = PrCOD_REPRESENTANTEExit
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
          OnButtonClick = PrCOD_REPRESENTANTEButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object gbVales: TsGroupBox
          Left = 401
          Top = 8
          Width = 185
          Height = 49
          Caption = 'Vales'
          TabOrder = 7
          Visible = False
          SkinData.SkinSection = 'GROUPBOX'
          object sLabel8: TsLabel
            Left = 79
            Top = 13
            Width = 26
            Height = 12
            Caption = 'Valor'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
          end
          object sLabel1: TsLabel
            Left = 127
            Top = 13
            Width = 48
            Height = 12
            Caption = '% Sal'#225'rio'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
          end
          object lbTotalVale: TsLabel
            Left = 79
            Top = 31
            Width = 26
            Height = 12
            Caption = 'Valor'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
          end
          object lbPercSal: TsLabel
            Left = 127
            Top = 31
            Width = 26
            Height = 12
            Caption = 'Valor'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
          end
        end
      end
      object Prcod_fornecedor: TsComboEdit
        Left = 4
        Top = 85
        Width = 66
        Height = 21
        AutoSize = False
        Color = clWhite
        TabOrder = 1
        Text = ''
        OnExit = Prcod_fornecedorExit
        OnKeyPress = Prcod_fornecedorKeyPress
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
        OnButtonClick = Prcod_fornecedorButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object Panel9: TsPanel
        Left = 0
        Top = 468
        Width = 593
        Height = 41
        Align = alBottom
        TabOrder = 4
        SkinData.SkinSection = 'PANEL'
        object Btnov: TsBitBtn
          Left = 12
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Inserir'
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFEFEFEFAFAFAF1F1F1EAEAEAE5E5E5E5E5E5E4E5E5E4E4E5E4E4E5E4E4
            E4E4E4E4E3E3E3E2E2E3E2E2E2E1E1E2E2E2E2E7E7E7F0F0F0F8F8F8FEFEFEFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFEFEFEE6E6E6D4D4D3CECDCDCAC9C8C9C8
            C7C8C7C5C7C6C4C6C5C3C6C5C3C7C5C4C7C6C5C7C7C6C8C8C7C8C8C7C9C8C8CD
            CCCCD2D2D2EEEEEEFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE3E3
            E2ECEBE9E7E6E5E7E5E3E5E3E1E3E1DEE2DFDAE1DDD8E1DED9E3E0DCE5E2DFE6
            E5E3E8E7E5E9E8E7EAE9E8EAE9E8EBEAE8EBEBEAFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7FAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFB
            FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFAFBFBFBFCFCF1F1F1E9E8E6ECECEC
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE5E5E4E8E7E7FDFDFDFD
            FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
            FEFEFEF3F3F3E8E7E6EDECECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFE5E5E4E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDECFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7FCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8
            E6EDEDECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFDFDFDF3F3F3E9E8E6EDEDECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFE6E5E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDEDFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E5E8E7E7FCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3
            F3F3E9E8E6EDEDEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5
            E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDEDFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDED
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E7FCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FDFDFDF3F3F3E9E8E6EEEEEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFE6E6E5E8E7E7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB
            FBFBFBFBFBFBFBFBFBFBFBFBFCFCFCF2F2F2E8E8E6EEEEEDFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E6FAFAFAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFBFBFBF1F1F1E8E8
            E6EEEEEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E7E6E6
            F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
            F8F8F8F8F9F9F9F0EFEFE8E7E5EEEDEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFE6E6E5E7E6E6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F8F8F8EFEFEFE8E7E5EEEDEDFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E6E5E5F5F5F5F5F5F5F5F5
            F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F7F7F7F7F7F7F8F8F8EF
            EFEFE7E6E5ECECECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6
            E5E5E5E4F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F3F3F3ED
            EDEDDEDEDEDDDDDDE1E1E1D7D7D7D6D5D3EDEDEDFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFE6E5E5E5E4E3F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0DEDEDED9D9D9D3D3D3D2D2D2CECECED6D6D6F9F9F9
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E5E5E4E4F1F1F1F1
            F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F0F0EFDDDDDDF8F8F8F6F6F6
            EFEFEFDCDCDCF1F1F1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFE6E5E5E4E4E3F2F2F1F2F2F1F2F2F1F2F2F1F2F2F1F2F2F2F2F3F2F2F3F2
            F0F0EFDDDDDDF9F9F9EEEEEEDEDEDFF2F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E6E5E4D9D9D8DADAD9D9D9D8D9D9D7
            D8D7D6D7D6D4D6D4D2D6D4D1D1CFCCCACAC7E3E2E1DBDBDBF5F5F5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE5E5E4F7F6F4
            F6F5F3F6F5F3F5F3F1F3F1EDF0EDE8EDE9E3EAE6DEE8E3DAE4DFD6DDDBD5E4E4
            E3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFEEEEEEE5E5E5E6E6E5E6E6E5E6E6E5E5E5E4E5E4E3E4E3E1E4E2
            E0E3E1DFE1E0DEEBEAEAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 4
          OnClick = BtnovClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btalt: TsBitBtn
          Left = 94
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Alterar'
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFF7F7F7F0F0EFE7E5E4E1E0
            DFE4E4E4EAEAEAEFEFEFF3F3F3F7F7F7F9F9F9FBFBFBFDFDFDFDFDFDFEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFD2D2D263686B8A9297A6A7A8B4B1B0BBB8B6BABABAC1C1C1C9C9C9D0D0D0D7
            D7D7DCDCDCE2E2E2E6E6E6EBEBEBEEEEEEF1F1F1F4F4F4F7F7F7F9F9F9FCFCFC
            FEFEFEFFFFFFFFFFFF00FFFFFFFAFAF9ACB5B977A0B9759BB093A8B1B8C2C8DC
            DAD8D5D4D3D1D1D1D0D0D0D1D1D1D2D2D2D4D4D4D7D7D7DADADADDDDDDE0E0E0
            E4E4E4E7E7E7EDEDEDF4F4F4FBFBFBFEFEFEFFFFFF00FFFFFFFFFFFFFFFFFFCE
            E8F688B6D35999C42E89C49CC6E1FFFFFFFFFEFDF9F9F9F7F7F7F4F4F4F2F2F2
            F0F0F0EEEEEEECECECECECECEBEBEBECECECEFEFEFF5F5F5FBFBFBFEFEFEFFFF
            FF00FFFFFFFFFFFFFFFFFFF6FBFEA7DAEE32A1EE1687DF1880C684B8DAFDFDFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFCFCFCFDFD
            FDFDFDFDFEFEFEFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFA7EDFF37C9FC
            27A3F21E8CE2137EC86AA9D2F2F6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFF1FDFF94ECFF41D0FD2AABF42392E7117FCC539ECDE3ECF4FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFA2EEFF48D5FE2EB2
            F62799EA1382D03F93C9D0E2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFAFF1FF4ED9FF32B9F82B9FEE1786D52D8AC7BCD6E8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDF4FF56DCFF35C0F92F
            A7F11B8BDB2084C6A5C8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCAF5FF5FDFFF38C6FB33AEF42292E01780C78BBBDBFEFDFDFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6F8FF69E2FF3CCBFC38B6F5
            289AE51280C971ACD4F7F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE0F9FF75E5FF3ED0FD3ABCF82FA3EA1181CD59A0CFE8EFF5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAFCFF80E7FF41D3FE3EC2F935AB
            EE1485D14395CBD5E4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF1FDFF8EEAFF45D6FE3FC7FB3BB3F2168CD82C8BC8C7D6DEFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FEFF9CECFF49D8FF3ECAFC42B9F27F
            AEC88B909AA0A0B2FDFDF8FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FFFFA9EFFF50DAFF9DD2DFB2A7BD555292606085A3A3C8FBFBFDFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAF2FACED0D77E6FCA9E9CC18383DB
            5E5ED8A0A0E7F7F7FD00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
            D2CFEDB1ADE0A6A5E47D7DE58585E47777E0B8B8EF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF9F9FFE7E8F6A7A6EEA5A4EDA8A8ED9E9EEBB0B0
            EE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2
            FBCDCCF9CCCBF9C3C3F6E1E1F900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6FFEDECFEF2F2FEFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 3
          OnClick = btaltClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btgra: TsBitBtn
          Left = 176
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Gravar'
          Enabled = False
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF5F5
            F5EFEFEFE8E8E8E4E4E4DDDEDED5D5D4CBCBCBC1C1C1CFCFD0FDFDFDFFFFFFFF
            FFFFFFFFFFFEFEFEEDEDEDD7D7D7CCCCCBC1C1C1BDBDBDB7B7B7B4B5B6ACACAD
            A0A0A19A9A9A979797939394929293706E6B4F49434C453F5750495A51495F59
            54C7C7C7FFFFFFFFFFFFFFFFFFFFFFFF93908E423D38423D37423D3887868793
            929373706F7573719B9B9CA2A2A4A2A2A4A4A4A5A8A8AA6E6A673F362E443C34
            584E455E5349645C538C8B8BE3E3E3FFFFFFFFFFFFDDDDDC37332E25201B2A25
            20342E29A2A1A19B9A9B2A241E3C3732A7A6A7B7B7B9B5B5B6B5B5B6B8B9BB73
            6F6D3B342D4139324A433B4B423B5C554E979696B8B8B8F0F0F0FFFFFFB3B3B2
            030100151210151210201C1AACABACA6A5A5211D19383430B6B5B6C8C8CAC6C6
            C7C6C6C7CBCBCC74716F302A2438312B38322D332D27504A45D6D5D4F1F1F1F7
            F7F7FFFFFFB2B1B10000000303030303020F0E0DB9B8B9B1B0B113110F302D2B
            C4C4C4DADADBD7D7D8D7D7D8DDDDDE757270241F1B2D282325211E1A1713403C
            39E8E7E7FFFFFFFFFFFFFFFFFFB1B1B10000000000000000000A0A0AC6C6C7B9
            B8B80000001C1B1AD2D2D2ECECECEAEAEAEBEBECF3F3F4777573171310231F1B
            141211050503302E2DE5E4E3FFFFFFFFFFFFFFFFFFB3B3B20000000403030101
            010E0E0DDADADAE2E2E25F5E5E808080F4F4F4FFFFFFFBFBFBF4F4F4F1F1F16A
            696812100E1C1A180A0909000000282726E5E4E3FFFFFFFFFFFFFFFFFFB3B3B2
            0000000908070706050B0B0A6F6E6E8483827B7B7B6D6D6C5656554746463C3B
            3B313130272626080807000000000000010101000000282727E4E3E2FFFFFFFF
            FFFFFFFFFFB5B5B40504020E0C0B080604060403000000000000000000000000
            0201000606050E0D0D1615141F1E1E2D2C2C3A3A393332320908070202012A29
            29E2E2E1FFFFFFFFFFFFFFFFFFB8B7B6080502302E2C7F7E7D84848486858588
            88888C8B8B9090909898989FA09FA7A7A7AFAFAFB7B6B6BDBDBDC5C5C5AAAAAA
            1C1A1A0806052D2B2AE1E0E0FFFFFFFFFFFFFFFFFFBAB9B80D09054E4C4ACBCB
            CBCCCCCCCBCCCCCBCBCBCBCBCBCBCBCBCBCBCBCACACAC9C9C9C8C8C8C6C6C6C6
            C6C6C8C8C8ADADAD2422210F0D0B312F2EE0DFDFFFFFFFFFFFFFFFFFFFBCBBBA
            16110D53504ECECECFD0D0D0D0D0D0D0D0D0D0D0D0D1D1D1D1D1D1D1D1D1D1D1
            D1D1D1D1D2D2D2D2D2D2D5D6D6B8B8B82B2825171412363432DFDEDEFFFFFFFF
            FFFFFFFFFFBEBDBB2019145B5754DCDCDCDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFE0E0E0E0E0E0E0E0E0E0E0E0E1E1E1E5E5E5C5C5C4332E2C201C183B38
            36DEDEDEFFFFFFFFFFFFFFFFFFC1BFBD29221B635E5BE9E9E9EDEDEDECECECEC
            ECECECECECEDEDEDEDEDEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF3F3F3D1D0CF
            3B363229241F413E3ADDDDDDFFFFFFFFFFFFFFFFFFC4C1BF322A236A6561F1F2
            F2F7F7F7F6F6F6F6F6F6F6F6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7FBFBFCD9D9D8423D38342D274A4642DDDDDDFFFFFFFFFFFFFFFFFFC7C4C1
            3B3229706A65F4F5F5FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
            F9F9F9F9F9F9F9F9F9F9FDFDFDDBDAD94C4641433C3657524EDDDDDDFFFFFFFF
            FFFFFFFFFFC9C5C3433930756F69F5F5F5FBFBFBFAFAFAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFEFEFEDEDDDC5B544D554D47645F
            5ADDDDDDFFFFFFFFFFFFFFFFFFCAC7C4493F3477716BF0F0F0F6F6F6F4F4F4F4
            F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2F2F2F2F5F5F5D9D8D7
            69625C69625B726D68DDDDDDFFFFFFFFFFFFFFFFFFCCC9C66B62598A847FE2E2
            E2E9E9E9E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8EBEBEBD4D3D277706A59544F75706CE0DFDFFFFFFFFFFFFFFFFFFFCBC8C5
            5F5449857F79F2F3F3FAFAFBF9FAFAFAFAFAFAFAFAFAFAFBFAFBFBFBFBFBFBFB
            FCFBFCFCFBFCFCFCFCFCFFFFFFE5E4E3827B746D6761817C76DEDEDDFFFFFFFF
            FFFFFFFFFFDBD8D66C6157877F78E3E2E0EAE8E6E8E6E5E8E6E5E9E7E5E8E7E5
            E6E4E3E6E5E3E4E3E1E4E2E0E3E2E0E3E2E0E4E3E2D0CECC96908B9D9792A09C
            98E9E8E8FFFFFFFFFFFFFFFFFFFFFFFFF0EEEDEBE9E8EAE8E6EAE8E6E9E7E6E9
            E7E6EAE8E6E9E8E6E8E7E5E9E7E6E8E7E5E8E6E5E8E6E5E8E7E5E7E6E5E8E7E6
            EDECEBECEBEBF0F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 0
          OnClick = btgraClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btcan: TsBitBtn
          Left = 258
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Cancelar'
          Enabled = False
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE
            FDFBFDFCFBFCFBFCFDFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFCFEFDF6FAF7EEF6F0E7F2
            EAE2EFE5DCECE0D6E9DBD1E7D6CEE4D2D4E8D8E3F0E6F4F9F5FEFEFFFFFFFFFF
            FFFFFFFFFFFDFEFEFBFDFCFAFCFAFBFCFBFCFEFDFEFEFEFFFFFFFFFFFF00FFFF
            FFF9FCFAE6F1E9C9E2CFB0D4B8A3CEADA2CCABA2CDACA4CDADA9D0B1B5D7BDC9
            E2CFDDECE0EAF3ECEDF5EEECF4EDE9F3EBE4F0E7E0EEE2DEEDE2E2EFE5EBF4ED
            F6FAF7FCFDFCFFFFFF00FFFFFFFEFEFEF6FAF7DFEEE2C0DDC6A5CEAE9AC8A49D
            CAA7A3CDACA8D0B2AED3B6B3D6BBB9D9C0BFDCC5C3DECAC6E0CCC9E2CECCE3D1
            D0E5D4D5E9DADFEEE2EAF3ECF4F9F5FCFDFCFFFFFF00FFFFFFFFFFFFFFFFFFFB
            FDFBEBF4EDD1E6D6BCDBC3BCDAC2CAE2D0DEEBE1E2EBE3DAE8DCD2E7D6D2E7D7
            D5E8D9D9EBDCDDEDE1E3F0E6E9F3ECF0F7F1F7FAF7FBFDFBFEFEFEFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFBFDFEFBFCF2F7F2CCEDD5
            9BE3B2D4F5E4FDFDFDFBFDFCFBFDFCFCFEFCFDFEFEFEFEFEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F8F0
            C4EBCE83D99D44CA7115BE4E18C85E44D68BF9FEFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFE
            E2F1E4B0E2BC71D28D39C86810C24F02C14900BF4611C14F17DA7761DC9CFEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FBFCFC75D18F2DC25B0EC04B02C14803C14A06C24C06C24A05C1
            4621C35C15DB7BCAF5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
            FBF25DBC745DC783FAFFFEFFFFFFFFFFFF00FBFCFC4FCB7D1EC8590DC34E03C0
            4505BD4305BC4006BC3F05BC3C13B7425FD994FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC0E9CB37AC5100861200982581E0A8FFFFFFFFFFFF00FFFF
            FFA2DFB940C76731C35909BB3C03B73505B33304AD2F04A82C00A3242EAF49AB
            E0B7F3FDF7FFFFFFFFFFFFFBFFFECAEED469C9840C9E30008F1D039326019323
            08A837B1E6C8FFFFFF00FFFFFFDFF2E667CC8059C96F35BF5305B22E03B02B04
            AD2B04AA2A04A82B00A32300A52931B85558C5765AC4783CB75F0DA538009B25
            009E2C05A13004A43004A93000A82328B85CEBFAF300FFFFFFFEFEFE98D9A87A
            D18A66CC7B36C35803BC3605C13C07C54008C54207C54304C03F00B53300AD2E
            00A82C00A42B00A63105A93505AE3705B63B05C04004CB4200BC3463D18CF7FD
            FA00FFFFFFFFFFFFC8EBD491DAA58ADA9E75D8903BD36903CF4705D34908D44C
            07D54C07D44D07D04B06CA4705C44405C04105BD3F05BE3D05C43F05CD4804D6
            4F00CB403FCE73E6FAEEFFFFFF00FFFFFFFFFFFFEEF8F3A7E3BBACE7BD98E5AE
            87E8A44BE68107DF5B04E05C07E26008E26208E26107DF5F07DB5B07D95807D6
            5506D65306D85301D64D00C83C40D876D9FAE7FFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFC0EBCFC5F0D2B8EFCA63DF8E55DF8644E8880DE66E06E66B09E76B09E6
            6908E46608E26208DF5E09DD5A04D85200CD400BC54068DD8AE6FEEFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFE0F4E7CDEFD7C1F0D026D97A47D07F8BE0
            A544D57604CD4D00CE4700CE4400CB3F00C83B00C33500BE3211C14153D372B6
            EFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF9FDFAD4ED
            DE8CE7B211EA85CBF8E3FFFFFFE6F4E9BAE8C68ADBA06AD1855AC9765EC77876
            D08B9EDFACD3F2D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFD1EBDC2AC26D4CECA1FEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF4FAF69FDEB9D3F7E4FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 2
          OnClick = btcanClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btexc: TsBitBtn
          Left = 340
          Top = 5
          Width = 83
          Height = 31
          Caption = 'Excluir'
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F9EBEBECEDEEEFE8EAEADFE0E0DBDC
            DCE4E4E5F5F6F6FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0ABACAC7978777F79
            789A928D988E8A89807B756E6B6764636C6C6BA2A3A3D8D8D8E8E8E8FBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFEAEA
            EBA3A09F82756FA79086C0A397CAAA9CCEAC9ECCA898C39F8FAE8F807D685E3E
            37338A898AC3C3C3DADADAFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFEFEFEC1BFBEAC9D97D4BBB1DAC1B6DAC1B5E0C6BAE8CFC4E9
            CDC1E2C4B7E1BFB1ECCEC1B9A1967B716DB9B9BAC2C2C2F0F0F0FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFBEB2ADAC9C96C1B3ADC5
            B6B1C7B7B0CFBFBBDAC9C3DDC9C1D7C2BAD6BFB5E3D1CAECDFD9AF9A91BCBCBC
            D4D4D4F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFE
            FFFFDCC6BEC8B8B1B4A8A3B7A9A1BAA89BC1A890C8BCB5C8BAB5C2B4ADBFADA6
            CABBB5E5DBD8CAB2A8E0DEDDF8F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFBFAF9DFC9C1EADDD8CDB082C09B64BF9C72BD8035
            C7A077D1C6C3CEC0BACEBDB5E0D1CAF5ECE8DBC6BEF4EFEEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFF7F3F2E1CDC7E7D8C4
            D4B57FD7B98DE0C6A9D8AF7EDAA871F5E2D6F0E4E0E9D9D3EDE1DBF6F0EDDFCD
            C6EEE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFF4EEECE2CFC7E6D5B1E0D3C0E8E2E1EDE7E4E5CFB7D39C5FEDD5BFF0EA
            E8E8DDD9EDE4E0F7F3F1E1D3CDEAE3E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFF1EAE8E2CEC2E8D3A5E1D4BCE7E2E2EFEB
            EBD4AD7AD09854F3E6D9F2EFEEE9E2E0EEE8E6F9F5F5E4D7D3E8DFDBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFEFE7E4E2CE
            C1ECDCBBE5D8C4E3DDD9E2D3C0DEC29DE9D1B3FDFDFEF3F1F0EAE7E6EFECEAF9
            F7F7E9DFDCE4D9D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFEDE3DFE4D2CCEEE5D8DEC694DAC7A9C99F5ED5B07BFDFEFEFD
            FEFEF4F2F2ECEAE9F0EEEEF9F8F8EEE7E4E0D4D0FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE9DDD7EADAD5EFE4D1E1C891D2
            B379C9A364E5D3BCFCFAF7FDFDFDF4F3F2ECEAE9F0EFEEF9F8F8F3EEECDCD0CB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE6
            D8D1F0E3DDF4EBE5EDDECDE7D4C0E0D0C0EDE5E0FBF8F5FCFAF9F4F2F1EBE9E9
            F0EEEEF8F7F7F7F2F1D8CBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFE4D3CCF6EDE9F9F2EEF3E8E4F0E2DDE9D9D0E7D8CD
            F7EEE7FAF4F0F4EEECEBE6E4F0ECEBF8F7F6F9F6F5D6C7C2FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFEFEE2CFC7F9F4F1FCF9F7
            F9F0ECF8EAE2F7E4D9F2DFD2F8E8DDFDF0E7F8EEE8EFE5E0F2EBE8F7F5F3FBF8
            F7D5C5BEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FDFDFDE1CCC4FDF9F7FFFFFFFEF9F7E3DCD7CDC1BAC6BAB3D0C5BED8CDC6D8CF
            CAD7CCC5EBE2DCFFFBF9FFFFFFD6C5BEFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFDFCFBE4CEC6F9F7F6CAC9C89997968884828984
            809A9591A7A19DA19B988D898677737275716F979593E0DEDDE1CBC2F6F3F1FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFBFBE2D1CAB5B0
            AF998E88B3A298D4BFB3EED8CAF4DFD3E4CEC0DCC5B7D9C4B6C7B5AB9E908868
            5F5B4C4948917F78F5F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFEFDFDC0B8B5B6A69DD7C4B7DFCABCE6D0C2F5DED0F9E3D7EBD3C5EA
            D0C0F3DACAF6DDCDEAD1C1DDC4B6A5948A544E4BE1DFDEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFE3E2E1A19994E2D4CADAC9BFDBCABFE4
            D4C9F4E3D8F8E8DDEAD7CAE8D2C4EFD8C9EFD7C8E2C9B9DDC3B2EBCFBDA29288
            D5D5D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFECEBEB7F
            7B77BCB2ABDECFC5DECEC3E5D5CBF4E5DBF8ECE3EBDCD1E9D8CCF1DED1F1DDCF
            E8D1C2E6CDBEC4AFA2847E7AEDEDEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFD9D8D797928FACA39DC5B9B1DECFC6F5E7DEFAEEE6
            EEE0D8EDE0D7F5E7DEEFE2D9CCC0B89D948E827F7ED2D2D3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8D4D3D2
            BFBCBABBB6B4C8C2BFD0C9C6C6C1BDBEBAB7B5B2AFA4A2A19E9D9DBBBCBCF2F3
            F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8F8F0F0F0EAEAEAE5E6E6E8E8
            E9FAFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00}
          TabOrder = 1
          OnClick = btexcClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object GroupBox3: TsGroupBox
        Left = 0
        Top = 108
        Width = 595
        Height = 76
        Caption = 'Plano De Contas'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object Lbnom_plano_contas_N1: TsLabel
          Left = 64
          Top = 15
          Width = 13
          Height = 13
          Caption = '...'
          Color = clBtnFace
          ParentColor = False
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Lbnom_plano_contas_N2: TsLabel
          Left = 64
          Top = 30
          Width = 13
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Lbnom_plano_contas_N3: TsLabel
          Left = 64
          Top = 45
          Width = 13
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Lbnom_plano_contas_N4: TsLabel
          Left = 64
          Top = 60
          Width = 13
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Prid_plano_contas: TsComboEdit
          Left = 6
          Top = 34
          Width = 52
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 0
          Text = ''
          OnExit = Prid_plano_contasExit
          OnKeyPress = Prid_plano_contasKeyPress
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
          OnButtonClick = Prid_plano_contasButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
    end
    object Tab_parcelas: TsTabSheet
      Caption = 'Parcelas'
      ImageIndex = 3
      TabVisible = False
      OnShow = Tab_parcelasShow
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel12: TsPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object Label7: TsLabel
          Left = 6
          Top = 18
          Width = 102
          Height = 13
          Caption = 'Quantidade Parcelas:'
        end
        object sbGerarParc: TsSpeedButton
          Left = 382
          Top = 11
          Width = 86
          Height = 30
          Caption = '    Gerar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
            0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
            0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
            0005555555575FF7777555555555000555555555555577755555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbGerarParcClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label20: TsLabel
          Left = 142
          Top = 18
          Width = 40
          Height = 13
          Caption = 'Entrada:'
        end
        object Label2: TsLabel
          Left = 302
          Top = 18
          Width = 47
          Height = 13
          Caption = 'Dia Vcto.:'
        end
        object edEntrada: TsCurrencyEdit
          Left = 185
          Top = 14
          Width = 104
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 1
          OnExit = edEntradaExit
          OnKeyPress = PrtituloKeyPress
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
        object edNumParc: TsCurrencyEdit
          Left = 112
          Top = 14
          Width = 25
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 0
          OnKeyPress = PrtituloKeyPress
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
          DecimalPlaces = 0
          DisplayFormat = ',00;'
        end
        object GroupBox8: TsGroupBox
          Left = 472
          Top = 5
          Width = 114
          Height = 38
          Caption = 'Parcela Inicial (ID)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object PrId_master: TsEdit
            Left = 5
            Top = 14
            Width = 104
            Height = 21
            Color = clWhite
            Enabled = False
            ReadOnly = True
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
        object edDiaVcto: TsCurrencyEdit
          Left = 352
          Top = 14
          Width = 25
          Height = 21
          AutoSize = False
          Color = clWhite
          TabOrder = 2
          OnKeyPress = PrtituloKeyPress
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
          DecimalPlaces = 0
          DisplayFormat = ',00;'
        end
      end
      object Panel13: TsPanel
        Left = 0
        Top = 460
        Width = 593
        Height = 49
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object sbAbrirParc: TsSpeedButton
          Left = 416
          Top = 10
          Width = 86
          Height = 30
          Caption = '    Abrir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
            333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
            C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
            F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
            F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
            00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
            3333333373FF7333333333333000333333333333377733333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentFont = False
          OnClick = sbAbrirParcClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtSalvar: TsSpeedButton
          Left = 504
          Top = 10
          Width = 86
          Height = 31
          Caption = ' Salvar'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          ParentFont = False
          OnClick = BtSalvarClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
      end
      object dgParcelas: TDBGrid
        Left = 0
        Top = 49
        Width = 593
        Height = 367
        Align = alClient
        Color = clWhite
        DataSource = dsParcelas
        DefaultDrawing = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dgParcelasDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TITULO'
            Title.Alignment = taCenter
            Title.Caption = 'T'#237'tulo'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAO_SOCIAL'
            Title.Caption = 'Fornecedor'
            Width = 147
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTAVEN'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Vcto.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor R$'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTAPAG'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Pag.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr.Pag.'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOM_FOP'
            Title.Caption = 'Forma Pgto.'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 18
            Visible = True
          end>
      end
      object Panel14: TsPanel
        Left = 0
        Top = 416
        Width = 593
        Height = 44
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        SkinData.SkinSection = 'PANEL'
        object GroupBox6: TsGroupBox
          Left = 474
          Top = 2
          Width = 114
          Height = 38
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object stTotalParc: TsLabel
            Left = 4
            Top = 14
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
        object GroupBox7: TsGroupBox
          Left = 356
          Top = 2
          Width = 114
          Height = 38
          Caption = 'Total Selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          SkinData.SkinSection = 'GROUPBOX'
          object StaticText2: TsLabel
            Left = 4
            Top = 14
            Width = 106
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
        end
      end
    end
  end
  object Q_resultado: TFDQuery
    Connection = dao.CN
    Left = 328
    Top = 384
  end
  object mmContasPagar: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 336
    Top = 168
    object mmContasPagarTITULO: TStringField
      FieldName = 'TITULO'
    end
    object mmContasPagarSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object mmContasPagarRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object mmContasPagarHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object mmContasPagarDTAVEN: TDateField
      Alignment = taCenter
      FieldName = 'DTAVEN'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmContasPagarDTAPAG: TDateField
      Alignment = taCenter
      FieldName = 'DTAPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmContasPagarVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmContasPagarVALOR_PAGO: TCurrencyField
      FieldName = 'VALOR_PAGO'
    end
    object mmContasPagarVALOR_CORRIGIDO: TCurrencyField
      FieldName = 'VALOR_CORRIGIDO'
    end
    object mmContasPagarNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 100
    end
    object mmContasPagarEXTRATO: TIntegerField
      FieldName = 'EXTRATO'
    end
    object mmContasPagarCHEQUE: TIntegerField
      FieldName = 'CHEQUE'
    end
    object mmContasPagarREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
    object mmContasPagarCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmContasPagarCONTA: TStringField
      FieldName = 'CONTA'
      Size = 100
    end
    object mmContasPagarID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsContapagar: TDataSource
    DataSet = mmContasPagar
    Left = 384
    Top = 168
  end
  object mmParcelas: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'TITULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SEQUENCIA'
        DataType = ftInteger
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DTAVEN'
        DataType = ftDate
      end
      item
        Name = 'DTAPAG'
        DataType = ftDate
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'VALOR_PAGO'
        DataType = ftCurrency
      end
      item
        Name = 'NOM_FOP'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Check'
        DataType = ftBoolean
      end>
    Left = 256
    Top = 112
    object mmParcelasID: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'ID'
    end
    object mmParcelasTITULO: TStringField
      FieldName = 'TITULO'
    end
    object mmParcelasSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object mmParcelasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object mmParcelasHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 500
    end
    object mmParcelasDTAVEN: TDateField
      Alignment = taCenter
      FieldName = 'DTAVEN'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmParcelasDTAPAG: TDateField
      Alignment = taCenter
      FieldName = 'DTAPAG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmParcelasVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object mmParcelasVALOR_PAGO: TCurrencyField
      FieldName = 'VALOR_PAGO'
    end
    object mmParcelasNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 100
    end
    object mmParcelasCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmParcelasCOD_FOP: TIntegerField
      FieldName = 'COD_FOP'
    end
    object mmParcelasCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object mmParcelasID_PLANO_CONTAS: TIntegerField
      FieldName = 'ID_PLANO_CONTAS'
    end
    object mmParcelasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object mmParcelasID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
    end
    object mmParcelasID_REPRESENTANTE: TIntegerField
      FieldName = 'ID_REPRESENTANTE'
    end
  end
  object dsParcelas: TDataSource
    DataSet = mmParcelas
    Left = 304
    Top = 112
  end
  object Q_parcela: TFDQuery
    Connection = dao.CN
    Left = 416
    Top = 408
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
    ReportOptions.CreateDate = 40150.698157500000000000
    ReportOptions.LastChange = 44564.529886990740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 464
    Top = 48
    Datasets = <
      item
        DataSet = Dm.dst_contas_pagar
        DataSetName = 'dst_contas_pagar'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 668.976810000000000000
          Width = 75.590600000000000000
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
          Left = 657.638220000000000000
          Top = 19.677180000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
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
          Left = 34.015770000000000000
          Top = 30.559060000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de Contas a Pagar entre:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 30.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtaini]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 30.559060000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 335.378170000000000000
          Top = 30.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtafin]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PLASFAN')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 38.574830000000000000
        Top = 245.669450000000000000
        Width = 755.906000000000000000
        DataSet = Dm.dst_contas_pagar
        DataSetName = 'dst_contas_pagar'
        RowCount = 0
        object dst_contas_receberNOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 72.566929130000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_contas_pagar."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object dst_contas_receberDTAVEN1: TfrxMemoView
          AllowVectorExport = True
          Left = 369.637780630000000000
          Width = 49.133853390000000000
          Height = 15.118120000000000000
          DataField = 'DTAVEN'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_contas_pagar."DTAVEN"]')
          ParentFont = False
        end
        object dst_contas_receberDTAREC: TfrxMemoView
          AllowVectorExport = True
          Left = 421.307360000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'DTAPAG'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_contas_pagar."DTAPAG"]')
          ParentFont = False
        end
        object dst_contas_receberNOM_FOP: TfrxMemoView
          AllowVectorExport = True
          Left = 611.063390000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DataField = 'NOM_FOP'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_contas_pagar."NOM_FOP"]')
          ParentFont = False
        end
        object dst_contas_receberTITULO: TfrxMemoView
          AllowVectorExport = True
          Left = 1.133858267716540000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataField = 'TITULO'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_contas_pagar."TITULO"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 0.755778580000000000
          Top = 15.456710000000000000
          Width = 748.346815510000000000
          Height = 22.677180000000000000
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'HIST'#211'RICO:[dst_contas_pagar."representante"]-[dst_contas_pagar."' +
              'HISTORICO1"]')
          ParentFont = False
        end
        object dst_contas_receberVALOR: TfrxMemoView
          AllowVectorExport = True
          Left = 469.661720000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataField = 'VALOR'
          DataSet = Dm.dst_contas_pagar
          DataSetName = 'dst_contas_pagar'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_contas_pagar."VALOR"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 476.220780000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 132.283550000000000000
        Width = 755.906000000000000000
        Condition = '<dst_contas_pagar."NOM_EMPRESA">'
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clMenuHighlight
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
        end
        object dst_contas_receberNOM_EMPRESA: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Width = 691.653990000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clMenuHighlight
          Memo.UTF8W = (
            '[dst_contas_pagar."NOM_EMPRESA"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 173.858380000000000000
        Width = 755.906000000000000000
        Condition = '<dst_contas_pagar."DTAVEN">'
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Data Vencimento:')
          ParentFont = False
        end
        object dst_contas_receberDTAVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            '[dst_contas_pagar."DTAVEN"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 32.236240000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Titulo-Seq')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 72.590600000000000000
          Top = 32.236240000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 369.614410000000000000
          Top = 32.236240000000000000
          Width = 49.133853390000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dta.Ven.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 421.307360000000000000
          Top = 32.236240000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Dta.Pag.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 469.882190000000000000
          Top = 32.236240000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 32.236240000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Pago')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 611.063390000000000000
          Top = 32.236240000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'F.Pgto')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 755.906000000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 467.661720000000000000
          Top = 3.000000000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 324.039580000000000000
          Top = 3.000000000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Total Dia:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 560.149970000000000000
          Top = 3.220470000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR_PAGO">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 755.906000000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Top = 3.779530000000020000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clMenuHighlight
          Memo.UTF8W = (
            'Total Empresa::')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 467.882190000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clMenuHighlight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 560.125984251969000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clMenuHighlight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR_PAGO">,MasterData1)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 434.645950000000000000
        Width = 755.906000000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 325.039580000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR">,MasterData1,2)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 560.149970000000000000
          Top = 0.220469999999978000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_contas_pagar."VALOR_PAGO">,MasterData1,2)]')
          ParentFont = False
        end
      end
      object dst_contas_receberVALOR_RECEBIDO: TfrxMemoView
        AllowVectorExport = True
        Left = 540.472790000000000000
        Top = 245.448980000000000000
        Width = 68.031496060000000000
        Height = 15.118120000000000000
        DataField = 'VALOR_PAGO'
        DataSet = Dm.dst_contas_pagar
        DataSetName = 'dst_contas_pagar'
        DisplayFormat.DecimalSeparator = '.'
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[dst_contas_pagar."VALOR_PAGO"]')
        ParentFont = False
      end
    end
  end
  object Q_cp1: TFDQuery
    Connection = dao.CN
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 384
    Top = 376
  end
end
