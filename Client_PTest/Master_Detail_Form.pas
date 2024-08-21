unit Master_Detail_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFMasterDetail = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    DSP_Detail2: TDSProviderConnection;
    Cds_Detail2: TClientDataSet;
    DSP_Detail1: TDSProviderConnection;
    DS_Detail1: TDataSource;
    Cds_Detail1: TClientDataSet;
    DSP_Master: TDSProviderConnection;
    DS_Master: TDataSource;
    Cds_Master: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMasterDetail: TFMasterDetail;

implementation

{$R *.fmx}

uses ClientClasses_PTest, ClientModule_PTest;

procedure TFMasterDetail.Button1Click(Sender: TObject);
begin
  Cds_Master.Active := True;
  Cds_Detail1.Active := True;
  Cds_Detail2.Active := True;
end;

procedure TFMasterDetail.Button2Click(Sender: TObject);
begin
  Cds_Master.Active := False;
  Cds_Detail1.Active := False;
  Cds_Detail2.Active := False;

end;

end.
