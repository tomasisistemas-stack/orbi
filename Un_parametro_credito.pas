unit Un_parametro_credito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids,  ExtCtrls, 
  sPanel, sBitBtn, sLabel, sCheckBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids;

type
  TFr_parametro_credito = class(TForm)
    ds_cadastro_credito: TDataSource;
    dg_cadastro_credito: TDBGrid;
    Panel3: tsPanel;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Prvlr_inicial: TsEdit;
    Prvlr_final: TsEdit;
    Prpercentual_credito: TsEdit;
    Prid: TsEdit;
    Panel2: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    q_cadastro_credito: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prvlr_inicialKeyPress(Sender: TObject; var Key: Char);
    procedure Prvlr_finalKeyPress(Sender: TObject; var Key: Char);
    procedure Prpercentual_creditoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dg_cadastro_creditoKeyPress(Sender: TObject; var Key: Char);
    procedure dg_cadastro_creditoDblClick(Sender: TObject);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    modo_insert: boolean;
    id: string;
    procedure mostra_campos(prefixo: string);
    procedure ativa_cadastro_credito;
    procedure retira_do_grid(id: string);
  end;

var
  Fr_parametro_credito: TFr_parametro_credito;

implementation

uses Un_dao, UnPri;

{$R *.dfm}

{ TFr_cadastro_credito }

procedure TFr_parametro_credito.ativa_cadastro_credito;
begin
  with q_cadastro_credito do
  begin
    close;
    sql.clear;
    sql.Add('select * from tabela_credito');
    open;
  end;
  q_cadastro_credito.fieldbyname('id').visible := false;
end;

procedure TFr_parametro_credito.BtnovClick(Sender: TObject);
begin
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  modo_insert := true;
  limpa_campos;
  readonly_false;
  q_cadastro_credito.Append;
end;

procedure TFr_parametro_credito.btaltClick(Sender: TObject);
begin

  q_cadastro_credito.FieldByName('id').AsString;
  retira_do_grid(q_cadastro_credito.fieldbyname('id').AsString);
  mostra_campos('Pr');

  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  modo_insert := false;
  readonly_false;

end;

procedure TFr_parametro_credito.btgraClick(Sender: TObject);
begin
  if (BtNov.Enabled = false) then
  begin
    dao.Geral2('select vlr_inicial from tabela_credito where vlr_inicial=' + QuotedStr(Prvlr_inicial.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      dao.msg('FOI ENCONTRADO UM CREDITO COM O MESMO VALOR INICIAL E ISTO NÂO É POSSIVEL');
      Prvlr_inicial.SetFocus;
      Exit;
    end
    else
    begin
      dao.Geral2('select vlr_final from tabela_credito where vlr_final=' + QuotedStr(Prvlr_final.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM CREDITO COM O MESMO VALOR FINAL E ISTO NÂO É POSSIVEL');
        Prvlr_final.SetFocus;
        Exit;
      end;

      if (Prvlr_inicial.text = '') or (Prvlr_final.text = '') or (Prpercentual_credito.text = '') then
      begin
        dao.msg('TODOS OS DADOS TEM QUE SER INSERIDOS PARA GRAVAR!');
        Exit;
      end;
    end;

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if modo_insert then
      begin
        id := dao.insert('Pr', 'tabela_credito', 'id', Fr_parametro_credito, 'gen_credito');
        Prid.Text := id;
        ativa_cadastro_credito;
      end
      else
        dao.update('tabela_credito', 'id', q_cadastro_credito.fieldbyname('id').AsString, 'Pr', Fr_parametro_credito);
      dao.cn.commit;
      readonly_true;
    except
      dao.cn.rollback;
    end;
  end;

  limpa_campos;
  ativa_cadastro_credito;
  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := False;
  btNov.setFocus;
end;

procedure TFr_parametro_credito.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_parametro_credito.btcanClick(Sender: TObject);
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
      if modo_insert then
      begin
        Limpa_campos;
        readonly_true
      end
      else if modo_insert = false then
      begin
        ativa_cadastro_credito;
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_parametro_credito.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_parametro_credito.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_parametro_credito.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_cadastro_credito.fieldbyname(campo1).AsString;
    end;

  end;
end;

procedure TFr_parametro_credito.FormShow(Sender: TObject);
begin
  ativa_cadastro_credito;
end;

procedure TFr_parametro_credito.Prvlr_inicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_parametro_credito.Prvlr_finalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_parametro_credito.Prpercentual_creditoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_parametro_credito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
  begin
    close;
  end;
end;

procedure TFr_parametro_credito.dg_cadastro_creditoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    btalt.Click;
  end;
end;

procedure TFr_parametro_credito.dg_cadastro_creditoDblClick(
  Sender: TObject);
begin
  btalt.Click;
end;

procedure TFr_parametro_credito.retira_do_grid(id: string);
begin
  with q_cadastro_credito do
  begin
    close;
    sql.clear;
    sql.Add('select * from tabela_credito where id = ' + QuotedStr(id));
    sql.Add('order by vlr_inicial');
    open;
  end;
  q_cadastro_credito.fieldbyname('id').visible := false;
end;


end.
