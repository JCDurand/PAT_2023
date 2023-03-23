object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 357
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 168
    Width = 144
    Height = 13
    Caption = 'Please enter your login details'
  end
  object Label2: TLabel
    Left = 384
    Top = 168
    Width = 117
    Height = 13
    Caption = 'Register a new account:'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Login'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 614
    Top = 312
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 384
    Top = 206
    Width = 105
    Height = 25
    Caption = 'Register account'
    TabOrder = 2
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 208
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Username:'
    TabOrder = 3
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 256
    Width = 121
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Password:'
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 16
    Top = 32
    Width = 673
    Height = 73
    Caption = 'Welcome to Eco Stores'
    TabOrder = 5
  end
end
