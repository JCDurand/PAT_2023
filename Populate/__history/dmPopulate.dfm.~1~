object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 369
  Width = 538
  object connPAT: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Jean Duran' +
      'd\Nextcloud4\Skool\Parel Vallei\Gr 12\Subjects\IT\PAT_2023\PAT_B' +
      'ase.mdb;Mode=ReadWrite;Persist Security Info=False'
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 40
  end
  object dscCustomer: TDataSource
    DataSet = tblCustomer
    Left = 48
    Top = 144
  end
  object dscSupplier: TDataSource
    DataSet = tblSupplier
    Left = 216
    Top = 144
  end
  object tblCustomer: TADOTable
    Active = True
    Connection = connPAT
    CursorType = ctStatic
    TableName = 'Customer'
    Left = 48
    Top = 88
  end
  object tblOrders: TADOTable
    Active = True
    Connection = connPAT
    CursorType = ctStatic
    TableName = 'Orders'
    Left = 104
    Top = 88
  end
  object tblProduct: TADOTable
    Active = True
    Connection = connPAT
    CursorType = ctStatic
    TableName = 'Product'
    Left = 160
    Top = 88
  end
  object tblSupplier: TADOTable
    Active = True
    Connection = connPAT
    CursorType = ctStatic
    TableName = 'Supplier'
    Left = 216
    Top = 88
  end
  object dscOrders: TDataSource
    DataSet = tblOrders
    Left = 104
    Top = 144
  end
  object dscProduct: TDataSource
    DataSet = tblProduct
    Left = 160
    Top = 144
  end
end
