unit ServerContainer_PTest;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSProxyJavaScript,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth, Datasnap.DSMetadata,
  FireDAC.Comp.Client,
  Datasnap.DSServerMetadata;

type
  TServerContainer1 = class(TDataModule)
    DSServer1: TDSServer;
    DSHTTPService1: TDSHTTPService;
    DSAuthenticationManager1: TDSAuthenticationManager;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    DSHTTPServiceFileDispatcher1: TDSHTTPServiceFileDispatcher;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

uses
  ServerConst_PTest,
  ServerMethods_PTest, DataModule_Connection;

procedure TServerContainer1.DataModuleCreate(Sender: TObject);
begin
  // write the JavaScript proxy on startup
  DSProxyGenerator1.Write;
end;

procedure TServerContainer1.DSServer1Error(DSErrorEventObject
  : TDSErrorEventObject);
begin
  writeln('DSServer Error');
  writeln(DSErrorEventObject.Error.Message);
end;

procedure TServerContainer1.DSServerClass1GetClass(DSServerClass
  : TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods_PTest.TServerMethods1;
end;

procedure TServerContainer1.DSAuthenticationManager1UserAuthenticate
  (Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter }
  valid := True;
end;

procedure TServerContainer1.DSAuthenticationManager1UserAuthorize
  (Sender: TObject; EventObject: TDSAuthorizeEventObject; var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;
end;

function BindPort(Aport: Integer): Boolean;
var
  LTestServer: IIPTestServer;
begin
  Result := True;
  try
    LTestServer := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    LTestServer.TestOpenPort(Aport, nil);
  except
    Result := False;
  end;
end;

function CheckPort(Aport: Integer): Integer;
begin
  if BindPort(Aport) then
    Result := Aport
  else
    Result := 0;
end;

procedure SetPort(const Aserver: TServerContainer1; const Aport: string;
  AProtocol: DSProtocol);
var
  IsPortSet: Boolean;
begin
  IsPortSet := True;
  if not(Aserver.DSServer1.Started) then
  begin
    if CheckPort(Aport.ToInteger) > 0 then
    begin
      case AProtocol of
        // DSProtocol.TCPIP:
        // Aserver.DSTCPServerTransport1.Port := Aport.ToInteger;
        DSProtocol.HTTP:
          Aserver.DSHTTPService1.HttpPort := Aport.ToInteger;

      else
        IsPortSet := False
      end;
      if IsPortSet then
        writeln(Format(sPortSet, [Aport]))
      else
        writeln(Format(sPortNotSet, [Aport]));
    end
    else
      writeln(Format(sPortInUse, [Aport]));
  end
  else
    writeln(sServerRunning);
  Write(cArrow);

end;

procedure StartServer(const Aserver: TServerContainer1);
var
  LStart: Boolean;
begin
  LStart := True;
  if not(Aserver.DSServer1.Started) then
  begin
    {
      if CheckPort(Aserver.DSTCPServerTransport1.Port) <= 0 then
      begin
      writeln(Format(sPortInUse,
      [Aserver.DSTCPServerTransport1.Port.ToString]));
      LStart := False;
      end;
    }
    if CheckPort(Aserver.DSHTTPService1.HttpPort) <= 0 then
    begin
      writeln(Format(sPortInUse, [Aserver.DSHTTPService1.HttpPort.ToString]));
      LStart := False;
    end;
  end
  else
    writeln(sServerRunning);

  if LStart then
  begin
    writeln(sStartingServer);
    Aserver.DSServer1.Start;
  end;
  Write(cArrow);
end;

procedure StopServer(const Aserver: TServerContainer1);
begin
  if Aserver.DSServer1.Started then
  begin

    if DM_Connection.FDConn_Sql.Connected = True then
    begin
      try
        DM_Connection.FDConn_Sql.Connected := False;
      except
        writeln('Disconnect DB failed');
      end;
    end;

    writeln(sStoppingServer);
    Aserver.DSServer1.Stop;

    writeln(sServerStopped);
  end
  else
    writeln(sServerNotRunning);
  Write(cArrow);
end;

procedure WriteCommands;
begin
  writeln(sCommands);
  Write(cArrow);
end;

procedure WriteStatus(const Aserver: TServerContainer1);
begin
  writeln(sActive + Aserver.DSServer1.Started.ToString(TUseBoolStrs.True));
  // writeln(sTCPIPPort + Aserver.DSTCPServerTransport1.Port.ToString);
  writeln(sHTTPPort + Aserver.DSHTTPService1.HttpPort.ToString);

  Write(cArrow);
end;

procedure IB_Conn;
begin
  if DM_Connection.FDConn_Sql.Connected = True then
    DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDConn_Sql.ConnectionDefName := 'IB_PTest';
  DM_Connection.FDConn_Sql.Connected := True;
  if DM_Connection.FDConn_Sql.Connected = True then
  begin
    writeln('----Change DataBase ----');
    writeln('----Connect to IB    ----');
    writeln('----Driver         ----> ' +
      DM_Connection.FDConn_Sql.ConnectionDefName);
  end
  else
  begin
    writeln('----Connect to IB error ----');
  end;
end;

procedure MySQl_Conn;
begin
  if DM_Connection.FDConn_Sql.Connected = True then
    DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDConn_Sql.ConnectionDefName := 'MySQL_PTest';
  DM_Connection.FDConn_Sql.Connected := True;
  if DM_Connection.FDConn_Sql.Connected = True then
  begin
    writeln('----Change DataBase ----');
    writeln('----Connect to MySQL ----');
    writeln('----Driver         ----> ' +
      DM_Connection.FDConn_Sql.ConnectionDefName);
  end
  else
  begin
    writeln('----Connecty to MySQL error ----');
  end;

end;

procedure MySQl_Container_Conn;
begin
  if DM_Connection.FDConn_Sql.Connected = True then
    DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDConn_Sql.ConnectionDefName := 'MySQL_PTest';
  DM_Connection.FDConn_Sql.Connected := True;
  if DM_Connection.FDConn_Sql.Connected = True then
  begin
    writeln('----Change DataBase ----');
    writeln('----Connect to MySQL ----');
    writeln('----Driver         ----> ' +
      DM_Connection.FDConn_Sql.ConnectionDefName);

  end
  else
  begin
    writeln('----Connect to MySQL error ----');
  end;

end;

function trace_onoff(interruttore: Boolean): Boolean;
begin
  DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDMoniFlatFileClientLink1.Tracing := interruttore;
  DM_Connection.FDConn_Sql.Connected := True;
  if interruttore then
    writeln('Trace enabled')
  else
    writeln('Trace disabled');

end;

function datasnap_compatibility(interruttore: Boolean): Boolean;
begin
  DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDManager1.FormatOptions.DataSnapCompatibility := interruttore;
  DM_Connection.FDConn_Sql.Connected := True;
  if interruttore then
    writeln('FDManager DataSnap Compatibility enable')
  else
    writeln('FdManager DataSnap Compatibility disable');

  writeln('Result FDConnection DataSnap Compatibility := ' +
    BoolToStr(DM_Connection.FDConn_Sql.FormatOptions.DataSnapCompatibility));
end;

function ExecDirect_compatibility(interruttore: Boolean): Boolean;
begin
  DM_Connection.FDConn_Sql.Connected := False;
  DM_Connection.FDManager1.ResourceOptions.DirectExecute := interruttore;
  DM_Connection.FDConn_Sql.Connected := True;
  if interruttore then
    writeln('FDManager Direct Execute enable')
  else
    writeln('FdManager Direct Execute disable');

  writeln('Result FDConnection Direct Execute  := ' +
    BoolToStr(DM_Connection.FDConn_Sql.ResourceOptions.DirectExecute));
end;

function nconnessioni(fdmanager: TFDManager): Integer;
begin
  Result := fdmanager.ConnectionCount;
  writeln('Active Connect included APP Server : ' + inttostr(Result));
end;

procedure RunDSServer;
var
  LModule: TServerContainer1;
  LResponse: string;
begin
    DM_Connection := TDM_Connection.Create(nil);
  try

    if DM_Connection.FDConn_Sql.Connected = True then
      writeln(sConnOK)
    else
      writeln(sConnKO);

    if DM_Connection.FDConn_Sql.DriverName = 'IB' then
      writeln(cDatabase_IB)
    else
      writeln(cDatabase_MySQL);

    trace_onoff(False);

    LModule := TServerContainer1.Create(nil);

    try
      writeln('HttpServer is active ? ' +
        BoolToStr(LModule.DSHTTPService1.Active));

      if LModule.DSServer1.Started then
        writeln(sServerIsRunning);
      WriteCommands;
      while True do
      begin
        Readln(LResponse);
        LResponse := LowerCase(LResponse);
        if sametext(LResponse, cCommandStart) then
          StartServer(LModule)
        else if sametext(LResponse, cCommandStatus) then
          WriteStatus(LModule)
        else if sametext(LResponse, cCommandStop) then
          StopServer(LModule)
        else if LResponse.StartsWith(cCommandSetHTTPPort) then
          SetPort(LModule, LResponse.Replace(cCommandSetHTTPPort, '').Trim,
            DSProtocol.HTTP)
        else if sametext(LResponse, cCommandHelp) then
          WriteCommands
        else if sametext(LResponse, cCommandIb) then
          IB_Conn
        else if sametext(LResponse, cCommandMySQl) then
          MySQl_Conn
        else if sametext(LResponse, cCommandMySQl_Container) then
          MySQl_Container_Conn
        else if sametext(LResponse, cCommandTrace_True) then
          trace_onoff(True)
        else if sametext(LResponse, cCommandTrace_False) then
          trace_onoff(False)
        else if sametext(LResponse, cCommandConn_Attive) then
          nconnessioni(DM_Connection.FDManager1)
        else if sametext(LResponse, cDataSnap_True) then
          datasnap_compatibility(True)
        else if sametext(LResponse, cDataSnap_false) then
          datasnap_compatibility(False)
        else if sametext(LResponse, cExecDirect_True) then
          ExecDirect_compatibility(True)
        else if sametext(LResponse, cExecDirect_False) then
          ExecDirect_compatibility(False)
        else if sametext(LResponse, cCommandbye) then
        begin
          if LModule.DSServer1.Started then
          begin
            StopServer(LModule);
            break
          end
          else
          begin
            break
          end
        end
        else if sametext(LResponse, cCommandExit) then
          if LModule.DSServer1.Started then
          begin
            StopServer(LModule);
            break
          end
          else
          begin
            break
          end
        else
        begin
          writeln(sInvalidCommand);
          Write(cArrow);
        end;
      end;
    finally
      LModule.Free;
    end;
  finally
    // FreeAndNil(DM_Connection);
    // DM_Connection.Free;
  end;
end;

end.
