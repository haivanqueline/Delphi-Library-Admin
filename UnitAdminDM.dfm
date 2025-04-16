object DM_Admin: TDM_Admin
  Height = 1080
  Width = 1440
  PixelsPerInch = 144
  object FDConnectionAdmin: TFDConnection
    Params.Strings = (
      'Server=HARIQUEF'
      'Database=KhoaLuan'
      'User_Name=sa'
      'Password=Zingspeedline1@'
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
    Top = 72
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
    Left = 120
    Top = 208
  end
  object DataSource_QLSV: TDataSource
    DataSet = FDQuery_QLSV
    Left = 120
    Top = 168
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
    Left = 792
    Top = 144
  end
  object DataSource_DuyetMuon: TDataSource
    DataSet = FDQuery_DuyetMuon
    Left = 800
    Top = 104
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
    Left = 800
    Top = 64
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
    Left = 856
    Top = 336
  end
  object DataSource_XacNhanMuon: TDataSource
    DataSet = FDQuery_XacNhanMuon
    Left = 864
    Top = 304
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
    Left = 872
    Top = 264
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
      
        '      -- AND mt.NgayMuonThucTe BETWEEN :TuNgay AND :DenNgay -- T' +
        'h'#234'm n'#7871'u mu'#7889'n l'#7885'c theo th'#7901'i gian'
      'GROUP BY tl.MaTaiLieu, tl.TenTaiLieu'
      'ORDER BY SoLuotMuon DESC')
    Left = 464
    Top = 472
    ParamData = <
      item
        Name = 'TuNgay'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DenNgay'
        DataType = ftDate
        ParamType = ptInput
      end>
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
    Left = 784
    Top = 480
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
      'SELECT * FROM v_ChiTietMuonTraTaiLieu WHERE TrangThai = 8')
    Left = 232
    Top = 576
  end
  object DataSource_QuaHan: TDataSource
    DataSet = FDQuery_QuaHan
    Left = 232
    Top = 536
  end
end
