unit un_impostos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ExtCtrls, DB, RxMemDS, StdCtrls,
  DBCtrls, Buttons, frxClass, sPageControl, sSpeedButton,
  sPanel, sBitBtn, sCheckBox, acDBGrid, Math, IdFTPCommon, sComboEdit,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, sLabel, acDBTextFX, sBevel,
  frxDBSet, sEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
{  TPalmImportacao = class(TThread)
  private
    cont_arq, total_arq, cont_ped, total_ped: integer;
    nom_arq, pedido_nr: string;
    finalizou: boolean;
    procedure Execute; override;
    //referente a NF-e
    procedure ExportaFotosProdutos;
    procedure ImportarPedidoPalm(arquivo: string);
    procedure BuscaArquivosImportacao;
    function BuscarClientePorCPFCNPJ(cpfcnpj: string): string;
    procedure Mostra;
  public
    constructor Create;
  end;}

  TFrImpostos = class(TForm)
    Panel1: tsPanel;
    PageControl1: TsPageControl;
    TabImpostos: TsTabSheet;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgPedido: Tdbgrid;
    Panel5: tsPanel;
    dgItem: Tdbgrid;
    q_total: TFDQuery;
    ds_total: TDataSource;
    q_itens1: TFDQuery;
    ds_itens1: TDataSource;
    Panel6: tsPanel;
    btImprimir: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    sPanel1: TsPanel;
    Label1: TsLabel;
    ftMovDe: TsDateEdit;
    Label2: TsLabel;
    ftMovAte: TsDateEdit;
    Lbl_Colaborador: TsLabel;
    cod_empresa: TsComboEdit;
    Lbnom_empresa: TsLabel;
    btok: TsSpeedButton;
    pnSaldo: TsPanel;
    sDBTextFX1: TsDBTextFX;
    q_saldo: TFDQuery;
    ds_saldo: TDataSource;
    sDBTextFX2: TsDBTextFX;
    sDBTextFX3: TsDBTextFX;
    sDBTextFX4: TsDBTextFX;
    sLabel1: TsLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    sBevel4: TsBevel;
    dst_entradas_resumido: TfrxDBDataset;
    dst_itens: TfrxDBDataset;
    dst_saldo: TfrxDBDataset;
    q_itens2: TFDQuery;
    ds_itens2: TDataSource;
    sLabel2: TsLabel;
    edClienteForn: TsEdit;
    sDBTextFX5: TsDBTextFX;
    sBevel5: TsBevel;
    q_itens1tipo: TMemoField;
    q_itens1empresa_faturar: TIntegerField;
    q_itens1nom_empresa: TStringField;
    q_itens1cliente_fornecedor: TStringField;
    q_itens1dta_emissao: TDateField;
    q_itens1numdoc: TIntegerField;
    q_itens1nfe: TIntegerField;
    q_itens1chave_nfe: TStringField;
    q_itens1tot_liquido: TFMTBCDField;
    q_itens1vlr_bc_icms: TFMTBCDField;
    q_itens1vlr_icms: TFMTBCDField;
    q_itens1vlr_st: TFMTBCDField;
    q_itens1vlr_ipi: TFloatField;
    q_itens1vlr_tot_nf: TFMTBCDField;
    q_totaltipo: TMemoField;
    q_totalempresa_faturar: TIntegerField;
    q_totalnom_empresa: TStringField;
    q_totalcliente_fornecedor: TStringField;
    q_totaldta_emissao: TDateField;
    q_totalnumdoc: TIntegerField;
    q_totalnfe: TIntegerField;
    q_totalchave_nfe: TStringField;
    q_totaltot_liquido: TFMTBCDField;
    q_totalvlr_bc_icms: TFMTBCDField;
    q_totalvlr_icms: TFMTBCDField;
    q_totalvlr_st: TFMTBCDField;
    q_totalvlr_ipi: TFloatField;
    q_totalvlr_tot_nf: TFMTBCDField;
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure FormShow(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure dgPedidoEnter(Sender: TObject);
    procedure dgPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure dgPedidoCellClick(Column: TColumn);
    procedure dgPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_empresaExit(Sender: TObject);
    procedure cod_empresaButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure CarregaDados(empresa, cliente: string; data_ini, data_fim: Tdate);
    procedure CarregaDadosItem(empresa, cliente, tipo: string; data_ini,
      data_fim: Tdate);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrImpostos: TFrImpostos;

implementation

uses Un_dao, UnPri, Un_dm, UnFun, Un_localizar;

{$R *.dfm}

procedure TFrImpostos.CarregaDados(empresa, cliente : string; data_ini, data_fim : Tdate);
begin
  q_total.Close;
  q_total.ParamByName('empresa').AsString := empresa;
  q_total.ParamByName('data_ini').AsDateTime  := data_ini;
  q_total.ParamByName('data_fim').AsDateTime  := data_fim;
  q_total.ParamByName('cliente').AsString := cliente;
  q_total.Open;

  q_saldo.Close;
  q_saldo.ParamByName('empresa').AsString := empresa;
  q_saldo.ParamByName('data_ini').AsDateTime  := data_ini;
  q_saldo.ParamByName('data_fim').AsDateTime  := data_fim;
  q_saldo.ParamByName('cliente').AsString := cliente;
  q_saldo.Open;

  q_itens1.Close;
  q_itens1.ParamByName('empresa').AsString := empresa;
  q_itens1.ParamByName('tipo').AsString    := q_total.fieldbyname('tipo').AsString;
  q_itens1.ParamByName('data_ini').AsDateTime  := data_ini;
  q_itens1.ParamByName('data_fim').AsDateTime  := data_fim;
  q_itens1.ParamByName('cliente').AsString := cliente;
  q_itens1.Open;

  q_itens2.Close;
  q_itens2.ParamByName('empresa').AsString := empresa;
  q_itens2.ParamByName('data_ini').AsDateTime  := data_ini;
  q_itens2.ParamByName('data_fim').AsDateTime  := data_fim;
  q_itens2.ParamByName('cliente').AsString := cliente;
  q_itens2.Open;

  CarregaDadosItem(empresa, cliente, q_total.fieldbyname('tipo').AsString, data_ini, data_fim);

end;

procedure TFrImpostos.CarregaDadosItem(empresa, cliente, tipo : string; data_ini, data_fim : Tdate);
begin
  q_itens1.Close;
  q_itens1.ParamByName('empresa').AsString := empresa;
  q_itens1.ParamByName('tipo').AsString    := tipo;
  q_itens1.ParamByName('data_ini').AsDateTime  := data_ini;
  q_itens1.ParamByName('data_fim').AsDateTime  := data_fim;
  q_itens1.ParamByName('cliente').AsString  := cliente;
  q_itens1.Open;
end;

procedure TFrImpostos.btImprimirClick(Sender: TObject);
var
  cmd, conexao, path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\impostos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;

procedure TFrImpostos.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    value := ftMovDe.Text
  else if VarName = 'dtafin' then
    value := ftMovAte.Text;
end;

procedure TFrImpostos.FormShow(Sender: TObject);
begin
  cod_empresa.Text := '1';
  cod_empresaExit(Self);  
  ftMovDe.Date     := strtodate('01/'+formatdatetime('mm/yyyy', now));
  ftMovAte.Date    := now;
  CarregaDados(cod_empresa.Text, edClienteForn.Text, ftMovDe.Date, ftMovAte.Date);
end;

procedure TFrImpostos.btokClick(Sender: TObject);
begin
  if trim(cod_empresa.Text) = '' then
  begin
    showmessage('Empresa deve ser preenchida.');
    cod_empresa.SetFocus;
    exit;
  end;

  if ftMovDe.Date = 0 then
  begin
    showmessage('Data Inicial deve ser preenchida.');
    ftMovDe.SetFocus;
    exit;
  end;

  if ftMovAte.Date = 0 then
  begin
    showmessage('Data Final ser preenchida.');
    ftMovAte.SetFocus;
    exit;
  end;

  CarregaDados(cod_empresa.Text, edClienteForn.Text, ftMovDe.Date, ftMovAte.Date);
end;

procedure TFrImpostos.dgPedidoEnter(Sender: TObject);
begin
 // CarregaDadosItem(q_totalCODEMP.AsString, edClienteForn.Text, q_total.fieldbyname('tipo').AsString, q_total.parambyname('data_ini').AsDateTime, q_total.parambyname('data_fim').AsDateTime);
end;

procedure TFrImpostos.dgPedidoKeyPress(Sender: TObject; var Key: Char);
begin
//  CarregaDadosItem(q_totalCODEMP.AsString, edClienteForn.Text, q_total.fieldbyname('tipo').AsString, q_total.parambyname('data_ini').AsDateTime, q_total.parambyname('data_fim').AsDateTime);
end;

procedure TFrImpostos.dgPedidoCellClick(Column: TColumn);
begin
//  CarregaDadosItem(q_totalCODEMP.AsString, edClienteForn.Text, q_total.fieldbyname('tipo').AsString, q_total.parambyname('data_ini').AsDateTime, q_total.parambyname('data_fim').AsDateTime);
end;

procedure TFrImpostos.dgPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //CarregaDadosItem(q_totalCODEMP.AsString, edClienteForn.Text, q_total.fieldbyname('tipo').AsString, q_total.parambyname('data_ini').AsDateTime, q_total.parambyname('data_fim').AsDateTime);
end;

procedure TFrImpostos.cod_empresaExit(Sender: TObject);
begin
  if cod_empresa.Text <> '' then
  begin
    dao.Geral2('select e.nom_empresa||'' - ''||e.CNPJ AS NOM_EMPRESA, c.id as conta_corrente, e.ENQUADRADA_SIMPLES From empresa e inner join conta_corrente c on (c.id_empresa = e.cod_empresa) where c.ativo = ''S'' and e.cod_empresa=' + QuotedStr(cod_empresa.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_empresa.Caption := dao.Q2.fieldbyname('nom_empresa').AsString
    else begin
      showmessage('Código da Empresa Inexistente.');
      cod_empresa.SetFocus;
      exit;
    end;
  end;
end;

procedure TFrImpostos.cod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_impostos_empresa';
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

procedure TFrImpostos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.

