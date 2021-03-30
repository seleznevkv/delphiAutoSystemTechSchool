object Form15: TForm15
  Left = 396
  Top = 222
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 266
  ClientWidth = 257
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 97
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Edit1: TEdit
      Left = 88
      Top = 24
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 88
      Top = 56
      Width = 137
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 241
    Height = 97
    Caption = #1057#1077#1088#1074#1077#1088
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 37
      Height = 13
      Caption = #1048#1084#1103'/IP'
    end
    object Label4: TLabel
      Left = 16
      Top = 56
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object Edit3: TEdit
      Left = 88
      Top = 24
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 88
      Top = 56
      Width = 137
      Height = 21
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 16
    Top = 224
    Width = 97
    Height = 33
    Caption = #1042#1086#1081#1090#1080
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 224
    Width = 97
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
end
