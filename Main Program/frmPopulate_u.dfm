object frmPopulate: TfrmPopulate
  Left = 0
  Top = 0
  Caption = 'Populate'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object btnCusPop: TButton
    Left = 8
    Top = 208
    Width = 153
    Height = 25
    Caption = 'Populate Customer database'
    TabOrder = 0
    OnClick = btnCusPopClick
  end
  object btnProPop: TButton
    Left = 448
    Top = 208
    Width = 137
    Height = 25
    Caption = 'Populate Product table'
    TabOrder = 1
    OnClick = btnProPopClick
  end
  object btnSupPop: TButton
    Left = 240
    Top = 208
    Width = 128
    Height = 25
    Caption = 'Populate Supplier table'
    TabOrder = 2
    OnClick = btnSupPopClick
  end
end
