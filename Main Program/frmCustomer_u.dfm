object frmCustomer: TfrmCustomer
  Left = 0
  Top = 0
  Caption = 'Customer'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 19
  object TabbedNotebook1: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 625
    Height = 441
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -12
    TabFont.Name = 'Segoe UI'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Orders'
      ExplicitTop = 30
      ExplicitHeight = 407
      object imgBack: TImage
        Left = -21
        Top = -39
        Width = 638
        Height = 450
      end
      object lblCountry: TLabel
        Left = 200
        Top = 79
        Width = 100
        Height = 19
        Caption = 'Select a country:'
      end
      object lblPayment: TLabel
        Left = 392
        Top = 79
        Width = 155
        Height = 19
        Caption = 'Select a payment method:'
      end
      object bitbtnCancel: TBitBtn
        Left = 521
        Top = 372
        Width = 83
        Height = 25
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
        OnClick = bitbtnCancelClick
      end
      object bitbtnUpdate: TBitBtn
        Left = 207
        Top = 327
        Width = 123
        Height = 25
        Caption = 'Update Password'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
        OnClick = bitbtnUpdateClick
      end
      object cmbCountry: TComboBox
        Left = 200
        Top = 96
        Width = 145
        Height = 27
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
        Height = 27
        EditLabel.Width = 90
        EditLabel.Height = 19
        EditLabel.Caption = 'Street address:'
        TabOrder = 3
        Text = ''
        OnExit = ledAddressExit
      end
      object ledBank: TLabeledEdit
        Left = 393
        Top = 265
        Width = 137
        Height = 27
        EditLabel.Width = 135
        EditLabel.Height = 19
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
        Height = 27
        EditLabel.Width = 83
        EditLabel.Height = 19
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
        Height = 27
        EditLabel.Width = 28
        EditLabel.Height = 19
        EditLabel.Caption = 'City:'
        TabOrder = 6
        Text = ''
        OnExit = ledCityExit
      end
      object ledEmail: TLabeledEdit
        Left = 8
        Top = 152
        Width = 121
        Height = 27
        EditLabel.Width = 87
        EditLabel.Height = 19
        EditLabel.Caption = 'Email address:'
        TabOrder = 7
        Text = ''
        OnExit = ledEmailExit
      end
      object ledPhone: TLabeledEdit
        Left = 8
        Top = 96
        Width = 121
        Height = 27
        EditLabel.Width = 90
        EditLabel.Height = 19
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
        Height = 27
        EditLabel.Width = 68
        EditLabel.Height = 19
        EditLabel.Caption = 'Post Code:'
        NumbersOnly = True
        TabOrder = 9
        Text = ''
        OnExit = ledPostExit
      end
      object ledPW: TLabeledEdit
        Left = 8
        Top = 328
        Width = 193
        Height = 27
        Hint = 
          'Must contain at least two numbers, a special character(!,#,$,%,&' +
          ') and two capital letters.'
        EditLabel.Width = 150
        EditLabel.Height = 19
        EditLabel.Caption = 'Please enter a password:'
        ParentShowHint = False
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 10
        Text = ''
        OnExit = ledPwExit
      end
      object ledPWConf: TLabeledEdit
        Left = 8
        Top = 372
        Width = 193
        Height = 27
        EditLabel.Width = 176
        EditLabel.Height = 19
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
        OnClick = rgpPaymentClick
        OnExit = cmbCountryExit
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Info'
      ExplicitTop = 30
      ExplicitHeight = 407
      object lblPast: TLabel
        Left = 8
        Top = 9
        Width = 85
        Height = 19
        Caption = 'Past Orders:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object redPast: TRichEdit
        Left = 9
        Top = 30
        Width = 336
        Height = 371
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnViewPast: TButton
        Left = 387
        Top = 177
        Width = 217
        Height = 58
        Caption = 'View past orders'
        TabOrder = 1
        OnClick = btnViewPastClick
      end
    end
  end
end
