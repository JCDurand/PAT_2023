unit frmCustomer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.TabNotBk,
  Vcl.Mask, Vcl.Buttons, ADODB, DATA.DB,
  dmTest_u,
  clsCustomer_u;

type
  TfrmCustomer = class(TForm)
    bitbtnCancel: TBitBtn;
    bitbtnUpdate: TBitBtn;
    cmbCountry: TComboBox;
    imgBack: TImage;
    lblCountry: TLabel;
    lblPayment: TLabel;
    ledAddress: TLabeledEdit;
    ledBank: TLabeledEdit;
    ledCard: TLabeledEdit;
    ledCity: TLabeledEdit;
    ledEmail: TLabeledEdit;
    ledPhone: TLabeledEdit;
    ledPost: TLabeledEdit;
    ledPW: TLabeledEdit;
    ledPWConf: TLabeledEdit;
    pnlInstructions: TPanel;
    rgpPayment: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure increaseArraySize;
    procedure addCustomer(objCustomer: TCustomer);
    procedure ledPhoneExit(Sender: TObject);
  private
    { Private declarations }
    procedure prepDB(sText: String);
  public
    { Public declarations }
    arrCustomer: Array of TCustomer;
    iCusCount: Integer;
  end;

var
  frmCustomer: TfrmCustomer;

implementation

uses
  frmLogin_u;

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

procedure TfrmCustomer.ledPhoneExit(Sender: TObject);
begin
  with dmTest do
  begin
    prepDB(ledPhone.Text);

    tblCustomers['CPhoneNum'] := ledPhone.Text;
    tblCustomers.Post;
  end;
end;

procedure TfrmCustomer.prepDB(sText: String);
begin
  if sText = '' then
    begin
      ShowMessage('Please enter a new value.');
      Exit;
    end;

  with dmTest do
  begin
    tblCustomers.Locate('CID', frmLogin.sUser, [loCaseInsensitive]);
    tblCustomers.Insert;
  end;
end;

end.
