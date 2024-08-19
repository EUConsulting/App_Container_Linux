unit ClientModule_PTest;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap,
  Data.DBXCommon, Data.DbxHTTPLayer, Data.DB, Data.SqlExpr, IPPeerClient;

type
  TClientModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    { Private declarations }
  public
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;

  end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

procedure TClientModule1.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.Connected := True;
end;

procedure TClientModule1.DataModuleDestroy(Sender: TObject);
begin
  SQLConnection1.Connected := False;

end;

end.
