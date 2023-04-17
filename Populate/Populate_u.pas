unit Populate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmTest_u, {dmPopulate,} Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmPopulate = class(TForm)
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPopulate: TfrmPopulate;
  dbgCustomers: TDBGrid;
  lblTest: TLabel;

implementation

{$R *.dfm}

procedure TfrmPopulate.Button1Click(Sender: TObject);
begin
  lblTest := TLabel.Create(frmPopulate);
  lblTest.Parent := frmPopulate;
  lblTest.Caption := 'Hello World!';
end;

procedure TfrmPopulate.FormShow(Sender: TObject);
begin
  dbgCustomers := TDBGrid.Create(frmPopulate);
  with dbgCustomers do begin
    Parent := frmPopulate;
    DataSource := dmTest.dscCustomers;
    Width := 700;
  end;
end;

end.
