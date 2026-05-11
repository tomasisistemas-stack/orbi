object DMCONSIS: TDMCONSIS
  OldCreateOrder = False
  Height = 325
  Width = 370
  object QUJUR: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT * FROM TBJUR')
    Left = 96
    Top = 8
  end
  object TRCONSIS: TFDTransaction
    Left = 24
    Top = 8
  end
  object DSJUR: TDataSource
    DataSet = QUJUR
    Left = 152
    Top = 8
  end
  object QUUSU: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select u.*, e.nom_empresa from tbusu u'
      'left join empresa e on e.cod_empresa=u.cod_empresa')
    Left = 100
    Top = 72
  end
  object DSUSU: TDataSource
    DataSet = QUUSU
    Left = 155
    Top = 72
  end
  object TRUSU: TFDTransaction
    Left = 24
    Top = 72
  end
  object QUNUMNOT: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select * from tbinc')
    Left = 96
    Top = 144
  end
  object DSNUMNOT: TDataSource
    DataSet = QUNUMNOT
    Left = 168
    Top = 144
  end
  object TRNUMNOT: TFDTransaction
    Left = 24
    Top = 144
  end
  object QUPROSIS: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT * FROM TBPROSIS')
    Left = 88
    Top = 208
  end
  object DSPROSIS: TDataSource
    DataSet = QUPROSIS
    Left = 168
    Top = 208
  end
  object TRPROSIS: TFDTransaction
    Left = 24
    Top = 216
  end
end
