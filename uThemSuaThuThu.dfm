object frmThemSuaThuThu: TfrmThemSuaThuThu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Th'#234'm/S'#7917'a Th'#244'ng Tin Th'#7911' Th'#432
  ClientHeight = 411
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 18
    Top = 24
    Width = 64
    Height = 28
    Caption = 'H'#7885' T'#234'n:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 82
    Width = 138
    Height = 28
    Caption = 'T'#234'n '#272#259'ng Nh'#7853'p:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 18
    Top = 136
    Width = 51
    Height = 28
    Caption = 'Email:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 192
    Width = 125
    Height = 28
    Caption = 'S'#7889' '#272'i'#7879'n Tho'#7841'i:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 18
    Top = 246
    Width = 94
    Height = 28
    Caption = 'Ng'#224'y Sinh:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 18
    Top = 302
    Width = 62
    Height = 28
    Caption = 'Vai Tr'#242':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 360
    Top = 24
    Width = 73
    Height = 28
    Caption = 'Ghi Ch'#250':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblMatKhauMoi: TLabel
    Left = 360
    Top = 243
    Width = 128
    Height = 28
    Caption = 'M'#7853't Kh'#7849'u M'#7899'i:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblXacNhanMK: TLabel
    Left = 360
    Top = 302
    Width = 120
    Height = 28
    Caption = 'XN M'#7853't Kh'#7849'u:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object edtHoTenTT: TEdit
    Left = 88
    Top = 21
    Width = 259
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtTenDangNhapTT: TEdit
    Left = 162
    Top = 79
    Width = 185
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtEmailTT: TEdit
    Left = 75
    Top = 133
    Width = 272
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtSDTTT: TEdit
    Left = 149
    Top = 189
    Width = 198
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object dtpNgaySinhTT: TDateTimePicker
    Left = 118
    Top = 240
    Width = 229
    Height = 36
    Date = 45761.000000000000000000
    Time = 0.677230231478461100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object cboVaiTroTT: TComboBox
    Left = 86
    Top = 299
    Width = 261
    Height = 36
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object memGhiChuTT: TMemo
    Left = 439
    Top = 21
    Width = 233
    Height = 122
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'memGhiChuTT')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object chkTrangThaiTT: TCheckBox
    Left = 439
    Top = 149
    Width = 170
    Height = 28
    Caption = 'Ho'#7841't '#273#7897'ng'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object chkYeuCauDoiMK: TCheckBox
    Left = 439
    Top = 188
    Width = 202
    Height = 49
    Caption = 'Y'#234'u c'#7847'u '#273#7893'i m'#7853't kh'#7849'u khi '#273#259'ng nh'#7853'p l'#7847'n '#273#7847'u'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    WordWrap = True
  end
  object edtMatKhauTT: TEdit
    Left = 494
    Top = 243
    Width = 178
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 9
    Visible = False
  end
  object edtXacNhanMKTT: TEdit
    Left = 494
    Top = 299
    Width = 178
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 10
    Visible = False
  end
  object btnLuuTT: TButton
    Left = 200
    Top = 348
    Width = 97
    Height = 49
    Caption = 'L'#432'u'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = btnLuuTTClick
  end
  object btnHuyTT: TButton
    Left = 388
    Top = 348
    Width = 92
    Height = 49
    Caption = 'Hu'#7927
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 12
  end
end
