unit frmAdmin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, dmTest_u, Vcl.ComCtrls, Vcl.TabNotBk, frmTFile_u;

type
  TfrmAdmin = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    btnLogout: TButton;
    dbgCus: TDBGrid;
    dbgOrder: TDBGrid;
    dbgProd: TDBGrid;
    dbgSup: TDBGrid;
    lblCustomer: TLabel;
    lblOrders: TLabel;
    lblProduct: TLabel;
    lblSupplier: TLabel;
    redCust: TRichEdit;
    redOrder: TRichEdit;
    redSupp: TRichEdit;
    lblCust: TLabel;
    lblOrder: TLabel;
    lblSupplierLog: TLabel;
    btnRefreshLog: TButton;
    procedure frmCreate(Sender: TObject);
    procedure btnRefreshLogClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses
  frmLogin_u;

{$R *.dfm}

procedure TfrmAdmin.btnLogoutClick(Sender: TObject);
begin
  frmAdmin.Hide;
  frmLogin.Show;
  frmTFile.addCustLine('Admin has logged out.');
end;

procedure TfrmAdmin.btnRefreshLogClick(Sender: TObject);
var
  sLine1, sLine2, sLine3: String;
  tFile1, tFile2, tFile3: Textfile;
begin
  AssignFile(tFile1, 'logCustomer.txt');
  AssignFile(tFile2, 'logOrder.txt');
  AssignFile(tFile3, 'logSupplier.txt');
  Reset(tFile1);
  Reset(tFile2);
  Reset(tFile3);

  redCust.Clear;
  redOrder.Clear;
  redSupp.Clear;

  while NOT Eof(tFile1) do
  begin
    Readln(tFile1, sLine1);
    redCust.Lines.Add(sLine1);
  end;

  while NOT Eof(tFile2) do
  begin
    Readln(tFile2, sLine1);
    redOrder.Lines.Add(sLine1);
  end;

  while NOT Eof(tFile3) do
  begin
    Readln(tFile3, sLine1);
    redSupp.Lines.Add(sLine1);
  end;
end;

procedure TfrmAdmin.frmCreate(Sender: TObject);
begin
  with dmTest do
  begin
    dbgCus.DataSource := dscCustomers;
    dbgOrder.DataSource := dscOrders;
    dbgSup.DataSource := dscSupplier;
    dbgProd.DataSource := dscProduct;
  end;

end;

end.
