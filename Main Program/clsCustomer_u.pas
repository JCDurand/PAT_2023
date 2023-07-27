unit clsCustomer_u;

interface

type
  TCustomer = class(TObject)

  private

  var
    fCID, fFirstName, fLastName, fPhoneNum, fEmail, fAddress, fCity, fPost,
    fCountry, fPayMethod, fCardNum, fBankNum, fPassword: String;


  public
    Constructor Create(sCID, sFirstName, sLastName, sPhoneNum, sEmail, sAddress, sCity, sPost,
                       sCountry, sPayMethod, sCardNum, sBankNum, sPassword: String);
    function getEmail: String;
    function getPass: String;

end;

implementation


{ TCustomer }

constructor TCustomer.Create(sCID, sFirstName, sLastName, sPhoneNum, sEmail,
  sAddress, sCity, sPost, sCountry, sPayMethod, sCardNum, sBankNum, sPassword: String);
begin
  fCID := sCID;
  fFirstName := sFirstName;
  fLastName := sLastName;
  fPhoneNum := sPhoneNum;
  fEmail := sEmail;
  fAddress := sAddress;
  fCity := sCity;
  fPost := sPost;
  fCountry := sCountry;
  fPayMethod := sPayMethod;
  fCardNum := sCardNum;
  fBankNum := sBankNum;
  fPassword := sPassword
end;

function TCustomer.getEmail: String;
begin
  Result := fEmail;
end;

function TCustomer.getPass: String;
begin
  Result := fPassword;
end;

end.
