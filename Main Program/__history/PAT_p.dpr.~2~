program PAT_p;

uses
  Vcl.Forms,
  PAT_u in 'PAT_u.pas' {Form1},
  dmTest_u in '..\Populate\dmTest_u.pas' {dmTest: TDataModule},
  frmPopulate_u in 'frmPopulate_u.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmTest, dmTest);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
