unit un_historico_processo_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, sLabel,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sComboEdit, Data.DB, RxMemDS,
  Vcl.Grids, Vcl.DBGrids, acDBGrid, acDBTextFX, RxToolEdit, RxDBCtrl, sCurrEdit,
  sDBCalcEdit, Vcl.Buttons, sBitBtn, sPanel, Vcl.DBCtrls, sDBEdit, sDBMemo,
  frxClass;

type
  Tfrm_historico_processo_pedido = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    PrProcesso_id: TsComboEdit;
    Lbl_produto: TsLabel;
    Panel8: TPanel;
    sPanel1: TsPanel;
    pnProcesso: TPanel;
    Panel6: TPanel;
    BTOK: TsBitBtn;
    gbProcessos: Tdbgrid;
    mmProcessos: TRxMemoryData;
    dsProcessos: TDataSource;
    sLabel8: TsLabel;
    edDesc: TsDBMemo;
    mmProcessosID: TIntegerField;
    mmProcessosDATA: TDateField;
    mmProcessosHORA: TTimeField;
    mmProcessosOBS: TStringField;
    btImprimir: TsBitBtn;
    fR_RELATORIO: TfrxReport;
    mmProcessosNUMDOC: TIntegerField;
    mmProcessosCLIENTE: TStringField;
    mmProcessosVALOR: TCurrencyField;
    procedure PrProcesso_idExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarHistorico(processo: string);
    { Private declarations }
  public
    { Public declarations }
    processo : string;
  end;

var
  frm_historico_processo_pedido: Tfrm_historico_processo_pedido;

implementation

uses Un_dao, un_localizar, unPri, un_etapas_producao, UnFun, un_dm;

{$R *.dfm}

procedure Tfrm_historico_processo_pedido.btImprimirClick(Sender: TObject);
var
  cmd, path, relatorio: string;
  oExportfilter: TfrxCustomExportFilter;
begin

  path := ExtractFilePath(Application.ExeName);

  with dm.q_hist_processo_pedidos do
  begin
    Close;
    ParamByName('cod').value := PrProcesso_id.Text;
    Open;
  end;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\hist_processo_pedidos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;


end;

procedure Tfrm_historico_processo_pedido.CarregarHistorico(processo:string);
begin
  if processo = '' then exit;
  dao.Geral1('SELECT a.ID, a.PROCESSO_ID, a.DATA, a.HORA, a.OBS, v1.NUMDOC, '+
             'v1.COD_CLIENTE||''-''||cl.NOM_CLIENTE as cliente, v1.TOT_LIQUIDO '+
             'FROM HIST_PROCESSO_PEDIDO a '+
             'inner join PROCESSO_PEDIDO pp on pp.ID  = a.PROCESSO_ID '+
             'inner join VENDAS1 v1 on v1.PROCESSO_ID = a.PROCESSO_ID '+
             'inner join cliente cl on cl.COD_CLIENTE = v1.COD_CLIENTE '+
             'where a.PROCESSO_ID = '+processo+' and v1.COD_FOP <> 32 '+
             'order by v1.numdoc, a.ID desc ');

  dao.Q1.First;

  mmProcessos.close;
  mmProcessos.EmptyTable;
  mmProcessos.Open;
  while not dao.Q1.eof do
  begin
    mmProcessos.Append;
    mmProcessosID.AsString      := dao.Q1.FieldByName('ID').AsString;
    mmProcessosDATA.AsDateTime  := dao.Q1.FieldByName('DATA').AsDateTime;
    mmProcessosHORA.Value       := dao.Q1.FieldByName('HORA').Value;
    mmProcessosOBS.AsString     := dao.Q1.FieldByName('OBS').AsString;
    mmProcessosNUMDOC.AsString  := dao.Q1.FieldByName('NUMDOC').AsString;
    mmProcessosCLIENTE.AsString := dao.Q1.FieldByName('CLIENTE').AsString;
    mmProcessosVALOR.AsString   := dao.Q1.FieldByName('TOT_LIQUIDO').Value;
    mmProcessos.Post;
    dao.Q1.Next;
  end;
  mmProcessos.First;
end;

procedure Tfrm_historico_processo_pedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
  if Key = #13 then
  begin

    if ((ActiveControl.Name = 'PrProcessos') or (ActiveControl.Name = 'edDesc')) then
      exit;

    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);

  end;
end;

procedure Tfrm_historico_processo_pedido.FormShow(Sender: TObject);
begin
  if processo <> '' then
  begin
    PrProcesso_id.Text := processo;
    CarregarHistorico(processo);
  end;
end;

procedure Tfrm_historico_processo_pedido.fR_RELATORIOGetValue(
  const VarName: string; var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'processo' then
    Value := PrProcesso_id.Text;

end;

procedure Tfrm_historico_processo_pedido.PrProcesso_idExit(Sender: TObject);
begin
  CarregarHistorico(PrProcesso_id.Text);
end;



end.
