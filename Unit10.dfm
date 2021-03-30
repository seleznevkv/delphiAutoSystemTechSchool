object Form10: TForm10
  Left = 331
  Top = 216
  HelpContext = 7
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' "'#1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100'"'
  ClientHeight = 172
  ClientWidth = 244
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
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = #1048#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 36
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
    FocusControl = DBEdit3
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 8
    Width = 145
    Height = 21
    DataField = 'izgot'
    DataSource = Form9.DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 88
    Top = 40
    Width = 145
    Height = 21
    DataField = 'strana'
    DataSource = Form9.DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 88
    Top = 72
    Width = 145
    Height = 21
    DataField = 'tel'
    DataSource = Form9.DataSource1
    TabOrder = 2
    OnKeyPress = DBEdit3KeyPress
  end
  object Button1: TButton
    Left = 16
    Top = 120
    Width = 97
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 120
    Width = 97
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
end
