unit uSessionManager;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client, UnitAdminDM, System.Classes;

type
  TSessionManager = class
  private
    FThuThuID: Integer;
    FHoTen: string;
    FQuyenList: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadSession(ThuThuID: Integer);
    function HasPermission(MaQuyen: string): Boolean;
    property ThuThuID: Integer read FThuThuID;
    property HoTen: string read FHoTen;
  end;

var
  SessionManager: TSessionManager;

implementation

constructor TSessionManager.Create;
begin
  FThuThuID := -1;
  FHoTen := '';
  FQuyenList := TStringList.Create;
end;

destructor TSessionManager.Destroy;
begin
  FQuyenList.Free;
  inherited;
end;

procedure TSessionManager.LoadSession(ThuThuID: Integer);
var
  Query: TFDQuery;
begin
  FThuThuID := ThuThuID;
  FQuyenList.Clear;

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DM_Admin.FDConnectionAdmin;
    Query.SQL.Text := 'SELECT HoTen FROM ThuThu WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := ThuThuID;
    Query.Open;
    if not Query.IsEmpty then
      FHoTen := Query.FieldByName('HoTen').AsString
    else
      FHoTen := 'Unknown';
    Query.Close;

    Query.SQL.Text := 'SELECT MaQuyen FROM ThuThu_Quyen WHERE ThuThuID = :ThuThuID AND TrangThai = 1';
    Query.ParamByName('ThuThuID').AsInteger := ThuThuID;
    Query.Open;
    while not Query.Eof do
    begin
      FQuyenList.Add(Query.FieldByName('MaQuyen').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

function TSessionManager.HasPermission(MaQuyen: string): Boolean;
begin
  Result := FQuyenList.IndexOf(MaQuyen) >= 0;
end;

initialization
  SessionManager := TSessionManager.Create;

finalization
  SessionManager.Free;
end.
