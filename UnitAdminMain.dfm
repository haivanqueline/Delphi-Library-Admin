object frmAdminMain: TfrmAdminMain
  Left = 0
  Top = 0
  Caption = 'M'#432#7907'n tr'#7843' t'#224'i li'#7879'u'
  ClientHeight = 540
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnActivate = FormActivate
  TextHeight = 15
  object pnlAdminHeader: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 957
    object lblAdminHoTen: TLabel
      Left = 0
      Top = 0
      Width = 279
      Height = 65
      Margins.Left = 10
      Align = alLeft
      AutoSize = False
      Caption = 'Ch'#224'o m'#7915'ng: [T'#234'n '#272#259'ng Nh'#7853'p]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object lblAdminVaiTro: TLabel
      Left = 279
      Top = 0
      Width = 183
      Height = 65
      Margins.Right = 10
      Align = alLeft
      Caption = 'Vai tr'#242': [T'#234'n Vai Tr'#242']'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object btnAdminThoat: TButton
      Left = 888
      Top = 0
      Width = 75
      Height = 65
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = 'Tho'#225't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAdminThoatClick
      ExplicitLeft = 882
    end
    object btnAdminDangXuat: TButton
      Left = 784
      Top = 0
      Width = 104
      Height = 65
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = #272#259'ng Xu'#7845't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnAdminDangXuatClick
      ExplicitLeft = 778
    end
    object btnAdminDoiMatKhau: TButton
      Left = 656
      Top = 0
      Width = 128
      Height = 65
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alRight
      Caption = #272#7893'i M'#7853't Kh'#7849'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAdminDoiMatKhauClick
      ExplicitLeft = 650
    end
  end
  object pgcAdminMain: TPageControl
    Left = 0
    Top = 65
    Width = 963
    Height = 475
    ActivePage = tsQuanLyThuThu
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pgcAdminMainChange
    ExplicitWidth = 957
    ExplicitHeight = 458
    object tsDuyetMuon: TTabSheet
      Caption = 'Duy'#7879't Y'#234'u C'#7847'u M'#432#7907'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object lstvDuyetMuon: TListView
        Left = 0
        Top = 0
        Width = 955
        Height = 384
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'M'#227' y'#234'u c'#7847'u'
            Width = 120
          end
          item
            Caption = 'MSSV'
            Width = 120
          end
          item
            Caption = 'T'#234'n sinh vi'#234'n'
            Width = 200
          end
          item
            Caption = 'M'#227' t'#224'i li'#7879'u'
            Width = 120
          end
          item
            AutoSize = True
            Caption = 'T'#234'n t'#224'i li'#7879'u'
            WidthType = (
              -99)
          end
          item
            Caption = 'Ng'#224'y y'#234'u c'#7847'u'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n m'#432#7907'n'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n tr'#7843
            Width = 150
          end
          item
            Caption = 'ID YCM'
            Width = 0
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        MultiSelect = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object pnlDuyetMuonActions: TPanel
        Left = 0
        Top = 384
        Width = 955
        Height = 55
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblDuyetMuon_LyDo: TLabel
          Left = 225
          Top = 0
          Width = 117
          Height = 28
          Margins.Left = 20
          Margins.Top = 10
          Align = alLeft
          Caption = 'L'#253' do t'#7915' ch'#7889'i:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object btnDuyetMuon_DongY: TButton
          Left = 0
          Top = 0
          Width = 129
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'Duy'#7879't '#272#7891'ng '#221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnDuyetMuon_DongYClick
        end
        object btnDuyetMuon_TuChoi: TButton
          Left = 129
          Top = 0
          Width = 96
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnDuyetMuon_TuChoiClick
        end
        object edtDuyetMuon_LyDo: TEdit
          Left = 342
          Top = 0
          Width = 613
          Height = 55
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          TabOrder = 2
          Visible = False
          ExplicitHeight = 23
        end
      end
    end
    object tsXacNhanMuon: TTabSheet
      Caption = 'X'#225'c Nh'#7853'n '#272#227' M'#432#7907'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object pnlXacNhanActions: TPanel
        Left = 0
        Top = 384
        Width = 955
        Height = 55
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object lblXacNhan_LyDo: TLabel
          Left = 249
          Top = 0
          Width = 117
          Height = 28
          Margins.Left = 20
          Margins.Top = 10
          Align = alLeft
          Caption = 'L'#253' do t'#7915' ch'#7889'i:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object btnXacNhan_DongY: TButton
          Left = 0
          Top = 0
          Width = 153
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'X'#225'c nh'#7853'n m'#432#7907'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnXacNhan_DongYClick
        end
        object btnXacNhan_TuChoi: TButton
          Left = 153
          Top = 0
          Width = 96
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnXacNhan_TuChoiClick
        end
        object edtXacNhan_LyDo: TEdit
          Left = 366
          Top = 0
          Width = 589
          Height = 55
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          TabOrder = 2
          Visible = False
          ExplicitHeight = 23
        end
      end
      object lstvXacNhan: TListView
        Left = 0
        Top = 0
        Width = 955
        Height = 384
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'M'#227' y'#234'u c'#7847'u'
            Width = 120
          end
          item
            Caption = 'MSSV'
            Width = 120
          end
          item
            Caption = 'T'#234'n sinh vi'#234'n'
            Width = 200
          end
          item
            Caption = 'M'#227' t'#224'i li'#7879'u'
            Width = 120
          end
          item
            AutoSize = True
            Caption = 'T'#234'n t'#224'i li'#7879'u'
            WidthType = (
              -99)
          end
          item
            Caption = 'Ng'#224'y y'#234'u c'#7847'u'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n m'#432#7907'n'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n tr'#7843
            Width = 150
          end
          item
            Caption = 'ID YCM'
            Width = 0
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        MultiSelect = True
        RowSelect = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object tsDuyetTra: TTabSheet
      Caption = 'Duy'#7879't Y'#234'u C'#7847'u Tr'#7843
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object lstvDuyetTra: TListView
        Left = 0
        Top = 0
        Width = 955
        Height = 384
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'M'#227' y'#234'u c'#7847'u'
            Width = 120
          end
          item
            Caption = 'MSSV'
            Width = 120
          end
          item
            Caption = 'T'#234'n sinh vi'#234'n'
            Width = 200
          end
          item
            Caption = 'M'#227' t'#224'i li'#7879'u'
            Width = 120
          end
          item
            AutoSize = True
            Caption = 'T'#234'n t'#224'i li'#7879'u'
            WidthType = (
              -99)
          end
          item
            Caption = 'Ng'#224'y y'#234'u c'#7847'u'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n m'#432#7907'n'
            Width = 150
          end
          item
            Caption = 'Ng'#224'y h'#7865'n tr'#7843
            Width = 150
          end
          item
            Caption = 'ID YCM'
            Width = 0
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        MultiSelect = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object pnlDuyetTraActions: TPanel
        Left = 0
        Top = 384
        Width = 955
        Height = 55
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblDuyetTra_LyDo: TLabel
          Left = 233
          Top = 0
          Width = 117
          Height = 28
          Margins.Left = 20
          Margins.Top = 10
          Align = alLeft
          Caption = 'L'#253' do t'#7915' ch'#7889'i:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object lblDuyetTra_TinhTrang: TLabel
          Left = 560
          Top = 0
          Width = 136
          Height = 28
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          Caption = 'T'#236'nh tr'#7841'ng s'#225'ch:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object btnDuyetTra_DongY: TButton
          Left = 0
          Top = 0
          Width = 137
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'Duy'#7879't '#272#7891'ng '#221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnDuyetTra_DongYClick
        end
        object btnDuyetTra_TuChoi: TButton
          Left = 137
          Top = 0
          Width = 96
          Height = 55
          Margins.Left = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnDuyetTra_TuChoiClick
        end
        object edtDuyetTra_LyDo: TEdit
          Left = 350
          Top = 0
          Width = 283
          Height = 55
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alLeft
          TabOrder = 2
          Visible = False
          ExplicitHeight = 23
        end
        object edtDuyetTra_TinhTrang: TEdit
          Left = 696
          Top = 0
          Width = 259
          Height = 55
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          TabOrder = 3
          ExplicitHeight = 23
        end
      end
    end
    object tsQuanLyTaiLieu: TTabSheet
      Caption = 'Qu'#7843'n L'#253' T'#224'i Li'#7879'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object pnlQLTL_Actions: TPanel
        Left = 0
        Top = 0
        Width = 955
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblQLTL_TimKiem: TLabel
          Left = 0
          Top = 0
          Width = 36
          Height = 28
          Margins.Left = 10
          Margins.Right = 5
          Align = alLeft
          Caption = 'T'#236'm:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object edtQLTL_TuKhoa: TEdit
          Left = 36
          Top = 0
          Width = 557
          Height = 45
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'M'#227', t'#234'n, t'#225'c gi'#7843'...'
          ExplicitHeight = 36
        end
        object btnQLTL_TimKiem: TButton
          Left = 593
          Top = 0
          Width = 75
          Height = 45
          Margins.Left = 5
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'T'#236'm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnQLTL_TimKiemClick
        end
        object btnQLTL_Them: TButton
          Left = 704
          Top = 0
          Width = 101
          Height = 45
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          Caption = 'Th'#234'm M'#7899'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLTL_ThemClick
        end
        object btnQLTL_Sua: TButton
          Left = 805
          Top = 0
          Width = 75
          Height = 45
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 10
          Align = alRight
          Caption = 'S'#7917'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnQLTL_SuaClick
        end
        object btnQLTL_Xoa: TButton
          Left = 880
          Top = 0
          Width = 75
          Height = 45
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 10
          Align = alRight
          Caption = 'Xo'#225
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnQLTL_XoaClick
        end
      end
      object dbgQLTL_DanhSach: TDBGrid
        Left = 0
        Top = 45
        Width = 955
        Height = 369
        Align = alClient
        DataSource = DM_Admin.DataSource_QLTL
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MaTaiLieu'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenTaiLieu'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenTacGia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NhaXB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NamXB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenLoaiTL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Khoa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nganh'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MoTa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoLuong'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoLuongCon'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgayCapNhat'
            Visible = True
          end>
      end
      object dbnQLTL: TDBNavigator
        Left = 0
        Top = 414
        Width = 955
        Height = 25
        DataSource = DM_Admin.DataSource_QLTL
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh]
        Align = alBottom
        TabOrder = 2
      end
    end
    object tsQuanLySinhVien: TTabSheet
      Caption = 'Qu'#7843'n L'#253' Sinh Vi'#234'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      object pnlQLSV_Actions: TPanel
        Left = 0
        Top = 0
        Width = 955
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 949
        object lblQLSV_TimKiem: TLabel
          Left = 0
          Top = 0
          Width = 36
          Height = 28
          Margins.Left = 10
          Margins.Right = 5
          Align = alLeft
          Caption = 'T'#236'm:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object edtQLSV_TuKhoa: TEdit
          Left = 36
          Top = 0
          Width = 557
          Height = 45
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'MSSV, h'#7885' t'#234'n,...'
          ExplicitHeight = 36
        end
        object btnQLSV_TimKiem: TButton
          Left = 593
          Top = 0
          Width = 75
          Height = 45
          Margins.Left = 5
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'T'#236'm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnQLSV_TimKiemClick
        end
        object btnQLSV_Sua: TButton
          Left = 880
          Top = 0
          Width = 75
          Height = 45
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 10
          Align = alRight
          Caption = 'S'#7917'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLSV_SuaClick
          ExplicitLeft = 874
        end
      end
      object dbgQLSV_DanhSach: TDBGrid
        Left = 0
        Top = 45
        Width = 955
        Height = 369
        Align = alClient
        DataSource = DM_Admin.DataSource_QLSV
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'MSSV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HoLot'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ten'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgaySinh'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenTrangThai'
            Visible = True
          end>
      end
      object dbnQLSV: TDBNavigator
        Left = 0
        Top = 414
        Width = 955
        Height = 25
        DataSource = DM_Admin.DataSource_QLSV
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh]
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 397
        ExplicitWidth = 949
      end
    end
    object tsQuanLyThuThu: TTabSheet
      Caption = 'Qu'#7843'n L'#253' Th'#7911' Th'#432
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 5
      ParentFont = False
      object pnlQLTT_Actions: TPanel
        Left = 0
        Top = 0
        Width = 955
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 949
        object btnQLTT_Them: TButton
          Left = 0
          Top = 0
          Width = 113
          Height = 45
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'Th'#234'm Th'#7911' Th'#432
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnQLTT_ThemClick
        end
        object btnQLTT_Sua: TButton
          Left = 113
          Top = 0
          Width = 120
          Height = 45
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'S'#7917'a Th'#244'ng Tin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnQLTT_SuaClick
        end
        object btnQLTT_PhanQuyen: TButton
          Left = 537
          Top = 0
          Width = 96
          Height = 45
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'Ph'#226'n Quy'#7873'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLTT_PhanQuyenClick
        end
        object btnQLTT_VoHieuHoa: TButton
          Left = 361
          Top = 0
          Width = 176
          Height = 45
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'V'#244' Hi'#7879'u H'#243'a / K'#237'ch Ho'#7841't'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnQLTT_VoHieuHoaClick
        end
        object btnQLTT_DoiMatKhau: TButton
          Left = 233
          Top = 0
          Width = 128
          Height = 45
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alLeft
          Caption = #272#7863't L'#7841'i M'#7853't Kh'#7849'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnQLTT_DoiMatKhauClick
        end
      end
      object dbgQLTT_DanhSach: TDBGrid
        Left = 0
        Top = 45
        Width = 955
        Height = 369
        Align = alClient
        DataSource = DM_Admin.DataSource_QLTT
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MaThuThu'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HoTen'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenDangNhap'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoDienThoai'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgaySinh'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenVaiTro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TrangThai'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgayTao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgayCapNhat'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GhiChu'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KhoID'
            Visible = True
          end>
      end
      object dbnQLTT: TDBNavigator
        Left = 0
        Top = 414
        Width = 955
        Height = 25
        DataSource = DM_Admin.DataSource_QLTT
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 397
        ExplicitWidth = 949
      end
    end
    object tsThongKe: TTabSheet
      Caption = 'Th'#7889'ng K'#234
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object pnlTK_ChonLoai: TPanel
        Left = 0
        Top = 0
        Width = 955
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 170
          Height = 41
          Align = alLeft
          Caption = 'Ch'#7885'n lo'#7841'i th'#7889'ng k'#234':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 28
        end
        object cboTK_LoaiThongKe: TComboBox
          Left = 170
          Top = 0
          Width = 288
          Height = 41
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'T'#224'i li'#7879'u m'#432#7907'n nhi'#7873'u nh'#7845't'
            'Sinh vi'#234'n m'#432#7907'n nhi'#7873'u nh'#7845't'
            'T'#224'i li'#7879'u qu'#225' h'#7841'n'
            'T'#236'nh h'#236'nh m'#432#7907'n tr'#7843' theo th'#7901'i gian')
        end
        object dtpTK_TuNgay: TDateTimePicker
          Left = 458
          Top = 0
          Width = 145
          Height = 41
          Align = alLeft
          Date = 45758.000000000000000000
          Time = 0.605820196760760200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ExplicitHeight = 36
        end
        object dtpTK_DenNgay: TDateTimePicker
          Left = 603
          Top = 0
          Width = 140
          Height = 41
          Align = alLeft
          Date = 45758.000000000000000000
          Time = 0.605893703701440200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ExplicitHeight = 36
        end
        object btnTK_Xem: TButton
          Left = 743
          Top = 0
          Width = 154
          Height = 41
          Align = alLeft
          Caption = 'Xem Th'#7889'ng K'#234
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnTK_XemClick
        end
      end
      object pnlTK_KetQua: TPanel
        Left = 0
        Top = 41
        Width = 955
        Height = 398
        Align = alClient
        TabOrder = 1
        object dbgThongKe: TDBGrid
          Left = 1
          Top = 1
          Width = 953
          Height = 396
          Align = alClient
          DataSource = DM_Admin.DataSource_ThongKeTLMuonNhieu
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'MaTaiLieu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TenTaiLieu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SoLuotMuon'
              Visible = True
            end>
        end
      end
    end
  end
end
