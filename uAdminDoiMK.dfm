object frmAdminDoiMK: TfrmAdminDoiMK
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #272#7893'i M'#7853't Kh'#7849'u'
  ClientHeight = 327
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 173
    Top = 94
    Width = 111
    Height = 28
    Caption = 'M'#7853't kh'#7849'u c'#361':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 159
    Top = 150
    Width = 125
    Height = 28
    Caption = 'M'#7853't kh'#7849'u m'#7899'i:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 127
    Top = 206
    Width = 157
    Height = 28
    Caption = 'X'#225'c nh'#7853'n MK m'#7899'i:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 216
    Top = 24
    Width = 166
    Height = 38
    Caption = #272#7893'i m'#7853't kh'#7849'u'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -28
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtMatKhauCuAdmin: TEdit
    Left = 296
    Top = 91
    Width = 193
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtMatKhauMoiAdmin: TEdit
    Left = 296
    Top = 147
    Width = 193
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtXacNhanMKAdmin: TEdit
    Left = 296
    Top = 203
    Width = 193
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnXacNhanDoiMK: TButton
    Left = 127
    Top = 262
    Width = 99
    Height = 41
    Caption = 'X'#225'c nh'#7853'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnXacNhanDoiMKClick
  end
  object btnHuyDoiMK: TButton
    Left = 350
    Top = 262
    Width = 99
    Height = 41
    Caption = 'Hu'#7927
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
end
