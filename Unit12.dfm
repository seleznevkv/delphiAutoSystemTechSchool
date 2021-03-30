object Form12: TForm12
  Left = 414
  Top = 207
  HelpContext = 10
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' "'#1055#1086#1082#1091#1087#1072#1090#1077#1083#1100'"'
  ClientHeight = 198
  ClientWidth = 275
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 49
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel
    Left = 24
    Top = 72
    Width = 47
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 24
    Top = 104
    Width = 79
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object Button1: TButton
    Left = 33
    Top = 152
    Width = 97
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 145
    Top = 152
    Width = 97
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 8
    Width = 129
    Height = 21
    DataField = 'fam'
    DataSource = Form11.DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 40
    Width = 129
    Height = 21
    DataField = 'imya'
    DataSource = Form11.DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 120
    Top = 72
    Width = 129
    Height = 21
    DataField = 'otch'
    DataSource = Form11.DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 120
    Top = 104
    Width = 129
    Height = 21
    DataField = 'datar'
    DataSource = Form11.DataSource1
    TabOrder = 5
    OnEnter = DBEdit4Enter
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 104
    Width = 129
    Height = 21
    Date = 42481.532227962960000000
    Time = 42481.532227962960000000
    TabOrder = 6
    Visible = False
    OnExit = DateTimePicker1Exit
  end
end
