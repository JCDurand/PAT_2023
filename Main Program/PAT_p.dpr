program PAT_p;

uses
  Vcl.Forms,
  frmMain_u in 'frmMain_u.pas' {frmPAT},
  dmTest_u in '..\Populate\dmTest_u.pas' {dmTest: TDataModule},
  frmPopulate_u in 'frmPopulate_u.pas' {frmPopulate},
  clsCustomer_u in 'clsCustomer_u.pas',
  clsProduct_u in 'clsProduct_u.pas',
  clsSupplier_u in 'clsSupplier_u.pas',
  frmWelcome_u in 'frmWelcome_u.pas' {frmWelcome},
  frmRegister_u in 'frmRegister_u.pas' {frmRegister};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTest, dmTest);
  Application.CreateForm(TfrmPopulate, frmPopulate);
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.Run;
end.
