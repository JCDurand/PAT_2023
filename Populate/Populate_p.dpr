program Populate_p;

uses
  Vcl.Forms,
  Populate_u in 'Populate_u.pas' {frmPopulate},
  dmTest_u in 'dmTest_u.pas' {dmTest: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPopulate, frmPopulate);
  Application.CreateForm(TdmTest, dmTest);
  Application.Run;
end.
