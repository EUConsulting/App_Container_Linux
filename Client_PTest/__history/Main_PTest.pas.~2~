unit Main_PTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, FMX.Controls.Presentation,
  FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, FMX.DateTimeCtrls, Data.Bind.Controls, FMX.Layouts,
  Fmx.Bind.Navigator, FMX.Memo.Types, FMX.Memo, FMX.Edit;

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
    Label1: TLabel;
    Panel1: TPanel;
    BindNavigator1: TBindNavigator;
    ToolBar1: TToolBar;
    TEd_Start: TTimeEdit;
    TEd_Stop: TTimeEdit;
    Label2: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
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
    procedure Btn_CloseClick(Sender: TObject);
    procedure Btn_OpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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
  TEd_Start.Time := now;
  Cds_PTEst.Active := true;
  TEd_Stop.Time := now;

end;

end.
