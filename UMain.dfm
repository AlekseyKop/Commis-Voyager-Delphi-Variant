object Main: TMain
  Left = 241
  Top = 97
  Width = 945
  Height = 467
  Caption = #1043#1083#1072#1074#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object lbl: TLabel
    Left = 0
    Top = 183
    Width = 937
    Height = 13
    Align = alBottom
    Caption = #1051#1086#1075
  end
  object g1: TGauge
    Left = 0
    Top = 410
    Width = 937
    Height = 11
    Align = alBottom
    Enabled = False
    Progress = 0
  end
  object SG4view: TStringGrid
    Left = 8
    Top = 8
    Width = 113
    Height = 49
    Align = alCustom
    ColCount = 2
    DefaultColWidth = 50
    DefaultRowHeight = 20
    FixedColor = clInactiveBorder
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object mmo_log: TMemo
    Left = 0
    Top = 196
    Width = 937
    Height = 214
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object mm: TMainMenu
    Left = 744
    Top = 8
    object MmTableKM: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1081
      object MmAddTowns: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1075#1086#1088#1086#1076#1086#1074'...'
        OnClick = MmAddTownsClick
      end
      object MmRandomize: TMenuItem
        Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1084#1080' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1103#1084#1080
        OnClick = MmRandomizeClick
      end
    end
    object MmTask: TMenuItem
      Caption = #1056#1077#1096#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
      object MmFill: TMenuItem
        Caption = #1055#1086#1083#1085#1099#1081' '#1087#1077#1088#1077#1073#1086#1088
        OnClick = MmFillClick
      end
      object MmMura: TMenuItem
        Caption = #1052#1091#1088#1072#1074#1100#1080#1085#1099#1081' '#1072#1083#1075#1086#1088#1080#1090#1084
        OnClick = MmMuraClick
      end
    end
    object MmViewSolve: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077' '#1079#1072#1076#1072#1095#1080
      OnClick = MmViewSolveClick
    end
    object MmLog: TMenuItem
      Caption = #1051#1086#1075
      object MmClear: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = MmClearClick
      end
      object mmSaveToFile: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
        OnClick = mmSaveToFileClick
      end
    end
    object MmExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = MmExitClick
    end
  end
  object dlgSaveLog: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Left = 744
    Top = 64
  end
end
