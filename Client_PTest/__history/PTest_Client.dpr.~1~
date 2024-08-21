program PTest_Client;

uses
  midaslib,
  System.StartUpCopy,
  FMX.Forms,
  Main_PTest in 'Main_PTest.pas' {Form1},
  ClientModule_PTest in 'ClientModule_PTest.pas' {ClientModule1: TDataModule},
  ClientClasses_PTest in 'ClientClasses_PTest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TForm1, Form1);
//  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
