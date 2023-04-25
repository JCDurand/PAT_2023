program Populate_p;

uses
  Vcl.Forms,
  Populate_u in 'Populate_u.pas' {frmPopulate},
  dmPopulate in 'dmPopulate.pas' {DataModule1: TDataModule},
  dmTest_u in 'dmTest_u.pas' {dmTest: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPopulate, frmPopulate);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TdmTest, dmTest);
  Application.Run;
end.
