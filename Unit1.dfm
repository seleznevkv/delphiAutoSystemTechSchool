object Form1: TForm1
  Left = 53
  Top = 147
  Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 0
  ClientWidth = 120
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  PrintScale = poNone
  Scaled = False
  WindowState = wsMaximized
  WindowMenu = N5
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 880
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1099
        OnClick = N2Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N10Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1054#1082#1085#1086
      object N6: TMenuItem
        Caption = #1050#1072#1089#1082#1072#1076#1086#1084
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1072' '#1085#1072#1083#1077#1074#1086
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1057#1074#1077#1088#1093#1091' '#1074#1085#1080#1079
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
    end
    object N11: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = N11Click
    end
  end
  object con1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=111;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=orgtovary;Data Source=PC09202\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 24
  end
end
