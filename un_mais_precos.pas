unit un_mais_precos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,  DB,
  RxMemDS, sPanel, sBitBtn, acDBGrid;

type
  Tfm_mais_precos = class(TForm)
    Panel1: tsPanel;
    dgGradeComissoes: Tdbgrid;
    BtnOk: TsBitBtn;
    mmGradeComissao: TRxMemoryData;
    mmGradeComissaoInicio: TFloatField;
    mmGradeComissaoFim: TFloatField;
    mmGradeComissaoComissaoInterno: TFloatField;
    mmGradeComissaoComissaoOutros: TFloatField;
    dsGradeComissao: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    representante, tipo_representante, produto: string;
    preco_selecionado: double;
  end;

var
  fm_mais_precos: Tfm_mais_precos;

implementation

uses Un_dao;

{$R *.dfm}

procedure Tfm_mais_precos.FormShow(Sender: TObject);
var
  sql: string;
begin

  sql := 'SELECT a.CODREP, a.COD_PRODUTO, a.NOM_PRODUTO, a.PRECO_VENDA, a.DESCONTO_MAXIMO, a.INDICE_LIMITE, a.PRECO_INI, a.PRECO_FIM, a.SEQUENCIAL, a.INTERNO, a.OUTROS ' +
    'FROM V_GRADE_COMISSAO a WHERE A.COD_PRODUTO =  ' + produto + '  AND A.CODREP = ' + representante;
  dao.Geral1(sql + ' order by A.SEQUENCIAL ');

  dao.Q1.first;
  mmGradeComissao.Close;
  mmGradeComissao.EmptyTable;
  mmGradeComissao.Open;
  while not dao.Q1.eof do
  begin
    mmGradeComissao.Append;
    mmGradeComissaoInicio.Value := dao.Q1.fieldbyname('PRECO_INI').Value;
    mmGradeComissaoFim.Value := dao.Q1.fieldbyname('PRECO_FIM').Value;
    mmGradeComissaoComissaoInterno.Value := dao.Q1.fieldbyname('INTERNO').Value;
    mmGradeComissaoComissaoOutros.Value := dao.Q1.fieldbyname('OUTROS').Value;
    mmGradeComissao.Post;
    dao.Q1.next;
  end;
  mmGradeComissao.First;

  if tipo_representante = '1' then
    dgGradeComissoes.columns[2].FieldName := 'ComissaoInterno'
  else
    dgGradeComissoes.columns[2].FieldName := 'ComissaoOutros';
  dgGradeComissoes.setfocus;
end;

procedure Tfm_mais_precos.BtnOkClick(Sender: TObject);
begin
  preco_selecionado := mmGradeComissaoInicio.Value;
end;

end.

