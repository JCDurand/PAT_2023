unit dmMusic;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TdmMusic = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    dsc
  end;

var
  DataModule1: TdmMusic;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
