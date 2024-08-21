unit Cuncurrence_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.Controls, FMX.StdCtrls, FMX.Layouts,
  Fmx.Bind.Navigator, FMX.ScrollBox, FMX.Grid, FMX.Controls.Presentation,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, Datasnap.DBClient, Datasnap.DSConnect;

type
  TFCuncurrence = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    ToolBar2: TToolBar;
    BindNavigator1: TBindNavigator;
    Btn_Close: TButton;
    Btn_Open: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    DSP_PTest: TDSProviderConnection;
    Cds_PTEst: TClientDataSet;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure Btn_OpenClick(Sender: TObject);
    procedure Btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCuncurrence: TFCuncurrence;

implementation

{$R *.fmx}

procedure TFCuncurrence.Btn_CloseClick(Sender: TObject);
begin
  Cds_PTEst.Active := false;

end;

procedure TFCuncurrence.Btn_OpenClick(Sender: TObject);
begin
  Cds_PTEst.Active := false;
  Cds_PTEst.Active := true;

end;

end.
