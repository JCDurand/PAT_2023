object frmStore: TfrmStore
  Left = 0
  Top = 0
  Caption = 'Store'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = formCreate
  TextHeight = 15
  object imgBack: TImage
    Left = -5
    Top = 0
    Width = 633
    Height = 450
  end
  object pnlTitle: TPanel
    Left = 40
    Top = 8
    Width = 561
    Height = 41
    Caption = 'Main Store'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 8
    Top = 88
    Width = 505
    Height = 73
    TabOrder = 1
    object lbl1: TLabel
      Left = 16
      Top = 26
      Width = 3
      Height = 15
    end
    object img1: TImage
      Left = 352
      Top = 0
      Width = 129
      Height = 73
    end
  end
  object btn1: TButton
    Left = 519
    Top = 88
    Width = 101
    Height = 73
    Caption = 'View'
    TabOrder = 2
  end
  object btn2: TButton
    Left = 519
    Top = 167
    Width = 101
    Height = 73
    Caption = 'View'
    TabOrder = 3
  end
  object btn3: TButton
    Left = 519
    Top = 246
    Width = 101
    Height = 73
    Caption = 'View'
    TabOrder = 4
  end
  object pnl2: TPanel
    Left = 8
    Top = 167
    Width = 505
    Height = 73
    TabOrder = 5
    object lbl2: TLabel
      Left = 16
      Top = 26
      Width = 3
      Height = 15
    end
    object img2: TImage
      Left = 352
      Top = 0
      Width = 129
      Height = 73
    end
  end
  object pnl3: TPanel
    Left = 8
    Top = 246
    Width = 505
    Height = 73
    TabOrder = 6
    object lbl3: TLabel
      Left = 16
      Top = 26
      Width = 3
      Height = 15
    end
    object img3: TImage
      Left = 352
      Top = 0
      Width = 129
      Height = 73
    end
  end
  object btnNext: TButton
    Left = 8
    Top = 344
    Width = 97
    Height = 25
    Caption = 'Next Page'
    TabOrder = 7
  end
  object btnPrevious: TButton
    Left = 8
    Top = 384
    Width = 97
    Height = 25
    Caption = 'Previous Page'
    TabOrder = 8
  end
  object btnCart: TButton
    Left = 519
    Top = 344
    Width = 101
    Height = 25
    Caption = 'View Cart'
    TabOrder = 9
  end
  object bitbitLogout: TBitBtn
    Left = 519
    Top = 384
    Width = 101
    Height = 25
    Caption = 'Logout'
    TabOrder = 10
    OnClick = bitbitLogoutClick
  end
end
