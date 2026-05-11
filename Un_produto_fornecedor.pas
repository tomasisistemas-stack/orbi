unit Un_produto_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, sLabel, sPanel, sBitBtn,
  sGroupBox, sMaskEdit, sCustomComboEdit, sComboEdit, sEdit;

type
  Tfm_produto_fornecedor = class(TForm)
    Panel1: tsPanel;
    gbProduto: TsGroupBox;
    Panel2: tsPanel;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    Emcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    gbProdutoForn: TsGroupBox;
    lbProdutoFornecedor: TsLabel;
    EmCOD_PRODUTO_FORNECEDOR: TsEdit;
    procedure btgraClick(Sender: TObject);
    procedure Emcod_produtoButtonClick(Sender: TObject);
    procedure Emcod_produtoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    produto_fornecedor: string;
    produto_servico: boolean;
  end;

var
  fm_produto_fornecedor: Tfm_produto_fornecedor;

implementation

uses Un_localizar, Un_dao, UnPri;

{$R *.dfm}

procedure Tfm_produto_fornecedor.btgraClick(Sender: TObject);
begin
  if (trim(Emcod_produto.Text) = '') then
  begin
    ShowMessage('Produto deve ser informado!!!');
    Emcod_produto.SetFocus;
    Exit;
  end;

  if (trim(EmCOD_PRODUTO_FORNECEDOR.Text) = '') then
  begin
    ShowMessage('Código do Produto do Fornecedor deve ser informado!!!');
    EmCOD_PRODUTO_FORNECEDOR.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure Tfm_produto_fornecedor.Emcod_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_produto_fornecedor_produto';
  chamou_cadastro := 'Fr_produto';

  if not produto_servico then
    revenda := 'S'
  else
    revenda := 'N';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';
  Campos_combo[3] := 'Referencia';
  Campos_combo[4] := 'Grupo';
  Campos_combo[5] := 'Fornecedor';

  for i := 0 to 5 do
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

procedure Tfm_produto_fornecedor.Emcod_produtoExit(Sender: TObject);
begin
  if trim(Emcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Emcod_produto.Text <> '' then
  begin
    dao.Geral1('select nom_produto from produto p where p.cod_produto =' + Emcod_produto.text);
    if not dao.q1.IsEmpty then
      Lbnom_produto.Caption := dao.q1.fieldbyname('nom_produto').asstring;
  end;
end;

procedure Tfm_produto_fornecedor.FormShow(Sender: TObject);
begin
  if Emcod_produto.enabled then
    Emcod_produto.SetFocus;

  if EmCOD_PRODUTO_FORNECEDOR.enabled then
  begin
    Emcod_produtoExit(Self);
    EmCOD_PRODUTO_FORNECEDOR.SetFocus;
  end;
end;

procedure Tfm_produto_fornecedor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.

