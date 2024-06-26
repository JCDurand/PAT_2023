unit frmLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls,
  frmRegister_u, dmTest_u, frmCustomer_u, frmSupplier_u, frmStore_u, frmTFile_u, frmAdmin_u,
  clsSupplier_u, clsCustomer_u,
  JPEG, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnlWelcome: TPanel;
    lblLogin: TLabel;
    lblRegister: TLabel;
    ledUsername: TLabeledEdit;
    ledPass: TLabeledEdit;
    bitbtnLogin: TBitBtn;
    bitbtnClose: TBitBtn;
    btnRegister: TButton;
    imgBack: TImage;
    imgTree: TImage;
    btnForgot: TButton;
    imgPWShow: TImage;
    btnAdmin: TButton;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitbtnCloseClick(Sender: TObject);
    procedure bitbtnLoginClick(Sender: TObject);
    procedure btnForgotClick(Sender: TObject);
    procedure imgPWShowClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
  private
    { Private declarations }
    objCustomer: TCustomer;
  public
    { Public declarations }
    iSupCount: Integer;  //global counter for customers and suppliers in database
    sUser: String;

  end;

var
  frmLogin: TfrmLogin;

implementation

  {uses
      clsCustomer_u;}

{$R *.dfm}

procedure TfrmLogin.bitbtnCloseClick(Sender: TObject);
begin
  Exit;
end;

procedure TfrmLogin.bitbtnLoginClick(Sender: TObject);
var
  I: Integer;
  sEmail, sPW, sName, sSurName: String;
  bFlag, bFlag2, bFlag3: Boolean;
begin
  sEmail := ledUsername.Text;
  sPW := ledPass.Text;
  bFlag := False;
  bFlag2 := False;
  bFlag3 := False;

  dmtest.tblSupplier.Locate('SEmail', sEmail, [loCaseInsensitive]);

  with dmTest do
  begin


    if (tblSupplier['SPassword'] = sPW) AND (tblSupplier['SEmail'] = sEmail)  then
    begin
      bFlag2 := True;
      sUser := tblSupplier['SID'];
      sName := tblSupplier['SFirstName'];
      sSurName := tblSupplier['SLastName'];
    end
    else if (sEmail = 'admin@mail.com') AND (tblCustomers['CPassword'] = sPW)   then
    begin
      bFlag3 := True;
    end;

  end;

  for I := 0 to frmCustomer.iCusCount-1 do
  begin
    objCustomer := frmCustomer.arrCustomer[I];

    if (objCustomer.getEmail = sEmail) AND (objCustomer.getPass = sPW) then
      begin
        bFlag := True;
        sName := objCustomer.getName;
        sSurName := objCustomer.getSurName;
        sUser := objCustomer.getCID;
      end //IF


  end;  //FOR

  if bflag3 then
  begin
    ShowMessage('Welcome, admin');
    frmLogin.Hide;

    frmAdmin.ShowModal; //not working, see btnAdmin
    ShowMessage('Hello world.');
    frmTFile.addSupLine('Admin has logged in.');
    Exit;
  end
  else if bFlag then
    begin
      ShowMessage('Welcome, ' + sName);
      frmLogin.Hide;
      frmStore.Show;
      frmTFile_u.frmTFile.addCustLine(sName + ' ' + sSurName + ' logged in.');
    end
  else if bFlag2 then
  begin
    ShowMessage('Welcome, ' + sName);
    frmLogin.Hide;
    frmSupplier.Show;
    frmTFile.addSupLine(sName + ' ' + sSurName + ' logged in');
  end
  else
    begin
      ShowMessage('Invalid credentials entered.');
      ledUsername.Clear;
      ledPass.Clear;
      frmTFile_u.frmTFile.addCustLine('Invalid credentials entered.');
    end;
end;

procedure TfrmLogin.btnForgotClick(Sender: TObject);
var
  sEmail: String;
begin
  sEmail := InputBox('Password recovery', 'Please enter your email address:','');

  with dmTest do
  begin
    {runSQL2('SELECT CPassword, CEmail FROM Customer WHERE CEmail = ' + QuotedStr(sEmail));}


    if tblCustomers.Locate('CEmail', sEmail, [loCaseInsensitive]) then
      ShowMessage('Your password is: ' + tblCustomers['CPassword'])
    else
      ShowMessage('Invalid email entered.');

    frmTFile.addCustLine(tblCustomers['CFirstName'] + ' ' + tblCustomers['CLastName'] + ' recovered their password.');
  end;


end;

procedure TfrmLogin.btnRegisterClick(Sender: TObject);
begin
  frmLogin.Hide;
  frmRegister.Show;
end;

procedure TfrmLogin.btnAdminClick(Sender: TObject);
begin
  frmLogin.Hide;
  frmAdmin.Show;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');

  imgTree.Stretch := True;
  imgTree.Picture.LoadFromFile('Tree.jpg'); //load images for background

  ledUsername.Clear;
  ledPass.Clear;

  iSupCount := 0;

  with dmTest do
    begin

      tblSupplier.First;
      while NOT tblSupplier.Eof do
        begin
          Inc(iSupCount);
          tblSupplier.Next;
        end;
    end;  //WITH


  SetLength(frmSupplier.arrSupplier, iSupCount);  //initializes dynamic arrays

  frmCustomer.refreshArrCus;
end;

procedure TfrmLogin.imgPWShowClick(Sender: TObject);
begin
  case ledPass.PasswordChar of
    #0: ledPass.PasswordChar := '*';
    '*': ledPass.PasswordChar := #0;
  end;
end;

end.
