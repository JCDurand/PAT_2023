unit frmPopulate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, dmTest_u,
  Vcl.DBGrids, Math;

type
  TfrmPopulate = class(TForm)
    btnPopulate: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    function generateCode(sName, sSurname: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
    dbgCustomers: TDBGrid;
  end;

var
  frmPopulate: TfrmPopulate;

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

function TfrmPopulate.generateCode(sName, sSurname: String): String;
var
  iRand: Integer;
begin
  Randomize;
  iRand := RandomRange(1, 1000);

  Result := UpCase(sName[1]) + sSurname + IntToStr(iRand);;
end;

end.
