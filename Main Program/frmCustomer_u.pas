unit frmCustomer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dmTest_u,
  clsCustomer_u, Vcl.StdCtrls;

type
  TfrmCustomer = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure increaseArraySize;
    procedure addCustomer(objCustomer: TCustomer);s
  private
    { Private declarations }
  public
    { Public declarations }
    arrCustomer: Array of TObject;
    iCusCount: Integer;
  end;

var
  frmCustomer: TfrmCustomer;

implementation

{$R *.dfm}

procedure TfrmCustomer.addCustomer(objCustomer: TCustomer);
begin
  frmCustomer.arrCustomer[frmCustomer.iCusCount -1] := objCustomer;
end;

procedure TfrmCustomer.FormCreate(Sender: TObject); //loads customer objects into arrCustomer
var
  I, iCount : Integer;
  objCustomer: TCustomer;
begin
  iCount := 0;

  with dmTest do
    begin
      tblCustomers.First;
      while NOT tblCustomers.Eof do
        begin
          Inc(iCusCount);
          tblCustomers.Next;
        end;  //WHILE

    end;  //WITH

  SetLength(arrCustomer, iCusCount);

  with dmTest do
    begin
      tblCustomers.First;

      while NOT tblCustomers.Eof do
        begin
          objCustomer := TCustomer.Create(tblCustomers['CID'], tblCustomers['CFirstName'],
          tblCustomers['CLastName'],tblCustomers['CPhoneNum'],tblCustomers['CEmail'],tblCustomers['CAddress'],
          tblCustomers['CCity'],tblCustomers['CPost'],tblCustomers['CCountry'],tblCustomers['CPayMethod'],
          tblCustomers['CCardNum'],tblCustomers['CBankAccountNum'],tblCustomers['CPassword']);

          arrCustomer[iCount] := objCustomer;  //arrCustomer populated

          Inc(iCount);
          tblCustomers.Next;
        end;  //WHILE

    end;  //WITH


end;
procedure TfrmCustomer.increaseArraySize;
begin
  Inc(iCusCount);
  SetLength(arrCustomer, iCusCount);
end;

end.
