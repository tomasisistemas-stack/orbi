unit Un_tamanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, 
   sPanel, sBitBtn, sLabel, sGroupBox, sEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_tamanho = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Prid: TsEdit;
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    Label25: tsLabel;
    Prtamanho: TsEdit;
    q_tamanho: TFDQuery;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PridKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
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
    procedure ativa_tamanho(id: string); //carrega a Q_cidade

  end;

var
  Fr_tamanho: TFr_tamanho;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure TFr_tamanho.btaltClick(Sender: TObject);
begin
  try
    if Prid.Text = '' then
    begin
      dao.msg('LOCALIZE UM TAMANHO ANTES DE ALTERAR!');
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

    Prtamanho.SetFocus;

  except
  end;
end;

procedure TFr_tamanho.btcanClick(Sender: TObject);
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
        mostra_campos(Prid.Text);
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_tamanho.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir este Grupo por não ter Código!');
    Prtamanho.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Cidade?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.delete('id', q_tamanho.fieldbyname('id').AsString, 'tamanho');
    dao.cn.Commit;
    Limpa_campos;
  end;
  // mostra_campos('');

end;

procedure TFr_tamanho.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select tamanho from tamanho where tamanho=' + QuotedStr(Prtamanho.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM TAMANHO CADASTRADO COM O MESMO NOME QUE VOCÊ CADASTROU' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO ESTA TAMANHO NOVAMENTE, OU ALTERE O NOME DO TAMANHO!');
        Prtamanho.SetFocus;
        Exit;
      end;
    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      if modo_insert then
      begin
        id := dao.insert('Pr', 'tamanho', 'id', Fr_tamanho, 'gen_tamanho');
        Prid.Text := id;
        ativa_tamanho(id);
        btNov.setFocus;
      end
      else
        dao.update('tamanho', 'id', q_tamanho.fieldbyname('id').AsString, 'Pr', Fr_tamanho);

      dao.cn.Commit;
      readonly_true;
    except
      dao.cn.rollback;
    end;

    //Transferir informações da Cor para as lojas
{    try
      dao.Geral3('select * from empresa where cod_empresa <> '+QuotedStr(cod_empresa));
      dao.Q3.First;
      while not(dao.Q3.eof) do
      begin
        if dao.Q3.FieldByName('ip_valido').AsString <> '' then
        begin
          dao.Configura_CN_NET(dao.Q3.fieldbyname('cod_empresa').AsString);
          //if not(dao.cn_net.InTransaction) then dao.cn_net.StartTransaction;
          dao.Geral1_NET('select tamanho from tamanho where id='+QuotedStr(Prid.Text));

          if dao.q1_net.RecordCount > 0 then
             dao.Execsql_NET('update tamanho set tamanho='+QuotedStr(Prtamanho.Text)+' where id='+QuotedStr(Prid.Text))
          else
             dao.Execsql_NET('insert into tamanho (id,tamanho) values ('+quotedStr(prid.text)+',' + quotedStr(Prtamanho.Text)+')');

        end;
        dao.Q3.Next;
      end;

      dao.cn_net.commit;

    except
      on e: Exception do
      begin
        dao.msg('Houve um erro na replicação de Dados para as Lojas - Tamanho!'+#13+
        e.message);
      end;
    end;  }

  except
  end;
end;

procedure TFr_tamanho.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    Prtamanho.SetFocus;
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

procedure TFr_tamanho.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Tamanho';
  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_tamanho';
  chamou_cadastro := 'Fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Tamanho';
  Fr_localizar.BT_cadastro.Visible := false;

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

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_tamanho(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_tamanho.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_tamanho.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_tamanho.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

end;

procedure TFr_tamanho.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_tamanho.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_tamanho.fieldbyname(campo1).AsString;
    end

  end; //end do for
end;

procedure TFr_tamanho.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_tamanho.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure TFr_tamanho.FormCloseQuery(Sender: TObject;
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

procedure TFr_tamanho.ativa_tamanho(id: string);
begin
  with q_tamanho do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from tamanho where id = ' + QuotedStr(id));
    open;
  end;

end;


end.
