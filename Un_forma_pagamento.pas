unit Un_forma_pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  Mask, Grids, DBGrids, SToolEdit, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit,
  sComboEdit,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RxToolEdit;

type
  TFr_forma_pagamento = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    Btalt: TsBitBtn;
    Btgra: TsBitBtn;
    Btcan: TsBitBtn;
    Btexc: TsBitBtn;
    Btpro: TsBitBtn;
    Panel2: tsPanel;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Label4: tsLabel;
    Prcod_fop: TsEdit;
    PrNom_fop: TsEdit;
    PrAtivo: tsCheckbox;
    PrInativo_Palm: tsCheckbox;
    PrDesconto: TsCurrencyEdit;
    PrAVista: TsCheckBox;
    PrPrazo_Padrao: TsComboEdit;
    Lbprazo_pgto: TsLabel;
    Label17: TsLabel;
    sLabel1: TsLabel;
    PrCONTA_PADRAO: TsComboEdit;
    lb_conta: TsLabel;
    PrNao_Gerar_CR: TsCheckBox;
    q_fop: TFDQuery;
    GroupBox2: TsGroupBox;
    dgPrazos: TDBGrid;
    dsPrazos: TDataSource;
    q_prazos: TFDQuery;
    BtAddPrazo: TsBitBtn;
    BtRemPrazo: TsBitBtn;
    EdPrazoRelacionado: TComboEdit;
    LbPrazoRelacionado: TsLabel;
    procedure BtnovClick(Sender: TObject);
    procedure BtaltClick(Sender: TObject);
    procedure BtgraClick(Sender: TObject);
    procedure BtcanClick(Sender: TObject);
    procedure BtexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure PrNom_fopKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrPrazo_PadraoButtonClick(Sender: TObject);
    procedure PrPrazo_PadraoExit(Sender: TObject);
    procedure PrCONTA_PADRAOButtonClick(Sender: TObject);
    procedure PrCONTA_PADRAOExit(Sender: TObject);
    procedure BtAddPrazoClick(Sender: TObject);
    procedure BtRemPrazoClick(Sender: TObject);
    procedure EdPrazoRelacionadoButtonClick(Sender: TObject);
    procedure EdPrazoRelacionadoExit(Sender: TObject);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
    procedure CarregarPrazoPadraoAssociado;
    procedure SincronizarPrazoPadrao;
    procedure CarregarPrazosRelacionados;
    procedure AdicionarPrazoRelacionado(const AIdPrazo: string);
    procedure RemoverPrazoRelacionado;

  public
    modo_insert: boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure AdicionarPrazosRelacionados(const AIdsPrazo: string);
    procedure ativa_fop(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_forma_pagamento: TFr_forma_pagamento;

implementation

uses UnPri, Un_dao, Un_localizar, UnFun, Un_Error_Logger;

{$R *.dfm}

{ TFr_prazo_pagamento }

procedure TFr_forma_pagamento.ativa_fop(id: string);
begin
  with q_fop do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from fop where cod_fop = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_forma_pagamento.CarregarPrazoPadraoAssociado;
begin
  if (Trim(Prcod_fop.Text) <> '') and (Trim(PrPrazo_Padrao.Text) = '') then
  begin
    dao.Geral2('select id_prazo from fop_prazo where cod_fop = ' +
      QuotedStr(Prcod_fop.Text) + ' and padrao = ''S'' order by id_prazo');
    if dao.Q2.RecordCount > 0 then
      PrPrazo_Padrao.Text := dao.Q2.fieldbyname('id_prazo').AsString;
  end;
end;

procedure TFr_forma_pagamento.SincronizarPrazoPadrao;
begin
  if Trim(Prcod_fop.Text) = '' then
    Exit;
  dao.Execsql('delete from fop_prazo where cod_fop = ' + QuotedStr(Prcod_fop.Text) +
    ' and padrao = ''S''');

  if Trim(PrPrazo_Padrao.Text) <> '' then
  begin
    dao.Execsql('update fop_prazo set padrao = ''S'' where cod_fop = ' +
      QuotedStr(Prcod_fop.Text) + ' and id_prazo = ' + QuotedStr(PrPrazo_Padrao.Text));
    dao.Execsql('insert into fop_prazo (cod_fop, id_prazo, padrao) ' +
      'select ' + QuotedStr(Prcod_fop.Text) + ', ' + QuotedStr(PrPrazo_Padrao.Text) + ', ''S'' ' +
      'where not exists (select 1 from fop_prazo where cod_fop = ' +
      QuotedStr(Prcod_fop.Text) + ' and id_prazo = ' + QuotedStr(PrPrazo_Padrao.Text) + ')');
  end;
end;

procedure TFr_forma_pagamento.CarregarPrazosRelacionados;
begin
  q_prazos.Close;

  if Trim(Prcod_fop.Text) = '' then
    Exit;

  q_prazos.SQL.Text :=
    'select fp.id_prazo, p.prazo, coalesce(fp.padrao, ''N'') as padrao ' +
    'from fop_prazo fp inner join prazo p on p.id = fp.id_prazo ' +
    'where fp.cod_fop = ' + QuotedStr(Prcod_fop.Text) + ' ' +
    'order by coalesce(fp.padrao, ''N'') desc, p.prazo';
  q_prazos.Open;
end;

procedure TFr_forma_pagamento.AdicionarPrazoRelacionado(const AIdPrazo: string);
var
  QExec: TFDQuery;
begin
  if Trim(Prcod_fop.Text) = '' then
  begin
    dao.msg('LOCALIZE OU GRAVE A FORMA DE PAGAMENTO ANTES DE VINCULAR PRAZOS!');
    Exit;
  end;

  if Trim(AIdPrazo) = '' then
    Exit;

  if not FMFUN.verificaNumerico(AIdPrazo) then
  begin
    dao.msg('Código do prazo deve ser numérico!');
    Exit;
  end;

  dao.Geral2('select id from prazo where id = ' + QuotedStr(AIdPrazo));
  if dao.Q2.RecordCount <= 0 then
  begin
    dao.msg('Prazo não encontrado!');
    Exit;
  end;

  QExec := TFDQuery.Create(nil);
  try
    QExec.Connection := dao.CN;
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    QExec.SQL.Text := 'insert into fop_prazo (cod_fop, id_prazo, padrao) ' +
      'select ' + QuotedStr(Prcod_fop.Text) + ', ' + QuotedStr(AIdPrazo) + ', ''N'' ' +
      'where not exists (select 1 from fop_prazo where cod_fop = ' +
      QuotedStr(Prcod_fop.Text) + ' and id_prazo = ' + QuotedStr(AIdPrazo) + ')';
    QExec.ExecSQL;

    dao.cn.Commit;
    CarregarPrazosRelacionados;
  except
    on E: Exception do
    begin
      if dao.cn.InTransaction then
        dao.cn.Rollback;
      RegistrarErroAplicacao(E, 'TFr_forma_pagamento.AdicionarPrazoRelacionado', QExec.SQL.Text, 'cod_fop=' + Prcod_fop.Text + '; id_prazo=' + AIdPrazo);
      dao.msg('Erro ao gravar prazo relacionado!' + #13 + E.Message);
    end;
  end;
  QExec.Free;
end;

procedure TFr_forma_pagamento.AdicionarPrazosRelacionados(const AIdsPrazo: string);
var
  QExec: TFDQuery;
  Lista: TStringList;
  I: Integer;
  IdPrazo, SQLText: string;
begin
  if Trim(Prcod_fop.Text) = '' then
  begin
    dao.msg('LOCALIZE OU GRAVE A FORMA DE PAGAMENTO ANTES DE VINCULAR PRAZOS!');
    Exit;
  end;

  Lista := TStringList.Create;
  QExec := TFDQuery.Create(nil);
  try
    Lista.Text := StringReplace(StringReplace(StringReplace(AIdsPrazo, ',', #13#10, [rfReplaceAll]), ';', #13#10, [rfReplaceAll]), '''', '', [rfReplaceAll]);
    QExec.Connection := dao.CN;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    try
      for I := 0 to Lista.Count - 1 do
      begin
        IdPrazo := Trim(Lista[I]);
        if IdPrazo = '' then
          Continue;

        if not FMFUN.verificaNumerico(IdPrazo) then
          raise Exception.Create('Código do prazo deve ser numérico: ' + IdPrazo);

        SQLText := 'insert into fop_prazo (cod_fop, id_prazo, padrao) ' +
          'select ' + QuotedStr(Prcod_fop.Text) + ', ' + QuotedStr(IdPrazo) + ', ''N'' ' +
          'where exists (select 1 from prazo where id = ' + QuotedStr(IdPrazo) + ') ' +
          'and not exists (select 1 from fop_prazo where cod_fop = ' +
          QuotedStr(Prcod_fop.Text) + ' and id_prazo = ' + QuotedStr(IdPrazo) + ')';
        QExec.SQL.Text := SQLText;
        QExec.ExecSQL;
      end;

      dao.cn.Commit;
      CarregarPrazosRelacionados;
    except
      on E: Exception do
      begin
        if dao.cn.InTransaction then
          dao.cn.Rollback;
        RegistrarErroAplicacao(E, 'TFr_forma_pagamento.AdicionarPrazosRelacionados', QExec.SQL.Text, 'cod_fop=' + Prcod_fop.Text + '; ids=' + AIdsPrazo);
        dao.msg('Erro ao gravar prazos relacionados!' + #13 + E.Message);
      end;
    end;
  finally
    QExec.Free;
    Lista.Free;
  end;
end;
procedure TFr_forma_pagamento.RemoverPrazoRelacionado;
var
  QExec: TFDQuery;
  IdPrazo: string;
begin
  if q_prazos.IsEmpty then
    Exit;

  if q_prazos.fieldbyname('padrao').AsString = 'S' then
  begin
    dao.msg('Não é possível remover o prazo padrão por aqui. Limpe ou altere o Prazo Pagamento.');
    Exit;
  end;

  if MessageDlg('Remover este prazo da forma de pagamento?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    Exit;

  IdPrazo := q_prazos.fieldbyname('id_prazo').AsString;
  QExec := TFDQuery.Create(nil);
  try
    QExec.Connection := dao.CN;
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    QExec.SQL.Text := 'delete from fop_prazo where cod_fop = ' + QuotedStr(Prcod_fop.Text) +
      ' and id_prazo = ' + QuotedStr(IdPrazo);
    QExec.ExecSQL;

    dao.cn.Commit;
    CarregarPrazosRelacionados;
  except
    on E: Exception do
    begin
      if dao.cn.InTransaction then
        dao.cn.Rollback;
      RegistrarErroAplicacao(E, 'TFr_forma_pagamento.RemoverPrazoRelacionado', QExec.SQL.Text, 'cod_fop=' + Prcod_fop.Text + '; id_prazo=' + IdPrazo);
      dao.msg('Erro ao remover prazo relacionado!' + #13 + E.Message);
    end;
  end;
  QExec.Free;
end;

procedure TFr_forma_pagamento.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).Clear;
    if Components[i] is tsCheckbox then
      tsCheckbox(Components[i]).Checked := false;
  end;
  Lbprazo_pgto.Caption := '...';
  EdPrazoRelacionado.Clear;
  LbPrazoRelacionado.Caption := '...';
  q_prazos.Close;
end;

procedure TFr_forma_pagamento.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_fop.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsComboEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsComboEdit(FindComponent(campo)).Text := q_fop.fieldbyname(campo1).AsString;
    end;

    if Components[i] is tsCheckbox then
    begin
      campo := tsCheckbox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if q_fop.fieldbyname(campo1).AsString = 'S' then
        tsCheckbox(FindComponent(campo)).Checked := true
      else
        tsCheckbox(FindComponent(campo)).Checked := false;
    end;
  end;
  CarregarPrazoPadraoAssociado;
  PrPrazo_PadraoExit(Self);
  EdPrazoRelacionado.Clear;
  LbPrazoRelacionado.Caption := '...';
  CarregarPrazosRelacionados;
end;

procedure TFr_forma_pagamento.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is tsCheckbox then
      tsCheckbox(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_forma_pagamento.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
    if Components[i] is tsCheckbox then
      tsCheckbox(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_forma_pagamento.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  PrNom_FOP.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_forma_pagamento.BtaltClick(Sender: TObject);
begin
  if PrCOD_FOP.Text = '' then
  begin
    dao.msg('LOCALIZE A FORMA DE PAGAMENTO ANTES DE ALTERAR!');
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

procedure TFr_forma_pagamento.BtgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select NOM_FOP from FOP where NOM_FOP =' + QuotedStr(PrNom_FOP.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UMA DESCRIÇÃO IGUAL' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO A MESMA 2 VEZES!');
        PrNom_FOP.SetFocus;
        Exit;
      end;

      if PrNom_FOP.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
        Exit;
      end;

    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.Insert('Pr', 'fop', 'cod_fop', Fr_forma_pagamento, 'gen_fop');
      Prcod_fop.Text := id;
      ativa_fop(id);
      btNov.setFocus;
    end
    else
      dao.update('fop', 'cod_fop', Prcod_fop.Text, 'Pr', Fr_forma_pagamento);

    SincronizarPrazoPadrao;
    dao.cn.commit;
    CarregarPrazosRelacionados;
    readonly_true;
  except
  end;

end;

procedure TFr_forma_pagamento.BtcanClick(Sender: TObject);
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
        ativa_fop(PrCOD_FOP.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_forma_pagamento.BtexcClick(Sender: TObject);
begin
  if Prcod_fop.Text = '' then
  begin
    showmessage('Não é possivel excluir pois não tem Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda
  dao.Geral1('SELECT COUNT(*) as total FROM VENDAS1 WHERE COD_FOP = ' + Prcod_fop.Text);
  if dao.Q1.fieldbyname('total').AsInteger > 0 then
  begin
    dao.msg('Este registro não pode ser excluído pois o mesmo está associado nas Vendas!');
    exit;
  end
  else
  begin
    if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('cod_fop', q_fop.fieldbyname('cod_fop').AsString, 'fop');
      dao.cn.Commit;
      dao.msg('Este forma de pagamento excluida com sucesso!');
    end;
    mostra_campos('');
  end;
end;

procedure TFr_forma_pagamento.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome';

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
    Fr_localizar.loc_fop(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  busca_qualquer_posicao_pesquisada := true;
end;

procedure TFr_forma_pagamento.FormCloseQuery(Sender: TObject;
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

procedure TFr_forma_pagamento.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_forma_pagamento.PrNom_fopKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_forma_pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;


procedure TFr_forma_pagamento.PrPrazo_PadraoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_prazo';
  chamou_form := 'fr_forma_prazo';
  chamou_cadastro := 'fr_prazo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'prazo';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
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

procedure TFr_forma_pagamento.PrPrazo_PadraoExit(Sender: TObject);
begin
  if trim(PrPrazo_Padrao.Text) = '' then
    Lbprazo_pgto.Caption := '...';

  if PrPrazo_Padrao.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(PrPrazo_Padrao.Text)) and
      (length(PrPrazo_Padrao.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrPrazo_Padrao.SetFocus;
      exit;
    end;

    dao.Geral2('select prazo, desconto from prazo where id =' +QuotedStr(PrPrazo_Padrao.Text));
    if dao.q2.RecordCount > 0 then
      Lbprazo_pgto.Caption := dao.Q2.fieldbyname('prazo').AsString
    else
    begin
      dao.msg('Registro não Encontrado ou não Ativo!');
      PrPrazo_Padrao.Text := '';
      PrPrazo_Padrao.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_forma_pagamento.EdPrazoRelacionadoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Prazo';
  chamou_pesquisa := 'fr_prazo';
  chamou_form := 'fr_forma_prazo_relacionado';
  chamou_cadastro := 'fr_prazo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'prazo';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);

  Fr_localizar.CBcampos.ItemIndex := 1;
  Fr_localizar.loc_prazo_pagamento('');

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_forma_pagamento.EdPrazoRelacionadoExit(Sender: TObject);
begin
  if Trim(EdPrazoRelacionado.Text) = '' then
  begin
    LbPrazoRelacionado.Caption := '...';
    Exit;
  end;

  if not FMFUN.verificaNumerico(EdPrazoRelacionado.Text) then
  begin
    dao.msg('Dado tem que ser sempre Numérico!');
    EdPrazoRelacionado.SetFocus;
    Exit;
  end;

  dao.Geral2('select prazo from prazo where id = ' + QuotedStr(EdPrazoRelacionado.Text));
  if dao.Q2.RecordCount > 0 then
    LbPrazoRelacionado.Caption := dao.Q2.fieldbyname('prazo').AsString
  else
  begin
    dao.msg('Prazo não encontrado!');
    EdPrazoRelacionado.Text := '';
    LbPrazoRelacionado.Caption := '...';
    EdPrazoRelacionado.SetFocus;
  end;
end;
procedure TFr_forma_pagamento.BtAddPrazoClick(Sender: TObject);
begin
  EdPrazoRelacionadoExit(Self);
  AdicionarPrazoRelacionado(EdPrazoRelacionado.Text);
  EdPrazoRelacionado.Clear;
  LbPrazoRelacionado.Caption := '...';
end;

procedure TFr_forma_pagamento.BtRemPrazoClick(Sender: TObject);
begin
  RemoverPrazoRelacionado;
end;
procedure TFr_forma_pagamento.PrCONTA_PADRAOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_fop';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';

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

procedure TFr_forma_pagamento.PrCONTA_PADRAOExit(Sender: TObject);
begin
  if trim(PrCONTA_PADRAO.Text) = '' then
    lb_conta.Caption := '...'
  else
  begin
    if (not FMFUN.verificaNumerico(PrCONTA_PADRAO.Text)) and
      (length(PrCONTA_PADRAO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrCONTA_PADRAO.SetFocus;
      exit;
    end;

    dao.Geral2('select c.id, e.cod_empresa, C.DIAS_PROTESTO, b.NOM_BANCO, b.NR_BANCO, b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, c.convenio, C.NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ ' +
      'from conta_corrente c inner join banco b on b.ID = c.ID_BANCO inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
      'where c.id=' + QuotedStr(PrCONTA_PADRAO.Text));

    if dao.q2.RecordCount > 0 then
    begin
      lb_conta.Caption := dao.Q2.fieldbyname('nom_banco').AsString + ' - ' +
        dao.Q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.Q2.fieldbyname('nr_conta').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCONTA_PADRAO.Text := '';
      PrCONTA_PADRAO.SetFocus;
      Exit;
    end;
  end;

end;

end.

