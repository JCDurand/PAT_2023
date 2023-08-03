unit dmTest_u;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB, Data.FMTBcd, Data.DbxSqlite,
  Data.SqlExpr, Vcl.Dialogs;

type
  TdmTest = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conTest: TADOConnection;
    tblCustomers, tblOrders, tblSupplier, tblProduct: TADOTable;
    dscCustomers, dscOrders, dscSupplier, dscProduct,
    qdscProd, qdscSup: TDataSource;
    qryA, qryB, qryProd, qrySup: TADOQuery;

    procedure runSQL(sSQL: String);
    procedure runSQL2(sSQL: String);
    procedure runSQLSup(sSQL: String);
    procedure runSQLProd(sSQL: String);
  end;

var
  dmTest: TdmTest;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmTest.DataModuleCreate(Sender: TObject);
begin
  conTest := TADOConnection.Create(dmTest);
  qryA := TADOQuery.Create(dmTest);
  qryB := TADOQuery.Create(dmTest);
  qryProd := TADOQuery.Create(dmTest);
  qrySup := TADOQuery.Create(dmTest);

  tblCustomers := TADOTable.Create(dmTest);
  tblOrders := TADOTable.Create(dmTest);
  tblSupplier := TADOTable.Create(dmTest);
  tblProduct := TADOTable.Create(dmTest);

  dscCustomers := TDataSource.Create(dmTest);
  dscOrders := TDataSource.Create(dmTest);
  dscSupplier := TDataSource.Create(dmTest);
  dscProduct := TDataSource.Create(dmTest);
  qdscProd := TDataSource.Create(dmTest);
  qdscSup := TDataSource.Create(dmTest);

  conTest.Close;
  conTest.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source = ' + ExtractFilePath(ParamStr(0)) + 'PAT_Base.mdb' + ';Persist Security Info = False';
  conTest.LoginPrompt := False;
  conTest.Open();

  qryA.Connection := conTest;
  qryB.Connection := conTest;
  qryProd.Connection := conTest;
  qrySup.Connection := conTest;

  tblCustomers.Connection := conTest;
  tblOrders.Connection := conTest;
  tblSupplier.Connection := conTest;
  tblProduct.Connection := conTest;

  tblCustomers.TableName := 'Customer';
  tblOrders.TableName := 'Orders';
  tblSupplier.TableName := 'Supplier';
  tblProduct.TableName := 'Product';

  dscCustomers.DataSet := tblCustomers;
  dscOrders.DataSet := tblOrders;
  dscSupplier.DataSet := tblSupplier;
  dscProduct.DataSet := tblProduct;

  qdscProd.DataSet := qryProd;
  qdscSup.DataSet := qrySup;

  tblCustomers.Open;
  tblOrders.Open;
  tblSupplier.Open;
  tblProduct.Open;
end;

procedure TdmTest.runSQL(sSQL: String);
begin
  if Length(sSQL) <> 0 then
  begin
    qryA.Close;
    qryA.SQL.Text := sSQL;
    qryA.ExecSQL;
  end
  else
    ShowMessage('No SQL statement entered.');
end;

procedure TdmTest.runSQL2(sSQL: String);
begin
  if Length(sSQL) <> 0 then
  begin
    qryB.Close;
    qryB.SQL.Text := sSQL;
    qryB.Open;
  end
  else
    ShowMessage('No SQL statement entered.');
end;

procedure TdmTest.runSQLProd(sSQL: String);
begin
  if Length(sSQL) <> 0 then
  begin
    qryProd.Close;
    qryProd.SQL.Text := sSQL;
    qryProd.Open;
  end
  else
    ShowMessage('No SQL statement entered.');
end;

procedure TdmTest.runSQLSup(sSQL: String);
begin
  if Length(sSQL) <> 0 then
  begin
    qrySup.Close;
    qrySup.SQL.Text := sSQL;
    qrySup.Open;
  end
  else
    ShowMessage('No SQL statement entered.');
end;

end.

