unit frmStore_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  JPEG, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmStore = class(TForm)
    imgBack: TImage;
    pnlTitle: TPanel;
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl1: TLabel;
    img1: TImage;
    pnl2: TPanel;
    lbl2: TLabel;
    img2: TImage;
    pnl3: TPanel;
    lbl3: TLabel;
    img3: TImage;
    btnNext: TButton;
    btnPrevious: TButton;
    btnCart: TButton;
    bitbitLogout: TBitBtn;
    procedure formCreate(Sender: TObject);
    procedure bitbitLogoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
end;

procedure TfrmStore.formCreate(Sender: TObject);
begin
  imgBack.Stretch := True;
  imgBack.Picture.LoadFromFile('Background.jpg');
end;

end.
