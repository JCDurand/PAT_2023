unit frmWelcome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls,
  JPEG, frmRegister_u, dmTest_u, frmCustomer_u, frmSupplier_u , clsSupplier_u;

type
  TfrmWelcome = class(TForm)
    pnlWelcome: TPanel;
    lblLogin: TLabel;
    lblRegister: TLabel;
    ledUsername: TLabeledEdit;
    ledPass: TLabeledEdit;
    bitbtnLogin: TBitBtn;
    bitbtnClose: TBitBtn;
    btnRegister: TButton;
    imgBack: TImage;
    imgTree: TImage;
    btnForgot: TButton;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitbtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iSupCount: Integer;  //global counter for customers and suppliers in database

  end;

var
  frmWelcome: TfrmWelcome;

implementation

  uses
    clsCustomer_u;

{$R *.dfm}

procedure TfrmWelcome.bitbtnCloseClick(Sender: TObject);
begin
  Exit;
end;

procedure TfrmWelcome.btnRegisterClick(Sender: TObject);
begin
  frmWelcome.Hide;
  frmRegister.Show;
end;

procedure TfrmWelcome.FormShow(Sender: TObject);
begin
  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');

  imgTree.Stretch := True;
  imgTree.Picture.LoadFromFile('Tree.jpg'); //load images for background

  iSupCount := 0;

  with dmTest do
    begin

      tblSupplier.First;
      while NOT tblSupplier.Eof do
        begin
          Inc(iSupCount);
          tblSupplier.Next;
        end;
    end;  //WITH


  SetLength(frmSupplier.arrSupplier, iSupCount);  //initializes dynamic arrays
end;

end.