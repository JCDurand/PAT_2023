object frmSupplier: TfrmSupplier
  Left = 0
  Top = 0
  Caption = 'Supplier'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object tbNtbk1: TTabbedNotebook
    Left = 0
    Top = 1
    Width = 633
    Height = 440
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
      Caption = 'Details'
      ExplicitWidth = 292
      ExplicitHeight = 220
    end
    object TTabPage
      Left = 4
      Top = 26
      Caption = 'Products'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button2: TButton
        Left = 448
        Top = 166
        Width = 121
        Height = 73
        Caption = 'Button1'
        TabOrder = 0
      end
      object Button3: TButton
        Left = 152
        Top = 303
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
      end
      object LabeledEdit1: TLabeledEdit
        Left = 8
        Top = 168
        Width = 121
        Height = 23
        EditLabel.Width = 67
        EditLabel.Height = 15
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 2
        Text = ''
      end
      object LabeledEdit3: TLabeledEdit
        Left = 8
        Top = 216
        Width = 121
        Height = 23
        EditLabel.Width = 67
        EditLabel.Height = 15
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 3
        Text = ''
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 8
        Width = 609
        Height = 120
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object ComboBox1: TComboBox
        Left = 152
        Top = 167
        Width = 121
        Height = 23
        TabOrder = 5
        Text = 'ComboBox1'
      end
      object SpinEdit1: TSpinEdit
        Left = 293
        Top = 167
        Width = 44
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 152
        Top = 218
        Width = 121
        Height = 23
        EditLabel.Width = 67
        EditLabel.Height = 15
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 7
        Text = ''
      end
      object LabeledEdit4: TLabeledEdit
        Left = 293
        Top = 216
        Width = 121
        Height = 23
        EditLabel.Width = 67
        EditLabel.Height = 15
        EditLabel.Caption = 'LabeledEdit4'
        TabOrder = 8
        Text = ''
      end
    end
  end
end
