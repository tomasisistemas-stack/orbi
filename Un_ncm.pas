unit Un_ncm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ExtCtrls, Mask,
  sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, DB, Grids, DBGrids, RxMemDS, DBCtrls, acDBGrid, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_ncm = class(TForm)
    GroupBox1: TsGroupBox;
    Codigo: tsLabel;
    Label2: tsLabel;
    PrCODIGO: TsEdit;
    PrDescricao: TsEdit;
    PrIPI_ALIQUOTA: TsCurrencyEdit;
    Label4: tsLabel;
    PrTrib_icms: TComboBox;
    Label8: tsLabel;
    PrCesta_Basica: tscheckbox;
    Panel11: TsPanel;
    gbUF: TsGroupBox;
    edUF: TDBEdit;
    Panel12: TsPanel;
    BtNovoMVA: TsBitBtn;
    BtAltMVA: TsBitBtn;
    BtGravarMVA: TsBitBtn;
    BtCancMVA: TsBitBtn;
    BtExcMVA: TsBitBtn;
    gbMVA: TsGroupBox;
    edMva: TDBEdit;
    gbAliq: TsGroupBox;
    edAliq: TDBEdit;
    gbEscDesc: TsGroupBox;
    DBEdit2: TDBEdit;
    Panel1: TsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    mmMVA: TRxMemoryData;
    dsMVA: TDataSource;
    DBGrid6: Tdbgrid;
    mmMVAUF: TStringField;
    mmMVAMVA: TFloatField;
    mmMVAALIQ_INTERNA: TFloatField;
    sLabel16: TsLabel;
    PrCest: TsEdit;
    mmMVAUF_ORIGEM: TStringField;
    gbUFOrigem: TsGroupBox;
    edUFOrigem: TDBEdit;
    mmMVAALIQ_ICMS: TFloatField;
    q_ncm: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrCODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure PrDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure PrMARGEM_VALOR_AGRE_DENTROKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btexcClick(Sender: TObject);
    procedure PrCODIGOEnter(Sender: TObject);
    procedure PrCODIGOExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtNovoMVAClick(Sender: TObject);
    procedure BtAltMVAClick(Sender: TObject);
    procedure BtGravarMVAClick(Sender: TObject);
    procedure BtCancMVAClick(Sender: TObject);
    procedure BtExcMVAClick(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_true;
    procedure BuscaMVA;

    { Private declarations }
  public

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    ncm: string;
    modo_insert, chamada_tela_grupo_produto: Boolean;
    procedure ativa_ncm(codigo: string);
    procedure mostra_campos(prefixo: string);
    procedure readonly_false;
  end;

var
  fr_ncm: Tfr_ncm;

implementation

uses UnPri, Un_dao, Un_localizar, unfun;

{$R *.dfm}

procedure Tfr_ncm.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  PrCODIGO.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
  mmMVA.EmptyTable;
end;

procedure Tfr_ncm.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).Clear;
    if Components[i] is tscheckbox then
      tscheckbox(Components[i]).Checked := false;
  end;
end;

procedure Tfr_ncm.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;

  BtNovoMVA.Enabled := true;
  BtAltMVA.Enabled := true;
  BtExcMVA.Enabled := true;
end;

procedure Tfr_ncm.btaltClick(Sender: TObject);
begin
  if PrCODIGO.Text = '' then
  begin
    dao.msg('LOCALIZE UM REGISTRO DE CÓDIGO NCM ANTES DE ALTERAR!');
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

procedure Tfr_ncm.btgraClick(Sender: TObject);
var sql: string;
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select codigo from ncm where codigo=' + QuotedStr(Prcodigo.Text)+' and cest = '+QuotedStr(PrCest.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('CÓDIGO NCM/CEST JÁ CADASTRADO' + #13 + 'VERIFIQUE SE O CÓDIGO NCM JÁ ESTÁ CADASTRADO.');
        PrDescricao.SetFocus;
        Exit;
      end;

      if PrCODIGO.text = '' then
      begin
        dao.msg('VOCÊ DEVE INFORMAR O CÓDIGO NCM ANTES DE GRAVA-LA!');
        PrCODIGO.SetFocus;
        Exit;
      end;

      if PrDescricao.text = '' then
      begin
        dao.msg('VOCÊ DEVE INFORMAR A DESCRIÇÃO ANTES DE GRAVA-LA!');
        PrDescricao.SetFocus;
        Exit;
      end;

      if PrCest.text = '' then
      begin
        dao.msg('VOCÊ DEVE INFORMAR O CEST ANTES DE GRAVA-LA!');
        PrCest.SetFocus;
        Exit;
      end;
    end;

    try
     // if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      sql := ' delete FROM MVA a where a.NCM in (select b.ncm from mva b, ncm n where n.cest = a.cest and (substring(n.CODIGO from 1 for 2)||''.''||substring(n.CODIGO from 3 for 2) = b.ncm OR b.NCM = N.CODIGO ) AND N.CEST = '+QUOTEDSTR(PRCEST.TEXT)+' AND N.CODIGO = ' + quotedstr(PRCODIGO.TEXT) + ')';

      dao.Execsql(sql);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
    if mmMVA.Active = false then mmMVA.Active := true;
    mmMVA.First;
    while not mmMVA.Eof do
    begin
      try
       // if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql := ' INSERT INTO MVA (NCM,CEST, UF_ORIGEM, UF, MVA, ALIQ_ICMS_INTERNA, ALIQ_ICMS) ' +
          ' VALUES ( ' + quotedstr(PRCODIGO.Text) + ', '  + quotedstr(PRCEST.Text) + ', '+ quotedstr(mmMVAUF_ORIGEM.AsString) + ', '+ quotedstr(mmMVAUF.AsString) +
          ', ' + FMFUN.BuscaTroca(mmMVAMVA.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmMVAALIQ_INTERNA.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmMVAALIQ_ICMS.AsString, ',', '.') + ') ';
        dao.Execsql(sql);

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      mmMVA.Next;
    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
 //   if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      dao.insert('Pr', 'NCM', '', fr_ncm, '');
      ncm := PrCODIGO.Text;
      ativa_ncm(ncm);
      btNov.setFocus;
    end
    else
      dao.update('NCM', 'CODIGO', PrCODIGO.Text, 'Pr', fr_ncm);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;
  if chamada_tela_grupo_produto then
    ModalResult := mrOk;
end;
//(*end;*)

procedure Tfr_ncm.ativa_ncm(codigo: string);
begin
  with q_ncm do
  begin
    close;
    SQL.Clear;
    SQL.add('select CODIGO, DESCRICAO, MARGEM_VALOR_AGRE_DENTRO, MARGEM_VALOR_AGRE_FORA, CESTA_BASICA, IPI_ALIQUOTA, TRIB_ICMS, RED_BC_ICMS, CEST from ncm where CODIGO = ' + QuotedStr(codigo));
    open;
  end;
end;

procedure Tfr_ncm.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_ncm.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if not q_ncm.fieldbyname(campo1).IsNull then
        TsCurrencyEdit(FindComponent(campo)).value := q_ncm.fieldbyname(campo1).Value;
    end;
    if Components[i] is tscheckbox then
    begin
      campo := tscheckbox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if q_ncm.fieldbyname(campo1).AsString = 'S' then
        tscheckbox(FindComponent(campo)).Checked := true
      else
        tscheckbox(FindComponent(campo)).Checked := false;
    end;
    if Components[i] is TComboBox then
    begin
      campo := TComboBox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TComboBox(FindComponent(campo)).ItemIndex := q_ncm.fieldbyname(campo1).AsInteger;
    end;
  end; //end do for
  BuscaMVA;
end;

procedure Tfr_ncm.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

  BtNovoMVA.Enabled := false;
  BtAltMVA.Enabled := false;
  BtExcMVA.Enabled := false;

end;

procedure Tfr_ncm.btcanClick(Sender: TObject);
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
        ativa_ncm(PrCODIGO.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
      if chamada_tela_grupo_produto then
        ModalResult := mrCancel;
    end
    else
      exit;
  except
  end;
end;

procedure Tfr_ncm.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar NCM';
  chamou_pesquisa := 'fr_ncm';
  chamou_form := 'fr_ncm';
  chamou_cadastro := 'Fr_ncm';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'NCM';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'NCM';
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
    Fr_localizar.loc_ncm(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure Tfr_ncm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure Tfr_ncm.PrCODIGOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure Tfr_ncm.PrDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_ncm.PrMARGEM_VALOR_AGRE_DENTROKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_ncm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_ncm.btexcClick(Sender: TObject);
begin
  if PrDescricao.Text = '' then
  begin
    showmessage('Não é possivel excluir este NCM pois não possui Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('codigo', QuotedStr(q_ncm.fieldbyname('codigo').AsString), 'ncm');
      dao.cn.Commit;
      dao.msg('Registro de NCM foi excluido com sucesso!');
    except
      dao.cn.rollback;
    end;
  end;
  mostra_campos('');
end;

procedure Tfr_ncm.PrCODIGOEnter(Sender: TObject);
begin
  PrCODIGO.Text := FMFUN.TratarCodigoNCM(PrCODIGO.Text, 1);
end;

procedure Tfr_ncm.PrCODIGOExit(Sender: TObject);
begin
  PrCODIGO.Text := FMFUN.TratarCodigoNCM(PrCODIGO.Text, 0);
end;

procedure Tfr_ncm.FormShow(Sender: TObject);
begin
  if chamada_tela_grupo_produto then
    PrCODIGO.SetFocus;
end;


procedure Tfr_ncm.BuscaMVA;
var
  sql: string;
begin
  sql := '';

  dao.Geral1('SELECT a.NCM, a.uf_origem, a.UF, a.MVA, a.ALIQ_ICMS_INTERNA, A.ALIQ_ICMS, A.CEST ' +
    'FROM MVA a, NCM N where a.cest = n.cest and (A.NCM = substring(n.CODIGO from 1 for 2)||''.''||substring(n.CODIGO from 3 for 2) OR A.NCM = N.CODIGO ) ' +
    'AND N.CODIGO = ' + quotedstr(PRCODIGO.TEXT));
  dao.Q1.first;
  mmMVA.Close;
  mmMVA.EmptyTable;
  mmMVA.Open;
  while not dao.Q1.eof do
  begin
    mmMVA.Append;
    mmMVAUF_ORIGEM.AsString := dao.Q1.fieldbyname('UF_ORIGEM').AsString;
    mmMVAUF.AsString := dao.Q1.fieldbyname('UF').AsString;
    mmMVAMVA.AsFloat := dao.Q1.fieldbyname('MVA').AsFloat;
    mmMVAALIQ_INTERNA.AsFloat := dao.Q1.fieldbyname('ALIQ_ICMS_INTERNA').AsFloat;
    mmMVAALIQ_ICMS.AsFloat := dao.Q1.fieldbyname('ALIQ_ICMS').AsFloat;
    mmMVA.Post;
    dao.Q1.next;
  end;
  mmMVA.First;
end;

procedure Tfr_ncm.BtNovoMVAClick(Sender: TObject);
begin
  BtGravarMVA.Enabled := true;
  BtCancMVA.Enabled := true;
  BtAltMVA.Enabled := false;
  BtExcMVA.Enabled := false;
  BtNovoMVA.Enabled := false;

  mmMVA.Append;
  edUF.SetFocus;
end;

procedure Tfr_ncm.BtAltMVAClick(Sender: TObject);
begin
  BtGravarMVA.Enabled := true;
  BtCancMVA.Enabled := true;
  BtAltMVA.Enabled := false;
  BtExcMVA.Enabled := false;
  BtNovoMVA.Enabled := false;

  mmMVA.Edit;
  edUF.SetFocus;
end;

procedure Tfr_ncm.BtGravarMVAClick(Sender: TObject);
begin
  mmMVA.post;

  BtGravarMVA.Enabled := false;
  BtCancMVA.Enabled := false;
  BtAltMVA.Enabled := true;
  BtExcMVA.Enabled := true;
  BtNovoMVA.Enabled := true;
end;

procedure Tfr_ncm.BtCancMVAClick(Sender: TObject);
begin
  mmMVA.cancel;
  BtGravarMVA.Enabled := false;
  BtCancMVA.Enabled := false;
  BtAltMVA.Enabled := true;
  BtExcMVA.Enabled := true;
  BtNovoMVA.Enabled := true;
end;

procedure Tfr_ncm.BtExcMVAClick(Sender: TObject);
begin
  mmMVA.Delete;
  BtGravarMVA.Enabled := false;
  BtCancMVA.Enabled := false;
  BtAltMVA.Enabled := true;
  BtExcMVA.Enabled := true;
  BtNovoMVA.Enabled := true;
end;

end.
