unit un_produto_detalhes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sDBText, sLabel, sGroupBox,
  DB, DBCtrls, ExtCtrls, sSpeedButton, sPanel, acDBTextFX,
  Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sComboEdit,
  frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_produtos_detalhes = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    ds_produto: TDataSource;
    Panel4: TsPanel;
    Shape1: TShape;
    imgProduto: TImage;
    sLabel3: TsLabel;
    sDBTextFX1: TsDBTextFX;
    sLabel2: TsLabel;
    sDBTextFX2: TsDBTextFX;
    lbPromocao: TsLabel;
    sDBTextFX3: TsDBTextFX;
    sPanel1: TsPanel;
    sLabel5: TsLabel;
    Prcod_produto: TsComboEdit;
    Panel1: TsPanel;
    sBitBtn1: TsBitBtn;
    sGroupBox2: TsGroupBox;
    btEtiquetas: TsSpeedButton;
    edQtde: TsCurrencyEdit;
    sDBTextFX4: TsDBTextFX;
    sLabel4: TsLabel;
    sDBTextFX5: TsDBTextFX;
    btMovimento: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    q_produto: TFDQuery;
    q_produtocod_produto: TIntegerField;
    q_produtopromocao: TStringField;
    q_produtonom_produto: TStringField;
    q_produtoqtd_embalagem: TBCDField;
    q_produtoproduto: TMemoField;
    q_produtoimagem_bd: TBlobField;
    q_produtoqtd_estoque: TBCDField;
    q_produtopreco_venda: TBCDField;
    q_produtounidade: TStringField;
    q_produtocodigo_barra: TStringField;
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure q_produtoAfterOpen(DataSet: TDataSet);
    procedure sbLimparClick(Sender: TObject);
    procedure btEtiquetasClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btMovimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_produtos_detalhes: Tfr_produtos_detalhes;

implementation

uses UnFun, UnPri, Un_localizar, un_escolhe_impressora_termica, Un_dao, Un_dm;

{$R *.dfm}

procedure Tfr_produtos_detalhes.sBitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfr_produtos_detalhes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fr_produtos_detalhes := nil;
end;

procedure Tfr_produtos_detalhes.q_produtoAfterOpen(DataSet: TDataSet);
begin
  if q_produtoIMAGEM_BD.IsNull then
  begin
    imgProduto.Picture := nil;
    exit;
  end;

  //lbStatusPromocao.visible := q_produtoPROMOCAO.AsString = 'S';

{  if q_produtoPROMOCAO.AsString = 'S' then
    lbPromocao.Caption := 'Preço Promocional:'
  else}
    lbPromocao.Caption := 'Preço:';

  try
    q_produtoIMAGEM_BD.SaveToFile('foto.jpg');
    imgProduto.Picture.LoadFromFile('foto.jpg');
    DeleteFile('foto.jpg');
  except
    q_produtoIMAGEM_BD.SaveToFile('foto.bmp');
    imgProduto.Picture.LoadFromFile('foto.bmp');
    DeleteFile('foto.bmp');
  end;
end;

procedure Tfr_produtos_detalhes.sbLimparClick(Sender: TObject);
begin
  q_produto.Close;
  imgProduto.Picture := nil;
end;

procedure Tfr_produtos_detalhes.btEtiquetasClick(Sender: TObject);
var
  X: Integer;
begin
  Application.CreateForm(Tfr_escolhe_impressora_termica,
    fr_escolhe_impressora_termica);
  try
    if fr_escolhe_impressora_termica.ShowModal <> mrOk then
      Exit;
    caminho_imp_cod_barras :=
      Trim(fr_escolhe_impressora_termica.impressora_termica);
  finally
    FreeAndNil(fr_escolhe_impressora_termica);
  end;

  if caminho_imp_cod_barras = '' then
  begin
    ShowMessage('Selecione uma impressora de etiquetas válida.');
    Exit;
  end;

  try
    for X := 1 to edQtde.AsInteger do
      FMFUN.ImprimeEtiqueta(q_produtoCOD_PRODUTO.AsString,
        q_produtoNOM_PRODUTO.AsString, q_produtoQTD_EMBALAGEM.AsString,
        q_produtoUNIDADE.AsString, q_produtoCODIGO_BARRA.AsString,
        FRPRI.Tipo_Etiqueta, True, True);
  except
    on E: Exception do
      dao.msg('Houve um erro ao imprimir a etiqueta!' + #13 + E.Message);
  end;
end;
procedure Tfr_produtos_detalhes.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.text) <> '' then
  begin
    if not FMFUN.verificaNumerico(Trim(Prcod_produto.Text)) then
    begin
      dao.msg('Informe somente um codigo numerico de produto.');
      Prcod_produto.SetFocus;
      Exit;
    end;
    q_produto.Close;
    q_produto.sql.Text := 'SELECT a.cod_produto, a.promocao, a.nom_produto, a.qtd_embalagem, a.COD_PRODUTO||''-''||a.NOM_PRODUTO as produto, s.IMAGEM_BD, a.qtd_estoque, a.preco_venda, a.unidade, a.codigo_barra ' +
      'FROM PRODUTO a left outer join SUBCATEGORIA s on s.ID = a.SUBCATEGORIA where a.cod_produto  = ' + quotedstr(trim(Prcod_produto.text));
    q_produto.open;

    if q_produto.RecordCount = 0 then
    begin
      showmessage('Código de Produto inexistente.');
      prcod_produto.setfocus;
      q_produto.close;
    end;
  end;
end;

procedure Tfr_produtos_detalhes.Prcod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
  FrLocalizarAnterior: TFr_localizar;
begin
  { A entrada pode manter outro Fr_localizar modal aberto. }
  FrLocalizarAnterior := Fr_localizar;
  Fr_localizar := nil;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_produto_detalhes';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := False;

  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to High(Campos_combo) do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    Fr_localizar := FrLocalizarAnterior;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure Tfr_produtos_detalhes.btMovimentoClick(Sender: TObject);
var
  cmd, path: string;
begin
  if trim(prcod_produto.text) = '' then exit;


  path := ExtractFilePath(Application.ExeName);

  if not(fR_RELATORIO.LoadFromFile(path +
    'Relatorios\posicao_estoque_detalhado2.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  cmd := 'SELECT a.COD_PRODUTO, a.NOM_PRODUTO, a.CONT_ESTOQUE_AGO_2010, a.QTD_ESTOQUE, a.qtd_reservado, a.CODIGO_CLIENTE_FORNECEDOR, a.NOME_CLIENTE_FORNECEDOR, a.NUMDOC, a.DATA, a.NOTA_FISCAL, a.QTD, a.CONT, a.TIPO '
    + 'FROM V_CHECAGEM_ESTOQUE a inner join produto p on p.cod_produto = a.cod_produto WHERE 1 = 1 ';

  cmd := cmd + fmfun.cmdAux('A.cod_produto', prcod_produto.text);


  cmd := cmd + ' order by A.COD_PRODUTO, a.data, a.tipo, a.numdoc';

  with dm.q_entrada_saidas_produtos do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;



end;

procedure Tfr_produtos_detalhes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
