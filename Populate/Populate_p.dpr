program Populate_p;

uses
  Vcl.Forms,
  Populate_u in 'Populate_u.pas' {Form1},
  dmPopulate in 'dmPopulate.pas' {DataModule1: TDataModule},
  dmTest in 'dmTest.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
