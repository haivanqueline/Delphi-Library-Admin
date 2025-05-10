object frmThemSuaTaiLieu: TfrmThemSuaTaiLieu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Th'#234'm/S'#7917'a Th'#244'ng Tin T'#224'i Li'#7879'u'
  ClientHeight = 480
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
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 714
    ExplicitHeight = 463
    object lblMaTL: TLabel
      Left = 32
      Top = 24
      Width = 75
      Height = 21
      Caption = 'M'#227' t'#224'i li'#7879'u:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTenTL: TLabel
      Left = 32
      Top = 72
      Width = 76
      Height = 21
      Caption = 'T'#234'n t'#224'i li'#7879'u:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTacGia: TLabel
      Left = 32
      Top = 120
      Width = 49
      Height = 21
      Caption = 'T'#225'c gi'#7843':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNXB: TLabel
      Left = 360
      Top = 24
      Width = 54
      Height = 21
      Caption = 'Nh'#224' XB:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNamXB: TLabel
      Left = 360
      Top = 72
      Width = 59
      Height = 21
      Caption = 'N'#259'm XB:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblLoaiTL: TLabel
      Left = 360
      Top = 120
      Width = 52
      Height = 21
      Caption = 'Lo'#7841'i TL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTenLoaiTL: TLabel
      Left = 360
      Top = 168
      Width = 79
      Height = 21
      Caption = 'T'#234'n Lo'#7841'i TL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblKhoa: TLabel
      Left = 360
      Top = 216
      Width = 38
      Height = 21
      Caption = 'Khoa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNganh: TLabel
      Left = 360
      Top = 264
      Width = 50
      Height = 21
      Caption = 'Ng'#224'nh:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblMoTa: TLabel
      Left = 32
      Top = 168
      Width = 43
      Height = 21
      Caption = 'M'#244' t'#7843':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSoLuong: TLabel
      Left = 360
      Top = 312
      Width = 102
      Height = 21
      Caption = 'S'#7889' l'#432#7907'ng t'#7893'ng:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSoLuongCon: TLabel
      Left = 360
      Top = 360
      Width = 95
      Height = 21
      Caption = 'S'#7889' l'#432#7907'ng c'#242'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtMaTL: TEdit
      Left = 140
      Top = 24
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'C'#243' th'#7875' b'#7887' qua v'#236' t'#7921' nh'#7853'p'
    end
    object edtTenTL: TEdit
      Left = 140
      Top = 72
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtTacGia: TEdit
      Left = 140
      Top = 120
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtNXB: TEdit
      Left = 470
      Top = 24
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtNamXB: TSpinEdit
      Left = 470
      Top = 72
      Width = 200
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 4
      Value = 0
    end
    object cboLoaiTL: TComboBox
      Left = 470
      Top = 120
      Width = 200
      Height = 25
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnChange = cboLoaiTLChange
    end
    object edtTenLoaiTL: TEdit
      Left = 470
      Top = 168
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtKhoa: TEdit
      Left = 470
      Top = 216
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtNganh: TEdit
      Left = 470
      Top = 264
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object memMoTa: TMemo
      Left = 140
      Top = 168
      Width = 200
      Height = 240
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object edtSoLuong: TEdit
      Left = 500
      Top = 312
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object edtSoLuongCon: TEdit
      Left = 500
      Top = 360
      Width = 170
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object btnLuuTL: TBitBtn
      Left = 220
      Top = 420
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
      TabOrder = 12
      OnClick = btnLuuTLClick
    end
    object btnHuyTL: TBitBtn
      Left = 400
      Top = 420
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
      TabOrder = 13
      OnClick = btnHuyTLClick
    end
  end
end
