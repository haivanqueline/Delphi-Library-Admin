unit uThemSuaTaiLieu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.DateUtils, Data.DB, Vcl.Buttons;

type
  TfrmThemSuaTaiLieu = class(TForm)
    lblMaTL: TLabel;
    lblTenTL: TLabel;
    lblTacGia: TLabel;
    lblNXB: TLabel;
    lblTenLoaiTL: TLabel;
    lblLoaiTL: TLabel;
    lblNamXB: TLabel;
    lblKhoa: TLabel;
    lblNganh: TLabel;
    lblMoTa: TLabel;
    lblSoLuong: TLabel;
    lblSoLuongCon: TLabel;
    edtMaTL: TEdit;
    edtTenTL: TEdit;
    edtTacGia: TEdit;
    edtNXB: TEdit;
    edtTenLoaiTL: TEdit;
    edtKhoa: TEdit;
    cboLoaiTL: TComboBox;
    edtNganh: TEdit;
    memMoTa: TMemo;
    edtSoLuongCon: TEdit;
    edtSoLuong: TEdit;
    btnLuuTL: TBitBtn;
    btnHuyTL: TBitBtn;
    edtNamXB: TSpinEdit;
    pnlMain: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboLoaiTLChange(Sender: TObject);
    procedure btnLuuTLClick(Sender: TObject);
    procedure btnHuyTLClick(Sender: TObject);
  private
    { Private declarations }
    FTaiLieuIDCanSua: Int64;
    FCheDo: string; // 'Them' hoặc 'Sua'
    procedure LoadDataForEdit;
    procedure ResetForm;
    function ValidateInput: Boolean;
    function GenerateMaTaiLieu(LoaiTL: string): string;
  public
    { Public declarations }
    property TaiLieuIDCanSua: Int64 read FTaiLieuIDCanSua write FTaiLieuIDCanSua;
    property CheDo: string read FCheDo write FCheDo;
  end;

var
  frmThemSuaTaiLieu: TfrmThemSuaTaiLieu;

implementation

{$R *.dfm}

uses UnitAdminDM, FireDAC.Comp.Client, FireDAC.Stan.Param;

procedure TfrmThemSuaTaiLieu.ResetForm;
begin
  // Xóa các trường nhập liệu
  edtMaTL.Text := '';
  edtTenTL.Text := '';
  edtTacGia.Text := '';
  edtNXB.Text := '';
  edtNamXB.Value := YearOf(Date); // Đặt năm hiện tại
  cboLoaiTL.ItemIndex := -1;
  edtTenLoaiTL.Text := '';
  edtKhoa.Text := '';
  edtNganh.Text := '';
  memMoTa.Text := '';
  edtSoLuong.Text := '';
  edtSoLuongCon.Text := '';
  Self.Caption := 'Thêm Tài Liệu Mới';
  FCheDo := 'Them';
  FTaiLieuIDCanSua := -1;
  edtMaTL.ReadOnly := True;
  // Đảm bảo các trường nhập số lượng có thể chỉnh sửa
  edtSoLuong.ReadOnly := False;
  edtSoLuongCon.ReadOnly := False;
end;

procedure TfrmThemSuaTaiLieu.LoadDataForEdit;
var
  Query: TFDQuery;
begin
  if (FCheDo <> 'Sua') or (FTaiLieuIDCanSua <= 0) then Exit;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Query.SQL.Text := 'SELECT * FROM TaiLieuTongHop WHERE ID = :ID';
    Query.Params.ParamByName('ID').AsLargeInt := FTaiLieuIDCanSua;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Self.Caption := 'Sửa Thông Tin Tài Liệu - ID: ' + IntToStr(FTaiLieuIDCanSua);
      edtMaTL.Text := Query.FieldByName('MaTaiLieu').AsString;
      edtTenTL.Text := Query.FieldByName('TenTaiLieu').AsString;
      edtTacGia.Text := Query.FieldByName('TenTacGia').AsString;
      edtNXB.Text := Query.FieldByName('NhaXB').AsString;
      edtNamXB.Value := Query.FieldByName('NamXB').AsInteger;
      cboLoaiTL.Text := Query.FieldByName('LoaiTL').AsString;
      edtTenLoaiTL.Text := Query.FieldByName('TenLoaiTL').AsString;
      edtKhoa.Text := Query.FieldByName('Khoa').AsString;
      edtNganh.Text := Query.FieldByName('Nganh').AsString;
      memMoTa.Text := Query.FieldByName('MoTa').AsString;
      edtSoLuong.Text := Query.FieldByName('SoLuong').AsString;
      edtSoLuongCon.Text := Query.FieldByName('SoLuongCon').AsString;
      edtMaTL.ReadOnly := True; // Không cho sửa Mã Tài liệu khi sửa
      // Đảm bảo các trường nhập số lượng có thể chỉnh sửa
      edtSoLuong.ReadOnly := False;
      edtSoLuongCon.ReadOnly := False;
    end
    else
    begin
      ShowMessage('Không tìm thấy tài liệu với ID = ' + IntToStr(FTaiLieuIDCanSua));
      ModalResult := mrCancel;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmThemSuaTaiLieu.btnHuyTLClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmThemSuaTaiLieu.btnLuuTLClick(Sender: TObject);
var
  Query: TFDQuery;
  SQL: string;
  MaTaiLieu: string;
begin
  // Kiểm tra đầu vào, nếu không hợp lệ thì không đóng form
  if not ValidateInput then
  begin
    Exit; // Thoát hàm nhưng không đóng form
  end;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    try
      if FCheDo = 'Them' then
      begin
        if cboLoaiTL.ItemIndex < 0 then
        begin
          ShowMessage('Vui lòng chọn Loại tài liệu trước khi lưu.');
          cboLoaiTL.SetFocus;
          Exit;
        end;
        MaTaiLieu := GenerateMaTaiLieu(cboLoaiTL.Text);
        edtMaTL.Text := MaTaiLieu;

        SQL := 'INSERT INTO TaiLieuTongHop (MaTaiLieu, TenTaiLieu, TenTacGia, NhaXB, NamXB, ' +
               'LoaiTL, TenLoaiTL, Khoa, Nganh, MoTa, SoLuong, SoLuongCon) ' +
               'VALUES (:MaTaiLieu, :TenTaiLieu, :TenTacGia, :NhaXB, :NamXB, ' +
               ':LoaiTL, :TenLoaiTL, :Khoa, :Nganh, :MoTa, :SoLuong, :SoLuongCon)';
        Query.SQL.Text := SQL;
        Query.ParamByName('MaTaiLieu').DataType := ftWideString;
        Query.ParamByName('MaTaiLieu').AsWideString := MaTaiLieu;
        Query.ParamByName('TenTaiLieu').DataType := ftWideString;
        Query.ParamByName('TenTaiLieu').AsWideString := Trim(edtTenTL.Text);
        Query.ParamByName('TenTacGia').DataType := ftWideString;
        Query.ParamByName('TenTacGia').AsWideString := Trim(edtTacGia.Text);
        Query.ParamByName('NhaXB').DataType := ftWideString;
        Query.ParamByName('NhaXB').AsWideString := Trim(edtNXB.Text);
        Query.ParamByName('NamXB').AsInteger := edtNamXB.Value;
        Query.ParamByName('LoaiTL').DataType := ftWideString;
        Query.ParamByName('LoaiTL').AsWideString := cboLoaiTL.Text;
        Query.ParamByName('TenLoaiTL').DataType := ftWideString;
        Query.ParamByName('TenLoaiTL').AsWideString := Trim(edtTenLoaiTL.Text);
        Query.ParamByName('Khoa').DataType := ftWideString;
        Query.ParamByName('Khoa').AsWideString := Trim(edtKhoa.Text);
        Query.ParamByName('Nganh').DataType := ftWideString;
        Query.ParamByName('Nganh').AsWideString := Trim(edtNganh.Text);
        Query.ParamByName('MoTa').DataType := ftWideString;
        Query.ParamByName('MoTa').AsWideString := Trim(memMoTa.Text);
        Query.ParamByName('SoLuong').AsInteger := StrToIntDef(Trim(edtSoLuong.Text), 0);
        Query.ParamByName('SoLuongCon').AsInteger := StrToIntDef(Trim(edtSoLuongCon.Text), 0);
      end
      else
      begin
        SQL := 'UPDATE TaiLieuTongHop SET ' +
               'MaTaiLieu = :MaTaiLieu, TenTaiLieu = :TenTaiLieu, TenTacGia = :TenTacGia, NhaXB = :NhaXB, NamXB = :NamXB, ' +
               'LoaiTL = :LoaiTL, TenLoaiTL = :TenLoaiTL, Khoa = :Khoa, Nganh = :Nganh, MoTa = :MoTa, ' +
               'SoLuong = :SoLuong, SoLuongCon = :SoLuongCon, NgayCapNhat = GETDATE() ' +
               'WHERE ID = :ID';
        Query.SQL.Text := SQL;
        Query.ParamByName('MaTaiLieu').DataType := ftWideString;
        Query.ParamByName('MaTaiLieu').AsWideString := Trim(edtMaTL.Text);
        Query.ParamByName('TenTaiLieu').DataType := ftWideString;
        Query.ParamByName('TenTaiLieu').AsWideString := Trim(edtTenTL.Text);
        Query.ParamByName('TenTacGia').DataType := ftWideString;
        Query.ParamByName('TenTacGia').AsWideString := Trim(edtTacGia.Text);
        Query.ParamByName('NhaXB').DataType := ftWideString;
        Query.ParamByName('NhaXB').AsWideString := Trim(edtNXB.Text);
        Query.ParamByName('NamXB').AsInteger := edtNamXB.Value;
        Query.ParamByName('LoaiTL').DataType := ftWideString;
        Query.ParamByName('LoaiTL').AsWideString := cboLoaiTL.Text;
        Query.ParamByName('TenLoaiTL').DataType := ftWideString;
        Query.ParamByName('TenLoaiTL').AsWideString := Trim(edtTenLoaiTL.Text);
        Query.ParamByName('Khoa').DataType := ftWideString;
        Query.ParamByName('Khoa').AsWideString := Trim(edtKhoa.Text);
        Query.ParamByName('Nganh').DataType := ftWideString;
        Query.ParamByName('Nganh').AsWideString := Trim(edtNganh.Text);
        Query.ParamByName('MoTa').DataType := ftWideString;
        Query.ParamByName('MoTa').AsWideString := Trim(memMoTa.Text);
        Query.ParamByName('SoLuong').AsInteger := StrToIntDef(Trim(edtSoLuong.Text), 0);
        Query.ParamByName('SoLuongCon').AsInteger := StrToIntDef(Trim(edtSoLuongCon.Text), 0);
        Query.ParamByName('ID').AsLargeInt := FTaiLieuIDCanSua;
      end;

      Query.ExecSQL;
      ShowMessage('Lưu tài liệu thành công.');
      ModalResult := mrOk; // Đóng form chỉ khi lưu thành công
    except
      on E: Exception do
        ShowMessage('Lỗi khi lưu tài liệu: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmThemSuaTaiLieu.cboLoaiTLChange(Sender: TObject);
begin
  case cboLoaiTL.ItemIndex of
    0: edtTenLoaiTL.Text := 'Sách';
    1: edtTenLoaiTL.Text := 'Tạp chí';
    2: edtTenLoaiTL.Text := 'Khóa luận';
    3: edtTenLoaiTL.Text := 'Luận văn';
    4: edtTenLoaiTL.Text := 'Giáo trình';
    5: edtTenLoaiTL.Text := 'Sách ngoại văn';
    6: edtTenLoaiTL.Text := 'Bài giảng';
    7: edtTenLoaiTL.Text := 'Báo cáo khoa học';
    8: edtTenLoaiTL.Text := 'Tư liệu';
    9: edtTenLoaiTL.Text := 'Luận án';
    10: edtTenLoaiTL.Text := 'Sách tham khảo';
    11: edtTenLoaiTL.Text := 'Sách chuyên khảo';
    12: edtTenLoaiTL.Text := 'Tài liệu khác';
  end;
  if (FCheDo = 'Them') and (cboLoaiTL.ItemIndex >= 0) then
    edtMaTL.Text := GenerateMaTaiLieu(cboLoaiTL.Text);
end;

procedure TfrmThemSuaTaiLieu.FormCreate(Sender: TObject);
begin
  cboLoaiTL.Items.Add('SA');
  cboLoaiTL.Items.Add('TC');
  cboLoaiTL.Items.Add('KL');
  cboLoaiTL.Items.Add('LV');
  cboLoaiTL.Items.Add('GT');
  cboLoaiTL.Items.Add('NV');
  cboLoaiTL.Items.Add('BG');
  cboLoaiTL.Items.Add('BC');
  cboLoaiTL.Items.Add('TD');
  cboLoaiTL.Items.Add('LA');
  cboLoaiTL.Items.Add('TK');
  cboLoaiTL.Items.Add('CK');
  cboLoaiTL.Items.Add('Kh');

  ResetForm;
end;

procedure TfrmThemSuaTaiLieu.FormShow(Sender: TObject);
begin
  if FCheDo = 'Sua' then
    LoadDataForEdit
  else
    ResetForm;
end;

function TfrmThemSuaTaiLieu.ValidateInput: Boolean;
begin
  Result := True;

  if Trim(edtMaTL.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Mã tài liệu.');
    edtMaTL.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtTenTL.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Tên tài liệu.');
    edtTenTL.SetFocus;
    Result := False;
    Exit;
  end;

  if cboLoaiTL.ItemIndex < 0 then
  begin
    ShowMessage('Vui lòng chọn Loại tài liệu.');
    cboLoaiTL.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtTacGia.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Tên tác giả.');
    edtTacGia.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtNXB.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Nhà xuất bản.');
    edtNXB.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtSoLuong.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Số lượng tổng.');
    edtSoLuong.SetFocus;
    Result := False;
    Exit;
  end;

  // Kiểm tra số lượng tổng phải là số hợp lệ
  if (StrToIntDef(Trim(edtSoLuong.Text), -1) < 0) then
  begin
    ShowMessage('Số lượng tổng phải là một số không âm.');
    edtSoLuong.SetFocus;
    Result := False;
    Exit;
  end;

  // Nếu không nhập số lượng còn, gán bằng số lượng tổng
  if Trim(edtSoLuongCon.Text) = '' then
  begin
    edtSoLuongCon.Text := edtSoLuong.Text;
  end
  else if (StrToIntDef(Trim(edtSoLuongCon.Text), -1) < 0) then
  begin
    ShowMessage('Số lượng còn phải là một số không âm.');
    edtSoLuongCon.SetFocus;
    Result := False;
    Exit;
  end;

  // Kiểm tra số lượng còn không được lớn hơn số lượng tổng
  if StrToIntDef(Trim(edtSoLuongCon.Text), 0) > StrToIntDef(Trim(edtSoLuong.Text), 0) then
  begin
    ShowMessage('Số lượng còn không được lớn hơn số lượng tổng.');
    edtSoLuongCon.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TfrmThemSuaTaiLieu.GenerateMaTaiLieu(LoaiTL: string): string;
var
  Query: TFDQuery;
  Count: Integer;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Query.SQL.Text := 'SELECT COUNT(*) FROM TaiLieuTongHop WHERE LoaiTL = :LoaiTL';
    Query.ParamByName('LoaiTL').AsWideString := LoaiTL;
    Query.Open;
    Count := Query.Fields[0].AsInteger;
    Query.Close;
    Inc(Count);
    Result := LoaiTL + Format('%.6d', [Count]);
  finally
    Query.Free;
  end;
end;

end.
