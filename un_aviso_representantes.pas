unit un_aviso_representantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, RxMemDS, StdCtrls, DBCtrls,
  Buttons, SOAPHTTPClient, InvokeRegistry, Rio, ImgList, sPanel, sBitBtn,
  sCheckBox, acDBGrid, sGroupBox;

type
  Tfm_aviso_representantes = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    dgRepresentantes: Tdbgrid;
    dsRepresentantes: TDataSource;
    mmRepresentantes: TRxMemoryData;
    mmRepresentantesID: TIntegerField;
    mmRepresentantesNOME: TStringField;
    mmRepresentantesCHECK: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    BtOK: TsBitBtn;
    BitBtn1: TsBitBtn;
    Panel3: tsPanel;
    rgEnvio: TsRadioGroup;
    CheckTodos: tscheckbox;
    HTTPRIO1: THTTPRIO;
    procedure dgRepresentantesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dgRepresentantesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AvisoRepresentantes(representante, Assunto, Texto: string; tipo: integer);
    procedure BtOKClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Assunto_Aviso, Texto_Aviso, Anexo: string;
  end;

var
  fm_aviso_representantes: Tfm_aviso_representantes;

implementation

uses sms, Un_dao, unPri, un_email_envio, Un_splash;

{$R *.dfm}

procedure Tfm_aviso_representantes.dgRepresentantesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgRepresentantes.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgRepresentantes.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgRepresentantes.Canvas.FillRect(Rect);
      DrawFrameControl(dgRepresentantes.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure Tfm_aviso_representantes.dgRepresentantesDblClick(
  Sender: TObject);
begin
  mmRepresentantes.Edit;
  if mmRepresentantesCHECK.Value = true then
    mmRepresentantesCHECK.Value := false
  else
    mmRepresentantesCHECK.Value := true;
  mmRepresentantes.Post;
end;

procedure Tfm_aviso_representantes.FormShow(Sender: TObject);
var
  sql: string;
begin
  sql := 'SELECT  ' +
    '  a.ID, ' +
    '  a.NOM_REPRESENTANTE ' +
    'FROM REPRESENTANTE a ' +
    'WHERE ' +
    '  a.ATIVO = ''S'' AND A.FUNCIONARIO IN (''0'',''1'')';
  dao.Geral1(sql);
  dao.q1.first;
  mmRepresentantes.open;
  while not dao.q1.eof do
  begin
    mmRepresentantes.Append;
    mmRepresentantesID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmRepresentantesNOME.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmRepresentantesCHECK.Value := true;
    mmRepresentantes.Post;
    dao.q1.next;
  end;
  mmRepresentantes.First;
end;

procedure Tfm_aviso_representantes.AvisoRepresentantes(representante, Assunto, Texto: string; tipo: integer);
var
  sql, ddd, fone, email, corpo_email: string;
  servico: ServerSendSMSPortType;
  EmailNFe: TEmail;
begin
  sql := 'SELECT  ' +
    '  a.ID, ' +
    '  a.NOM_REPRESENTANTE, ' +
    '  a.EMAIL, ' +
    '  substring(A.CELULAR FROM 2 FOR 2) AS DDD, ' +
    '  substring(A.CELULAR FROM 5 FOR 4)||substring(A.CELULAR FROM 10 FOR 4) as fone ' +
    'FROM REPRESENTANTE a ' +
    'WHERE ' +
    '  a.ATIVO = ''S'' AND A.FUNCIONARIO IN (''0'',''1'')' +
    '  and A.id = ' + representante;
  dao.Geral1(sql);

  if tipo = 0 then
  begin
    ddd := dao.Q1.fieldbyname('DDD').AsString;
    fone := dao.Q1.fieldbyname('FONE').AsString;

    servico := HTTPRIO1 as ServerSendSMSPortType;

    if dao.CN.params.values['database'] = 'C:\orbi rep antigo\trunk\dados\orbi.fdb' then
      Servico.sendSMS('claudioplasfan@gmail.com', 'clt2007', '47', '99187025', texto)
    else
      Servico.sendSMS('claudioplasfan@gmail.com', 'clt2007', ddd, fone, texto);
  end
  else
  begin
    email := dao.Q1.fieldbyname('EMAIL').AsString;
    if email <> '' then
    begin
      corpo_email :=
        '<html><body> ' +
        '  <font face="Consolas" size="2">' + texto + '</font><br><br> ' +
        '  <font face="Consolas" size="2">Informações: '+fone_empresa+'</font><br> ' +
        '  <font face="Consolas" size="2">'+home_page+'</font><br><br>' +
        '  <img src="cid:123456"><br>' +
        '</body></html> ';

      if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
        EmailNFe := TEmail.Create(corpo_email, Assunto, '', '', '', '', 'claudioplasfan@gmail.com', Anexo)
      else
        EmailNFe := TEmail.Create(corpo_email, Assunto, email, '', '', '', 'claudioplasfan@gmail.com;compras@plasfan.ind.br', Anexo);

      try
        Application.CreateForm(TFr_email_envio, Fr_email_envio);
        Fr_email_envio.lbResultado.Caption := 'Enviando Email de Aviso ao Representante...';
        Fr_email_envio.showModal;
      finally
        Fr_email_envio.Free;
      end;
    end;
  end;
end;

procedure Tfm_aviso_representantes.BtOKClick(Sender: TObject);
begin
  if MessageDlg('Confirmar o Envio?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
  begin
    mmRepresentantes.First;

    fm_splash.ggProgress.MaxValue := mmRepresentantes.RecordCount;
    fm_splash.lbStatus.Caption := 'Enviando Aviso...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;

    while not mmRepresentantes.Eof do
    begin
      if mmRepresentantesCHECK.Value = true then
      begin
        if rgEnvio.ItemIndex = 0 then
        begin
          fm_splash.lbStatus.Caption := 'Enviando Aviso por Torpedo ao Representante: ' + mmRepresentantesNOME.AsString + '...';
          fm_splash.Refresh;
          AvisoRepresentantes(mmRepresentantesID.AsString, Assunto_Aviso, Texto_Aviso, 0);
          fm_splash.lbStatus.Caption := 'Enviando Aviso por Email ao Representante: ' + mmRepresentantesNOME.AsString + '...';
          fm_splash.Refresh;
          AvisoRepresentantes(mmRepresentantesID.AsString, Assunto_Aviso, Texto_Aviso, 1);
        end
        else if rgEnvio.ItemIndex = 1 then
        begin
          fm_splash.lbStatus.Caption := 'Enviando Aviso por Email ao Representante: ' + mmRepresentantesNOME.AsString + '...';
          fm_splash.Refresh;
          AvisoRepresentantes(mmRepresentantesID.AsString, Assunto_Aviso, Texto_Aviso, 1);
        end
        else begin
          fm_splash.lbStatus.Caption := 'Enviando Aviso por Torpedo ao Representante: ' + mmRepresentantesNOME.AsString + '...';
          fm_splash.Refresh;
          AvisoRepresentantes(mmRepresentantesID.AsString, Assunto_Aviso, Texto_Aviso, 0);
        end;
      end;
      fm_splash.lbStatus.Caption := 'Enviando Aviso...';
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.Refresh;
      sleep(10);
      mmRepresentantes.Next;
    end;
    fm_splash.Hide;
    modalresult := mrOk;
  end;

end;

procedure Tfm_aviso_representantes.CheckTodosClick(Sender: TObject);
begin
  mmRepresentantes.First;
  while not mmRepresentantes.Eof do
  begin
    mmRepresentantes.Edit;
    mmRepresentantesCHECK.Value := CheckTodos.Checked;
    mmRepresentantes.Post;
    mmRepresentantes.Next;
  end;
  mmRepresentantes.First;
end;

end.

