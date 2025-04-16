unit UnitAdminMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids ,System.DateUtils;

type
  TfrmAdminMain = class(TForm)
    pnlAdminHeader: TPanel;
    lblAdminHoTen: TLabel;
    lblAdminVaiTro: TLabel;
    btnAdminThoat: TButton;
    btnAdminDangXuat: TButton;
    btnAdminDoiMatKhau: TButton;
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
    btnDuyetMuon_DongY: TButton;
    btnDuyetMuon_TuChoi: TButton;
    lblDuyetMuon_LyDo: TLabel;
    edtDuyetMuon_LyDo: TEdit;
    pnlXacNhanActions: TPanel;
    lblXacNhan_LyDo: TLabel;
    btnXacNhan_DongY: TButton;
    btnXacNhan_TuChoi: TButton;
    edtXacNhan_LyDo: TEdit;
    lstvXacNhan: TListView;
    lstvDuyetTra: TListView;
    pnlDuyetTraActions: TPanel;
    lblDuyetTra_LyDo: TLabel;
    btnDuyetTra_DongY: TButton;
    btnDuyetTra_TuChoi: TButton;
    edtDuyetTra_LyDo: TEdit;
    pnlQLTL_Actions: TPanel;
    lblQLTL_TimKiem: TLabel;
    edtQLTL_TuKhoa: TEdit;
    btnQLTL_TimKiem: TButton;
    btnQLTL_Them: TButton;
    btnQLTL_Sua: TButton;
    btnQLTL_Xoa: TButton;
    dbgQLTL_DanhSach: TDBGrid;
    dbnQLTL: TDBNavigator;
    pnlQLSV_Actions: TPanel;
    lblQLSV_TimKiem: TLabel;
    edtQLSV_TuKhoa: TEdit;
    btnQLSV_TimKiem: TButton;
    btnQLSV_Sua: TButton;
    dbgQLSV_DanhSach: TDBGrid;
    dbnQLSV: TDBNavigator;
    pnlQLTT_Actions: TPanel;
    btnQLTT_Them: TButton;
    btnQLTT_Sua: TButton;
    btnQLTT_PhanQuyen: TButton;
    btnQLTT_VoHieuHoa: TButton;
    btnQLTT_DoiMatKhau: TButton;
    dbgQLTT_DanhSach: TDBGrid;
    dbnQLTT: TDBNavigator;
    pnlTK_ChonLoai: TPanel;
    Label1: TLabel;
    cboTK_LoaiThongKe: TComboBox;
    dtpTK_TuNgay: TDateTimePicker;
    dtpTK_DenNgay: TDateTimePicker;
    btnTK_Xem: TButton;
    pnlTK_KetQua: TPanel;
    dbgThongKe: TDBGrid;
    lblDuyetTra_TinhTrang: TLabel;
    edtDuyetTra_TinhTrang: TEdit;
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
    procedure btnQLSV_TimKiemClick(Sender: TObject);
    procedure btnQLSV_SuaClick(Sender: TObject);
    procedure btnQLTT_ThemClick(Sender: TObject);
    procedure btnQLTT_SuaClick(Sender: TObject);
    procedure btnQLTT_DoiMatKhauClick(Sender: TObject);
    procedure btnQLTT_VoHieuHoaClick(Sender: TObject);
    procedure btnQLTT_PhanQuyenClick(Sender: TObject);
    procedure btnTK_XemClick(Sender: TObject);
  private
    { Private declarations }
    FAdmin_ThuThuID: Integer;
    FAdmin_HoTen: string;
    FAdmin_VaiTro: Integer;
    FAdmin_TenVaiTro: string;
    procedure HienThiYeuCauDuyetMuon;
    procedure HienThiYeuCauXacNhanMuon;
    procedure HienThiYeuCauDuyetTra;
    procedure LoadDataForTab(TabIndex: Integer); // Procedure helper mới
    procedure RefreshDBGrid(DBGrid: TDBGrid);
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
  FireDAC.Stan.Option, FireDAC.Phys;

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
  DM_Admin.FDQuery_QLSV.Close;
  DM_Admin.FDQuery_QLTT.Close;
  DM_Admin.FDQuery_ThongKeTLMuonNhieu.Close; // Đóng cả query thống kê

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
    3: // Quản Lý Tài Liệu
      begin
        DM_Admin.FDQuery_QLTL.Open;
        // DBGrid tự hiển thị
      end;
    4: // Quản Lý Sinh Viên
      begin
        DM_Admin.FDQuery_QLSV.Open;
        // DBGrid tự hiển thị
      end;
    5: // Quản Lý Thủ Thư
      begin
        if Admin_VaiTro = 1 then
           DM_Admin.FDQuery_QLTT.Open;
      end;
    6: // Thống Kê
      begin
        // Không tự động tải dữ liệu thống kê, chờ nút "Xem"
        dbgThongKe.DataSource := nil; // Ngắt kết nối DBGrid thống kê
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
  frmDoiMKAdmin: TfrmAdminDoiMK; // Giả sử bạn tạo form này (Unit uAdminDoiMK)
begin
  frmDoiMKAdmin := TfrmAdminDoiMK.Create(Self);
  try
    frmDoiMKAdmin.CurrentUserID := Admin_ThuThuID; // Truyền ID thủ thư hiện tại
    frmDoiMKAdmin.ShowModal;
    // Xử lý kết quả nếu cần (ví dụ: thông báo đổi MK thành công)
  finally
    frmDoiMKAdmin.Free;
  end;
end;

procedure TfrmAdminMain.btnAdminThoatClick(Sender: TObject);
begin
  if MessageDlg('Bạn có chắc chắn muốn thoát ứng dụng?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Application.Terminate;
end;

procedure TfrmAdminMain.btnDuyetMuon_DongYClick(Sender: TObject);
var
  i: Integer;
  SelectedItem: TListItem;
  SelectedID: Int64;
  SuccessCount: Integer;
  ErrorMsg: string;
begin
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
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
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
    HienThiYeuCauDuyetMuon;
  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
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
begin
  if lstvDuyetMuon.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để từ chối.');
    Exit;
  end;

  LyDo := Trim(edtDuyetMuon_LyDo.Text);
  if LyDo = '' then
  begin
    ShowMessage('Vui lòng nhập lý do từ chối.');
    edtDuyetMuon_LyDo.SetFocus;
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
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã từ chối thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
      edtDuyetMuon_LyDo.Text := ''; // Xóa lý do sau khi từ chối
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi từ chối:' + #13 + ErrorMsg);
    end;

    HienThiYeuCauDuyetMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
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
begin
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
    // Đảm bảo tham số tồn tại trước vòng lặp
    // ... (thêm code kiểm tra và tạo param cho FDQuery_UpdateDuyetTra nếu cần) ...
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
          DM_Admin.FDQuery_UpdateDuyetTra.ExecSQL;
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
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

    HienThiYeuCauDuyetTra;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
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
begin
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
          DM_Admin.FDQuery_UpdateDuyetTra.ExecSQL;
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
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

    HienThiYeuCauDuyetTra;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Lỗi Transaction khi từ chối trả: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminMain.btnQLSV_SuaClick(Sender: TObject);
begin
  ShowMessage('Chức năng sửa thông tin sinh viên chưa được cài đặt.');
  // Mở form sửa sinh viên (nếu có và được phép)
end;

procedure TfrmAdminMain.btnQLSV_TimKiemClick(Sender: TObject);
var
  TuKhoa: string;
  SQL: string;
begin
  TuKhoa := Trim(edtQLSV_TuKhoa.Text);
  SQL := 'SELECT MSSV, HoLot, Ten, NgaySinh, TrangThai, TenTrangThai FROM SinhVien';
  if TuKhoa <> '' then
  begin
    SQL := SQL + ' WHERE MSSV LIKE :TuKhoa OR HoLot LIKE :TuKhoa OR Ten LIKE :TuKhoa';
  end;
  SQL := SQL + ' ORDER BY Ten, HoLot';

  DM_Admin.FDQuery_QLSV.Close;
  DM_Admin.FDQuery_QLSV.SQL.Text := SQL;
  DM_Admin.FDQuery_QLSV.Params.Clear;
  if TuKhoa <> '' then
  begin
    if DM_Admin.FDQuery_QLSV.Params.FindParam('TuKhoa') = nil then
      DM_Admin.FDQuery_QLSV.Params.CreateParam(ftString, 'TuKhoa', ptInput);
    DM_Admin.FDQuery_QLSV.ParamByName('TuKhoa').AsString := '%' + TuKhoa + '%';
  end;
  DM_Admin.FDQuery_QLSV.Open;
end;


procedure TfrmAdminMain.btnQLTL_SuaClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaTaiLieu;
  SelectedID: Int64;
begin
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
      RefreshDBGrid(dbgQLTL_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;

procedure TfrmAdminMain.btnQLTL_ThemClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaTaiLieu;
begin
  frmThemSua := TfrmThemSuaTaiLieu.Create(Self);
  try
    frmThemSua.CheDo := 'Them'; // Đặt chế độ cho form con
    if frmThemSua.ShowModal = mrOk then
    begin
      RefreshDBGrid(dbgQLTL_DanhSach); // Gọi hàm refresh chung
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
begin
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
        Exit;
      end;

      // Xóa
      Query.SQL.Text := 'DELETE FROM TaiLieuTongHop WHERE ID = :ID';
      Query.ExecSQL;
      ShowMessage('Xóa tài liệu thành công.');
      RefreshDBGrid(dbgQLTL_DanhSach);
    except
      on E: Exception do
        ShowMessage('Lỗi khi xóa tài liệu: ' + E.Message);
    end;
    finally
      Query.Free;
    end;
  end;
end;


procedure TfrmAdminMain.btnQLTT_DoiMatKhauClick(Sender: TObject);
begin
   ShowMessage('Chức năng đặt lại mật khẩu thủ thư chưa được cài đặt.');
end;

procedure TfrmAdminMain.btnQLTT_PhanQuyenClick(Sender: TObject);
var
  frmPQ: TfrmPhanQuyen;
  SelectedID: Integer;
begin
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then Exit;
  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;

  frmPQ := TfrmPhanQuyen.Create(Self);
  try
    frmPQ.ThuThuIDCanPhanQuyen := SelectedID;
    frmPQ.ShowModal;
  finally
    frmPQ.Free;
  end;
end;


procedure TfrmAdminMain.btnQLTT_SuaClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaThuThu;
  SelectedID: Integer;
begin
  if DM_Admin.DataSource_QLTT.DataSet.IsEmpty then Exit;
  SelectedID := DM_Admin.DataSource_QLTT.DataSet.FieldByName('ID').AsInteger;

  frmThemSua := TfrmThemSuaThuThu.Create(Self);
  try
    frmThemSua.ThuThuIDCanSua := SelectedID;
    if frmThemSua.ShowModal = mrOk then
    begin
      RefreshDBGrid(dbgQLTT_DanhSach);
    end;
  finally
    frmThemSua.Free;
  end;
end;


procedure TfrmAdminMain.btnQLTT_ThemClick(Sender: TObject);
var
  frmThemSua: TfrmThemSuaThuThu;
begin
  frmThemSua := TfrmThemSuaThuThu.Create(Self);
  try
    if frmThemSua.ShowModal = mrOk then
    begin
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
        ShowMessage('Cập nhật trạng thái thủ thư thành công.');
        RefreshDBGrid(dbgQLTT_DanhSach);
      except
        on E: Exception do
          ShowMessage('Lỗi khi cập nhật trạng thái thủ thư: ' + E.Message);
      end;
    finally
      Query.Free;
    end;
  end;
end;


procedure TfrmAdminMain.btnTK_XemClick(Sender: TObject);
var
  SQL: string;
  LoaiTK: Integer;
begin
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
begin
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
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
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

    HienThiYeuCauXacNhanMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
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
begin
  if lstvXacNhan.SelCount = 0 then
  begin
    ShowMessage('Vui lòng chọn ít nhất một yêu cầu để từ chối/hủy.');
    Exit;
  end;

  // --- Hiển thị ô nhập lý do (nếu bạn thêm vào giao diện) ---
  lblXacNhan_LyDo.Visible := True;
  edtXacNhan_LyDo.Visible := True;
  edtXacNhan_LyDo.SetFocus;
  // // Có thể dùng InputQuery hoặc một form nhỏ để nhập lý do thay vì Edit trên panel
  if not InputQuery('Xác nhận hủy', 'Nhập lý do hủy yêu cầu:', LyDo) then
  begin
  //   // Người dùng nhấn Cancel
  lblXacNhan_LyDo.Visible := False; // Ẩn lại nếu dùng Edit
  edtXacNhan_LyDo.Visible := False;
  Exit;
  end;

  // --- Lấy lý do (ví dụ từ InputQuery hoặc Edit) ---
  // Ví dụ dùng InputQuery: (Bỏ comment khối trên nếu dùng InputQuery)
  if LyDo = '' then
  begin
      ShowMessage('Vui lòng nhập lý do hủy.');
  lblXacNhan_LyDo.Visible := False;
  edtXacNhan_LyDo.Visible := False;
  Exit;
  end;

  // Ví dụ lấy từ Edit (cần đảm bảo Edit đã hiện ra):
   LyDo := Trim(edtXacNhan_LyDo.Text);
   if LyDo = '' then
   begin
     // Hiện Edit nếu chưa hiện, và yêu cầu nhập
     if not edtXacNhan_LyDo.Visible then
     begin
         lblXacNhan_LyDo.Visible := True;
         edtXacNhan_LyDo.Visible := True;
     end;
     ShowMessage('Vui lòng nhập lý do hủy vào ô bên cạnh.');
     edtXacNhan_LyDo.SetFocus;
     Exit;
   end;
  // --- Kết thúc phần lấy lý do ---


  if MessageDlg('Hủy ' + IntToStr(lstvXacNhan.SelCount) + ' yêu cầu đã chọn với lý do: "' + LyDo + '"?',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
      // Ẩn lại ô lý do nếu người dùng hủy
      lblXacNhan_LyDo.Visible := False;
      edtXacNhan_LyDo.Visible := False;
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
          Inc(SuccessCount);
        except
          on E: Exception do
            ErrorMsg := ErrorMsg + 'ID ' + IntToStr(SelectedID) + ': ' + E.Message + #13;
        end;
      end;
    end;

    if ErrorMsg = '' then
    begin
      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Đã hủy thành công ' + IntToStr(SuccessCount) + ' yêu cầu.');
      edtXacNhan_LyDo.Text := ''; // Xóa lý do
      // Ẩn lại ô lý do
      lblXacNhan_LyDo.Visible := False;
      edtXacNhan_LyDo.Visible := False;
    end else begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Có lỗi xảy ra khi hủy:' + #13 + ErrorMsg);
    end;

    // Tải lại danh sách để loại bỏ các yêu cầu vừa hủy
    HienThiYeuCauXacNhanMuon;

  except
    on E: Exception do begin
      DM_Admin.FDConnectionAdmin.Rollback;
      ShowMessage('Lỗi Transaction khi hủy: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminMain.FormActivate(Sender: TObject);
var
  Query: TFDQuery; // Để chạy SP xử lý quá hạn
begin
  // Hiển thị thông tin người dùng
  lblAdminHoTen.Caption := 'Chào mừng: ' + Admin_HoTen;
  lblAdminVaiTro.Caption := '(Vai trò: ' + Admin_TenVaiTro + ')';

  // **Phân quyền cơ bản (Ẩn/Hiện Tab)**
  // Ví dụ: Chỉ Admin (VaiTro = 1) mới thấy tab Quản lý Thủ thư
  tsQuanLyThuThu.TabVisible := (Admin_VaiTro = 1);
  // Thêm các kiểm tra phân quyền khác cho các tab/nút nếu cần

  // **Chạy Stored Procedure xử lý quá hạn (nếu muốn chạy khi form active)**
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin; // Dùng connection của Admin DM
    try
    Query.SQL.Text := 'EXEC [dbo].[sp_XuLyQuaHanMuonTraTaiLieu]';
    Query.ExecSQL;
    // Có thể chạy cả SP tính tiền phạt nếu muốn
    Query.SQL.Text := 'EXEC [dbo].[sp_TinhTienPhatQuaHanTaiLieu] @SoNgayTre = 1, @TienPhatMoiNgay = 5000';
    Query.ExecSQL;
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
