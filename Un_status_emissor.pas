unit Un_status_emissor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBGrids, DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids,
  Vcl.Imaging.GIFImg, JvGIF, RxAnimate, RxGIFCtrl;

type
  TFr_status_emissor = class(TForm)
    PanelTop: TPanel;
    btnAtualizar: TButton;
    chkAuto: TCheckBox;
    PanelWait: TPanel;
    MemoInfo: TMemo;
    Timer1: TTimer;
    qStatus: TFDQuery;
    dsStatus: TDataSource;
    pnBottom: TPanel;
    btOk: TButton;
    RxGIFAnimator1: TRxGIFAnimator;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtualizarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chkAutoClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    FWaitMode: Boolean;
    FTipo: string;
    FDocId: string;
    FSolicitacao: string;
    FStatusFinalizado: Boolean;
    FClosing: Boolean;
    FWaitGif: TGIFImage;
    procedure ConfigureQuery;
    procedure RefreshData;
    procedure BuildWaitGif;
    procedure UpdateWaitInfo;
    procedure DoRefresh;
  public
    procedure StartWait(const ATipo, ADocId, ASolicitacao: string);
  end;

var
  Fr_status_emissor: TFr_status_emissor;

implementation

{$R *.dfm}

uses Un_dao;

procedure TFr_status_emissor.ConfigureQuery;
begin
  qStatus.Connection := dao.CN;
  qStatus.SQL.Text :=
    'select ' +
    '  ''NFE'' as tipo, ' +
    '  cast(v.numdoc as varchar(30)) as documento, ' +
    '  v.solicitar_emissor as solicitacao, ' +
    '  v.status_emissor as status_emissor, ' +
    '  v.status_motivo '+
    'from vendas1 v ' +
    'where (v.status_emissor is not null and trim(v.status_emissor) <> '''') ' +
    '   or (v.solicitar_emissor is not null and trim(v.solicitar_emissor) <> '''') ' +
    'union all ' +
    'select ' +
    '  ''MDFE'' as tipo, ' +
    '  cast(c.id as varchar(30)) as documento, ' +
    '  c.solicitar_emissor as solicitacao, ' +
    '  c.status_emissor as status_emissor, ' +
    '  c.status_motivo '+
    'from carga1 c ' +
    'where (c.status_emissor is not null and trim(c.status_emissor) <> '''') ' +
    '   or (c.solicitar_emissor is not null and trim(c.solicitar_emissor) <> '''') ' +
    'order by status_motivo, tipo, documento';
end;

procedure TFr_status_emissor.RefreshData;
begin
  if qStatus.Active then
    qStatus.Close;
  qStatus.Open;
end;

procedure TFr_status_emissor.FormCreate(Sender: TObject);
begin
  FWaitMode := False;
  FStatusFinalizado := False;
  FClosing := False;
  ConfigureQuery;
  RefreshData;
  PanelWait.Visible := False;

  Timer1.Enabled := False;
  chkAuto.Checked := False;
end;


procedure TFr_status_emissor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FClosing := True;
  FStatusFinalizado := True;
  Timer1.Enabled := False;
  Timer1.OnTimer := nil;
  if qStatus.Active then
    qStatus.Close;
//  Action := caFree;
end;

procedure TFr_status_emissor.FormDestroy(Sender: TObject);
begin
{  FClosing := True;
  Timer1.Enabled := False;
  Timer1.OnTimer := nil;
  if qStatus.Active then
    qStatus.Close;
  Fr_status_emissor := nil;}
end;

procedure TFr_status_emissor.btnAtualizarClick(Sender: TObject);
begin
  if FWaitMode then
    UpdateWaitInfo
  else
    RefreshData;
end;

procedure TFr_status_emissor.chkAutoClick(Sender: TObject);
begin
  Timer1.Enabled := chkAuto.Checked;
end;

procedure TFr_status_emissor.Timer1Timer(Sender: TObject);
begin
  DoRefresh;
end;

procedure TFr_status_emissor.DoRefresh;
begin
  if FClosing or (csDestroying in ComponentState) then
    Exit;
  if FStatusFinalizado then
    Exit;

  if FWaitMode then
    UpdateWaitInfo
  else
    RefreshData;
end;

procedure TFr_status_emissor.btOkClick(Sender: TObject);
begin
  Close;
end;

procedure TFr_status_emissor.BuildWaitGif;
var
  Bmp: TBitmap;
begin
 { if not Assigned(FWaitGif) then
    FWaitGif := TGIFImage.Create;

  FWaitGif.Clear;
  FWaitGif.AnimationSpeed := 100;

  Bmp := TBitmap.Create;
  try
    Bmp.SetSize(32, 32);

    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(Rect(0, 0, 32, 32));
    Bmp.Canvas.Brush.Color := clNavy;
    Bmp.Canvas.Pen.Color := clNavy;
    Bmp.Canvas.Ellipse(6, 6, 26, 26);
    FWaitGif.Add(Bmp);

    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(Rect(0, 0, 32, 32));
    Bmp.Canvas.Brush.Color := clRed;
    Bmp.Canvas.Pen.Color := clRed;
    Bmp.Canvas.Ellipse(8, 8, 24, 24);
    FWaitGif.Add(Bmp);
  finally
    Bmp.Free;
  end;

  if FWaitGif.Images.Count > 0 then
  begin
    FWaitGif.Images[0].GraphicControlExtension.Delay := 10;
    if FWaitGif.Images.Count > 1 then
      FWaitGif.Images[1].GraphicControlExtension.Delay := 10;
  end;

  FWaitGif.Animate := True;
  ImageWait.Picture.Assign(FWaitGif);  }
end;

procedure TFr_status_emissor.UpdateWaitInfo;
var
  StatusEmissor: string;
  StatusFinal: Boolean;
  StatusSucesso: Boolean;
  StatusUpper: string;
begin
  StatusSucesso := False;
  if FClosing then
    Exit;
  StatusFinal := False;
  qStatus.Close;
  qStatus.SQL.Clear;

  if SameText(FTipo, 'NFE') then
  begin
    qStatus.SQL.Text := 'select numdoc as documento, solicitar_emissor as solicitacao, ' +
                        'status_emissor, status_motivo ' +
                        'from vendas1 where numdoc = :id';
  end
  else
  begin
    qStatus.SQL.Text := 'select id as documento, solicitar_emissor as solicitacao, ' +
                        'status_emissor, status_motivo ' +
                        'from carga1 where id = :id';
  end;

  qStatus.ParamByName('id').AsInteger := StrToInt(FDocId);
  qStatus.Open;

  MemoInfo.Lines.BeginUpdate;
  try
    MemoInfo.Clear;
    MemoInfo.Lines.Add('Tipo: ' + FTipo);
    MemoInfo.Lines.Add('Documento: ' + FDocId);
    if not qStatus.IsEmpty then
    begin
      MemoInfo.Lines.Add('Solicitacao: ' + Trim(qStatus.FieldByName('solicitacao').AsString));
      StatusEmissor := Trim(qStatus.FieldByName('status_emissor').AsString);
      MemoInfo.Lines.Add('Status emissor: ' + StatusEmissor);
      MemoInfo.Lines.Add('Motivo: ' + Trim(qStatus.FieldByName('status_motivo').AsString));
      StatusUpper := UpperCase(StatusEmissor);
      StatusSucesso := SameText(StatusEmissor, 'CONCLUIDO') or SameText(StatusEmissor, 'SUCESSO') or
        ((Pos('SUCESSO', StatusUpper) > 0) and (Pos('SEM SUCESSO', StatusUpper) = 0));
      StatusFinal := StatusSucesso or SameText(StatusEmissor, 'SEM SUCESSO');
    end
    else
    begin
      MemoInfo.Lines.Add('Status emissor: AGUARDANDO');
    end;
  finally
    MemoInfo.Lines.EndUpdate;
  end;

  if StatusFinal then
  begin
    FStatusFinalizado := True;
    Timer1.Enabled := False;

    if StatusSucesso then
    begin
      ModalResult := mrOk;
      btOkClick(btOk);
    end;
  end;
end;

procedure TFr_status_emissor.StartWait(const ATipo, ADocId, ASolicitacao: string);
begin
  FWaitMode := True;
  FTipo := UpperCase(Trim(ATipo));
  FDocId := Trim(ADocId);
  FSolicitacao := Trim(ASolicitacao);

  PanelTop.Visible := False;
  PanelWait.Visible := True;

  //BuildWaitGif;
  UpdateWaitInfo;
  Timer1.Interval := 2000;
  Timer1.Enabled := True;
end;

end.




