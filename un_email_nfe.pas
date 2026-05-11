unit un_email_nfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sCheckBox, Vcl.Buttons, sSpeedButton,
  Vcl.Grids, Vcl.DBGrids, acDBGrid, Vcl.StdCtrls, Vcl.DBCtrls, sBitBtn, sEdit,
  sToolEdit, Vcl.Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit,
  sLabel, sGroupBox, Vcl.ExtCtrls, sPanel, Data.DB, RxMemDS, Vcl.ImgList;

type
  Tfrm_nfe_email = class(TForm)
    Panel2: TsPanel;
    gbPedido: TsGroupBox;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    edPedidoIni: TsCurrencyEdit;
    edPedidoFim: TsCurrencyEdit;
    gbDataSaida: TsGroupBox;
    Label2: TsLabel;
    Label1: TsLabel;
    edSaidaDe: TsDateEdit;
    edSaidaAte: TsDateEdit;
    gbCliente: TsGroupBox;
    edCliente: TsEdit;
    BtConsulta: TsBitBtn;
    DBCheckBox1: TDBCheckBox;
    dgPedidos: Tdbgrid;
    sPanel1: TsPanel;
    btEnviar: TsSpeedButton;
    CheckTodos: TsCheckBox;
    dsPedidos: TDataSource;
    mmPedidos: TRxMemoryData;
    mmPedidosCLIENTE: TIntegerField;
    mmPedidosCLIENTE_NOME: TStringField;
    mmPedidosDOCUMENTO: TIntegerField;
    mmPedidosVENDEDOR: TIntegerField;
    mmPedidosVENDEDOR_NOME: TStringField;
    mmPedidosEMISSAO: TDateField;
    mmPedidosCONDICAO: TIntegerField;
    mmPedidosFORMA_PGTO: TStringField;
    mmPedidosVALOR: TCurrencyField;
    mmPedidosSITUACAO: TIntegerField;
    mmPedidosOBS: TStringField;
    mmPedidoscheck: TBooleanField;
    ImageList1: TImageList;
    mmPedidosSTATUS_NFE_EMAIL: TStringField;
    procedure BtConsultaClick(Sender: TObject);
    procedure dgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure dgPedidosDblClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
  private
    procedure CarregaDados;
    procedure AtualizarStatus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_nfe_email: Tfrm_nfe_email;
  WindowList: Pointer;

implementation

{$R *.dfm}

uses Un_dao, unpri, Un_splash;

procedure Tfrm_nfe_email.BtConsultaClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfrm_nfe_email.btEnviarClick(Sender: TObject);
var
  n_itens: Integer;

begin
  n_itens := 0;
  mmPedidos.First;
  mmPedidos.DisableControls;
  while not mmPedidos.Eof do
  begin
    if mmPedidoscheck.Value = true then
      n_itens := n_itens + 1;
    mmPedidos.Next;
  end;
  mmPedidos.First;

  WindowList := DisableTaskWindows(fm_splash.Handle);
  fm_splash.ggProgress.MaxValue := mmPedidos.RecordCount;
  fm_splash.lbStatus.Caption := 'Enviando Emails de NF-e...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;

  while not mmPedidos.Eof do
  begin
    if mmPedidoscheck.Value = true then
    begin
      mmPedidos.Edit;
      mmPedidosSTATUS_NFE_EMAIL.AsString :=
        FRPRI.EnvioEmailNFE(mmPedidosDOCUMENTO.AsString, 'Saída');
      mmPedidos.Post;
      fm_splash.ggProgress.Progress := fm_splash.ggProgress.Progress + 1;
    end;
    mmPedidos.Next;
  end;

  EnableTaskWindows(WindowList);
  fm_splash.Hide;

  mmPedidos.First;
  mmPedidos.EnableControls;

  if MessageDlg('Concluído!', mtInformation, [mbOk], 0) = mrOk then
  begin
    AtualizarStatus;
    CarregaDados;
  end;
end;

procedure Tfrm_nfe_email.AtualizarStatus;
begin
  mmPedidos.First;
  mmPedidos.DisableControls;
  WindowList := DisableTaskWindows(fm_splash.Handle);
  fm_splash.ggProgress.MaxValue := mmPedidos.RecordCount;
  fm_splash.lbStatus.Caption := 'Atualizando Status...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;

  //if dao.cn.InTransaction then
    dao.cn.StartTransaction;
  while not mmPedidos.Eof do
  begin

    dao.Execsql('UPDATE VENDAS1 V SET V.STATUS_NFE_EMAIL = ''' +
      mmPedidosSTATUS_NFE_EMAIL.AsString + ''' WHERE V.NUMDOC = ' +
      mmPedidosDOCUMENTO.AsString);

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.refresh;

    mmPedidos.Next;
  end;
  dao.cn.Commit;
  fm_splash.Hide;
  mmPedidos.First;
  mmPedidos.EnableControls;
  EnableTaskWindows(WindowList);
end;

procedure Tfrm_nfe_email.CarregaDados;
var
  sql: string;
begin
  sql := 'SELECT a.NUMDOC, a.DTADOC, a.COD_CLIENTE||''-''||c.NOM_CLIENTE as CLIENTE, a.TOT_BRUTO, a.TOT_LIQUIDO, '
    + ' a.COD_FOP||''-''||f.NOM_FOP as fop, a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, '
    + ' p.PRAZO, A.OBSERVACOES_PEDIDO, coalesce(A.STATUS_NFE_EMAIL, ''0'') as STATUS_NFE_EMAIL '
    + 'FROM ' + ' CONFIGURACAO CF, ' + ' VENDAS1 a ' +
    'inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE) ' +
    'inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
    'left  join prazo p on (p.ID = a.COD_PRAZO_PGTO) ' +
    'left join fop f on (f.COD_FOP = a.COD_FOP) ' +
    'LEFT OUTER JOIN FORNECEDOR fr on (fr.COD_FORNECEDOR = a.COD_FORNECEDOR)' +
    'where a.FATURADO in (''1'', ''3'') and ' + '   a.nfe is not null and ' +
    '   case when a.COD_CLIENTE is null then fr.NFE_EMAIL else c.NFE_EMAIL end = ''S'' and a.EMAIL_NFE = 0 '
    + '   and case when a.COD_CLIENTE is null then fr.EMAIL else EMAIL_END_NFE end is not null and f.cod_fop <> 32 ';

  if trim(edPedidoIni.Text) <> '0' then
    sql := sql + ' AND a.numdoc >= ' + edPedidoIni.Text;

  if trim(edPedidoFim.Text) <> '0' then
    sql := sql + ' AND a.numdoc <= ' + edPedidoFim.Text;

  if trim(edSaidaDe.Text) <> '/  /' then
    sql := sql + ' AND a.DTA_EMISSAO >= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    sql := sql + ' AND a.DTA_EMISSAO <= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaAte.Date));

  if trim(edCliente.Text) <> '' then
    sql := sql + ' AND C.NOM_CLIENTE LIKE ''' + trim(edCliente.Text) + '%''';

  sql := sql + ' order by numdoc desc ';

  dao.geral1(sql);

  mmPedidos.Close;
  mmPedidos.EmptyTable;
  mmPedidos.Open;
  dao.q1.First;

  while not dao.q1.Eof do
  begin
    mmPedidos.Append;
    mmPedidosCLIENTE_NOME.AsString := dao.q1.fieldbyname('CLIENTE').AsString;
    mmPedidosDOCUMENTO.AsInteger := dao.q1.fieldbyname('NUMDOC').AsInteger;
    mmPedidosVENDEDOR_NOME.AsString :=
      dao.q1.fieldbyname('REPRESENTANTE').AsString;
    mmPedidosEMISSAO.AsDateTime := dao.q1.fieldbyname('DTADOC').AsDateTime;
    mmPedidosFORMA_PGTO.AsString := dao.q1.fieldbyname('FOP').AsString;
    mmPedidosVALOR.Value := dao.q1.fieldbyname('TOT_LIQUIDO').Value;
    mmPedidosSTATUS_NFE_EMAIL.Value :=
      dao.q1.fieldbyname('STATUS_NFE_EMAIL').Value;
    mmPedidos.Post;
    dao.q1.Next;
  end;
  mmPedidos.First;
end;

procedure Tfrm_nfe_email.CheckTodosClick(Sender: TObject);
begin
  mmPedidos.First;
  while not mmPedidos.Eof do
  begin
    mmPedidos.Edit;
    mmPedidoscheck.Value := CheckTodos.Checked;
    mmPedidos.Post;
    mmPedidos.Next;
  end;
  mmPedidos.First;
end;

procedure Tfrm_nfe_email.dgPedidosDblClick(Sender: TObject);
begin
  mmPedidos.Edit;
  if mmPedidoscheck.Value = true then
    mmPedidoscheck.Value := false
  else
    mmPedidoscheck.Value := true;
  mmPedidos.Post;
end;

procedure Tfrm_nfe_email.dgPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgPedidos.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgPedidos.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgPedidos.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedidos.Canvas.Handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;
  if (Column.Field.FieldName = 'STATUS_NFE_EMAIL') then
  begin
    if mmPedidos.fieldbyname('Status_Nfe_Email').AsString = '0' then
    begin
      ImageList1.Draw(dgPedidos.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
      dgPedidos.Hint := 'À Enviar';
    end;

    if mmPedidos.fieldbyname('Status_Nfe_Email').AsString = '1' then
    begin
      ImageList1.Draw(dgPedidos.Canvas, Rect.Left + 2, Rect.Top + 1, 1);
      dgPedidos.Hint := 'Enviado';
    end;

    if mmPedidos.fieldbyname('Status_Nfe_Email').AsString = '2' then
    begin
      ImageList1.Draw(dgPedidos.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
      dgPedidos.Hint := 'Sem XML';
    end;

    if mmPedidos.fieldbyname('Status_Nfe_Email').AsString = '0' then
    begin
      ImageList1.Draw(dgPedidos.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
      dgPedidos.Hint := 'Endereço de Email Inválido';
    end;
  end;
end;

procedure Tfrm_nfe_email.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

end.
