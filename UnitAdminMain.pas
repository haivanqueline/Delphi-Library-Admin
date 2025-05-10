unit UnitAdminMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids ,System.DateUtils,
  Vcl.Mask;

type
  TfrmAdminMain = class(TForm)
    pnlAdminHeader: TPanel;
    lblAdminHoTen: TLabel;
    lblAdminVaiTro: TLabel;
    btnAdminThoat: TBitBtn;
    btnAdminDangXuat: TBitBtn;
    btnAdminDoiMatKhau: TBitBtn;
    pgcAdminMain: TPageControl;
    tsDuyetMuon: TTabSheet;
    tsXacNhanMuon: TTabSheet;
    tsDuyetTra: TTabSheet;
    tsQuanLyTaiLieu: TTabSheet;
    tsQuanLySinhVien: TTabSheet;
    tsQuanLyThuThu: TTabSheet;
    tsThongKe: TTabSheet;
    lstvDuyetMuon: TListView;
    pnlDuyetMuonActions: TPanel;
    btnDuyetMuon_DongY: TBitBtn;
    btnDuyetMuon_TuChoi: TBitBtn;
    pnlXacNhanActions: TPanel;
    btnXacNhan_DongY: TBitBtn;
    btnXacNhan_TuChoi: TBitBtn;
    lstvXacNhan: TListView;
    lstvDuyetTra: TListView;
    pnlDuyetTraActions: TPanel;
    lblDuyetTra_LyDo: TLabel;
    btnDuyetTra_DongY: TBitBtn;
    btnDuyetTra_TuChoi: TBitBtn;
    edtDuyetTra_LyDo: TEdit;
    pnlQLTL_Actions: TPanel;
    lblQLTL_TimKiem: TLabel;
    edtQLTL_TuKhoa: TEdit;
    btnQLTL_TimKiem: TBitBtn;
    btnQLTL_Them: TBitBtn;
    btnQLTL_Sua: TBitBtn;
    btnQLTL_Xoa: TBitBtn;
    dbgQLTL_DanhSach: TDBGrid;
    dbnQLTL: TDBNavigator;
    pnlQLTT_Actions: TPanel;
    btnQLTT_Them: TBitBtn;
    btnQLTT_Sua: TBitBtn;
    btnQLTT_PhanQuyen: TBitBtn;
    btnQLTT_VoHieuHoa: TBitBtn;
    btnQLTT_DoiMatKhau: TBitBtn;
    dbgQLTT_DanhSach: TDBGrid;
    dbnQLTT: TDBNavigator;
    pnlTK_ChonLoai: TPanel;
    Label1: TLabel;
    cboTK_LoaiThongKe: TComboBox;
    dtpTK_TuNgay: TDateTimePicker;
    dtpTK_DenNgay: TDateTimePicker;
    btnTK_Xem: TBitBtn;
    pnlTK_KetQua: TPanel;
    dbgThongKe: TDBGrid;
    lblDuyetTra_TinhTrang: TLabel;
    edtDuyetTra_TinhTrang: TEdit;
    pnlQLSV_BoLoc: TPanel;
    lblQLSV_NhanTinhTrang: TLabel;
    cboQLSV_TinhTrang: TComboBox;
    lblQLSV_TimSV: TLabel;
    edtQLSV_TuKhoaSV: TEdit;
    btnQLSV_LocTim: TBitBtn;
    lstvQLSV_KetQua: TListView;
    tsQuaHan: TTabSheet;
    lstvQuaHan: TListView;
    pnlQuaHan_Actions: TPanel;
    btnQuaHan_GuiThongBao: TBitBtn;
    btnQuaHan_XemChiTiet: TBitBtn;
    btnQuaHan_CapNhatPhat: TBitBtn;
    btnQuaHan_XacNhanTra: TBitBtn;
    Panel1: TPanel;
    edtQuaHan_TienPhatMoiNgay: TLabeledEdit;
    edtQuaHan_TienPhatMatSach: TLabeledEdit;
    tsLichSuHoatDong: TTabSheet;
    lstvLichSuHoatDong: TListView;
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnAdminDangXuatClick(Sender: TObject);
    procedure btnAdminThoatClick(Sender: TObject);
    procedure btnAdminDoiMatKhauClick(Sender: TObject);
    procedure btnDuyetMuon_DongYClick(Sender: TObject);
    procedure btnDuyetMuon_TuChoiClick(Sender: TObject);
    procedure btnXacNhan_DongYClick(Sender: TObject);
    procedure btnDuyetTra_DongYClick(Sender: TObject);
    procedure btnDuyetTra_TuChoiClick(Sender: TObject);
    procedure btnXacNhan_TuChoiClick(Sender: TObject);
    procedure btnQLTL_TimKiemClick(Sender: TObject);
    procedure pgcAdminMainChange(Sender: TObject);
    procedure btnQLTL_ThemClick(Sender: TObject);
    procedure btnQLTL_SuaClick(Sender: TObject);
    procedure btnQLTL_XoaClick(Sender: TObject);
    //procedure btnQLSV_TimKiemClick(Sender: TObject);
    procedure btnQLSV_SuaClick(Sender: TObject);
    procedure btnQLTT_ThemClick(Sender: TObject);
    procedure btnQLTT_SuaClick(Sender: TObject);
    procedure btnQLTT_DoiMatKhauClick(Sender: TObject);
    procedure btnQLTT_VoHieuHoaClick(Sender: TObject);
    procedure btnQLTT_PhanQuyenClick(Sender: TObject);
    procedure btnTK_XemClick(Sender: TObject);
    procedure btnQLSV_LocTimClick(Sender: TObject);
    procedure btnQuaHan_XemChiTietClick(Sender: TObject);
    procedure btnQuaHan_CapNhatPhatClick(Sender: TObject);
    procedure btnQuaHan_XacNhanTraClick(Sender: TObject);
    procedure btnQuaHan_GuiThongBaoClick(Sender: TObject);
  private
    { Private declarations }
    FAdmin_ThuThuID: Integer;
    FAdmin_HoTen: string;
    FAdmin_VaiTro: Integer;
    FAdmin_TenVaiTro: string;
    procedure HienThiYeuCauDuyetMuon;
    procedure HienThiYeuCauXacNhanMuon;
    procedure HienThiThongKeSinhVien;
    procedure HienThiYeuCauDuyetTra;
    procedure HienThiDuLieuQuaHan;
    procedure LoadDataForTab(TabIndex: Integer);
    procedure RefreshDBGrid(DBGrid: TDBGrid);
    procedure GhiLichSuHoatDong(const HanhDong, ChiTiet: string);
    procedure HienThiLichSuHoatDong;
  public
    { Public declarations }
    property Admin_ThuThuID: Integer read FAdmin_ThuThuID write FAdmin_ThuThuID;
    property Admin_HoTen: string read FAdmin_HoTen write FAdmin_HoTen;
    property Admin_VaiTro: Integer read FAdmin_VaiTro write FAdmin_VaiTro;
    property Admin_TenVaiTro: string read FAdmin_TenVaiTro write FAdmin_TenVaiTro;
  end;

var
  frmAdminMain: TfrmAdminMain;

implementation

{$R *.dfm}
Uses uAdminLogin, uAdminDoiMK, UnitAdminDM, uThemSuaTaiLieu, uThemSuaThuThu, uPhanQuyen, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Phys, uSessionManager, uPasswordUtils, System.NetEncoding;




procedure TfrmAdminMain.HienThiLichSuHoatDong;
var
  STT: Integer;
  ListItem: TListItem;
begin
  lstvLichSuHoatDong.Items.Clear;
  try
    if not DM_Admin.FDQuery_LichSuHoatDong.Active then
    begin
      DM_Admin.FDQuery_LichSuHoatDong.Open;
    end;

    if DM_Admin.FDQuery_LichSuHoatDong.Active then
    begin
      DM_Admin.FDQuery_LichSuHoatDong.First;
      STT := 1;
      while not DM_Admin.FDQuery_LichSuHoatDong.EOF do
      begin
        ListItem := lstvLichSuHoatDong.Items.Add;
        ListItem.Caption := IntToStr(STT);
        ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss', DM_Admin.FDQuery_LichSuHoatDong.FieldByName('ThoiGian').AsDateTime));
        ListItem.SubItems.Add(DM_Admin.FDQuery_LichSuHoatDong.FieldByName('MaThuThu').AsWideString);
        ListItem.SubItems.Add(DM_Admin.FDQuery_LichSuHoatDong.FieldByName('TenThuThu').AsWideString);
        ListItem.SubItems.Add(DM_Admin.FDQuery_LichSuHoatDong.FieldByName('HanhDong').AsWideString);
        ListItem.SubItems.Add(DM_Admin.FDQuery_LichSuHoatDong.FieldByName('ChiTiet').AsWideString);
        Inc(STT);
        DM_Admin.FDQuery_LichSuHoatDong.Next;
      end;
    end
    else
    begin
      ShowMessage('Không thể tải dữ liệu lịch sử hoạt động.');
    end;
  except
    on E: Exception do
      ShowMessage('Lỗi khi hiển thị lịch sử hoạt động: ' + E.Message);
  end;
end;



procedure TfrmAdminMain.GhiLichSuHoatDong(const HanhDong, ChiTiet: string);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Try
    Query.SQL.Text := 'INSERT INTO LichSuHoatDong (ThuThuID, ThoiGian, HanhDong, ChiTiet) ' +
                      'VALUES (:ThuThuID, GETDATE(), :HanhDong, :ChiTiet)';

    if Query.Params.FindParam('ThuThuID') = nil then
      Query.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if Query.Params.FindParam('HanhDong') = nil then
        Query.Params.CreateParam(ftWideString, 'HanhDong', ptInput);
    if Query.Params.FindParam('ChiTiet') = nil then
        Query.Params.CreateParam(ftWideString, 'ChiTiet', ptInput);

    Query.ParamByName('ThuThuID').AsInteger := SessionManager.ThuThuID;
    Query.ParamByName('HanhDong').AsWideString := HanhDong;
    Query.ParamByName('ChiTiet').AsWideString := ChiTiet;

    Query.ExecSQL;
      except
        on E: Exception do
      ShowMessage('Lỗi khi ghi lịch sử hoạt động: ' + E.Message);
    End;

  finally
    Query.Free;
  end;
end;

procedure TfrmAdminMain.HienThiDuLieuQuaHan;
var
  STT: Integer;
  ListItem: TListItem;
  MuonTraID: Int64;
begin
  lstvQuaHan.Items.Clear; // Dùng đúng tên ListView của bạn
  if DM_Admin.FDQuery_QuaHan.Active then
  begin
    DM_Admin.FDQuery_QuaHan.First;
    STT := 1;
    while not DM_Admin.FDQuery_QuaHan.EOF do
    begin
      MuonTraID := DM_Admin.FDQuery_QuaHan.FieldByName('ID').AsLargeInt;
      ListItem := lstvQuaHan.Items.Add;
      ListItem.Data := Pointer(MuonTraID);
      ListItem.Caption := IntToStr(STT);
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('MaYeuCau').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('MSSV').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('TenSinhVien').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('MaTaiLieu').AsString); // Đảm bảo View có
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('TenTaiLieu').AsString);
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_QuaHan.FieldByName('NgayHenTra').AsDateTime));
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('SoNgayTre').AsString);
      ListItem.SubItems.Add(FormatFloat('#,##0', DM_Admin.FDQuery_QuaHan.FieldByName('TienPhat').AsFloat));
      ListItem.SubItems.Add(DM_Admin.FDQuery_QuaHan.FieldByName('TenTrangThai').AsString);
      Inc(STT);
      DM_Admin.FDQuery_QuaHan.Next;
    end;
  end;
end;


procedure TfrmAdminMain.HienThiThongKeSinhVien;
var
  STT: Integer;
  ListItem: TListItem;
begin
  lstvQLSV_KetQua.Items.Clear;
  if DM_Admin.FDQuery_ThongKeSV.Active then
  begin
    DM_Admin.FDQuery_ThongKeSV.First;
    STT := 1;
    while not DM_Admin.FDQuery_ThongKeSV.EOF do
    begin
      ListItem := lstvQLSV_KetQua.Items.Add;
      ListItem.Caption := IntToStr(STT);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('MSSV').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('HoLot').AsString + ' ' + DM_Admin.FDQuery_ThongKeSV.FieldByName('Ten').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('SoLuongDangMuon').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('SoLuongQuaHan').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('SoLuongChoDuyetMuon').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_ThongKeSV.FieldByName('SoLuongChoDuyetTra').AsString);
      ListItem.SubItems.Add(FormatFloat('#,##0', DM_Admin.FDQuery_ThongKeSV.FieldByName('TongTienPhatChuaThanhToan').AsFloat));
      Inc(STT);
      DM_Admin.FDQuery_ThongKeSV.Next;
    end;
  end;
end;

procedure TfrmAdminMain.RefreshDBGrid(DBGrid: TDBGrid);
var
  Bookmark: TBookmark;
  DataSet: TDataSet;
begin
  if (DBGrid = nil) or (DBGrid.DataSource = nil) or (DBGrid.DataSource.DataSet = nil) then
    Exit;

  DataSet := DBGrid.DataSource.DataSet;
  if not DataSet.Active then
  begin
    DataSet.Open;
    Exit;
  end;

  // Lưu vị trí bookmark an toàn
  Bookmark := nil;
  try
    if DataSet.BookmarkValid(DataSet.GetBookmark) then
      Bookmark := DataSet.GetBookmark;

    DataSet.Close;
    DataSet.Open;

    // Khôi phục vị trí bookmark nếu hợp lệ
    if (Bookmark <> nil) and DataSet.BookmarkValid(Bookmark) then
      DataSet.GotoBookmark(Bookmark);
  finally
    // Giải phóng bookmark nếu đã tạo
    if Bookmark <> nil then
      DataSet.FreeBookmark(Bookmark);
  end;
end;



procedure TfrmAdminMain.HienThiYeuCauDuyetMuon;
var
  ListItem: TListItem;
  STT: Integer;
  MuonTraID: Int64;
begin
  lstvDuyetMuon.Items.Clear;
  if DM_Admin.FDQuery_DuyetMuon.Active then
  begin
    DM_Admin.FDQuery_DuyetMuon.First;
    STT := 1;
    while not DM_Admin.FDQuery_DuyetMuon.EOF do
    begin
      MuonTraID := DM_Admin.FDQuery_DuyetMuon.FieldByName('ID').AsLargeInt;
      ListItem := lstvDuyetMuon.Items.Add;
      ListItem.Data := Pointer(MuonTraID);
      ListItem.Caption := IntToStr(STT);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetMuon.FieldByName('MaYeuCau').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetMuon.FieldByName('MSSV').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetMuon.FieldByName('TenSinhVien').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetMuon.FieldByName('MaTaiLieu').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetMuon.FieldByName('TenTaiLieu').AsString);
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn', DM_Admin.FDQuery_DuyetMuon.FieldByName('NgayYeuCau').AsDateTime));
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_DuyetMuon.FieldByName('NgayHenMuon').AsDateTime));
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_DuyetMuon.FieldByName('NgayHenTra').AsDateTime));
      // Cột ẩn ID YC Mượn (đã lưu vào Data)
      //ListItem.SubItems.Add(IntToStr(MuonTraID));
      Inc(STT);
      DM_Admin.FDQuery_DuyetMuon.Next;
    end;
  end;
end;

procedure TfrmAdminMain.HienThiYeuCauXacNhanMuon;
var
  ListItem: TListItem;
  STT: Integer;
  MuonTraID: Int64;
begin
  lstvXacNhan.Items.Clear;
  if DM_Admin.FDQuery_XacNhanMuon.Active then
  begin
    DM_Admin.FDQuery_XacNhanMuon.First;
    STT := 1;
    while not DM_Admin.FDQuery_XacNhanMuon.EOF do
    begin
      MuonTraID := DM_Admin.FDQuery_XacNhanMuon.FieldByName('ID').AsLargeInt;
      ListItem := lstvXacNhan.Items.Add;
      ListItem.Data := Pointer(MuonTraID);
      ListItem.Caption := IntToStr(STT);
      ListItem.SubItems.Add(DM_Admin.FDQuery_XacNhanMuon.FieldByName('MaYeuCau').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_XacNhanMuon.FieldByName('MSSV').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_XacNhanMuon.FieldByName('TenSinhVien').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_XacNhanMuon.FieldByName('MaTaiLieu').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_XacNhanMuon.FieldByName('TenTaiLieu').AsString);
      if not DM_Admin.FDQuery_XacNhanMuon.FieldByName('NgayDuyet').IsNull then
         ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn', DM_Admin.FDQuery_XacNhanMuon.FieldByName('NgayDuyet').AsDateTime))
      else ListItem.SubItems.Add('');
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_XacNhanMuon.FieldByName('NgayHenMuon').AsDateTime));
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_XacNhanMuon.FieldByName('NgayHenTra').AsDateTime));
      Inc(STT);
      DM_Admin.FDQuery_XacNhanMuon.Next;
    end;
  end;
end;

procedure TfrmAdminMain.HienThiYeuCauDuyetTra;
var
  ListItem: TListItem;
  STT: Integer;
  MuonTraID: Int64;
begin
  lstvDuyetTra.Items.Clear;
  if DM_Admin.FDQuery_DuyetTra.Active then
  begin
    DM_Admin.FDQuery_DuyetTra.First;
    STT := 1;
    while not DM_Admin.FDQuery_DuyetTra.EOF do
    begin
      MuonTraID := DM_Admin.FDQuery_DuyetTra.FieldByName('ID').AsLargeInt;
      ListItem := lstvDuyetTra.Items.Add;
      ListItem.Data := Pointer(MuonTraID);
      ListItem.Caption := IntToStr(STT);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetTra.FieldByName('MaYeuCau').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetTra.FieldByName('MSSV').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetTra.FieldByName('TenSinhVien').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetTra.FieldByName('MaTaiLieu').AsString);
      ListItem.SubItems.Add(DM_Admin.FDQuery_DuyetTra.FieldByName('TenTaiLieu').AsString);
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn', DM_Admin.FDQuery_DuyetTra.FieldByName('NgayYeuCau').AsDateTime)); // Ngày YC Trả
      ListItem.SubItems.Add(FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_DuyetTra.FieldByName('NgayHenTra').AsDateTime)); // Ngày hẹn trả gốc
      Inc(STT);
      DM_Admin.FDQuery_DuyetTra.Next;
    end;
  end;
end;

procedure TfrmAdminMain.LoadDataForTab(TabIndex: Integer);
begin
  // Đóng các Query khác để tránh lỗi truy cập field không tồn tại
  DM_Admin.FDQuery_DuyetMuon.Close;
  DM_Admin.FDQuery_XacNhanMuon.Close;
  DM_Admin.FDQuery_DuyetTra.Close;
  DM_Admin.FDQuery_QLTL.Close;
  DM_Admin.FDQuery_ThongKeSV.Close;
  DM_Admin.FDQuery_QLTT.Close;
  DM_Admin.FDQuery_ThongKeTLMuonNhieu.Close; // Đóng cả query thống kê
  DM_Admin.FDQuery_QuaHan.Close;
  DM_Admin.FDQuery_LichSuHoatDong.Close;

  case TabIndex of
    0: // Duyệt Yêu Cầu Mượn
      begin
        DM_Admin.FDQuery_DuyetMuon.Open;
        HienThiYeuCauDuyetMuon;
      end;
    1: // Xác Nhận Đã Mượn
      begin
        DM_Admin.FDQuery_XacNhanMuon.Open;
        HienThiYeuCauXacNhanMuon;
      end;
    2: // Duyệt Yêu Cầu Trả
      begin
        DM_Admin.FDQuery_DuyetTra.Open;
        HienThiYeuCauDuyetTra;
      end;
    3: // Quá hạn
      begin
        DM_Admin.FDQuery_QuaHan.Open;
        HienThiDuLieuQuaHan;
      end;
    4: // Quản Lý Tài Liệu
      begin
        DM_Admin.FDQuery_QLTL.Open;
        // DBGrid tự hiển thị
      end;
    5: // Quản Lý Sinh Viên
      begin
        lstvQLSV_KetQua.Items.Clear; // Xóa kết quả cũ
        cboQLSV_TinhTrang.ItemIndex := 0; // Reset bộ lọc
        edtQLSV_TuKhoaSV.Text := ''; // Reset ô tìm kiếm
      end;
    6: // Quản Lý Thủ Thư
      begin
        if Admin_VaiTro = 1 then
           DM_Admin.FDQuery_QLTT.Open;
      end;
    7: // Thống Kê
      begin
        dbgThongKe.DataSource := nil; // Ngắt kết nối DBGrid thống kê
      end;
      8: // LSHD
      begin
        if DM_Admin.FDQuery_LichSuHoatDong.Params.FindParam('VaiTro') = nil then
          DM_Admin.FDQuery_LichSuHoatDong.Params.CreateParam(ftInteger, 'VaiTro', ptInput);
        if DM_Admin.FDQuery_LichSuHoatDong.Params.FindParam('ThuThuID') = nil then
          DM_Admin.FDQuery_LichSuHoatDong.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);

        DM_Admin.FDQuery_LichSuHoatDong.ParamByName('VaiTro').AsInteger := Admin_VaiTro;
        DM_Admin.FDQuery_LichSuHoatDong.ParamByName('ThuThuID').AsInteger := SessionManager.ThuThuID;

        DM_Admin.FDQuery_LichSuHoatDong.Open;
        HienThiLichSuHoatDong;
      end;
  end;
end;

procedure TfrmAdminMain.PageControl1Change(Sender: TObject);
begin
  LoadDataForTab(pgcAdminMain.ActivePageIndex); // Gọi hàm helper
end;

procedure TfrmAdminMain.pgcAdminMainChange(Sender: TObject);
begin
   LoadDataForTab(pgcAdminMain.ActivePageIndex);
end;

procedure TfrmAdminMain.btnAdminDangXuatClick(Sender: TObject);
begin
if MessageDlg('Bạn có chắc chắn muốn đăng xuất?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    SessionManager.LoadSession(-1);
    Self.Hide;
    if not Assigned(frmAdminLogin) then
      Application.CreateForm(TfrmAdminLogin, frmAdminLogin);
    frmAdminLogin.edtTenDangNhap.Clear; // Xóa thông tin đăng nhập cũ
    frmAdminLogin.edtMatKhauAdmin.Clear;
    frmAdminLogin.Show;
  end;
end;

procedure TfrmAdminMain.btnAdminDoiMatKhauClick(Sender: TObject);
var
  frmDoiMKAdmin: TfrmAdminDoiMK;
begin
  frmDoiMKAdmin := TfrmAdminDoiMK.Create(Self);
  try
    frmDoiMKAdmin.CurrentUserID := Admin_ThuThuID; // Truyền ID thủ thư hiện tại
    frmDoiMKAdmin.ShowModal;
  finally
    frmDoiMKAdmin.Free;
  end;
end;

procedure TfrmAdminMain.btnAdminThoatClick(Sender: TObject);
begin
  if MessageDlg('Bạn có chắc chắn muốn thoát ứng dụng?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
   Application.Terminate;
  End;

end;

procedure TfrmAdminMain.btnDuyetMuon_DongYClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_MUON') then
  begin
    ShowMessage('Bạn không có quyền duyệt yêu cầu mượn.');
    Exit;
  end;
  if lstvDuyetMuon.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để duyệt.');
    Exit;
  end;

  if MessageDlg('Duyệt đồng ý ' + IntToStr(lstvDuyetMuon.SelCount) + ' yêu cầu đã chọn?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số tồn tại trước vòng lặp
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('TrangThaiMoi') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftInteger, 'TrangThaiMoi', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('ThuThuID') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('ID') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftLargeint, 'ID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('LyDoTuChoi') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftString, 'LyDoTuChoi', ptInput);


    for i := 0 to lstvDuyetMuon.Items.Count - 1 do
    begin
      SelectedItem := lstvDuyetMuon.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('TrangThaiMoi').AsInteger := 2; // 2: Đã duyệt mượn
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('LyDoTuChoi').Clear;
          DM_Admin.FDQuery_UpdateDuyetMuon.ExecSQL;
          // Ghi lịch sử hoạt động
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID);
          GhiLichSuHoatDong('Duyệt mượn', ChiTiet);
          Inc(SuccessCount);
        except
          on E: Exception do
          begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi duyệt mượn, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Duyệt mượn', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã duyệt thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
    end else begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Có lỗi xảy ra khi duyệt:' + #13 + ErrorMsg);
    end;

    // Tải lại danh sách
    DM_Admin.FDQuery_DuyetMuon.Close;
    DM_Admin.FDQuery_DuyetMuon.Open;
    HienThiYeuCauDuyetMuon;
  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi duyệt mượn: ' + E.Message;
      GhiLichSuHoatDong('Duyệt mượn', ChiTiet);
      ShowMessage('Lỗi Transaction khi duyệt: ' + E.Message);
    end;
  end;
end;



procedure TfrmAdminMain.btnDuyetMuon_TuChoiClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  LyDo: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_MUON') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvDuyetMuon.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để từ chối.');
    Exit;
  end;

  LyDo := '';
  if not InputQuery('Từ chối yêu cầu mượn', 'Vui lòng nhập lý do từ chối:', LyDo) then
    Exit; // Người dùng nhấn Cancel, thoát

  LyDo := Trim(LyDo);
  if LyDo = '' then
  begin
    ShowMessage('Lý do từ chối không được để trống.');
    Exit;
  end;

  if MessageDlg('Từ chối ' + IntToStr(lstvDuyetMuon.SelCount) + ' yêu cầu đã chọn với lý do: "' + LyDo + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số tồn tại trước vòng lặp (tương tự như Đồng ý)
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('TrangThaiMoi') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftInteger, 'TrangThaiMoi', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('ThuThuID') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('ID') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftLargeint, 'ID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetMuon.Params.FindParam('LyDoTuChoi') = nil then
      DM_Admin.FDQuery_UpdateDuyetMuon.Params.CreateParam(ftString, 'LyDoTuChoi', ptInput);


    for i := 0 to lstvDuyetMuon.Items.Count - 1 do
    begin
      SelectedItem := lstvDuyetMuon.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('TrangThaiMoi').AsInteger := 3; // 3: Đã từ chối mượn
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_UpdateDuyetMuon.Params.ParamByName('LyDoTuChoi').AsString := LyDo;
          DM_Admin.FDQuery_UpdateDuyetMuon.ExecSQL;
          // Ghi lịch sử hoạt động
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID) + ', Lý do: ' + LyDo;
          GhiLichSuHoatDong('Từ chối mượn', ChiTiet);
          Inc(SuccessCount);
        except
          on E: Exception do
          begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi duyệt mượn, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Duyệt mượn', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã từ chối thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi từ chối:' + #13 + ErrorMsg);
    end;
    DM_Admin.FDQuery_DuyetMuon.Close;
    DM_Admin.FDQuery_DuyetMuon.Open;
    HienThiYeuCauDuyetMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi từ chối mượn: ' + E.Message;
      GhiLichSuHoatDong('Từ chối mượn', ChiTiet);
      ShowMessage('Lỗi Transaction khi từ chối: ' + E.Message);
    end;
  end;
end;


procedure TfrmAdminMain.btnDuyetTra_DongYClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  TinhTrang: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvDuyetTra.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để duyệt trả.');
    Exit;
  end;

  TinhTrang := trim(edtDuyetTra_TinhTrang.Text);
  if TinhTrang = '' then
  begin
     // Có thể hiện Edit nếu đang ẩn
     ShowMessage('Vui lòng nhập tình trạng sách.');
     edtDuyetTra_TinhTrang.SetFocus;
     Exit;
  end;

  if MessageDlg('Duyệt đồng ý trả ' + IntToStr(lstvDuyetTra.SelCount) + ' yêu cầu đã chọn?' + #13 +
                 'Tình trạng sách ghi nhận: "' + TinhTrang + '"', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('TrangThaiMoi') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftInteger, 'TrangThaiMoi', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('ThuThuID') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('TinhTrangSach') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftString, 'TinhTrangSach', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('ID') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftLargeint, 'ID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('LyDoTuChoi') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftString, 'LyDoTuChoi', ptInput);


    for i := 0 to lstvDuyetTra.Items.Count - 1 do
    begin
      SelectedItem := lstvDuyetTra.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('TrangThaiMoi').AsInteger := 6; // 6: Đã trả tài liệu
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('TinhTrangSach').AsString := TinhTrang;
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('LyDoTuChoi').Clear; // Xóa lý do nếu duyệt
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID) + ', Tình trạng sách: ' + TinhTrang;
          GhiLichSuHoatDong('Duyệt trả', ChiTiet);
          DM_Admin.FDQuery_UpdateDuyetTra.ExecSQL;
          Inc(SuccessCount);
        except
          on E: Exception do
            begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi duyệt trả, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Duyệt trả', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã duyệt trả thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
      edtDuyetTra_TinhTrang.text := ''; // Xóa tình trạng sách
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi duyệt trả:' + #13 + ErrorMsg);
    end;
    DM_Admin.FDQuery_DuyetTra.Close;
    DM_Admin.FDQuery_DuyetTra.Open;
    HienThiYeuCauDuyetTra;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi duyệt trả: ' + E.Message;
      GhiLichSuHoatDong('Duyệt trả', ChiTiet);
      ShowMessage('Lỗi Transaction khi duyệt trả: ' + E.Message);
    end;
  end;
end;


procedure TfrmAdminMain.btnDuyetTra_TuChoiClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  LyDo: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền duyệt yêu cầu trả.');
    Exit;
  end;
  if lstvDuyetTra.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để từ chối trả.');
    Exit;
  end;

  LyDo := trim(edtDuyetTra_LyDo.Text);
  if LyDo = '' then
  begin
    ShowMessage('Vui lòng nhập lý do từ chối trả.');
    edtDuyetTra_LyDo.SetFocus;
    Exit;
  end;

  if MessageDlg('Từ chối trả ' + IntToStr(lstvDuyetTra.SelCount) + ' yêu cầu đã chọn với lý do: "' + LyDo + '"?' + #13 +
                 '(Tài liệu sẽ quay lại trạng thái "Đang Mượn")', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số tồn tại trước vòng lặp (tương tự như Đồng ý trả)
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('TrangThaiMoi') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftInteger, 'TrangThaiMoi', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('ThuThuID') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('TinhTrangSach') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftString, 'TinhTrangSach', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('ID') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftLargeint, 'ID', ptInput);
    if DM_Admin.FDQuery_UpdateDuyetTra.Params.FindParam('LyDoTuChoi') = nil then
       DM_Admin.FDQuery_UpdateDuyetTra.Params.CreateParam(ftString, 'LyDoTuChoi', ptInput);


    for i := 0 to lstvDuyetTra.Items.Count - 1 do
    begin
      SelectedItem := lstvDuyetTra.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('TrangThaiMoi').AsInteger := 4; // Quay lại trạng thái 4: Đã mượn
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('LyDoTuChoi').AsString := LyDo; // Gán lý do từ chối
          DM_Admin.FDQuery_UpdateDuyetTra.Params.ParamByName('TinhTrangSach').Clear; // Xóa tình trạng sách
          // Ghi lịch sử hoạt động
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID) + ', Lý do: ' + LyDo;
          GhiLichSuHoatDong('Từ chối trả', ChiTiet);
          DM_Admin.FDQuery_UpdateDuyetTra.ExecSQL;
          Inc(SuccessCount);
        except
          on E: Exception do
            begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi từ chối trả, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Từ chối trả', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã từ chối trả thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
      edtDuyetTra_LyDo.Text := '';
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi từ chối trả:' + #13 + ErrorMsg);
    end;

    DM_Admin.FDQuery_DuyetTra.Close;
    DM_Admin.FDQuery_DuyetTra.Open;
    HienThiYeuCauDuyetTra;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi từ chối trả: ' + E.Message;
      GhiLichSuHoatDong('Từ chối trả', ChiTiet);
      ShowMessage('Lỗi Transaction khi từ chối trả: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminMain.btnQLSV_LocTimClick(Sender: TObject);
var
  SQL, WhereClause, OrderByClause: string;
  SelectedTinhTrangIndex: Integer;
  TuKhoaSV: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('QL_SINHVIEN') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  // Lấy các giá trị lọc
  SelectedTinhTrangIndex := cboQLSV_TinhTrang.ItemIndex;
  TuKhoaSV := Trim(edtQLSV_TuKhoaSV.Text);

  // Xây dựng phần WITH và SELECT chính
  SQL := 'WITH SinhVienMuonTra AS (SELECT MSSV, TrangThai, TienPhat FROM v_ChiTietMuonTraTaiLieu) ' +
         'SELECT sv.MSSV, sv.HoLot, sv.Ten, ' +
         'ISNULL(DangMuon.SoLuong, 0) AS SoLuongDangMuon, ' +
         'ISNULL(QuaHan.SoLuong, 0) AS SoLuongQuaHan, ' +
         'ISNULL(ChoDuyetMuon.SoLuong, 0) AS SoLuongChoDuyetMuon, ' +
         'ISNULL(ChoDuyetTra.SoLuong, 0) AS SoLuongChoDuyetTra, ' +
         'ISNULL(TongPhat.TongTien, 0) AS TongTienPhatChuaThanhToan ' +
         'FROM SinhVien sv ' +
         'LEFT JOIN (SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE TrangThai = 4 GROUP BY MSSV) DangMuon ON sv.MSSV = DangMuon.MSSV ' +
         'LEFT JOIN (SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE TrangThai = 8 GROUP BY MSSV) QuaHan ON sv.MSSV = QuaHan.MSSV ' +
         'LEFT JOIN (SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE TrangThai = 1 GROUP BY MSSV) ChoDuyetMuon ON sv.MSSV = ChoDuyetMuon.MSSV ' +
         'LEFT JOIN (SELECT MSSV, COUNT(*) AS SoLuong FROM SinhVienMuonTra WHERE TrangThai = 7 GROUP BY MSSV) ChoDuyetTra ON sv.MSSV = ChoDuyetTra.MSSV ' +
         'LEFT JOIN (SELECT MSSV, SUM(ISNULL(TienPhat, 0)) AS TongTien FROM SinhVienMuonTra WHERE TrangThai = 8 AND ISNULL(TienPhat,0) > 0 GROUP BY MSSV) TongPhat ON sv.MSSV = TongPhat.MSSV ';

  // Xây dựng mệnh đề WHERE
  WhereClause := 'WHERE (DangMuon.SoLuong > 0 OR QuaHan.SoLuong > 0 OR ChoDuyetMuon.SoLuong > 0 OR ChoDuyetTra.SoLuong > 0) '; // Điều kiện cơ bản

  // Thêm điều kiện lọc theo tình trạng
  case SelectedTinhTrangIndex of
    1: WhereClause := WhereClause + 'AND DangMuon.SoLuong > 0 ';      // Đang mượn
    2: WhereClause := WhereClause + 'AND QuaHan.SoLuong > 0 ';         // Quá hạn
    3: WhereClause := WhereClause + 'AND ChoDuyetMuon.SoLuong > 0 '; // Chờ duyệt mượn
    4: WhereClause := WhereClause + 'AND ChoDuyetTra.SoLuong > 0 ';    // Chờ duyệt trả
    // Index 0 là "Tất cả", không cần thêm điều kiện
  end;

  // Thêm điều kiện tìm kiếm sinh viên
  if TuKhoaSV <> '' then
  begin
    WhereClause := WhereClause + 'AND (sv.MSSV LIKE :TuKhoa OR sv.HoLot LIKE :TuKhoa OR sv.Ten LIKE :TuKhoa) ';
  end;

  // Xây dựng mệnh đề ORDER BY
  OrderByClause := ' ORDER BY sv.Ten, sv.HoLot';

  // Ghép các phần lại
  SQL := SQL + WhereClause + OrderByClause;

  // Thực thi Query
  DM_Admin.FDQuery_ThongKeSV.Close;
  DM_Admin.FDQuery_ThongKeSV.SQL.Text := SQL;
  DM_Admin.FDQuery_ThongKeSV.Params.Clear;
  if TuKhoaSV <> '' then
  begin
    DM_Admin.FDQuery_ThongKeSV.Params.CreateParam(ftString, 'TuKhoa', ptInput).AsString := '%' + TuKhoaSV + '%';
  end;
  DM_Admin.FDQuery_ThongKeSV.FetchOptions.Cache := [];
  DM_Admin.FDQuery_ThongKeSV.Open;

  // Hiển thị kết quả
  HienThiThongKeSinhVien;
end;

procedure TfrmAdminMain.btnQLSV_SuaClick(Sender: TObject);
begin
  ShowMessage('Chức năng sửa thông tin sinh viên chưa được cài đặt.');
  // Mở form sửa sinh viên (nếu có và được phép)
end;

////procedure TfrmAdminMain.btnQLSV_TimKiemClick(Sender: TObject);
//var
//  TuKhoa: string;
//  SQL: string;
//begin
//  TuKhoa := Trim(edtQLSV_TuKhoa.Text);
//  SQL := 'SELECT MSSV, HoLot, Ten, NgaySinh, TrangThai, TenTrangThai FROM SinhVien';
//  if TuKhoa <> '' then
//  begin
//    SQL := SQL + ' WHERE MSSV LIKE :TuKhoa OR HoLot LIKE :TuKhoa OR Ten LIKE :TuKhoa';
//  end;
//  SQL := SQL + ' ORDER BY Ten, HoLot';
//
//  DM_Admin.FDQuery_QLSV.Close;
//  DM_Admin.FDQuery_QLSV.SQL.Text := SQL;
//  DM_Admin.FDQuery_QLSV.Params.Clear;
//  if TuKhoa <> '' then
//  begin
//    if DM_Admin.FDQuery_QLSV.Params.FindParam('TuKhoa') = nil then
//      DM_Admin.FDQuery_QLSV.Params.CreateParam(ftString, 'TuKhoa', ptInput);
//    DM_Admin.FDQuery_QLSV.ParamByName('TuKhoa').AsString := '%' + TuKhoa + '%';
//  end;
//  DM_Admin.FDQuery_QLSV.Open;
//end;


procedure TfrmAdminMain.btnQLTL_SuaClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaTaiLieu;
  SelectedID: Int64;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('QLSACH_SUA') then
  begin
    ShowMessage('Bạn không có quyền sửa tài liệu.');
    Exit;
  end;

  if DM_Admin.DataSource_QLTL.DataSet.IsEmpty then
  begin
    ShowMessage('Vui lòng chọn tài liệu cần sửa.');
    Exit;
  end;

  SelectedID := DM_Admin.DataSource_QLTL.DataSet.FieldByName('ID').AsLargeInt;

  frmThemSua := TfrmThemSuaTaiLieu.Create(Self);
  try
    frmThemSua.TaiLieuIDCanSua := SelectedID;
    frmThemSua.CheDo := 'Sua';
    if frmThemSua.ShowModal = mrOk then
    begin
      ChiTiet := 'Sửa tài liệu ID=' + IntToStr(SelectedID) + ': ' + frmThemSua.edtTenTL.Text + ' (Mã: ' + frmThemSua.edtMaTL.Text + ')';
      GhiLichSuHoatDong('Sửa tài liệu', ChiTiet);
      ShowMessage('Cập nhật tài liệu thành công.');
      RefreshDBGrid(dbgQLTL_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;

procedure TfrmAdminMain.btnQLTL_ThemClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaTaiLieu;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('QLSACH_THEM') then
  begin
    ShowMessage('Bạn không có quyền thêm tài liệu.');
    Exit;
  end;

  frmThemSua := TfrmThemSuaTaiLieu.Create(Self);
  try
    frmThemSua.CheDo := 'Them';
    if frmThemSua.ShowModal = mrOk then
    begin
      ChiTiet := 'Thêm tài liệu: ' + frmThemSua.edtTenTL.Text + ' (Mã: ' + frmThemSua.edtMaTL.Text + ')';
      GhiLichSuHoatDong('Thêm tài liệu', ChiTiet);
      RefreshDBGrid(dbgQLTL_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;

procedure TfrmAdminMain.btnQLTL_TimKiemClick(Sender: TObject);
var
  TuKhoa: string;
  SQL: string;
begin
  TuKhoa := Trim(edtQLTL_TuKhoa.Text);
  SQL := 'SELECT * FROM TaiLieuTongHop';
  if TuKhoa <> '' then
  begin
    SQL := SQL + ' WHERE MaTaiLieu LIKE :TuKhoa OR TenTaiLieu LIKE :TuKhoa OR TenTacGia LIKE :TuKhoa OR NhaXB LIKE :TuKhoa OR MoTa LIKE :TuKhoa';
  end;
  SQL := SQL + ' ORDER BY TenTaiLieu'; // Sắp xếp theo tên

  DM_Admin.FDQuery_QLTL.Close;
  DM_Admin.FDQuery_QLTL.SQL.Text := SQL;
  DM_Admin.FDQuery_QLTL.Params.Clear;
  if TuKhoa <> '' then
  begin
    DM_Admin.FDQuery_QLTL.Params.CreateParam(ftString, 'TuKhoa', ptInput);
    DM_Admin.FDQuery_QLTL.ParamByName('TuKhoa').AsString := '%' + TuKhoa + '%';
  end;
  DM_Admin.FDQuery_QLTL.Open;
end;

procedure TfrmAdminMain.btnQLTL_XoaClick(Sender: TObject);
var
  SelectedID: Int64;
  Query: TFDQuery;
  TenTL: string;
  Count: Integer;
  ChiTiet: string;
begin

  if not SessionManager.HasPermission('QLSACH_SUA') then
  begin
    ShowMessage('Bạn không có quyền xoá tài liệu.');
    Exit;
  end;
  if DM_Admin.DataSource_QLTL.DataSet.IsEmpty then
  begin
    ShowMessage('Vui lòng chọn tài liệu cần xóa.');
    Exit;
  end;

  SelectedID := DM_Admin.DataSource_QLTL.DataSet.FieldByName('ID').AsLargeInt;
  TenTL := DM_Admin.DataSource_QLTL.DataSet.FieldByName('TenTaiLieu').AsString;

  if MessageDlg('Bạn có chắc chắn muốn xóa tài liệu:' + #13 + TenTL + ' (ID=' + IntToStr(SelectedID) + ')?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := DM_Admin.FDConnectionAdmin;
      try
      // Kiểm tra ràng buộc
      Query.SQL.Text := 'SELECT COUNT(*) FROM MuonTraTaiLieu WHERE TaiLieuID = :ID AND TrangThai NOT IN (3, 5, 6)';
      if Query.Params.FindParam('ID') = nil then
        Query.Params.CreateParam(ftLargeint, 'ID', ptInput);
      Query.ParamByName('ID').AsLargeInt := SelectedID;
      Query.Open;
      Count := Query.Fields[0].AsInteger;
      Query.Close;

      if Count > 0 then
      begin
        ShowMessage('Không thể xóa tài liệu này vì đang có yêu cầu mượn/trả hoặc đang được mượn.');
        ChiTiet := 'Không thể xóa tài liệu ID=' + IntToStr(SelectedID) + ' do đang có yêu cầu mượn/trả';
        GhiLichSuHoatDong('Xóa tài liệu', ChiTiet);
        Exit;
      end;

      // Xóa
      Query.SQL.Text := 'DELETE FROM TaiLieuTongHop WHERE ID = :ID';
      Query.ExecSQL;
      ChiTiet := 'Xóa tài liệu: ' + TenTL + ' (ID=' + IntToStr(SelectedID) + ')';
      GhiLichSuHoatDong('Xóa tài liệu', ChiTiet);
      ShowMessage('Xóa tài liệu thành công.');
      RefreshDBGrid(dbgQLTL_DanhSach);
    except
      on E: Exception do
        begin
          ChiTiet := 'Lỗi khi xóa tài liệu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
          GhiLichSuHoatDong('Xóa tài liệu', ChiTiet);
          ShowMessage('Lỗi khi xóa tài liệu: ' + E.Message);
        end;
    end;
    finally
      Query.Free;
    end;
  end;
end;


procedure TfrmAdminMain.btnQLTT_DoiMatKhauClick(Sender: TObject);
var
  SelectedID: Integer;
  MatKhauMacDinh: string;
  PasswordHashed: string;
  Salt: TBytes;
  Query: TFDQuery;
  TenTT: string;
  ChiTiet: string;
begin
  // Bước 1: Kiểm tra quyền truy cập (chỉ Admin được phép)
  if Admin_VaiTro <> 1 then
  begin
    ShowMessage('Chỉ Admin mới có quyền đặt lại mật khẩu thủ thư.');
    Exit;
  end;

  // Bước 2: Kiểm tra xem có thủ thư nào được chọn không
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then
  begin
    ShowMessage('Vui lòng chọn một thủ thư để đặt lại mật khẩu.');
    Exit;
  end;

  // Bước 3: Lấy ID và tên thủ thư được chọn
  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;
  TenTT := DM_Admin.DataSource_QLTT.DataSet.FieldByName('HoTen').AsString;

  // Bước 4: Xác nhận hành động
  if MessageDlg('Bạn có chắc chắn muốn đặt lại mật khẩu của thủ thư: ' + TenTT + ' (ID=' + IntToStr(SelectedID) + ') thành "TNU@567"?',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  // Bước 5: Đặt mật khẩu mặc định và mã hóa
  MatKhauMacDinh := 'TNU@567';
  PasswordHashed := TPasswordUtils.GenerateHashedPassword(MatKhauMacDinh, Salt);

  // Bước 6: Cập nhật mật khẩu trong cơ sở dữ liệu
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Try
    Query.SQL.Text := 'UPDATE ThuThu SET MatKhau = :MatKhau, Salt = :Salt, LanDauDangNhap = 1, NgayCapNhat = GETDATE() WHERE ID = :ID';

    // Chỉ định kiểu dữ liệu cho các tham số
    if Query.Params.FindParam('MatKhau') = nil then
      Query.Params.CreateParam(ftString, 'MatKhau', ptInput);
    if Query.Params.FindParam('Salt') = nil then
      Query.Params.CreateParam(ftString, 'Salt', ptInput);
    if Query.Params.FindParam('ID') = nil then
      Query.Params.CreateParam(ftInteger, 'ID', ptInput);

    // Gán giá trị cho các tham số
    Query.ParamByName('MatKhau').AsString := PasswordHashed;
    Query.ParamByName('Salt').AsString := TNetEncoding.Base64.EncodeBytesToString(Salt);
    Query.ParamByName('ID').AsInteger := SelectedID;

    // Thực thi câu lệnh
    Query.ExecSQL;
    ChiTiet := 'Đặt lại mật khẩu thủ thư: ' + TenTT + ' (ID=' + IntToStr(SelectedID) + ') thành TNU@567';
    GhiLichSuHoatDong('Đặt lại mật khẩu', ChiTiet);
    ShowMessage('Đặt lại mật khẩu thành công cho thủ thư: ' + TenTT);
    except
    on E: Exception do
      begin
        ChiTiet := 'Lỗi đặt lại mật khẩu thủ thư ID=' + IntToStr(SelectedID) + ': ' + E.Message;
        GhiLichSuHoatDong('Đặt lại mật khẩu', ChiTiet);
        ShowMessage('Lỗi khi đặt lại mật khẩu: ' + E.Message);
      end;
    End;
  finally
    Query.Free;
  end;
end;

procedure TfrmAdminMain.btnQLTT_PhanQuyenClick(Sender: TObject);
var
  frmPQ: TfrmPhanQuyen;
  SelectedID: Integer;
  TenTT: string;
  ChiTiet: string;
begin
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then Exit;
  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;
  TenTT := DM_Admin.DataSource_QLTT.DataSet.FieldByName('HoTen').AsString;

  frmPQ := TfrmPhanQuyen.Create(Self);
  try
    frmPQ.ThuThuIDCanPhanQuyen := SelectedID;
    if frmPQ.ShowModal = mrOk then
    begin
      ChiTiet := 'Phân quyền thủ thư: ' + TenTT + ' (ID=' + IntToStr(SelectedID) + ')';
      GhiLichSuHoatDong('Phân quyền thủ thư', ChiTiet);
    end;
  finally
    frmPQ.Free;
  end;
end;


procedure TfrmAdminMain.btnQLTT_SuaClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaThuThu;
  SelectedID: Integer;
  ChiTiet: string;
begin
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then
  Begin
    ShowMessage('Vui lòng chọn một thủ thư để sửa.');
    Exit;
  End;
  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;

  frmThemSua := TfrmThemSuaThuThu.Create(Self);
  try
    frmThemSua.CheDo := 'Sua';
    frmThemSua.ThuThuIDCanSua := SelectedID;
    if frmThemSua.ShowModal = mrOk then
    begin
      ChiTiet := 'Sửa thủ thư ID=' + IntToStr(SelectedID) + ': ' + frmThemSua.edtHoTenTT.Text + ' (Tên đăng nhập: ' + frmThemSua.edtTenDangNhapTT.Text + ')';
      GhiLichSuHoatDong('Sửa thủ thư', ChiTiet);
      ShowMessage('Cập nhật thủ thư thành công.');
      RefreshDBGrid(dbgQLTT_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;


procedure TfrmAdminMain.btnQLTT_ThemClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaThuThu;
  ChiTiet: string;
begin
  frmThemSua := TfrmThemSuaThuThu.Create(Self);
  try
    frmThemSua.CheDo := 'Them';
    if frmThemSua.ShowModal = mrOk then
    begin
      ChiTiet := 'Thêm thủ thư: ' + frmThemSua.edtHoTenTT.Text + ' (Tên đăng nhập: ' + frmThemSua.edtTenDangNhapTT.Text + ')';
      GhiLichSuHoatDong('Thêm thủ thư', ChiTiet);
      RefreshDBGrid(dbgQLTT_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;


procedure TfrmAdminMain.btnQLTT_VoHieuHoaClick(Sender: TObject);
var
  SelectedID: Integer;
  CurrentTrangThai: Boolean;
  NewTrangThai: Boolean;
  Query: TFDQuery;
  TenTT: string;
  TrangThaiText: string;
  ChiTiet: string;
begin
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then Exit;

  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;
  CurrentTrangThai := DM_Admin.DataSource_QLTT.DataSet.FieldByName('TrangThai').AsBoolean;
  TenTT := DM_Admin.DataSource_QLTT.DataSet.FieldByName('HoTen').AsString;
  NewTrangThai := not CurrentTrangThai;

  // Xây dựng chuỗi trạng thái (thay thế IIF)
  if NewTrangThai then
    TrangThaiText := 'KÍCH HOẠT'
  else
    TrangThaiText := 'VÔ HIỆU HÓA';

  // Xây dựng chuỗi thông điệp trước khi gọi MessageDlg
  if MessageDlg('Bạn có chắc chắn muốn ' + TrangThaiText + ' tài khoản: ' + TenTT +
                ' (ID=' + IntToStr(SelectedID) + ')?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := DM_Admin.FDConnectionAdmin;
      try
        Query.SQL.Text := 'UPDATE ThuThu SET TrangThai = :NewTrangThai, NgayCapNhat = GETDATE() WHERE ID = :ID';
        if Query.Params.FindParam('NewTrangThai') = nil then
          Query.Params.CreateParam(ftBoolean, 'NewTrangThai', ptInput);
        if Query.Params.FindParam('ID') = nil then
          Query.Params.CreateParam(ftInteger, 'ID', ptInput);
        Query.ParamByName('NewTrangThai').AsBoolean := NewTrangThai;
        Query.ParamByName('ID').AsInteger := SelectedID;
        Query.ExecSQL;
        ChiTiet := TrangThaiText + ' tài khoản thủ thư: ' + TenTT + ' (ID=' + IntToStr(SelectedID) + ')';
        GhiLichSuHoatDong('Thay đổi trạng thái thủ thư', ChiTiet);
        ShowMessage('Cập nhật trạng thái thủ thư thành công.');
        RefreshDBGrid(dbgQLTT_DanhSach);
      except
        on E: Exception do
          begin
          ChiTiet := 'Lỗi khi ' + TrangThaiText + ' thủ thư ID=' + IntToStr(SelectedID) + ': ' + E.Message;
          GhiLichSuHoatDong('Thay đổi trạng thái thủ thư', ChiTiet);
          ShowMessage('Lỗi khi cập nhật trạng thái thủ thư: ' + E.Message);
        end;
      end;
    finally
      Query.Free;
    end;
  end;
end;


procedure TfrmAdminMain.btnQuaHan_CapNhatPhatClick(Sender: TObject);
var
  TienPhatQuaHanMoiNgay: Currency;
  TienPhatMatSach: Currency;
  SoBanGhiCapNhat: Integer;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  // Lấy giá trị từ TLabeledEdit
  TienPhatQuaHanMoiNgay := StrToFloatDef(Trim(edtQuaHan_TienPhatMoiNgay.Text), 0);
  TienPhatMatSach := StrToFloatDef(Trim(edtQuaHan_TienPhatMatSach.Text), 0);

  // Kiểm tra giá trị hợp lệ
  if TienPhatQuaHanMoiNgay <= 0 then
  begin
    ShowMessage('Vui lòng nhập số tiền phạt mỗi ngày hợp lệ (số lớn hơn 0).');
    edtQuaHan_TienPhatMoiNgay.SetFocus;
    Exit;
  end;

  if TienPhatMatSach <= 0 then
  begin
    ShowMessage('Vui lòng nhập số tiền phạt cho sách mất hợp lệ (số lớn hơn 0).');
    edtQuaHan_TienPhatMatSach.SetFocus;
    Exit;
  end;

  // Hỏi người dùng có muốn cập nhật tiền phạt không
  if MessageDlg('Bạn có muốn cập nhật tiền phạt cho tất cả các yêu cầu quá hạn và mất sách?' + #13 +
                Format('Mức phạt quá hạn: %s VND/ngày, áp dụng cho yêu cầu trễ từ 1 ngày trở lên.' + #13 +
                       'Mức phạt mất sách: %s VND.',
                       [FormatFloat('#,##0', TienPhatQuaHanMoiNgay),
                        FormatFloat('#,##0', TienPhatMatSach)]),
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      // Gọi hàm TinhVaCapNhatTienPhat
      SoBanGhiCapNhat := DM_Admin.TinhVaCapNhatTienPhat(1, TienPhatQuaHanMoiNgay, TienPhatMatSach);
      ChiTiet := Format('Cập nhật tiền phạt: %s VND/ngày, %s VND/mất sách, ảnh hưởng %d yêu cầu.',
                        [FormatFloat('#,##0', TienPhatQuaHanMoiNgay),
                         FormatFloat('#,##0', TienPhatMatSach),
                         SoBanGhiCapNhat]);
      GhiLichSuHoatDong('Cập nhật tiền phạt', ChiTiet);
      if SoBanGhiCapNhat > 0 then
        ShowMessage(Format('Đã cập nhật tiền phạt cho %d yêu cầu quá hạn hoặc mất sách.', [SoBanGhiCapNhat]))
      else
        ShowMessage('Không có yêu cầu quá hạn hoặc mất sách nào cần tính tiền phạt.');

      // Refresh danh sách quá hạn để thấy tiền phạt mới
      HienThiDuLieuQuaHan;
    except
      on E: Exception do
      begin
        ChiTiet := 'Lỗi khi cập nhật tiền phạt: ' + E.Message;
        GhiLichSuHoatDong('Cập nhật tiền phạt', ChiTiet);
        ShowMessage('Lỗi khi cập nhật tiền phạt: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmAdminMain.btnQuaHan_GuiThongBaoClick(Sender: TObject);
var
  SelectedItem: TListItem;
  SelectedID: Int64;
  MSSV_QuaHan, TenSV, TenTL, MaTL, NoiDungThongBao, TieuDeThongBao: string;
  NgayHenTraValue: TDate;
  Cmd: TFDCommand;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvQuaHan.Selected = nil then
  begin
    ShowMessage('Vui lòng chọn yêu cầu quá hạn để gửi thông báo.');
    Exit;
  end;

  SelectedItem := lstvQuaHan.Selected;
  SelectedID := Int64(SelectedItem.Data);

  // Lấy thông tin cần thiết từ ListView
  MSSV_QuaHan := SelectedItem.SubItems[1]; // Lấy MSSV
  TenSV := SelectedItem.SubItems[2];      // Lấy Tên SV
  MaTL := SelectedItem.SubItems[3];       // Lấy Mã TL
  TenTL := SelectedItem.SubItems[4];      // Lấy Tên TL
  NgayHenTraValue := StrToDateDef(SelectedItem.SubItems[5], 0); // Lấy Ngày hẹn trả

  // Soạn nội dung thông báo
  TieuDeThongBao := 'Thông báo nhắc nhở trả tài liệu quá hạn - Thư viện Trường Đại học Tây Nguyên';
  NoiDungThongBao := 'Chào bạn ' + TenSV + ' (' + MSSV_QuaHan + '),' + #13#10#13#10 +
                     'Thư viện xin thông báo bạn đang giữ tài liệu sau đã quá hạn trả:' + #13#10 +
                     '- Tên tài liệu: ' + TenTL + ' (Mã: ' + MaTL + ')' + #13#10 +
                     '- Ngày hẹn trả: ' + FormatDateTime('dd/mm/yyyy', NgayHenTraValue) + #13#10#13#10 +
                     'Việc trễ hạn trả sách có thể phát sinh phí phạt theo quy định.' + #13#10 +
                     'Rất mong bạn sớm hoàn trả tài liệu cho thư viện.' + #13#10#13#10 +
                     'Trân trọng,' + #13#10 +
                     'Thư viện Trường Đại học Tây Nguyên.';

  // Lưu thông báo vào bảng ThongBao
  Cmd := TFDCommand.Create(nil);
  try
    Cmd.Connection := DM_Admin.FDConnectionAdmin;
    Try
    Cmd.CommandText.Text := 'INSERT INTO ThongBao (MSSV, TieuDe, NoiDung, NgayTao) ' +
                           'VALUES (:MSSV, :TieuDe, :NoiDung, GETDATE())';
    // Xác định rõ kiểu dữ liệu cho các tham số
    Cmd.Params.Clear;
    with Cmd.Params.Add do
    begin
      Name := 'MSSV';
      DataType := ftWideString;
      Size := 20; // Đặt độ dài phù hợp với cột MSSV (giả sử NVARCHAR(20))
      ParamType := ptInput;
      Value := MSSV_QuaHan;
    end;

    with Cmd.Params.Add do
    begin
      Name := 'TieuDe';
      DataType := ftWideString;
      Size := 500; // Tăng độ dài để chứa tiêu đề (hoặc kiểm tra schema)
      ParamType := ptInput;
      Value := TieuDeThongBao;
    end;

    with Cmd.Params.Add do
    begin
      Name := 'NoiDung';
      DataType := ftWideMemo; // Sử dụng ftWideMemo cho dữ liệu dài
      ParamType := ptInput;
      Value := NoiDungThongBao;
    end;

    Cmd.Execute;

    // Cập nhật GhiChu trong MuonTraTaiLieu để đánh dấu đã gửi thông báo
    Cmd.CommandText.Text := 'UPDATE MuonTraTaiLieu ' +
                           'SET GhiChu = ISNULL(GhiChu + NCHAR(13)+NCHAR(10), N'''') + ' +
                           'N''Đã gửi thông báo nhắc nhở vào '' + CONVERT(NVARCHAR(10), GETDATE(), 103) ' +
                           'WHERE ID = :ID';
    Cmd.Params.Clear;
    with Cmd.Params.Add do
    begin
      Name := 'ID';
      DataType := ftLargeint;
      ParamType := ptInput;
      Value := SelectedID;
    end;
    Cmd.Execute;

    ShowMessage('Đã gửi thông báo nhắc nhở thành công đến ứng dụng của sinh viên [' + MSSV_QuaHan + '].');
    ChiTiet := 'Gửi thông báo quá hạn cho sinh viên MSSV=' + MSSV_QuaHan + ', Yêu cầu ID=' + IntToStr(SelectedID);
    GhiLichSuHoatDong('Gửi thông báo quá hạn', ChiTiet);
  except
    on E: Exception do
    begin
      ShowMessage('Gửi thông báo thất bại: ' + E.Message);
      ChiTiet := 'Gửi thông báo quá hạn thất bại cho sinh viên MSSV=' + MSSV_QuaHan + ', Yêu cầu ID=' + IntToStr(SelectedID) + '. Lỗi: ' + E.Message;
      GhiLichSuHoatDong('Gửi thông báo quá hạn', ChiTiet);
    end;
  end;
  finally
    Cmd.Free;
  end;
end;

procedure TfrmAdminMain.btnQuaHan_XacNhanTraClick(Sender: TObject);
var
  SelectedItem: TListItem;
  SelectedID: Int64;
  DialogResult: Integer;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvQuaHan.Selected = nil then
  begin
    ShowMessage('Vui lòng chọn một yêu cầu quá hạn để xử lý.');
    Exit;
  end;

  SelectedItem := lstvQuaHan.Selected;
  SelectedID := Int64(SelectedItem.Data);

  // Hiển thị hộp thoại với hai tùy chọn
  DialogResult := MessageDlg('Sinh viên xử lý yêu cầu [' + SelectedItem.SubItems[1] + '] như thế nào?' + #13 +
                             '1. Đã mang sách đến trả (Chuyển sang "Chờ duyệt trả").' + #13 +
                             '2. Báo mất tài liệu (Chuyển sang "Mất sách").',
                             mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbYes, ['Đã trả', 'Báo mất', 'Hủy']);

  if DialogResult = mrCancel then
    Exit;

  DM_Admin.FDConnectionAdmin.StartTransaction; // Bọc trong transaction để đảm bảo an toàn
  try
    if DialogResult = mrYes then // Xác nhận trả
    begin
      // Đảm bảo tham số tồn tại
      if DM_Admin.FDQuery_ChuyenChoTra.Params.FindParam('ID') = nil then
        DM_Admin.FDQuery_ChuyenChoTra.Params.CreateParam(ftLargeint, 'ID', ptInput);

      DM_Admin.FDQuery_ChuyenChoTra.Params.ParamByName('ID').AsLargeInt := SelectedID;
      DM_Admin.FDQuery_ChuyenChoTra.ExecSQL;
      ChiTiet := 'Chuyển yêu cầu quá hạn ID=' + IntToStr(SelectedID) + ', Mã yêu cầu: ' + SelectedItem.SubItems[1] + ' sang "Chờ duyệt trả"';
      GhiLichSuHoatDong('Xử lý quá hạn', ChiTiet);

      ShowMessage('Đã chuyển yêu cầu sang trạng thái "Chờ duyệt trả".');
      HienThiDuLieuQuaHan; // Refresh danh sách quá hạn

      pgcAdminMain.ActivePageIndex := 2; // Chuyển sang tab Duyệt Trả
      LoadDataForTab(pgcAdminMain.ActivePageIndex);
    end
    else if DialogResult = mrNo then // Báo mất tài liệu
    begin
      // Đảm bảo tham số tồn tại
      if DM_Admin.FDQuery_BaoMatSach.Params.FindParam('ID') = nil then
        DM_Admin.FDQuery_BaoMatSach.Params.CreateParam(ftLargeint, 'ID', ptInput);

      DM_Admin.FDQuery_BaoMatSach.Params.ParamByName('ID').AsLargeInt := SelectedID;
      DM_Admin.FDQuery_BaoMatSach.ExecSQL;

      // Tính tiền phạt ngay sau khi báo mất
      if DM_Admin.FDQuery_UpdateTienPhat.Params.FindParam('TienPhatMoi') = nil then
        DM_Admin.FDQuery_UpdateTienPhat.Params.CreateParam(ftCurrency, 'TienPhatMoi', ptInput);
      if DM_Admin.FDQuery_UpdateTienPhat.Params.FindParam('LyDoPhatMoi') = nil then
        DM_Admin.FDQuery_UpdateTienPhat.Params.CreateParam(ftString, 'LyDoPhatMoi', ptInput);
      if DM_Admin.FDQuery_UpdateTienPhat.Params.FindParam('GhiChuPhatMoi') = nil then
        DM_Admin.FDQuery_UpdateTienPhat.Params.CreateParam(ftString, 'GhiChuPhatMoi', ptInput);
      if DM_Admin.FDQuery_UpdateTienPhat.Params.FindParam('ID') = nil then
        DM_Admin.FDQuery_UpdateTienPhat.Params.CreateParam(ftLargeint, 'ID', ptInput);

      DM_Admin.FDQuery_UpdateTienPhat.Params.ParamByName('TienPhatMoi').AsCurrency := StrToFloatDef(Trim(edtQuaHan_TienPhatMatSach.Text), 100000); // Mức phạt mặc định nếu không nhập
      DM_Admin.FDQuery_UpdateTienPhat.Params.ParamByName('LyDoPhatMoi').AsString := 'Phạt mất sách';
      DM_Admin.FDQuery_UpdateTienPhat.Params.ParamByName('GhiChuPhatMoi').AsString := 'Đã tính tiền phạt mất sách vào ' + FormatDateTime('dd/mm/yyyy', Date);
      DM_Admin.FDQuery_UpdateTienPhat.Params.ParamByName('ID').AsLargeInt := SelectedID;
      DM_Admin.FDQuery_UpdateTienPhat.ExecSQL;

      ChiTiet := 'Chuyển yêu cầu quá hạn ID=' + IntToStr(SelectedID) + ', Mã sinh viên: ' + SelectedItem.SubItems[1] + ' sang "Mất sách"';
      GhiLichSuHoatDong('Xử lý quá hạn', ChiTiet);

      ShowMessage('Đã chuyển yêu cầu sang trạng thái "Mất sách" và tính tiền phạt.');
      HienThiDuLieuQuaHan; // Refresh danh sách quá hạn
    end;

    DM_Admin.FDConnectionAdmin.Commit;
  except
    on E: Exception do
    begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi xử lý yêu cầu quá hạn ID=' + IntToStr(SelectedID) + ': ' + E.Message;
      GhiLichSuHoatDong('Xử lý quá hạn', ChiTiet);
      ShowMessage('Lỗi khi xử lý yêu cầu: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminMain.btnQuaHan_XemChiTietClick(Sender: TObject);
var
  SelectedItem: TListItem;
  SelectedMuonTraID: Int64;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_TRA') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvQuaHan.Selected = nil then
  begin
    ShowMessage('Vui lòng chọn một yêu cầu quá hạn để xem chi tiết.');
    Exit;
  end;

  SelectedItem := lstvQuaHan.Selected;
  SelectedMuonTraID := Int64(SelectedItem.Data);


  DM_Admin.FDQuery_QuaHan.Locate('ID', SelectedMuonTraID, []); // Tìm lại bản ghi trong Query đang mở
  if not DM_Admin.FDQuery_QuaHan.IsEmpty then
  begin
    ShowMessageFmt('Chi tiết yêu cầu [%s]:' + #13#10 +
                   'Sinh viên: %s (%s)' + #13#10 +
                   'Tài liệu: %s (%s)' + #13#10 +
                   'Ngày hẹn trả: %s' + #13#10 +
                   'Số ngày trễ: %d' + #13#10 +
                   'Tiền phạt: %s',
                   [DM_Admin.FDQuery_QuaHan.FieldByName('MaYeuCau').AsString,
                    DM_Admin.FDQuery_QuaHan.FieldByName('TenSinhVien').AsString,
                    DM_Admin.FDQuery_QuaHan.FieldByName('MSSV').AsString,
                    DM_Admin.FDQuery_QuaHan.FieldByName('TenTaiLieu').AsString,
                    DM_Admin.FDQuery_QuaHan.FieldByName('MaTaiLieu').AsString, // Giả sử View có MaTaiLieu
                    FormatDateTime('dd/mm/yyyy', DM_Admin.FDQuery_QuaHan.FieldByName('NgayHenTra').AsDateTime),
                    DM_Admin.FDQuery_QuaHan.FieldByName('SoNgayTre').AsInteger,
                    FormatFloat('#,##0', DM_Admin.FDQuery_QuaHan.FieldByName('TienPhat').AsFloat)]);
                    ChiTiet := 'Xem chi tiết yêu cầu quá hạn ID=' + IntToStr(SelectedMuonTraID) + ', Mã yêu cầu: ' + DM_Admin.FDQuery_QuaHan.FieldByName('MaYeuCau').AsString;
                    GhiLichSuHoatDong('Xem chi tiết quá hạn', ChiTiet);
  end else
  begin
    ShowMessage('Không tìm thấy chi tiết cho yêu cầu này.');
    ChiTiet := 'Không tìm thấy chi tiết yêu cầu quá hạn ID=' + IntToStr(SelectedMuonTraID);
    GhiLichSuHoatDong('Xem chi tiết quá hạn', ChiTiet);
  end;

end;

procedure TfrmAdminMain.btnTK_XemClick(Sender: TObject);
var
  SQL: string;
  LoaiTK: Integer;
begin
  if not SessionManager.HasPermission('BC_THONGKE') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  LoaiTK := cboTK_LoaiThongKe.ItemIndex;
  if LoaiTK < 0 then
  begin
    ShowMessage('Vui lòng chọn loại thống kê.');
    Exit;
  end;

  // Đóng các Query thống kê khác nếu có
  DM_Admin.FDQuery_ThongKeTLMuonNhieu.Close;

  case LoaiTK of
    0: // Tài liệu mượn nhiều nhất
      begin
        SQL := 'SELECT TOP 20 tl.MaTaiLieu, tl.TenTaiLieu, COUNT(mt.ID) AS SoLuotMuon ' +
               'FROM MuonTraTaiLieu mt JOIN TaiLieuTongHop tl ON mt.TaiLieuID = tl.ID ' +
               'WHERE mt.TrangThai IN (4, 6, 8) ' +
               'AND mt.NgayMuonThucTe BETWEEN :TuNgay AND :DenNgay ' +
               'GROUP BY tl.MaTaiLieu, tl.TenTaiLieu ORDER BY SoLuotMuon DESC';
        DM_Admin.FDQuery_ThongKeTLMuonNhieu.SQL.Text := SQL;
        DM_Admin.FDQuery_ThongKeTLMuonNhieu.Params.Clear;
        if DM_Admin.FDQuery_ThongKeTLMuonNhieu.Params.FindParam('TuNgay') = nil then
          DM_Admin.FDQuery_ThongKeTLMuonNhieu.Params.CreateParam(ftDate, 'TuNgay', ptInput);
        if DM_Admin.FDQuery_ThongKeTLMuonNhieu.Params.FindParam('DenNgay') = nil then
          DM_Admin.FDQuery_ThongKeTLMuonNhieu.Params.CreateParam(ftDate, 'DenNgay', ptInput);
        DM_Admin.FDQuery_ThongKeTLMuonNhieu.ParamByName('TuNgay').AsDate := dtpTK_TuNgay.Date;
        // Cộng thêm 1 ngày vào DenNgay để bao gồm cả ngày đó
        DM_Admin.FDQuery_ThongKeTLMuonNhieu.ParamByName('DenNgay').AsDate := EndOfTheDay(dtpTK_DenNgay.Date);
        DM_Admin.FDQuery_ThongKeTLMuonNhieu.Open;
        dbgThongKe.DataSource := DM_Admin.DataSource_ThongKeTLMuonNhieu;
      end;
    1: // Sinh viên mượn nhiều nhất
      begin
         ShowMessage('Chức năng thống kê Sinh viên mượn nhiều chưa được cài đặt.');
         dbgThongKe.DataSource := nil;
      end;
  else
    dbgThongKe.DataSource := nil;
  end;
end;

procedure TfrmAdminMain.btnXacNhan_DongYClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_MUON') then
  begin
    ShowMessage('Bạn không có quyền xác nhận mượn.');
    Exit;
  end;
  if lstvXacNhan.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để xác nhận đã mượn.');
    Exit;
  end;

  if MessageDlg('Xác nhận đã mượn ' + IntToStr(lstvXacNhan.SelCount) + ' yêu cầu đã chọn?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số tồn tại trước vòng lặp
    if DM_Admin.FDQuery_UpdateXacNhanMuon.Params.FindParam('ThuThuID') = nil then
      DM_Admin.FDQuery_UpdateXacNhanMuon.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_UpdateXacNhanMuon.Params.FindParam('ID') = nil then
      DM_Admin.FDQuery_UpdateXacNhanMuon.Params.CreateParam(ftLargeint, 'ID', ptInput);

    for i := 0 to lstvXacNhan.Items.Count - 1 do
    begin
      SelectedItem := lstvXacNhan.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_UpdateXacNhanMuon.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_UpdateXacNhanMuon.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_UpdateXacNhanMuon.ExecSQL;
          // Ghi lịch sử hoạt động
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID);
          GhiLichSuHoatDong('Xác nhận mượn', ChiTiet);
          Inc(SuccessCount);
        except
          on E: Exception do
            begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi xác nhận mượn, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Xác nhận mượn', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã xác nhận mượn thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi xác nhận:' + #13 + ErrorMsg);
    end;

    DM_Admin.FDQuery_XacNhanMuon.Close;
    DM_Admin.FDQuery_XacNhanMuon.Open;
    HienThiYeuCauXacNhanMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi xác nhận mượn: ' + E.Message;
      GhiLichSuHoatDong('Xác nhận mượn', ChiTiet);
      ShowMessage('Lỗi Transaction khi xác nhận: ' + E.Message);
    end;
  end;
end;



procedure TfrmAdminMain.btnXacNhan_TuChoiClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
  LyDo: string;
  ChiTiet: string;
begin
  if not SessionManager.HasPermission('MUONTRA_MUON') then
  begin
    ShowMessage('Bạn không có quyền!');
    Exit;
  end;
  if lstvXacNhan.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để từ chối/hủy.');
    Exit;
  end;

  // --- Hiển thị ô nhập lý do (nếu bạn thêm vào giao diện) ---
  // // Có thể dùng InputQuery hoặc một form nhỏ để nhập lý do thay vì Edit trên panel
  if not InputQuery('Xác nhận hủy', 'Nhập lý do hủy yêu cầu:', LyDo) then
  begin
  //   // Người dùng nhấn Cancel

  Exit;
  end;

  // --- Lấy lý do (ví dụ từ InputQuery hoặc Edit) ---
  // Ví dụ dùng InputQuery: (Bỏ comment khối trên nếu dùng InputQuery)
  if LyDo = '' then
  begin
      ShowMessage('Vui lòng nhập lý do hủy.');
  //lblXacNhan_LyDo.Visible := False;
  //edtXacNhan_LyDo.Visible := False;
  Exit;
  end;

  // --- Kết thúc phần lấy lý do ---


  if MessageDlg('Hủy ' + IntToStr(lstvXacNhan.SelCount) + ' yêu cầu đã chọn với lý do: "' + LyDo + '"?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
      // Ẩn lại ô lý do nếu người dùng hủy
      //lblXacNhan_LyDo.Visible := False;
      //edtXacNhan_LyDo.Visible := False;
      Exit;
  end;


  SuccessCount := 0;
  ErrorMsg := '';
  DM_Admin.FDConnectionAdmin.StartTransaction;
  try
    // Đảm bảo tham số tồn tại
    if DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.FindParam('ThuThuID') = nil then
      DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    if DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.FindParam('LyDoHuy') = nil then
      DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.CreateParam(ftString, 'LyDoHuy', ptInput);
    if DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.FindParam('ID') = nil then
      DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.CreateParam(ftLargeint, 'ID', ptInput);

    for i := 0 to lstvXacNhan.Items.Count - 1 do
    begin
      SelectedItem := lstvXacNhan.Items[i];
      if SelectedItem.Selected then
      begin
        SelectedID := Int64(SelectedItem.Data);
        try
          DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.ParamByName('ThuThuID').AsInteger := Admin_ThuThuID;
          DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.ParamByName('LyDoHuy').AsString := LyDo;
          DM_Admin.FDQuery_HuyYeuCauDaDuyet.Params.ParamByName('ID').AsLargeInt := SelectedID;
          DM_Admin.FDQuery_HuyYeuCauDaDuyet.ExecSQL;
          ChiTiet := 'Yêu cầu ID=' + IntToStr(SelectedID) + ', Lý do: ' + LyDo;
          GhiLichSuHoatDong('Từ chối mượn', ChiTiet);
          Inc(SuccessCount);
        except
          on E: Exception do
            begin
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
            ChiTiet := 'Lỗi hủy yêu cầu mượn, Yêu cầu ID=' + IntToStr(SelectedID) + ': ' + E.Message;
            GhiLichSuHoatDong('Hủy yêu cầu mượn', ChiTiet);
          end;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã hủy thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi hủy:' + #13 + ErrorMsg);
    end;

    // Tải lại danh sách để loại bỏ các yêu cầu vừa hủy
    DM_Admin.FDQuery_XacNhanMuon.Close;
    DM_Admin.FDQuery_XacNhanMuon.Open;
    HienThiYeuCauXacNhanMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ChiTiet := 'Lỗi Transaction khi hủy yêu cầu mượn: ' + E.Message;
      GhiLichSuHoatDong('Hủy yêu cầu mượn', ChiTiet);
      ShowMessage('Lỗi Transaction khi hủy: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminMain.FormActivate(Sender: TObject);
var
  Query: TFDQuery;
  SoBanGhiCapNhat: Integer;
begin
  SessionManager.LoadSession(Admin_ThuThuID);
  // Hiển thị thông tin người dùng
  lblAdminHoTen.Caption := 'Chào mừng: ' + SessionManager.HoTen;
  lblAdminVaiTro.Caption := '(Vai trò: ' + Admin_TenVaiTro + ')';

  // **Phân quyền cơ bản (Ẩn/Hiện Tab)**
// Tab Duyệt Mượn và Xác Nhận Mượn
  tsDuyetMuon.TabVisible := SessionManager.HasPermission('MUONTRA_MUON');
  tsXacNhanMuon.TabVisible := SessionManager.HasPermission('MUONTRA_MUON');

  // Tab Duyệt Trả và Quá Hạn
  tsDuyetTra.TabVisible := SessionManager.HasPermission('MUONTRA_TRA');
  tsQuaHan.TabVisible := SessionManager.HasPermission('MUONTRA_TRA');

  // Tab Quản Lý Tài Liệu
  tsQuanLyTaiLieu.TabVisible := SessionManager.HasPermission('QLSACH_THEM') or
                                SessionManager.HasPermission('QLSACH_SUA') or
                                SessionManager.HasPermission('QLSACH_XOA');
  btnQLTL_Them.Visible := SessionManager.HasPermission('QLSACH_THEM');
  btnQLTL_Sua.Visible := SessionManager.HasPermission('QLSACH_SUA');
  btnQLTL_Xoa.Visible := SessionManager.HasPermission('QLSACH_XOA');

  // Tab Quản Lý Sinh Viên
  tsQuanLySinhVien.TabVisible := SessionManager.HasPermission('QL_SINHVIEN');
  btnQLSV_LocTim.Visible := SessionManager.HasPermission('QL_SINHVIEN');

  // Tab Quản Lý Thủ Thư (giữ nguyên logic vai trò Admin)
  tsQuanLyThuThu.TabVisible := (Admin_VaiTro = 1);

  // Tab Thống Kê
  tsThongKe.TabVisible := SessionManager.HasPermission('BC_THONGKE');
  btnTK_Xem.Visible := SessionManager.HasPermission('BC_THONGKE');

  tsLichSuHoatDong.TabVisible := (Admin_VaiTro in [1, 2, 3, 4]);

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin; // Dùng connection của Admin DM
    try
    Query.SQL.Text := 'EXEC [dbo].[sp_XuLyQuaHanMuonTraTaiLieu]';
    Query.ExecSQL;
    // Có thể chạy cả SP tính tiền phạt nếu muốn
    //Query.SQL.Text := 'EXEC [dbo].[sp_TinhTienPhatQuaHanTaiLieu] @SoNgayTre = 1, @TienPhatMoiNgay = 5000';
    //Query.ExecSQL;
    // Tự động từ chối yêu cầu mượn
    DM_Admin.FDQuery_TuDongTuChoiYeuCauMuon.ExecSQL;
    SoBanGhiCapNhat := DM_Admin.FDQuery_TuDongTuChoiYeuCauMuon.RowsAffected;
    if SoBanGhiCapNhat > 0 then
      ShowMessage(Format('Hệ thống đã tự động từ chối %d yêu cầu mượn do quá hạn ngày hẹn mượn.', [SoBanGhiCapNhat]));

    // Tự động hủy xác nhận mượn
    DM_Admin.FDQuery_TuDongHuyXacNhanMuon.ExecSQL;
    SoBanGhiCapNhat := DM_Admin.FDQuery_TuDongHuyXacNhanMuon.RowsAffected;
    if SoBanGhiCapNhat > 0 then
      ShowMessage(Format('Hệ thống đã tự động hủy %d yêu cầu mượn do không đến nhận tài liệu đúng hạn.', [SoBanGhiCapNhat]));

    SoBanGhiCapNhat := DM_Admin.TinhVaCapNhatTienPhat(1, 5000, 100000);
      if SoBanGhiCapNhat > 0 then
        ShowMessage(Format('Đã cập nhật tiền phạt cho %d yêu cầu quá hạn hoặc mất sách.', [SoBanGhiCapNhat]))
    except
    on E: Exception do
    Begin
      ShowMessage('Lỗi khi cập nhật trạng thái quá hạn: ' + E.Message);
    End;
    End;
    finally
    Query.Free;
    end;

  // **Tải dữ liệu cho tab đang hiển thị ban đầu (ví dụ: tab đầu tiên)**
  LoadDataForTab(pgcAdminMain.ActivePageIndex);
end;


end.
