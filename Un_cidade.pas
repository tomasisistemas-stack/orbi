unit Un_cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, 
   sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_cidades = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    Label25: tsLabel;
    PRnom_cidade: TsEdit;
    Label2: tsLabel;
    PRuf: TsEdit;
    Label3: tsLabel;
    PRcod_cidade: TsCurrencyEdit;
    PRcod_IBGE: TsCurrencyEdit;
    q_cidade: TFDQuery;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PRcod_cidadeKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    procedure MontaSql(tipo: ShortString; tabela: ShortString; codigo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
  public
    tipo: string;
    { Public declarations }
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    modo_insert: Boolean;
    id: string;
    procedure mostra_campos(prefixo: string);
    procedure ativa_cidade(id: string); //carrega a Q_cidade
  end;

var
  Fr_cidades: TFr_cidades;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure TFr_cidades.btaltClick(Sender: TObject);
begin
  try
    modo_insert := false;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;

    PRnom_cidade.SetFocus;

  except
  end;
end;

procedure TFr_cidades.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin

  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := false;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;

      if tipo = '1' then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if tipo = '2' then
      begin
        //create da query
        //**************
//         query_cancel.SQL.Clear;
        query_cancel.SQL.add('select * from cidades where cod_cidade=' + QuotedStr(PRcod_cidade.Text));
        query_cancel.Open;
        mostra_campos(PRcod_cidade.Text);
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_cidades.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if PRcod_cidade.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Cidade por não ter Código!');
    PRnom_cidade.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Cidade?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    dao.delete('cod_cidade', q_cidade.fieldbyname('cod_cidade').AsString, 'cidades');
    MontaSql(tipo, 'cidades', condicao);
  end;
  mostra_campos('');

end;

procedure TFr_cidades.btgraClick(Sender: TObject);
begin
  try
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;

    if modo_insert then
    begin
      try
       // if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        id := dao.insert('PR', 'cidades', 'cod_cidade', Fr_cidades, 'gen_aceest');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      PRcod_cidade.Text := id;
      ativa_cidade(id);
    end
    else
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.update('cidades', 'cod_cidade', q_cidade.fieldbyname('cod_cidade').AsString, 'PR', Fr_cidades);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;

    readonly_true;

  except
  end;
end;

procedure TFr_cidades.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    PRnom_cidade.SetFocus;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    Limpa_campos;

  except

  end;
end;

procedure TFr_cidades.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';
  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_cidades';
  chamou_cadastro := 'Fr_cidades';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';
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

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_cidade(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_cidades.PRcod_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_cidades.MontaSql(tipo: ShortString; tabela: ShortString; codigo: string);
var
  i, tam_campo, valor_cb: integer;
  valor_dt: Tdatetime;
  campo, valor, condicao: string;
  Query1: TFDQuery;
begin
  //montando comando para jogar na Sql do banco de dados
  comando_campos := '';
  comando_valor := '';
  condicao := QuotedStr(PRcod_cidade.Text);
  //criar query para pesquisar

  if tipo = '1' then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      //monta sql para os edits
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo := copy(campo, 3, 50);
        valor := TsEdit(Components[i]).Text;

        if TsEdit(Components[i]).Modified then
          comando_campos := comando_campos + campo + ',';

        if TsEdit(Components[i]).Modified then
          comando_valor := comando_valor + QuotedStr(valor) + ',';
      end;

    end; //end do for;

    //concerta o comando_campos
    tam_campo := Length(comando_campos);
    comando_campos := copy(comando_campos, 1, tam_campo - 1);

    tam_campo := Length(comando_valor);
    comando_valor := copy(comando_valor, 1, tam_campo - 1);

    //passa o comando para a query
    Query1.SQL.add('insert into ' + tabela + ' (' + comando_campos + ') values (' + comando_valor + ')');
    Query1.ExecSQL;

    //devolvendo para o campo o código Primario
    with Query1 do
    begin
      close;
      sql.Clear;
      sql.add('select nextval(''gen_cidade'') AS gen_id from configuracao');
      Open;
    end;
    PRcod_cidade.Text := Query1.fieldbyname('gen_id').AsString;

  end //******** end final do tipo 1.
  else if tipo = '2' then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      //monta sql para os edits
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo := copy(campo, 3, 50);
        valor := TsEdit(Components[i]).Text;

        if TsEdit(Components[i]).Modified then
          comando_campos := comando_campos + campo + '=' + QuotedStr(valor) + ',';
      end;

    end; //end do for

    tam_campo := Length(comando_campos);
    comando_campos := copy(comando_campos, 1, tam_campo - 1);

    tam_campo := Length(comando_valor);
    comando_valor := copy(comando_valor, 1, tam_campo - 1);

    Query1.SQL.add('update ' + tabela + ' set ' + comando_campos + ' where cod_cidade = ' + condicao);
    Query1.ExecSQL;

  end // end final do tipo 2.
  else if tipo = '3' then
  begin
    Query1.SQL.Add('delete from ' + tabela + ' where cod_cidade = ' + condicao);
    Query1.ExecSQL;
  end;

end;

procedure TFr_cidades.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).Clear;
  end;
end;

procedure TFr_cidades.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := true;
  end;

end;

procedure TFr_cidades.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_cidades.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_cidade.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsCurrencyEdit(FindComponent(campo)).Value := q_cidade.fieldbyname(campo1).AsFloat;
    end;
  end; //end do for
  btalt.Enabled := true;
end;

procedure TFr_cidades.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_cidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_cidades.FormCloseQuery(Sender: TObject;
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

procedure TFr_cidades.ativa_cidade(id: string);
begin
  with q_cidade do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from cidades where cod_cidade = ' + QuotedStr(id));
    open;
  end;

end;

end.
