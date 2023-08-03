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
    procedure cmbCountryExit(Sender: TObject);
    procedure ledAddressExit(Sender: TObject);
    procedure ledBankExit(Sender: TObject);
    procedure ledCardExit(Sender: TObject);
    procedure ledCityExit(Sender: TObject);
    procedure ledEmailExit(Sender: TObject);
    procedure ledPwConfExit(Sender: TObject);
    procedure ledPwExit(Sender: TObject);
    procedure ledCostCode(Sender: TObject);
  private
    { Private declarations }
    sPassCheck: String;
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

procedure TfrmCustomer.cmbCountryExit(Sender: TObject);
begin
  if cmbCountry.ItemIndex = -1 then
    begin
      ShowMessage('Please select a country.');
      cmbCountry.SetFocus;
    end;
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

procedure TfrmCustomer.ledAddressExit(Sender: TObject);
begin
  if Length(ledAddress.Text) > 255 then
    begin
      ShowMessage('Address too long.');
      ledAddress.Clear;
      ledAddress.SetFocus;
    end;
end;

procedure TfrmCustomer.ledBankExit(Sender: TObject);
var
  I, iCount: Integer;
  sText: String;
begin
  iCount := 0;
  sText := LowerCase(ledBank.Text);

  if sText = '' then
    begin
      ShowMessage('Please enter a bank number.');
      ledCard.Clear;
      ledCard.SetFocus;
      Exit;
    end;

  for I := 1 to Length(sText) do
      begin
        if sText[I] IN ['a'..'z'] then
          Inc(iCount);
      end;

  if iCount > 0 then
    begin
      ShowMessage('Bank number may only contain numbers.');
      ledCard.Clear;
      ledCard.SetFocus;
    end
  else if Length(ledCard.Text) > 16 then
    begin
      ShowMessage('Bank number may not exceed 16 characters.');
      ledCard.Clear;
      ledCard.SetFocus;
    end;
end;

procedure TfrmCustomer.ledCardExit(Sender: TObject);
var
  I, iCount: Integer;
  sText: String;
begin
  iCount := 0;
  sText := LowerCase(ledCard.Text);

  if sText = '' then
    begin
      ShowMessage('Please enter a card number.');
      ledCard.Clear;
      ledCard.SetFocus;
      Exit;
    end;

  for I := 1 to Length(sText) do
      begin
        if sText[I] IN ['a'..'z'] then
          Inc(iCount);
      end;

  if iCount > 0 then
    begin
      ShowMessage('Card number may only contain numbers.');
      ledCard.Clear;
      ledCard.SetFocus;
    end
  else if Length(ledCard.Text) > 16 then
    begin
      ShowMessage('Card number may not exceed 16 characters.');
      ledCard.Clear;
      ledCard.SetFocus;
    end;
end;

procedure TfrmCustomer.ledCityExit(Sender: TObject);
begin
  if Length(ledCity.Text) > 30 then
    begin
      ShowMessage('City name is too long.');
      ledCity.Clear;
      ledCity.SetFocus;
    end;
end;

procedure TfrmCustomer.ledCostCode(Sender: TObject);
begin
  if Length(ledPost.Text) > 8 then
    begin
      ShowMessage('Post code is too long.');
      ledPost.Clear;
      ledPost.SetFocus;
    end;
end;

procedure TfrmCustomer.ledEmailExit(Sender: TObject);
var
  bFlag1, bFlag2: Boolean;
  I, iPos : Integer;

begin
  bFlag1 := False;
  bFlag2 := False;
  iPos := -1;

  if Length(ledEmail.Text) > 100 then
    begin
      ShowMessage('Email is too long. May not exceed more than 100 characters.');
      ledEmail.Clear;
      ledEmail.SetFocus;
    end;

  for I := 1 to Length(ledEmail.Text) do
    begin
      if ledEmail.Text[I] = '@' then
        begin
          bFlag1 := True;
          iPos := I;
        end;
      if (ledEmail.Text[I] = '.') AND (I > iPos) then
        bFlag2 := True;
    end;  //FOR

  if NOT (bFlag1 OR bFlag2) then
    begin
      ShowMessage('Invalid email entered.');
      ledEmail.Clear;
      ledEmail.SetFocus;
    end;
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

procedure TfrmCustomer.ledPwConfExit(Sender: TObject);
begin
if ledPWConf.Text <> sPassCheck then
    begin
      ShowMessage('Passwords do not match.');
      ledPWConf.Clear;
      ledPWConf.SetFocus;
    end;
end;

procedure TfrmCustomer.ledPwExit(Sender: TObject);
var
  I, iAlphaCount, iNumCount, iSpecCount: Integer;
  sText: String;
begin
  iAlphaCount := 0;
  iNumCount := 0;
  iSpecCount := 0;
  sText := ledPW.Text;

  for I := 1 to Length(sText) do
    begin
      if sText[I] IN ['A'..'Z'] then
        Inc(iAlphaCount);
      if sText[I] IN ['!'..'&'] then
        Inc(iSpecCount);
      if sText[I] IN ['0'..'9'] then
        Inc(iNumCount);
    end;

  if NOT ((iAlphaCount >= 2) OR (iSpecCount >= 1) OR (iNumCount >= 2)) then
    begin
      ShowMessage('Invalid password entered.');
      ledPW.Clear;
      ledPW.SetFocus;
    end
  else
    begin
      ledPWConf.Visible := True;
      sPassCheck := sText;
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
