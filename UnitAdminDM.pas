unit UnitAdminDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM_Admin = class(TDataModule)
    FDConnectionAdmin: TFDConnection;
    FDQuery_AdminLogin: TFDQuery;
    FDQuery_QLTL: TFDQuery;
    DataSource_QLTL: TDataSource;
    FDQuery_QLSV: TFDQuery;
    DataSource_QLSV: TDataSource;
    FDQuery_QLTT: TFDQuery;
    DataSource_QLTT: TDataSource;
    FDQuery_DuyetMuon: TFDQuery;
    DataSource_DuyetMuon: TDataSource;
    FDQuery_UpdateDuyetMuon: TFDQuery;
    FDQuery_XacNhanMuon: TFDQuery;
    DataSource_XacNhanMuon: TDataSource;
    FDQuery_UpdateXacNhanMuon: TFDQuery;
    FDQuery_DuyetTra: TFDQuery;
    DataSource_DuyetTra: TDataSource;
    FDQuery_UpdateDuyetTra: TFDQuery;
    FDQuery_ThongKeTLMuonNhieu: TFDQuery;
    DataSource_ThongKeTLMuonNhieu: TDataSource;
    FDQuery_HuyYeuCauDaDuyet: TFDQuery;
    FDQuery_QuaHan: TFDQuery;
    DataSource_QuaHan: TDataSource;
    FDQuery_ThongKeSV: TFDQuery;
    FDQuery_CapNhatPhat: TFDQuery;
    FDQuery_ChuyenChoTra: TFDQuery;
    FDQuery_TinhPhatCanXuLy: TFDQuery;
    FDQuery_UpdateTienPhat: TFDQuery;
    FDQuery_BaoMatSach: TFDQuery;
    FDQuery_LichSuHoatDong: TFDQuery;
    FDQuery_TuDongTuChoiYeuCauMuon: TFDQuery;
    FDQuery_TuDongHuyXacNhanMuon: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  function TinhVaCapNhatTienPhat(SoNgayTreToiThieu: Integer = 1; TienPhatQuaHanMoiNgay: Currency = 5000; TienPhatMatSach: Currency = 100000): Integer;
  end;

var
  DM_Admin: TDM_Admin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
uses System.DateUtils;

function TDM_Admin.TinhVaCapNhatTienPhat(SoNgayTreToiThieu: Integer = 1; TienPhatQuaHanMoiNgay: Currency = 5000; TienPhatMatSach: Currency = 100000): Integer;
var
  Query: TFDQuery;
begin
  Result := 0;

  // Kiểm tra giá trị tham số
  if TienPhatQuaHanMoiNgay <= 0 then
    raise Exception.Create('Tiền phạt quá hạn mỗi ngày phải lớn hơn 0.');
  if TienPhatMatSach <= 0 then
    raise Exception.Create('Tiền phạt mất sách phải lớn hơn 0.');
  if SoNgayTreToiThieu < 0 then
    raise Exception.Create('Số ngày trễ tối thiểu không thể âm.');

  // Đảm bảo kết nối và query sẵn sàng
  if not FDConnectionAdmin.Connected then
    raise Exception.Create('Lỗi: Chưa kết nối đến cơ sở dữ liệu.');

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDConnectionAdmin;
    Query.SQL.Text := 'UPDATE v_ChiTietMuonTraTaiLieu ' +
                      'SET TienPhat = CASE ' +
                      '  WHEN TrangThai = 8 AND SoNgayTre >= :SoNgayTre THEN SoNgayTre * :TienPhatMoiNgay ' +
                      '  WHEN TrangThai = 9 THEN :TienPhatMatSach ' +
                      '  ELSE TienPhat ' +
                      'END, ' +
                      'LyDoPhat = CASE ' +
                      '  WHEN TrangThai = 8 AND SoNgayTre >= :SoNgayTre THEN N''Phạt quá hạn'' ' +
                      '  WHEN TrangThai = 9 THEN N''Phạt mất sách'' ' +
                      '  ELSE LyDoPhat ' +
                      'END, ' +
                      'GhiChu = ISNULL(GhiChu + NCHAR(13)+NCHAR(10), N'''') + ' +
                      'N''Đã tính tiền phạt vào '' + CONVERT(NVARCHAR(10), GETDATE(), 103) ' +
                      'WHERE TrangThai IN (6, 8, 9) AND (TrangThai = 9 OR SoNgayTre >= :SoNgayTre)';
    Query.Params.CreateParam(ftInteger, 'SoNgayTre', ptInput);
    Query.Params.CreateParam(ftCurrency, 'TienPhatMoiNgay', ptInput);
    Query.Params.CreateParam(ftCurrency, 'TienPhatMatSach', ptInput);
    Query.ParamByName('SoNgayTre').AsInteger := SoNgayTreToiThieu;
    Query.ParamByName('TienPhatMoiNgay').AsCurrency := TienPhatQuaHanMoiNgay;
    Query.ParamByName('TienPhatMatSach').AsCurrency := TienPhatMatSach;

    FDConnectionAdmin.StartTransaction;
    try
      Query.ExecSQL;
      Result := Query.RowsAffected;
      FDConnectionAdmin.Commit;
    except
      on E: Exception do
      begin
        FDConnectionAdmin.Rollback;
        raise Exception.Create('Lỗi khi cập nhật tiền phạt: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

end.
