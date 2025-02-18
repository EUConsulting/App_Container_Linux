unit DataModule_Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.Phys.IBBase, FireDAC.Moni.Base, FireDAC.Moni.FlatFile;

type
  TDM_Connection = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDManager1: TFDManager;
    FDConn_Sql: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConn_SqlError(ASender, AInitiator: TObject;
      var AException: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Connection: TDM_Connection;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDM_Connection.DataModuleCreate(Sender: TObject);
begin

  FDConn_Sql.Connected := True;

end;

procedure TDM_Connection.FDConn_SqlError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  writeln('Errore su FDConnection');
  writeln(AException.Message);
end;

end.
