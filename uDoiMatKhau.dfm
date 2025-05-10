object frmDoiMatKhau: TfrmDoiMatKhau
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #272#7893'i m'#7853't kh'#7849'u'
  ClientHeight = 310
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Luna'
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 594
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 600
      Height = 65
      Align = alClient
      Alignment = taCenter
      Caption = #272#7893'i m'#7853't kh'#7849'u l'#7847'n '#273#7847'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 321
      ExplicitHeight = 45
    end
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 80
    Width = 440
    Height = 153
    Caption = 'Th'#244'ng tin m'#7853't kh'#7849'u'
    TabOrder = 1
    object lblMatKhauMoi: TLabel
      Left = 32
      Top = 32
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
    object lblXacNhanMatKhauMoi: TLabel
      Left = 32
      Top = 88
      Width = 169
      Height = 28
      Caption = 'X'#225'c nh'#7853'n m'#7853't kh'#7849'u:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtMatKhauMoi: TEdit
      Left = 208
      Top = 36
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
    object edtXacNhanMatKhau: TEdit
      Left = 208
      Top = 92
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
  end
  object btnXacNhan: TBitBtn
    Left = 200
    Top = 260
    Width = 100
    Height = 35
    Caption = #272#7893'i m'#7853't kh'#7849'u'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = btnXacNhanClick
  end
  object btnHuy: TBitBtn
    Left = 320
    Top = 260
    Width = 100
    Height = 35
    Caption = 'Hu'#7927
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = btnHuyClick
  end
end
