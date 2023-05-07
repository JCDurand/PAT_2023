unit Populate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmTest_u, {dmPopulate,} Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmPopulate = class(TForm)
    btnPopulate: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
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

procedure TfrmPopulate.btnPopulateClick(Sender: TObject);
begin
  with dmTest do
    begin
      tblCustomers.Last;
      tblCustomers.Insert;
    end;


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
