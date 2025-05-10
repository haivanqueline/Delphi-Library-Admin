object frmPhanQuyen: TfrmPhanQuyen
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ph'#226'n Quy'#7873'n Th'#7911' Th'#432
  ClientHeight = 420
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 714
    object lblThuThuDuocChonPQ: TLabel
      Left = 0
      Top = 0
      Width = 720
      Height = 50
      Align = alClient
      Caption = 'Ph'#226'n quy'#7873'n cho: [T'#234'n Th'#7911' Th'#432']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 237
      ExplicitHeight = 21
    end
  end
  object clbQuyen: TCheckListBox
    Left = 0
    Top = 50
    Width = 720
    Height = 330
    Align = alClient
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 714
    ExplicitHeight = 313
  end
  object pnlPhanQuyenActions: TPanel
    Left = 0
    Top = 380
    Width = 720
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 363
    ExplicitWidth = 714
    object btnLuuQuyen: TBitBtn
      Left = 520
      Top = 0
      Width = 100
      Height = 40
      Align = alRight
      Caption = 'L'#432'u Quy'#7873'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnLuuQuyenClick
      ExplicitLeft = 514
    end
    object btnDongPQ: TBitBtn
      Left = 620
      Top = 0
      Width = 100
      Height = 40
      Align = alRight
      Caption = #272#243'ng'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 614
    end
  end
end
