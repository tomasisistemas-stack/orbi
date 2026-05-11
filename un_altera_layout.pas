unit Un_altera_layout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, Menus, ExtCtrls, Buttons, IniFiles,
  sListBox, sPanel, sBitBtn;

type
  TfmAlterarLayout = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    BtnOk: TsBitBtn;
    ListBox1: TsListBox;
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAlterarLayout: TfmAlterarLayout;
  CaminhoDasSkins: string;
  ss: string;

implementation

uses UnPri, Un_dao;

{$R *.dfm}

procedure TfmAlterarLayout.ListBox1Click(Sender: TObject);
var
  i: integer;
begin
  i := ListBox1.ItemIndex;
  if i = 0 then
  begin
    dao.SkinData1.Active := false;
    exit;
  end;
  dao.SkinData1.SkinDirectory := CaminhoDasSkins;
  dao.SkinData1.SkinName := ListBox1.items.strings[i];
  if not dao.SkinData1.Active then
    dao.SkinData1.Active := True;
end;

procedure TfmAlterarLayout.FormCreate(Sender: TObject);
var
  Procurar: TSearchRec;
  Arquivos: Integer;
  skins: TStringList;
  x: integer;
begin
  skins := TStringList.Create;
  CaminhoDasSkins := ExtractFilePath(Application.ExeName) + 'skin\';
  dao.SkinData1.Active := true;
  dao.SkinData1.GetSkinNames(skins);
  ListBox1.Items.Clear;
  ListBox1.Items.Add('Nenhum');
  for x := 0 to skins.Count - 1 do
  begin
    ListBox1.Items.Add(skins[x]);
  end;
  dao.SkinData1.Active := false;
  if dao.skin <> '' then
    dao.SkinData1.Active := true;
  skins.Free;
end;

procedure TfmAlterarLayout.BtnOkClick(Sender: TObject);
var
  Ini: TIniFile;
  Path, nfe: string;
begin
  Path := extractFilePath(application.ExeName);
  Ini := TIniFile.Create(Path + 'servidor.ini');
  try
    if Listbox1.ItemIndex = 0 then
    begin
      Ini.WriteString('config', 'skin', '');
      Ini.WriteString('config', 'skinPath', '');
    end
    else
    begin
      Ini.WriteString('config', 'skin', dao.SkinData1.SkinName);
      Ini.WriteString('config', 'skinPath', dao.SkinData1.SkinDirectory);
    end;
  finally
    Ini.Free;
  end;

end;

end.

