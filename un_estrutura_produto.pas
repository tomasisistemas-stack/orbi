unit un_estrutura_produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, MATH,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, sLabel,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sComboEdit, Data.DB, RxMemDS,
  Vcl.Grids, Vcl.DBGrids, acDBGrid, acDBTextFX, RxToolEdit, RxDBCtrl, sCurrEdit,
  sDBCalcEdit, Vcl.Buttons, sBitBtn, sPanel, Vcl.DBCtrls, sDBEdit, sDBMemo,
  Vcl.Menus, frxClass, frxExportPDF, frxDBSet, frxExportBaseDialog;

type
  Tfrm_estrutura_produto = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Prcod_produto: TsComboEdit;
    Lbl_produto: TsLabel;
    dgLista: Tdbgrid;
    mmInsumos: TRxMemoryData;
    mmInsumosIDPRODUTO: TIntegerField;
    mmInsumosNOME_PRODUTO: TStringField;
    dsInsumos: TDataSource;
    mmInsumosQUANTIDADE: TFloatField;
    PnInsumo: TPanel;
    sLabel2: TsLabel;
    Mecod_produto: TRxDBComboEdit;
    lbProdutoDesc: TsDBTextFX;
    Meqtd: TsDBCalcEdit;
    sLabel3: TsLabel;
    Panel5: TPanel;
    Btnovped: TsBitBtn;
    Btaltped: TsBitBtn;
    Btgraped: TsBitBtn;
    Btcanped: TsBitBtn;
    BTEXCLUIR: TsBitBtn;
    Panel8: TPanel;
    sPanel1: TsPanel;
    pnProcesso: TPanel;
    sLabel4: TsLabel;
    lbEtapa: TsDBTextFX;
    sLabel5: TsLabel;
    meEtapaId: TRxDBComboEdit;
    Panel6: TPanel;
    btInsSec: TsBitBtn;
    btAltSec: TsBitBtn;
    btGravSec: TsBitBtn;
    btCanSec: TsBitBtn;
    btExcSec: TsBitBtn;
    gbProcessos: Tdbgrid;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    sDBEdit1: TsDBEdit;
    mmInsumosORDEM: TIntegerField;
    mmProcessos: TRxMemoryData;
    dsProcessos: TDataSource;
    mmProcessosETAPA_ID: TIntegerField;
    mmProcessosETAPA_DESCRICAO: TStringField;
    mmProcessosCUSTO_HORA: TCurrencyField;
    mmProcessosTEMPO: TIntegerField;
    mmProcessosCUSTO_TOTAL: TCurrencyField;
    mmProcessosCOD_PRODUTO_ACABADO: TIntegerField;
    mmProcessosCOD_PRODUTO_INSUMO: TIntegerField;
    sDBTextFX1: TsDBTextFX;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sDBTextFX2: TsDBTextFX;
    sLabel8: TsLabel;
    edDesc: TsDBMemo;
    mmProcessosDESCRICAO: TMemoField;
    sbInsSecao: TSpeedButton;
    edtempo: TsDBCalcEdit;
    mmInsumosCUSTO: TCurrencyField;
    mmInsumosCUSTO_TOTAL: TCurrencyField;
    Panel2: TPanel;
    mmInsumosTOTAL_GERAL: TCurrencyField;
    Lbnom_produto: TsLabelFX;
    pngeral: TPanel;
    pntotalprocessos: TPanel;
    MainMenu1: TMainMenu;
    I1: TMenuItem;
    I2: TMenuItem;
    P1: TMenuItem;
    N1: TMenuItem;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    mmRelatorio: TRxMemoryDataEx;
    mmRelatorioNIVEL: TIntegerField;
    mmRelatorioPRODUTO_ACABADO: TStringField;
    mmRelatorioPRODUTO_INSUMO: TStringField;
    mmRelatorioORDEM: TIntegerField;
    mmRelatorioQUANTIDADE: TFloatField;
    mmRelatorioCUSTO: TCurrencyField;
    mmRelatorioCUSTO_TOTAL: TCurrencyField;
    mmRelatorioQUANT_NIVEL: TIntegerField;
    mmRelatorioCOD_INSUMO: TIntegerField;
    dsRelatorio: TDataSource;
    dst_Estrutura: TfrxDBDataset;
    mmRelatorioORDEMGERAL: TFloatField;
    mmRelatorioTOTALPROCESSOS: TFloatField;
    mmRelatorioCUSTO_GERAL: TFloatField;
    mmRelatorioUNIDADE: TStringField;
    sbClonar: TSpeedButton;
    procedure BtnovpedClick(Sender: TObject);
    procedure BtaltpedClick(Sender: TObject);
    procedure BtgrapedClick(Sender: TObject);
    procedure BtcanpedClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Mecod_produtoExit(Sender: TObject);
    procedure Mecod_produtoButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTEXCLUIRClick(Sender: TObject);
    procedure btInsSecClick(Sender: TObject);
    procedure btCanSecClick(Sender: TObject);
    procedure btExcSecClick(Sender: TObject);
    procedure btGravSecClick(Sender: TObject);
    procedure btAltSecClick(Sender: TObject);
    procedure edTempoExit(Sender: TObject);
    procedure sbInsSecaoClick(Sender: TObject);
    procedure meEtapaIdExit(Sender: TObject);
    procedure meEtapaIdButtonClick(Sender: TObject);
    procedure Prcod_produtoEnter(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure sbClonarClick(Sender: TObject);
  private
    procedure CarregarEstrutura(produto: string);
    procedure CarregarProcesso(acabado: string);
    procedure GravarEstrutura;
    procedure GravarProcesso;
    procedure CalculoHora;
    procedure CalculoPrecoHora;
    procedure AtualizaCustoProduto;

    function ListaEstrutura(nivel: integer; ordem_geral: Real;
      produto: string): string;
    procedure CarregarLista(level: integer);
    function ChecarNivelLista(level: integer): boolean;
    function GravarNiveis(produto: string): TStringList;

    { Private declarations }
  public
    { Public declarations }
    procedure Clonar(produto: string);
  end;

var
  frm_estrutura_produto: Tfrm_estrutura_produto;
  total_insumos, total_processos, total_geral: Currency;

implementation

uses Un_dao, un_localizar, unPri, un_etapas_producao, UnFun;

{$R *.dfm}

procedure Tfrm_estrutura_produto.BtaltpedClick(Sender: TObject);
begin
  PnInsumo.Enabled := true;
  mmInsumos.Edit;
  Mecod_produto.SetFocus;

  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  BTEXCLUIR.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
end;

procedure Tfrm_estrutura_produto.CarregarEstrutura(produto: string);
var
  sql_insert: string;
begin
  if produto = '' then
    exit;
  dao.Geral1('SELECT ' + '  A.ORDEM, ' + '  a.COD_PRODUTO_INSUMO, ' +
    '  P.NOM_PRODUTO, ' + '  a.QUANTIDADE, ' + '  p.CUSTO_TOTAL, ' +
    '  (a.QUANTIDADE * (coalesce(p.CUSTO_TOTAL,0))) as total ' +
    'FROM ESTRUTURA_PRODUTO a ' +
    'INNER JOIN PRODUTO P  ON  P.COD_PRODUTO = A.COD_PRODUTO_INSUMO ' +
    'INNER JOIN PRODUTO AC ON AC.COD_PRODUTO = A.COD_PRODUTO_ACABADO ' +
    'WHERE A.COD_PRODUTO_ACABADO = ' + produto + ' ORDER BY A.ORDEM ');

  dao.Q1.First;

  if not mmInsumos.Active then
    mmInsumos.Open;
  mmInsumos.EmptyTable;

  if dao.Q1.IsEmpty then
  begin
    sql_insert :=
      'UPDATE PRODUTO SET MATERIA_PRIMA = ''0'' WHERE COD_PRODUTO = ' +
      Prcod_produto.Text;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql(sql_insert);
    dao.cn.Commit;
    sbClonar.Enabled := mmInsumos.IsEmpty;
    exit;
  end;
  total_insumos := 0;
  while not dao.Q1.Eof do
  begin
    mmInsumos.Append;

    mmInsumosIDPRODUTO.AsString :=
      dao.Q1.FieldByName('COD_PRODUTO_INSUMO').AsString;
    mmInsumosNOME_PRODUTO.AsString := dao.Q1.FieldByName('NOM_PRODUTO')
      .AsString;
    mmInsumosQUANTIDADE.AsFloat := dao.Q1.FieldByName('QUANTIDADE').AsFloat;
    mmInsumosORDEM.AsFloat := dao.Q1.FieldByName('ORDEM').AsInteger;
    mmInsumosCUSTO.AsFloat := dao.Q1.FieldByName('CUSTO_TOTAL').AsFloat;
    mmInsumosCUSTO_TOTAL.AsFloat := dao.Q1.FieldByName('TOTAL').AsFloat;
    total_insumos := total_insumos + dao.Q1.FieldByName('TOTAL').AsFloat;
    mmInsumos.Post;

    dao.Q1.Next;
  end;
  mmInsumos.First;
  //lbCustoInsumos.Caption := FormatFloat('Total Insumos: R$ #,###,##0.00',    total_insumos);
  Btnovped.Enabled := true;
  Btaltped.Enabled := not mmInsumos.IsEmpty;
  BTEXCLUIR.Enabled := not mmInsumos.IsEmpty;
  Btgraped.Enabled := false;
  Btcanped.Enabled := false;

  CarregarProcesso(produto);
  total_geral := total_insumos + total_processos;
  //lbcustogeral.Caption := FormatFloat('Total Geral: R$ #,###,##0.00',  total_geral);
  sbClonar.Enabled := mmInsumos.IsEmpty;
end;

procedure Tfrm_estrutura_produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
  if Key = #13 then
  begin

    if ((ActiveControl.Name = 'PrProcessos') or (ActiveControl.Name = 'edDesc'))
    then
      exit;

    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);

  end;
end;

procedure Tfrm_estrutura_produto.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;
  if VarName = 'acabado' then
    Value := fmfun.enchezero(Prcod_produto.Text, 6) + '-' +
      Lbnom_produto.Caption;
end;

procedure Tfrm_estrutura_produto.btAltSecClick(Sender: TObject);
begin

  pnProcesso.Enabled := true;
  mmProcessos.Edit;
  meEtapaId.SetFocus;

  btInsSec.Enabled := false;
  btAltSec.Enabled := false;
  btExcSec.Enabled := false;
  btGravSec.Enabled := true;
  btCanSec.Enabled := true;
  sbInsSecao.Enabled := true;

end;

procedure Tfrm_estrutura_produto.CarregarProcesso(acabado: string);
begin

  if acabado = '' then
    exit;

  dao.Geral2(' select ' + '  pp.ETAPA_ID, ' + '  pp.DESCRICAO, ' +
    '  pp.CUSTO_TOTAL, ' + '  pp.TEMPO, ' + '  ep.DESCRICAO as secao, ' +
    '  ep.CUSTO as custo_hora ' + ' from ' + '  PROCESSO_PRODUCAO pp ' +
    ' left outer join ETAPA_PRODUCAO ep on ep.ID = pp.ETAPA_ID ' +
    ' where pp.cod_produto_acabado = ' + acabado + ' order by pp.id ');

  dao.Q2.First;

  mmProcessos.EmptyTable;
  if dao.Q2.IsEmpty then
    exit;
  if not mmProcessos.Active then
    mmProcessos.Open;
  total_processos := 0;
  while not dao.Q2.Eof do
  begin
    mmProcessos.Append;
    mmProcessosDESCRICAO.AsString := dao.Q2.FieldByName('DESCRICAO').AsString;
    mmProcessosETAPA_ID.AsString := dao.Q2.FieldByName('etapa_id').AsString;
    mmProcessosETAPA_DESCRICAO.AsString := dao.Q2.FieldByName('secao').AsString;
    mmProcessosCUSTO_HORA.AsString := dao.Q2.FieldByName('custo_hora').AsString;
    mmProcessosCUSTO_TOTAL.AsString :=
      dao.Q2.FieldByName('custo_total').AsString;
    mmProcessosTEMPO.AsString := dao.Q2.FieldByName('tempo').AsString;
    mmProcessosCOD_PRODUTO_ACABADO.AsString := acabado;
    mmProcessos.Post;
    total_processos := total_processos + mmProcessosCUSTO_TOTAL.Value;
    dao.Q2.Next;
  end;
  dao.Q2.First;
  mmProcessos.First;
  btInsSec.Enabled := true;
  btAltSec.Enabled := not mmProcessos.IsEmpty;
  btExcSec.Enabled := not mmProcessos.IsEmpty;
  btGravSec.Enabled := false;
  btCanSec.Enabled := false;
  sbInsSecao.Enabled := false;

//  lbcustoProcessos.Caption := FormatFloat('Total Processos: R$ #,###,##0.00', total_processos);
end;

procedure Tfrm_estrutura_produto.CalculoPrecoHora;
begin
  mmProcessosCUSTO_TOTAL.Value := (mmProcessosCUSTO_HORA.Value / 60) *
    mmProcessosTEMPO.Value;
end;

procedure Tfrm_estrutura_produto.edTempoExit(Sender: TObject);
begin
  CalculoHora;
end;

procedure Tfrm_estrutura_produto.CalculoHora;
begin
  mmProcessosCUSTO_TOTAL.Value := (mmProcessosCUSTO_HORA.Value / 60) *
    mmProcessosTEMPO.Value;
end;

procedure Tfrm_estrutura_produto.BtcanpedClick(Sender: TObject);
begin
  mmInsumos.Cancel;

  Btnovped.Enabled := true;
  Btaltped.Enabled := not mmInsumos.IsEmpty;
  BTEXCLUIR.Enabled := not mmInsumos.IsEmpty;
  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  PnInsumo.Enabled := false;

  CarregarEstrutura(Prcod_produto.Text);
end;

procedure Tfrm_estrutura_produto.btCanSecClick(Sender: TObject);
begin
  mmProcessos.Cancel;

  btInsSec.Enabled := true;
  btAltSec.Enabled := not mmProcessos.IsEmpty;
  btExcSec.Enabled := not mmProcessos.IsEmpty;
  btGravSec.Enabled := false;
  btCanSec.Enabled := false;
  sbInsSecao.Enabled := false;
  pnProcesso.Enabled := false;

  CarregarProcesso(Prcod_produto.Text);

end;

procedure Tfrm_estrutura_produto.BTEXCLUIRClick(Sender: TObject);
var
  sql_insert: string;
begin
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;

  sql_insert := 'DELETE FROM ESTRUTURA_PRODUTO WHERE COD_PRODUTO_INSUMO = ' +
    mmInsumosIDPRODUTO.AsString + ' and COD_PRODUTO_ACABADO = ' +
    Prcod_produto.Text;
  dao.Execsql(sql_insert);
  dao.cn.Commit;

  mmInsumos.Delete;

  Btnovped.Enabled := true;
  Btaltped.Enabled := not mmInsumos.IsEmpty;
  BTEXCLUIR.Enabled := not mmInsumos.IsEmpty;
  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  PnInsumo.Enabled := false;

  // GravarEstrutura;
  CarregarEstrutura(Prcod_produto.Text);
  AtualizaCustoProduto;
end;

procedure Tfrm_estrutura_produto.btExcSecClick(Sender: TObject);
begin
  mmProcessos.Delete;

  btInsSec.Enabled := true;
  btAltSec.Enabled := not mmProcessos.IsEmpty;
  btExcSec.Enabled := not mmProcessos.IsEmpty;
  btGravSec.Enabled := false;
  btCanSec.Enabled := false;
  sbInsSecao.Enabled := false;
  pnProcesso.Enabled := false;

  GravarProcesso;
  CarregarEstrutura(Prcod_produto.Text);
  AtualizaCustoProduto;
end;

procedure Tfrm_estrutura_produto.BtgrapedClick(Sender: TObject);
var
  lista, sublista : TStringList;
  x : integer;
begin

  mmInsumos.Post;

  Btnovped.Enabled := true;
  Btaltped.Enabled := true;
  BTEXCLUIR.Enabled := true;
  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  PnInsumo.Enabled := false;

  GravarEstrutura;
  CarregarEstrutura(Prcod_produto.Text);
  AtualizaCustoProduto;

  lista := TStringList.create;
  lista.Text := GravarNiveis(Prcod_produto.Text).Text;
  if lista.Count > 0 then
  begin
    repeat
      sublista := TStringList.create;
      for x := 0 to lista.Count - 1 do
        sublista.Add(GravarNiveis(lista[x]).Text);
      lista.Clear;
      lista.Add(sublista.Text);
      sublista.Free;
    until lista.Count = 0;
  end;
  lista.Free;

end;

procedure Tfrm_estrutura_produto.btGravSecClick(Sender: TObject);
begin
  mmProcessos.Post;

  btInsSec.Enabled := true;
  btAltSec.Enabled := true;
  btExcSec.Enabled := true;
  btGravSec.Enabled := false;
  btCanSec.Enabled := false;
  sbInsSecao.Enabled := false;
  pnProcesso.Enabled := false;

  GravarProcesso;
  CarregarEstrutura(Prcod_produto.Text);
end;

procedure Tfrm_estrutura_produto.btInsSecClick(Sender: TObject);
begin

  pnProcesso.Enabled := true;
  if not mmProcessos.Active then
    mmProcessos.Open;
  mmProcessos.Append;
  meEtapaId.SetFocus;
  btInsSec.Enabled := false;
  btAltSec.Enabled := false;
  btGravSec.Enabled := true;
  btCanSec.Enabled := true;
  sbInsSecao.Enabled := true;

end;

procedure Tfrm_estrutura_produto.BtnovpedClick(Sender: TObject);
begin
  PnInsumo.Enabled := true;
  if not mmInsumos.Active then
    mmInsumos.Open;

  mmInsumos.Append;
  Mecod_produto.SetFocus;
  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  BTEXCLUIR.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
end;

procedure Tfrm_estrutura_produto.Mecod_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_estrutura_produto_insumo';
  chamou_cadastro := 'Fr_produto';
  // revenda := 'S';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_estrutura_produto.Mecod_produtoExit(Sender: TObject);
begin

  if trim(Mecod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if ActiveControl.Name = 'btnovped' then
    exit;
  if ActiveControl.Name = 'Btaltped' then
    exit;
  if ActiveControl.Name = 'BTEXCLUIR' then
    exit;
  if ActiveControl.Name = 'btInsSec' then
    exit;
  if ActiveControl.Name = 'btAltSec' then
    exit;
  if ActiveControl.Name = 'btExcSec' then
    exit;
  if ActiveControl.Name = 'Btgraped' then
    exit;
  if ActiveControl.Name = 'Btcanped' then
    exit;

  if Mecod_produto.Text <> '' then
  begin
    if Mecod_produto.Text = Prcod_produto.Text then
    begin
      dao.msg('Insumo não pode ser o mesmo que o Produto Acabado ');
      Mecod_produto.Text := '';
      Mecod_produto.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_produto from produto where cod_produto=' +
      QuotedStr(Mecod_produto.Text));
    if dao.Q2.RecordCount > 0 then
      mmInsumosNOME_PRODUTO.AsString :=
        dao.Q2.FieldByName('nom_produto').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Mecod_produto.Text := '';
      Mecod_produto.SetFocus;
      exit;
    end;

  end;

end;

procedure Tfrm_estrutura_produto.meEtapaIdButtonClick(Sender: TObject);
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
  chamou_form := 'fr_etapa_estrutura';
  chamou_cadastro := 'fr_etapa_producao';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_estrutura_produto.meEtapaIdExit(Sender: TObject);
begin
  if trim(meEtapaId.Text) = '' then
    lbEtapa.Caption := '...';

  if meEtapaId.Text <> '' then
  begin
    dao.Geral2('select DESCRICAO, CUSTO, EXTERNO from ETAPA_PRODUCAO where ID ='
      + QuotedStr(meEtapaId.Text));

    if dao.Q2.RecordCount > 0 then
    begin
      mmProcessosETAPA_DESCRICAO.AsString :=
        dao.Q2.FieldByName('DESCRICAO').AsString;
      mmProcessosCUSTO_HORA.Value := dao.Q2.FieldByName('CUSTO').AsInteger;
      if dao.Q2.FieldByName('EXTERNO').AsString = 'S' then
      BEGIN
        mmProcessosTEMPO.Value := 1;
        edtempo.Enabled := false;
      END
      ELSE
      BEGIN
        edtempo.Enabled := true;
        edtempo.Clear;
      END;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      meEtapaId.Text := '';
      meEtapaId.SetFocus;
      exit;
    end;

  end;
end;

procedure Tfrm_estrutura_produto.Prcod_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_estrutura_produto';
  chamou_cadastro := 'Fr_produto';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_estrutura_produto.Prcod_produtoEnter(Sender: TObject);
begin
  PnInsumo.Enabled := false;
  pnProcesso.Enabled := false;
end;

procedure Tfrm_estrutura_produto.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';
  Btnovped.Enabled := true;

  if ActiveControl.Name = 'btnovped' then
    exit;
  if ActiveControl.Name = 'Btaltped' then
    exit;
  if ActiveControl.Name = 'BTEXCLUIR' then
    exit;
  if ActiveControl.Name = 'btInsSec' then
    exit;
  if ActiveControl.Name = 'btAltSec' then
    exit;
  if ActiveControl.Name = 'btExcSec' then
    exit;
  if ActiveControl.Name = 'Mecod_produto' then
    exit;

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' +
      QuotedStr(Prcod_produto.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.FieldByName('nom_produto').AsString;
      CarregarEstrutura(Prcod_produto.Text);
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      exit;

    end;
  end;

end;

procedure Tfrm_estrutura_produto.Clonar(produto:string);
var
  sql_exec : string;
begin
  dao.Geral1(
   ' SELECT '+
   '  A.ORDEM, '+
   '  a.COD_PRODUTO_INSUMO, '+
   '  P.NOM_PRODUTO, '+
   '  a.QUANTIDADE, '+
   '  p.CUSTO_TOTAL, '+
   '  (a.QUANTIDADE * (coalesce(p.CUSTO_TOTAL,0))) as total '+
   ' FROM ESTRUTURA_PRODUTO a '+
   ' INNER JOIN PRODUTO P  ON  P.COD_PRODUTO = A.COD_PRODUTO_INSUMO '+
   ' INNER JOIN PRODUTO AC ON AC.COD_PRODUTO = A.COD_PRODUTO_ACABADO '+
   ' WHERE A.COD_PRODUTO_ACABADO = '+produto+
   ' ORDER BY A.ORDEM');

   dao.Q1.First;
   mmInsumos.EmptyTable;
   mmInsumos.open;
   mmInsumos.DisableControls;
   while not dao.Q1.eof do
   begin
     mmInsumos.Append;
     mmInsumosIDPRODUTO.asstring    := dao.Q1.FieldByName('COD_PRODUTO_INSUMO').AsString;
     mmInsumosNOME_PRODUTO.asstring := dao.Q1.FieldByName('NOM_PRODUTO').AsString;
     mmInsumosORDEM.asstring   := dao.Q1.FieldByName('ordem').AsString;
     mmInsumosQUANTIDADE.asstring   := dao.Q1.FieldByName('quantidade').AsString;
     mmInsumosCUSTO_TOTAL.asstring  := dao.Q1.FieldByName('custo_total').AsString;
     mmInsumosTOTAL_GERAL.asstring  := dao.Q1.FieldByName('total').AsString;
     mmInsumos.Post;
     dao.Q1.Next;
   end;
   mmInsumos.EnableControls;
   GravarEstrutura;
   CarregarEstrutura(prCOD_PRODUTO.Text);
end;



procedure Tfrm_estrutura_produto.sbClonarClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Prcod_produto.Text = '' then exit;


  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Clonar Estrutura de Produto';
  chamou_pesquisa := 'fr_estrutura_clonar';
  chamou_form := 'fr_estrutura_clonar';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Produto';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;


  Fr_localizar.loc_estrutura_clonar('');
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfrm_estrutura_produto.sbInsSecaoClick(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_etapas_producao, fr_etapas_producao);
    fr_etapas_producao.expresso := true;
    fr_etapas_producao.ShowModal;
    if fr_etapas_producao.modalresult = mrok then
    begin
      meEtapaId.Text := fr_etapas_producao.id;
      meEtapaIdExit(self);
      edtempo.SetFocus;
    end;
  finally
    fr_etapas_producao.Free;
  end;
end;

function Tfrm_estrutura_produto.GravarNiveis(produto: string): TStringList;
var
  cmd: string;
  lista: TStringList;
begin
  lista := TStringList.create;
  cmd := 'SELECT ' + '  a.COD_PRODUTO_ACABADO, ' + '  p.NOM_PRODUTO, ' +
    '  cast( ' +
    '       coalesce((select sum(ep.QUANTIDADE * pe.CUSTO_TOTAL) from estrutura_produto ep inner join produto pe on pe.cod_produto = ep.COD_PRODUTO_INSUMO where ep.COD_PRODUTO_ACABADO = a.COD_PRODUTO_ACABADO), 0) '
    + '       + ' +
    '       coalesce((select sum(pp.CUSTO_TOTAL) from PROCESSO_PRODUCAO pp where pp.COD_PRODUTO_ACABADO = a.COD_PRODUTO_ACABADO), 0) '
    + '       as numeric(15,2))' + ' as total, ' +
    ' (select count(*) from estrutura_produto b where b.COD_PRODUTO_INSUMO = a.COD_PRODUTO_ACABADO) as tem_nivel '
    + 'FROM ESTRUTURA_PRODUTO a ' +
    'inner join produto p on p.COD_PRODUTO = a.COD_PRODUTO_ACABADO ' +
    'where a.COD_PRODUTO_INSUMO = ' + produto;

  dao.Geral1(cmd);
  dao.Q1.First;
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  while not dao.Q1.Eof do
  begin
    dao.Execsql('UPDATE PRODUTO SET CUSTO_TOTAL = ' +
      fmfun.BuscaTroca(dao.Q1.FieldByName('total').AsString, ',', '.') +
      ' WHERE COD_PRODUTO = ' + dao.Q1.FieldByName('COD_PRODUTO_ACABADO')
      .AsString);
    if dao.Q1.FieldByName('tem_nivel').Value > 0 then
      lista.Add(dao.Q1.FieldByName('COD_PRODUTO_ACABADO').AsString);
    dao.Q1.Next;
  end;
  dao.cn.Commit;
  Result := lista;
  lista.Free;
end;

procedure Tfrm_estrutura_produto.GravarEstrutura;
var
  sql_insert: string;
  lista, sublista: TStringList;
  x: integer;
begin
  try
    if trim(Prcod_produto.Text) = '' then
      exit;
    if mmInsumos.IsEmpty then
      exit;

    mmInsumos.First;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    sql_insert := 'DELETE FROM ESTRUTURA_PRODUTO WHERE COD_PRODUTO_ACABADO = ' +
      Prcod_produto.Text;
    dao.Execsql(sql_insert);
    dao.cn.Commit;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmInsumos.Eof do
    begin
      sql_insert :=
        'INSERT INTO ESTRUTURA_PRODUTO (COD_PRODUTO_ACABADO, COD_PRODUTO_INSUMO, ORDEM, QUANTIDADE) '
        + ' VALUES (' + Prcod_produto.Text + ', ' + mmInsumosIDPRODUTO.AsString
        + ', ' + mmInsumosORDEM.AsString + ', ' +
        fmfun.BuscaTroca(mmInsumosQUANTIDADE.AsString, ',', '.') + ');';
      dao.Execsql(sql_insert);
      mmInsumos.Next;
    end;

    sql_insert :=
      'UPDATE PRODUTO a set A.MATERIA_PRIMA = ''1'' where a.cod_produto NOT in (select e.COD_PRODUTO_ACABADO from ESTRUTURA_PRODUTO e)';
    dao.Execsql(sql_insert);

    dao.cn.Commit;

  finally
    showmessage('Registro Salvo com Sucesso!')
  end;
end;

procedure Tfrm_estrutura_produto.AtualizaCustoProduto;
var
  sql: string;
begin
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;

  sql := 'UPDATE PRODUTO set CUSTO_TOTAL = ' +
    fmfun.BuscaTroca(FLOATTOSTR(total_geral), ',', '.') +
    ' WHERE COD_PRODUTO = ' + Prcod_produto.Text;
  dao.Execsql(sql);

  dao.cn.Commit;
end;

procedure Tfrm_estrutura_produto.GravarProcesso;
var
  sql_insert: string;
begin
  try
    if trim(Prcod_produto.Text) = '' then
      exit;
    if mmInsumos.IsEmpty then
      exit;

    mmProcessos.First;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    sql_insert := 'DELETE FROM PROCESSO_PRODUCAO WHERE COD_PRODUTO_ACABADO = ' +
      Prcod_produto.Text;
    dao.Execsql(sql_insert);
    dao.cn.Commit;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmProcessos.Eof do
    begin
      sql_insert :=
        'INSERT INTO PROCESSO_PRODUCAO (DESCRICAO, ETAPA_ID, TEMPO, CUSTO_TOTAL, COD_PRODUTO_ACABADO) '
        + 'VALUES (' + QuotedStr(mmProcessosDESCRICAO.AsString) + ',' +
        mmProcessosETAPA_ID.AsString + ',' + mmProcessosTEMPO.AsString + ',' +
        fmfun.BuscaTroca(mmProcessosCUSTO_TOTAL.AsString, ',', '.') + ',' +
        Prcod_produto.Text + ')';
      dao.Execsql(sql_insert);

      mmProcessos.Next;
    end;

    dao.cn.Commit;
  finally
    showmessage('Registro Salvo com Sucesso!')
  end;
end;

procedure Tfrm_estrutura_produto.CarregarLista(level: integer);
begin
  mmRelatorio.First;
  while not mmRelatorio.Eof do
  begin
    if (mmRelatorioQUANT_NIVEL.AsInteger > 0) and
      (mmRelatorioNIVEL.AsInteger = level) then
      ListaEstrutura(mmRelatorioNIVEL.AsInteger, mmRelatorioORDEMGERAL.Value,
        mmRelatorioCOD_INSUMO.AsString);
    mmRelatorio.Next;
  end;
end;

function Tfrm_estrutura_produto.ChecarNivelLista(level: integer): boolean;
begin
  mmRelatorio.First;
  Result := false;
  while not mmRelatorio.Eof do
  begin
    if (mmRelatorioQUANT_NIVEL.AsInteger > 0) and
      (mmRelatorioNIVEL.AsInteger = level) then
      Result := true;
    mmRelatorio.Next;
  end;
end;

procedure Tfrm_estrutura_produto.I2Click(Sender: TObject);
var
  lista: TStringList;
  path: string;
  nivel: integer;
begin
  if Prcod_produto.Text = '' then
    exit;
  mmRelatorio.Open;
  mmRelatorio.EmptyTable;

  ListaEstrutura(0, 0, Prcod_produto.Text);
  nivel := 1;
  mmRelatorio.First;

  repeat
    if ChecarNivelLista(nivel) then
    begin
      CarregarLista(nivel);
      nivel := nivel + 1;
    end;
  until ChecarNivelLista(nivel) = false;

  mmRelatorio.ReSortOnFields(soAsc, 'ORDEMGERAL');
  lista := TStringList.create;
  while not mmRelatorio.Eof do
  begin
    lista.Add(mmRelatorioORDEMGERAL.AsString);
    mmRelatorio.Next;
  end;
  lista.SaveToFile('lista.txt');
  lista.Free;

  path := ExtractFilePath(Application.ExeName);
  frxReport1.LoadFromFile(path + 'Relatorios\estrutura_produto_insumos.fr3');
  frxReport1.ShowReport();
end;

function Tfrm_estrutura_produto.ListaEstrutura(nivel: integer;
  ordem_geral: Real; produto: string): string;
var
  sql, html: string;
begin
  sql := 'SELECT ' + '  PA.NOM_PRODUTO as ACABADO, ' +
    '  PI.NOM_PRODUTO AS INSUMO,  ' + '  A.COD_PRODUTO_INSUMO, ' +
    '  a.ORDEM,               ' + '  a.QUANTIDADE,          ' +
    '  coalesce(PA.CUSTO_TOTAL,0) AS TOTAL_GERAL, ' + '  PA.UNIDADE, ' +
    '  PI.CUSTO_TOTAL,        ' + '  A.QUANTIDADE * PI.CUSTO_TOTAL AS TOTAL, ' +
    '  lpad(A.COD_PRODUTO_ACABADO,6,''0'')||''-''||lpad(A.ORDEM,6,''0'')||''-''||lpad(A.COD_PRODUTO_INSUMO, 6, ''0'') AS ORD, '
    + '  (select count(*) from ESTRUTURA_PRODUTO ei where ei.COD_PRODUTO_ACABADO = pi.cod_produto) qtd_nivel_abaixo, '
    + '  coalesce((SELECT SUM(PP.CUSTO_TOTAL) FROM PROCESSO_PRODUCAO PP where PP.COD_PRODUTO_ACABADO = A.COD_PRODUTO_ACABADO ),0) AS TOTAL_PROCESSO '
    + 'FROM ESTRUTURA_PRODUTO a  ' +
    'INNER JOIN PRODUTO PA ON PA.COD_PRODUTO = A.COD_PRODUTO_ACABADO ' +
    'INNER JOIN PRODUTO PI ON PI.COD_PRODUTO = A.COD_PRODUTO_INSUMO  ' +
    'WHERE A.COD_PRODUTO_ACABADO = ' + produto + ' ORDER BY ord ';

  // html := '<span style="font-size: 20pt; color: #000000; font-family: courier">teste	teste1</span>';
  dao.Geral1(sql);
  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    mmRelatorio.Append;
    mmRelatorioNIVEL.Value := nivel + 1;
    mmRelatorioCOD_INSUMO.AsString :=
      dao.Q1.FieldByName('COD_PRODUTO_INSUMO').AsString;
    mmRelatorioPRODUTO_ACABADO.AsString :=
      dao.Q1.FieldByName('ACABADO').AsString;
    mmRelatorioPRODUTO_INSUMO.AsString := dao.Q1.FieldByName('INSUMO').AsString;
    mmRelatorioORDEM.AsString := dao.Q1.FieldByName('ORDEM').AsString;
    mmRelatorioQUANTIDADE.AsString := dao.Q1.FieldByName('QUANTIDADE').AsString;
    mmRelatorioCUSTO.Value := dao.Q1.FieldByName('CUSTO_TOTAL').Value;
    mmRelatorioCUSTO_TOTAL.Value := dao.Q1.FieldByName('TOTAL').Value;
    mmRelatorioQUANT_NIVEL.Value :=
      dao.Q1.FieldByName('QTD_NIVEL_ABAIXO').Value;
    mmRelatorioORDEMGERAL.AsFloat := ordem_geral +
      (dao.Q1.FieldByName('ORDEM').AsInteger / Power(100,
      mmRelatorioNIVEL.Value));
    mmRelatorioTOTALPROCESSOS.Value :=
      dao.Q1.FieldByName('TOTAL_PROCESSO').Value;
    mmRelatorioCUSTO_GERAL.Value := dao.Q1.FieldByName('TOTAL_GERAL').Value;
    mmRelatorioUNIDADE.AsString := dao.Q1.FieldByName('UNIDADE').AsString;

    mmRelatorio.Post;
    dao.Q1.Next;
  end;
  mmRelatorio.ReSortOnFields(soAsc, 'ORDEMGERAL');
end;

end.
