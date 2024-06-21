program PTest_Server;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  ServerMethods_PTest in 'ServerMethods_PTest.pas' {ServerMethods1: TDSServerModule},
  ServerConst_PTest in 'ServerConst_PTest.pas',
  ServerContainer_PTest in 'ServerContainer_PTest.pas' {ServerContainer1: TDataModule},
  DataModule_Connection in 'DataModule_Connection.pas' {DM_Connection: TDataModule};

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.

