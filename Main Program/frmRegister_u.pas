unit frmRegister_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  frmCustomer_u, frmPopulate_u, clsCustomer_u, dmTest_u,
  JPEG;

type
  TfrmRegister = class(TForm)
    imgBack: TImage;
    pnlInstructions: TPanel;
    ledName: TLabeledEdit;
    ledSurname: TLabeledEdit;
    ledEmail: TLabeledEdit;
    ledAddress: TLabeledEdit;
    ledCity: TLabeledEdit;
    ledPost: TLabeledEdit;
    cmbCountry: TComboBox;
    rgpPayment: TRadioGroup;
    lblCountry: TLabel;
    lblPayment: TLabel;
    ledPW: TLabeledEdit;
    ledPWConf: TLabeledEdit;
    bitbtnRegister: TBitBtn;
    bitbtnCancel: TBitBtn;
    ledCard: TLabeledEdit;
    ledBank: TLabeledEdit;
    ledPhone: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure bitbtnCancelClick(Sender: TObject);
    procedure rgpClick(Sender: TObject);
    procedure bitbtnRegisterClick(Sender: TObject);
    procedure ledNameExit(Sender: TObject);
    procedure ledSurnameExit(Sender: TObject);
    procedure ledEmailExit(Sender: TObject);
    procedure cmbCountryExit(Sender: TObject);
    procedure ledAddressExit(Sender: TObject);
    procedure ledCityExit(Sender: TObject);
    procedure ledPostExit(Sender: TObject);
    procedure ledCardExit(Sender: TObject);
    procedure ledBankExit(Sender: TObject);
    procedure ledPassExit(Sender: TObject);
    procedure ledPassConfExit(Sender: TObject);
    procedure ledPhoneExit(Sender: TObject);
  private
    { Private declarations }
  sPassCheck: String;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

uses
  frmWelcome_u;
{$R *.dfm}

procedure TfrmRegister.bitbtnCancelClick(Sender: TObject);
begin
  frmRegister.Hide;
  frmWelcome.Show;
end;

procedure TfrmRegister.bitbtnRegisterClick(Sender: TObject);
var
  objCustomer: TCustomer;
begin
  frmCustomer.increaseArraySize;

  objCustomer := TCustomer.Create(frmPopulate.generateCode(ledName.Text, ledSurname.Text),
  ledName.Text, ledSurname.Text, ledPhone.Text, ledEmail.Text, ledAddress.Text, ledCity.Text,
  ledPost.Text, cmbCountry.Items[cmbCountry.ItemIndex], rgpPayment.Items[rgpPayment.ItemIndex],
  ledCard.Text, ledBank.Text, ledPWConf.Text);

  with dmTest do begin
    tblCustomers.Last;
    tblCustomers.Insert;

    tblCustomers['CID'] := frmPopulate.generateCode(ledName.Text, ledSurname.Text);
    tblCustomers['CFirstname'] := ledName.Text;
    tblCustomers['CLastName'] := ledSurname.Text;
    tblCustomers['CPhoneNum'] := ledPhone.Text;
    tblCustomers['CEmail'] := ledEmail.Text;
    tblCustomers['CAddress'] := ledAddress.Text;
    tblCustomers['CCity'] := ledCity.Text;
    tblCustomers['CPost'] := ledPost.Text;
    tblCustomers['CCountry'] := cmbCountry.Items[cmbCountry.ItemIndex];
    tblCustomers['CPayMethod'] := rgpPayment.Items[rgpPayment.ItemIndex];
    tblCustomers['CCardNum'] := ledCard.Text;
    tblCustomers['CBankAccountNum'] := ledBank.Text;

    dmTest.tblCustomers.Post;

  end;

  frmCustomer.arrCustomer[frmCustomer.iCusCount -1] := objCustomer;

  frmRegister.Hide;
  frmWelcome.Show;
end;

procedure TfrmRegister.cmbCountryExit(Sender: TObject);
begin
  if cmbCountry.ItemIndex = -1 then
    begin
      ShowMessage('Please select a country.');
      cmbCountry.SetFocus;
    end;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');

  ledCard.Visible := False;
  ledBank.Visible := False;
  ledPWConf.Visible := False;
end;

procedure TfrmRegister.ledAddressExit(Sender: TObject);
begin
  if Length(ledAddress.Text) > 255 then
    begin
      ShowMessage('Address too long.');
      ledAddress.Clear;
      ledAddress.SetFocus;
    end;

end;

procedure TfrmRegister.ledBankExit(Sender: TObject);
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

procedure TfrmRegister.ledCardExit(Sender: TObject);
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

procedure TfrmRegister.ledCityExit(Sender: TObject);
begin
  if Length(ledCity.Text) > 30 then
    begin
      ShowMessage('City name is too long.');
      ledCity.Clear;
      ledCity.SetFocus;
    end;
end;

procedure TfrmRegister.ledEmailExit(Sender: TObject);
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

procedure TfrmRegister.ledNameExit(Sender: TObject);
begin
  if Length(ledName.Text) > 25 then
    begin
      ShowMessage('Name is too long. May not exceed more than 25 characters.');
      ledName.Clear;
      ledName.SetFocus;
    end;
end;

procedure TfrmRegister.ledPassConfExit(Sender: TObject);
begin
  if ledPWConf.Text <> sPassCheck then
    begin
      ShowMessage('Passwords do not match.');
      ledPWConf.Clear;
      ledPWConf.SetFocus;
    end;
end;

procedure TfrmRegister.ledPassExit(Sender: TObject);
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

procedure TfrmRegister.ledPhoneExit(Sender: TObject);
var
  I : Integer;
  sText: String;
begin
  sText := ledPhone.Text;

  if sText = '' then
    begin
      ShowMessage('Please enter a phone number.');
      ledPhone.SetFocus;
    end
  else if Length(sText) > 12 then
    begin
      ShowMessage('Phone number may not exceed 12 characters.');
      ledPhone.Clear;
      ledPhone.SetFocus;
    end;

end;

procedure TfrmRegister.ledPostExit(Sender: TObject);
begin
  if Length(ledPost.Text) > 8 then
    begin
      ShowMessage('Post code is too long.');
      ledPost.Clear;
      ledPost.SetFocus;
    end;
end;

procedure TfrmRegister.ledSurnameExit(Sender: TObject);
begin
  if Length(ledSurname.Text) > 25 then
    begin
      ShowMessage('Surname is too long. May not exceed more than 25 characters.');
      ledSurname.Clear;
      ledSurname.SetFocus;
    end;
end;

procedure TfrmRegister.rgpClick(Sender: TObject);
begin
  case rgpPayment.ItemIndex of
    0: begin
      ledBank.Visible := True;
      ledCard.Visible := False;
    end;
    1: begin
      ledCard.Visible := True;
      ledBank.Visible := False;
    end;
  end;
end;

end.
