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
    tCustFile, tOrdFile, tSupFile: TextFile;
  public
    { Public declarations }
    procedure addCustLine(sLine: String);
    procedure addOrderLine(sLine: String);
    procedure addSupLine(sLine: String);
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
  WriteLn(tOrdFile, sLine);
  CloseFile(tOrdFile);
end;

procedure TfrmTFile.addSupLine(sLine: String);
var
  sWrite: String;
begin
  AssignFile(tSupFile, 'logSupplier.txt');
  Append(tSupFile);

  sWrite := DateTimeToStr(NOW)+ ': ' + sLine;
  Writeln(tSupFile, sWrite);
  CloseFile(tSupFile);
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

  if NOT FileExists('logSupplier.txt.') then
  begin
    AssignFile(tCustFile, 'logSupplier.txt');
    Rewrite(tCustFile);
    CloseFile(tCustFile);
  end;
end;

end.
