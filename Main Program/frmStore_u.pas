unit frmStore_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  JPEG, Vcl.StdCtrls, Vcl.Buttons,
  frmCustomer_u, frmTFile_u, dmTest_u,
  clsProduct_u, Vcl.ComCtrls, Vcl.TabNotBk;

type
  TfrmStore = class(TForm)
    tbNTBK1: TTabbedNotebook;
    bitbitLogout: TBitBtn;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btnAccount: TButton;
    btnCart: TButton;
    btnNext: TButton;
    btnPrevious: TButton;
    imgBack: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    img1: TImage;
    pnl2: TPanel;
    lbl2: TLabel;
    img2: TImage;
    pnl3: TPanel;
    lbl3: TLabel;
    img3: TImage;
    pnlTitle: TPanel;
    procedure formCreate(Sender: TObject);
    procedure bitbitLogoutClick(Sender: TObject);
    procedure btnAccountClick(Sender: TObject);
    procedure formShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    iProdCount: Integer;  //global public counter for products in database
    arrProducts: Array of TProduct;
  end;

var
  frmStore: TfrmStore;

implementation

uses
  frmLogin_u;

{$R *.dfm}

procedure TfrmStore.bitbitLogoutClick(Sender: TObject);
begin
  frmStore.Hide;
  frmLogin.Show;

  frmTFile.addCustLine(frmLogin.sUser + ' logged out.');
end;

procedure TfrmStore.btnAccountClick(Sender: TObject);
begin
  frmStore.Hide;
  frmCustomer.Show;
end;

procedure TfrmStore.formCreate(Sender: TObject);
begin
  iProdCount := 0;

  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');

  with dmTest do
  begin
    tblProduct.First;

    while NOT tblProduct.Eof do
    begin
      Inc(iProdCount);
      tblProduct.Next;
    end;  //WHILE
  end;  //WITH

end;

procedure TfrmStore.formShow(Sender: TObject);
var
  objProduct: TProduct;
  iCount: Integer;
begin
  SetLength(arrProducts, 0);
  SetLength(arrProducts, iProdCount);
  iCount := 0;

  with dmTest do
  begin
    tblProduct.First;

    lbl1.Caption := tblProduct['PName'];
    img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    tblProduct.Next;

    lbl2.Caption := tblProduct['PName'];
    img2.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    tblProduct.Next;

    lbl3.Caption := tblProduct['PName'];
    img3.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');

  end;
end;

end.
