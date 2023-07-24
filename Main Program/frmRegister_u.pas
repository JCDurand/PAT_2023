unit frmRegister_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  frmCustomer_u, clsCustomer_u, dmTest_u,
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
    lblCountryy: TLabel;
    lblPayment: TLabel;
    ledPW: TLabeledEdit;
    ledPWConf: TLabeledEdit;
    bitbtnRegister: TBitBtn;
    bitbtnCancel: TBitBtn;
    ledCard: TLabeledEdit;
    ledBank: TLabeledEdit;
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
  private
    { Private declarations }
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