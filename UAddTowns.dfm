object AddTowns: TAddTowns
  Left = 108
  Top = 185
  Width = 171
  Height = 252
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAddCity: TBitBtn
    Left = 10
    Top = 176
    Width = 63
    Height = 25
    Caption = #1054#1082
    TabOrder = 0
    OnClick = btnAddCityClick
  end
  object mmo4add: TMemo
    Left = 10
    Top = 40
    Width = 135
    Height = 129
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 80
    Top = 176
    Width = 67
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnFromFile: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 3
    OnClick = btnFromFileClick
  end
  object dlgOpen: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    InitialDir = '/'
    Left = 112
    Top = 48
  end
end
