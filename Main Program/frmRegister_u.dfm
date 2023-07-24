object frmRegister: TfrmRegister
  Left = 0
  Top = 0
  Caption = 'Register'
  ClientHeight = 440
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 19
  object imgBack: TImage
    Left = -8
    Top = 0
    Width = 593
    Height = 449
  end
  object lblCountryy: TLabel
    Left = 192
    Top = 71
    Width = 100
    Height = 19
    Caption = 'Select a country:'
  end
  object lblPayment: TLabel
    Left = 384
    Top = 71
    Width = 155
    Height = 19
    Caption = 'Select a payment method:'
  end
  object pnlInstructions: TPanel
    Left = 8
    Top = 8
    Width = 561
    Height = 41
    Caption = 'Please fill in the following fields:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ledName: TLabeledEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 27
    EditLabel.Width = 40
    EditLabel.Height = 19
    EditLabel.Caption = 'Name:'
    TabOrder = 1
    Text = ''
    OnExit = ledNameExit
  end
  object ledSurname: TLabeledEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 27
    EditLabel.Width = 53
    EditLabel.Height = 19
    EditLabel.Caption = 'Surname'
    TabOrder = 2
    Text = ''
    OnExit = ledSurnameExit
  end
  object ledEmail: TLabeledEdit
    Left = 8
    Top = 201
    Width = 121
    Height = 27
    EditLabel.Width = 87
    EditLabel.Height = 19
    EditLabel.Caption = 'Email address:'
    TabOrder = 3
    Text = ''
    OnExit = ledEmailExit
  end
  object ledAddress: TLabeledEdit
    Left = 192
    Top = 144
    Width = 145
    Height = 27
    EditLabel.Width = 90
    EditLabel.Height = 19
    EditLabel.Caption = 'Street address:'
    TabOrder = 4
    Text = ''
    OnExit = ledAddressExit
  end
  object ledCity: TLabeledEdit
    Left = 192
    Top = 200
    Width = 145
    Height = 27
    EditLabel.Width = 28
    EditLabel.Height = 19
    EditLabel.Caption = 'City:'
    TabOrder = 5
    Text = ''
    OnExit = ledCityExit
  end
  object ledPost: TLabeledEdit
    Left = 192
    Top = 257
    Width = 145
    Height = 27
    EditLabel.Width = 68
    EditLabel.Height = 19
    EditLabel.Caption = 'Post Code:'
    TabOrder = 6
    Text = ''
    OnExit = ledPostExit
  end
  object cmbCountry: TComboBox
    Left = 192
    Top = 88
    Width = 145
    Height = 27
    TabOrder = 7
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
  object rgpPayment: TRadioGroup
    Left = 384
    Top = 88
    Width = 185
    Height = 105
    Caption = 'Payment Method:'
    Items.Strings = (
      'Debit order'
      'Card')
    TabOrder = 8
    OnClick = rgpClick
  end
  object ledPW: TLabeledEdit
    Left = 8
    Top = 336
    Width = 193
    Height = 27
    EditLabel.Width = 150
    EditLabel.Height = 19
    EditLabel.Caption = 'Please enter a password:'
    TabOrder = 9
    Text = ''
  end
  object ledPWConf: TLabeledEdit
    Left = 8
    Top = 392
    Width = 193
    Height = 27
    EditLabel.Width = 176
    EditLabel.Height = 19
    EditLabel.Caption = 'Please confirm the password:'
    TabOrder = 10
    Text = ''
  end
  object bitbtnRegister: TBitBtn
    Left = 254
    Top = 337
    Width = 83
    Height = 25
    Caption = 'Register'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 11
    OnClick = bitbtnRegisterClick
  end
  object bitbtnCancel: TBitBtn
    Left = 254
    Top = 393
    Width = 83
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 12
    OnClick = bitbtnCancelClick
  end
  object ledCard: TLabeledEdit
    Left = 384
    Top = 216
    Width = 137
    Height = 27
    EditLabel.Width = 83
    EditLabel.Height = 19
    EditLabel.Caption = 'Card number:'
    TabOrder = 13
    Text = ''
  end
  object ledBank: TLabeledEdit
    Left = 384
    Top = 273
    Width = 137
    Height = 27
    EditLabel.Width = 135
    EditLabel.Height = 19
    EditLabel.Caption = 'Bank account number:'
    TabOrder = 14
    Text = ''
  end
end
