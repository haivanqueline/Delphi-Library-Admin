unit uAdminLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrmAdminLogin = class(TForm)
    lblTenDangNhap: TLabel;
    edtTenDangNhap: TEdit;
    lblMatKhauAdmin: TLabel;
    edtMatKhauAdmin: TEdit;
    btnAdminLogin: TBitBtn;
    btnAdminThoat: TBitBtn;
    Label1: TLabel;
    imgLogo: TImage;
    pnlHeader: TPanel;
    pnlMain: TPanel;
    procedure btnAdminThoatClick(Sender: TObject);
    procedure btnAdminLoginClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmAdminLogin: TfrmAdminLogin;

implementation

{$R *.dfm}

uses UnitAdminDM, uPasswordUtils, UnitAdminMain, uDoiMatKhau, System.NetEncoding;


procedure TfrmAdminLogin.btnAdminLoginClick(Sender: TObject);
var
  UserInput, MatKhauNhap, MatKhauDBHash: string;
  Salt: TBytes;
  ThuThuID: Integer;
  HoTenAdmin, TenVaiTroAdmin: string;
  VaiTroAdmin: Integer;
  LanDauDangNhap: Boolean;
begin
  UserInput := Trim(edtTenDangNhap.Text);
  MatKhauNhap := edtMatKhauAdmin.Text;

  // Kiểm tra nhập liệu cơ bản
  if (UserInput = '') or (MatKhauNhap = '') then
  begin
    ShowMessage('Vui lòng nhập đầy đủ Tên đăng nhập và Mật khẩu.');
    Exit;
  end;

  // Thực thi Query kiểm tra đăng nhập
  try
    DM_Admin.FDQuery_AdminLogin.Close;
    DM_Admin.FDQuery_AdminLogin.Params.ParamByName('UserInput').AsString := UserInput;
    DM_Admin.FDQuery_AdminLogin.Open;

    if DM_Admin.FDQuery_AdminLogin.RecordCount = 1 then
    begin
      MatKhauDBHash := DM_Admin.FDQuery_AdminLogin.FieldByName('MatKhau').AsString;
      // Lấy salt từ cơ sở dữ liệu
      if DM_Admin.FDQuery_AdminLogin.FieldByName('Salt').IsNull then
      begin
        ShowMessage('Tài khoản chưa được cập nhật bảo mật mới. Vui lòng đổi mật khẩu.');
        Exit;
      end;
      Salt := TNetEncoding.Base64.DecodeStringToBytes(DM_Admin.FDQuery_AdminLogin.FieldByName('Salt').AsString);

      // Xác minh mật khẩu
      if TPasswordUtils.VerifyPassword(MatKhauNhap, MatKhauDBHash, Salt) then
      begin
        // Lấy thông tin người dùng
        ThuThuID := DM_Admin.FDQuery_AdminLogin.FieldByName('ID').AsInteger;
        HoTenAdmin := DM_Admin.FDQuery_AdminLogin.FieldByName('HoTen').AsString;
        VaiTroAdmin := DM_Admin.FDQuery_AdminLogin.FieldByName('VaiTro').AsInteger;
        TenVaiTroAdmin := DM_Admin.FDQuery_AdminLogin.FieldByName('TenVaiTro').AsString;
        LanDauDangNhap := DM_Admin.FDQuery_AdminLogin.FieldByName('LanDauDangNhap').AsBoolean;

        if LanDauDangNhap then
        begin
          // Hiển thị form đổi mật khẩu
          frmDoiMatKhau := TfrmDoiMatKhau.Create(nil);
          try
            frmDoiMatKhau.ThuThuID := ThuThuID;
            if frmDoiMatKhau.ShowModal = mrOk then
            begin
              ShowMessage('Vui lòng đăng nhập lại với mật khẩu mới.');
              edtTenDangNhap.Clear;
              edtMatKhauAdmin.Clear;
              edtTenDangNhap.SetFocus;
            end
            else
            begin
              ShowMessage('Bạn đã hủy đổi mật khẩu. Vui lòng đăng nhập lại và đổi mật khẩu.');
              edtTenDangNhap.Clear;
              edtMatKhauAdmin.Clear;
              edtTenDangNhap.SetFocus;
            end;
          finally
            frmDoiMatKhau.Free;
          end;
        end
        else
        begin
          ShowMessage('Đăng nhập thành công! Chào mừng ' + HoTenAdmin);

          if not Assigned(frmAdminMain) then
            Application.CreateForm(TfrmAdminMain, frmAdminMain);
          frmAdminMain.Admin_ThuThuID := ThuThuID;
          frmAdminMain.Admin_HoTen := HoTenAdmin;
          frmAdminMain.Admin_VaiTro := VaiTroAdmin;
          frmAdminMain.Admin_TenVaiTro := TenVaiTroAdmin;
          frmAdminMain.Show;
          Self.Hide;
        end;
      end
      else
      begin
        ShowMessage('Mật khẩu không chính xác.');
        edtMatKhauAdmin.Clear;
        edtMatKhauAdmin.SetFocus;
      end;
    end
    else
    begin
      ShowMessage('Tên đăng nhập hoặc mật khẩu không đúng hoặc tài khoản chưa được kích hoạt.');
      edtTenDangNhap.Clear;
      edtMatKhauAdmin.Clear;
      edtTenDangNhap.SetFocus;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Lỗi khi đăng nhập: ' + E.Message);
    end;
  end;
end;

procedure TfrmAdminLogin.btnAdminThoatClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
