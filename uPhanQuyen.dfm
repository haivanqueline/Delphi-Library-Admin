object frmPhanQuyen: TfrmPhanQuyen
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ph'#226'n Quy'#7873'n Th'#7911' Th'#432
  ClientHeight = 402
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object lblThuThuDuocChonPQ: TLabel
    Left = 0
    Top = 0
    Width = 704
    Height = 28
    Align = alTop
    Caption = 'Ph'#226'n quy'#7873'n cho: [T'#234'n Th'#7911' Th'#432']'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 264
  end
  object clbQuyen: TCheckListBox
    Left = 0
    Top = 28
    Width = 704
    Height = 334
    Align = alClient
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 28
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 698
    ExplicitHeight = 317
  end
  object pnlPhanQuyenActions: TPanel
    Left = 0
    Top = 362
    Width = 704
    Height = 40
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 345
    ExplicitWidth = 698
    object btnLuuQuyen: TButton
      Left = 496
      Top = 1
      Width = 132
      Height = 38
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Align = alRight
      Caption = 'L'#432'u Quy'#7873'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnLuuQuyenClick
      ExplicitLeft = 490
    end
    object btnDongPQ: TButton
      Left = 628
      Top = 1
      Width = 75
      Height = 38
      Margins.Left = 5
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = #272#243'ng'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 622
    end
  end
end
