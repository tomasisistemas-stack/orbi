unit Un_representantes_clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, StdCtrls, Buttons,
  ComCtrls,  comobj, Menus, frxClass, RDprint,
  sBitBtn, sLabel, sCheckBox, sGroupBox, ExtCtrls, DBGrids, sSpeedButton,
  DBCtrls, DB, RxMemDS, acDBGrid, sCurrEdit, sCurrencyEdit, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sComboEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_representantes_clientes = class(TForm)
    SBcarga: TStatusBar;
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
    mmClientescod_cliente: TIntegerField;
    GroupBox3: TsGroupBox;
    Lbperc_frete: TsLabel;
    Prcod_representante: TsComboEdit;
    Lbnom_representante: TsLabel;
    Label8: TsLabel;
    btAltRep: TsBitBtn;
    CheckTodos: TsCheckBox;
    mmClientescidade: TStringField;
    sGroupBox6: TsGroupBox;
    dgBairro: TDBGrid;
    CheckBairro: TDBCheckBox;
    mmBairro: TRxMemoryData;
    dsBairro: TDataSource;
    mmBairroNome: TStringField;
    mmBairroCheck: TBooleanField;
    mmClientesbairro: TStringField;
    q_clientes: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure SgCargaClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure SgCargaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    procedure dgCargaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgCargaDblClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure btAltRepClick(Sender: TObject);
    procedure dgBairroDblClick(Sender: TObject);
    procedure dgBairroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgBairroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Monta_SgCarga;
    procedure Carrega_SgCarga;
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure Grava_Sgx(insert: Boolean);
    procedure totaliza_carga;
    procedure faturar(nr_documento: string; dta_documento: TDateTime;
      cod_cliente, id_vendedor, cod_fop, cod_prazo: string; valor_total: real;
      nr_carga: string);
    procedure imprime_lote(cmd_where: string);
    procedure CarregarRepresentantes;
    procedure CarregarUF;
    procedure CarregarMeso(UF: string);
    procedure CarregarMicro(Meso: string);
    procedure CarregarCidades(Micro: string);
    procedure CarregarClientes;
    procedure CarregarBairros(Cidades: string);

  public
    { Public declarations }
    linmax: Integer;
    modo_insert: Boolean;

    busca_qualquer_posicao_pesquisada: Boolean;
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
  lista_uf, lista_meso, lista_micro, lista_cidades, lista_bairros, lista_repr, path: string;
  cons : string;

implementation

uses Un_localizar, UnPri, Un_dao, Un_veiculos, UnFun, Un_fechamento_carga,
  Un_dm, Un_vendas_industria2;

{$R *.dfm}

procedure TFr_representantes_clientes.FormShow(Sender: TObject);
begin

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
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0;
    end;
  end;

end;

procedure TFr_representantes_clientes.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_representantes_clientes.Prcod_representanteButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_cliente_representante_ck';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
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

procedure TFr_representantes_clientes.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prcod_representante.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_representante.Text)) and
      (length(Prcod_representante.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_representante.SetFocus;
      Exit;
    end;

    dao.Geral3('select nom_representante, funcionario, MARGEM_MINIMA, MARGEM_IDEAL, INDICE_ABAIXO, INDICE_ACIMA, PERC_COMISSAO_FIXA from representante where ativo = ''S'' and funcionario in (''0'', ''1'', ''4'') and id='+ Prcod_representante.Text);
    if dao.q3.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.q3.fieldbyname('nom_representante').AsString;
      btAltRep.Enabled := true;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_representante.Text := '';
      Prcod_representante.SetFocus;
      btAltRep.Enabled := false;
      Exit;
    end;
  end;

end;

procedure TFr_representantes_clientes.Prdta_cargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_representantes_clientes.Prnom_cargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_representantes_clientes.inserePedidoGrid(nr_pedido: string);
begin
end;

procedure TFr_representantes_clientes.SgCargaClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  lin := ARow;

end;

procedure TFr_representantes_clientes.SgCargaSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  lin := ARow;

end;

procedure TFr_representantes_clientes.readonly_false(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := false
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_representantes_clientes.readonly_true(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;
    end;
  end;
end;

procedure TFr_representantes_clientes.ativa_carga1(id: string);
begin
end;

procedure TFr_representantes_clientes.ativa_carga2(id: string);
begin
end;

procedure TFr_representantes_clientes.btAltRepClick(Sender: TObject);
begin
  if trim(Prcod_representante.text) = '' then exit;

  dao.cn.StartTransaction;
  mmClientes.first;
  while not mmClientes.Eof do
  begin
    if mmClientesCheck.Value = true then
      dao.Execsql('UPDATE CLIENTE SET ID_REPRESENTANTE = ' + Prcod_representante.Text + ' WHERE cod_cliente = ' + mmClientescod_cliente.AsString);
    mmClientes.next;
  end;
  mmClientes.first;
  dao.cn.Commit;
  CarregarClientes;
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

procedure TFr_representantes_clientes.CheckTodosClick(Sender: TObject);
begin
 if mmClientes.IsEmpty then exit;

  mmClientes.First;
  while not mmClientes.Eof do
  begin
    mmClientes.Edit;
    mmClientesCheck.Value := CheckTodos.Checked;
    mmClientes.Post;
    mmClientes.Next;
  end;
  mmClientes.First;
  btAltRep.Enabled := CheckTodos.Checked;

end;

procedure TFr_representantes_clientes.MontaFormularioCarga;
begin
end;

procedure TFr_representantes_clientes.faturar_pedidos_carga;
begin
end;

procedure TFr_representantes_clientes.faturar(nr_documento: string;
  dta_documento: TDateTime; cod_cliente, id_vendedor, cod_fop,
  cod_prazo: string; valor_total: real; nr_carga: string);
begin
end;

procedure TFr_representantes_clientes.imprime_lote(cmd_where: string);
begin
end;

procedure TFr_representantes_clientes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_representantes_clientes.CarregarRepresentantes;
begin
  dao.Geral1('SELECT a.ID, a.NOM_REPRESENTANTE FROM REPRESENTANTE a ' +
    'where ativo = ''S'' and funcionario in (''0'', ''1'') order by a.NOM_REPRESENTANTE ');

  dao.Q1.First;
  mmRep.Open;
  mmRep.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmRep.Append;
    mmRepID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmRepNome.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmRep.Post;
    dao.Q1.Next;
  end;
  mmRep.First;
end;

procedure TFr_representantes_clientes.dgRepDrawColumnCell(Sender: TObject;
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
var
  aux : string;
begin
  aux := '';
  if TRIM(lista_repr) <> '' then
    aux := 'AND A.UF IN (SELECT CD.UF FROM CLIENTE CL INNER JOIN CIDADES CD ON CD.COD_CIDADE = CL.COD_CIDADE WHERE CL.ID_REPRESENTANTE IN ('+lista_repr+'))';

  dao.Geral1('SELECT a.UF FROM UF a WHERE 1 = 1 '+aux+' ORDER BY UF');
  dao.Q1.First;
  lista_uf := '';
  mmUF.Open;
  mmUF.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmUF.Append;
    mmUFUF.AsString := dao.Q1.fieldbyname('UF').AsString;
    lista_uf := lista_uf + QuotedStr(mmUFUF.AsString) + ',';
    mmUF.Post;
    dao.q1.Next;
  end;
  mmUF.First;

  lista_uf := copy(lista_uf, 1, length(lista_uf) - 1);

  CarregarMeso(lista_uf);
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
  cons := mmRepNome.AsString;
  if mmRepCheck.Value = true then
    mmRepCheck.Value := false
  else
    mmRepCheck.Value := true;
  mmRep.Post;

  mmRep.DisableControls;

  mmRep.First;

  lista_repr := '';

  while not mmRep.Eof do
  begin
    if mmRepCheck.Value then
      lista_repr := lista_repr + mmRepID.AsString + ',';
    mmRep.Next;
  end;
//  mmRep.First;
  mmrep.Locate('Nome', cons, [loCaseInsensitive]);

  mmRep.EnableControls;
  lista_repr := copy(lista_repr, 1, length(lista_repr) - 1);
  CarregarUF;
end;

procedure TFr_representantes_clientes.dgEstadoDblClick(Sender: TObject);
begin
  mmUF.Edit;
  cons := mmUFUF.AsString;

  if mmUFCheck.Value = true then
    mmUFCheck.Value := false
  else
    mmUFCheck.Value := true;
  mmUF.Post;

  mmUF.DisableControls;
  mmUF.First;

  lista_uf := '';

  while not mmUF.Eof do
  begin
    if mmUFCheck.Value then
      lista_uf := lista_uf + QuotedStr(mmUFUF.AsString) + ',';
    mmUF.Next;
  end;
  mmUF.Locate('UF', cons, [loCaseInsensitive]);

  lista_uf := copy(lista_uf, 1, length(lista_uf) - 1);

  mmUF.EnableControls;

  CarregarMeso(lista_uf);
  CarregarMicro(lista_meso);
  CarregarCidades(lista_micro);
  CarregarBairros(lista_cidades);

  if trim(lista_repr) <> '' then
    CarregarClientes;
end;

procedure TFr_representantes_clientes.CarregarMeso(UF: string);
var
  aux : string;
begin
  aux := '';

  if trim(lista_repr) <> '' then
    aux := '  AND A.MESOCOD IN (SELECT MS.MESOCOD FROM CLIENTE CL '+
           '  INNER JOIN CIDADES CD ON CD.COD_CIDADE = CL.COD_CIDADE '+
           '  INNER JOIN CADMESO MS ON MS.MESOCOD = CD.MESOCOD '+
           '  WHERE CL.ID_REPRESENTANTE in ('+lista_repr+') ) ';


  dao.Geral1('SELECT a.MESOCOD, a.MESONOME, a.UFCOD FROM CADMESO a WHERE a.UFCOD IN (' + UF + ') ' + aux );
  dao.Q1.First;
  lista_meso := '';

  mmMeso.Open;
  mmMeso.EmptyTable;
  while not dao.q1.Eof do
  begin
    mmMeso.Append;
    mmMesoID.AsString := dao.Q1.fieldbyname('MESOCOD').AsString;
    mmMesoNome.AsString := dao.Q1.fieldbyname('MESONOME').AsString;
    mmMeso.Post;
    lista_meso := lista_meso + quotedstr(mmMesoID.AsString) + ',';
    dao.q1.Next;
  end;
  mmMeso.First;
  lista_meso := copy(lista_meso, 1, length(lista_meso) - 1);

  CarregarMicro(lista_meso);

end;

procedure TFr_representantes_clientes.dgMesoDblClick(Sender: TObject);
begin
  mmMeso.Edit;
  cons := mmMesoNome.AsString;

  if mmMesoCheck.Value = true then
    mmMesoCheck.Value := false
  else
    mmMesoCheck.Value := true;
  mmMeso.Post;

  mmMeso.First;

  lista_meso := '';
  mmMeso.DisableControls;
  while not mmMeso.Eof do
  begin
    if mmMesoCheck.Value then
      lista_meso := lista_meso + QuotedStr(mmMesoID.AsString) + ',';
    mmMeso.Next;
  end;
  mmMeso.First;

  lista_meso := copy(lista_meso, 1, length(lista_meso) - 1);

  mmMeso.Locate('Nome', cons, [loCaseInsensitive]);
  mmMeso.EnableControls;

  CarregarMicro(lista_meso);
  CarregarCidades(lista_micro);
  CarregarBairros(lista_cidades);
  CarregarClientes;
end;

procedure TFr_representantes_clientes.CarregarMicro(Meso: string);
var
  aux : string;
begin
    aux := '';

  if trim(lista_repr) <> '' then
    aux := '  AND A.MESOCOD IN (SELECT MS.MESOCOD FROM CLIENTE CL '+
           '  INNER JOIN CIDADES CD ON CD.COD_CIDADE = CL.COD_CIDADE '+
           '  INNER JOIN CADMICRO MS ON MS.MICROCOD = CD.MICROCOD '+
           '  WHERE CL.ID_REPRESENTANTE in ('+lista_repr+') ) ';

  dao.Geral1('SELECT a.MICROCOD, a.MICRONOME, a.MESOCOD FROM CADMICRO a WHERE a.MESOCOD IN (' + Meso + ') '+aux);
  dao.Q1.First;
  mmMicro.Open;
  mmMicro.EmptyTable;
  lista_micro := '';

  while not dao.q1.Eof do
  begin
    mmMicro.Append;
    mmMicroID.AsString := dao.Q1.fieldbyname('MICROCOD').AsString;
    mmMicroNome.AsString := dao.Q1.fieldbyname('MICRONOME').AsString;
    mmMicro.Post;
    lista_micro := lista_micro + QuotedStr(mmMicroID.AsString) + ',';
    dao.q1.Next;
  end;
  mmMicro.First;

  lista_micro := copy(lista_micro, 1, length(lista_micro) - 1);

  CarregarCidades(lista_micro);
end;

procedure TFr_representantes_clientes.dgMicroDblClick(Sender: TObject);
begin
  mmMicro.Edit;

  cons := mmMicroNome.AsString;

  if mmMicroCheck.Value = true then
    mmMicroCheck.Value := false
  else
    mmMicroCheck.Value := true;
  mmMicro.Post;

  mmMicro.First;

  lista_micro := '';
  mmMicro.DisableControls;
  while not mmMicro.Eof do
  begin
    if mmMicroCheck.Value then
      lista_micro := lista_micro + QuotedStr(mmMicroID.AsString) + ',';
    mmMicro.Next;
  end;
  mmMicro.First;

  lista_micro := copy(lista_micro, 1, length(lista_micro) - 1);

  mmMicro.Locate('Nome', cons, [loCaseInsensitive]);
  mmmicro.EnableControls;
  if lista_micro <> '' then
    CarregarCidades(lista_micro);
  CarregarClientes;

end;

procedure TFr_representantes_clientes.CarregarCidades(Micro: string);
var
  aux : string;
begin
  aux := '';

  if trim(lista_repr) <> '' then
    aux := '  AND A.COD_CIDADE IN (SELECT CL.COD_CIDADE FROM CLIENTE CL '+
           '  WHERE CL.ID_REPRESENTANTE in ('+lista_repr+') ) ';

  dao.Geral1('SELECT a.COD_CIDADE, a.NOM_CIDADE, a.MICROCOD FROM CIDADES a WHERE a.MICROCOD IN (' + Micro + ') '+aux);
  dao.Q1.First;
  mmCidades.Open;
  mmCidades.EmptyTable;
  lista_cidades := '';
  while not dao.q1.Eof do
  begin
    mmCidades.Append;
    mmCidadesID.AsString := dao.Q1.fieldbyname('COD_CIDADE').AsString;
    mmCidadesNome.AsString := dao.Q1.fieldbyname('NOM_CIDADE').AsString;
    mmCidades.Post;
    lista_cidades := lista_cidades + mmCidadesID.AsString + ',';
    dao.q1.Next;
  end;
  mmCidades.First;
  lista_cidades := copy(lista_cidades, 1, length(lista_cidades) - 1);

  if trim(lista_repr) <> '' then
    CarregarClientes;
end;

procedure TFr_representantes_clientes.dgCidadeDblClick(Sender: TObject);
begin
  mmCidades.Edit;

  cons := mmCidadesNome.AsString;

  if mmCidadesCheck.Value = true then
    mmCidadesCheck.Value := false
  else
    mmCidadesCheck.Value := true;
  mmCidades.Post;

  mmCidades.First;

  lista_cidades := '';
  mmCidades.DisableControls;
  while not mmCidades.Eof do
  begin
    if mmCidadesCheck.Value then
      lista_cidades := lista_cidades + mmCidadesID.AsString + ',';
    mmCidades.Next;
  end;
  mmCidades.First;

  lista_cidades := copy(lista_cidades, 1, length(lista_cidades) - 1);

  mmCidades.Locate('Nome', cons, [loCaseInsensitive]);
  mmCidades.EnableControls;
//  CarregarClientes;

  if lista_micro <> '' then
    CarregarBairros(lista_cidades);


end;

procedure TFr_representantes_clientes.CarregarBairros(Cidades: string);
var
  aux : string;
begin
  aux := '';


  dao.Geral1('SELECT distinct a.BAIRRO FROM CLIENTE a where a.COD_CIDADE in ('+Cidades+') order by a.BAIRRO');


  dao.Q1.First;
  mmBairro.Open;
  mmBairro.EmptyTable;
  lista_bairros := '';
  while not dao.q1.Eof do
  begin
    mmBairro.Append;
    mmBairroNome.AsString := dao.Q1.fieldbyname('BAIRRO').AsString;
    mmBairro.Post;
    lista_bairros := lista_bairros + quotedstr(mmBairroNome.AsString) + ',';
    dao.q1.Next;
  end;
  mmBairro.First;
  lista_bairros := copy(lista_bairros, 1, length(lista_bairros) - 1);

  if trim(lista_cidades) <> '' then
    CarregarClientes;
end;


procedure TFr_representantes_clientes.CarregarClientes;
var
  cmd: string;
begin
  cmd := 'SELECT distinct c.cod_cliente, c.cod_cliente||''-''||c.NOM_CLIENTE as CLIENTE, R.ID||''-''||r.NOM_REPRESENTANTE as representante, cd.nom_cidade||''-''||cd.uf as cidade, c.bairro ' +
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

  if lista_bairros <> '' then
    cmd := cmd + ' and c.bairro in (' + lista_bairros + ') ';


  dao.Geral1(cmd);

  mmClientes.Open;
  mmClientes.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmClientes.Append;
    mmClientesCLIENTE.AsString := dao.Q1.fieldbyname('CLIENTE').AsString;
    mmClientesREPRESENTANTE.AsString := dao.Q1.fieldbyname('REPRESENTANTE').AsString;
    mmClientescod_cliente.AsString := dao.Q1.fieldbyname('COD_CLIENTE').AsString;
    mmClientescidade.AsString := dao.Q1.fieldbyname('cidade').AsString;
    mmClientesbairro.AsString := dao.Q1.fieldbyname('bairro').AsString;
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

procedure TFr_representantes_clientes.dgBairroDblClick(Sender: TObject);
begin
  mmBairro.Edit;

  cons := mmBairroNome.AsString;

  if mmBairroCheck.Value = true then
    mmBairroCheck.Value := false
  else
    mmBairroCheck.Value := true;
  mmBairro.Post;

  mmBairro.First;

  lista_bairros := '';
  mmBairro.DisableControls;
  while not mmBairro.Eof do
  begin
    if mmBairroCheck.Value then
      lista_bairros := lista_bairros + quotedstr(mmBairroNome.AsString) + ',';
    mmBairro.Next;
  end;
  mmBairro.First;

  lista_bairros := copy(lista_bairros, 1, length(lista_bairros) - 1);

  mmBairro.Locate('Nome', cons, [loCaseInsensitive]);
  mmBairro.EnableControls;


  CarregarClientes;
end;

procedure TFr_representantes_clientes.dgBairroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckBairro.DataField) then

    begin
      CheckBairro.Left := Rect.Left + dgRep.Left + 2;
      CheckBairro.Top := Rect.Top + dgRep.top + 2;
      CheckBairro.Width := Rect.Right - Rect.Left;
      CheckBairro.Height := Rect.Bottom - Rect.Top;
      CheckBairro.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckBairro.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgBairro.Canvas.FillRect(Rect);
      DrawFrameControl(dgBairro.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_representantes_clientes.dgBairroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgBairro.SelectedField.FieldName = CheckBairro.DataField) then
  begin
    CheckBairro.SetFocus;
    SendMessage(CheckBairro.Handle, WM_Char, word(Key), 0);
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



