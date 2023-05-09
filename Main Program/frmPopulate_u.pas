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
    function readTextfile(sTextName: String; iArrLeng: Integer): String;
    function generateCode(sName, sSurname: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
    dbgCustomers: TDBGrid;
  end;

var
  frmPopulate: TfrmPopulate;
  arrText: Array of String;

const
  ARRLENG = 15;

implementation

{$R *.dfm}

procedure TfrmPopulate.btnPopulateClick(Sender: TObject);
var
  arrNames: Array[1..15] of String;
  sLine: String;
  iCount, iPos: Integer;
  I: Integer;
begin
  iCount := 1;

  sLine := readTextfile('Names.txt', 15);

  for I := 1 to 15 do
    begin
      iPos := Pos('#', sLine);
      arrNames[I] := Copy(sLine, 1, iPos-1);
      Delete(sLine, 1, iPos);
    end;

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

  Result := UpCase(sName[1]) + sSurname + IntToStr(iRand);
end;



function TfrmPopulate.readTextfile(sTextName: String;
  iArrLeng: Integer): String;
var
  tFile: TextFile;
  iCount: Integer;
  sLine: String;
  arrFile: Array[1..15] of String;
begin
  iCount := 1;
  Result := '';

  if NOT FileExists(sTextName) then
    begin
      ShowMessage('File does not exist.');
      Exit;
    end;

  AssignFile(tFile, sTextName);
  Reset(tFile);

  while NOT Eof(tFile) do
    begin
      Readln(tFile, sLine);
      Result := Result + '#' + sLine;
    end;

  CloseFile(tFile);

  SetLength(arrText, 15);

end;

end.
