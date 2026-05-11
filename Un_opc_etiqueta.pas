unit Un_opc_etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, registry, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sComboEdit;

type
  TFr_opc_etiqueta = class(TForm)
    GroupBox1: TsGroupBox;
    Cbjato: TRadioButton;
    Cbmatricial: TRadioButton;
    GroupBox2: TsGroupBox;
    GroupBox3: TsGroupBox;
    Label34: tsLabel;
    Prcod_grupo: TsComboEdit;
    LbNom_Grupo: tsLabel;
    Label15: tsLabel;
    Emcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    bt_enviar_email: TsBitBtn;
    bt_imprimir: TsBitBtn;
    Label1: tsLabel;
    ComboBox1: TComboBox;
    Label9: tsLabel;
    PrCod_Cidade: TsComboEdit;
    LbNom_cidade: tsLabel;
    Prcod_cliente: TsComboEdit;
    Label11: tsLabel;
    Lbnom_cliente: tsLabel;
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Prcod_clienteButtonClick2(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure monta_etiqueta_maladireta(cod_cidade, tipo_etiqueta: string);


  end;

var
  Fr_opc_etiqueta: TFr_opc_etiqueta;

implementation

uses Un_rel_etiqueta_cliente, UnPri, Un_localizar;

{$R *.dfm}

procedure TFr_opc_etiqueta.monta_etiqueta_maladireta(cod_cidade,
  tipo_etiqueta: string);
var
  cmd: string;
begin
  Application.CreateForm(TRl_etiqueta_cliente, Rl_etiqueta_cliente);

  cmd := 'select nom_cliente, endereco, cep, bairro, c.cod_cidade, cd.nom_cidade, cd.uf from cliente c ' +
    'left join cidades cd on cd.cod_cidade = c.cod_cidade ' +
    'where endereco is not null';

  if PrCod_Cidade.Text <> '' then
    cmd := cmd + ' and cod_cidade=' + QuotedStr(PrCod_Cidade.Text);

  cmd := cmd + ' order by nom_cliente';

  with Rl_etiqueta_cliente.qu_etiqueta_cliente do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  Rl_etiqueta_cliente.RLetiqueta.Preview;






end;

procedure TFr_opc_etiqueta.bt_imprimirClick(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  Registro.OpenKey('software\Acta\Orbi', true);
  if Cbmatricial.Checked then
    Registro.WriteString('tipo_printer', 'matricial');
  if CbJato.Checked then
    Registro.WriteString('tipo_printer', 'jato');
  Registro.Free;
  //configura o componente Draft do Fortes que está no Frpri
{  if Cbjato.Checked then
    FRPRI.printer_dialog.Filter.DisplayName := 'Padrao'
  else
    FRPRI.printer_dialog.Filter.DisplayName := 'Matricial';
 }

  if tipo_relatorio = 'etiqueta_cliente' then
  begin
    monta_etiqueta_maladireta('', '');
  end;
end;

procedure TFr_opc_etiqueta.FormCreate(Sender: TObject);
var
  registro: TRegistry;
begin
  registro := TRegistry.Create;
  registro.RootKey := HKEY_CURRENT_USER;
  registro.OpenKey('Software\Acta\Orbi', true);
  if registro.ValueExists('tipo_printer') then
  begin
    if registro.ReadString('tipo_printer') = 'jato' then
      CbJato.Checked := true
    else
      CbJato.Checked := false;

    if registro.ReadString('tipo_printer') = 'matricial' then
      Cbmatricial.Checked := true
    else
      Cbmatricial.Checked := false;

  end;
  registro.Free;

end;

procedure TFr_opc_etiqueta.Prcod_clienteButtonClick2(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_venda_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 5 do
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

procedure TFr_opc_etiqueta.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if key = #13 then
  begin
    if (Prcod_cliente.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_venda_cliente';
      chamou_cadastro := 'Fr_cliente';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 6);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'CNPJ';
      Campos_combo[3] := 'CPF';
      Campos_combo[4] := 'Cidade';

      for i := 0 to 5 do
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

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_opc_etiqueta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
