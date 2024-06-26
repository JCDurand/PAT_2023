unit frmStore_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  JPEG, Vcl.StdCtrls, Vcl.Buttons, ADODB, Data.DB,
  frmCustomer_u, frmTFile_u, dmTest_u,
  clsProduct_u, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.Samples.Spin,
  Vcl.Imaging.pngimage, Vcl.WinXCalendars;

type
  TfrmStore = class(TForm)
    tbNTBK1: TTabbedNotebook;
    bitbitLogout: TBitBtn;
    btnView1: TButton;
    btnView2: TButton;
    btnView3: TButton;
    btnAccount: TButton;
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
    imgCartRefresh: TImage;
    imgCartCheckout: TImage;
    imgBack3: TImage;
    redDetailProd: TRichEdit;
    imgDetailProd: TImage;
    lblDetailProd: TLabel;
    sedDetailAmount: TSpinEdit;
    lblDetailAmount: TLabel;
    btnDetailAdd: TButton;
    lblDetailPrice: TLabel;
    lblDetailInStock: TLabel;
    lblDetailStock: TLabel;
    lblCartSubtotal: TLabel;
    lblCartSubtotalDis: TLabel;
    redCheckOut: TRichEdit;
    lblCheckSub: TLabel;
    lblCheckTax: TLabel;
    lblCheckGrand: TLabel;
    lblCheckShip: TLabel;
    lblCheckSubDis: TLabel;
    lblCheckTaxDis: TLabel;
    lblCheckShipDis: TLabel;
    lblCheckGrandDis: TLabel;
    btnCheckOrder: TButton;
    calPickCheck: TCalendarPicker;
    lblCheckDate: TLabel;
    imgCartClear: TImage;
    procedure formCreate(Sender: TObject);
    procedure bitbitLogoutClick(Sender: TObject);
    procedure btnAccountClick(Sender: TObject);
    procedure formShow(Sender: TObject);
    procedure btnStoreClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnView1Click(Sender: TObject);
    procedure btnView2Click(Sender: TObject);
    procedure btnView3Click(Sender: TObject);
    procedure btnDetailAddClick(Sender: TObject);
    procedure imgCartRefreshClick(Sender: TObject);
    procedure imgCartCheckoutClick(Sender: TObject);
    procedure btnCheckOrderClick(Sender: TObject);
    procedure imgCartClearClick(Sender: TObject);
  private
    { Private declarations }
    rSubTotal, rGrandTotal: Real; //vars for price calculation
    iAmount: Integer; //global counter for amount of specific product selected
    iCartCount: Byte; //global counter for products in cart
    arrCartName: Array of String; //array for storing names of products in cart
    arrCartAmount: Array of Integer;  //array for storing amounts of products in cart

    procedure nextRecordSet;
    procedure previousRecordSet;
    procedure loadProdDetail;
  public
    { Public declarations }
    iProdCount: Integer;  //global public counter for products in database
    arrProducts: Array[1..3] of String; //array for storing products selected
  end;

var
  frmStore: TfrmStore;

const
  VAT = 0.15;
  SHIPLOCAL = 100;
  SHIPGLOBAL = 200;

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

procedure TfrmStore.btnView1Click(Sender: TObject);
begin
  with dmTest do
  begin
    tblProduct.First;

    while NOT tblProduct.Eof do
    begin
      if tblProduct['PID'] = arrProducts[1] then
        Break;
      tblProduct.Next;
    end;  //WHILE

    loadProdDetail;
    imgDetailProd.Stretch := True;
    imgDetailProd.Picture.LoadFromFile('Products\' + arrProducts[1] + '.jpg');
    lblDetailAmount.Caption := FormatFloat('R0.00', tblProduct['PCost']);
    lblDetailStock.Caption := IntToStr(tblProduct['PAmount']);

    tbNTBK1.ActivePage := 'Product';
  end;  //WITH
end;

procedure TfrmStore.btnView2Click(Sender: TObject);
begin
  with dmTest do
  begin
    tblProduct.First;

    while NOT tblProduct.Eof do
    begin
      if tblProduct['PID'] = arrProducts[2] then
        Break;
      tblProduct.Next;
    end;  //WHILE

    loadProdDetail;
    imgDetailProd.Stretch := True;
    imgDetailProd.Picture.LoadFromFile('Products\' + arrProducts[2] + '.jpg');
    lblDetailAmount.Caption := FormatFloat('R0.00', tblProduct['PCost']);
    lblDetailStock.Caption := IntToStr(tblProduct['PAmount']);

    tbNTBK1.ActivePage := 'Product';
  end;  //WITH
end;

procedure TfrmStore.btnView3Click(Sender: TObject);
begin
  with dmTest do
  begin
    tblProduct.First;

    while NOT tblProduct.Eof do
    begin
      if tblProduct['PID'] = arrProducts[3] then
        Break;
      tblProduct.Next;
    end;  //WHILE

    loadProdDetail;
    imgDetailProd.Stretch := True;
    imgDetailProd.Picture.LoadFromFile('Products\' + arrProducts[3] + '.jpg');
    lblDetailAmount.Caption := FormatFloat('R0.00', tblProduct['PCost']);
    lblDetailStock.Caption := IntToStr(tblProduct['PAmount']);

    tbNTBK1.ActivePage := 'Product';
  end;  //WITH
end;

procedure TfrmStore.btnAccountClick(Sender: TObject);
begin
  frmStore.Hide;
  frmCustomer.Show;
end;

procedure TfrmStore.btnCheckOrderClick(Sender: TObject);
var
  I: Integer;
begin
  if rSubTotal = 0 then
  begin
    ShowMessage('Please select some products.');
    Exit;
  end;

  with dmTest do
  begin
    for I := 0 to iCartCount-1 do
    begin
      tblProduct.Locate('PID', arrCartName[I], [loCaseInsensitive]);

      tblProduct.Edit;
      tblProduct['PAmount'] := tblProduct['PAmount']- arrCartAmount[I];
      tblProduct.Post;
    end;  //FOR

    for I := 1 to iCartCount do
    begin
      tblOrders.Last;
      tblOrders.Insert;

      tblProduct.Locate('PID', arrCartName[I-1], [loCaseInsensitive]);
      tblOrders['OProduct'] := arrCartName[I-1];
      tblOrders['OSupplier'] := tblProduct['PSupplier'];
      tblOrders['OCustomer'] := frmLogin.sUser;
      tblOrders['OAmount'] := arrCartAmount[I-1];
      tblOrders['ODevDate'] := calPickCheck.Date;

      tblOrders.Post;
    end;
    end;  //WITH

  frmTFile.addOrderLine(frmLogin.sUser + ' has placed and order.');
  ShowMessage('Order placed.');
end;

procedure TfrmStore.btnDetailAddClick(Sender: TObject);
begin
  if sedDetailAmount.Value = 0 then
  begin
    ShowMessage('Please select some products.');
    Exit;
  end;

  iAmount := sedDetailAmount.Value;

  with dmTest do
  begin
    if iAmount > tblProduct['PAmount'] then
    begin
      ShowMessage('Amount selected greater than what is in stock.');
      sedDetailAmount.Value := 0;
      sedDetailAmount.SetFocus;
    end //IF
    else
    begin

      rSubTotal := rSubTotal + iAmount*tblProduct['PCost'];
      Inc(iCartCount);
      SetLength(arrCartName, iCartCount);
      SetLength(arrCartAmount, iCartCount);
      arrCartName[iCartCount-1] := tblProduct['PID'];
      arrCartAmount[iCartCount-1] := iAmount;

      frmTFile.addOrderLine(frmLogin.sUser + ' has placed an order.');
    end;  //ELSE


  end;  //WITH

end;

procedure TfrmStore.btnNextClick(Sender: TObject);
begin
  nextRecordSet;
end;

procedure TfrmStore.btnPreviousClick(Sender: TObject);
begin
  previousRecordSet;
end;

procedure TfrmStore.btnStoreClick(Sender: TObject);
begin
  tbNTBK1.ActivePage := 'Store';

  with dmTest do
  begin
    tblProduct.First;

    lbl1.Caption := tblProduct['PName'];
    img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[1] := tblProduct['PID'];
    tblProduct.Next;

    lbl2.Caption := tblProduct['PName'];
    img2.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[2] := tblProduct['PID'];
    tblProduct.Next;

    lbl3.Caption := tblProduct['PName'];
    img3.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[3] := tblProduct['PID'];

  end;
end;

procedure TfrmStore.formCreate(Sender: TObject);
begin
  iProdCount := 0;
  imgBack1.Stretch := True;
  imgBack1.Picture.LoadFromFile('Background.jpg');
  {imgBack2.Stretch := True;
    imgBack2.Picture.LoadFromFile('Background.jpg');}
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
  i: Integer;
begin
  iCount := 0;
  iCartCount := 0;
  rSubTotal := 0;

  SetLength(arrCartName, 1);
  SetLength(arrCartAmount, 1);

  with dmTest do
  begin
    tblProduct.First;

    lbl1.Caption := tblProduct['PName'];
    img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[1] := tblProduct['PID'];
    tblProduct.Next;

    lbl2.Caption := tblProduct['PName'];
    img2.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[2] := tblProduct['PID'];
    tblProduct.Next;

    lbl3.Caption := tblProduct['PName'];
    img3.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
    arrProducts[3] := tblProduct['PID'];

  end;

end;

procedure TfrmStore.imgCartCheckoutClick(Sender: TObject);
begin
  tbNTBK1.ActivePage := 'Checkout';

  rGrandTotal := rSubTotal + (rSubTotal*VAT) + SHIPLOCAL;

  lblCheckSubDis.Caption := FormatFloat('R0.00', rSubTotal);
  lblCheckTaxDis.Caption := FormatFloat('R0.00', rSubTotal*VAT);
  lblCheckShipDis.Caption := FormatFloat('R0.00', SHIPLOCAL);
  lblCheckGrandDis.Caption := FormatFloat('R0.00', rGrandTotal);



end;

procedure TfrmStore.imgCartClearClick(Sender: TObject);
begin
  redDetailProd.Clear;
  listBxCart.Clear;

  rSubTotal := 0;
  rGrandTotal := 0;
  iAmount := 0;
  iCartCount := 0;
  SetLength(arrCartName, 0);
  SetLength(arrCartName, 1);
  SetLength(arrCartAmount, 0);
  SetLength(arrCartAmount, 1);

end;

procedure TfrmStore.imgCartRefreshClick(Sender: TObject);
var
  I: Integer;
begin
  listBxCart.Clear;
  redCheckOut.Clear;

  if iCartCount = 0 then
  begin
    ShowMessage('Please add products to the cart.');
    Exit;
  end;
  for I := 1 to iCartCount do
  begin
    with dmTest do
    begin
      tblProduct.Locate('PID', arrCartName[I-1], [loCaseInsensitive]);
      listBxCart.Items.Add(tblProduct['PName'] + ': ' + IntToStr(arrCartAmount[I-1]));
      redCheckOut.Lines.Add(tblProduct['PName'] + ': ' + IntToStr(arrCartAmount[I-1]));
    end;
  end;


  lblCartSubtotalDis.Caption := FormatFloat('R0.00', rSubTotal);
end;

procedure TfrmStore.loadProdDetail;
begin
  redDetailProd.Clear;
  redDetailProd.Lines.Add(dmtest.tblProduct['PDescript']);
  sedDetailAmount.Value := 0;
end;

procedure TfrmStore.nextRecordSet;
var
  I: Integer;
begin
    with dmTest do
    begin
      if tblProduct.Eof then
        Exit;
      lbl1.Caption := tblProduct['PName'];
      img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[1] := tblProduct['PID'];
      tblProduct.Next;

      if tblProduct.Eof then
        Exit;
      lbl2.Caption := tblProduct['PName'];
      img2.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[2] := tblProduct['PID'];
      tblProduct.Next;

      if tblProduct.Eof then
        Exit;
      lbl3.Caption := tblProduct['PName'];
      img3.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[3] := tblProduct['PID'];
      tblProduct.Next;
    end;  //WITH

end;

procedure TfrmStore.previousRecordSet;
var
  I: Integer;
begin
    with dmTest do
    begin
      if tblProduct.Bof then
        Exit;
      lbl3.Caption := tblProduct['PName'];
      img3.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[3] := tblProduct['PID'];
      tblProduct.Prior;

      if tblProduct.Bof then
        Exit;
      lbl2.Caption := tblProduct['PName'];
      img2.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[2] := tblProduct['PID'];
      tblProduct.Prior;

      if tblProduct.Bof then
        Exit;
      lbl1.Caption := tblProduct['PName'];
      img1.Picture.LoadFromFile('Products\' + tblProduct['PID'] + '.jpg');
      arrProducts[1] := tblProduct['PID'];
      tblProduct.Prior;
    end;  //WITH

end;

end.
