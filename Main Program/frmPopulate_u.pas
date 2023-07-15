unit frmPopulate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, dmTest_u,
  Vcl.DBGrids, Math;

type
  TfrmPopulate = class(TForm)
    btnCusPop: TButton;
    btnSupPop: TButton;
    btnProdPop: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCusPopClick(Sender: TObject);
    procedure readTextFile(sFileName: String; iArrNum: Integer);   //reads text files into arrays
    function generateCode(sName, sSurname: String): String; //generate unique Customer ID code
  private
    { Private declarations }
  public
    { Public declarations }
    dbgCustomers: TDBGrid;
  end;

var
  frmPopulate: TfrmPopulate;
  arrCode, arrAddress, arrBank, arrCard, arrCity, arrCountry, arrEmail, arrName, arrPayment,
  arrPhone, arrPost, arrSurname: Array[1..15] of String;
  arrText: Array of String;

const
  ARRLENG = 15;

implementation

{$R *.dfm}

procedure TfrmPopulate.btnCusPopClick(Sender: TObject);
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

  Result := UpCase(sName[1]) + sSurname + IntToStr(iRand);
end;





procedure TfrmPopulate.readTextFile(sFileName: String; iArrNum: Integer);
var
  sLine: String;
  tFile: TextFile;
  I: Integer;
begin
  if NOT FileExists(sFileName) then
    begin
      ShowMessage('File does not exist.');
      Exit;
    end;

  AssignFile(tFile, sFileName);
  Reset(tFile);

  for I := 1 to 15 do
    begin
      Readln(tFile,sLine);

      case iArrNum of
        2: arrAddress[I] := sLine;
        3: arrBank[I] := sLine;
        4: arrCard[I] := sLine;
        5: arrCity[I] := sLine;
        6: arrCountry[I] := sLine;
        7: arrEmail[I] := sLine;
        8: arrName[I] := sLine;
        9: arrPayment[I] := sLine;
        10: arrPhone[I] := sLine;
        11: arrPost[I] := sLine;
        12: arrSurname[I] := sLine;
      end;  //CASE

    end;  //FOR

  CloseFile(tFile);
end;

end.
