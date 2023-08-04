unit frmSupplier_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls,
  Vcl.TabNotBk, Math, System.Bindings.Outputs,
  dmTest_u, frmTFile_u;

type
  TfrmSupplier = class(TForm)
    tbNtbk1: TTabbedNotebook;
    btnAddProd: TButton;
    btnDeleteProd: TButton;
    ledPName: TLabeledEdit;
    dbgProd: TDBGrid;
    cmbCat: TComboBox;
    sedAmount: TSpinEdit;
    ledPCost: TLabeledEdit;
    ledPDescript: TLabeledEdit;
    lblCat: TLabel;
    btnModAm: TButton;
    dbgInfo: TDBGrid;
    ledEmail: TLabeledEdit;
    ledPhone: TLabeledEdit;
    ledPW: TLabeledEdit;
    btnEmail: TButton;
    btnPhone: TButton;
    btnPass: TButton;
    btnLogout: TButton;
    lblAmount: TLabel;
    procedure frmShow(Sender: TObject);
    procedure btnPhotoClick(Sender: TObject);
    procedure btnAddProdClick(Sender: TObject);
    procedure btnModAmClick(Sender: TObject);
    procedure btnDeleteProdClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnPhoneClick(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
  private
    { Private declarations }
    sPhoto: String;
  public
    { Public declarations }
    arrSupplier: Array of TObject;
  end;

var
  frmSupplier: TfrmSupplier;

implementation

uses
  frmLogin_u;

{$R *.dfm}

procedure TfrmSupplier.btnAddProdClick(Sender: TObject);
begin
  with dmTest do
  begin
    tblProduct.Last;
    tblProduct.Insert;

    tblProduct['PID'] := Copy(cmbCat.Items[cmbCat.ItemIndex], 1, 3) + Copy(ledPName.Text, 1, 3) + IntToStr(RandomRange(1, 1000));
    tblProduct['PName'] := ledPName.Text;
    tblProduct['PDescript'] := ledPDescript.Text;
    tblProduct['PCat'] := cmbCat.Items[cmbCat.ItemIndex];
    tblProduct['PSupplier'] := frmLogin.sUser;
    tblProduct['PAmount'] := IntToStr(sedAmount.Value);
    tblProduct['PCost'] := StrToFloat(ledPCost.Text);

    tblProduct.Post;
    runSQLProd('SELECT PName, PDescript, PCat, PAmount, PCost FROM Product WHERE PSupplier = ' + QuotedStr(frmLogin.sUser));
  end;
end;

procedure TfrmSupplier.btnDeleteProdClick(Sender: TObject);
begin
  dmTest.runSQL('DELETE FROM Product WHERE PName = ' + QuotedStr(dmTest.tblProduct['PName']));

  dmtest.runSQLProd('SELECT PName, PDescript, PCat, PAmount, PCost FROM Product WHERE PSupplier = ' + QuotedStr(frmLogin.sUser));
end;

procedure TfrmSupplier.btnEmailClick(Sender: TObject);
var
  sEmail: String;
begin
  with dmTest do
  begin
    sEmail := ledEmail.Text;
    if sEmail = '' then
    begin
      ShowMessage('Please enter a new email.');
      Exit;
    end;

    dmtest.runSQL('UPDATE Supplier SET SEmail = ' + QuotedStr(sEmail) + ' WHERE SID = ' + QuotedStr(frmLogin.sUser));
    runSQLSup('SELECT SEmail, SPhoneNum, SPassword FROM Supplier WHERE SID = ' + QuotedStr(frmLogin.sUser));
  end;
end;

procedure TfrmSupplier.btnLogoutClick(Sender: TObject);
begin
  frmSupplier.Hide;
  frmLogin.Show;

  frmTFile.addSupLine(frmLogin.sUser + ' has logged out.');
end;

procedure TfrmSupplier.btnModAmClick(Sender: TObject);
var
  sAmount: String;
begin
  sAmount := InputBox('Product', 'Enter the new amount of product','');

  dmTest.runSQL('UPDATE Product SET PAmount = ' + QuotedStr(sAmount) + ' WHERE PSupplier = ' + QuotedStr(frmLogin.sUser));

  dmTest.runSQLProd('SELECT PName, PDescript, PCat, PAmount, PCost FROM Product WHERE PSupplier = ' + QuotedStr(frmLogin.sUser));
end;

procedure TfrmSupplier.btnPassClick(Sender: TObject);
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
      dmTest.runSQL('UPDATE Supplier SET SPassword = ' + QuotedStr(sText) + ' WHERE SID = ' + QuotedStr(frmLogin.sUser));
      dmtest.runSQLSup('SELECT SEmail, SPhoneNum, SPassword FROM Supplier WHERE SID = ' + QuotedStr(frmLogin.sUser));
    end;
end;

procedure TfrmSupplier.btnPhoneClick(Sender: TObject);
var
  sPhone: String;
begin
  sPhone := ledPhone.Text;
  if sPhone = '' then
  begin
    ShowMessage('Please enter a new phone number.');
    Exit;
  end;

  with dmTest do
  begin
    runSQL('UPDATE Supplier SET SPhoneNum = ' + QuotedStr(sPhone) + ' WHERE SID = ' + QuotedStr(frmLogin.sUser));
    runSQLSup('SELECT SEmail, SPhoneNum, SPassword FROM Supplier WHERE SID = ' + QuotedStr(frmLogin.sUser));
  end;
end;

procedure TfrmSupplier.btnPhotoClick(Sender: TObject);
var
  sPath: String;
begin
  sPath := InputBox('Product', 'Enter the file path of your photo:', '');
  sPhoto := ExtractFilePath(sPath);

end;

procedure TfrmSupplier.frmShow(Sender: TObject);
begin
  with dmTest do
  begin
    dbgProd.DataSource := qdscProd;
    dbgInfo.DataSource := qdscSup;
    runSQLProd('SELECT PName, PDescript, PCat, PAmount, PCost FROM Product WHERE PSupplier = ' + QuotedStr(frmLogin.sUser));
    runSQLSup('SELECT SEmail, SPhoneNum, SPassword FROM Supplier WHERE SID = ' + QuotedStr(frmLogin.sUser));

  end;

end;

end.

