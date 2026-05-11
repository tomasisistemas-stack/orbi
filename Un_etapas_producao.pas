unit Un_etapas_producao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ExtCtrls, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sDBCalcEdit, sCurrencyEdit, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, DB, DBGrids, RxMemDS, DBCtrls,
  RXDBCtrl, sPageControl, sSpeedButton,
  acDBGrid, sTooledit, sComboEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;
type
  Tfr_etapas_producao = class(TForm)
    q_etapas_producao: TFDQuery;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Codigo: tsLabel;
    Label2: tsLabel;
    Prid: TsEdit;
    Prdescricao: TsEdit;
    sLabel1: tsLabel;
    PrCusto: TsCurrencyEdit;
    PrExterno: TsCheckBox;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure PrdescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btexcClick(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;

    { Private declarations }
  public
    id: string;
    modo_insert, expresso: Boolean;

    busca_qualquer_posicao_pesquisada: Boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure ativa_banco(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  fr_etapas_producao: Tfr_etapas_producao;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure Tfr_etapas_producao.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prdescricao.SetFocus;
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Btpro.Enabled := false;
end;

procedure Tfr_etapas_producao.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = 'Pr' then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).clear

      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).clear;
    END;
  end;
end;

procedure Tfr_etapas_producao.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TComboBox then
      TComboBox(Components[i]).Enabled := true;
    if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).Enabled := true;
  end;
end;

procedure Tfr_etapas_producao.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE UM REGISTRO ANTES DE ALTERAR!');
    exit;
  end;
  modo_insert := false;
  readonly_false;
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Btpro.Enabled := false;
end;

procedure Tfr_etapas_producao.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (Btnov.Enabled = false) then
    begin
      dao.Geral2
        ('select descricao, externo from etapa_producao where descricao =' +
        QuotedStr(Prdescricao.Text));

      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM REGISTRO COM O MESMO NOME' + #13 +
          'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O MESMO REGISTRO 2 VEZES!');
        Prdescricao.SetFocus;
        exit;
      end;

      if Prdescricao.Text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS DO REGISTRO ANTES DE GRAVA-LA!');
        exit;
      end;

    end;

    Btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := false;
    btexc.Enabled := true;
    Btpro.Enabled := true;
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'ETAPA_PRODUCAO', 'id', fr_etapas_producao,
        'gen_etapa_producao');
      Prid.Text := id;
      Btnov.SetFocus;
    end
    else
      dao.update('ETAPA_PRODUCAO', 'id', Prid.Text, 'Pr', fr_etapas_producao);
    dao.cn.commit;
    readonly_true;
    ativa_banco(id);
    if expresso then
      ModalResult := mrok;

  except
    dao.cn.Rollback;
  end;

end;
// (*end;*)

procedure Tfr_etapas_producao.ativa_banco(id: string);
begin
  with q_etapas_producao do
  begin
    close;
    SQL.clear;
    SQL.add('select * from ETAPA_PRODUCAO where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure Tfr_etapas_producao.mostra_campos(prefixo: string);
var
  campo, campo1: string; // campo tem o nome do  sem tirar as primeiras letras
  // campo1 tem o nome do campo tirando as 1º letras.
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := Copy(campo, 3, 50);

      TsEdit(FindComponent(campo)).Text := q_etapas_producao.fieldbyname
        (campo1).AsString;
    end
    else if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := Copy(campo, 3, 50);
      TsCurrencyEdit(FindComponent(campo)).Value :=
        q_etapas_producao.fieldbyname(campo1).AsFloat;
    end
    else if Components[i] is TsCheckBox then
    begin
      campo := TsCheckBox(Components[i]).Name;
      campo1 := campo;
      campo1 := Copy(campo, 3, 50);
      if q_etapas_producao.fieldbyname(campo1).AsString = 'S' then
        TsCheckBox(FindComponent(campo)).Checked := true
      else
        TsCheckBox(FindComponent(campo)).Checked := false;
    end

  end; // end do for
end;

procedure Tfr_etapas_producao.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
    if Components[i] is TComboBox then
      TComboBox(Components[i]).Enabled := false;
    if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).Enabled := false;

  end;
end;

procedure Tfr_etapas_producao.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin
      Btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := false;
      btexc.Enabled := true;
      Btpro.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        ativa_banco(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure Tfr_etapas_producao.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Etapas de Produção';
  chamou_pesquisa := 'fr_etapa_producao';
  chamou_form := 'fr_etapa_producao';
  chamou_cadastro := 'fr_etapa_producao';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
    'Etapas de Produção';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_banco(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_etapas_producao.FormCloseQuery(Sender: TObject;
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

procedure Tfr_etapas_producao.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure Tfr_etapas_producao.PrdescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure Tfr_etapas_producao.Prnr_bancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure Tfr_etapas_producao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_etapas_producao.btexcClick(Sender: TObject);
begin
  if Prdescricao.Text = '' then
  begin
    showmessage('Não é possivel excluir este registro pois não possui Código!');
    Btnov.SetFocus;
    exit;
  end;
  // criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_etapas_producao.fieldbyname('id').AsString,
        'etapa_producao');
      dao.cn.commit;
      dao.msg('Registro foi excluido com sucesso!');
    except
      dao.cn.Rollback;
    end;

  end;
  mostra_campos('');
end;


end.
