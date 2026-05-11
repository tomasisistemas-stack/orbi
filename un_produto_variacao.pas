unit un_produto_variacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,  DB,
  RxMemDS, VclTee.TeEngine, VclTee.Series, VclTee.TeeProcs, VclTee.Chart, VclTee.DbChart,
  VclTee.TeePrevi, sSpeedButton,
  sPanel, sBitBtn, VclTee.TeeGDIPlus, VCLTee.TeeDBCrossTab;

type
  Tfm_produto_variacao = class(TForm)
    Panel1: tsPanel;
    mmProdutoVariacao: TRxMemoryData;
    dsProdutoVariacao: TDataSource;
    mmProdutoVariacaoPRODUTO: TStringField;
    mmProdutoVariacaoCUSTO: TFloatField;
    mmProdutoVariacaoMES: TStringField;
    mmProdutoVariacaoMES_ANO: TDateTimeField;
    btImprimir: TsSpeedButton;
    BTOK: TsSpeedButton;
    gfProdutos: TChart;
    Series1: TLineSeries;
    DBCrossTabSource1: TDBCrossTabSource;
    procedure FormShow(Sender: TObject);
    procedure BTOKClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    produto: string;
  end;

var
  fm_produto_variacao: Tfm_produto_variacao;

implementation

uses Un_dao;

{$R *.dfm}

procedure Tfm_produto_variacao.FormShow(Sender: TObject);
var
  sql: string;
begin

  sql := ' SELECT cast(a.COD_PRODUTO || ''-'' || P.NOM_PRODUTO as varchar(200)) AS PRODUTO, '+
         '   max(a.cUSTO) AS CUSTO,  '+
         '  lpad(cast(extract(MONTH FROM e.DTA_DOCUMENTO) as VARCHAR(2)), 2, ''0'')|| ''/'' ||cast(extract(YEAR FROM e.DTA_DOCUMENTO) as VARCHAR(4)) AS MES_VENDA, '+
         '  cast(cast(extract(YEAR FROM e.DTA_DOCUMENTO) as VARCHAR(4))|| ''/'' ||lpad(cast(extract(MONTH FROM e.DTA_DOCUMENTO) as VARCHAR(2)), 2, ''0'')|| ''/01'''''' as date)  AS MES_VENDA_INV '+
         ' FROM ENTRADA2 a '+
         ' INNER JOIN PRODUTO P ON (P.COD_PRODUTO = A.COD_PRODUTO) '+
         ' inner join entrada1 e on (e.NR_DOCUMENTO = a.NR_DOCUMENTO and e.COD_FORNECEDOR = a.COD_FORNECEDOR) '+
         ' where a.custo is not null AND '+
         '       E.DTA_DOCUMENTO between CURRENT_DATE - 365 AND CURRENT_DATE and '+
         '       A.COD_PRODUTO = '+ produto +
         ' group by PRODUTO, '+
         ' mes_venda, '+
         ' MES_VENDA_INV '+
         ' ORDER BY MES_VENDA_INV ';

  dao.GERAL1(SQL);
  dao.Q1.first;
  mmProdutoVariacao.Close;
  mmProdutoVariacao.EmptyTable;
  mmProdutoVariacao.Open;

  mmProdutoVariacao.Append;
  mmProdutoVariacaoPRODUTO.Value := dao.Q1.fieldbyname('PRODUTO').Value;
  mmProdutoVariacaoCUSTO.Value := 0;
  mmProdutoVariacaoMES.Value := '';
  mmProdutoVariacaoMES_ANO.Value := dao.Q1.fieldbyname('MES_VENDA_INV').Value - 30;
  mmProdutoVariacao.Post;

  while not dao.Q1.eof do
  begin
    mmProdutoVariacao.Append;
    mmProdutoVariacaoPRODUTO.Value := dao.Q1.fieldbyname('PRODUTO').Value;
    mmProdutoVariacaoCUSTO.Value := dao.Q1.fieldbyname('CUSTO').Value;
    mmProdutoVariacaoMES.Value := dao.Q1.fieldbyname('mes_venda').Value;
    mmProdutoVariacaoMES_ANO.Value := dao.Q1.fieldbyname('MES_VENDA_INV').Value;
    mmProdutoVariacao.Post;
    dao.Q1.next;
  end;
  mmProdutoVariacao.First;
//  gfProdutos.Title.Text.Clear;
//  gfProdutos.Title.Text.Add(mmProdutoVariacaoPRODUTO.AsString);

end;

procedure Tfm_produto_variacao.BTOKClick(Sender: TObject);
begin
  MODALRESULT := MROK;
end;

procedure Tfm_produto_variacao.btImprimirClick(Sender: TObject);
begin
  //ChartPreview(nil,GFPRODUTOS);
end;

end.

