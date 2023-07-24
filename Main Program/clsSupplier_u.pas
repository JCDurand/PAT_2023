unit clsSupplier_u;

interface

type
  TSupplier = class(TObject)

  private
  fLastName, fFirstName, fEmail, fPhoneNum, fID : String;

  public
  constructor Create(sLastName, sFirstName, sEmail, sPhonenum, sID: String);
  function getFirstName: String;
  function getLastName: string;
  function getEmail: string;
  function getPhoneNum: string;
  function getID: string;
  procedure setFirstName(sName: String);
  procedure setLastName(sSurname: String);
  procedure setEmail(sEmail: String);
  procedure setPhoneNum(sPhoneNum: String);

  end;

implementation

{ TSupplier }

constructor TSupplier.Create(sLastName, sFirstName, sEmail, sPhonenum,
  sID: String);
begin
  fLastName := sLastName;
  fFirstName := sFirstName;
  fEmail := sEmail;
  fPhoneNum := sPhonenum;
  fID := sID;
end;

function TSupplier.getEmail: string;
begin
  Result := fEmail;
end;

function TSupplier.getFirstName: String;
begin
  Result := fFirstName;
end;

function TSupplier.getID: string;
begin
  Result := fID;
end;

function TSupplier.getLastName: string;
begin
  Result := fLastName;
end;

function TSupplier.getPhoneNum: string;
begin
  Result := fPhoneNum;
end;

procedure TSupplier.setEmail(sEmail: String);
begin
  fEmail := sEmail;
end;

procedure TSupplier.setFirstName(sName: String);
begin
  fFirstName := sName;
end;

procedure TSupplier.setLastName(sSurname: String);
begin
  fLastName := sSurname;
end;

procedure TSupplier.setPhoneNum(sPhoneNum: String);
begin
  fPhoneNum := sPhoneNum;
end;

end.
