program GUI_p;

uses
  Vcl.Forms,
  frmLogin_u in 'frmLogin_u.pas' {Form1},
  frmStore_u in 'frmStore_u.pas' {Form2},
  frmRegister_u in 'frmRegister_u.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
