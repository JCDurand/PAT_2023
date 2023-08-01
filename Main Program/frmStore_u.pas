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
    imgBack1: TImage;
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
    listBxCart: TListBox;
    imgRefresh: TImage;
    imgCheckout: TImage;
    btnRefresh: TButton;
    btnCheckout: TButton;
    btnStore: TButton;
    imgBack2: TImage;
    imgBack3: TImage;
    procedure formCreate(Sender: TObject);
    procedure bitbitLogoutClick(Sender: TObject);
    procedure btnAccountClick(Sender: TObject);
    procedure formShow(Sender: TObject);
    procedure btnStoreClick(Sender: TObject);
  private
    { Private declarations }
    procedure nextRecordSet;
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

procedure TfrmStore.btnStoreClick(Sender: TObject);
begin
  tbNTBK1.ActivePage := 'Store';
end;

procedure TfrmStore.formCreate(Sender: TObject);
begin
  iProdCount := 0;
  imgBack1.Stretch := True;
  imgBack1.Picture.LoadFromFile('Background.jpg');
  imgBack2.Stretch := True;
  imgBack2.Picture.LoadFromFile('Background.jpg');
  imgBack3.Stretch := True;
  imgBack3.Picture.LoadFromFile('Background.jpg');

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

procedure TfrmStore.nextRecordSet;
var
  I: Integer;
begin
  for I := 1 to 3 do
  begin
    with dmTest do
    begin
      if tblProduct.Eof then
        Break;
      lbl1.Caption := tblProduct['PName'];
      img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      tblProduct.Next;
    end;  //WITH

  end;  //FOR
end;

end.
