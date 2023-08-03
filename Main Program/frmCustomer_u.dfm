object frmCustomer: TfrmCustomer
  Left = 0
  Top = 0
  Caption = 'Customer'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object imgBack: TImage
    Left = -5
    Top = 1
    Width = 625
    Height = 449
  end
  object lblCountry: TLabel
    Left = 200
    Top = 79
    Width = 87
    Height = 15
    Caption = 'Select a country:'
  end
  object lblPayment: TLabel
    Left = 392
    Top = 79
    Width = 138
    Height = 15
    Caption = 'Select a payment method:'
  end
  object bitbtnCancel: TBitBtn
    Left = 537
    Top = 409
    Width = 83
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object bitbtnUpdate: TBitBtn
    Left = 230
    Top = 399
    Width = 123
    Height = 25
    Caption = 'Update Password'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object cmbCountry: TComboBox
    Left = 200
    Top = 96
    Width = 145
    Height = 23
    Sorted = True
    TabOrder = 2
    OnExit = cmbCountryExit
    Items.Strings = (
      'Afghanistan'
      'Albania'
      'Algeria'
      'Andorra'
      'Bahrain'
      'Bangladesh'
      'Barbados'
      'Belarus'
      'Belgium'
      'Cameroon'
      'Canada'
      'Central African Republic'
      'Chad'
      'Denmark'
      'Djibouti'
      'Dominica'
      'Dominican Republic'
      'Equatorial Guinea'
      'Eritrea'
      'Estonia'
      'Eswatini'
      'Ethiopia'
      'Fiji'
      'Finland'
      'France'
      'Germany'
      'Ghana'
      'Greece'
      'Hungary'
      'Iceland'
      'India'
      'Ireland'
      'Israel'
      'Italy'
      'Jamaica'
      'Japan'
      'Korea, South'
      'Lesotho'
      'Lithuania'
      'Luxembourg'
      'South Africa')
  end
  object ledAddress: TLabeledEdit
    Left = 200
    Top = 152
    Width = 145
    Height = 23
    EditLabel.Width = 76
    EditLabel.Height = 15
    EditLabel.Caption = 'Street address:'
    TabOrder = 3
    Text = ''
    OnExit = ledAddressExit
  end
  object ledBank: TLabeledEdit
    Left = 393
    Top = 265
    Width = 137
    Height = 23
    EditLabel.Width = 120
    EditLabel.Height = 15
    EditLabel.Caption = 'Bank account number:'
    NumbersOnly = True
    TabOrder = 4
    Text = ''
    OnExit = ledBankExit
  end
  object ledCard: TLabeledEdit
    Left = 392
    Top = 223
    Width = 137
    Height = 23
    EditLabel.Width = 73
    EditLabel.Height = 15
    EditLabel.Caption = 'Card number:'
    NumbersOnly = True
    TabOrder = 5
    Text = ''
    OnExit = ledCardExit
  end
  object ledCity: TLabeledEdit
    Left = 200
    Top = 208
    Width = 145
    Height = 23
    EditLabel.Width = 24
    EditLabel.Height = 15
    EditLabel.Caption = 'City:'
    TabOrder = 6
    Text = ''
    OnExit = ledCityExit
  end
  object ledEmail: TLabeledEdit
    Left = 8
    Top = 152
    Width = 121
    Height = 23
    EditLabel.Width = 75
    EditLabel.Height = 15
    EditLabel.Caption = 'Email address:'
    TabOrder = 7
    Text = ''
    OnExit = ledEmailExit
  end
  object ledPhone: TLabeledEdit
    Left = 8
    Top = 96
    Width = 121
    Height = 23
    EditLabel.Width = 82
    EditLabel.Height = 15
    EditLabel.Caption = 'Phone number:'
    NumbersOnly = True
    TabOrder = 8
    Text = ''
    OnExit = ledPhoneExit
  end
  object ledPost: TLabeledEdit
    Left = 200
    Top = 265
    Width = 145
    Height = 23
    EditLabel.Width = 57
    EditLabel.Height = 15
    EditLabel.Caption = 'Post Code:'
    NumbersOnly = True
    TabOrder = 9
    Text = ''
    OnExit = ledCostCode
  end
  object ledPW: TLabeledEdit
    Left = 16
    Top = 344
    Width = 193
    Height = 23
    Hint = 
      'Must contain at least two numbers, a special character(!,#,$,%,&' +
      ') and two capital letters.'
    EditLabel.Width = 128
    EditLabel.Height = 15
    EditLabel.Caption = 'Please enter a password:'
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 10
    Text = ''
    OnExit = ledPwExit
  end
  object ledPWConf: TLabeledEdit
    Left = 16
    Top = 400
    Width = 193
    Height = 23
    EditLabel.Width = 154
    EditLabel.Height = 15
    EditLabel.Caption = 'Please confirm the password:'
    PasswordChar = '*'
    TabOrder = 11
    Text = ''
    OnExit = ledPwConfExit
  end
  object pnlInstructions: TPanel
    Left = 16
    Top = 16
    Width = 561
    Height = 41
    Caption = 'Once new info is entered your details will be updated.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object rgpPayment: TRadioGroup
    Left = 392
    Top = 96
    Width = 185
    Height = 105
    Caption = 'Payment Method:'
    Items.Strings = (
      'Debit order'
      'Card')
    TabOrder = 13
    OnExit = cmbCountryExit
  end
end
