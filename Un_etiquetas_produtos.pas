unit Un_etiquetas_produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, acDBGrid, sEdit, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sComboEdit;

type
  TFmEtiquetasProdutos = class(TForm)
    Panel1: tsPanel;
    btImprimir: TsSpeedButton;
    CheckTodos: tscheckbox;
    Panel3: tsPanel;
    mmMala: TRxMemoryData;
    mmMalacheck: TBooleanField;
    dsPalm: TDataSource;
    dgPalm: Tdbgrid;
    DBCheckBox1: TDBCheckBox;
    mmMalaIDPRODUTO: TIntegerField;
    mmMalaNOME_PRODUTO: TStringField;
    mmMalaVALOR_PROMOCAO: TCurrencyField;
    Panel4: tsPanel;
    Panel5: tsPanel;
    btok: TsBitBtn;
    Lbl_produto: tsLabel;
    Prcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    edProduto: TsEdit;
    sbProduto: TsSpeedButton;
    Lbl_fornecedor: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    Lbfornecedor: tsLabel;
    Lbl_grupo: tsLabel;
    Prcod_grupo: TsComboEdit;
    LbNom_Grupo: tsLabel;
    edGrupo: TsEdit;
    sbGrupo: TsSpeedButton;
    mmMalaSUBCATEGORIA: TIntegerField;
    mmMalaORD_PAUTA: TIntegerField;
    edFornecedor: TsEdit;
    sbFornecedor: TsSpeedButton;
    mmMalaPROMOCAO_PACOTE: TBooleanField;
    gbCopias: TsGroupBox;
    edCopias: TsCurrencyEdit;
    mmMalaqtd_emb: TFloatField;
    mmMalaUNIDADE: TStringField;
    ckMostra: TsCheckBox;
    mmMalamostrar_embalagem: TStringField;
    mmMalaCODIGO_BARRA: TStringField;
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure dgPalmDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btImprimirClick(Sender: TObject);
    procedure dgPalmDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure edCopiasExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CheckTodosClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados;
    procedure CarregaGrid;
  public
    { Public declarations }
  end;

var
  FmEtiquetasProdutos: TFmEtiquetasProdutos;
  totalselecionados: integer;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm,
  un_escolhe_impressora_termica;

{$R *.dfm}


procedure TFmEtiquetasProdutos.CarregaDados;
var
  sql, where: string;
begin
  sql := 'select p.COD_PRODUTO, p.NOM_PRODUTO, P.UNIDADE, P.QTD_EMBALAGEM, p.preco_promocao, p.promocao, p.subcategoria, p.ord_pauta, p.MOSTRAR_EMB_ETIQUETA, P.CODIGO_BARRA from produto p ';

  where := 'WHERE ( 1 = 1 ';

  if trim(edProduto.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_produto', edproduto.Text);

  if trim(edGrupo.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_grupo', edgrupo.Text);

  if trim(edFornecedor.Text) <> '' then
    where := where + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text);

  where := where + ' ) ';

  dao.Geral1(sql + where + ' order by p.ord_pauta limit 100 ');

  CarregaGrid;
end;


procedure TFmEtiquetasProdutos.CarregaGrid;
begin
  dao.Q1.first;
  mmMala.Close;
  mmMala.EmptyTable;
  mmMala.Open;
  while not dao.Q1.eof do
  begin
    mmMala.Append;
    mmMalaIDPRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmMalaNOME_PRODUTO.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
    mmMalaVALOR_PROMOCAO.Value := dao.Q1.fieldbyname('preco_promocao').AsCurrency;
    mmMalaSUBCATEGORIA.Value := dao.Q1.fieldbyname('subcategoria').AsInteger;
    mmMalaORD_PAUTA.Value := dao.Q1.fieldbyname('ORD_PAUTA').AsInteger;
    mmMalaUNIDADE.AsString := dao.Q1.fieldbyname('UNIDADE').AsString;
    mmMalaQTD_EMB.Value := dao.Q1.fieldbyname('QTD_EMBALAGEM').AsFloat;
    mmMalamostrar_embalagem.AsString := dao.Q1.fieldbyname('MOSTRAR_EMB_ETIQUETA').AsString;
    mmMalaCODIGO_BARRA.AsString := dao.Q1.fieldbyname('CODIGO_BARRA').AsString;
    mmMala.Post;
    dao.Q1.next;
  end;
  mmMala.First;
end;


procedure TFmEtiquetasProdutos.Prcod_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_etiqueta_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
  begin
    valor_combo := campos_combo[i];
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
  edProduto.Text := edProduto.Text + ';' + Prcod_produto.Text;
  if pos(';', edProduto.Text) = 1 then
    edProduto.Text := copy(edProduto.Text, 2, length(edProduto.Text));
end;

procedure TFmEtiquetasProdutos.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' + QuotedStr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
      if edproduto.Text = '' then
        edproduto.Text := Prcod_produto.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFmEtiquetasProdutos.Prcod_fornecedorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_etiqueta_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
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

  edFornecedor.Text := edFornecedor.Text + ';' + Prcod_fornecedor.Text;
  if pos(';', edFornecedor.Text) = 1 then
    edFornecedor.Text := copy(edFornecedor.Text, 2, length(edFornecedor.Text));

end;

procedure TFmEtiquetasProdutos.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
      if edFornecedor.Text = '' then
        edFornecedor.Text := Prcod_fornecedor.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmEtiquetasProdutos.Prcod_grupoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'fr_etiqueta_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
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

  edGrupo.Text := edGrupo.Text + ';' + Prcod_grupo.Text;
  if pos(';', edGrupo.Text) = 1 then
    edGrupo.Text := copy(edGrupo.Text, 2, length(edGrupo.Text));

end;

procedure TFmEtiquetasProdutos.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' + QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.Q2.fieldbyname('nom_grupo').AsString;
      if edgrupo.Text = '' then
        edgrupo.Text := Prcod_grupo.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmEtiquetasProdutos.sbProdutoClick(Sender: TObject);
begin
  edProduto.Clear;
end;

procedure TFmEtiquetasProdutos.sbGrupoClick(Sender: TObject);
begin
  edgrupo.Clear;
end;

procedure TFmEtiquetasProdutos.btokClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFmEtiquetasProdutos.dgPalmDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgPalm.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgPalm.top + 2;
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

      dgPalm.Canvas.FillRect(Rect);
      DrawFrameControl(dgPalm.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;


procedure TFmEtiquetasProdutos.btImprimirClick(Sender: TObject);
var
  x: integer;
begin
  mmMala.First;

  Application.CreateForm(Tfr_escolhe_impressora_termica, fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.ModalResult = mrok then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    exit;
    
  while not mmMala.eof do
  begin
    if mmMalacheck.Value = true then
    begin
      for x := 1 to edcopias.asinteger do
      begin
        Fmfun.ImprimeEtiqueta(mmMalaIDPRODUTO.AsString, mmMalaNOME_PRODUTO.AsString, mmMalaQTD_EMB.AsString, mmMalaUNIDADE.AsString, mmMalaCODIGO_BARRA.AsString, FRPRI.Tipo_Etiqueta, mmMalamostrar_embalagem.AsString = 'S', true);
        sleep(1000);
      end;
    end;
    sleep(1000);
    mmMala.Next;
  end;
  mmMala.First;
end;

procedure TFmEtiquetasProdutos.dgPalmDblClick(Sender: TObject);
begin
  mmMala.Edit;
  if mmMalaCheck.Value = true then
  begin
    mmMalaCheck.Value := false;
    totalselecionados := totalselecionados - 1;
  end
  else begin
    mmMalaCheck.Value := true;
    totalselecionados := totalselecionados + 1;
  end;
  mmMala.Post;
end;

procedure TFmEtiquetasProdutos.FormShow(Sender: TObject);
begin
  btokClick(self);
end;

procedure TFmEtiquetasProdutos.sbFornecedorClick(Sender: TObject);
begin
  edFornecedor.Clear;
end;

procedure TFmEtiquetasProdutos.edCopiasExit(Sender: TObject);
begin
  if trim(edCopias.Text) = '' then edCopias.value := 1;
end;

procedure TFmEtiquetasProdutos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmEtiquetasProdutos.CheckTodosClick(Sender: TObject);
begin
  mmMala.First;
  while not mmMala.eof do
  begin
    mmMalacheck.Value := CheckTodos.Checked;
    mmMala.Next;
  end;
  mmMala.First;
end;

end.



