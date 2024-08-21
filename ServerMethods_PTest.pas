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
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    DataSetProvider4: TDataSetProvider;
    FDQuery2PK_PROGRESSIVO: TIntegerField;
    FDQuery2FK_MACROGRUPPO: TIntegerField;
    FDQuery2FLAG_ATTIVO: TStringField;
    FDQuery2NOTE: TStringField;
    FDQuery2DEFINIZIONE_RICLASSIFICATO: TStringField;
    FDQuery2NSAL_UFFICIALI: TSmallintField;
    FDQuery2NSAL_INTERNI: TSmallintField;
    FDQuery3PK_PROGRESSIVO: TIntegerField;
    FDQuery3FK_PARAM_PROGETTO: TIntegerField;
    FDQuery3FK_TIPO_COSTO: TIntegerField;
    FDQuery3FLAG_ATTIVO: TStringField;
    FDQuery3DATA_IN: TDateField;
    FDQuery3DATA_FI: TDateField;
    FDQuery3BUDGET: TFloatField;
    FDQuery3BUDGET_UTILIZZATO: TFloatField;
    FDQuery3QUOTA_DETRAIBILE: TSingleField;
    FDQuery3BUDGET_TMP_CALCOLI: TFloatField;
    FDQuery3GG_TMP: TIntegerField;
    FDQuery3BUDGET_GG_TMP: TFloatField;
    FDQuery3DATA_IN_TMP: TDateField;
    FDQuery3FK_ANAG: TIntegerField;
    FDQuery4PK_PROGRESSIVO: TIntegerField;
    FDQuery4FK_PARAM_PROGETTO_DETAIL: TIntegerField;
    FDQuery4FLAG_ATTIVO: TStringField;
    FDQuery4DATA_IN: TDateField;
    FDQuery4DATA_FI: TDateField;
    FDQuery4BUDGET: TFloatField;
    FDQuery4BUDGET_UTILIZZATO: TFloatField;
    FDQuery4FK_ANAG: TIntegerField;
    FDQuery4FLAG_EMAIL: TStringField;
    FDQuery4GG_ALLERT: TSmallintField;
    FDQuery5: TFDQuery;
    DataSetProvider5: TDataSetProvider;
    FDQuery5PK_1: TIntegerField;
    FDQuery5PK_2: TIntegerField;
    FDQuery5PK_3: TIntegerField;
    FDQ_Master: TFDQuery;
    DSP_Master: TDataSetProvider;
    FDQ_Detail1: TFDQuery;
    DSP_Detail1: TDataSetProvider;
    FDQ_Detail2: TFDQuery;
    DSP_Detail2: TDataSetProvider;
    FDQ_MasterPK_PRIMARY_KEY: TIntegerField;
    FDQ_MasterDESCRIPTION: TStringField;
    FDQ_Detail1PK_PRIMARY_KEY: TIntegerField;
    FDQ_Detail1FK_PRIMARY_KEY: TIntegerField;
    FDQ_Detail1DESCRIPTION_DETAIL1: TStringField;
    FDQ_Detail2PK_PRIMARY_KEY: TIntegerField;
    FDQ_Detail2FK_PRIMARY_KEY_DETAIL1: TIntegerField;
    FDQ_Detail2DESCRIPTION_DETAIL2: TStringField;
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
  FDQuery2.Connection := DM_Connection.FDConn_Sql;
  FDQuery3.Connection := DM_Connection.FDConn_Sql;
  FDQuery4.Connection := DM_Connection.FDConn_Sql;
  FDQuery5.Connection := DM_Connection.FDConn_Sql;
  FDQ_Master.Connection := DM_Connection.FDConn_Sql;
  FDQ_Detail1.Connection := DM_Connection.FDConn_Sql;
  FDQ_Detail2.Connection := DM_Connection.FDConn_Sql;

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
