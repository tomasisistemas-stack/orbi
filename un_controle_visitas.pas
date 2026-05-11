unit un_controle_visitas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, sCurrEdit,
  sDBCalcEdit, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, sDBDateEdit,
  Vcl.Buttons, sBitBtn, Vcl.Grids, Vcl.DBGrids, acDBGrid, Vcl.ExtCtrls, sPanel,
  Data.DB, RxMemDS, sLabel, sComboEdit, sGroupBox, RxToolEdit, RxDBCtrl;

type
  Tfr_controle_visitas = class(TForm)
    sPanel1: TsPanel;
    dgVisitas: Tdbgrid;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    BtNovoVisitas: TsBitBtn;
    BtAlterarVisitas: TsBitBtn;
    BtSalvarVisitas: TsBitBtn;
    BtCancelarVisitas: TsBitBtn;
    BtExcluirVisitas: TsBitBtn;
    gbCliente: TGroupBox;
    gbValor: TGroupBox;
    edValorVisita: TsDBCalcEdit;
    gbMotivo: TGroupBox;
    DBMemo1: TDBMemo;
    CkVendeu: TDBCheckBox;
    mmVisitas: TRxMemoryData;
    mmVisitasData: TDateTimeField;
    mmVisitasVendeu: TBooleanField;
    mmVisitasValor: TCurrencyField;
    mmVisitasMotivo: TStringField;
    mmVisitasENVIADO: TBooleanField;
    dsVisitas: TDataSource;
    LbNom_cliente1: TsLabel;
    mmVisitasCod_Cliente: TIntegerField;
    mmVisitasNome_Cliente: TStringField;
    DBCheckBox2: TDBCheckBox;
    gbData: TsGroupBox;
    edData: TsDateEdit;
    BtConsulta: TsBitBtn;
    edcod_cliente: TRxDBComboEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    Shape1: TShape;
    Shape2: TShape;
    procedure edcod_clienteExit(Sender: TObject);
    procedure edcod_clienteButtonClick(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtNovoVisitasClick(Sender: TObject);
    procedure BtAlterarVisitasClick(Sender: TObject);
    procedure BtSalvarVisitasClick(Sender: TObject);
    procedure BtCancelarVisitasClick(Sender: TObject);
    procedure BtExcluirVisitasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dgVisitasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure ChecaVisitasEnviadas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_controle_visitas: Tfr_controle_visitas;

implementation

{$R *.dfm}

uses Un_localizar, Un_dao, UnPri, unfun;

procedure Tfr_controle_visitas.BtNovoVisitasClick(Sender: TObject);
begin
  BtSalvarVisitas.Enabled := true;
  BtCancelarVisitas.Enabled := true;
  BtAlterarVisitas.Enabled := false;
  BtExcluirVisitas.Enabled := false;
  BtNovoVisitas.Enabled := false;

  if not mmVisitas.Active then
    mmVisitas.Open;

  mmVisitas.Append;
  edcod_cliente.SetFocus;
  edValorVisita.Value := 0;
end;

procedure Tfr_controle_visitas.BtSalvarVisitasClick(Sender: TObject);
var
  vendeu, sql : string;
begin
  if (trim(edValorVisita.Text) = '') or (edValorVisita.Value = 0) then
    mmVisitasValor.Value := 0;
  mmVisitas.Post;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

  if mmVisitas.Active = false then
    mmVisitas.Active := true;

  try
    if not(dao.cn.InTransaction) then
      (dao.cn.StartTransaction);

    sql := ' delete FROM CLIENTE_VISITAS where data = ' + quotedstr(formatdatetime('dd.mm.yyyy', edData.Date));
    dao.Execsql(sql);

    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;


  mmVisitas.First;

  while not mmVisitas.Eof do
  begin
    try
      if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);

      if mmVisitasVendeu.Value = true then
        vendeu := 'S'
      else
        vendeu := 'N';

      sql := ' INSERT INTO CLIENTE_VISITAS (COD_CLIENTE, DATA, VENDEU, MOTIVO_N_VENDA, VALOR_PEDIDO) '
        + ' VALUES ( ' + quotedstr(mmVisitasCod_Cliente.Text) + ', ' +
        quotedstr(formatdatetime('dd.mm.yyyy', edData.Date)) + ', ' +
        quotedstr(vendeu) + ', ' + quotedstr(mmVisitasMotivo.AsString) + ', ' +
        FMFUN.BuscaTroca(mmVisitasValor.AsString, ',', '.') + ') ';

      dao.Execsql(sql);

      sql := 'update cliente c set c.ULTIMA_FREQUENCIA = (select max(v.DATA) from CLIENTE_VISITAS v where v.COD_CLIENTE = c.COD_CLIENTE)';
      dao.Execsql(sql);

      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    mmVisitas.Next;
  end;
  mmVisitas.First;
  BtConsultaClick(Self);
end;

procedure Tfr_controle_visitas.ChecaVisitasEnviadas;
begin
  BtAlterarVisitas.Enabled := mmVisitasENVIADO.Value <> true;
  BtExcluirVisitas.Enabled := mmVisitasENVIADO.Value <> true;

  if mmVisitas.IsEmpty then
  begin
    BtAlterarVisitas.Enabled := false;
    BtExcluirVisitas.Enabled := false;
  end
  else
   edcod_clienteExit(Self);

end;

procedure Tfr_controle_visitas.dgVisitasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin

  if (mmVisitasENVIADO.Value = true) then
  begin
    dgVisitas.Canvas.Font.Color := clGrayText;
    if gdSelected in State then
    begin
      dgVisitas.Canvas.Brush.Color := clGrayText;
      dgVisitas.Canvas.Font.Color := clwhite;
    end;
  end
  else
  begin
    dgVisitas.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgVisitas.Canvas.Brush.Color := clNavy;
      dgVisitas.Canvas.Font.Color := clwhite;
    end;
  end;

  dgVisitas.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DBCheckBox2.Left := Rect.Left + dgVisitas.Left + 2;
      DBCheckBox2.Top := Rect.Top + dgVisitas.Top + 2;
      DBCheckBox2.Width := Rect.Right - Rect.Left;
      DBCheckBox2.Height := Rect.Bottom - Rect.Top;

      DBCheckBox2.Visible := true;
    end;

  end
  else
  begin

    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgVisitas.Canvas.FillRect(Rect);
      DrawFrameControl(dgVisitas.Canvas.Handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;
end;

procedure Tfr_controle_visitas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_controle_visitas.FormShow(Sender: TObject);
begin
  edData.Date := Now;
end;

procedure Tfr_controle_visitas.BtAlterarVisitasClick(Sender: TObject);
begin
  BtSalvarVisitas.Enabled := true;
  BtCancelarVisitas.Enabled := true;
  BtAlterarVisitas.Enabled := false;
  BtExcluirVisitas.Enabled := false;
  BtNovoVisitas.Enabled := false;

  mmVisitas.Edit;
  edcod_cliente.SetFocus;

end;

procedure Tfr_controle_visitas.BtCancelarVisitasClick(Sender: TObject);
begin
  mmVisitas.cancel;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

end;

procedure Tfr_controle_visitas.BtConsultaClick(Sender: TObject);
var
  sql: string;
begin
  sql := '';

  dao.Geral1
    (' SELECT a.COD_CLIENTE, c.NOM_CLIENTE, a.DATA, a.VENDEU, a.MOTIVO_N_VENDA, a.VALOR_PEDIDO, a.ENVIADO '
    + ' FROM CLIENTE_VISITAS a inner join cliente c on c.cod_cliente = a.cod_cliente '
    + ' WHERE A.DATA = ' + quotedstr(formatdatetime('dd.mm.yyyy', edData.Date)) + ' ORDER BY c.NOM_CLIENTE ');
  dao.Q1.First;
  mmVisitas.Close;
  mmVisitas.EmptyTable;
  mmVisitas.Open;
  while not dao.Q1.Eof do
  begin
    mmVisitas.Append;

    mmVisitasData.Value := dao.Q1.fieldbyname('data').AsDateTime;
    mmVisitasCod_Cliente.Value := dao.Q1.fieldbyname('cod_cliente').AsInteger;
    mmVisitasNome_Cliente.AsString := dao.Q1.fieldbyname('nom_cliente').AsString;
    mmVisitasVendeu.Value := dao.Q1.fieldbyname('vendeu').AsString = 'S';
    mmVisitasENVIADO.Value := dao.Q1.fieldbyname('enviado').AsString = 'S';
    mmVisitasMotivo.Value := dao.Q1.fieldbyname('motivo_n_venda').AsString;
    mmVisitasValor.Value := dao.Q1.fieldbyname('valor_pedido').AsCurrency;

    mmVisitas.Post;
    dao.Q1.Next;
  end;
  mmVisitas.First;
  ChecaVisitasEnviadas;

end;

procedure Tfr_controle_visitas.BtExcluirVisitasClick(Sender: TObject);
var
  sql : string;
begin

  try
    if not(dao.cn.InTransaction) then
      (dao.cn.StartTransaction);

    sql := ' delete FROM CLIENTE_VISITAS where data = '+quotedstr(formatdatetime('dd.mm.yyyy', edData.Date))+' and COD_cliente = ' + quotedstr(mmVisitasCod_Cliente.Text);

    dao.Execsql(sql);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;



  mmVisitas.delete;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

end;

procedure Tfr_controle_visitas.edcod_clienteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_visita_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Nome Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';

  for i := 0 to 5 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;


end;

procedure Tfr_controle_visitas.edcod_clienteExit(Sender: TObject);
begin
  if trim(edcod_cliente.Text) = '' then
    LbNom_cliente1.Caption := '...';

  if edcod_cliente.Text <> '' then
  begin
    dao.Geral2('select cl.nom_cliente||'' - ''||c.NOM_CIDADE||''-''||c.UF as nom_cliente from cliente cl left outer join CIDADES c on c.COD_CIDADE = cl.COD_CIDADE where cl.cod_cliente=' + QuotedStr(edcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cliente1.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      edcod_cliente.Text := '';
      edcod_cliente.SetFocus;
      Exit;
    end;
  end;
end;

end.


