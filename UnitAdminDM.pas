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
  MuonTraID: Int64;
  NgayHenTraValue: TDate;
  TrangThai: Integer;
  SoNgayTreThucTe: Integer;
  TienPhatMoi: Currency;
  LyDoPhatMoi, GhiChuPhatMoi: string;
  Today: TDate;
  SoBanGhiCapNhat: Integer;
begin
  Result := 0; // Số bản ghi được cập nhật
  SoBanGhiCapNhat := 0;

  // Đảm bảo các query tồn tại và đã được kết nối
  if (FDQuery_TinhPhatCanXuLy = nil) or (FDQuery_UpdateTienPhat = nil) or
     (not FDConnectionAdmin.Connected) then
  begin
    raise Exception.Create('Lỗi: Query tính phạt chưa sẵn sàng hoặc chưa kết nối CSDL.');
  end;

  Today := Date;

  // Sử dụng FDQuery_TinhPhatCanXuLy đã được cấu hình sẵn trong .dfm
  FDQuery_TinhPhatCanXuLy.Close;
  FDQuery_TinhPhatCanXuLy.Open;

  if FDQuery_TinhPhatCanXuLy.IsEmpty then
  begin
    Exit; // Không có gì để làm, trả về 0
  end;

  // Bắt đầu transaction để đảm bảo cập nhật đồng bộ
  FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số cho query UPDATE tồn tại
    if FDQuery_UpdateTienPhat.Params.FindParam('TienPhatMoi') = nil then
      FDQuery_UpdateTienPhat.Params.CreateParam(ftCurrency, 'TienPhatMoi', ptInput);
    if FDQuery_UpdateTienPhat.Params.FindParam('LyDoPhatMoi') = nil then
      FDQuery_UpdateTienPhat.Params.CreateParam(ftString, 'LyDoPhatMoi', ptInput);
    if FDQuery_UpdateTienPhat.Params.FindParam('GhiChuPhatMoi') = nil then
      FDQuery_UpdateTienPhat.Params.CreateParam(ftString, 'GhiChuPhatMoi', ptInput);
    if FDQuery_UpdateTienPhat.Params.FindParam('ID') = nil then
      FDQuery_UpdateTienPhat.Params.CreateParam(ftLargeint, 'ID', ptInput);

    // Duyệt qua từng bản ghi cần tính phạt
    FDQuery_TinhPhatCanXuLy.First;
    while not FDQuery_TinhPhatCanXuLy.EOF do
    begin
      MuonTraID := FDQuery_TinhPhatCanXuLy.FieldByName('ID').AsLargeInt;
      NgayHenTraValue := FDQuery_TinhPhatCanXuLy.FieldByName('NgayHenTra').AsDateTime;
      TrangThai := FDQuery_TinhPhatCanXuLy.FieldByName('TrangThai').AsInteger;
      SoNgayTreThucTe := FDQuery_TinhPhatCanXuLy.FieldByName('SoNgayTre').AsInteger; // Lấy từ view

      // Kiểm tra trạng thái: Mất sách, Quá hạn, hoặc Đã trả trễ
      if TrangThai = 9 then // "Mất sách"
      begin
        TienPhatMoi := TienPhatMatSach;
        LyDoPhatMoi := 'Phạt mất sách';
        GhiChuPhatMoi := Format('Đã tính tiền phạt mất sách: %sđ vào %s', [FormatFloat('#,##0', TienPhatMatSach), FormatDateTime('dd/mm/yyyy', Today)]);
      end
      else if (TrangThai IN [6, 8]) and (SoNgayTreThucTe >= SoNgayTreToiThieu) then
      begin
        TienPhatMoi := SoNgayTreThucTe * TienPhatQuaHanMoiNgay;
        LyDoPhatMoi := Format('Phạt quá hạn trả sách: %d ngày', [SoNgayTreThucTe]);
        GhiChuPhatMoi := Format('Đã tính tiền phạt: %sđ (%d ngày x %sđ) vào %s', [FormatFloat('#,##0', TienPhatMoi), SoNgayTreThucTe, FormatFloat('#,##0', TienPhatQuaHanMoiNgay), FormatDateTime('dd/mm/yyyy', Today)]);
      end
      else
      begin
        FDQuery_TinhPhatCanXuLy.Next;
        Continue; // Bỏ qua nếu không đủ điều kiện phạt
      end;

      // Giới hạn độ dài chuỗi trước khi gán vào tham số
      LyDoPhatMoi := Copy(LyDoPhatMoi, 1, 500);
      GhiChuPhatMoi := Copy(GhiChuPhatMoi, 1, 500);

      // Cập nhật tiền phạt và ghi đè GhiChu cho bản ghi này
      try
        FDQuery_UpdateTienPhat.Params.ParamByName('TienPhatMoi').AsCurrency := TienPhatMoi;
        FDQuery_UpdateTienPhat.Params.ParamByName('LyDoPhatMoi').AsString := LyDoPhatMoi;
        FDQuery_UpdateTienPhat.Params.ParamByName('GhiChuPhatMoi').AsString := GhiChuPhatMoi; // Ghi đè, không nối thêm
        FDQuery_UpdateTienPhat.Params.ParamByName('ID').AsLargeInt := MuonTraID;
        FDQuery_UpdateTienPhat.ExecSQL;
        Inc(SoBanGhiCapNhat); // Tăng số bản ghi được cập nhật
      except
        on E: Exception do
        begin
          raise Exception.Create(Format('Lỗi cập nhật phạt cho ID %d: %s', [MuonTraID, E.Message]));
        end;
      end;

      FDQuery_TinhPhatCanXuLy.Next;
    end;

    // Commit transaction nếu không có lỗi
    FDConnectionAdmin.Commit;
    Result := SoBanGhiCapNhat; // Trả về số bản ghi đã cập nhật

  except
    on E: Exception do
    begin
      FDConnectionAdmin.Rollback;
      raise; // Ném lại exception để form xử lý
    end;
  end;
end;

end.
