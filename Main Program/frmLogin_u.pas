unit frmLogin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls,
  frmRegister_u, dmTest_u, frmCustomer_u, frmSupplier_u, frmStore_u, frmTFile_u,
  clsSupplier_u, clsCustomer_u,
  JPEG, Data.DB, Vcl.Grids, Vcl.DBGrids;

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
    DBGrid1: TDBGrid;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitbtnCloseClick(Sender: TObject);
    procedure bitbtnLoginClick(Sender: TObject);
    procedure btnForgotClick(Sender: TObject);
  private
    { Private declarations }
    objCustomer: TCustomer;
  public
    { Public declarations }
    iSupCount: Integer;  //global counter for customers and suppliers in database

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
  bFlag: Boolean;
begin
  sEmail := ledUsername.Text;
  sPW := ledPass.Text;
  bFlag := False;

  for I := 0 to frmCustomer.iCusCount-1 do
  begin
    objCustomer := frmCustomer.arrCustomer[I];

    if (objCustomer.getEmail = sEmail) AND (objCustomer.getPass = sPW) then
      begin
        bFlag := True;
        sName := objCustomer.getName;
        sSurName := objCustomer.getSurName;
      end //IF

  end;  //FOR

  if bFlag then
    begin
      ShowMessage('Welcome, ' + sName);
      frmLogin.Hide;
      frmStore.Show;
      frmTFile_u.frmTFile.addCustLine(sName + ' ' + sSurName + ' logged in.');
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
  bFlag: Boolean;
begin
  sEmail := InputBox('Password recovery', 'Please enter your email address:','');
  bFlag := False;

  with dmTest do
  begin
    runSQL('SELECT CPassword, CEmail FROM Customer WHERE CEmail = ' + QuotedStr(sEmail));

    if tblCustomers['CEmail'] = sEmail then
      ShowMessage('Your password is: ' + tblCustomers['CPassword'])
    else
      ShowMessage('Invalid email entered.')

  end;


end;

procedure TfrmLogin.btnRegisterClick(Sender: TObject);
begin
  frmLogin.Hide;
  frmRegister.Show;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');

  imgTree.Stretch := True;
  imgTree.Picture.LoadFromFile('Tree.jpg'); //load images for background

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

  DBGrid1.DataSource := dmTest.dscCustomers;

  SetLength(frmSupplier.arrSupplier, iSupCount);  //initializes dynamic arrays
end;

end.