unit UnUsu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Mask, ExtCtrls,
  SToolEdit, sBitBtn, sPanel, sLabel, DB,
  sGroupBox, sEdit, sMaskEdit, sCustomComboEdit, sComboEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRUSU = class(TForm)
    GBDADUSU: TsGroupBox;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    PrCODUSU: TsEdit;
    PrLOGUSU: TsEdit;
    PrSENUSU: TsEdit;
    PrSENESP: TsEdit;
    Label12: tsLabel;
    Prcod_empresa: TsComboEdit;
    Lbnom_empresa: tsLabel;
    Label34: tsLabel;
    PrNOME: TsEdit;
    Label36: tsLabel;
    PrFONE: TsEdit;
    dsusus: TDataSource;
    Label39: tsLabel;
    Prcod_representante: TsComboEdit;
    Lbnom_representante: tsLabel;
    QUUSU: TFDQuery;
    PrNivel: TsEdit;
    sLabel1: TsLabel;
    sPanel1: TsPanel;
    BTNOVUSU: TsBitBtn;
    BTALTUSU: TsBitBtn;
    BTGRAUSU: TsBitBtn;
    BTCANUSU: TsBitBtn;
    BTEXCUSU: TsBitBtn;
    BtLocalizar: TsBitBtn;
    procedure BTALTUSUClick(Sender: TObject);
    procedure BTCANUSUClick(Sender: TObject);
    procedure BTEXCUSUClick(Sender: TObject);
    procedure BTGRAUSUClick(Sender: TObject);
    procedure BTNOVUSUClick(Sender: TObject);
    procedure DENOMUSUKeyPress(Sender: TObject; var Key: Char);
    procedure DESENUSUKeyPress(Sender: TObject; var Key: Char);
    procedure IB_ComboBox1KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox2KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox3KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox4KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox5KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox6KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox7KeyPress(Sender: TObject;
      var Key: Char);
    procedure IB_ComboBox8KeyPress(Sender: TObject;
      var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure IB_ComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
    procedure ativa_usuario(id: string);
    procedure mostra_campos(prefixo: string);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;
  end;

var
  FRUSU: TFRUSU;
  MACAOUSU: string;
  id: string;
  modo_insert: Boolean;

implementation

uses UnDmConSis, Un_localizar, UnPri, Math, Un_dao, Un_dm;

{$R *.dfm}

procedure TFRUSU.BTALTUSUClick(Sender: TObject);
begin
  try
    modo_insert := false;
    readonly_false;

    GBDADUSU.Enabled := true;

    BTNOVUSU.Enabled := false;
    BTALTUSU.Enabled := false;
    BTGRAUSU.Enabled := true;
    BTCANUSU.Enabled := true;
    BTEXCUSU.Enabled := false;
    BtLocalizar.Enabled := false;
    MACAOUSU := 'ALT';
    prNOME.SetFocus;
  except
    on e: exception do
    begin
      showmessage(e.Message);
      exit;
    end;
  end;

end;

procedure TFRUSU.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := quusu.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsComboEdit(FindComponent(campo)).Text := quusu.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsRadioGroup then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsRadioGroup(FindComponent(campo)).ItemIndex := quusu.fieldbyname(campo1).AsInteger;
    end;
  end; //end do for
end;

procedure TFRUSU.BTCANUSUClick(Sender: TObject);
begin
  try
    if modo_insert then
    begin
      Limpa_campos;
      readonly_true;
    end
    else if modo_insert = false then
    begin
      ativa_usuario(Prcodusu.Text);
      mostra_campos('Pr');
      readonly_true;
    end;

    GBDADUSU.Enabled := false;

    BTNOVUSU.Enabled := true;
    BTALTUSU.Enabled := true;
    BTGRAUSU.Enabled := false;
    BTCANUSU.Enabled := False;
    BTEXCUSU.Enabled := true;
    BtLocalizar.Enabled := true;

    MACAOUSU := 'CAN';
  except
    on e: exception do
    begin
      showmessage(e.Message);
      exit;
    end;
  end;

end;

procedure TFRUSU.BTEXCUSUClick(Sender: TObject);
begin
  if MessageDlg('<ATENÇÃO> CONFIRMA A EXCLUSÃO DESTE USUARIO <ATENÇÃO>', mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
  begin
    try
    //  if not (dao.cn.Transaction) then
        dao.cn.StartTransaction;
      dao.delete('codusu', quusu.fieldbyname('codusu').AsString, 'tbusu');
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
  end;
end;

procedure TFRUSU.BTGRAUSUClick(Sender: TObject);
begin
  try
    if PRLOGUSU.Text = '' then
    begin
      ShowMessage('O CAMPO USUARIO DEVE SER PREENCHIDO!');
      exit;
    end;
    if PRNOME.Text = '' then
    begin
      ShowMessage('O CAMPO NOME DEVE SER PREENCHIDO!');
      exit;
    end;
    if Prcod_empresa.Text = '' then
    begin
      ShowMessage('O CAMPO EMPRESA DEVE SER PREENCHIDO!');
      Prcod_empresa.SetFocus;
      exit;
    end;


    try
     // if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      if modo_insert then
      begin
        id := dao.insert('Pr', 'tbusu', 'codusu', Frusu, 'gen_usu');
        PRCODUSU.Text :=
          id;
        ativa_usuario(id);
      end
      else
        dao.update('tbusu', 'codusu', Prcodusu.Text, 'Pr', Frusu);

      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;

    GBDADUSU.Enabled := false;

    BTNOVUSU.Enabled := true;
    BTALTUSU.Enabled := true;
    BTGRAUSU.Enabled := false;
    BTCANUSU.Enabled := False;
    BTEXCUSU.Enabled := true;
    BtLocalizar.Enabled := true;

    BTNOVUSU.SetFocus;
  except
    on e: exception do
    begin
      showmessage(e.Message);
      exit;
    end;
  end;

end;

procedure TFRUSU.ativa_usuario(id: string);
begin
  with quusu do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from tbusu where codusu = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFRUSU.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).Clear;
    if Components[i] is TsRadioGroup then
      TsRadioGroup(Components[i]).ItemIndex := -1;
  end;
  Lbnom_empresa.Caption := '...';
  Lbnom_representante.Caption := '...';
end;

procedure TFRUSU.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsRadioGroup then
      TsRadioGroup(Components[i]).enabled := true;
  end;
end;

procedure TFRUSU.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := true;
    if Components[i] is TsRadioGroup then
      TsRadioGroup(Components[i]).enabled := false;
  end;
end;

procedure TFRUSU.BTNOVUSUClick(Sender: TObject);
begin
  try

    GBDADUSU.Enabled := true;

    BTNOVUSU.Enabled := false;
    BTALTUSU.Enabled := false;
    BTGRAUSU.Enabled := true;
    BTCANUSU.Enabled := true;
    BTEXCUSU.Enabled := false;
    BtLocalizar.Enabled := false;

    Limpa_campos;
    modo_insert := true;
    readonly_false;

    MACAOUSU := 'NOV';
    PRNOME.SetFocus;
  except
    on e: exception do
    begin
      showmessage(e.Message);
      exit;
    end;
  end;

end;

procedure TFRUSU.DENOMUSUKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.DESENUSUKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox5KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox6KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.IB_ComboBox7KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    BTGRAUSU.SetFocus;

end;

procedure TFRUSU.IB_ComboBox8KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);

end;

procedure TFRUSU.FormCreate(Sender: TObject);
begin
  //QUUSU.Open;
end;

procedure TFRUSU.IB_ComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFRUSU.FormShow(Sender: TObject);
begin
  GBDADUSU.Enabled := FALSE;


  {  Prcod_empresa.Text:= DMCONSIS.QUUSU.fieldbyname('cod_empresa').AsString;
    Lbnom_empresa.Caption:= DMCONSIS.QUUSU.fieldbyname('nom_empresa').AsString;

    if DMCONSIS.QUUSU.FieldByName('nivel').AsString = '0' then
       Prnormal.Checked
    else
    if DMCONSIS.QUUSU.FieldByName('nivel').AsString = '1' then
       Prgerente.Checked
    else
    if DMCONSIS.QUUSU.FieldByName('nivel').AsString = '2' then
       Pradministrador.Checked;}

end;

procedure TFRUSU.Prcod_empresaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_usuario_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

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

procedure TFRUSU.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Usuário';
  chamou_pesquisa := 'fr_usuario';
  chamou_form := 'fr_usuario';
  chamou_cadastro := 'Fr_usuario';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Usuário';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_usuario(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  GBDADUSU.Enabled := true;
  GBDADUSU.Enabled := false;

  Prcod_empresaExit(Self);
  Prcod_representanteExit(Self);

end;

procedure TFRUSU.Prcod_representanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_usuario_representante';
  chamou_cadastro := 'Fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Representante';

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

procedure TFRUSU.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prcod_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante from representante where id=' + QuotedStr(Prcod_representante.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_representante.Text := '';
      Prcod_representante.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFRUSU.Prcod_representanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_representante.Text = '') then
      Prcod_representanteButtonClick(Self);
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFRUSU.Prcod_empresaExit(Sender: TObject);
begin
  if trim(Prcod_empresa.Text) = '' then
    Lbnom_empresa.Caption := '...';

  if Prcod_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' + QuotedStr(Prcod_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_empresa.Caption := dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_empresa.Text := '';
      Prcod_empresa.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFRUSU.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


end.
