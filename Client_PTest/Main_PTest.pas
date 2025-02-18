unit Main_PTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.DialogService,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, FMX.Controls.Presentation,
  FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, FMX.DateTimeCtrls, Data.Bind.Controls, FMX.Layouts,
  FMX.Bind.Navigator, FMX.Memo.Types, FMX.Memo, FMX.Edit, FMX.ListBox;

type
  TForm1 = class(TForm)
    Btn_Open: TButton;
    DSP_PTest: TDSProviderConnection;
    Cds_PTEst: TClientDataSet;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Splitter1: TSplitter;
    Btn_Close: TButton;
    Panel1: TPanel;
    BindNavigator1: TBindNavigator;
    Cds_PTEstPK_PROGRESSIVO: TIntegerField;
    Cds_PTEstK_TIPO_PRATICA: TSmallintField;
    Cds_PTEstKEY_ANNO: TSmallintField;
    Cds_PTEstKEY_PROGRESSIVO: TIntegerField;
    Cds_PTEstDATA_OP: TDateField;
    Cds_PTEstUTENTE: TStringField;
    Cds_PTEstFIRMA_UTENTE: TStringField;
    Cds_PTEstFIRMA_DIRIGENTE: TStringField;
    Cds_PTEstFIRMA_SUPERVISORE: TStringField;
    Cds_PTEstFK_UTENTE_RILEVATORE: TIntegerField;
    Cds_PTEstDATA_FIRMA_UTENTE: TSQLTimeStampField;
    Cds_PTEstDATA_FIRMA_DIRIGENTE: TSQLTimeStampField;
    Cds_PTEstDATA_FIRMA_SUPERVISORE: TSQLTimeStampField;
    Cds_PTEstQUALIFICA_TABELLA_VIEW: TStringField;
    Cds_PTEstFK_MOTIVI_NC: TIntegerField;
    Cds_PTEstFK_SMASTER: TIntegerField;
    Cds_PTEstFK_UOC: TIntegerField;
    Cds_PTEstFK_UOS: TIntegerField;
    Cds_PTEstFK_STATO_NC: TIntegerField;
    Cds_PTEstFK_DIRIGENTE_RESP: TIntegerField;
    Cds_PTEstFK_SUPERVISORE: TIntegerField;
    Cds_PTEstFK_REFQUAL: TIntegerField;
    Cds_PTEstFIRMA_REFQUAL: TStringField;
    Cds_PTEstDATA_FIRMA_REFQUAL: TSQLTimeStampField;
    Cds_PTEstTIPO_PRATICA: TStringField;
    Cds_PTEstDESCRIZIONE: TStringField;
    Cds_PTEstTOTALE_PROROGHE: TStringField;
    Panel2: TPanel;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DSProviderConnection1: TDSProviderConnection;
    DSProviderConnection2: TDSProviderConnection;
    DSProviderConnection3: TDSProviderConnection;
    ClientDataSet1PK_PROGRESSIVO: TIntegerField;
    ClientDataSet1FK_MACROGRUPPO: TIntegerField;
    ClientDataSet1FLAG_ATTIVO: TStringField;
    ClientDataSet1NOTE: TStringField;
    ClientDataSet1DEFINIZIONE_RICLASSIFICATO: TStringField;
    ClientDataSet1NSAL_UFFICIALI: TSmallintField;
    ClientDataSet1NSAL_INTERNI: TSmallintField;
    ClientDataSet2PK_PROGRESSIVO: TIntegerField;
    ClientDataSet2FK_PARAM_PROGETTO: TIntegerField;
    ClientDataSet2FK_TIPO_COSTO: TIntegerField;
    ClientDataSet2FLAG_ATTIVO: TStringField;
    ClientDataSet2DATA_IN: TDateField;
    ClientDataSet2DATA_FI: TDateField;
    ClientDataSet2BUDGET: TFloatField;
    ClientDataSet2BUDGET_UTILIZZATO: TFloatField;
    ClientDataSet2QUOTA_DETRAIBILE: TSingleField;
    ClientDataSet2BUDGET_TMP_CALCOLI: TFloatField;
    ClientDataSet2GG_TMP: TIntegerField;
    ClientDataSet2BUDGET_GG_TMP: TFloatField;
    ClientDataSet2DATA_IN_TMP: TDateField;
    ClientDataSet2FK_ANAG: TIntegerField;
    ClientDataSet3PK_PROGRESSIVO: TIntegerField;
    ClientDataSet3FK_PARAM_PROGETTO_DETAIL: TIntegerField;
    ClientDataSet3FLAG_ATTIVO: TStringField;
    ClientDataSet3DATA_IN: TDateField;
    ClientDataSet3DATA_FI: TDateField;
    ClientDataSet3BUDGET: TFloatField;
    ClientDataSet3BUDGET_UTILIZZATO: TFloatField;
    ClientDataSet3FK_ANAG: TIntegerField;
    ClientDataSet3FLAG_EMAIL: TStringField;
    ClientDataSet3GG_ALLERT: TSmallintField;
    BindSourceDB2: TBindSourceDB;
    BindSourceDB3: TBindSourceDB;
    BindSourceDB4: TBindSourceDB;
    Button2: TButton;
    Button3: TButton;
    ClientDataSet3_NoDs: TClientDataSet;
    ClientDataSet3_NoDsPK_PROGRESSIVO: TIntegerField;
    ClientDataSet3_NoDsFK_PARAM_PROGETTO_DETAIL: TIntegerField;
    ClientDataSet3_NoDsFLAG_ATTIVO: TStringField;
    ClientDataSet3_NoDsDATA_IN: TDateField;
    ClientDataSet3_NoDsDATA_FI: TDateField;
    ClientDataSet3_NoDsBUDGET: TFloatField;
    ClientDataSet3_NoDsBUDGET_UTILIZZATO: TFloatField;
    ClientDataSet3_NoDsFK_ANAG: TIntegerField;
    ClientDataSet3_NoDsFLAG_EMAIL: TStringField;
    ClientDataSet3_NoDsGG_ALLERT: TSmallintField;
    BindSourceDB4_NoDs: TBindSourceDB;
    Button4: TButton;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    BindNavigator2: TBindNavigator;
    Panel4: TPanel;
    Splitter3: TSplitter;
    Splitter2: TSplitter;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    StatusBar3: TStatusBar;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button5: TButton;
    BindSourceDB5: TBindSourceDB;
    BindSourceDB6: TBindSourceDB;
    BindSourceDB7: TBindSourceDB;
    ClientDataSet4: TClientDataSet;
    ClientDataSet5: TClientDataSet;
    ClientDataSet6: TClientDataSet;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ClientDataSet4PK_PROGRESSIVO: TIntegerField;
    ClientDataSet4FK_MACROGRUPPO: TIntegerField;
    ClientDataSet4FLAG_ATTIVO: TStringField;
    ClientDataSet4NOTE: TStringField;
    ClientDataSet4DEFINIZIONE_RICLASSIFICATO: TStringField;
    ClientDataSet4NSAL_UFFICIALI: TSmallintField;
    ClientDataSet4NSAL_INTERNI: TSmallintField;
    ClientDataSet5PK_PROGRESSIVO: TIntegerField;
    ClientDataSet5FK_PARAM_PROGETTO: TIntegerField;
    ClientDataSet5FK_TIPO_COSTO: TIntegerField;
    ClientDataSet5FLAG_ATTIVO: TStringField;
    ClientDataSet5DATA_IN: TDateField;
    ClientDataSet5DATA_FI: TDateField;
    ClientDataSet5BUDGET: TFloatField;
    ClientDataSet5BUDGET_UTILIZZATO: TFloatField;
    ClientDataSet5QUOTA_DETRAIBILE: TSingleField;
    ClientDataSet5BUDGET_TMP_CALCOLI: TFloatField;
    ClientDataSet5GG_TMP: TIntegerField;
    ClientDataSet5BUDGET_GG_TMP: TFloatField;
    ClientDataSet5DATA_IN_TMP: TDateField;
    ClientDataSet5FK_ANAG: TIntegerField;
    ClientDataSet6PK_PROGRESSIVO: TIntegerField;
    ClientDataSet6FK_PARAM_PROGETTO_DETAIL: TIntegerField;
    ClientDataSet6FLAG_ATTIVO: TStringField;
    ClientDataSet6DATA_IN: TDateField;
    ClientDataSet6DATA_FI: TDateField;
    ClientDataSet6BUDGET: TFloatField;
    ClientDataSet6BUDGET_UTILIZZATO: TFloatField;
    ClientDataSet6FK_ANAG: TIntegerField;
    ClientDataSet6FLAG_EMAIL: TStringField;
    ClientDataSet6GG_ALLERT: TSmallintField;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    LinkFillControlToField: TLinkFillControlToField;
    DSProviderConnection4: TDSProviderConnection;
    ClientDataSet7: TClientDataSet;
    ClientDataSet7PK_1: TIntegerField;
    ClientDataSet7PK_2: TIntegerField;
    ClientDataSet7PK_3: TIntegerField;
    BindSourceDB8: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    Cds_Master: TClientDataSet;
    DSP_Master: TDSProviderConnection;
    Cds_Detail1: TClientDataSet;
    DSP_Detail1: TDSProviderConnection;
    Cds_Detail2: TClientDataSet;
    DSP_Detail2: TDSProviderConnection;
    DS_Master: TDataSource;
    DS_Detail1: TDataSource;
    BindSourceDB9: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB9: TLinkGridToDataSource;
    BindSourceDB10: TBindSourceDB;
    BindSourceDB11: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB11: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceDB10: TLinkGridToDataSource;
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_OpenClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LinkGridToDataSourceBindSourceDB4EvalError(Sender: TObject;
      AException: Exception);
    procedure LinkGridToDataSourceBindSourceDB3EvalError(Sender: TObject;
      AException: Exception);
    procedure LinkGridToDataSourceBindSourceDB2EvalError(Sender: TObject;
      AException: Exception);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cds_param: boolean;

implementation

{$R *.fmx}

uses ClientModule_PTest;

procedure TForm1.Btn_CloseClick(Sender: TObject);
begin
  Cds_PTEst.Active := false;

end;

procedure TForm1.Btn_OpenClick(Sender: TObject);
begin
  Cds_PTEst.Active := false;
  Cds_PTEst.Active := true;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Active := false;
  ClientDataSet2.Active := false;
  ClientDataSet3.Active := false;
  ClientDataSet4.Active := true;
  ClientDataSet5.Active := true;
  ClientDataSet6.Active := true;
  ClientDataSet7.Active := true;
  ClientDataSet7.insert;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  Cds_Master.Active := False;
  Cds_Detail1.Active := False;
  Cds_Detail2.Active := False;
  Cds_Master.Active := True;
  Cds_Detail1.Active := True;
  Cds_Detail2.Active := True;



  ClientDataSet4.Active := false;
  ClientDataSet5.Active := false;
  ClientDataSet6.Active := false;
  ClientDataSet7.Active := false;

  ClientDataSet1.Active := true;
  ClientDataSet2.Active := true;

  if cds_param then
  begin
    ClientDataSet3_NoDs.Active := false;
    ClientDataSet3_NoDs.ParamByName('fk_value').AsInteger :=
    ClientDataSet2PK_PROGRESSIVO.Value;
    ClientDataSet3_NoDs.Active := true;
  end
  else
    ClientDataSet3.Active := true;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  cds_param := true;
  ClientDataSet3.Active := false;
  ClientDataSet2.Active := false;
  ClientDataSet1.Active := false;
//  LinkGridToDataSourceBindSourceDB4.DataSource := BindSourceDB4_NoDs;
  {
    ClientDataSet3.MasterSource := nil;
    ClientDataSet3.MasterFields.Empty;
    ClientDataSet3.IndexFieldNames.Empty;
    ClientDataSet3.CommandText := '';
    ClientDataSet3.Params.AddParameter;
    ClientDataSet3.Params[0].Name := 'fk_value';
    ClientDataSet3.Params[0].DataType := ftInteger;
    ClientDataSet3.Params[0].ParamType := ptInput;
  }
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ClientDataSet3_NoDs.Active := false;
  ClientDataSet3.Active := false;
  ClientDataSet2.Active := false;
  ClientDataSet1.Active := false;
//  LinkGridToDataSourceBindSourceDB4.DataSource := BindSourceDB4;
  cds_param := False;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ClientDataSet4.Active := false;
  ClientDataSet5.Active := false;
  ClientDataSet6.Active := false;

end;

procedure TForm1.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  if cds_param then
  begin

    ClientDataSet3_NoDs.Active := false;
    ClientDataSet3_NoDs.ParamByName('fk_value').AsInteger :=
    ClientDataSet2PK_PROGRESSIVO.Value;
    ClientDataSet3_NoDs.Active := true;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cds_param := false;
end;

procedure TForm1.LinkGridToDataSourceBindSourceDB2EvalError(Sender: TObject;
  AException: Exception);
begin
  TDialogService.ShowMessage(Format(AException.Message, ['']));

end;

procedure TForm1.LinkGridToDataSourceBindSourceDB3EvalError(Sender: TObject;
  AException: Exception);
begin
  TDialogService.ShowMessage(Format(AException.Message, ['']));

end;

procedure TForm1.LinkGridToDataSourceBindSourceDB4EvalError(Sender: TObject;
  AException: Exception);
begin
  TDialogService.ShowMessage(Format(AException.Message, ['']));
end;

end.
