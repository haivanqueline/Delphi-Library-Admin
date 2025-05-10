unit uAdminDoiMK;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAdminDoiMK = class(TForm)
    Label1: TLabel;
    edtMatKhauCuAdmin: TEdit;
    Label2: TLabel;
    edtMatKhauMoiAdmin: TEdit;
    Label3: TLabel;
    edtXacNhanMKAdmin: TEdit;
    btnXacNhanDoiMK: TBitBtn;
    btnHuyDoiMK: TBitBtn;
    Label4: TLabel;
    pnlMain: TPanel;
    pnlHeader: TPanel;
    procedure btnXacNhanDoiMKClick(Sender: TObject);
  private
    { Private declarations }
    FCurrentUserID: Integer;
  public
    { Public declarations }
    property CurrentUserID: Integer read FCurrentUserID write FCurrentUserID;
  end;

var
  frmAdminDoiMK: TfrmAdminDoiMK;

implementation

{$R *.dfm}

uses
  UnitAdminDM, uPasswordUtils, FireDAC.Comp.Client, Data.DB, System.NetEncoding;



procedure TfrmAdminDoiMK.btnXacNhanDoiMKClick(Sender: TObject);
var
  MKCu, MKMoi, XacNhanMK, MKCuHash, MKMoiHash, MK_DB_Hash: string;
  Salt, StoredSalt: TBytes;
  Query: TFDQuery;
begin
  MKCu := Trim(edtMatKhauCuAdmin.Text);
  MKMoi := Trim(edtMatKhauMoiAdmin.Text);
  XacNhanMK := Trim(edtXacNhanMKAdmin.Text);

  // Kiểm tra nhập liệu
  if (MKCu = '') or (MKMoi = '') or (XacNhanMK = '') then
  begin
    ShowMessage('Vui lòng nhập đầy đủ thông tin mật khẩu.');
    Exit;
  end;
  if MKMoi <> XacNhanMK then
  begin
    ShowMessage('Mật khẩu mới và xác nhận mật khẩu không khớp.');
    edtXacNhanMKAdmin.SetFocus;
    Exit;
  end;
  if MKMoi = MKCu then
  begin
    ShowMessage('Mật khẩu mới phải khác mật khẩu cũ.');
    edtMatKhauMoiAdmin.SetFocus;
    Exit;
  end;
  if Length(MKMoi) < 6 then
  begin
    ShowMessage('Mật khẩu mới phải có ít nhất 6 ký tự.');
    Exit;
  end;

  // Lấy mật khẩu hash và salt hiện tại từ DB
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    try
      Query.SQL.Text := 'SELECT MatKhau, Salt FROM ThuThu WHERE ID = :ID';
      Query.ParamByName('ID').AsInteger := FCurrentUserID;
      Query.Open;
      if Query.IsEmpty then
      begin
        ShowMessage('Không tìm thấy thông tin người dùng.');
        Exit;
      end;
      MK_DB_Hash := Query.FieldByName('MatKhau').AsString;
      if Query.FieldByName('Salt').IsNull then
      begin
        ShowMessage('Tài khoản chưa được cập nhật bảo mật mới. Vui lòng liên hệ quản trị viên.');
        Exit;
      end;
      StoredSalt := TNetEncoding.Base64.DecodeStringToBytes(Query.FieldByName('Salt').AsString);
      Query.Close;

      // Xác minh mật khẩu cũ
      if not TPasswordUtils.VerifyPassword(MKCu, MK_DB_Hash, StoredSalt) then
      begin
        ShowMessage('Mật khẩu cũ không chính xác.');
        edtMatKhauCuAdmin.SetFocus;
        Exit;
      end;

      // Băm mật khẩu mới và tạo salt mới
      MKMoiHash := TPasswordUtils.GenerateHashedPassword(MKMoi, Salt);

      // Cập nhật mật khẩu mới và salt vào DB
      Query.SQL.Text := 'UPDATE ThuThu SET MatKhau = :MatKhauMoiHash, Salt = :Salt, LanDauDangNhap = 0, NgayCapNhat = GETDATE() WHERE ID = :ID';
      Query.ParamByName('MatKhauMoiHash').AsString := MKMoiHash;
      Query.ParamByName('Salt').AsString := TNetEncoding.Base64.EncodeBytesToString(Salt);
      Query.ParamByName('ID').AsInteger := FCurrentUserID;
      Query.ExecSQL;

      ShowMessage('Đổi mật khẩu thành công!');
      ModalResult := mrOk;
    except
      on E: Exception do
        ShowMessage('Lỗi khi cập nhật mật khẩu: ' + E.Message);
    end;
  finally
    Query.Free;
  end;
end;


end.
