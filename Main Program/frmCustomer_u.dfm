object frmCustomer: TfrmCustomer
  Left = 0
  Top = 0
  Caption = 'Form1'
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
  object TabbedNotebook1: TTabbedNotebook
    Left = 8
    Top = 8
    Width = 300
    Height = 250
    PageIndex = 1
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -12
    TabFont.Name = 'Segoe UI'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Default'
      ExplicitTop = 6
      ExplicitHeight = 240
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = '1'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = '2'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 64
        Top = 56
        Width = 185
        Height = 41
        Caption = 'Panel1'
        TabOrder = 0
      end
    end
  end
end
