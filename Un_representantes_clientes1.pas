unit Un_representantes_clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, StdCtrls, Buttons,
  ComCtrls,  comobj, Menus, frxClass, RDprint,
  sBitBtn, sLabel, sCheckBox, sGroupBox, ExtCtrls, DBGrids, sSpeedButton,
  DBCtrls, DB, RxMemDS, acDBGrid, sCurrEdit, sCurrencyEdit, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sComboEdit, Ib_Access;

type
  TFr_representantes_clientes = class(TForm)
    SBcarga: TStatusBar;
    q_clientes: TFDQuery;
    fr_relatorio: TfrxReport;
    rd_vendas: TRDprint;
    Panel1: TPanel;
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    sGroupBox3: TsGroupBox;
    sGroupBox4: TsGroupBox;
    sGroupBox5: TsGroupBox;
    dgRep: Tdbgrid;
    dgEstado: Tdbgrid;
    dgMeso: Tdbgrid;
    dgMicro: Tdbgrid;
    dgCidade: Tdbgrid;
    CheckRep: TDBCheckBox;
    mmRep: TRxMemoryData;
    mmRepCheck: TBooleanField;
    dsRep: TDataSource;
    mmRepNome: TStringField;
    mmUF: TRxMemoryData;
    mmUFCheck: TBooleanField;
    dsUF: TDataSource;
    mmUFUF: TStringField;
    mmMeso: TRxMemoryData;
    mmMesoNome: TStringField;
    mmMesoCheck: TBooleanField;
    dsMeso: TDataSource;
    mmMicro: TRxMemoryData;
    mmMicroNome: TStringField;
    mmMicroCheck: TBooleanField;
    dsMicro: TDataSource;
    dsCidades: TDataSource;
    mmCidades: TRxMemoryData;
    mmCidadesNome: TStringField;
    mmCidadesCheck: TBooleanField;
    mmClientes: TRxMemoryData;
    mmClientesCheck: TBooleanField;
    dsClientes: TDataSource;
    mmRepID: TIntegerField;
    CheckUF: TDBCheckBox;
    CheckMeso: TDBCheckBox;
    CheckMicro: TDBCheckBox;
    CheckCidades: TDBCheckBox;
    mmMesoID: TIntegerField;
    mmMicroID: TIntegerField;
    mmCidadesID: TIntegerField;
    mmClientesCLIENTE: TStringField;
    GroupBox2: TsGroupBox;
    dgCarga: Tdbgrid;
    CheckClientes: TDBCheckBox;
    mmClientesREPRESENTANTE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure SgCargaClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure SgCargaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure q_clientesBeforeOpen(IB_Dataset: TIB_Dataset);
    procedure Q_carga2BeforeOpen(IB_Dataset: TIB_Dataset);
    procedure q_clientesAfterClose(IB_Dataset: TIB_Dataset);
    procedure Q_carga2AfterClose(IB_Dataset: TIB_Dataset);
    procedure dgRepDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgEstadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgMesoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgMicroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgCidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgRepKeyPress(Sender: TObject; var Key: Char);
    procedure dgEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure dgMesoKeyPress(Sender: TObject; var Key: Char);
    procedure dgCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dgRepDblClick(Sender: TObject);
    procedure dgEstadoDblClick(Sender: TObject);
    procedure dgMesoDblClick(Sender: TObject);
    procedure dgMicroDblClick(Sender: TObject);
    procedure dgCidadeDblClick(Sender: TObject);
    procedure sbFiltroClick(Sender: TObject);
    procedure dgCargaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgCargaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SgCarga;
    procedure Carrega_SgCarga;
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure Grava_Sgx(insert: Boolean);
    procedure totaliza_carga;
    procedure faturar(nr_documento: string; dta_documento: TDateTime; cod_cliente, id_vendedor, cod_fop,
      cod_prazo: string; valor_total: real; nr_carga: string);
    procedure imprime_lote(cmd_where: string);
    procedure CarregarRepresentantes;
    procedure CarregarUF;
    procedure CarregarMeso(UF: string);
    procedure CarregarMicro(Meso: string);
    procedure CarregarCidades(Micro: string);
    procedure CarregarClientes(filtro: boolean);

  public
    { Public declarations }
    linmax: integer;
    modo_insert: boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure inserePedidoGrid(nr_pedido: string);
    procedure ativa_carga1(id: string);
    procedure ativa_carga2(id: string);
    procedure mostra_campos(prefixo: ShortString);
    procedure carrega_sgx_carga2;
    procedure faturar_pedidos_carga;

    procedure MontaFormularioCarga;

  end;

var
  Fr_representantes_clientes: TFr_representantes_clientes;
  lista_uf, lista_meso, lista_micro, lista_cidades, lista_repr, path: string;

implementation

uses Un_localizar, UnPri, Un_dao, Un_veiculos, UnFun, Un_fechamento_carga,
  Un_dm, Un_vendas_industria2;

{$R *.dfm}

procedure TFr_representantes_clientes.FormShow(Sender: TObject);
begin
  SBcarga.Panels[1].Text := '';
  readonly_true('Pr');

  lista_uf := '';
  lista_meso := '';
  lista_micro := '';
  lista_cidades := '';
  lista_repr := '';

  CarregarRepresentantes;
  CarregarUF;
end;

procedure TFr_representantes_clientes.Monta_SgCarga;
begin

end;

procedure TFr_representantes_clientes.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex := 0;
    end;
  end;

end;

procedure TFr_representantes_clientes.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_representantes_clientes.Prdta_cargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_representantes_clientes.Prnom_cargaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_representantes_clientes.inserePedidoGrid(nr_pedido: string);
begin
end;

procedure TFr_representantes_clientes.SgCargaClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  lin := ARow;

end;

procedure TFr_representantes_clientes.SgCargaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  lin := ARow;

end;

procedure TFr_representantes_clientes.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := false
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_representantes_clientes.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := True
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly := True
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := True
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly := True
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := True;
    end;
  end;
end;

procedure TFr_representantes_clientes.ativa_carga1(id: string);
begin
end;

procedure TFr_representantes_clientes.ativa_carga2(id: string);
begin
end;

procedure TFr_representantes_clientes.Grava_Sgx(insert: Boolean);
begin
end;

procedure TFr_representantes_clientes.totaliza_carga();
begin

end;

procedure TFr_representantes_clientes.Carrega_SgCarga;
begin
end;

procedure TFr_representantes_clientes.mostra_campos(prefixo: ShortString);
begin
end;

procedure TFr_representantes_clientes.carrega_sgx_carga2;
begin
end;

procedure TFr_representantes_clientes.MontaFormularioCarga;
begin
end;

procedure TFr_representantes_clientes.faturar_pedidos_carga;
begin
end;

procedure TFr_representantes_clientes.faturar(nr_documento: string; dta_documento: TDateTime; cod_cliente, id_vendedor, cod_fop,
  cod_prazo: string; valor_total: real; nr_carga: string);
begin
end;

procedure TFr_representantes_clientes.imprime_lote(cmd_where: string);
begin
end;

procedure TFr_representantes_clientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_representantes_clientes.q_clientesBeforeOpen(IB_Dataset: TIB_Dataset);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_representantes_clientes.Q_carga2BeforeOpen(IB_Dataset: TIB_Dataset);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_representantes_clientes.q_clientesAfterClose(IB_Dataset: TIB_Dataset);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_representantes_clientes.Q_carga2AfterClose(IB_Dataset: TIB_Dataset);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_representantes_clientes.CarregarRepresentantes;
begin
  dao.Geral1('SELECT a.ID, a.NOM_REPRESENTANTE FROM REPRESENTANTE a ' +
    'where ativo = ''S'' and funcionario in (0, 1) order by a.NOM_REPRESENTANTE ');
  dao.Q1.First;
  mmRep.Open;
  mmRep.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmRep.Append;
    mmRepID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmRepNome.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmRep.Post;
    dao.q1.Next;
  end;
  mmRep.First;
end;

procedure TFr_representantes_clientes.dgRepDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckRep.DataField) then

    begin
      CheckRep.Left := Rect.Left + dgRep.Left + 2;
      CheckRep.Top := Rect.Top + dgRep.top + 2;
      CheckRep.Width := Rect.Right - Rect.Left;
      CheckRep.Height := Rect.Bottom - Rect.Top;

      CheckRep.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckRep.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgRep.Canvas.FillRect(Rect);
      DrawFrameControl(dgRep.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_representantes_clientes.dgEstadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckUF.DataField) then

    begin
      CheckUF.Left := Rect.Left + dgRep.Left + 2;
      CheckUF.Top := Rect.Top + dgRep.top + 2;
      CheckUF.Width := Rect.Right - Rect.Left;
      CheckUF.Height := Rect.Bottom - Rect.Top;
      CheckUF.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckUF.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgEstado.Canvas.FillRect(Rect);
      DrawFrameControl(dgEstado.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_representantes_clientes.dgMesoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckMeso.DataField) then

    begin
      CheckMeso.Left := Rect.Left + dgRep.Left + 2;
      CheckMeso.Top := Rect.Top + dgRep.top + 2;
      CheckMeso.Width := Rect.Right - Rect.Left;
      CheckMeso.Height := Rect.Bottom - Rect.Top;
      CheckMeso.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckMeso.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgMeso.Canvas.FillRect(Rect);
      DrawFrameControl(dgMeso.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_representantes_clientes.dgMicroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckMicro.DataField) then

    begin
      CheckMicro.Left := Rect.Left + dgRep.Left + 2;
      CheckMicro.Top := Rect.Top + dgRep.top + 2;
      CheckMicro.Width := Rect.Right - Rect.Left;
      CheckMicro.Height := Rect.Bottom - Rect.Top;
      CheckMicro.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckMicro.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgMicro.Canvas.FillRect(Rect);
      DrawFrameControl(dgMicro.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_representantes_clientes.dgCidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckCidades.DataField) then

    begin
      CheckCidades.Left := Rect.Left + dgRep.Left + 2;
      CheckCidades.Top := Rect.Top + dgRep.top + 2;
      CheckCidades.Width := Rect.Right - Rect.Left;
      CheckCidades.Height := Rect.Bottom - Rect.Top;
      CheckCidades.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckCidades.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgCidade.Canvas.FillRect(Rect);
      DrawFrameControl(dgCidade.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_representantes_clientes.CarregarUF;
begin
  dao.Geral1('SELECT a.UF, CASE A.UF WHEN ''SC'' THEN 0 WHEN ''PR'' THEN 1 WHEN ''RS'' THEN 2 ELSE 3 END AS ORD FROM UF a ORDER BY ORD, UF');
  dao.Q1.First;
  mmUF.Open;
  mmUF.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmUF.Append;
    mmUFUF.AsString := dao.Q1.fieldbyname('UF').AsString;
    mmUF.Post;
    dao.q1.Next;
  end;
  mmUF.First;
end;

procedure TFr_representantes_clientes.dgRepKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgRep.SelectedField.FieldName = CheckRep.DataField) then
  begin
    CheckRep.SetFocus;
    SendMessage(CheckRep.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFr_representantes_clientes.dgEstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgEstado.SelectedField.FieldName = CheckUF.DataField) then
  begin
    CheckUF.SetFocus;
    SendMessage(CheckUF.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFr_representantes_clientes.dgMesoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgMeso.SelectedField.FieldName = CheckMeso.DataField) then
  begin
    CheckMeso.SetFocus;
    SendMessage(CheckMeso.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFr_representantes_clientes.dgCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgCidade.SelectedField.FieldName = CheckCidades.DataField) then
  begin
    CheckCidades.SetFocus;
    SendMessage(CheckCidades.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFr_representantes_clientes.dgRepDblClick(Sender: TObject);
begin
  mmRep.Edit;
  if mmRepCheck.Value = true then
    mmRepCheck.Value := false
  else
    mmRepCheck.Value := true;
  mmRep.Post;

  mmRep.First;

  lista_repr := '';

  while not mmRep.Eof do
  begin
    if mmRepCheck.Value then
      lista_repr := lista_repr + mmRepID.AsString + ',';
    mmRep.Next;
  end;
  mmRep.First;

  lista_repr := copy(lista_repr, 1, length(lista_repr) - 1);

end;

procedure TFr_representantes_clientes.dgEstadoDblClick(Sender: TObject);
begin
  mmUF.Edit;
  if mmUFCheck.Value = true then
    mmUFCheck.Value := false
  else
    mmUFCheck.Value := true;
  mmUF.Post;

  mmUF.First;

  lista_uf := '';

  while not mmUF.Eof do
  begin
    if mmUFCheck.Value then
      lista_uf := lista_uf + QuotedStr(mmUFUF.AsString) + ',';
    mmUF.Next;
  end;
  mmUF.First;

  lista_uf := copy(lista_uf, 1, length(lista_uf) - 1);

  if lista_uf <> '' then
    CarregarMeso(lista_uf)
  else
    CarregarClientes;
end;

procedure TFr_representantes_clientes.CarregarMeso(UF: string);
begin
  dao.Geral1('SELECT a.MESOCOD, a.MESONOME, a.UFCOD FROM CADMESO a WHERE a.UFCOD IN (' + UF + ')');
  dao.Q1.First;
  mmMeso.Open;
  mmMeso.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmMeso.Append;
    mmMesoID.AsString := dao.Q1.fieldbyname('MESOCOD').AsString;
    mmMesoNome.AsString := dao.Q1.fieldbyname('MESONOME').AsString;
    mmMeso.Post;
    dao.q1.Next;
  end;
  mmMeso.First;
end;

procedure TFr_representantes_clientes.dgMesoDblClick(Sender: TObject);
begin
  mmMeso.Edit;
  if mmMesoCheck.Value = true then
    mmMesoCheck.Value := false
  else
    mmMesoCheck.Value := true;
  mmMeso.Post;

  mmMeso.First;

  lista_meso := '';

  while not mmMeso.Eof do
  begin
    if mmMesoCheck.Value then
      lista_meso := lista_meso + mmMesoID.AsString + ',';
    mmMeso.Next;
  end;
  mmMeso.First;

  lista_meso := copy(lista_meso, 1, length(lista_meso) - 1);

  if lista_meso <> '' then
    CarregarMicro(lista_meso)
  else
    CarregarClientes;
end;

procedure TFr_representantes_clientes.CarregarMicro(Meso: string);
begin
  dao.Geral1('SELECT a.MICROCOD, a.MICRONOME, a.MESOCOD FROM CADMICRO a WHERE a.MESOCOD IN (' + Meso + ')');
  dao.Q1.First;
  mmMicro.Open;
  mmMicro.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmMicro.Append;
    mmMicroID.AsString := dao.Q1.fieldbyname('MICROCOD').AsString;
    mmMicroNome.AsString := dao.Q1.fieldbyname('MICRONOME').AsString;
    mmMicro.Post;
    dao.q1.Next;
  end;
  mmMicro.First;
end;

procedure TFr_representantes_clientes.dgMicroDblClick(Sender: TObject);
begin
  mmMicro.Edit;
  if mmMicroCheck.Value = true then
    mmMicroCheck.Value := false
  else
    mmMicroCheck.Value := true;
  mmMicro.Post;

  mmMicro.First;

  lista_micro := '';

  while not mmMicro.Eof do
  begin
    if mmMicroCheck.Value then
      lista_micro := lista_micro + mmMicroID.AsString + ',';
    mmMicro.Next;
  end;
  mmMicro.First;

  lista_micro := copy(lista_micro, 1, length(lista_micro) - 1);

  if lista_micro <> '' then
    CarregarCidades(lista_micro)
  else
    CarregarClientes;


end;

procedure TFr_representantes_clientes.CarregarCidades(Micro: string);
begin
  dao.Geral1('SELECT a.COD_CIDADE, a.NOM_CIDADE, a.MICROCOD FROM CIDADES a WHERE a.MICROCOD IN (' + Micro + ')');
  dao.Q1.First;
  mmCidades.Open;
  mmCidades.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmCidades.Append;
    mmCidadesID.AsString := dao.Q1.fieldbyname('COD_CIDADE').AsString;
    mmCidadesNome.AsString := dao.Q1.fieldbyname('NOM_CIDADE').AsString;
    mmCidades.Post;
    dao.q1.Next;
  end;
  mmCidades.First;
end;

procedure TFr_representantes_clientes.dgCidadeDblClick(Sender: TObject);
begin
  mmCidades.Edit;
  if mmCidadesCheck.Value = true then
    mmCidadesCheck.Value := false
  else
    mmCidadesCheck.Value := true;
  mmCidades.Post;

  mmCidades.First;

  lista_cidades := '';

  while not mmCidades.Eof do
  begin
    if mmCidadesCheck.Value then
      lista_cidades := lista_cidades + mmCidadesID.AsString + ',';
    mmCidades.Next;
  end;
  mmCidades.First;

  lista_cidades := copy(lista_cidades, 1, length(lista_cidades) - 1);
  CarregarClientes;

end;

procedure TFr_representantes_clientes.sbFiltroClick(Sender: TObject);
begin
  CarregarClientes(true);
end;

procedure TFr_representantes_clientes.CarregarClientes(filtro: boolean);
var
  cmd: string;
begin
  cmd := 'SELECT distinct c.cod_cliente||''-''||c.NOM_CLIENTE as CLIENTE, R.ID||''-''||r.NOM_REPRESENTANTE as representante ' +
    'FROM cliente c ' +
    'left outer join cidades cd on (c.cod_cidade = cd.cod_cidade) ' +
    'left outer join cadmicro mc on (mc.microcod = cd.microcod) ' +
    'left outer join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
    'left outer join REPRESENTANTE r on r.ID = C.ID_REPRESENTANTE ' +
    'where 1 = 1 ';

  if lista_repr <> '' then
    cmd := cmd + ' and c.id_representante in (' + lista_repr + ') ';

  if lista_uf <> '' then
    cmd := cmd + ' and cd.uf in (' + lista_uf + ') ';

  if lista_meso <> '' then
    cmd := cmd + ' and ms.mesocod in (' + lista_meso + ') ';

  if lista_micro <> '' then
    cmd := cmd + ' and mc.microcod in (' + lista_micro + ') ';

  if lista_cidades <> '' then
    cmd := cmd + ' and cd.cod_cidade in (' + lista_cidades + ') ';

  dao.Geral1(cmd);

  mmClientes.Open;
  mmClientes.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmClientes.Append;
    mmClientesCLIENTE.AsString := dao.Q1.fieldbyname('CLIENTE').AsString;
    mmClientesREPRESENTANTE.AsString := dao.Q1.fieldbyname('REPRESENTANTE').AsString;
    mmClientesCheck.Value := false;

    mmClientes.post;
    dao.Q1.Next;
  end;
  mmClientes.First;
end;

procedure TFr_representantes_clientes.dgCargaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
    if (Column.Field.FieldName = CheckClientes.DataField) then

    begin
      CheckClientes.Left := Rect.Left + dgRep.Left + 2;
      CheckClientes.Top := Rect.Top + dgRep.top + 2;
      CheckClientes.Width := Rect.Right - Rect.Left;
      CheckClientes.Height := Rect.Bottom - Rect.Top;
      CheckClientes.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckClientes.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgCarga.Canvas.FillRect(Rect);
      DrawFrameControl(dgCarga.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_representantes_clientes.dgCargaDblClick(Sender: TObject);
begin
  mmClientes.Edit;
  if mmClientesCheck.Value = true then
    mmClientesCheck.Value := false
  else
    mmClientesCheck.Value := true;
  mmClientes.Post;
end;

end.
