unit Un_colecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  sPanel, sBitBtn, sLabel, sGroupBox, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_colecao = class(TForm)
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
    Prdescricao: TsEdit;
    Prdt_final_colecao: TsDateEdit;
    Prdt_inicio_colecao: TsDateEdit;
    Label2: tsLabel;
    Label3: tsLabel;
    q_colecao: TFDQuery;
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

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    modo_insert: Boolean;
    id: string;
    procedure mostra_campos(prefixo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    procedure ativa_colecao(id: string); //carrega a Q_cidade

  end;

var
  Fr_colecao: TFr_colecao;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure TFr_colecao.btaltClick(Sender: TObject);
begin
  try
    if Prid.Text = '' then
    begin
      dao.msg('LOCALIZE UMA COLEÇÃO ANTES DE ALTERAR!');
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

    Prdescricao.SetFocus;

  except
  end;
end;

procedure TFr_colecao.btcanClick(Sender: TObject);
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

procedure TFr_colecao.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Coleção por não ter Código!');
    Prdescricao.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Esta Coleção?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_colecao.fieldbyname('id').AsString, 'colecao');
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    Limpa_campos;
  end;
  // mostra_campos('');

end;

procedure TFr_colecao.btgraClick(Sender: TObject);
begin
  try
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
        id := dao.insert('Pr', 'colecao', 'id', Fr_colecao, 'gen_colecao');
        Prid.Text := id;
        ativa_colecao(id);
        btNov.setFocus;
      end
      else
        dao.update('colecao', 'id', q_colecao.fieldbyname('id').AsString, 'Pr', Fr_colecao);

      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    readonly_true;

  except
  end;
end;

procedure TFr_colecao.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    Prdescricao.SetFocus;
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

procedure TFr_colecao.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Coleção';
  chamou_pesquisa := 'fr_colecao';
  chamou_form := 'fr_colecao';
  chamou_cadastro := 'Fr_colecao';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Coleções';
  Fr_localizar.BT_cadastro.Visible := true;

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
    Fr_localizar.loc_colecao(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_colecao.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_colecao.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear
    else if Components[i] is TsDateEdit then
      TsDateEdit(components[i]).Clear

  end;
end;

procedure TFr_colecao.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True
    else if Components[i] is TsDateEdit then
      TsDateEdit(components[i]).ReadOnly := True;

  end;

end;

procedure TFr_colecao.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false
    else if Components[i] is TsDateEdit then
      TsDateEdit(components[i]).ReadOnly := False;

  end;
end;

procedure TFr_colecao.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_colecao.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsDateEdit then
    begin
      campo := TsDateEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsDateEdit(FindComponent(campo)).Date := q_colecao.fieldbyname(campo1).AsDateTime;
    end;

  end; //end do for
end;

procedure TFr_colecao.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_colecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_colecao.FormCloseQuery(Sender: TObject;
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

procedure TFr_colecao.ativa_colecao(id: string);
begin
  with q_colecao do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from colecao where id = ' + QuotedStr(id));
    open;
  end;

end;

end.
