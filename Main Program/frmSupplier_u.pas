unit frmSupplier_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls,
  Vcl.TabNotBk;

type
  TfrmSupplier = class(TForm)
    tbNtbk1: TTabbedNotebook;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    arrSupplier: Array of TObject;
  end;

var
  frmSupplier: TfrmSupplier;

implementation

{$R *.dfm}

end.
