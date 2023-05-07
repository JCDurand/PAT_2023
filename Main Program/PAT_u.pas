unit PAT_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmTest_u, frmPopulate_u, Vcl.StdCtrls;

type
  TfrmPAT = class(TForm)
    btnPopulate: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPAT: TfrmPAT;

implementation

{$R *.dfm}

end.
