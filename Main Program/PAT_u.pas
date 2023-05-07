unit PAT_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmTest_u, frmPopulate_u, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnPopulate: TButton;
    procedure btnPopulateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnPopulateClick(Sender: TObject);
begin
frmMain.Hide;
frmPopulate.Show;
end;

end.
