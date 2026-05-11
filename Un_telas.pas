unit Un_telas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Buttons, DB,
  RxMemDS, DBCtrls, sPanel, sBitBtn, sLabel, sCheckBox, acDBGrid, sEdit,
  sMaskEdit, sCustomComboEdit, sTooledit, sComboEdit, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, VidGrab, IdFTPCommon, Vcl.FileCtrl, FlCtrlEx, Vcl.ComCtrls;

type
  TFr_telas = class(TForm)
    pncab: TsPanel;
    pnfile: TsPanel;
    Panel3: TsPanel;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    btok: TsBitBtn;
    mmLog: TRxMemoryData;
    dsLog: TDataSource;
    mmLogID: TIntegerField;
    mmLogLOGUSU: TStringField;
    mmLogDATA: TDateField;
    mmLogHORA: TTimeField;
    mmLogDESCRICAO: TBlobField;
    mmLogIP: TStringField;
    mmLogCOMPUTADOR: TStringField;
    cbMaquina: TComboBox;
    IdFTPTelas: TIdFTP;
    FileList: TFileListBoxEx;
    sPanel1: TsPanel;
    grbPlayerControl: TGroupBox;
    btnPlayerBackwards: TSpeedButton;
    btnPlayerPause: TSpeedButton;
    btnPlayerStop: TSpeedButton;
    btnPlayerStartPlaying: TSpeedButton;
    btnPlayerRewind: TSpeedButton;
    btnPlayerFastForward: TSpeedButton;
    btnPlayerFrameStep: TSpeedButton;
    tbrPlayerProgress: TTrackBar;
    Ed_Hr_ini: TMaskEdit;
    Ed_Hr_Fim: TMaskEdit;
    Eddt_Fim: TsDateEdit;
    EdDt_ini: TsDateEdit;
    video: TVideoGrabber;
    procedure FormShow(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FileListClick(Sender: TObject);
    procedure btnPlayerBackwardsClick(Sender: TObject);
    procedure btnPlayerPauseClick(Sender: TObject);
    procedure btnPlayerStopClick(Sender: TObject);
    procedure btnPlayerStartPlayingClick(Sender: TObject);
    procedure btnPlayerFrameStepClick(Sender: TObject);
    procedure btnPlayerRewindClick(Sender: TObject);
    procedure btnPlayerFastForwardClick(Sender: TObject);
  private
    procedure CarregaVideo(indice: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_telas: TFr_telas;
  dt_hr_ini, dt_hr_fim: Tdatetime;

implementation

uses un_dao, Un_localizar, unpri, un_splash;

{$R *.dfm}

procedure TFr_telas.CarregaVideo(indice: integer);
var
  x: integer;
  pasta: string;
  F: TSearchRec;
  Ret: integer;
begin
  Video.ClosePlayer;
  pasta := ExtractFilePath(Application.ExeName) + 'TelasExec\';

  if not DirectoryExists(pasta) then
    CreateDir(ExtractFilePath(Application.ExeName) + 'TelasExec\');

  Ret := FindFirst(pasta + '*.asf', faAnyFile, F);
  while Ret = 0 do
  begin
    DeleteFile(pasta + F.Name);
    Ret := FindNext(F);
  end;

  if not IdFTPTelas.connected then
  begin
    IdFTPTelas.Connect;
    IdFTPTelas.ChangeDir(cbMaquina.Items[cbMaquina.ItemIndex]);
  end;

  Video.Playlist (pl_Clear, '');
  for x := indice to FileList.items.Count-1 do
  begin
   IdFTPTelas.Get(FileList.Items[x], pasta + FileList.Items[x]);
   Video.Playlist (pl_Add, pasta + FileList.Items[x]);
  end;

  try
    pnfile.Visible := false;
    pncab.Visible := false;
    Video.Playlist (pl_Play, '');
  finally

    for x := indice to FileList.items.Count-1 do
      DeleteFile(pasta + FileList.Items[x]);

    IdFTPTelas.disconnect;
  end;
end;

procedure TFr_telas.btnPlayerBackwardsClick(Sender: TObject);
begin
  Video.RunPlayerBackwards;
end;

procedure TFr_telas.btnPlayerFastForwardClick(Sender: TObject);
begin
  Video.FastForwardPlayer;
end;

procedure TFr_telas.btnPlayerFrameStepClick(Sender: TObject);
begin
  Video.PlayerFrameStep(1);
end;

procedure TFr_telas.btnPlayerPauseClick(Sender: TObject);
begin
  Video.PausePlayer;
end;

procedure TFr_telas.btnPlayerRewindClick(Sender: TObject);
begin
  Video.RewindPlayer;
end;

procedure TFr_telas.btnPlayerStartPlayingClick(Sender: TObject);
begin
  pnfile.Visible := false;
  pncab.Visible := false;
  Video.RunPlayer;
end;

procedure TFr_telas.btnPlayerStopClick(Sender: TObject);
begin
  Video.StopPlayer;
  pnfile.Visible := true;
  pncab.Visible := true;
end;

procedure TFr_telas.btokClick(Sender: TObject);
var
  x: integer;
  dataarq: Tdatetime;
  ano, mes, dia, hor, min: string;
begin
  FileList.Clear;
  dt_hr_ini := EdDt_ini.Date + strtotime(Ed_Hr_ini.text);
  dt_hr_fim := Eddt_Fim.Date + strtotime(Ed_Hr_Fim.text);
  IdFTPTelas.Passive := true;
  IdFTPTelas.TransferType := ftBinary;
  if IdFTPTelas.connected then
    IdFTPTelas.disconnect;
  IdFTPTelas.Connect;
  IdFTPTelas.ChangeDir(cbMaquina.Items[cbMaquina.ItemIndex]);
  IdFTPTelas.list(nil, '*.asf');
  FileList.Clear;

  fm_splash.pgArquivos.Visible := true;
  fm_splash.lbArquivos.Visible := true;
  fm_splash.pgArquivos.MaxValue := IdFTPTelas.DirectoryListing.Count - 1;
  fm_splash.lbArquivos.Caption := 'Listando Arquivos...';
  fm_splash.lbStatus.Caption := '...';
  fm_splash.pgArquivos.Progress := 0;
  fm_splash.Show;

  for x := 0 to IdFTPTelas.DirectoryListing.Count - 1 do
  begin
    with IdFTPTelas.DirectoryListing.Items[x] do
    begin
      ano := copy(filename, 1, 4);
      mes := copy(filename, 6, 2);
      dia := copy(filename, 9, 2);
      hor := copy(filename, 12, 2);
      min := copy(filename, 15, 2);
      dataarq := strtodatetime(dia + '/' + mes + '/' + ano + ' ' + hor +
        ':' + min);

      if (dataarq >= dt_hr_ini) and (dataarq <= dt_hr_fim) then
      begin
        try
          FileList.Items.Add(filename);
        except
          // on E: Exception do LogErr(E.Message);
        end;
      end;
    end;
    fm_splash.pgArquivos.AddProgress(x);
    fm_splash.Refresh;
  end;
  IdFTPTelas.disconnect;
  fm_splash.Close;
end;

procedure TFr_telas.FileListClick(Sender: TObject);
var
  x: integer;
begin
  if FileList.Count = 0 then
    exit;
    CarregaVideo(FileList.ItemIndex);
end;

procedure TFr_telas.FormShow(Sender: TObject);
var
  x: integer;
begin
  cbMaquina.Items.Clear;
  EdDt_ini.Date := now - 1;
  Eddt_Fim.Date := now;
  Ed_Hr_ini.text := '00:00';
  Ed_Hr_Fim.text := '23:59';

  dt_hr_ini := EdDt_ini.Date + strtotime(Ed_Hr_ini.text);
  dt_hr_fim := Eddt_Fim.Date + strtotime(Ed_Hr_Fim.text);

  IdFTPTelas.Passive := true;
  IdFTPTelas.TransferType := ftBinary;
  IdFTPTelas.Connect;
  IdFTPTelas.list(cbMaquina.Items, '', false);
  cbMaquina.ItemIndex := 0;
  IdFTPTelas.disconnect;
end;

end.
