object frmThemSuaThuThu: TfrmThemSuaThuThu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Th'#234'm/S'#7917'a Th'#244'ng Tin Th'#7911' Th'#432
  ClientHeight = 460
  ClientWidth = 720
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Luna'
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 460
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 714
    ExplicitHeight = 443
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 50
      Height = 21
      Caption = 'H'#7885' T'#234'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 80
      Width = 109
      Height = 21
      Caption = 'T'#234'n '#272#259'ng Nh'#7853'p:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 136
      Width = 41
      Height = 21
      Caption = 'Email:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 192
      Width = 99
      Height = 21
      Caption = 'S'#7889' '#272'i'#7879'n Tho'#7841'i:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 248
      Width = 75
      Height = 21
      Caption = 'Ng'#224'y Sinh:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 304
      Width = 50
      Height = 21
      Caption = 'Vai Tr'#242':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 360
      Top = 24
      Width = 59
      Height = 21
      Caption = 'Ghi Ch'#250':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblMatKhauMoi: TLabel
      Left = 360
      Top = 248
      Width = 69
      Height = 21
      Caption = 'M'#7853't Kh'#7849'u:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblXacNhanMK: TLabel
      Left = 360
      Top = 304
      Width = 94
      Height = 21
      Caption = 'XN M'#7853't Kh'#7849'u:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edtHoTenTT: TEdit
      Left = 170
      Top = 24
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtTenDangNhapTT: TEdit
      Left = 170
      Top = 80
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtEmailTT: TEdit
      Left = 170
      Top = 136
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtSDTTT: TEdit
      Left = 170
      Top = 192
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtpNgaySinhTT: TDateTimePicker
      Left = 170
      Top = 248
      Width = 170
      Height = 25
      Date = 45761.000000000000000000
      Time = 0.677230231478461100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cboVaiTroTT: TComboBox
      Left = 170
      Top = 304
      Width = 170
      Height = 25
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object memGhiChuTT: TMemo
      Left = 470
      Top = 24
      Width = 200
      Height = 160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object chkTrangThaiTT: TCheckBox
      Left = 470
      Top = 190
      Width = 170
      Height = 28
      Caption = 'Ho'#7841't '#273#7897'ng'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object chkYeuCauDoiMK: TCheckBox
      Left = 470
      Top = 220
      Width = 200
      Height = 28
      Caption = 'Y'#234'u c'#7847'u '#273#7893'i m'#7853't kh'#7849'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object edtMatKhauTT: TEdit
      Left = 470
      Top = 248
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 9
      Visible = False
    end
    object edtXacNhanMKTT: TEdit
      Left = 470
      Top = 304
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 10
      Visible = False
    end
    object btnLuuTT: TBitBtn
      Left = 220
      Top = 380
      Width = 100
      Height = 40
      Caption = 'L'#432'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 11
      OnClick = btnLuuTTClick
    end
    object btnHuyTT: TBitBtn
      Left = 400
      Top = 380
      Width = 100
      Height = 40
      Caption = 'Hu'#7927
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 12
    end
  end
end
