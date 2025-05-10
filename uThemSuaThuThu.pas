unit uThemSuaThuThu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmThemSuaThuThu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlMain: TPanel;
    edtHoTenTT: TEdit;
    edtTenDangNhapTT: TEdit;
    edtEmailTT: TEdit;
    edtSDTTT: TEdit;
    dtpNgaySinhTT: TDateTimePicker;
    cboVaiTroTT: TComboBox;
    memGhiChuTT: TMemo;
    chkTrangThaiTT: TCheckBox;
    chkYeuCauDoiMK: TCheckBox;
    lblMatKhauMoi: TLabel;
    lblXacNhanMK: TLabel;
    edtMatKhauTT: TEdit;
    edtXacNhanMKTT: TEdit;
    btnLuuTT: TBitBtn;
    btnHuyTT: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLuuTTClick(Sender: TObject);
  private
    { Private declarations }
    FThuThuIDCanSua: Integer;
    FCheDo: string; // 'Them' hoặc 'Sua'
    procedure LoadDataForEdit;
    procedure ResetForm;
    function ValidateInput: Boolean;
    procedure ShowPasswordFields(Show: Boolean);
  public
    { Public declarations }
    property ThuThuIDCanSua: Integer read FThuThuIDCanSua write FThuThuIDCanSua;
    property CheDo: string read FCheDo write FCheDo;
  end;

var
  frmThemSuaThuThu: TfrmThemSuaThuThu;

implementation

{$R *.dfm}

uses UnitAdminDM, uPasswordUtils, System.NetEncoding, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Phys;

procedure TfrmThemSuaThuThu.ResetForm;
begin
  edtHoTenTT.Text := '';
  edtTenDangNhapTT.Text := '';
  edtEmailTT.Text := '';
  edtSDTTT.Text := '';
  dtpNgaySinhTT.Date := Date;
  cboVaiTroTT.ItemIndex := 2; // Mặc định chọn Thủ thư
  memGhiChuTT.Text := '';
  chkTrangThaiTT.Checked := True;
  chkYeuCauDoiMK.Checked := True;
  edtMatKhauTT.Text := '';
  edtXacNhanMKTT.Text := '';
  Self.Caption := 'Thêm Thủ Thư Mới';
  FCheDo := 'Them';
  FThuThuIDCanSua := -1;
  edtTenDangNhapTT.ReadOnly := False;
  ShowPasswordFields(True);
end;

procedure TfrmThemSuaThuThu.btnLuuTTClick(Sender: TObject);
var
  Query: TFDQuery;
  PasswordHashed: string;
  Salt: TBytes;
begin
  if not ValidateInput then Exit;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    try
      if FCheDo = 'Them' then
      begin
        PasswordHashed := TPasswordUtils.GenerateHashedPassword(edtMatKhauTT.Text, Salt);
        Query.SQL.Text := 'INSERT INTO ThuThu (HoTen, TenDangNhap, MatKhau, Salt, Email, SoDienThoai, NgaySinh, VaiTro, TrangThai, NgayTao, GhiChu, LanDauDangNhap) ' +
                          'VALUES (:HoTen, :TenDangNhap, :MatKhau, :Salt, :Email, :SoDienThoai, :NgaySinh, :VaiTro, :TrangThai, GETDATE(), :GhiChu, :LanDauDangNhap)';
        Query.ParamByName('MatKhau').AsWideString := PasswordHashed;
        Query.ParamByName('Salt').AsWideString := TNetEncoding.Base64.EncodeBytesToString(Salt);
        Query.ParamByName('LanDauDangNhap').AsBoolean := chkYeuCauDoiMK.Checked;
      end
      else
      begin
        Query.SQL.Text := 'UPDATE ThuThu SET HoTen = :HoTen, Email = :Email, SoDienThoai = :SoDienThoai, NgaySinh = :NgaySinh, ' +
                          'VaiTro = :VaiTro, TrangThai = :TrangThai, GhiChu = :GhiChu, NgayCapNhat = GETDATE(), LanDauDangNhap = :LanDauDangNhap';

        if Trim(edtMatKhauTT.Text) <> '' then
        begin
          PasswordHashed := TPasswordUtils.GenerateHashedPassword(edtMatKhauTT.Text, Salt);
          Query.SQL.Text := Query.SQL.Text + ', MatKhau = :MatKhau, Salt = :Salt';
          Query.ParamByName('MatKhau').AsWideString := PasswordHashed;
          Query.ParamByName('Salt').AsWideString := TNetEncoding.Base64.EncodeBytesToString(Salt);
        end;

        Query.SQL.Text := Query.SQL.Text + ' WHERE ID = :ID';
        Query.ParamByName('ID').AsInteger := FThuThuIDCanSua;
        Query.ParamByName('LanDauDangNhap').AsBoolean := chkYeuCauDoiMK.Checked;
      end;

      // Gán các tham số chung, dùng AsWideString cho chuỗi
      Query.ParamByName('HoTen').AsWideString := Trim(edtHoTenTT.Text);
      if FCheDo = 'Them' then
        Query.ParamByName('TenDangNhap').AsWideString := Trim(edtTenDangNhapTT.Text);
      Query.ParamByName('Email').AsWideString := Trim(edtEmailTT.Text);
      Query.ParamByName('SoDienThoai').AsWideString := Trim(edtSDTTT.Text);
      if dtpNgaySinhTT.Date > 0 then
        Query.ParamByName('NgaySinh').AsDate := dtpNgaySinhTT.Date
      else
        Query.ParamByName('NgaySinh').Clear;

      Query.ParamByName('VaiTro').AsInteger := Integer(cboVaiTroTT.Items.Objects[cboVaiTroTT.ItemIndex]);
      Query.ParamByName('TrangThai').AsBoolean := chkTrangThaiTT.Checked;
      Query.ParamByName('GhiChu').AsWideString := Trim(memGhiChuTT.Text);
      Query.ExecSQL;
      ShowMessage('Lưu thủ thư thành công.');
      ModalResult := mrOk;
    except
      on E: Exception do
        ShowMessage('Lỗi khi lưu thông tin thủ thư: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmThemSuaThuThu.FormCreate(Sender: TObject);
begin
  cboVaiTroTT.Items.AddObject('Quản trị viên', TObject(1));
  cboVaiTroTT.Items.AddObject('Thủ thư chính', TObject(2));
  cboVaiTroTT.Items.AddObject('Thủ thư', TObject(3));
  cboVaiTroTT.Items.AddObject('Nhân viên khác', TObject(4));
  ResetForm;
end;

procedure TfrmThemSuaThuThu.ShowPasswordFields(Show: Boolean);
begin
  lblMatKhauMoi.Visible := Show;
  edtMatKhauTT.Visible := Show;
  lblXacNhanMK.Visible := Show;
  edtXacNhanMKTT.Visible := Show;
  chkYeuCauDoiMK.Visible := (FCheDo = 'Them') or ((not Show) and (FCheDo = 'Sua'));
  if not Show then
  begin
    edtMatKhauTT.Text := '';
    edtXacNhanMKTT.Text := '';
  end;
end;

procedure TfrmThemSuaThuThu.LoadDataForEdit;
var
  Query: TFDQuery;
begin
  if (FCheDo <> 'Sua') or (FThuThuIDCanSua <= 0) then Exit;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Query.SQL.Text := 'SELECT HoTen, TenDangNhap, Email, SoDienThoai, NgaySinh, VaiTro, TrangThai, GhiChu, LanDauDangNhap ' +
                      'FROM ThuThu WHERE ID = :ID';
    if Query.Params.FindParam('ID') = nil then
      Query.Params.CreateParam(ftInteger, 'ID', ptInput);
    Query.ParamByName('ID').AsInteger := FThuThuIDCanSua;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Self.Caption := 'Sửa Thông Tin Thủ Thư - ID: ' + IntToStr(FThuThuIDCanSua);
      edtHoTenTT.Text := Query.FieldByName('HoTen').AsString;
      edtTenDangNhapTT.Text := Query.FieldByName('TenDangNhap').AsString;
      edtTenDangNhapTT.ReadOnly := True;
      edtEmailTT.Text := Query.FieldByName('Email').AsString;
      edtSDTTT.Text := Query.FieldByName('SoDienThoai').AsString;
      if not Query.FieldByName('NgaySinh').IsNull then
        dtpNgaySinhTT.Date := Query.FieldByName('NgaySinh').AsDateTime;
      cboVaiTroTT.ItemIndex := cboVaiTroTT.Items.IndexOfObject(TObject(Query.FieldByName('VaiTro').AsInteger));
      chkTrangThaiTT.Checked := Query.FieldByName('TrangThai').AsBoolean;
      memGhiChuTT.Text := Query.FieldByName('GhiChu').AsString;
      chkYeuCauDoiMK.Checked := Query.FieldByName('LanDauDangNhap').AsBoolean;
      ShowPasswordFields(False);
    end
    else
    begin
      ShowMessage('Không tìm thấy thủ thư với ID = ' + IntToStr(FThuThuIDCanSua));
      ModalResult := mrCancel;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmThemSuaThuThu.FormShow(Sender: TObject);
begin
  if FCheDo = 'Sua' then
    LoadDataForEdit
  else
    ResetForm;
end;

function TfrmThemSuaThuThu.ValidateInput: Boolean;
var
  Query: TFDQuery;
  Count: Integer;
begin
  Result := True;

  if Trim(edtHoTenTT.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Họ tên.');
    edtHoTenTT.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtTenDangNhapTT.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Tên đăng nhập.');
    edtTenDangNhapTT.SetFocus;
    Result := False;
    Exit;
  end;

  if Trim(edtSDTTT.Text) = '' then
  begin
    ShowMessage('Vui lòng nhập Số điện thoại.');
    edtSDTTT.SetFocus;
    Result := False;
    Exit;
  end;

  if cboVaiTroTT.ItemIndex < 0 then
  begin
    ShowMessage('Vui lòng chọn Vai trò.');
    cboVaiTroTT.SetFocus;
    Result := False;
    Exit;
  end;

  if (FCheDo = 'Them') or ((FCheDo = 'Sua') and (Trim(edtMatKhauTT.Text) <> '')) then
  begin
    if Trim(edtMatKhauTT.Text) = '' then
    begin
      ShowMessage('Vui lòng nhập Mật khẩu.');
      edtMatKhauTT.SetFocus;
      Result := False;
      Exit;
    end;
    if edtMatKhauTT.Text <> edtXacNhanMKTT.Text then
    begin
      ShowMessage('Mật khẩu mới và xác nhận mật khẩu không khớp.');
      edtXacNhanMKTT.SetFocus;
      Result := False;
      Exit;
    end;
  end;

  if FCheDo = 'Them' then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := DM_Admin.FDConnectionAdmin;

      Query.SQL.Text := 'SELECT COUNT(*) FROM ThuThu WHERE TenDangNhap = :TenDN';
      Query.ParamByName('TenDN').AsWideString := Trim(edtTenDangNhapTT.Text);
      Query.Open;
      Count := Query.Fields[0].AsInteger;
      Query.Close;
      if Count > 0 then
      begin
        ShowMessage('Tên đăng nhập này đã tồn tại. Vui lòng chọn tên khác.');
        edtTenDangNhapTT.SetFocus;
        Result := False;
        Exit;
      end;

      Query.SQL.Text := 'SELECT COUNT(*) FROM ThuThu WHERE Email = :Email';
      Query.ParamByName('Email').AsWideString := Trim(edtEmailTT.Text);
      Query.Open;
      Count := Query.Fields[0].AsInteger;
      Query.Close;
      if Count > 0 then
      begin
        ShowMessage('Email này đã tồn tại. Vui lòng sử dụng Email khác.');
        edtEmailTT.SetFocus;
        Result := False;
        Exit;
      end;

      Query.SQL.Text := 'SELECT COUNT(*) FROM ThuThu WHERE SoDienThoai = :SoDienThoai';
      Query.ParamByName('SoDienThoai').AsWideString := Trim(edtSDTTT.Text);
      Query.Open;
      Count := Query.Fields[0].AsInteger;
      Query.Close;
      if Count > 0 then
      begin
        ShowMessage('Số điện thoại này đã tồn tại. Vui lòng sử dụng số khác.');
        edtSDTTT.SetFocus;
        Result := False;
        Exit;
      end;
    finally
      Query.Free;
    end;
  end;
end;

end.
