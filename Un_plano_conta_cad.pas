unit Un_plano_conta_cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ExtCtrls, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_plano_conta_cad = class(TForm)
    Panel1: tsPanel;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    GroupBox1: TsGroupBox;
    Codigo: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Prid: TsEdit;
    PrDescricao: TsEdit;
    Prnr_conta: TsEdit;
    Label1: tsLabel;
    Prid_pai: TsEdit;
    Label4: tsLabel;
    PrNivel: TsEdit;
    prOperacao: TsRadioGroup;
    q_plano_conta: TFDQuery;
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure PrDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prnr_contaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    id: string;
    modo_insert: Boolean;

    procedure ativa_plano_conta(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  fr_plano_conta_cad: Tfr_plano_conta_cad;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}



procedure Tfr_plano_conta_cad.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) then
    begin
      if PrDescricao.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR A DESCRIÇÃO ANTES DE GRAVA-LA!');
        Exit;
      end;

    end;

    if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'plano_contas', 'id', fr_plano_conta_cad, 'gen_plano_conta');
      Prid.Text := id;
    end
    else
      dao.update('plano_contas', 'id', Prid.Text, 'Pr', fr_plano_conta_cad);
    dao.cn.commit;
    ModalResult := mrOk;
  except
    dao.cn.Rollback;
  end;

end;
//(*end;*)

procedure Tfr_plano_conta_cad.ativa_plano_conta(id: string);
begin
  with q_plano_conta do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from plano_contas where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure Tfr_plano_conta_cad.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_plano_conta.fieldbyname(campo1).AsString;
    end
    else begin
      if Components[i] is TsRadioGroup then
      begin
        campo := TsRadioGroup(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_plano_conta.fieldbyname(campo1).AsString = 'D' then
          TsRadioGroup(FindComponent(campo)).itemindex := 0
        else
          TsRadioGroup(FindComponent(campo)).itemindex := 1;
      end;
    end;
  end;
end;


procedure Tfr_plano_conta_cad.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    ModalResult := mrCancel;
end;

procedure Tfr_plano_conta_cad.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_plano_conta_cad.PrDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_plano_conta_cad.Prnr_contaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_plano_conta_cad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;


end.
