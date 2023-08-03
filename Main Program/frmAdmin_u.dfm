object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'Administration'
  ClientHeight = 628
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = frmCreate
  TextHeight = 15
  object TabbedNotebook1: TTabbedNotebook
    Left = -5
    Top = 0
    Width = 862
    Height = 625
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -12
    TabFont.Name = 'Segoe UI'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Database'
      ExplicitWidth = 292
      ExplicitHeight = 220
      object lblCustomer: TLabel
        Left = -1
        Top = 3
        Width = 55
        Height = 15
        Caption = 'Customer:'
      end
      object lblOrders: TLabel
        Left = 4
        Top = 127
        Width = 38
        Height = 15
        Caption = 'Orders:'
      end
      object lblProduct: TLabel
        Left = 4
        Top = 409
        Width = 50
        Height = 15
        Caption = 'Products:'
      end
      object lblSupplier: TLabel
        Left = 3
        Top = 270
        Width = 51
        Height = 15
        Caption = 'Suppliers:'
      end
      object btnLogout: TButton
        Left = 4
        Top = 562
        Width = 75
        Height = 25
        Caption = 'Log out'
        TabOrder = 0
        OnClick = btnLogoutClick
      end
      object dbgCus: TDBGrid
        Left = 0
        Top = 24
        Width = 852
        Height = 97
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object dbgOrder: TDBGrid
        Left = 0
        Top = 148
        Width = 852
        Height = 105
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object dbgProd: TDBGrid
        Left = 0
        Top = 430
        Width = 852
        Height = 94
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object dbgSup: TDBGrid
        Left = 0
        Top = 291
        Width = 852
        Height = 102
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Logs'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblCust: TLabel
        Left = 3
        Top = 14
        Width = 75
        Height = 15
        Caption = 'Customer log:'
      end
      object lblOrder: TLabel
        Left = 300
        Top = 14
        Width = 53
        Height = 15
        Caption = 'Order log:'
      end
      object lblSupplierLog: TLabel
        Left = 599
        Top = 14
        Width = 66
        Height = 15
        Caption = 'Supplier log:'
      end
      object redCust: TRichEdit
        Left = 4
        Top = 35
        Width = 253
        Height = 510
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object redOrder: TRichEdit
        Left = 300
        Top = 35
        Width = 253
        Height = 510
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object redSupp: TRichEdit
        Left = 599
        Top = 35
        Width = 253
        Height = 510
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnRefreshLog: TButton
        Left = 4
        Top = 562
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 3
        OnClick = btnRefreshLogClick
      end
    end
  end
end
