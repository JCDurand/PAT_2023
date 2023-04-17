unit dmTest_u;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TdmTest = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conTest: TADOConnection;
    tblCustomers: TADOTable;
    dscCustomers: TDataSource;
  end;

var
  dmTest: TdmTest;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmTest.DataModuleCreate(Sender: TObject);
begin
  conTest := TADOConnection.Create(dmTest);
  tblCustomers := TADOTable.Create(dmTest);
  dscCustomers := TDataSource.Create(dmTest);

  conTest.Close;
  conTest.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source = ' + ExtractFilePath(ParamStr(0)) + 'PAT_Base.mdb' + ';Persist Security Info = False';
  conTest.LoginPrompt := False;
  conTest.Open();

  tblCustomers.Connection := conTest;
  tblCustomers.TableName := 'Customer';

  dscCustomers.DataSet := tblCustomers;

  tblCustomers.Open;
end;

end.
