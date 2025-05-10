object frmAdminDoiMK: TfrmAdminDoiMK
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #272#7893'i M'#7853't Kh'#7849'u'
  ClientHeight = 360
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Luna'
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 594
    object Label4: TLabel
      Left = 0
      Top = 0
      Width = 600
      Height = 60
      Align = alClient
      Alignment = taCenter
      Caption = #272#7893'i m'#7853't kh'#7849'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 153
      ExplicitHeight = 32
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 60
    Width = 600
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 594
    ExplicitHeight = 283
    object Label1: TLabel
      Left = 120
      Top = 40
      Width = 88
      Height = 21
      Caption = 'M'#7853't kh'#7849'u c'#361':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 100
      Width = 100
      Height = 21
      Caption = 'M'#7853't kh'#7849'u m'#7899'i:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 120
      Top = 160
      Width = 125
      Height = 21
      Caption = 'X'#225'c nh'#7853'n MK m'#7899'i:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtMatKhauCuAdmin: TEdit
      Left = 300
      Top = 40
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object edtMatKhauMoiAdmin: TEdit
      Left = 300
      Top = 100
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtXacNhanMKAdmin: TEdit
      Left = 300
      Top = 160
      Width = 200
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object btnXacNhanDoiMK: TBitBtn
      Left = 180
      Top = 220
      Width = 100
      Height = 40
      Caption = 'X'#225'c nh'#7853'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btnXacNhanDoiMKClick
    end
    object btnHuyDoiMK: TBitBtn
      Left = 320
      Top = 220
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
      TabOrder = 4
    end
  end
end
