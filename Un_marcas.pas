unit Un_marcas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit, xmldom, XMLIntf, msxmldom, XMLDoc,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_marcas = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Prid: TsEdit;
    Prnom_marca: TsEdit;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    Btalt: TsBitBtn;
    Btgra: TsBitBtn;
    Btcan: TsBitBtn;
    Btexc: TsBitBtn;
    Btpro: TsBitBtn;
    idHttpGeral: TIdHTTP;
    XMLGeral: TXMLDocument;
    q_marcas: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure BtaltClick(Sender: TObject);
    procedure BtgraClick(Sender: TObject);
    procedure BtcanClick(Sender: TObject);
    procedure BtexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_marcaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
    procedure AtualizaMarcaWeb;
    procedure DeletaMarcaWeb;

  public
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;
    modo_insert: boolean;
    id: string;
    procedure ativa_marca(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_marcas: TFr_marcas;

implementation

uses UnPri, Un_dao, Un_localizar, UnFun;

{$R *.dfm}

{ TFr_marcas }

procedure TFr_marcas.ativa_marca(id: string);
begin
  with q_marcas do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from marcas where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_marcas.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_marcas.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_marcas.fieldbyname(campo1).AsString;
    end;
  end;
end;

procedure TFr_marcas.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_marcas.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_marcas.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prnom_marca.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_marcas.BtaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE UMA MARCA ANTES DE ALTERAR!');
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

procedure TFr_marcas.AtualizaMarcaWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=marca');
  Consulta.WriteString('&id='+Prid.Text);
  Consulta.WriteString('&nom_marca='+Prnom_marca.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_marcas.DeletaMarcaWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=deleta_marca');
  Consulta.WriteString('&id='+Prid.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;


procedure TFr_marcas.BtgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select nom_marca from marcas where nom_marca=' + QuotedStr(Prnom_marca.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UMA MARCA IGUAL' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO A MESMA MARCA 2 VEZES!');
        Prnom_marca.SetFocus;
        Exit;
      end;

      if Prnom_marca.text = '' then
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
      id := dao.Insert('Pr', 'marcas', 'id', Fr_marcas, 'gen_marca');
      Prid.Text := id;
      ativa_marca(id);
      btNov.setFocus;
    end
    else
      dao.update('marcas', 'id', Prid.Text, 'Pr', Fr_marcas);
    dao.cn.commit;
    AtualizaMarcaWeb;
    readonly_true;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_marcas.BtcanClick(Sender: TObject);
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
        ativa_marca(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_marcas.BtexcClick(Sender: TObject);
begin
  if Prnom_marca.Text = '' then
  begin
    showmessage('Não é possivel excluir pois não tem código!');
    BtNov.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', Prid.text, 'marcas');
      DeletaMarcaWeb;
      dao.cn.Commit;
      dao.msg('Esta marca foi excluída com sucesso!');
    except
      dao.cn.Rollback;
    end;
  end;
  limpa_campos;
end;

procedure TFr_marcas.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar marca';
  chamou_pesquisa := 'fr_marca';
  chamou_form := 'fr_marca';
  chamou_cadastro := 'fr_marca';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Marca';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
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
    Fr_localizar.loc_marca(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_marcas.FormCloseQuery(Sender: TObject;
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

procedure TFr_marcas.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_marcas.Prnom_marcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_marcas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;



end.











