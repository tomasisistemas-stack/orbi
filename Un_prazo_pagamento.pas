unit Un_prazo_pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  Mask, Grids, DBGrids, DBCtrls, RXDBCtrl,
  DB, RxMemDS, sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, acDBGrid,
  sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit, sComboEdit,
  sDBText,  RxToolEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_prazo_pagamento = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Prid: TsEdit;
    Prprazo: TsEdit;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    Btalt: TsBitBtn;
    Btgra: TsBitBtn;
    Btcan: TsBitBtn;
    Btexc: TsBitBtn;
    Btpro: TsBitBtn;
    lb: tsLabel;
    Prqtd_parcelas: TsEdit;
    Label2: tsLabel;
    Label3: tsLabel;
    PrAtivo: tscheckbox;
    PrInativo_Palm: tscheckbox;
    PrDesconto: TsCurrencyEdit;
    Label4: tsLabel;
    Label5: tsLabel;
    PrVALOR_MINIMO_PEDIDO: TsCurrencyEdit;
    GroupBox2: TsGroupBox;
    Panel9: tsPanel;
    ft_lb_nom_representante: tsLabel;
    BtPesqDesc: TsBitBtn;
    ft_representante: TsComboEdit;
    Panel11: tsPanel;
    gbRepre: TsGroupBox;
    Lbnom_representante: TsDBText;
    edId_representante: TRxDBComboEdit;
    gbDescMax: TsGroupBox;
    edValorMinimo: TDBEdit;
    Panel12: tsPanel;
    BtNovoValorMinimo: TsBitBtn;
    BtAltValorMinimo: TsBitBtn;
    BtGravarValorMinimo: TsBitBtn;
    BtCancValorMinimo: TsBitBtn;
    BtExcValorMinimo: TsBitBtn;
    DBGrid6: Tdbgrid;
    mmValorMinimo: TRxMemoryData;
    mmValorMinimoID_REPRESENTANTE: TIntegerField;
    mmValorMinimoNOME_REPRESENTANTE: TStringField;
    dsDescEspecial: TDataSource;
    mmValorMinimoVALOR_MINIMO: TCurrencyField;
    q_prazo: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure BtaltClick(Sender: TObject);
    procedure BtgraClick(Sender: TObject);
    procedure BtcanClick(Sender: TObject);
    procedure BtexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure PrprazoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaValorMinimo;
    procedure BtNovoValorMinimoClick(Sender: TObject);
    procedure BtAltValorMinimoClick(Sender: TObject);
    procedure BtCancValorMinimoClick(Sender: TObject);
    procedure BtExcValorMinimoClick(Sender: TObject);
    procedure BtGravarValorMinimoClick(Sender: TObject);
    procedure BtPesqDescClick(Sender: TObject);
    procedure edId_representanteExit(Sender: TObject);
    procedure edId_representanteButtonClick(Sender: TObject);

  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;

  public
    modo_insert: boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure ativa_prazo(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_prazo_pagamento: TFr_prazo_pagamento;

implementation

uses UnPri, Un_dao, Un_localizar, UnFun;

{$R *.dfm}

{ TFr_prazo_pagamento }

procedure TFr_prazo_pagamento.BuscaValorMinimo;
var
  sql_representante: string;
begin
  sql_representante := '';

  if trim(ft_representante.Text) <> '' then
    sql_representante := ' AND PR.ID_REPRESENTANTE = ' + ft_representante.Text;

  dao.Geral1('select pr.ID_REPRESENTANTE, r.NOM_REPRESENTANTE, pr.VALOR_MINIMO ' +
    'from REPRESENTANTE r inner join PRAZO_REPRESENTANTE pr on (pr.ID_REPRESENTANTE = r.ID) where pr.ID_PRAZO = ' + PRID.Text + sql_representante);
  dao.Q1.first;
  mmValorMinimo.Close;
  mmValorMinimo.EmptyTable;
  mmValorMinimo.Open;
  while not dao.Q1.eof do
  begin
    mmValorMinimo.Append;
    mmValorMinimoID_REPRESENTANTE.AsString := dao.Q1.fieldbyname('ID_REPRESENTANTE').AsString;
    mmValorMinimoNOME_REPRESENTANTE.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmValorMinimoVALOR_MINIMO.VALUE := dao.Q1.fieldbyname('VALOR_MINIMO').VALUE;
    mmValorMinimo.Post;
    dao.Q1.next;
  end;
  mmValorMinimo.First;
end;

procedure TFr_prazo_pagamento.ativa_prazo(id: string);
begin
  with q_prazo do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from prazo where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_prazo_pagamento.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is tscheckbox then
      tscheckbox(Components[i]).Checked := false;
  end;
end;

procedure TFr_prazo_pagamento.mostra_campos(prefixo: string);
var
  campo, campo1: string; //campo tem o nome do  sem tirar as primeiras letras
  //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsEdit(FindComponent(campo)).Text := q_prazo.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if not q_prazo.fieldbyname(campo1).IsNull then
        TsCurrencyEdit(FindComponent(campo)).Value := q_prazo.fieldbyname(campo1).Value
    end;

    if Components[i] is tscheckbox then
    begin
      campo := tscheckbox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if q_prazo.fieldbyname(campo1).AsString = 'S' then
        tscheckbox(FindComponent(campo)).Checked := true
      else
        tscheckbox(FindComponent(campo)).Checked := false;
    end;
  end;

  BuscaValorMinimo;

end;

procedure TFr_prazo_pagamento.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is tscheckbox then
      tscheckbox(Components[i]).enabled := true;
  end;
end;

procedure TFr_prazo_pagamento.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
    if Components[i] is tscheckbox then
      tscheckbox(Components[i]).Enabled := false;
  end;
end;

procedure TFr_prazo_pagamento.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prprazo.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_prazo_pagamento.BtaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE UM PRAZO ANTES DE ALTERAR!');
    exit;
  end;
  modo_insert := false;
  readonly_false;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_prazo_pagamento.BtgraClick(Sender: TObject);
var
  sql: string;
  function QuantidadeParcelas: integer;
  var Parcelas: TStringList;
  begin
    Parcelas := TStringList.Create;
    Parcelas := fmfun.Explode(PrPrazo.Text, '/');
    Result := Parcelas.Count;
    Parcelas.Free;
  end;
begin
  try
    if Prqtd_parcelas.text = '' then
    begin
      dao.msg('VOCÊ DEVE PREENCHER O CAMPO Nº PARCELAS!');
      Prqtd_parcelas.SetFocus;
      Exit;
    end;

    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select prazo from prazo where prazo=' + QuotedStr(Prprazo.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UMA DESCRIÇÃO IGUAL' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO A MESMA 2 VEZES!');
        Prprazo.SetFocus;
        Exit;
      end;

      if Prprazo.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
        Exit;
      end;

    end;

    if PRID.Text <> '' then
    begin
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql := ' DELETE FROM PRAZO_REPRESENTANTE WHERE ID_PRAZO = ' + PRID.Text;
        dao.Execsql(sql);
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;
    end;

    if not mmValorMinimo.IsEmpty then
    begin
      mmValorMinimo.First;
      while not mmValorMinimo.Eof do
      begin
        try
          if not (dao.cn.InTransaction) then
            (dao.cn.StartTransaction);
          sql := ' INSERT INTO PRAZO_REPRESENTANTE (ID_PRAZO, ID_REPRESENTANTE, VALOR_MINIMO) ' +
            ' VALUES ( ' + PRid.Text + ', ' + mmValorMinimoID_REPRESENTANTE.AsString +
            ', ' + FMFUN.BuscaTroca(mmValorMinimoVALOR_MINIMO.AsString, ',', '.') + ') ';
          dao.Execsql(sql);

          dao.cn.Commit;
        except
          dao.cn.rollback;
        end;

        mmValorMinimo.Next;
      end;
    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;

    Prqtd_parcelas.Text := inttostr(QuantidadeParcelas);

    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.Insert('Pr', 'prazo', 'id', Fr_prazo_pagamento, 'gen_prazo');
      Prid.Text := id;
      ativa_prazo(id);
      btNov.setFocus;
    end
    else
      dao.update('prazo', 'id', Prid.Text, 'Pr', Fr_prazo_pagamento);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_prazo_pagamento.BtcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        ativa_prazo(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_prazo_pagamento.BtexcClick(Sender: TObject);
begin
  if Prprazo.Text = '' then
  begin
    showmessage('Não é possivel excluir pois não tem Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda
  dao.Geral1('SELECT COUNT(*) as total FROM VENDAS1 WHERE COD_PRAZO_PGTO = ' + PRID.Text);
  if dao.Q1.fieldbyname('total').AsInteger > 0 then
  begin
    dao.msg('Este registro não pode ser excluído pois o mesmo está associado nas Vendas!');
    exit;
  end
  else
  begin
    if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.delete('id', q_prazo.fieldbyname('id').AsString, 'prazo');
        dao.cn.Commit;
        dao.msg('Este prazo e forma de pagamento excluida com sucesso!');
      except
        dao.cn.rollback;
      end;

    end;
    mostra_campos('');
  end;
end;

procedure TFr_prazo_pagamento.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar prazo e pagamento';
  chamou_pesquisa := 'fr_prazo';
  chamou_form := 'fr_prazo';
  chamou_cadastro := 'Fr_prazo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Prazo e pagamento';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_prazo_pagamento(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_prazo_pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Grave ou Cancele as informações antes de sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_prazo_pagamento.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_prazo_pagamento.PrprazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_prazo_pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;



procedure TFr_prazo_pagamento.BtNovoValorMinimoClick(Sender: TObject);
begin
  if Btnov.Enabled = true then
  begin
    dao.msg('Você deve Clicar no Botão Alterar ou Inserir!');
    exit;
  end;

  BtGravarValorMinimo.Enabled := true;
  BtCancValorMinimo.Enabled := true;
  BtAltValorMinimo.Enabled := false;
  BtExcValorMinimo.Enabled := false;
  BtNovoValorMinimo.Enabled := false;

  mmValorMinimo.Append;
  edid_representante.SetFocus;

end;

procedure TFr_prazo_pagamento.BtAltValorMinimoClick(Sender: TObject);
begin
  if Btnov.Enabled = true then
  begin
    dao.msg('Você deve Clicar no Botão Alterar ou Inserir!');
    exit;
  end;

  if mmValorMinimo.IsEmpty then exit;

  BtGravarValorMinimo.Enabled := true;
  BtCancValorMinimo.Enabled := true;
  BtAltValorMinimo.Enabled := false;
  BtExcValorMinimo.Enabled := false;
  BtNovoValorMinimo.Enabled := false;

  mmValorMinimo.Edit;
  edid_representante.SetFocus;
end;

procedure TFr_prazo_pagamento.BtCancValorMinimoClick(Sender: TObject);
begin
  mmValorMinimo.cancel;
  BtGravarValorMinimo.Enabled := false;
  BtCancValorMinimo.Enabled := false;
  BtAltValorMinimo.Enabled := true;
  BtExcValorMinimo.Enabled := true;
  BtNovoValorMinimo.Enabled := true;
end;

procedure TFr_prazo_pagamento.BtExcValorMinimoClick(Sender: TObject);
begin
  mmValorMinimo.Delete;
  BtGravarValorMinimo.Enabled := false;
  BtCancValorMinimo.Enabled := false;
  BtAltValorMinimo.Enabled := true;
  BtExcValorMinimo.Enabled := true;
  BtNovoValorMinimo.Enabled := true;
end;

procedure TFr_prazo_pagamento.BtGravarValorMinimoClick(Sender: TObject);
begin
  mmValorMinimoNOME_REPRESENTANTE.AsString := lbnom_representante.Caption;
  mmValorMinimo.post;

  BtGravarValorMinimo.Enabled := false;
  BtCancValorMinimo.Enabled := false;
  BtAltValorMinimo.Enabled := true;
  BtExcValorMinimo.Enabled := true;
  BtNovoValorMinimo.Enabled := true;
end;

procedure TFr_prazo_pagamento.BtPesqDescClick(Sender: TObject);
begin
  BuscaValorMinimo;
end;

procedure TFr_prazo_pagamento.edId_representanteExit(Sender: TObject);
begin
  if trim(Edid_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Edid_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(Edid_representante.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Edid_representante.Text := '';
      Edid_representante.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_prazo_pagamento.edId_representanteButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_prazo_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

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

end;

end.
