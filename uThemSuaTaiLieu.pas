unit uThemSuaTaiLieu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls, Vcl.ComCtrls;

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
    btnLuuTL: TButton;
    btnHuyTL: TButton;
    edtNamXB: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure cboLoaiTLChange(Sender: TObject);
    procedure btnLuuTLClick(Sender: TObject);
  private
    { Private declarations }
    FTaiLieuIDCanSua: Int64;
    FCheDo: string; // 'Them' hoặc 'Sua'
    procedure LoadDataForEdit;
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


procedure TfrmThemSuaTaiLieu.LoadDataForEdit;
var
  Query: TFDQuery;
begin
  // Chỉ tải dữ liệu nếu ở chế độ Sửa và có ID hợp lệ
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
      edtMaTL.ReadOnly := False; // Không cho sửa Mã Tài liệu khi sửa? Tùy yêu cầu
    end
    else
    begin
      ShowMessage('Không tìm thấy tài liệu với ID = ' + IntToStr(FTaiLieuIDCanSua));
      ModalResult := mrCancel; // Đóng form nếu không tìm thấy
    end;
  finally
    Query.Free;
  end;
end;


procedure TfrmThemSuaTaiLieu.btnLuuTLClick(Sender: TObject);
var
  Query: TFDQuery;
  SQL: string;
  MaTaiLieu: string;
begin
  if not ValidateInput then Exit;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    try
      if FCheDo = 'Them' then
      begin
        // Tạo mã tài liệu tự động
        if cboLoaiTL.ItemIndex < 0 then
        begin
          ShowMessage('Vui lòng chọn Loại tài liệu trước khi lưu.');
          cboLoaiTL.SetFocus;
          Exit;
        end;
        MaTaiLieu := GenerateMaTaiLieu(cboLoaiTL.Text);
        edtMaTL.Text := MaTaiLieu; // Hiển thị mã vừa tạo

        // Câu lệnh INSERT
        SQL := 'INSERT INTO TaiLieuTongHop (MaTaiLieu, TenTaiLieu, TenTacGia, NhaXB, NamXB, ' +
               'LoaiTL, TenLoaiTL, Khoa, Nganh, MoTa, SoLuong, SoLuongCon) ' +
               'VALUES (:MaTaiLieu, :TenTaiLieu, :TenTacGia, :NhaXB, :NamXB, ' +
               ':LoaiTL, :TenLoaiTL, :Khoa, :Nganh, :MoTa, :SoLuong, :SoLuongCon)';
        Query.SQL.Text := SQL;
        Query.ParamByName('MaTaiLieu').AsString := MaTaiLieu;
        Query.ParamByName('TenTaiLieu').AsString := Trim(edtTenTL.Text);
        Query.ParamByName('TenTacGia').AsString := Trim(edtTacGia.Text);
        Query.ParamByName('NhaXB').AsString := Trim(edtNXB.Text);
        Query.ParamByName('NamXB').AsInteger := edtNamXB.Value;
        Query.ParamByName('LoaiTL').AsString := cboLoaiTL.Text;
        Query.ParamByName('TenLoaiTL').AsString := Trim(edtTenLoaiTL.Text);
        Query.ParamByName('Khoa').AsString := Trim(edtKhoa.Text);
        Query.ParamByName('Nganh').AsString := Trim(edtNganh.Text);
        Query.ParamByName('MoTa').AsString := Trim(memMoTa.Text);
        Query.ParamByName('SoLuong').AsInteger := StrToIntDef(Trim(edtSoLuong.Text), 0);
        Query.ParamByName('SoLuongCon').AsInteger := StrToIntDef(Trim(edtSoLuongCon.Text), 0);
      end
      else // Chế độ Sửa
      begin
        SQL := 'UPDATE TaiLieuTongHop SET ' +
               'MaTaiLieu = :MaTaiLieu, TenTaiLieu = :TenTaiLieu, TenTacGia = :TenTacGia, NhaXB = :NhaXB, NamXB = :NamXB, ' +
               'LoaiTL = :LoaiTL, TenLoaiTL = :TenLoaiTL, Khoa = :Khoa, Nganh = :Nganh, MoTa = :MoTa, ' +
               'SoLuongCon = :SoLuongCon, NgayCapNhat = GETDATE() ' +
               'WHERE ID = :ID';
        Query.SQL.Text := SQL;
        Query.ParamByName('MaTaiLieu').AsString := Trim(edtMaTL.Text);
        Query.ParamByName('TenTaiLieu').AsString := Trim(edtTenTL.Text);
        Query.ParamByName('TenTacGia').AsString := Trim(edtTacGia.Text);
        Query.ParamByName('NhaXB').AsString := Trim(edtNXB.Text);
        Query.ParamByName('NamXB').AsInteger := edtNamXB.Value;
        Query.ParamByName('LoaiTL').AsString := cboLoaiTL.Text;
        Query.ParamByName('TenLoaiTL').AsString := Trim(edtTenLoaiTL.Text);
        Query.ParamByName('Khoa').AsString := Trim(edtKhoa.Text);
        Query.ParamByName('Nganh').AsString := Trim(edtNganh.Text);
        Query.ParamByName('MoTa').AsString := Trim(memMoTa.Text);
        Query.ParamByName('SoLuongCon').AsInteger := StrToIntDef(Trim(edtSoLuongCon.Text), 0);
        Query.ParamByName('ID').AsLargeInt := FTaiLieuIDCanSua;
      end;

      Query.ExecSQL;
      ModalResult := mrOk; // Đóng form và báo thành công
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
  // Mặc định là chế độ Thêm
  FCheDo := 'Them';
  FTaiLieuIDCanSua := -1; // Giá trị không hợp lệ
  edtSoLuong.ReadOnly := True; // Số lượng tổng thường không cho sửa trực tiếp
  // Điền danh sách mã loại tài liệu
  cboLoaiTL.Items.Add('SA');  // Sách
  cboLoaiTL.Items.Add('TC');  // Tạp chí
  cboLoaiTL.Items.Add('KL');  // Khóa luận
  cboLoaiTL.Items.Add('LV');  // Luận văn
  cboLoaiTL.Items.Add('GT');  // Giáo trình
  cboLoaiTL.Items.Add('NV');  // Sách ngoại văn
  cboLoaiTL.Items.Add('BG');  // Bài giảng
  cboLoaiTL.Items.Add('BC');  // Báo cáo khoa học
  cboLoaiTL.Items.Add('TD');  // Tư liệu
  cboLoaiTL.Items.Add('LA');  // Luận án
  cboLoaiTL.Items.Add('TK');  // Sách tham khảo
  cboLoaiTL.Items.Add('CK');  // Sách chuyên khảo
  cboLoaiTL.Items.Add('Kh');  // Tài liệu khác

  if FCheDo = 'Them' then
    edtMaTL.ReadOnly := True
  else
    edtMaTL.ReadOnly := False;
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
  If trim(edtSoLuongCon.text) = '' then
  Begin
    edtSoLuongCon.text := edtSoLuong.text;
  End;
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
    Query.ParamByName('LoaiTL').AsString := LoaiTL;
    Query.Open;
    Count := Query.Fields[0].AsInteger;
    Query.Close;
    Inc(Count); // Tăng số thứ tự lên 1
    Result := LoaiTL + Format('%.6d', [Count]); // Định dạng số thứ tự thành 6 chữ số
  finally
    Query.Free;
  end;
end;

end.
