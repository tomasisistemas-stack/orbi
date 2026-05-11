unit un_ultimas_vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sDBText, sLabel, sGroupBox,
  DB, DBCtrls, ExtCtrls, sSpeedButton, sPanel, acDBTextFX,
  Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sComboEdit,
  Grids, DBGrids, acDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfr_ultimas_vendas = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    q_produto: TFDQuery;
    ds_produto: TDataSource;
    sLabel3: TsLabel;
    sDBTextFX1: TsDBTextFX;
    sLabel2: TsLabel;
    sDBTextFX2: TsDBTextFX;
    sLabel4: TsLabel;
    sDBTextFX3: TsDBTextFX;
    pnrodape: TsPanel;
    sBitBtn1: TsBitBtn;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sDBGrid1: Tdbgrid;
    Prcod_produto: TsComboEdit;
    sLabel5: TsLabel;
    lbNomeProduto: TsLabel;
    sLabel6: TsLabel;
    PrCod_Cliente: TsComboEdit;
    lbNome_Cliente: TsLabel;
    btok: TsBitBtn;
    sDBTextFX4: TsDBTextFX;
    sLabel7: TsLabel;
    sDBTextFX5: TsDBTextFX;
    sLabel8: TsLabel;
    sDBTextFX6: TsDBTextFX;
    sDBTextFX7: TsDBTextFX;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sDBTextFX8: TsDBTextFX;
    sLabel11: TsLabel;
    sDBTextFX9: TsDBTextFX;
    sLabel12: TsLabel;
    sDBTextFX10: TsDBTextFX;
    dsnone: TDataSource;
    q_produtocod_cliente: TIntegerField;
    q_produtonom_cliente: TStringField;
    q_produtocnpj: TStringField;
    q_produtocidade: TStringField;
    q_produtonumdoc: TIntegerField;
    q_produtodtadoc: TDateField;
    q_produtotot_liquido: TBCDField;
    q_produtoforma: TStringField;
    q_produtocod_produto: TIntegerField;
    q_produtonom_produto: TStringField;
    q_produtoqtd: TBCDField;
    q_produtodesconto: TBCDField;
    q_produtopreco: TBCDField;
    q_produtosub_total: TBCDField;
    q_produtonfe_dev: TIntegerField;
    q_produtofaturado: TIntegerField;
    q_produtorepresentante_venda: TStringField;
    q_produtorepresentante_cliente: TStringField;
    q_produtotelemarketing: TStringField;
    q_produtoorcamento: TIntegerField;
    Shape1: TShape;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    Shape2: TShape;
    q_produtowhastapp: TStringField;
    sLabel15: TsLabel;
    sDBTextFX11: TsDBTextFX;
    sLabel16: TsLabel;
    Prcod_grupo: TsComboEdit;
    LbNom_Grupo: TsLabel;
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure PrCod_ClienteExit(Sender: TObject);
    procedure PrCod_ClienteButtonClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure q_produtoAfterOpen(DataSet: TDataSet);
    procedure sDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_ultimas_vendas: Tfr_ultimas_vendas;

implementation

uses UnFun, Un_localizar, Un_dao, UnPri;

{$R *.dfm}


procedure Tfr_ultimas_vendas.Prcod_grupoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'fr_ultimas_vendas_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

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

procedure Tfr_ultimas_vendas.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if trim(Prcod_grupo.Text) <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' +
      QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
      LbNom_Grupo.Caption := dao.Q2.fieldbyname('nom_grupo').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_ultimas_vendas.Prcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_ultimas_vendas_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
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

procedure Tfr_ultimas_vendas.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    lbNomeProduto.Caption := '...';

  if trim(Prcod_produto.Text) <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' +
      QuotedStr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
      lbNomeProduto.Caption := dao.Q2.fieldbyname('nom_produto').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_ultimas_vendas.q_produtoAfterOpen(DataSet: TDataSet);
begin
  if q_produto.IsEmpty then
    ds_produto.DataSet := dsnone.DataSet
  else
    ds_produto.DataSet := q_produto;
end;

procedure Tfr_ultimas_vendas.sDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if q_produtoorcamento.Value = 0 then
  begin
    sDBGrid1.Canvas.Font.Color := clGreen;
    if gdSelected in State then
    begin
      sDBGrid1.Canvas.Brush.Color := clGreen;
      sDBGrid1.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    sDBGrid1.Canvas.Font.Color := $000000CE;
    if gdSelected in State then
    begin
      sDBGrid1.Canvas.Brush.Color := $000000CE;
      sDBGrid1.Canvas.Font.Color := clWhite;
    end;
  end;

  sDBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure Tfr_ultimas_vendas.PrCod_ClienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    lbNome_Cliente.Caption := '...';

  if trim(Prcod_cliente.Text) <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente=' +
      QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
      lbNome_Cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text := '';
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_ultimas_vendas.PrCod_ClienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_ultimas_vendas_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
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

procedure Tfr_ultimas_vendas.btokClick(Sender: TObject);
var cmd_produto, cmd_grupo : string;
begin
  cmd_produto := '';
  cmd_grupo := '';

  if trim(PrCod_Cliente.Text) = '' then
  begin
    showmessage('É necessario informar o Cliente!');
    PrCod_Cliente.SetFocus;
  end;

  if trim(Prcod_produto.Text) <> '' then
    cmd_produto := ' and ped2.cod_produto = '+Prcod_produto.Text;

  if trim(Prcod_grupo.Text) <> '' then
    cmd_grupo := ' and p.cod_grupo = '+Prcod_grupo.Text;

  q_produto.Close;
  q_produto.sql.text :=
  ' SELECT '+
  '   c.COD_CLIENTE, '+
  '   cast(c.NOM_CLIENTE||'' / ''||trim(c.cnpj)||'' / ''||c.telefone||'' / ''||cd.NOM_CIDADE||''-''||cd.UF as varchar(200)) as nom_cliente, '+
  '   c.CNPJ, '+
  '   cast(cd.NOM_CIDADE||''-''||cd.UF as varchar(200)) as cidade, '+
  '   ped1.NUMDOC, '+
  '   ped1.DTADOC, '+
  '   ped1.TOT_LIQUIDO, '+
  '   cast(f.NOM_FOP||'' ''||pz.prazo as varchar(200)) as forma, '+
  '   p.COD_PRODUTO, '+
  '   p.NOM_PRODUTO, '+
  '   ped2.QTD, '+
  '   ped2.DESCONTO, '+
  '   ped2.PRECO, '+
  '   ped2.SUB_TOTAL, '+
  '   ped1.nfe_dev, '+
  '   ped1.faturado, '+
  '   cast(vd.id||''-''||vd.nom_representante as varchar(200)) as representante_venda, '+
  '   cast(r.id||''-''||r.nom_representante as varchar(200)) as representante_cliente, '+
  '   t.nom_representante as telemarketing, '+
  '   ped1.orcamento, '+
  '   c.WHASTAPP '+
  ' FROM '+
  '   VENDAS2 ped2 '+
  ' inner join VENDAS1 ped1 on ped1.NUMDOC = ped2.NUMDOC '+
  ' inner join CLIENTE c on c.COD_CLIENTE  = ped1.COD_CLIENTE '+
  ' inner join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE '+
  ' inner join produto p on p.COD_PRODUTO  = ped2.COD_PRODUTO '+
  ' inner join REPRESENTANTE vd on vd.id = ped1.cod_representante '+
  ' left outer join representante r on r.id = c.id_representante '+
  ' LEFT OUTER JOIN REPRESENTANTE t on t.id = ped1.cod_supervisor '+
  ' left outer join fop f on f.COD_FOP = ped1.COD_FOP '+
  ' left outer join PRAZO pz on pz.ID = ped1.COD_PRAZO_PGTO '+
  ' where '+
  '   ped1.faturado in (0, 1) and '+
  '   ped1.COD_FISCAL not in (''6152'', ''6409'') and '+
  '   ped1.nfe_dev is null and '+
  '   ped1.cod_cliente = '+PrCod_Cliente.Text+
  cmd_produto + cmd_grupo +
  ' order by ped1.DTADOC desc ';

  q_produto.Open;
  prcod_produto.SetFocus;
end;

procedure Tfr_ultimas_vendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_ultimas_vendas.FormShow(Sender: TObject);
begin
  PrCod_Cliente.SetFocus;
end;

end.

