object frmAdminLogin: TfrmAdminLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #272#259'ng Nh'#7853'p Qu'#7843'n Tr'#7883' / Th'#7911' Th'#432
  ClientHeight = 352
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblTenDangNhap: TLabel
    Left = 84
    Top = 128
    Width = 239
    Height = 28
    Caption = 'T'#234'n '#273#259'ng nh'#7853'p (Email/S'#272'T):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblMatKhauAdmin: TLabel
    Left = 237
    Top = 192
    Width = 86
    Height = 28
    Caption = 'M'#7853't kh'#7849'u:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 176
    Top = 40
    Width = 274
    Height = 45
    Caption = #272#259'ng nh'#7853'p qu'#7843'n tr'#7883
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtTenDangNhap: TEdit
    Left = 328
    Top = 125
    Width = 185
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtMatKhauAdmin: TEdit
    Left = 328
    Top = 189
    Width = 185
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnAdminLogin: TButton
    Left = 144
    Top = 280
    Width = 145
    Height = 41
    Caption = #272#259'ng Nh'#7853'p'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnAdminLoginClick
  end
  object btnAdminThoat: TButton
    Left = 328
    Top = 280
    Width = 145
    Height = 41
    Cancel = True
    Caption = 'Tho'#225't'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnAdminThoatClick
  end
end
