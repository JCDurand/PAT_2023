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
  OnShow = formShow
  TextHeight = 15
  object tbNTBK1: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 633
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
      Caption = 'Store'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object imgBack: TImage
        Left = -8
        Top = -15
        Width = 633
        Height = 426
      end
      object bitbitLogout: TBitBtn
        Left = 511
        Top = 368
        Width = 101
        Height = 25
        Caption = 'Logout'
        TabOrder = 0
        OnClick = bitbitLogoutClick
      end
      object btn1: TButton
        Left = 535
        Top = 83
        Width = 58
        Height = 66
        Caption = 'View'
        TabOrder = 1
      end
      object btn2: TButton
        Left = 535
        Top = 163
        Width = 58
        Height = 73
        Caption = 'View'
        TabOrder = 2
      end
      object btn3: TButton
        Left = 535
        Top = 242
        Width = 58
        Height = 73
        Caption = 'View'
        TabOrder = 3
      end
      object btnAccount: TButton
        Left = 404
        Top = 337
        Width = 101
        Height = 25
        Caption = 'View Account'
        TabOrder = 4
        OnClick = btnAccountClick
      end
      object btnCart: TButton
        Left = 404
        Top = 368
        Width = 101
        Height = 25
        Caption = 'View Cart'
        TabOrder = 5
      end
      object btnNext: TButton
        Left = 24
        Top = 337
        Width = 97
        Height = 25
        Caption = 'Next Page'
        TabOrder = 6
      end
      object btnPrevious: TButton
        Left = 24
        Top = 368
        Width = 97
        Height = 25
        Caption = 'Previous Page'
        TabOrder = 7
      end
      object pnl1: TPanel
        Left = 24
        Top = 84
        Width = 505
        Height = 73
        TabOrder = 8
        object lbl1: TLabel
          Left = 16
          Top = 26
          Width = 4
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object img1: TImage
          Left = 360
          Top = 0
          Width = 121
          Height = 65
          Stretch = True
        end
      end
      object pnl2: TPanel
        Left = 24
        Top = 163
        Width = 505
        Height = 73
        TabOrder = 9
        object lbl2: TLabel
          Left = 16
          Top = 26
          Width = 4
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object img2: TImage
          Left = 360
          Top = 0
          Width = 121
          Height = 65
          Stretch = True
        end
      end
      object pnl3: TPanel
        Left = 24
        Top = 242
        Width = 505
        Height = 73
        TabOrder = 10
        object lbl3: TLabel
          Left = 16
          Top = 26
          Width = 4
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object img3: TImage
          Left = 360
          Top = 0
          Width = 121
          Height = 65
          Stretch = True
        end
      end
      object pnlTitle: TPanel
        Left = 32
        Top = 16
        Width = 561
        Height = 41
        Caption = 'Main Store'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Cart'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Checkout'
      ExplicitTop = 6
      ExplicitWidth = 292
      ExplicitHeight = 240
    end
  end
end
