program PAT_p;

uses
  Vcl.Forms,
  dmTest_u in '..\Populate\dmTest_u.pas' {dmTest: TDataModule},
  frmPopulate_u in 'frmPopulate_u.pas' {frmPopulate},
  clsCustomer_u in 'clsCustomer_u.pas',
  clsProduct_u in 'clsProduct_u.pas',
  clsSupplier_u in 'clsSupplier_u.pas',
  frmLogin_u in 'frmLogin_u.pas' {frmLogin},
  frmRegister_u in 'frmRegister_u.pas' {frmRegister},
  frmCustomer_u in 'frmCustomer_u.pas' {frmCustomer},
  frmSupplier_u in 'frmSupplier_u.pas' {frmSupplier},
  frmStore_u in 'frmStore_u.pas' {frmStore},
  frmTFile_u in 'frmTFile_u.pas' {frmTFile},
  frmAdmin_u in 'frmAdmin_u.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmTest, dmTest);
  Application.CreateForm(TfrmPopulate, frmPopulate);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmCustomer, frmCustomer);
  Application.CreateForm(TfrmSupplier, frmSupplier);
  Application.CreateForm(TfrmStore, frmStore);
  Application.CreateForm(TfrmTFile, frmTFile);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
