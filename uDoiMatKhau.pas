unit uDoiMatKhau;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDoiMatKhau = class(TForm)
    Label2: TLabel;
    lblMatKhauMoi: TLabel;
    lblXacNhanMatKhauMoi: TLabel;
    edtMatKhauMoi: TEdit;
    edtXacNhanMatKhau: TEdit;
    btnXacNhan: TButton;
    btnHuy: TButton;
    procedure btnXacNhanClick(Sender: TObject);
    procedure btnHuyClick(Sender: TObject);
  private
    FThuThuID: Integer;
  public
    property ThuThuID: Integer read FThuThuID write FThuThuID;
  end;

var
  frmDoiMatKhau: TfrmDoiMatKhau;

implementation

{$R *.dfm}

uses
  UnitAdminDM, System.Hash, System.NetEncoding, uPasswordUtils,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Phys,
  Data.DB; // Thêm unit Data.DB để khai báo ftString, ftInteger, ptInput

procedure TfrmDoiMatKhau.btnHuyClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDoiMatKhau.btnXacNhanClick(Sender: TObject);
var
  MatKhauMoi, XacNhanMatKhau: string;
  MatKhauMoiHash: string;
  Salt: TBytes;
  Query: TFDQuery;
begin
  MatKhauMoi := Trim(edtMatKhauMoi.Text);
  XacNhanMatKhau := Trim(edtXacNhanMatKhau.Text);

  // Kiểm tra nhập liệu
  if (MatKhauMoi = '') or (XacNhanMatKhau = '') then
  begin
    ShowMessage('Vui lòng nhập đầy đủ mật khẩu mới và xác nhận mật khẩu.');
    Exit;
  end;

  if MatKhauMoi <> XacNhanMatKhau then
  begin
    ShowMessage('Mật khẩu mới và xác nhận mật khẩu không khớp.');
    Exit;
  end;

  // Kiểm tra độ dài mật khẩu (tối thiểu 6 ký tự)
  if Length(MatKhauMoi) < 6 then
  begin
    ShowMessage('Mật khẩu mới phải có ít nhất 6 ký tự.');
    Exit;
  end;

  // Băm mật khẩu mới và tạo salt
  MatKhauMoiHash := TPasswordUtils.GenerateHashedPassword(MatKhauMoi, Salt);

  // Cập nhật mật khẩu và salt vào bảng ThuThu
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    try
      Query.SQL.Text :=
        'UPDATE ThuThu ' +
        'SET MatKhau = :MatKhau, Salt = :Salt, LanDauDangNhap = 0 ' +
        'WHERE ID = :ThuThuID';
      Query.Params.CreateParam(ftString, 'MatKhau', ptInput);
      Query.Params.CreateParam(ftString, 'Salt', ptInput);
      Query.Params.CreateParam(ftInteger, 'ThuThuID', ptInput);
      Query.ParamByName('MatKhau').AsString := MatKhauMoiHash;
      Query.ParamByName('Salt').AsString := TNetEncoding.Base64.EncodeBytesToString(Salt);
      Query.ParamByName('ThuThuID').AsInteger := ThuThuID;
      Query.ExecSQL;

      ShowMessage('Đổi mật khẩu thành công! Vui lòng đăng nhập lại.');
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        ShowMessage('Lỗi khi đổi mật khẩu: ' + E.Message);
        Exit;
      end;
    end;
  finally
    Query.Free;
  end;
end;


end.
