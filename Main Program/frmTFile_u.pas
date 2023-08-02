unit frmTFile_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dmTest_u;

type
  TfrmTFile = class(TForm)
    procedure formCreate(Sender: TObject);
  private
    { Private declarations }
    tCustFile, tOrdFile: TextFile;
  public
    { Public declarations }
    procedure addCustLine(sLine: String);
    procedure addOrderLine(sLine: String);
  end;

var
  frmTFile: TfrmTFile;

implementation

{$R *.dfm}

procedure TfrmTFile.addCustLine(sLine: String);
var
  sWrite: String;
begin
  AssignFile(tCustFile, 'logCustomer.txt');
  Append(tCustFile);

  sWrite := DateTimeToStr(Now)+ '; '  + sLine;
  Writeln(tCustFile, sWrite);
  CloseFile(tCustFile);
end;


procedure TfrmTFile.addOrderLine(sLine: String);
var
  sWrite: String;
begin
  AssignFile(tOrdFile, 'logOrder.txt');
  Append(tOrdFile);

  sWrite := DateTimeToStr(NOW)+ ': ' + sLine;

end;

procedure TfrmTFile.formCreate(Sender: TObject);
begin
  if NOT FileExists('logCustomer.txt') then
  begin
    AssignFile(tCustFile, 'logCustomer.txt');
    Rewrite(tCustFile);
    CloseFile(tCustFile);
  end;  //IF

  if NOT FileExists('logOrder.txt') then
  begin
    AssignFile(tOrdFile, 'logOrder.txt');
    Rewrite(tOrdFile);
    CloseFile(tOrdFile);
  end;  //IF
end;

end.
