unit un_transf_valores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sComboEdit;

type
  TFm_Transf_Valores = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    gbOrigem: TsGroupBox;
    Lbnom_cc_Orig: tsLabel;
    edContaOrigem: TsComboEdit;
    gbDestino: TsGroupBox;
    Lbnom_cc_Dest: tsLabel;
    edContaDestino: TsComboEdit;
    gbValor: TsGroupBox;
    edValorTransf: TsCurrencyEdit;
    BtnOk: TsBitBtn;
    BtnCancelar: TsBitBtn;
    ckDeposito: tscheckbox;
    procedure edContaOrigemButtonClick(Sender: TObject);
    procedure edContaOrigemExit(Sender: TObject);
    procedure edContaDestinoExit(Sender: TObject);
    procedure edContaDestinoButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Transf_Valores: TFm_Transf_Valores;

implementation

uses Un_localizar, Un_dao, unpri, UnFun;

{$R *.dfm}

procedure TFm_Transf_Valores.edContaOrigemButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_transf_cc_origem';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome da Conta';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Data da abertura da conta';

  for i := 0 to 3 do
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

procedure TFm_Transf_Valores.edContaOrigemExit(Sender: TObject);
begin
  dao.Geral1('SELECT a.ID, B.NOM_BANCO,A.NR_AGENCIA,A.NOM_CONTA FROM CONTA_CORRENTE a LEFT OUTER JOIN BANCO B ON (B.ID = A.ID_BANCO) WHERE A.ID = ' + edContaOrigem.Text);
  if dao.Q1.IsEmpty then
  begin
    ShowMessage('Conta Inexistente!');
    edContaOrigem.Clear;
    edContaOrigem.SetFocus;
  end
  else
    Lbnom_cc_orig.Caption := dao.Q1.fieldbyname('NOM_CONTA').AsString;
end;

procedure TFm_Transf_Valores.edContaDestinoExit(Sender: TObject);
begin
  dao.Geral1('SELECT a.ID, B.NOM_BANCO,A.NR_AGENCIA,A.NOM_CONTA FROM CONTA_CORRENTE a LEFT OUTER JOIN BANCO B ON (B.ID = A.ID_BANCO) WHERE A.ID = ' + edContaDestino.Text);
  if dao.Q1.IsEmpty then
  begin
    ShowMessage('Conta Inexistente!');
    edContaDestino.Clear;
    edContaDestino.SetFocus;
  end
  else
    Lbnom_cc_dest.Caption := dao.Q1.fieldbyname('NOM_CONTA').AsString;
end;

procedure TFm_Transf_Valores.edContaDestinoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_transf_cc_destino';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome da Conta';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Data da abertura da conta';

  for i := 0 to 3 do
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

procedure TFm_Transf_Valores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFm_Transf_Valores.BtnOkClick(Sender: TObject);
var
  extrato: integer;
begin
  if trim(edContaOrigem.Text) = '' then
  begin
    showmessage('Conta de Origem deve ser preenchida!');
    edContaOrigem.SetFocus;
    exit;
  end;

  if trim(edContaDestino.Text) = '' then
  begin
    showmessage('Conta Destino deve ser preenchida!');
    edContaDestino.SetFocus;
    exit;
  end;

  if edValorTransf.Value = 0 then
  begin
    showmessage('Valor deve ser preenchido!');
    edValorTransf.SetFocus;
    exit;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    if ckDeposito.Checked then
      extrato := fmfun.GravaExtrato('DEPÓSITO PARA CONTA: ' + Lbnom_cc_Orig.Caption, QuotedStr(formatdatetime('dd/mm/yyyy', now)), edContaDestino.Text, 'C', edValorTransf.Value, 2)
    else
    begin
      extrato := fmfun.GravaExtrato('TRANSFERÊNCIA PARA CONTA: ' + Lbnom_cc_Dest.Caption, QuotedStr(formatdatetime('dd/mm/yyyy', now)), edContaOrigem.Text, 'D', edValorTransf.Value, 2);
      extrato := fmfun.GravaExtrato('TRANSFERÊNCIA ORIGINADA DA CONTA: ' + Lbnom_cc_Orig.Caption, QuotedStr(formatdatetime('dd/mm/yyyy', now)), edContaDestino.Text, 'C', edValorTransf.Value, 2);
    end;
    dao.cn.Commit;
    showmessage('Transferência efetuada com sucesso!');
  except
    dao.cn.Rollback;
  end;
end;

procedure TFm_Transf_Valores.FormShow(Sender: TObject);
begin
  edContaOrigem.SetFocus;
end;

end.
