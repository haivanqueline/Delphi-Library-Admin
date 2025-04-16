program AdminApp;

uses
  Vcl.Forms,
  UnitAdminMain in 'UnitAdminMain.pas' {frmAdminMain},
  UnitAdminDM in 'UnitAdminDM.pas' {DM_Admin: TDataModule},
  uAdminLogin in 'uAdminLogin.pas' {frmAdminLogin},
  uDoiMatKhau in 'uDoiMatKhau.pas' {frmDoiMatKhau},
  uThemSuaTaiLieu in 'uThemSuaTaiLieu.pas' {frmThemSuaTaiLieu},
  uThemSuaThuThu in 'uThemSuaThuThu.pas' {frmThemSuaThuThu},
  uPhanQuyen in 'uPhanQuyen.pas' {frmPhanQuyen},
  uAdminDoiMK in 'uAdminDoiMK.pas' {frmAdminDoiMK},
  uPasswordUtils in 'uPasswordUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAdminLogin, frmAdminLogin);
  Application.CreateForm(TfrmAdminMain, frmAdminMain);
  Application.CreateForm(TDM_Admin, DM_Admin);
  Application.CreateForm(TfrmDoiMatKhau, frmDoiMatKhau);
  Application.CreateForm(TfrmThemSuaTaiLieu, frmThemSuaTaiLieu);
  Application.CreateForm(TfrmThemSuaThuThu, frmThemSuaThuThu);
  Application.CreateForm(TfrmPhanQuyen, frmPhanQuyen);
  Application.CreateForm(TfrmAdminDoiMK, frmAdminDoiMK);
  Application.Run;
end.
