unit Un_grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,
   Grids,  ComCtrls, DBGrids,
  DBCtrls, RXDBCtrl, DB, RxMemDS, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, acDBGrid, sEdit, sMaskEdit, sCustomComboEdit, sComboEdit,
  RxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_grupo = class(TForm)
    q_grupo: TFDQuery;
    ds_template_grupo: TDataSource;
    GroupBox1: TsGroupBox;
    Label2: tsLabel;
    Prmargem_valor_agregado_st: TsEdit;
    Panel2: tsPanel;
    Label22: tsLabel;
    PrNCM: TsComboEdit;
    PrNom_grupo: TsEdit;
    Label25: tsLabel;
    Prcod_grupo: TsEdit;
    Label1: tsLabel;
    GroupBox2: TsGroupBox;
    Panel9: tsPanel;
    ft_lb_nom_representante: tsLabel;
    BtPesqDesc: TsBitBtn;
    ft_representante: TsComboEdit;
    Panel11: tsPanel;
    gbRepre: TsGroupBox;
    Lbnom_representante: TDBText;
    edId_representante: TRxDBComboEdit;
    gbDescMax: TsGroupBox;
    edDescMaximo: TDBEdit;
    Panel12: tsPanel;
    BtNovoDescEsp: TsBitBtn;
    BtAltDescEsp: TsBitBtn;
    BtGravarDescEsp: TsBitBtn;
    BtCancDescEsp: TsBitBtn;
    BtExcDescEsp: TsBitBtn;
    DBGrid6: Tdbgrid;
    mmDescEspecial: TRxMemoryData;
    mmDescEspecialID_REPRESENTANTE: TIntegerField;
    mmDescEspecialNOME_REPRESENTANTE: TStringField;
    mmDescEspecialDESCONTO_MAXIMO: TFloatField;
    sPanel1: TsPanel;
    Panel1: TsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    dsDescEspecial: TDataSource;
    sLabel16: TsLabel;
    PrCest: TsEdit;
    mmDescEspecialCIDADE: TStringField;
    ft_Cidade: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    ckTodos: TCheckBox;
    ckAltTodos: TCheckBox;
    q_template_grupo: TFDQuery;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure Prcod_grupoKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure zzcod_TamanhoButtonClick(Sender: TObject);
    procedure PrNCMButtonClick(Sender: TObject);
    procedure PrNCMEnter(Sender: TObject);
    procedure PrNCMExit(Sender: TObject);
    procedure PrNCMKeyPress(Sender: TObject; var Key: Char);
    procedure BtNovoDescEspClick(Sender: TObject);
    procedure BtAltDescEspClick(Sender: TObject);
    procedure BtGravarDescEspClick(Sender: TObject);
    procedure BtCancDescEspClick(Sender: TObject);
    procedure BtExcDescEspClick(Sender: TObject);
    procedure BtPesqDescClick(Sender: TObject);
    procedure ft_representanteExit(Sender: TObject);
    procedure edId_representanteExit(Sender: TObject);
    procedure ft_representanteButtonClick(Sender: TObject);
    procedure edId_representanteButtonClick(Sender: TObject);
    procedure navAfterAction(Sender: TObject);
    procedure PrCestExit(Sender: TObject);
  private
    procedure TratarNCM;
    procedure AtualizarTodos;

    { Private declarations }
  public
    tipo: string;
    { Public declarations }
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;
    id: string;
    procedure mostra_campos(prefixo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    procedure BuscaDescEspecial;
    procedure ativa_grupo(id: string; navigator:boolean);
  end;

var
  Fr_grupo: TFr_grupo;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar, unfun, un_ncm;

{$R *.dfm}

procedure TFr_grupo.btaltClick(Sender: TObject);
begin
  try
    if Prcod_grupo.Text = '' then
    begin
      dao.msg('Selecione um Grupo para Alterar!');
      exit;
    end;

    modo_insert := false;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    PrNCM.Enabled := true;
    PrNom_grupo.SetFocus;

  except
  end;
end;

procedure TFr_grupo.btcanClick(Sender: TObject);
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
      PrNCM.Enabled := false;
      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_grupo.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prcod_grupo.Text = '' then
  begin
    showmessage('Não é possivel excluir este Grupo por não ter Código!');
    PrNom_grupo.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Grupo?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('cod_grupo', q_grupo.fieldbyname('cod_grupo').AsString, 'grupo');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    Limpa_campos;
  end;
  // mostra_campos('');

end;

procedure TFr_grupo.btgraClick(Sender: TObject);
var
  sql: string;
begin
  try
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    PrNCM.Enabled := false;

    if not modo_insert then
    begin
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql := ' DELETE FROM GRUPO_REPRESENTANTE WHERE COD_GRUPO = ' + PRCOD_GRUPO.Text;
        dao.Execsql(sql);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      mmDescEspecial.First;
      while not mmDescEspecial.Eof do
      begin
        try
          if not (dao.cn.InTransaction) then
            (dao.cn.StartTransaction);
          sql := ' INSERT INTO GRUPO_REPRESENTANTE (COD_GRUPO, ID_REPRESENTANTE, DESCONTO_MAXIMO) ' +
            ' VALUES ( ' + PRCOD_GRUPO.Text + ', ' + mmDescEspecialID_REPRESENTANTE.AsString +
            ', ' + FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.') + ') ';
          dao.Execsql(sql);

          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        mmDescEspecial.Next;
      end;
    end;

      if modo_insert then
      begin
        try
          if not(dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          id := dao.insert('Pr', 'grupo', 'cod_grupo', Fr_grupo, 'gen_grupo');
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        Prcod_grupo.Text := id;
        ativa_grupo(id, false);
        btNov.setFocus;
      end
      else begin
        try
          if not(dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          dao.update('grupo', 'cod_grupo', Prcod_grupo.Text, 'Pr', Fr_grupo);
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;
      end;
    readonly_true;
  except
  end;
end;

procedure TFr_grupo.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    PrNom_grupo.SetFocus;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    PrNCM.Enabled := true;
    Limpa_campos;
    mmDescEspecial.Close;
    mmDescEspecial.EmptyTable;
  except

  end;
end;

procedure TFr_grupo.btproClick(Sender: TObject);
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
  chamou_form := 'fr_grupo';
  chamou_cadastro := 'Fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.loc_grupo('');

  try
    Fr_localizar.ShowModal;
  finally
    if Fr_localizar.ModalResult in [mrOK, mrCancel] then
      Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_grupo.PrCestExit(Sender: TObject);
begin
  if Trim(PrCest.Text) = '' then
    Exit;

  if Trim(PrNCM.Text) = '' then
  begin
    dao.msg('O código NCM deve ser preenchido!');
    PrNCM.SetFocus;

    Exit;
  end;

  TratarNCM;
end;

procedure TFr_grupo.Prcod_grupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_grupo.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsComboEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_grupo.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

end;

procedure TFr_grupo.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_grupo.mostra_campos(prefixo: string);
var
  campo, campo1: string; //campo tem o nome do  sem tirar as primeiras letras
  //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsEdit(FindComponent(campo)).Text := q_grupo.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsComboEdit(FindComponent(campo)).Text := q_grupo.fieldbyname(campo1).AsString;
      end
    end;
  end; //end do for
  BuscaDescEspecial;
end;

procedure TFr_grupo.FormShow(Sender: TObject);
begin
  readonly_true;
  dao.q_nav.SQL.clear;
  dao.q_nav.SQL.Text := 'select cod_grupo from grupo order by cod_grupo';
  dao.q_nav.open;
  dao.q_nav.First;
  ativa_grupo(dao.q_nav.fieldbyname('cod_grupo').AsString, false);
  mostra_campos('Pr');
end;

procedure TFr_grupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure TFr_grupo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_grupo.ativa_grupo(id: string; navigator:boolean);
begin
  with q_grupo do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from grupo where cod_grupo = ' + QuotedStr(id));
    open;
  end;

  if navigator then
  begin
    dao.q_nav.SQL.clear;
    dao.q_nav.SQL.Text := 'select cod_grupo from grupo order by cod_grupo ';
  end;

  dao.q_nav.open;
  dao.q_nav.Locate('cod_grupo', strtoint(id),[loCaseInsensitive]);
end;

procedure TFr_grupo.Button1Click(Sender: TObject);
begin
  if Prcod_grupo.Text = '' then
  begin
    dao.msg('Você deve Gravar o Grupo que está cadastrando!');
    btgra.SetFocus;
    Exit;

  end;
end;

procedure TFr_grupo.zzcod_TamanhoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Tamanho';

  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_template_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + ' Tamanhos';
  Fr_localizar.BT_cadastro.Visible := true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

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

end;

procedure TFr_grupo.PrNCMButtonClick(Sender: TObject);
begin
  FMFUN.ListaNCM('fr_grupo_ncm', prncm.Text, false);
end;


procedure TFr_grupo.PrNCMEnter(Sender: TObject);
begin
  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 1);
end;

procedure TFr_grupo.TratarNCM;
begin
  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 0);
  if not fmfun.ValidaNCM(PrNCM.Text, prcest.Text) then
  begin
    if ActiveControl.Name = 'btcan' then
      exit;
    Application.CreateForm(Tfr_ncm, fr_ncm);
    fr_ncm.modo_insert := true;
    fr_ncm.readonly_false;
    fr_ncm.btnov.Enabled := false;
    fr_ncm.btalt.Enabled := false;
    fr_ncm.btgra.Enabled := true;
    fr_ncm.btcan.Enabled := true;
    fr_ncm.btexc.Enabled := false;
    fr_ncm.btpro.Enabled := false;
    fr_ncm.PrCODIGO.Text := PrNCM.Text;
    fr_ncm.PrCest.Text := PrCest.Text;
    fr_ncm.chamada_tela_grupo_produto := true;
    fr_ncm.ShowModal;
    PrNCM.SetFocus;
  end;
end;




procedure TFr_grupo.PrNCMExit(Sender: TObject);
begin
  if Trim(PrNCM.Text) = '' then
    Exit;

  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 0);

  if Trim(PrCest.Text) = '' then
  begin
    dao.msg('O código CEST deve ser preenchido!');
    FMFUN.ListaNCM('fr_grupo_ncm', prncm.Text, true);
    PrNCM.SetFocus;
    Exit;
  end;

  TratarNCM;

end;

procedure TFr_grupo.PrNCMKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TFr_grupo.BtNovoDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;
  mmDescEspecial.Cancel;
  mmDescEspecial.Append;
  edid_representante.SetFocus;
end;

procedure TFr_grupo.BtAltDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;

  mmDescEspecial.Edit;
  edid_representante.SetFocus;
end;

procedure TFr_grupo.AtualizarTodos;
begin
  dao.Exec_sql.SQL.Text := 'DELETE FROM GRUPO_REPRESENTANTE WHERE COD_GRUPO = '+Prcod_grupo.text;
  dao.Exec_sql.ExecSQL;

  dao.Exec_sql.SQL.Text := 'insert into GRUPO_REPRESENTANTE '+
                           '(COD_GRUPO, ID_REPRESENTANTE, DESCONTO_MAXIMO) '+
                           'select '+Prcod_grupo.text+', r.id, '+FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.')+
                           'from REPRESENTANTE r '+
                           'where r.FUNCIONARIO in (0, 1) and r.ativo = ''S''';

  dao.Exec_sql.ExecSQL;
  BuscaDescEspecial;
end;


procedure TFr_grupo.BtGravarDescEspClick(Sender: TObject);
var
  nLinha : Integer;
  vDesc : Double;
begin
  mmDescEspecialNOME_REPRESENTANTE.AsString := lbnom_representante.Caption;
  if ckAltTodos.Checked then
  begin
    mmDescEspecial.post;
    AtualizarTodos;
{    nLinha := mmDescEspecial.RecNo;
    vDesc := mmDescEspecialDESCONTO_MAXIMO.Value;
    mmDescEspecial.DisableControls;
    mmDescEspecial.First;
    while not mmDescEspecial.eof do
    begin
      mmDescEspecial.Edit;
      mmDescEspecialDESCONTO_MAXIMO.Value := vDesc;
      mmDescEspecial.Post;
      mmDescEspecial.Next;
    end;
    mmDescEspecial.RecNo := nLinha;
    mmDescEspecial.EnableControls;
   }
  end
  else
    mmDescEspecial.post;

  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_grupo.BtCancDescEspClick(Sender: TObject);
begin
  mmDescEspecial.cancel;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_grupo.BtExcDescEspClick(Sender: TObject);
begin
  mmDescEspecial.Delete;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_grupo.BtPesqDescClick(Sender: TObject);
begin
  BuscaDescEspecial;
end;

procedure TFr_grupo.BuscaDescEspecial;
var
  sql_representante, sql_cidades, sql_todos: string;
begin
  if PRCOD_GRUPO.Text = '' then exit;

  sql_representante := '';
  sql_cidades := '';
  sql_todos := '';

  if trim(ft_representante.Text) <> '' then
    sql_representante := ' AND PR.ID_REPRESENTANTE = ' + ft_representante.Text;


  if Trim(ft_Cidade.Text) <> '' then
    sql_cidades := ' and r.id in (select c.ID_REPRESENTANTE from CLIENTE c '+
                 '             inner join cidades cd on cd.COD_CIDADE = c.COD_CIDADE '+
                 '             where cd.NOM_CIDADE like ''%'+ft_Cidade.Text+'%'')';


   if ckTodos.Checked then
   begin
     sql_todos := ' union '+
                  'select '+
                  '  0 as COD_GRUPO, '+
                  '  r.ID, '+
                  '  r.NOM_REPRESENTANTE, '+
                  '  (select q1.cidade '+
                  '   from '+
                  '   (  '+
                  '     select cd.NOM_CIDADE||''-''||cd.UF as cidade, count(c.COD_CLIENTE) as total '+
                  '     from CIDADES cd  '+
                  '     inner join cliente c on c.COD_CIDADE = cd.COD_CIDADE '+
                  '     where c.ID_REPRESENTANTE = r.id '+
                  '     group by cidade '+
                  '     order by total desc limit 1 '+
                  '    ) q1 '+
                  '   ) as cidade, '+
                  '   0 as    DESCONTO_MAXIMO  '+
                  'from REPRESENTANTE r  '+
                  'where r.ATIVO = ''S''  '+
                  '  and r.funcionario = 0  '+
                  sql_cidades +
                  sql_representante +
                  '  AND r.id not in (select pr1.ID_REPRESENTANTE  '+
                  '                   from GRUPO_REPRESENTANTE pr1  '+
                  '                   where pr1.COD_GRUPO = ' + PRCOD_GRUPO.Text +' ) ';




   end;


  dao.Geral1('select * from ( select '+
             '  pr.COD_GRUPO, '+
             '  pr.ID_REPRESENTANTE, '+
             '  r.NOM_REPRESENTANTE, '+
             '  (select q1.cidade from '+
             '  (select cd.NOM_CIDADE||''-''||cd.UF as cidade, count(c.COD_CLIENTE) as total '+
             '   from CIDADES cd inner join cliente c on c.COD_CIDADE = cd.COD_CIDADE  '+
             '   where c.ID_REPRESENTANTE = r.id '+
             '   group by cidade '+
             '   order by total desc limit 1 '+
             '  ) q1 ) as cidade, '+
             '  pr.DESCONTO_MAXIMO  '+
             'from REPRESENTANTE r  '+
             'inner join GRUPO_REPRESENTANTE pr on (pr.ID_REPRESENTANTE = r.ID) where  pr.COD_GRUPO = ' + PRCOD_GRUPO.Text + sql_representante + sql_cidades + sql_todos +') q2 '+
             ' order by Nom_representante ');
  dao.Q1.first;
  mmDescEspecial.Close;
  mmDescEspecial.EmptyTable;
  mmDescEspecial.Open;
  while not dao.Q1.eof do
  begin
    mmDescEspecial.Append;
    mmDescEspecialID_REPRESENTANTE.AsString := dao.Q1.fieldbyname('ID_REPRESENTANTE').AsString;
    mmDescEspecialNOME_REPRESENTANTE.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmDescEspecialCIDADE.AsString := dao.Q1.fieldbyname('cidade').AsString;
    mmDescEspecialDESCONTO_MAXIMO.VALUE := dao.Q1.fieldbyname('DESCONTO_MAXIMO').VALUE;
    mmDescEspecial.Post;
    dao.Q1.next;
  end;

end;

procedure TFr_grupo.ft_representanteExit(Sender: TObject);
begin
  if trim(ft_representante.Text) = '' then
    ft_lb_nom_representante.Caption := '...';

  if ft_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(ft_representante.Text));
    if dao.q2.RecordCount > 0 then
      ft_lb_nom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      ft_representante.Text := '';
      ft_representante.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_grupo.edId_representanteExit(Sender: TObject);
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

procedure TFr_grupo.ft_representanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_grupo_filtro_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;


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

procedure TFr_grupo.edId_representanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_grupo_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;

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


procedure TFr_grupo.navAfterAction(Sender: TObject);
begin
  ativa_grupo(dao.q_nav.fieldbyname('COD_GRUPO').AsString, false);
  mostra_campos('Pr');
end;

end.
