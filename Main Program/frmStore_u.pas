unit frmStore_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  JPEG, Vcl.StdCtrls, Vcl.Buttons, ADODB,
  frmCustomer_u, frmTFile_u, dmTest_u,
  clsProduct_u, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.Samples.Spin;

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
    imgRefresh: TImage;
    imgCheckout: TImage;
    btnRefresh: TButton;
    btnCheckout: TButton;
    imgBack2: TImage;
    imgBack3: TImage;
    redDetailProd: TRichEdit;
    imgDetailProd: TImage;
    lblDetailProd: TLabel;
    sedDetailAmount: TSpinEdit;
    lblDetailAmount: TLabel;
    btnDetailAdd: TButton;
    lblDetailPrice: TLabel;
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
  private
    { Private declarations }
    procedure nextRecordSet;
    procedure previousRecordSet;
    procedure loadProdDetail;
  public
    { Public declarations }
    iProdCount: Integer;  //global public counter for products in database
    arrProducts: Array[1..3] of String;
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
    tbNTBK1.ActivePage := 'Product';
  end;  //WITH
end;

procedure TfrmStore.btnAccountClick(Sender: TObject);
begin
  frmStore.Hide;
  frmCustomer.Show;
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
  i: Integer;
begin
  iCount := 0;

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

  for i := 1 to 3 do
  begin
    ShowMessage(arrProducts[I]);
  end;
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
