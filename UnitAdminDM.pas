unit UnitAdminDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM_Admin = class(TDataModule)
    FDConnectionAdmin: TFDConnection;
    FDQuery_AdminLogin: TFDQuery;
    FDQuery_QLTL: TFDQuery;
    DataSource_QLTL: TDataSource;
    FDQuery_QLSV: TFDQuery;
    DataSource_QLSV: TDataSource;
    FDQuery_QLTT: TFDQuery;
    DataSource_QLTT: TDataSource;
    FDQuery_DuyetMuon: TFDQuery;
    DataSource_DuyetMuon: TDataSource;
    FDQuery_UpdateDuyetMuon: TFDQuery;
    FDQuery_XacNhanMuon: TFDQuery;
    DataSource_XacNhanMuon: TDataSource;
    FDQuery_UpdateXacNhanMuon: TFDQuery;
    FDQuery_DuyetTra: TFDQuery;
    DataSource_DuyetTra: TDataSource;
    FDQuery_UpdateDuyetTra: TFDQuery;
    FDQuery_ThongKeTLMuonNhieu: TFDQuery;
    DataSource_ThongKeTLMuonNhieu: TDataSource;
    FDQuery_HuyYeuCauDaDuyet: TFDQuery;
    FDQuery_QuaHan: TFDQuery;
    DataSource_QuaHan: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Admin: TDM_Admin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
