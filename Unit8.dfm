object Form8: TForm8
  Left = 578
  Top = 183
  HelpContext = 8
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' "'#1055#1086#1082#1091#1087#1082#1080'"'
  ClientHeight = 232
  ClientWidth = 301
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 72
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1082#1091#1087#1082#1080
    FocusControl = dbedtdata_pokup
  end
  object lbl2: TLabel
    Left = 8
    Top = 104
    Width = 85
    Height = 13
    Caption = #1042#1085#1077#1089#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
    FocusControl = dbedtvnes_sum
  end
  object lbl3: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    FocusControl = dbedtdata_pokup
  end
  object lbl4: TLabel
    Left = 8
    Top = 136
    Width = 32
    Height = 13
    Caption = #1057#1076#1072#1095#1072
    FocusControl = dbedtvnes_sum
  end
  object lbl5: TLabel
    Left = 8
    Top = 40
    Width = 30
    Height = 13
    Caption = #1058#1086#1074#1072#1088
    FocusControl = dbedtdata_pokup
  end
  object dbedtdata_pokup: TDBEdit
    Left = 104
    Top = 72
    Width = 153
    Height = 21
    DataField = 'data_pokup'
    DataSource = Form2.ds3
    TabOrder = 2
    OnEnter = dbedtdata_pokupEnter
  end
  object dbedtvnes_sum: TDBEdit
    Left = 104
    Top = 104
    Width = 153
    Height = 21
    DataField = 'vnes_sum'
    DataSource = Form2.ds3
    TabOrder = 0
    OnKeyPress = dbedtvnes_sumKeyPress
  end
  object dblkcbbid_pokup: TDBLookupComboBox
    Left = 104
    Top = 8
    Width = 153
    Height = 21
    DataField = 'id_pokup'
    DataSource = Form2.ds3
    KeyField = 'id_pokup'
    ListField = 'fio'
    ListSource = ds1
    TabOrder = 1
  end
  object btn1: TButton
    Left = 256
    Top = 8
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btn1Click
  end
  object dbedtsdacha: TDBEdit
    Left = 104
    Top = 136
    Width = 153
    Height = 21
    DataField = 'sdacha'
    DataSource = Form2.ds3
    ReadOnly = True
    TabOrder = 4
  end
  object btn2: TButton
    Left = 16
    Top = 184
    Width = 121
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 160
    Top = 184
    Width = 121
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = btn3Click
  end
  object dtp1: TDateTimePicker
    Left = 104
    Top = 72
    Width = 153
    Height = 21
    Date = 42480.862969131940000000
    Time = 42480.862969131940000000
    TabOrder = 7
    Visible = False
    OnExit = dtp1Exit
  end
  object dblkcbbid_tovar: TDBLookupComboBox
    Left = 104
    Top = 40
    Width = 153
    Height = 21
    DataField = 'id_tovar'
    DataSource = Form2.ds3
    KeyField = 'id_tovar'
    ListField = 'proizvtov'
    ListSource = ds2
    TabOrder = 8
  end
  object btn4: TButton
    Left = 16
    Top = 184
    Width = 121
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 9
    Visible = False
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 160
    Top = 184
    Width = 121
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
    Visible = False
    OnClick = btn5Click
  end
  object qry1: TADOQuery
    Connection = Form1.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select id_pokup, fam+'#39' '#39'+left(imya,1)+'#39'. '#39'+left(otch,1)+'#39'.'#39' as f' +
        'io from pokupatel'
      'order by fio')
    Left = 40
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 64
  end
  object qry2: TADOQuery
    Connection = Form1.con1
    CursorType = ctStatic
    DataSource = ds1
    Parameters = <>
    SQL.Strings = (
      
        'select tovary.id_tovar, (izgotovitel.izgot+'#39' '#39'+ tovary.model) as' +
        ' proizvtov '
      
        'from izgotovitel inner join tovary on izgotovitel.id_izgot=tovar' +
        'y.id_izgot '
      '')
    Left = 168
    Top = 144
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 200
    Top = 144
  end
end
