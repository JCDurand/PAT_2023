program PAT_p;

uses
  Vcl.Forms,
  PAT_u in 'PAT_u.pas' {frmPAT},
  dmTest_u in '..\Populate\dmTest_u.pas' {dmTest: TDataModule},
  frmPopulate_u in 'frmPopulate_u.pas' {frmPopulate},
  clsCustomer_u in 'clsCustomer_u.pas',
  clsProduct_u in 'clsProduct_u.pas',
  clsSupplier_u in 'clsSupplier_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTest, dmTest);
  Application.CreateForm(TfrmPopulate, frmPopulate);
  Application.Run;
end.
