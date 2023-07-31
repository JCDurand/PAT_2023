unit clsProduct_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, dmTest_u,
  Vcl.DBGrids, Math;

type
  TProduct = class(TObject)

  private
  fName, fCat: String;
  fAmount: Integer;
  fCost: Real;

  public

  constructor Create(sName, sCat: String; iAmount: Integer; rCost: Real);
  function getName: String;
  function getCat: String;
  function getAmount: Integer;
  function getCost: String;
  procedure setAmount(iAmount: Integer);
  procedure setCost(rCost: Real);
  end;

implementation

{ TProduct }

constructor TProduct.Create(sName, sCat: String; iAmount: Integer; rCost: Real);
begin
  fName := sName;
  fCat := sCat;
  fAmount := iAmount;
  fCost := rCost;
end;

function TProduct.getAmount: Integer;
begin
  Result := fAmount;
end;

function TProduct.getCat: String;
begin
  Result := fCat;
end;

function TProduct.getCost: String;
begin
  Result := FormatFloat('R0.00', fCost);
end;

function TProduct.getName: String;
begin
  Result := fName;
end;

procedure TProduct.setAmount(iAmount: Integer);
begin
  fAmount := iAmount;
end;

procedure TProduct.setCost(rCost: Real);
begin
  fCost := rCost;
end;

end.
