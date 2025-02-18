unit Main_Menu_PTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus;

type
  TFMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainMenu: TFMainMenu;

implementation

{$R *.fmx}

uses Cuncurrence_Form, Master_Detail_Form;

procedure TFMainMenu.MenuItem2Click(Sender: TObject);
begin
  Application.CreateForm(TFCuncurrence, FCuncurrence);
  FCuncurrence.ShowModal;
  FCuncurrence.Free;
end;

procedure TFMainMenu.MenuItem3Click(Sender: TObject);
begin
  Application.CreateForm(TFMasterDetail, FMasterDetail);
  FMasterDetail.ShowModal;
  FMasterDetail.Free;

end;

end.
