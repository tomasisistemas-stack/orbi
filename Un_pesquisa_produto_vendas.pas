unit Un_pesquisa_produto_vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask,  Buttons,
  Grids,  sPanel, sBitBtn, sLabel, sCheckBox, sMaskEdit,
  sCustomComboEdit, sComboEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids;

type
  TFr_pesquisa_produto_venda = class(TForm)
    Panel1: tsPanel;
    Emcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    Label15: tsLabel;
    Q_produto: TFDQuery;
    BitBtn1: TsBitBtn;
    q_resultado: TFDQuery;
    IB_Grid1: TDBGrid;
    IB_DataSource1: TDataSource;
    procedure Emcod_produtoButtonClick(Sender: TObject);
    procedure Emcod_produtoExit(Sender: TObject);
    procedure Emcod_produtoKeyPress(Sender: TObject;
      var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function dados_produto(cod_produto: string): boolean;
    function busca_produto_unitario(leitor: boolean;
      cod_barras: string): boolean;
    { Private declarations }
  public



  end;

var
  Fr_pesquisa_produto_venda: TFr_pesquisa_produto_venda;

implementation

uses Un_localizar, Un_dao, UnPri;

{$R *.dfm}

procedure TFr_pesquisa_produto_venda.Emcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_pesquisa_produto_venda';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';
  
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

procedure TFr_pesquisa_produto_venda.Emcod_produtoExit(Sender: TObject);
begin
  if Emcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' + QuotedStr(Emcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Emcod_produto.Text := '';
      Emcod_produto.SetFocus;
      Exit;
    end;

  end;



end;


procedure TFr_pesquisa_produto_venda.Emcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  usa_leitor: Boolean;
begin

// If not( key in['0'..'9',#8] ) and (key <> #13) then
//  begin
//    beep;{somente delphi 2.0 ou >}
//    key:=#0;
//  end;


  if key = #13 then
  begin
    if (Length(Emcod_produto.Text) < 12) and (Emcod_produto.Text <> '') then
    begin
      if not (busca_produto_unitario(False, Emcod_produto.Text)) then
        exit
    end
    else
      if (Emcod_produto.Text <> '') then
      begin
        if not (busca_produto_unitario(true, Emcod_produto.Text)) then exit;
        usa_leitor := true;
      end;
    if (Emcod_produto.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_pesquisa_produto_venda';
      chamou_cadastro := 'Fr_produto';
      revenda := 'S';

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
    SelectNext(sender as TWinControl, True, true);
    key := #0;
  end;
end;

function TFr_pesquisa_produto_venda.dados_produto(cod_produto: string): boolean;
begin
  with Q_produto do
  begin
    close;
    sql.clear;
    sql.add('select nom_produto, unidade, qtd_embalagem, custo, qtd_estoque, cod_colecao, c.descricao, grade, preco_venda from produto p ' +
      'left join colecao c on c.id= p.cod_colecao ' +
      'where p.cod_produto = ' + QuotedStr(cod_produto));
    open;
  end;
  if Q_produto.RecordCount > 0 then
    Result := true
  else
    Result := false;

end;

function TFr_pesquisa_produto_venda.busca_produto_unitario(leitor: boolean; cod_barras: string): boolean;
var
  cmd: string;
  id_produto, idcor, idtamanho: string;
begin
  if leitor then
  begin
    if length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade, cod_colecao from produto p ' +
        'left join cod_barras cb on cb.cod_produto=p.cod_produto ' +
        'where cb.cod_barras=' + QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        Result := false;
        dao.msg('Produto não encontrado!');
        Emcod_produto.Text := '';
        Emcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Emcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
//        Emcod_colecao.Text:= dao.Q1.fieldbyname('cod_colecao').AsString;
        Result := true;
      end;
    end

    else
    begin
      if length(trim(cod_barras)) = 22 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 4)));

        if dao.Q2.FieldByName('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) + ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 3)));
        end
        else
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
        end;
      end
      else
        if length(trim(cod_barras)) = 14 then
        begin
          if copy(cod_barras, 1, 8) <> '' then
            dao.Geral2('select grade from produto where cod_pro2= ' + QuotedStr(copy(cod_barras, 1, 8)));

          if dao.Q2.FieldByName('grade').AsString = '0' then
          begin
            dao.Geral3('select cod_produto, cod_pro2, cod_colecao from produto where cod_pro2=' + QuotedStr(copy(cod_barras, 1, 8)));
            id_produto := dao.Q3.fieldbyname('cod_produto').AsString;

            dao.Geral1('select p.cod_produto, p.cod_pro2 , p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, c.id_cor2, t.tamanho, t.id_tam2, cod_colecao from produto p ' +
              'left join grade gd on gd.cod_produto=p.cod_produto ' +
              'left join cores c on c.id=gd.id_cor ' +
              'left join tamanho t on t.id=gd.id_tamanho ' +
              'where p.cod_produto=' + QuotedStr(id_produto));

          end;
        end
        else
          if length(trim(cod_barras)) = 21 then
          begin
            if copy(cod_barras, 1, 4) <> '' then
              dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 4)));

            if dao.Q2.FieldByName('grade').AsString = '0' then
            begin
              dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
                'left join grade gd on gd.cod_produto=p.cod_produto ' +
                'left join cores c on c.id=gd.id_cor ' +
                'left join tamanho t on t.id=gd.id_tamanho ' +
                'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
            end
            else
            begin
              dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
                'left join grade gd on gd.cod_produto=p.cod_produto ' +
                'left join cores c on c.id=gd.id_cor ' +
                'left join tamanho t on t.id=gd.id_tamanho ' +
                'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
            end;


          end
          else
            if length(trim(cod_barras)) >= 23 then
            begin
              if copy(cod_barras, 1, 5) <> '' then
                dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 5)));

              if dao.Q2.FieldByName('grade').AsString = '0' then
              begin
                dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
                  'left join grade gd on gd.cod_produto=p.cod_produto ' +
                  'left join cores c on c.id=gd.id_cor ' +
                  'left join tamanho t on t.id=gd.id_tamanho ' +
                  'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 5)));
              end;

              if dao.Q2.FieldByName('grade').AsString = '1' then
              begin
                dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p ' +
                  'left join grade gd on gd.cod_produto=p.cod_produto ' +
                  'left join cores c on c.id=gd.id_cor ' +
                  'left join tamanho t on t.id=gd.id_tamanho ' +
                  'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 5)));
              end;
            end;


      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        result := false;
        dao.msg('Produto não encontrado!');
        Emcod_produto.Text := '';
        Emcod_produto.SetFocus;
        exit;
      end
      else
      begin
        result := true;
        Emcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
        if dao.Q1.FieldByName('grade').AsString = '0' then
        begin
        end;
      end;
    end;
  end;

  if not (leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade, cod_colecao from produto p ' +
      'where p.cod_produto = ' + QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      Result := false;
      dao.msg('Produto não encontrado!');
      Emcod_produto.Text := '';
      Emcod_produto.SetFocus;
      exit;
    end
    else
    begin
      result := true;
    end;
  end;

end;



procedure TFr_pesquisa_produto_venda.BitBtn1Click(Sender: TObject);
var
  cmd: string;
begin
  if Emcod_produto.Text = '' then
  begin
    dao.msg('Selecione um Produto para pesquisar');
    exit;
  end;

  cmd := 'select v1.numdoc,  v1.dtadoc, c.nom_cliente, cr.cor, tm.tamanho,v2.qtd, v2.preco from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc=v2.numdoc ' +
    'left join produto p on p.cod_produto=v2.cod_produto ' +
    'left join cores cr on cr.id=v2.id_cor ' +
    'left join tamanho tm on tm.id=v2.id_tamanho ' +
    'left join cliente c on c.cod_cliente = v1.cod_cliente ' +
    'where v2.cod_produto=' + QuotedStr(Emcod_produto.Text);

  with Q_produto do
  begin
    Close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;



end;

procedure TFr_pesquisa_produto_venda.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
