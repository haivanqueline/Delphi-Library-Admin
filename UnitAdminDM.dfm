object DM_Admin: TDM_Admin
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDConnectionAdmin: TFDConnection
    Params.Strings = (
      'Database=KhoaLuan'
      'Server=localhost'
      'OSAuthent=Yes'
      'Encrypt=No'
      'TrustServerCertificate=Yes'
      'DriverID=MSSQL')
    Connected = True
    Left = 456
    Top = 104
  end
  object FDQuery_AdminLogin: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT *'
      'FROM ThuThu'
      
        'WHERE (TenDangNhap = :UserInput OR Email = :UserInput OR SoDienT' +
        'hoai = :UserInput)'
      '  AND TrangThai = 1')
    Left = 368
    Top = 8
    ParamData = <
      item
        Name = 'USERINPUT'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQuery_QLTL: TFDQuery
    IndexesActive = False
    Connection = FDConnectionAdmin
    UpdateOptions.UpdateTableName = 'KhoaLuan.dbo.TaiLieuTongHop'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'SELECT * FROM TaiLieuTongHop'
      '')
    Left = 128
    Top = 80
  end
  object DataSource_QLTL: TDataSource
    DataSet = FDQuery_QLTL
    Left = 128
    Top = 48
  end
  object FDQuery_QLSV: TFDQuery
    Connection = FDConnectionAdmin
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'KhoaLuan.dbo.SinhVien'
    UpdateOptions.KeyFields = 'MSSV'
    SQL.Strings = (
      'SELECT MSSV, HoLot, Ten, NgaySinh, TrangThai, TenTrangThai'
      'FROM SinhVien')
    Left = 1024
    Top = 704
  end
  object DataSource_QLSV: TDataSource
    DataSet = FDQuery_QLSV
    Left = 1024
    Top = 664
  end
  object FDQuery_QLTT: TFDQuery
    Connection = FDConnectionAdmin
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'KhoaLuan.dbo.ThuThu'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      
        'SELECT ID, MaThuThu, HoTen, TenDangNhap, Email, SoDienThoai, Nga' +
        'ySinh, VaiTro, TenVaiTro, TrangThai, NgayTao, NgayCapNhat, GhiCh' +
        'u, KhoID, LanDauDangNhap'
      'FROM ThuThu')
    Left = 120
    Top = 360
  end
  object DataSource_QLTT: TDataSource
    DataSet = FDQuery_QLTT
    Left = 120
    Top = 320
  end
  object FDQuery_DuyetMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT * FROM v_ChiTietMuonTraTaiLieu'
      'WHERE TrangThai = 1 -- Ch'#7881' l'#7845'y "Ch'#7901' duy'#7879't m'#432#7907'n"'
      'ORDER BY NgayYeuCau ASC -- '#431'u ti'#234'n y'#234'u c'#7847'u c'#361' h'#417'n')
    Left = 616
    Top = 96
  end
  object DataSource_DuyetMuon: TDataSource
    DataSet = FDQuery_DuyetMuon
    Left = 624
    Top = 56
  end
  object FDQuery_UpdateDuyetMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET TrangThai = :TrangThaiMoi, -- 2 ('#272#227' duy'#7879't) ho'#7863'c 3 (T'#7915' ch'#7889'i)'
      '    ThuThuID = :ThuThuID,'
      '    NgayDuyet = GETDATE(),'
      
        '    LyDo = CASE WHEN :TrangThaiMoi = 3 THEN :LyDoTuChoi ELSE LyD' +
        'o END -- G'#225'n l'#253' do n'#7871'u t'#7915' ch'#7889'i'
      'WHERE ID = :ID'
      '  AND TrangThai = 1 -- Ch'#7881' c'#7853'p nh'#7853't khi '#273'ang "Ch'#7901' duy'#7879't m'#432#7907'n"')
    Left = 624
    Top = 16
    ParamData = <
      item
        Name = 'TRANGTHAIMOI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'THUTHUID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'LYDOTUCHOI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_XacNhanMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT * FROM v_ChiTietMuonTraTaiLieu'
      'WHERE TrangThai = 2 -- Ch'#7881' l'#7845'y "'#272#227' duy'#7879't m'#432#7907'n"'
      'ORDER BY NgayDuyet ASC')
    Left = 656
    Top = 272
  end
  object DataSource_XacNhanMuon: TDataSource
    DataSet = FDQuery_XacNhanMuon
    Left = 664
    Top = 240
  end
  object FDQuery_UpdateXacNhanMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET TrangThai = 4, -- 4 l'#224' "'#272#227' m'#432#7907'n t'#224'i li'#7879'u"'
      '    NgayMuonThucTe = GETDATE(),'
      '    ThuThuID = :ThuThuID -- Ghi nh'#7853'n th'#7911' th'#432' x'#225'c nh'#7853'n'
      '    -- GhiChu c'#243' th'#7875' c'#7853'p nh'#7853't th'#234'm n'#7871'u c'#7847'n'
      'WHERE ID = :ID'
      '  AND TrangThai = 2 -- Ch'#7881' c'#7853'p nh'#7853't khi '#273'ang "'#272#227' duy'#7879't m'#432#7907'n"')
    Left = 672
    Top = 200
    ParamData = <
      item
        Name = 'THUTHUID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_DuyetTra: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT * FROM v_ChiTietMuonTraTaiLieu'
      'WHERE TrangThai = 7 -- Ch'#7881' l'#7845'y "Ch'#7901' duy'#7879't tr'#7843'"'
      'ORDER BY NgayYeuCau ASC')
    Left = 456
    Top = 296
  end
  object DataSource_DuyetTra: TDataSource
    DataSet = FDQuery_DuyetTra
    Left = 464
    Top = 256
  end
  object FDQuery_UpdateDuyetTra: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      
        'SET TrangThai = :TrangThaiMoi, -- 6 ('#272#227' tr'#7843') ho'#7863'c v'#7873' 4 (T'#7915' ch'#7889'i ' +
        'tr'#7843', quay l'#7841'i '#272'ang m'#432#7907'n)'
      '    ThuThuID = :ThuThuID,'
      '    NgayDuyet = GETDATE(),'
      
        '    NgayTraThucTe = CASE WHEN :TrangThaiMoi = 6 THEN GETDATE() E' +
        'LSE NgayTraThucTe END, -- G'#225'n ng'#224'y tr'#7843' th'#7921'c t'#7871' n'#7871'u duy'#7879't th'#224'nh c' +
        #244'ng'
      '    TinhTrangSach = :TinhTrangSach, -- C'#7853'p nh'#7853't t'#236'nh tr'#7841'ng s'#225'ch'
      
        '    LyDo = CASE WHEN :TrangThaiMoi <> 6 THEN :LyDoTuChoi ELSE Ly' +
        'Do END -- G'#225'n l'#253' do n'#7871'u t'#7915' ch'#7889'i'
      
        '    -- C'#226'n nh'#7855'c c'#7853'p nh'#7853't TienPhat '#7903' '#273#226'y ho'#7863'c '#273#7875' Stored Procedure' +
        ' x'#7917' l'#253
      'WHERE ID = :ID'
      '  AND TrangThai = 7 -- Ch'#7881' c'#7853'p nh'#7853't khi '#273'ang "Ch'#7901' duy'#7879't tr'#7843'"')
    Left = 464
    Top = 224
    ParamData = <
      item
        Name = 'TRANGTHAIMOI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'THUTHUID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TINHTRANGSACH'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'LYDOTUCHOI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_ThongKeTLMuonNhieu: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT TOP 20 -- L'#7845'y top 20'
      '       tl.MaTaiLieu, tl.TenTaiLieu, COUNT(mt.ID) AS SoLuotMuon'
      'FROM MuonTraTaiLieu mt'
      'JOIN TaiLieuTongHop tl ON mt.TaiLieuID = tl.ID'
      
        'WHERE mt.TrangThai IN (4, 6, 8) -- T'#237'nh c'#225'c l'#432#7907't '#273#227' m'#432#7907'n, '#273#227' tr'#7843 +
        ', qu'#225' h'#7841'n'
      
        '--AND mt.NgayMuonThucTe BETWEEN :TuNgay AND :DenNgay -- Th'#234'm n'#7871'u' +
        ' mu'#7889'n l'#7885'c theo th'#7901'i gian'
      'GROUP BY tl.MaTaiLieu, tl.TenTaiLieu'
      'ORDER BY SoLuotMuon DESC')
    Left = 464
    Top = 472
  end
  object DataSource_ThongKeTLMuonNhieu: TDataSource
    DataSet = FDQuery_ThongKeTLMuonNhieu
    Left = 472
    Top = 440
  end
  object FDQuery_HuyYeuCauDaDuyet: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET TrangThai = 5, -- 5: '#272#227' h'#7911'y m'#432#7907'n'
      '    ThuThuID = :ThuThuID,'
      '    NgayDuyet = GETDATE(), -- C'#243' th'#7875' ghi l'#7841'i ng'#224'y h'#7911'y'
      '    LyDo = :LyDoHuy'
      'WHERE ID = :ID'
      
        '  AND TrangThai = 2 -- Ch'#7881' h'#7911'y khi '#273'ang '#7903' tr'#7841'ng th'#225'i "'#272#227' duy'#7879't m' +
        #432#7907'n"')
    Left = 720
    Top = 408
    ParamData = <
      item
        Name = 'THUTHUID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'LYDOHUY'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_QuaHan: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT * FROM v_ChiTietMuonTraTaiLieu WHERE TrangThai = 8'
      'ORDER BY SoNgayTre DESC, NgayHenTra ASC')
    Left = 104
    Top = 504
  end
  object DataSource_QuaHan: TDataSource
    DataSet = FDQuery_QuaHan
    Left = 120
    Top = 456
  end
  object FDQuery_ThongKeSV: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'WITH SinhVienMuonTra AS ('
      '    -- L'#7845'y t'#7845't c'#7843' c'#225'c b'#7843'n ghi m'#432#7907'n tr'#7843' li'#234'n quan '#273#7871'n sinh vi'#234'n'
      '    SELECT'
      '        MSSV,'
      '        TrangThai,'
      
        '        TienPhat -- Gi'#7843' s'#7917' c'#243' c'#7897't TienPhat trong MuonTraTaiLieu ' +
        'ho'#7863'c View'
      '        -- Th'#234'm c'#225'c c'#7897't kh'#225'c n'#7871'u c'#7847'n thi'#7871't cho vi'#7879'c l'#7885'c sau n'#224'y'
      
        '    FROM v_ChiTietMuonTraTaiLieu -- Ho'#7863'c d'#249'ng View v_ChiTietMuon' +
        'TraTaiLieu n'#7871'u ti'#7879'n h'#417'n'
      ')'
      'SELECT'
      '    sv.MSSV,'
      '    sv.HoLot,'
      '    sv.Ten,'
      '    ISNULL(DangMuon.SoLuong, 0) AS SoLuongDangMuon,'
      '    ISNULL(QuaHan.SoLuong, 0) AS SoLuongQuaHan,'
      '    ISNULL(ChoDuyetMuon.SoLuong, 0) AS SoLuongChoDuyetMuon,'
      '    ISNULL(ChoDuyetTra.SoLuong, 0) AS SoLuongChoDuyetTra,'
      '    ISNULL(TongPhat.TongTien, 0) AS TongTienPhatChuaThanhToan'
      'FROM SinhVien sv'
      '-- Join v'#7899'i c'#225'c b'#7843'ng t'#7841'm '#273#7875' '#273#7871'm s'#7889' l'#432#7907'ng theo tr'#7841'ng th'#225'i'
      'LEFT JOIN ('
      
        '    SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE ' +
        'TrangThai = 4 GROUP BY MSSV'
      ') DangMuon ON sv.MSSV = DangMuon.MSSV'
      'LEFT JOIN ('
      
        '    SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE ' +
        'TrangThai = 8 GROUP BY MSSV'
      ') QuaHan ON sv.MSSV = QuaHan.MSSV'
      'LEFT JOIN ('
      
        '    SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE ' +
        'TrangThai = 1 GROUP BY MSSV'
      ') ChoDuyetMuon ON sv.MSSV = ChoDuyetMuon.MSSV'
      'LEFT JOIN ('
      
        '    SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE ' +
        'TrangThai = 7 GROUP BY MSSV'
      ') ChoDuyetTra ON sv.MSSV = ChoDuyetTra.MSSV'
      'LEFT JOIN ('
      
        '    SELECT MSSV, SUM(ISNULL(TienPhat, 0)) AS TongTien FROM SinhV' +
        'ienMuonTra WHERE TrangThai = 8 AND ISNULL(TienPhat,0) > 0 GROUP ' +
        'BY MSSV -- T'#237'nh t'#7893'ng ti'#7873'n ph'#7841't ch'#432'a tr'#7843' (Tr'#7841'ng th'#225'i 8 v'#224' TienPha' +
        't > 0)'
      ') TongPhat ON sv.MSSV = TongPhat.MSSV'
      'WHERE'
      '    -- '#272'i'#7873'u ki'#7879'n l'#7885'c s'#7869' '#273#432#7907'c th'#234'm b'#7857'ng code'
      
        '    (DangMuon.SoLuong > 0 OR QuaHan.SoLuong > 0 OR ChoDuyetMuon.' +
        'SoLuong > 0 OR ChoDuyetTra.SoLuong > 0) -- Ch'#7881' l'#7845'y SV c'#243' ho'#7841't '#273#7897 +
        'ng m'#432#7907'n tr'#7843
      
        '    -- Th'#234'm '#273'i'#7873'u ki'#7879'n l'#7885'c theo t'#236'nh tr'#7841'ng v'#224' t'#7915' kh'#243'a t'#236'm SV b'#7857'ng' +
        ' code'
      'ORDER BY sv.Ten, sv.HoLot')
    Left = 128
    Top = 208
  end
  object FDQuery_CapNhatPhat: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET'
      
        '    TienPhat = :TienPhatMoi, -- Truy'#7873'n ti'#7873'n ph'#7841't '#273#227' t'#237'nh s'#7861'n t'#7915' ' +
        'm'#227' ngu'#7891'n'
      '    LyDoPhat = :LyDoPhatMoi, -- Truy'#7873'n l'#253' do ph'#7841't t'#7915' m'#227' ngu'#7891'n'
      
        '    GhiChu = ISNULL(GhiChu + CHAR(13) + CHAR(10), '#39#39') + :GhiChuP' +
        'hatMoi'
      'WHERE ID = :ID'
      '  AND TrangThai = 8')
    Left = 168
    Top = 688
    ParamData = <
      item
        Name = 'TIENPHATMOI'
        ParamType = ptInput
      end
      item
        Name = 'LYDOPHATMOI'
        ParamType = ptInput
      end
      item
        Name = 'GHICHUPHATMOI'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_ChuyenChoTra: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET TrangThai = 7,'
      
        '    GhiChu = ISNULL(GhiChu + CHAR(13) + CHAR(10), '#39#39') + N'#39'Sinh v' +
        'i'#234'n '#273#227' mang s'#225'ch tr'#7843' (t'#7915' tr'#7841'ng th'#225'i Qu'#225' h'#7841'n)'#39
      'WHERE ID = :ID'
      '  AND TrangThai = 8')
    Left = 120
    Top = 632
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_TinhPhatCanXuLy: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    NgayHenTra,'
      '    TienPhat,'
      '    TrangThai,'
      '    SoNgayTre'
      'FROM v_ChiTietMuonTraTaiLieu'
      
        'WHERE (TrangThai = 8 AND NgayTraThucTe IS NULL AND SoNgayTre > 0' +
        ')'
      
        '   OR (TrangThai = 6 AND SoNgayTre > 0 AND (TienPhat IS NULL OR ' +
        'TienPhat = 0))')
    Left = 304
    Top = 632
  end
  object FDQuery_UpdateTienPhat: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu '
      'SET '
      '  TienPhat = :TienPhatMoi,'
      '  LyDoPhat = :LyDoPhatMoi,'
      '  GhiChu = :GhiChuPhatMoi'
      'WHERE ID = :ID')
    Left = 232
    Top = 600
    ParamData = <
      item
        Name = 'TIENPHATMOI'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'LYDOPHATMOI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'GHICHUPHATMOI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object FDQuery_BaoMatSach: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET TrangThai = 9,'
      '    NgayCapNhat = GETDATE(),'
      
        '    GhiChu = ISNULL(GhiChu + CHAR(13) + CHAR(10), '#39#39') + N'#39#272#227' b'#225'o' +
        ' m'#7845't t'#224'i li'#7879'u v'#224'o '#39' + CONVERT(NVARCHAR, GETDATE(), 103)'
      'WHERE ID = :ID')
    Left = 312
    Top = 720
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object FDQuery_LichSuHoatDong: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'SELECT '
      '    ls.ID, '
      '    ls.ThuThuID, '
      '    tt.HoTen AS TenThuThu, '
      '    ls.ThoiGian, '
      '    ls.HanhDong, '
      '    ls.ChiTiet,'
      '    ls.MaThuThu'
      'FROM LichSuHoatDong ls'
      'JOIN ThuThu tt ON ls.ThuThuID = tt.ID'
      'WHERE 1=1'
      '  AND ('
      '    -- Qu'#7843'n tr'#7883' vi'#234'n (VaiTro = 1): Xem t'#7845't c'#7843
      '    :VaiTro = 1'
      '    OR'
      
        '    -- Th'#7911' th'#432' ch'#237'nh (VaiTro = 2): Xem c'#7911'a m'#236'nh, th'#7911' th'#432' (3), nh' +
        #226'n vi'#234'n (4)'
      '    (:VaiTro = 2 AND tt.VaiTro IN (2, 3, 4))'
      '    OR'
      '    -- Th'#7911' th'#432' (3) v'#224' Nh'#226'n vi'#234'n (4): Ch'#7881' xem c'#7911'a m'#236'nh'
      '    (:VaiTro IN (3, 4) AND ls.ThuThuID = :ThuThuID)'
      '  )'
      'ORDER BY ls.ThoiGian DESC;')
    Left = 840
    Top = 320
    ParamData = <
      item
        Name = 'VAITRO'
        ParamType = ptInput
      end
      item
        Name = 'THUTHUID'
        ParamType = ptInput
      end>
  end
  object FDQuery_TuDongTuChoiYeuCauMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET '
      '    TrangThai = 3,'
      '    GhiChu = ISNULL(GhiChu + NCHAR(13) + NCHAR(10), N'#39#39') + '
      
        '             N'#39'H'#7879' th'#7889'ng t'#7921' '#273#7897'ng t'#7915' ch'#7889'i y'#234'u c'#7847'u m'#432#7907'n do qu'#225' h'#7841'n ' +
        'ng'#224'y h'#7865'n m'#432#7907'n ('#39' + '
      
        '             CONVERT(NVARCHAR(10), NgayHenMuon, 103) + N'#39') v'#224'o '#39 +
        ' + '
      '             CONVERT(NVARCHAR(10), GETDATE(), 103),'
      '    NgayCapNhat = GETDATE()'
      'WHERE '
      '    TrangThai = 1'
      '    AND NgayHenMuon IS NOT NULL'
      '    AND CAST(NgayHenMuon AS DATE) < CAST(GETDATE() AS DATE);')
    Left = 904
    Top = 24
  end
  object FDQuery_TuDongHuyXacNhanMuon: TFDQuery
    Connection = FDConnectionAdmin
    SQL.Strings = (
      'UPDATE MuonTraTaiLieu'
      'SET '
      '    TrangThai = 5,'
      '    GhiChu = ISNULL(GhiChu + NCHAR(13) + NCHAR(10), N'#39#39') + '
      
        '             N'#39'H'#7879' th'#7889'ng t'#7921' '#273#7897'ng h'#7911'y y'#234'u c'#7847'u m'#432#7907'n do kh'#244'ng '#273#7871'n nh' +
        #7853'n t'#224'i li'#7879'u v'#224'o ng'#224'y h'#7865'n m'#432#7907'n ('#39' + '
      
        '             CONVERT(NVARCHAR(10), NgayHenMuon, 103) + N'#39') v'#224'o '#39 +
        ' + '
      '             CONVERT(NVARCHAR(10), GETDATE(), 103),'
      '    NgayCapNhat = GETDATE()'
      'WHERE '
      '    TrangThai = 2'
      '    AND NgayHenMuon IS NOT NULL'
      '    AND CAST(NgayHenMuon AS DATE) < CAST(GETDATE() AS DATE);')
    Left = 904
    Top = 112
  end
  object FDQuery_ThongKeSVMuonNhieu: TFDQuery
    Connection = FDConnectionAdmin
    Left = 640
    Top = 640
  end
  object FDQuery_ThongKeTaiLieuMat: TFDQuery
    Connection = FDConnectionAdmin
    Left = 720
    Top = 728
  end
  object FDQuery_ThongKeTinhHinhMuonTra: TFDQuery
    Connection = FDConnectionAdmin
    Left = 856
    Top = 608
  end
  object DataSource_ThongKeSVMuonNhieu: TDataSource
    DataSet = FDQuery_ThongKeSVMuonNhieu
    Left = 616
    Top = 608
  end
  object DataSource_ThongKeTinhHinhMuonTra: TDataSource
    DataSet = FDQuery_ThongKeTinhHinhMuonTra
    Left = 856
    Top = 576
  end
  object DataSource_ThongKeTaiLieuMat: TDataSource
    DataSet = FDQuery_ThongKeTaiLieuMat
    Left = 728
    Top = 704
  end
end
