unit un_etiquetas_multiplos_produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBGrids, RxMemDS, RXDBCtrl, DBCtrls,
  Vcl.Grids, Vcl.Mask, RxToolEdit;

type
  Tfr_etiquetas_multiplos_produtos = class(TForm)
    pnTopo: TPanel;
    lbInfo: TLabel;
    pnRodape: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    dsItens: TDataSource;
    mmItens: TRxMemoryData;
    dbItens: TDBGrid;
    mmItensCODIGO: TStringField;
    mmItensPRODUTO: TStringField;
    mmItensQTDE: TIntegerField;
    btnov: TBitBtn;
    btalt: TBitBtn;
    btgra: TBitBtn;
    btcan: TBitBtn;
    btexc: TBitBtn;
    lbProduto: TLabel;
    Mecod_produto: TRxDBComboEdit;
    lbQtd: TLabel;
    Meqtd: TDBEdit;
    lbDescricao: TLabel;
    Menom_produto: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure Mecod_produtoExit(Sender: TObject);
    procedure Mecod_produtoButtonClick(Sender: TObject);
    procedure dbItensEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function BuscaProduto(const ACodigo: string; out ANome, AQtdEmb, AUnidade,
      ACodigoBarra: string; out AMostrarUnidade: Boolean): Boolean;
    function ValidaMecodProduto: Boolean;
    procedure InserirLinha(const ACodigo: string; AQtde: Integer);
    procedure HabilitaBotoesItens(Estado: Integer);
  public
    class procedure Executar(const ACodigoInicial: string;
      AQtdeInicial: Integer);
  end;

var
  fr_etiquetas_multiplos_produtos: Tfr_etiquetas_multiplos_produtos;

implementation

uses
  Un_dao, UnFun, UnPri, un_escolhe_impressora_termica, Un_localizar;

{$R *.dfm}

procedure Tfr_etiquetas_multiplos_produtos.HabilitaBotoesItens(Estado: Integer);
begin
  if Estado = 0 then
  begin
    btnov.Enabled := False;
    btalt.Enabled := False;
    btexc.Enabled := False;
    btgra.Enabled := True;
    btcan.Enabled := True;
    dsItens.AutoEdit := True;

    Mecod_produto.Enabled := True;
    Meqtd.Enabled := True;
    dbItens.ReadOnly := False;
    dbItens.TabStop := True;
    dbItens.Options := dbItens.Options + [dgEditing];
  end
  else
  begin
    btnov.Enabled := True;
    btalt.Enabled := not mmItens.IsEmpty;
    btexc.Enabled := not mmItens.IsEmpty;
    btgra.Enabled := False;
    btcan.Enabled := False;
    dsItens.AutoEdit := False;

    Mecod_produto.Enabled := False;
    Meqtd.Enabled := False;
    dbItens.ReadOnly := True;
    dbItens.TabStop := False;
    dbItens.Options := dbItens.Options - [dgEditing];
  end;
end;

procedure Tfr_etiquetas_multiplos_produtos.FormCreate(Sender: TObject);
begin
  mmItens.Close;
  mmItens.Open;
  mmItens.EmptyTable;
  HabilitaBotoesItens(1);
end;

procedure Tfr_etiquetas_multiplos_produtos.InserirLinha(const ACodigo: string;
  AQtde: Integer);
begin
  if AQtde <= 0 then
    AQtde := 1;

  mmItens.Append;
  mmItensCODIGO.AsString := Trim(ACodigo);
  mmItensPRODUTO.AsString := '';
  mmItensQTDE.AsInteger := AQtde;
  mmItens.Post;
end;

function Tfr_etiquetas_multiplos_produtos.BuscaProduto(const ACodigo: string;
  out ANome, AQtdEmb, AUnidade, ACodigoBarra: string;
  out AMostrarUnidade: Boolean): Boolean;
begin
  Result := False;
  ANome := '';
  AQtdEmb := '';
  AUnidade := '';
  ACodigoBarra := '';
  AMostrarUnidade := True;

  dao.Geral2('SELECT NOM_PRODUTO, QTD_EMBALAGEM, UNIDADE, CODIGO_BARRA, MOSTRAR_EMB_ETIQUETA ' +
    'FROM PRODUTO WHERE COD_PRODUTO = ' + QuotedStr(Trim(ACodigo)));

  if dao.Q2.RecordCount = 0 then
    Exit;

  ANome := dao.Q2.FieldByName('NOM_PRODUTO').AsString;
  AQtdEmb := dao.Q2.FieldByName('QTD_EMBALAGEM').AsString;
  AUnidade := dao.Q2.FieldByName('UNIDADE').AsString;
  ACodigoBarra := dao.Q2.FieldByName('CODIGO_BARRA').AsString;
  AMostrarUnidade := dao.Q2.FieldByName('MOSTRAR_EMB_ETIQUETA').AsString = 'S';

  Result := True;
end;

function Tfr_etiquetas_multiplos_produtos.ValidaMecodProduto: Boolean;
var
  nome, qtdEmb, unidade, codigoBarra: string;
  mostrarUnidade: Boolean;
begin
  Result := False;

  if Trim(mmItensCODIGO.AsString) <> '' then
  begin
    if (not FMFUN.verificaNumerico(mmItensCODIGO.AsString)) and
      (Length(mmItensCODIGO.AsString) > 0) then
    begin
      dao.msg('Dado tem que ser sempre Numerico!');
      Mecod_produto.SetFocus;
      Exit;
    end;

    if not BuscaProduto(mmItensCODIGO.AsString, nome, qtdEmb, unidade, codigoBarra,
      mostrarUnidade) then
    begin
      dao.msg('Produto nao encontrado!');
      Mecod_produto.SetFocus;
      Exit;
    end;

    mmItensPRODUTO.AsString := nome;

    if mmItensQTDE.AsInteger <= 0 then
      mmItensQTDE.AsInteger := 1;
  end
  else
  begin
    dao.msg('O Campo Produto deve ser Preenchido!');
    Mecod_produto.SetFocus;
    Exit;
  end;

  Result := True;
end;

procedure Tfr_etiquetas_multiplos_produtos.Mecod_produtoExit(Sender: TObject);
begin
  if ActiveControl <> nil then
  begin
    if (ActiveControl.Name = 'btgra') or (ActiveControl.Name = 'btcan') then
      Exit;
  end;

  if not (mmItens.State in dsEditModes) then
    Exit;

  ValidaMecodProduto;
end;

procedure Tfr_etiquetas_multiplos_produtos.Mecod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
  codigoSelecionado, nomeSelecionado: string;
begin
  codigoSelecionado := '';
  nomeSelecionado := '';

  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_etiquetas_multiplos_produtos';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := True;

  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;

    if not Fr_localizar.Qu_localizar.IsEmpty then
    begin
      if Fr_localizar.Qu_localizar.FindField('cod_produto') <> nil then
        codigoSelecionado := Fr_localizar.Qu_localizar.FieldByName('cod_produto').AsString;
      if Fr_localizar.Qu_localizar.FindField('nom_produto') <> nil then
        nomeSelecionado := Fr_localizar.Qu_localizar.FieldByName('nom_produto').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  end;

  if Trim(codigoSelecionado) <> '' then
  begin
    if not (mmItens.State in dsEditModes) then
      mmItens.Edit;

    mmItensCODIGO.AsString := Trim(codigoSelecionado);
    if Trim(nomeSelecionado) <> '' then
      mmItensPRODUTO.AsString := Trim(nomeSelecionado);

    Mecod_produtoExit(Self);
  end;
end;

procedure Tfr_etiquetas_multiplos_produtos.dbItensEnter(Sender: TObject);
begin
  if mmItens.State = dsBrowse then
    btnov.SetFocus;
end;

procedure Tfr_etiquetas_multiplos_produtos.btnovClick(Sender: TObject);
begin
  if mmItens.State in dsEditModes then
    mmItens.Post;

  mmItens.Append;
  mmItensQTDE.AsInteger := 1;
  HabilitaBotoesItens(0);
  Mecod_produto.SetFocus;
end;

procedure Tfr_etiquetas_multiplos_produtos.btaltClick(Sender: TObject);
begin
  if mmItens.IsEmpty then
    Exit;

  if not (mmItens.State in dsEditModes) then
    mmItens.Edit;

  HabilitaBotoesItens(0);
  Mecod_produto.SetFocus;
end;

procedure Tfr_etiquetas_multiplos_produtos.btgraClick(Sender: TObject);
begin
  if not (mmItens.State in dsEditModes) then
    Exit;

  if not ValidaMecodProduto then
    Exit;

  if mmItensQTDE.AsInteger <= 0 then
  begin
    dao.msg('O Campo Qtd deve ser Preenchido!');
    Meqtd.SetFocus;
    Exit;
  end;

  mmItens.Post;
  HabilitaBotoesItens(1);
end;

procedure Tfr_etiquetas_multiplos_produtos.btcanClick(Sender: TObject);
begin
  if MessageDlg('Deseja Cancelar esta Operacao?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if mmItens.State in dsEditModes then
    mmItens.Cancel;

  if mmItens.RecordCount = 0 then
    InserirLinha('', 1);

  HabilitaBotoesItens(1);
end;

procedure Tfr_etiquetas_multiplos_produtos.btexcClick(Sender: TObject);
begin
  if mmItens.IsEmpty then
    Exit;

  if MessageDlg('Tem Certeza que Deseja Excluir este Produto?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  mmItens.Delete;

  if mmItens.RecordCount = 0 then
    InserirLinha('', 1);

  dao.msg('Produto excluido com sucesso!');
  HabilitaBotoesItens(1);
end;

procedure Tfr_etiquetas_multiplos_produtos.btImprimirClick(Sender: TObject);
var
  x, qtd, totalEtiquetas, totalItens, nrLinha: Integer;
  codigo, nome, qtdEmb, unidade, codigoBarra: string;
  mostrarUnidade: Boolean;
  erros: string;
begin
  if mmItens.State in dsEditModes then
    mmItens.Post;

  Application.CreateForm(Tfr_escolhe_impressora_termica, fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.ModalResult = mrOk then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    Exit;

  totalEtiquetas := 0;
  totalItens := 0;
  erros := '';
  nrLinha := 1;
  mostrarUnidade := True;
  mmItens.DisableControls;
  try
    mmItens.First;
    while not mmItens.Eof do
    begin
      codigo := Trim(mmItensCODIGO.AsString);
      if codigo <> '' then
      begin
        qtd := mmItensQTDE.AsInteger;

        if qtd <= 0 then
          erros := erros + 'Linha ' + IntToStr(nrLinha) + ': quantidade invalida.' + sLineBreak
        else if not BuscaProduto(codigo, nome, qtdEmb, unidade, codigoBarra, mostrarUnidade) then
          erros := erros + 'Linha ' + IntToStr(nrLinha) + ': produto ' + codigo + ' nao encontrado.' + sLineBreak
        else
        begin
          if mmItensPRODUTO.AsString <> nome then
          begin
            mmItens.Edit;
            mmItensPRODUTO.AsString := nome;
            mmItens.Post;
          end;

          for x := 1 to qtd do
          begin
            Fmfun.ImprimeEtiqueta(codigo, nome, qtdEmb, unidade, codigoBarra,
              FRPRI.Tipo_Etiqueta, True, True);
            Inc(totalEtiquetas);
          end;

          Inc(totalItens);
        end;
      end;

      Inc(nrLinha);
      mmItens.Next;
    end;
  finally
    mmItens.EnableControls;
    if not mmItens.IsEmpty then
      mmItens.First;
  end;

  if totalEtiquetas = 0 then
  begin
    if erros <> '' then
      ShowMessage('Nenhuma etiqueta foi impressa.' + sLineBreak + sLineBreak + erros)
    else
      ShowMessage('Nenhum item valido para imprimir.');
    Exit;
  end;

  if erros <> '' then
    ShowMessage('Impressao concluida para ' + IntToStr(totalItens) + ' item(ns) e ' +
      IntToStr(totalEtiquetas) + ' etiqueta(s).' + sLineBreak + sLineBreak + erros)
  else
    ShowMessage('Impressao concluida para ' + IntToStr(totalItens) + ' item(ns) e ' +
      IntToStr(totalEtiquetas) + ' etiqueta(s).');
end;

class procedure Tfr_etiquetas_multiplos_produtos.Executar(
  const ACodigoInicial: string; AQtdeInicial: Integer);
var
  Frm: Tfr_etiquetas_multiplos_produtos;
begin
  Frm := Tfr_etiquetas_multiplos_produtos.Create(nil);
  fr_etiquetas_multiplos_produtos := Frm;
  try
    if Trim(ACodigoInicial) <> '' then
    begin
      Frm.mmItens.First;
      Frm.mmItens.Edit;
      Frm.mmItensCODIGO.AsString := Trim(ACodigoInicial);
      if AQtdeInicial <= 0 then
        AQtdeInicial := 1;
      Frm.mmItensQTDE.AsInteger := AQtdeInicial;
      Frm.mmItens.Post;
    end;

    Frm.ShowModal;
  finally
    fr_etiquetas_multiplos_produtos := nil;
    Frm.Free;
  end;
end;

procedure Tfr_etiquetas_multiplos_produtos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
