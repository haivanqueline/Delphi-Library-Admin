object frmAdminMain: TfrmAdminMain
  Left = 0
  Top = 0
  Caption = 'M'#432#7907'n tr'#7843' t'#224'i li'#7879'u'
  ClientHeight = 608
  ClientWidth = 1095
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000040000C30E0000C30E000000000000000000000000
    0000000000000000000000000000B073362AB59762919B9C6DD49E9A69F39E98
    67F39B9D6DD3B6956091A973362A000000000000000000000000000000000000
    000000000000916D2407B0925E929D9F71FC86A276FF849F73FF6EAE89FF8398
    69FF7FA67FFF919665FF9E9D6DFBB1936091AA7F2A0600000000000000000000
    0000AA7F2A06A99664BA979E6FFF809565FF808D56FFA16E21FFAC620FFFAB63
    10FF9C7329FF779665FF70AB88FF979866FFAB9865BAAA7F2A06000000000000
    0000B1915D91989A68FF769A6EFFA16D21FFAC630FFF957837FF818A56FF7B96
    69FF997D3DFFAD630FFF9D7127FF779C6FFF999765FFB1935E9100000000B379
    392CA09F70FDAE6B1DFFA57127FFD9C2A5FFE0D0B9FFA7B494FF79B196FF87A7
    83FFA0BCA1FFDFCEB6FFD8BE9EFFA57128FFB06C20FF9E9D6FFCB073302AB690
    5791A08548FFAC630FFFAD630FFFB4762DFFDBC9AFFFDFCEB7FFDFCFB8FFDFCF
    B9FFE0CFBAFFDCC9AEFFB5772FFFAC630FFFAC630FFFA0894DFFBA955D91B67F
    3DD4AC6210FF808955FF6F966DFF878348FF75956CFF907E40FF86834BFF818A
    56FF8D7E3FFF72956CFF799060FF85854FFF818A55FFAC6310FFB77E3CD3B67B
    36F4AC630FFF97742EFF937632FF9B7028FF958043FF9A7836FF90834BFF9184
    4BFF9D7431FF958F5CFF917837FF887F46FF97732EFFAC630FFFB67B36F3B67B
    37F4AC630FFFAC630FFFAC630FFFAC630FFFB97E38FFE8E2D3FFE9E1D4FFE5DC
    CAFFE5DECCFFC2925BFFB9864AFFAF6A1AFFAC630FFFAC630FFFB67B36F3B77E
    3CD3AC630FFFAC630FFFAC630FFFAC630FFFB4752BFFF0EADFFFF5F1EBFFF2EC
    E3FFEEE9DEFFB97E39FFAE6817FFBB894EFFAD6410FFAC630FFFB7803DD3BD8C
    5291AC630FFFAC630FFFAC630FFFAC630FFFAC630FFFB9803DFFB6A57BFFB4B2
    8CFFB8803DFFAC630FFFB27229FFB78140FFAC630EFFAC6310FFBD905691B37F
    392CB57831FDAC630FFFAC630FFFAC630FFFAC630FFFAC630FFF46C1ABFF27E0
    DFFFAC630FFFAF6A1BFFBB8648FFAC630FFFAC630FFFB47830FCB079302A0000
    0000B9894E92AF6919FFAC630FFFAC630FFFAC630FFFAC630FFF7C915BFF7299
    68FFAC630FFFB7803EFFB06B1DFFAC630FFFAF6919FFBA894E92000000000000
    0000B66D2407B9874BBAAF6919FFAC630FFFAC630FFFAC630FFF7B915BFFAC62
    10FFAC630FFFBA8646FFAC630FFFAF6A19FFBA874ABA916D2407000000000000
    000000000000B66D2407B7894E93B57831FDAF6C1DFFB7803DFFB58341FFB780
    3DFFB7803DFFBB894BFFB47832FDB9884E92AA7F2A0600000000000000000000
    0000000000000000000000000000B37F392CBC905691B88444D3B77F3DF4B780
    3DF4B98445D4BD915B91B379392C00000000000000000000000000000000F00F
    0000C00300008001000080010000000000000000000000000000000000000000
    00000000000000000000000000008001000080010000C0030000F00F0000}
  WindowState = wsMaximized
  StyleName = 'Luna'
  OnActivate = FormActivate
  TextHeight = 15
  object pnlAdminHeader: TPanel
    Left = 0
    Top = 0
    Width = 1095
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1089
    object lblAdminHoTen: TLabel
      Left = 0
      Top = 0
      Width = 279
      Height = 49
      Align = alLeft
      AutoSize = False
      Caption = 'Ch'#224'o m'#7915'ng: [T'#234'n '#272#259'ng Nh'#7853'p]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 10
      ExplicitHeight = 70
    end
    object lblAdminVaiTro: TLabel
      Left = 279
      Top = 0
      Width = 190
      Height = 49
      Align = alLeft
      Caption = 'Vai tr'#242': [T'#234'n Vai Tr'#242']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 28
    end
    object btnAdminDoiMatKhau: TBitBtn
      Left = 735
      Top = 0
      Width = 140
      Height = 49
      Align = alRight
      Caption = #272#7893'i M'#7853't Kh'#7849'u'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnAdminDoiMatKhauClick
      ExplicitLeft = 729
    end
    object btnAdminDangXuat: TBitBtn
      Left = 875
      Top = 0
      Width = 120
      Height = 49
      Align = alRight
      Caption = #272#259'ng Xu'#7845't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnAdminDangXuatClick
      ExplicitLeft = 869
    end
    object btnAdminThoat: TBitBtn
      Left = 995
      Top = 0
      Width = 100
      Height = 49
      Align = alRight
      Caption = 'Tho'#225't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnAdminThoatClick
      ExplicitLeft = 989
    end
  end
  object pgcAdminMain: TPageControl
    Left = 0
    Top = 49
    Width = 1095
    Height = 559
    ActivePage = tsDuyetMuon
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Style = tsButtons
    TabOrder = 1
    OnChange = pgcAdminMainChange
    ExplicitWidth = 1089
    ExplicitHeight = 542
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
        Width = 1087
        Height = 464
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
        Font.Height = -13
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
        Top = 464
        Width = 1087
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object btnDuyetMuon_DongY: TBitBtn
          Left = 10
          Top = 10
          Width = 140
          Height = 40
          Caption = 'Duy'#7879't '#272#7891'ng '#221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkOK
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = btnDuyetMuon_DongYClick
        end
        object btnDuyetMuon_TuChoi: TBitBtn
          Left = 160
          Top = 10
          Width = 140
          Height = 40
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkCancel
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = btnDuyetMuon_TuChoiClick
        end
      end
    end
    object tsXacNhanMuon: TTabSheet
      Caption = 'X'#225'c Nh'#7853'n '#272#227' M'#432#7907'n'
      ImageIndex = 1
      object pnlXacNhanActions: TPanel
        Left = 0
        Top = 464
        Width = 1087
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object btnXacNhan_DongY: TBitBtn
          Left = 10
          Top = 10
          Width = 140
          Height = 40
          Caption = 'X'#225'c nh'#7853'n m'#432#7907'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkOK
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = btnXacNhan_DongYClick
        end
        object btnXacNhan_TuChoi: TBitBtn
          Left = 160
          Top = 10
          Width = 140
          Height = 40
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkCancel
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = btnXacNhan_TuChoiClick
        end
      end
      object lstvXacNhan: TListView
        Left = 0
        Top = 0
        Width = 1087
        Height = 464
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
        Font.Height = -13
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
      ImageIndex = 2
      object lstvDuyetTra: TListView
        Left = 0
        Top = 0
        Width = 1087
        Height = 464
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
        Font.Height = -13
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
        Top = 464
        Width = 1087
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object lblDuyetTra_LyDo: TLabel
          Left = 310
          Top = 15
          Width = 91
          Height = 21
          Caption = 'L'#253' do t'#7915' ch'#7889'i:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblDuyetTra_TinhTrang: TLabel
          Left = 632
          Top = 15
          Width = 109
          Height = 21
          Caption = 'T'#236'nh tr'#7841'ng s'#225'ch:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnDuyetTra_DongY: TBitBtn
          Left = 10
          Top = 10
          Width = 140
          Height = 40
          Caption = 'Duy'#7879't '#272#7891'ng '#221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkOK
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = btnDuyetTra_DongYClick
        end
        object btnDuyetTra_TuChoi: TBitBtn
          Left = 160
          Top = 10
          Width = 140
          Height = 40
          Caption = 'T'#7915' Ch'#7889'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkCancel
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = btnDuyetTra_TuChoiClick
        end
        object edtDuyetTra_LyDo: TEdit
          Left = 430
          Top = 15
          Width = 200
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object edtDuyetTra_TinhTrang: TEdit
          Left = 770
          Top = 15
          Width = 300
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    object tsQuaHan: TTabSheet
      Caption = 'T'#224'i Li'#7879'u Qu'#225' H'#7841'n'
      ImageIndex = 7
      object lstvQuaHan: TListView
        Left = 0
        Top = 0
        Width = 1087
        Height = 464
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'M'#227' M'#432#7907'n Tr'#7843
            Width = 120
          end
          item
            Caption = 'MSSV'
            Width = 100
          end
          item
            Caption = 'T'#234'n Sinh Vi'#234'n'
            Width = 200
          end
          item
            Caption = 'M'#227' T'#224'i Li'#7879'u'
            Width = 120
          end
          item
            Caption = 'T'#234'n T'#224'i Li'#7879'u'
            Width = 250
          end
          item
            Caption = 'Ng'#224'y H'#7865'n Tr'#7843
            Width = 150
          end
          item
            Caption = 'S'#7889' Ng'#224'y Tr'#7877
            Width = 100
          end
          item
            Caption = 'Ti'#7873'n Ph'#7841't'
            Width = 100
          end
          item
            Caption = 'Tr'#7841'ng Th'#225'i'
            Width = 100
          end
          item
            Caption = 'ID'
            Width = 0
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object pnlQuaHan_Actions: TPanel
        Left = 0
        Top = 464
        Width = 1087
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object btnQuaHan_GuiThongBao: TBitBtn
          Left = 14
          Top = 6
          Width = 200
          Height = 40
          Caption = 'G'#7917'i Th'#244'ng B'#225'o Nh'#7855'c Nh'#7903
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnQuaHan_GuiThongBaoClick
        end
        object btnQuaHan_XemChiTiet: TBitBtn
          Left = 220
          Top = 10
          Width = 180
          Height = 40
          Caption = 'Xem Chi Ti'#7871't Y'#234'u C'#7847'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnQuaHan_XemChiTietClick
        end
        object btnQuaHan_XacNhanTra: TBitBtn
          Left = 410
          Top = 10
          Width = 180
          Height = 40
          Caption = 'X'#225'c Nh'#7853'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Kind = bkOK
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = btnQuaHan_XacNhanTraClick
        end
        object btnQuaHan_CapNhatPhat: TBitBtn
          Left = 897
          Top = 10
          Width = 180
          Height = 40
          Caption = 'C'#7853'p Nh'#7853't Ti'#7873'n Ph'#7841't'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnQuaHan_CapNhatPhatClick
        end
        object Panel1: TPanel
          Left = 600
          Top = 10
          Width = 287
          Height = 40
          BevelOuter = bvNone
          TabOrder = 4
          object edtQuaHan_TienPhatMoiNgay: TLabeledEdit
            Left = -1
            Top = 16
            Width = 140
            Height = 25
            EditLabel.Width = 117
            EditLabel.Height = 12
            EditLabel.Caption = 'Ti'#7873'n ph'#7841't m'#7895'i ng'#224'y (VND):'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -10
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = ''
          end
          object edtQuaHan_TienPhatMatSach: TLabeledEdit
            Left = 145
            Top = 16
            Width = 140
            Height = 25
            EditLabel.Width = 115
            EditLabel.Height = 12
            EditLabel.Caption = 'Ti'#7873'n ph'#7841't m'#7845't s'#225'ch (VND):'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -10
            EditLabel.Font.Name = 'Segoe UI'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
        end
      end
    end
    object tsQuanLyTaiLieu: TTabSheet
      Caption = 'Qu'#7843'n L'#253' T'#224'i Li'#7879'u'
      ImageIndex = 3
      object pnlQLTL_Actions: TPanel
        Left = 0
        Top = 0
        Width = 1087
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object lblQLTL_TimKiem: TLabel
          Left = 10
          Top = 15
          Width = 29
          Height = 21
          Caption = 'T'#236'm:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtQLTL_TuKhoa: TEdit
          Left = 50
          Top = 10
          Width = 500
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = 'M'#227', t'#234'n, t'#225'c gi'#7843'...'
        end
        object btnQLTL_TimKiem: TBitBtn
          Left = 560
          Top = 10
          Width = 100
          Height = 28
          Caption = 'T'#236'm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnQLTL_TimKiemClick
        end
        object btnQLTL_Them: TBitBtn
          Left = 870
          Top = 10
          Width = 100
          Height = 28
          Caption = 'Th'#234'm M'#7899'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLTL_ThemClick
        end
        object btnQLTL_Sua: TBitBtn
          Left = 970
          Top = 10
          Width = 100
          Height = 28
          Caption = 'S'#7917'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 3
          OnClick = btnQLTL_SuaClick
        end
        object btnQLTL_Xoa: TBitBtn
          Left = 1070
          Top = 10
          Width = 100
          Height = 28
          Caption = 'Xo'#225
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 4
          OnClick = btnQLTL_XoaClick
        end
      end
      object dbgQLTL_DanhSach: TDBGrid
        Left = 0
        Top = 50
        Width = 1087
        Height = 444
        Align = alClient
        DataSource = DM_Admin.DataSource_QLTL
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MaTaiLieu'
            Title.Caption = 'M'#227' t'#224'i li'#7879'u'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenTaiLieu'
            Title.Caption = 'T'#234'n t'#224'i li'#7879'u'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenTacGia'
            Title.Caption = 'T'#234'n t'#225'c gi'#7843
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NhaXB'
            Title.Caption = 'Nh'#224' xu'#7845't b'#7843'n'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NamXB'
            Title.Caption = 'N'#259'm xu'#7845't b'#7843'n'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenLoaiTL'
            Title.Caption = 'Lo'#7841'i t'#224'i li'#7879'u'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Khoa'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nganh'
            Title.Caption = 'Ng'#224'nh'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MoTa'
            Title.Caption = 'M'#244' t'#7843
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoLuong'
            Title.Caption = 'S'#7889' l'#432#7907'ng'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoLuongCon'
            Title.Caption = 'S'#7889' l'#432#7907'ng c'#242'n'
            Width = 80
            Visible = True
          end>
      end
      object dbnQLTL: TDBNavigator
        Left = 0
        Top = 494
        Width = 1087
        Height = 30
        DataSource = DM_Admin.DataSource_QLTL
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh]
        Align = alBottom
        Flat = True
        TabOrder = 2
      end
    end
    object tsQuanLySinhVien: TTabSheet
      Caption = 'Qu'#7843'n L'#253' Sinh Vi'#234'n'
      ImageIndex = 4
      object pnlQLSV_BoLoc: TPanel
        Left = 0
        Top = 0
        Width = 1087
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object lblQLSV_NhanTinhTrang: TLabel
          Left = 10
          Top = 10
          Width = 74
          Height = 21
          Caption = 'T'#236'nh tr'#7841'ng:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblQLSV_TimSV: TLabel
          Left = 460
          Top = 13
          Width = 95
          Height = 21
          Caption = 'T'#236'm sinh vi'#234'n:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cboQLSV_TinhTrang: TComboBox
          Left = 110
          Top = 10
          Width = 340
          Height = 25
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'T'#7845't c'#7843' Sinh vi'#234'n c'#243' m'#432#7907'n/tr'#7843
          Items.Strings = (
            'T'#7845't c'#7843' Sinh vi'#234'n c'#243' m'#432#7907'n/tr'#7843
            'Sinh vi'#234'n '#273'ang m'#432#7907'n'
            'Sinh vi'#234'n c'#243' s'#225'ch qu'#225' h'#7841'n'
            'Sinh vi'#234'n c'#243' y'#234'u c'#7847'u ch'#7901' duy'#7879't m'#432#7907'n'
            'Sinh vi'#234'n c'#243' y'#234'u c'#7847'u ch'#7901' duy'#7879't tr'#7843)
        end
        object edtQLSV_TuKhoaSV: TEdit
          Left = 580
          Top = 10
          Width = 400
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = 'Nh'#7853'p MSSV ho'#7863'c T'#234'n sinh vi'#234'n...'
        end
        object btnQLSV_LocTim: TBitBtn
          Left = 990
          Top = 9
          Width = 100
          Height = 28
          Caption = 'L'#7885'c / T'#236'm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLSV_LocTimClick
        end
      end
      object lstvQLSV_KetQua: TListView
        Left = 0
        Top = 50
        Width = 1087
        Height = 474
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'MSSV'
            Width = 100
          end
          item
            Caption = 'H'#7885' T'#234'n Sinh Vi'#234'n'
            Width = 200
          end
          item
            Caption = 'S'#7889' L'#432#7907'ng '#272'ang M'#432#7907'n'
            Width = 150
          end
          item
            Caption = 'S'#7889' L'#432#7907'ng Qu'#225' H'#7841'n'
            Width = 150
          end
          item
            Caption = 'S'#7889' L'#432#7907'ng Ch'#7901' Duy'#7879't M'#432#7907'n'
            Width = 170
          end
          item
            Caption = 'S'#7889' L'#432#7907'ng Ch'#7901' Duy'#7879't Tr'#7843
            Width = 150
          end
          item
            AutoSize = True
            Caption = 'T'#7893'ng Ti'#7873'n Ph'#7841't Ch'#432'a Thanh To'#225'n'
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        RowSelect = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object tsQuanLyThuThu: TTabSheet
      Caption = 'Qu'#7843'n L'#253' Th'#7911' Th'#432
      ImageIndex = 5
      object pnlQLTT_Actions: TPanel
        Left = 0
        Top = 0
        Width = 1087
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object btnQLTT_Them: TBitBtn
          Left = 10
          Top = 10
          Width = 140
          Height = 28
          Caption = 'Th'#234'm Th'#7911' Th'#432
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnClick = btnQLTT_ThemClick
        end
        object btnQLTT_Sua: TBitBtn
          Left = 160
          Top = 10
          Width = 140
          Height = 28
          Caption = 'S'#7917'a Th'#244'ng Tin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = btnQLTT_SuaClick
        end
        object btnQLTT_DoiMatKhau: TBitBtn
          Left = 310
          Top = 10
          Width = 140
          Height = 28
          Caption = #272#7863't L'#7841'i M'#7853't Kh'#7849'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = btnQLTT_DoiMatKhauClick
        end
        object btnQLTT_VoHieuHoa: TBitBtn
          Left = 460
          Top = 10
          Width = 180
          Height = 28
          Caption = 'V'#244' Hi'#7879'u H'#243'a / K'#237'ch Ho'#7841't'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnQLTT_VoHieuHoaClick
        end
        object btnQLTT_PhanQuyen: TBitBtn
          Left = 650
          Top = 10
          Width = 140
          Height = 28
          Caption = 'Ph'#226'n Quy'#7873'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnQLTT_PhanQuyenClick
        end
      end
      object dbgQLTT_DanhSach: TDBGrid
        Left = 0
        Top = 50
        Width = 1087
        Height = 444
        Align = alClient
        DataSource = DM_Admin.DataSource_QLTT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MaThuThu'
            Title.Caption = 'M'#227' th'#7911' th'#432
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HoTen'
            Title.Caption = 'H'#7885' t'#234'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenDangNhap'
            Title.Caption = 'T'#234'n '#273#259'ng nh'#7853'p'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SoDienThoai'
            Title.Caption = 'S'#7889' '#273'i'#7879'n tho'#7841'i'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgaySinh'
            Title.Caption = 'Ng'#224'y sinh'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TenVaiTro'
            Title.Caption = 'Vai tr'#242
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TrangThai'
            Title.Caption = 'Tr'#7841'ng th'#225'i'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgayTao'
            Title.Caption = 'Ng'#224'y t'#7841'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NgayCapNhat'
            Title.Caption = 'Ng'#224'y c'#7853'p nh'#7853'p'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GhiChu'
            Title.Caption = 'Ghi ch'#250
            Width = 100
            Visible = True
          end>
      end
      object dbnQLTT: TDBNavigator
        Left = 0
        Top = 494
        Width = 1087
        Height = 30
        DataSource = DM_Admin.DataSource_QLTT
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbRefresh]
        Align = alBottom
        Flat = True
        TabOrder = 2
      end
    end
    object tsThongKe: TTabSheet
      Caption = 'Th'#7889'ng K'#234
      ImageIndex = 6
      object pnlTK_ChonLoai: TPanel
        Left = 0
        Top = 0
        Width = 1087
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 54
          Top = 15
          Width = 134
          Height = 21
          Caption = 'Ch'#7885'n lo'#7841'i th'#7889'ng k'#234':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cboTK_LoaiThongKe: TComboBox
          Left = 194
          Top = 11
          Width = 300
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
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
          Left = 500
          Top = 8
          Width = 140
          Height = 28
          Date = 45780.000000000000000000
          Time = 45780.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dtpTK_DenNgay: TDateTimePicker
          Left = 654
          Top = 8
          Width = 140
          Height = 28
          Date = 45780.000000000000000000
          Time = 45780.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnTK_Xem: TBitBtn
          Left = 800
          Top = 8
          Width = 140
          Height = 28
          Caption = 'Xem Th'#7889'ng K'#234
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnTK_XemClick
        end
      end
      object pnlTK_KetQua: TPanel
        Left = 0
        Top = 50
        Width = 1087
        Height = 474
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object dbgThongKe: TDBGrid
          Left = 0
          Top = 0
          Width = 1087
          Height = 474
          Align = alClient
          DataSource = DM_Admin.DataSource_ThongKeTLMuonNhieu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'MaTaiLieu'
              Title.Caption = 'M'#227' t'#224'i li'#7879'u'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TenTaiLieu'
              Title.Caption = 'T'#234'n t'#224'i li'#7879'u'
              Width = 800
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SoLuotMuon'
              Title.Caption = 'S'#7889' l'#432#7907't m'#432#7907'n'
              Width = 100
              Visible = True
            end>
        end
      end
    end
    object tsLichSuHoatDong: TTabSheet
      Caption = 'L'#7883'ch s'#7917' ho'#7841't '#273#7897'ng'
      ImageIndex = 8
      object lstvLichSuHoatDong: TListView
        Left = 0
        Top = 0
        Width = 1087
        Height = 524
        Align = alClient
        Columns = <
          item
            Caption = 'STT'
            Width = 40
          end
          item
            Caption = 'Th'#7901'i gian'
            Width = 200
          end
          item
            Caption = 'M'#227' th'#7911' th'#432
            Width = 100
          end
          item
            Caption = 'T'#234'n th'#7911' th'#432
            Width = 150
          end
          item
            Caption = 'H'#224'nh '#273#7897'ng'
            Width = 200
          end
          item
            AutoSize = True
            Caption = 'Chi ti'#7871't'
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
end
