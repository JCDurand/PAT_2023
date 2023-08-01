object frmStore: TfrmStore
  Left = 0
  Top = 0
  Caption = 'Store'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OnCreate = formCreate
  OnShow = formShow
  TextHeight = 19
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
      object imgBack1: TImage
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
      object btnView1: TButton
        Left = 535
        Top = 83
        Width = 58
        Height = 74
        Caption = 'View'
        TabOrder = 1
        OnClick = btnView1Click
      end
      object btnView2: TButton
        Left = 535
        Top = 163
        Width = 58
        Height = 73
        Caption = 'View'
        TabOrder = 2
        OnClick = btnView2Click
      end
      object btnView3: TButton
        Left = 535
        Top = 242
        Width = 58
        Height = 73
        Caption = 'View'
        TabOrder = 3
        OnClick = btnView3Click
      end
      object btnAccount: TButton
        Left = 511
        Top = 337
        Width = 101
        Height = 25
        Caption = 'View Account'
        TabOrder = 4
        OnClick = btnAccountClick
      end
      object btnNext: TButton
        Left = 24
        Top = 337
        Width = 97
        Height = 25
        Caption = 'Next Page'
        TabOrder = 5
        OnClick = btnNextClick
      end
      object btnPrevious: TButton
        Left = 24
        Top = 368
        Width = 97
        Height = 25
        Caption = 'Previous Page'
        TabOrder = 6
        OnClick = btnPreviousClick
      end
      object pnl1: TPanel
        Left = 24
        Top = 84
        Width = 505
        Height = 73
        TabOrder = 7
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
        TabOrder = 8
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
        TabOrder = 9
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
        TabOrder = 10
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Product'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object imgDetailProd: TImage
        Left = 176
        Top = 21
        Width = 297
        Height = 167
      end
      object lblDetailProd: TLabel
        Left = 10
        Top = 189
        Width = 4
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDetailAmount: TLabel
        Left = 288
        Top = 194
        Width = 51
        Height = 19
        Caption = 'Amount:'
      end
      object redDetailProd: TRichEdit
        Left = 10
        Top = 214
        Width = 225
        Height = 169
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object sedDetailAmount: TSpinEdit
        Left = 288
        Top = 226
        Width = 121
        Height = 29
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object btnDetailAdd: TButton
        Left = 288
        Top = 273
        Width = 113
        Height = 25
        Caption = 'Add to order'
        TabOrder = 2
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Cart'
      object imgRefresh: TImage
        Left = 264
        Top = 16
        Width = 73
        Height = 73
      end
      object imgCheckout: TImage
        Left = 264
        Top = 110
        Width = 73
        Height = 73
      end
      object imgBack2: TImage
        Left = -4
        Top = -1
        Width = 629
        Height = 410
      end
      object listBxCart: TListBox
        Left = 8
        Top = 16
        Width = 233
        Height = 386
        ItemHeight = 19
        TabOrder = 0
      end
      object btnRefresh: TButton
        Left = 392
        Top = 32
        Width = 97
        Height = 46
        Caption = 'Refresh Cart'
        TabOrder = 1
      end
      object btnCheckout: TButton
        Left = 392
        Top = 120
        Width = 97
        Height = 46
        Caption = 'Checkout'
        TabOrder = 2
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Checkout'
      object imgBack3: TImage
        Left = -4
        Top = -1
        Width = 629
        Height = 410
      end
    end
  end
end
