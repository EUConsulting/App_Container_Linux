unit ServerMethods_PTest;

interface

uses System.SysUtils, System.Classes, System.Json,
  DataSnap.DSProviderDataModuleAdapter,
  DataSnap.DSServer, DataSnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataSnap.Provider, FireDAC.UI.Intf,
  FireDAC.Phys.IBWrapper,
  FireDAC.Comp.UI, FireDAC.ConsoleUI.Wait, FireDAC.ConsoleUI.Script;

type
  TServerMethods1 = class(TDSServerModule)
    DataSetProvider1: TDataSetProvider;
    FDQuery1: TFDQuery;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    FDGUIxScriptDialog1: TFDGUIxScriptDialog;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure FDQuery1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery1ExecuteError(ASender: TObject; ATimes, AOffset: LongInt;
      AError: EFDDBEngineException; var AAction: TFDErrorAction);
    procedure FDGUIxErrorDialog1Show(ASender: TObject;
      AException: EFDDBEngineException);
    procedure FDGUIxErrorDialog1Hide(ASender: TObject;
      AException: EFDDBEngineException);
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

uses System.StrUtils, DataModule_Connection;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  // imposta la connection a runtime
  FDQuery1.Connection := DM_Connection.FDConn_Sql;

end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

procedure TServerMethods1.FDGUIxErrorDialog1Hide(ASender: TObject;
  AException: EFDDBEngineException);
begin
  writeln(AException.Message);

end;

procedure TServerMethods1.FDGUIxErrorDialog1Show(ASender: TObject;
  AException: EFDDBEngineException);
begin
  writeln(AException.Message);
end;

procedure TServerMethods1.FDQuery1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin

  if AException is EFDDBArrayExecuteError then
  begin
    // Check EFDDBArrayExecuteError(AException).Exception for original
    // EFDDBEngineException exception object.

    // Fix bad value

    writeln('Errore ExecuteError');
    writeln(AException.Message);
    // Ask to retry last operation
    EFDDBArrayExecuteError(AException).Action := eaFail;
    // Possible values:
    // eaApplied - skip row, but add +1 to the number of updated records
    // eaSkip - just skip this row
    // eaRetry - retry this row
    // eaFail = eaDefault - just raise original exception
    // eaExitSuccess - exit from Execute
    // eaExitFailure - exit from Execute, and do something other
  end;

  if AException is EFDDBEngineException then
  begin
    writeln('Errore EngineException');
    writeln(AException.Message);
  end;

  if AException is EFDDBArrayExecuteError then
  begin
    writeln('Errore ArrayExecuteError');
    writeln(AException.Message);
  end;


end;

procedure TServerMethods1.FDQuery1ExecuteError(ASender: TObject;
  ATimes, AOffset: LongInt; AError: EFDDBEngineException;
  var AAction: TFDErrorAction);
begin
  writeln('Errore ONExecuteError');
  writeln(AError.Message);





end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.
