object Form4: TForm4
  Left = 447
  Top = 294
  HelpContext = 4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' "'#1042#1080#1076#1099' '#1086#1088#1075#1090#1077#1093#1085#1080#1082#1080'"'
  ClientHeight = 157
  ClientWidth = 170
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = #1042#1080#1076' '#1090#1077#1093#1085#1080#1082#1080
    FocusControl = dbedtvid
  end
  object dbedtvid: TDBEdit
    Left = 8
    Top = 32
    Width = 153
    Height = 21
    DataField = 'vid'
    DataSource = Form2.ds1
    TabOrder = 0
  end
  object btn1: TButton
    Left = 8
    Top = 64
    Width = 153
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 8
    Top = 104
    Width = 153
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btn2Click
  end
end
