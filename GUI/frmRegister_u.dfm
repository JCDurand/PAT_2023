object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 394
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 16
    Top = 63
    Width = 121
    Height = 13
    Caption = 'Please fill in all the fields'
  end
  object Label1: TLabel
    Left = 448
    Top = 93
    Width = 85
    Height = 13
    Caption = 'Payment Method:'
  end
  object Label2: TLabel
    Left = 448
    Top = 139
    Width = 41
    Height = 13
    Caption = 'Number:'
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 619
    Height = 41
    Caption = 'Account Registration'
    TabOrder = 0
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'First Name:'
    TabOrder = 1
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 157
    Width = 121
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Last Name:'
    TabOrder = 2
  end
  object LabeledEdit3: TLabeledEdit
    Left = 16
    Top = 208
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Email address:'
    TabOrder = 3
  end
  object LabeledEdit4: TLabeledEdit
    Left = 16
    Top = 256
    Width = 121
    Height = 21
    EditLabel.Width = 106
    EditLabel.Height = 13
    EditLabel.Caption = 'Mobile phone number:'
    TabOrder = 4
  end
  object LabeledEdit5: TLabeledEdit
    Left = 248
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Postal address:'
    TabOrder = 5
  end
  object LabeledEdit6: TLabeledEdit
    Left = 248
    Top = 157
    Width = 121
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'City of address:'
    TabOrder = 6
  end
  object LabeledEdit7: TLabeledEdit
    Left = 248
    Top = 208
    Width = 121
    Height = 21
    EditLabel.Width = 113
    EditLabel.Height = 13
    EditLabel.Caption = 'Postal code of address:'
    TabOrder = 7
  end
  object LabeledEdit8: TLabeledEdit
    Left = 248
    Top = 256
    Width = 121
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Country of address:'
    TabOrder = 8
  end
  object ComboBox1: TComboBox
    Left = 448
    Top = 112
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 9
    Text = 'Card'
    Items.Strings = (
      'Card'
      'EFT')
  end
  object SpinEdit1: TSpinEdit
    Left = 448
    Top = 157
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 10
    Value = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 299
    Width = 75
    Height = 25
    Caption = 'Register'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 11
  end
  object BitBtn2: TBitBtn
    Left = 552
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Exit'
    Kind = bkAbort
    NumGlyphs = 2
    TabOrder = 12
  end
end
