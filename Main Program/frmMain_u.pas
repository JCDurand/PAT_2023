unit frmMain_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmTest_u, frmPopulate_u, frmLogin_u, Vcl.StdCtrls, frmCustomer_u;

type
  TfrmMain = class(TForm)
    btnShowFrom: TButton;
    btnWelcom: TButton;
    procedure btnShowFromClick(Sender: TObject);
    procedure btnWelcomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnShowFromClick(Sender: TObject);
begin
frmMain.Hide;
frmPopulate.Show;
end;

procedure TfrmMain.btnWelcomClick(Sender: TObject);
begin
  frmMain.Hide;
  frmLogin.Show;

end;

end.
