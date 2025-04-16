unit uPhanQuyen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls;

type
  TQuyenInfo = record
    MaQuyen: string;
    TenQuyen: string;
  end;
  PQuyenInfo = ^TQuyenInfo;
  TfrmPhanQuyen = class(TForm)
    lblThuThuDuocChonPQ: TLabel;
    clbQuyen: TCheckListBox;
    pnlPhanQuyenActions: TPanel;
    btnLuuQuyen: TButton;
    btnDongPQ: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLuuQuyenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FThuThuIDCanPhanQuyen: Integer;
    procedure LoadDanhSachQuyenMau;
    procedure LoadQuyenHienTai;
  public
    { Public declarations }
    property ThuThuIDCanPhanQuyen: Integer read FThuThuIDCanPhanQuyen write FThuThuIDCanPhanQuyen;
  end;

var
  frmPhanQuyen: TfrmPhanQuyen;

implementation

{$R *.dfm}

uses UnitAdminDM, FireDAC.Comp.Client, Data.DB;

procedure TfrmPhanQuyen.btnLuuQuyenClick(Sender: TObject);
var
  i: Integer;
  Query: TFDQuery;
  QuyenData: PQuyenInfo;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    DM_Admin.FDConnectionAdmin.StartTransaction;
    try
      // 1. Xóa hết quyền cũ của thủ thư này
      Query.SQL.Text := 'DELETE FROM ThuThu_Quyen WHERE ThuThuID = :ThuThuID';
      Query.ParamByName('ThuThuID').AsInteger := FThuThuIDCanPhanQuyen;
      Query.ExecSQL;

      // 2. Chuẩn bị câu lệnh INSERT và sử dụng batch insert
      Query.SQL.Text := 'INSERT INTO ThuThu_Quyen (ThuThuID, MaQuyen, TenQuyen) ' +
                        'VALUES (:ThuThuID, :MaQuyen, :TenQuyen)';
      Query.Prepare;

      // Tắt chế độ thực thi tự động để tích lũy các bản ghi
      Query.UpdateOptions.AutoCommitUpdates := False;

      for i := 0 to clbQuyen.Items.Count - 1 do
      begin
        if clbQuyen.Checked[i] then
        begin
          QuyenData := PQuyenInfo(clbQuyen.Items.Objects[i]);
          if Assigned(QuyenData) then
          begin
            Query.ParamByName('ThuThuID').AsInteger := FThuThuIDCanPhanQuyen;
            Query.ParamByName('MaQuyen').AsString := QuyenData^.MaQuyen;
            Query.ParamByName('TenQuyen').AsString := QuyenData^.TenQuyen;
            Query.Execute; // Tích lũy bản ghi
          end;
        end;
      end;

      // Gửi tất cả các bản ghi trong một lần
      Query.Execute(clbQuyen.Items.Count, 0);

      DM_Admin.FDConnectionAdmin.Commit;
      ShowMessage('Lưu phân quyền thành công!');
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DM_Admin.FDConnectionAdmin.Rollback;
        ShowMessage('Lỗi khi lưu phân quyền: ' + E.Message);
      end;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmPhanQuyen.FormCreate(Sender: TObject);
begin
  FThuThuIDCanPhanQuyen := -1;
end;

procedure TfrmPhanQuyen.FormDestroy(Sender: TObject);
var
  i: Integer;
  QuyenData: PQuyenInfo;
begin
  // Giải phóng bộ nhớ đã cấp phát cho Objects trong CheckListBox
  for i := 0 to clbQuyen.Items.Count - 1 do
  begin
    QuyenData := PQuyenInfo(clbQuyen.Items.Objects[i]);
    if Assigned(QuyenData) then
      Dispose(QuyenData);
  end;
end;

procedure TfrmPhanQuyen.LoadDanhSachQuyenMau;
var
  QuyenData: PQuyenInfo;
begin
  clbQuyen.Items.Clear;

  New(QuyenData); QuyenData^.MaQuyen := 'QLSACH_THEM'; QuyenData^.TenQuyen := 'Thêm sách/tài liệu'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'QLSACH_SUA'; QuyenData^.TenQuyen := 'Sửa sách/tài liệu'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'QLSACH_XOA'; QuyenData^.TenQuyen := 'Xóa sách/tài liệu'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'MUONTRA_MUON'; QuyenData^.TenQuyen := 'Xử lý mượn sách'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  //New(QuyenData); QuyenData^.MaQuyen := 'MUONTRA_XACNHANMUON'; QuyenData^.TenQuyen := 'Xác nhận đã mượn'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'MUONTRA_TRA'; QuyenData^.TenQuyen := 'Xử lý trả sách'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'QL_SINHVIEN'; QuyenData^.TenQuyen := 'Quản lý sinh viên'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
  New(QuyenData); QuyenData^.MaQuyen := 'BC_THONGKE'; QuyenData^.TenQuyen := 'Xem báo cáo'; clbQuyen.Items.AddObject(QuyenData^.TenQuyen, TObject(QuyenData));
end;

procedure TfrmPhanQuyen.LoadQuyenHienTai;
var
  Query: TFDQuery;
  i: Integer;
  MaQuyenHienTai: string;
  QuyenData: PQuyenInfo;
begin
  if FThuThuIDCanPhanQuyen <= 0 then Exit;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    // Lấy danh sách MaQuyen hiện tại của thủ thư
    Query.SQL.Text := 'SELECT MaQuyen FROM ThuThu_Quyen WHERE ThuThuID = :ThuThuID AND TrangThai = 1';
    if Query.Params.FindParam('ThuThuID') = nil then
       Query.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
    Query.ParamByName('ThuThuID').AsInteger := FThuThuIDCanPhanQuyen;
    Query.Open;

    // Bỏ check tất cả các quyền trước
    for i := 0 to clbQuyen.Items.Count - 1 do
      clbQuyen.Checked[i] := False;

    // Duyệt qua các quyền hiện tại và check vào CheckListBox
    while not Query.Eof do
    begin
      MaQuyenHienTai := Query.FieldByName('MaQuyen').AsString;
      // Tìm quyền tương ứng trong CheckListBox và check
      for i := 0 to clbQuyen.Items.Count - 1 do
      begin
        QuyenData := PQuyenInfo(clbQuyen.Items.Objects[i]);
        if (Assigned(QuyenData)) and (QuyenData^.MaQuyen = MaQuyenHienTai) then
        begin
          clbQuyen.Checked[i] := True;
          Break; // Thoát vòng lặp trong khi đã tìm thấy
        end;
      end;
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;


procedure TfrmPhanQuyen.FormShow(Sender: TObject);
var
  Query: TFDQuery;
  HoTenThuThu: string;
begin
  if FThuThuIDCanPhanQuyen <= 0 then
  begin
    ShowMessage('Chưa chọn thủ thư để phân quyền.');
    ModalResult := mrCancel;
    Exit;
  end;

  // Lấy tên thủ thư hiển thị lên Label
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Query.SQL.Text := 'SELECT HoTen FROM ThuThu WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := FThuThuIDCanPhanQuyen;
    Query.Open;
    if not Query.IsEmpty then
      HoTenThuThu := Query.FieldByName('HoTen').AsString
    else
      HoTenThuThu := 'Không rõ';
  finally
    Query.Free;
  end;
  lblThuThuDuocChonPQ.Caption := 'Phân quyền cho: ' + HoTenThuThu + ' (ID: ' + IntToStr(FThuThuIDCanPhanQuyen) + ')';

  LoadDanhSachQuyenMau;
  LoadQuyenHienTai;
end;

end.
