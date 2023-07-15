unit clsCustomer_u;

interface

type
  TCustomer = class(TObject)

  private

  var
    fCID, fFirstName, fLastName, fPhoneNum, fEmail, fAddress, fCity, fPost,
    fCountry, fPayMethod, fCardNum, fBankNum: String;

  public
    Constructor Create(sCID, sFirstName, sLastName, sPhoneNum, sEmail, sAddress, sCity, sPost,
                       sCountry, sPayMethod, sCardNum, sBankNum: String);

end;

implementation


{ TCustomer }

constructor TCustomer.Create(sCID, sFirstName, sLastName, sPhoneNum, sEmail,
  sAddress, sCity, sPost, sCountry, sPayMethod, sCardNum, sBankNum: String);
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
end;

end.
