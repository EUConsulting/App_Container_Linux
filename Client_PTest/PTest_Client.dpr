program PTest_Client;

uses
  midaslib,
  System.StartUpCopy,
  FMX.Forms,
  Main_PTest in 'Main_PTest.pas' {Form1},
  ClientModule_PTest in 'ClientModule_PTest.pas' {ClientModule1: TDataModule},
  ClientClasses_PTest in 'ClientClasses_PTest.pas',
  Master_Detail_Form in 'Master_Detail_Form.pas' {FMasterDetail},
  Cuncurrence_Form in 'Cuncurrence_Form.pas' {FCuncurrence},
  Main_Menu_PTest in 'Main_Menu_PTest.pas' {FMainMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TFMainMenu, FMainMenu);
  //  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
