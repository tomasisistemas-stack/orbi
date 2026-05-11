unit Un_estoque_detalhado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  Mask, ExtCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sComboEdit, AdvObj;

type
  TFr_estoque_detalhado = class(TForm)
    procedure ZZcod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure ZZcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ZZcod_empresaButtonClick(Sender: TObject);
    procedure CbcorKeyPress(Sender: TObject; var Key: Char);
    procedure ZZcod_produtoButtonClick(Sender: TObject);
    procedure ZZcod_produtoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carrega_Combos_atrib;
    procedure busca_produto_unitario(leitor: boolean; cod_barras:String);
    procedure busca_produto(loja, cod_produto, cor, tamanho, numeracao: String);
  end;

var
  Fr_estoque_detalhado: TFr_estoque_detalhado;

implementation

uses Un_dao, UnFun, Un_localizar, UnPri;

{$R *.dfm}

procedure TFr_estoque_detalhado.ZZcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if key=#13 then
  begin
    if (Length(ZZcod_produto.Text) < 12) and (ZZcod_produto.Text <> '') then
        busca_produto_unitario(False, ZZcod_produto.Text)
    else
    if (ZZcod_produto.Text <> '') then
        busca_produto_unitario(true, ZZcod_produto.Text);

    If (ZZcod_produto.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_estdet_produto';
      chamou_cadastro := 'Fr_produto';

      Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Produto';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i:=0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, True, true);
    key:=#0;
  end;
end;

procedure TFr_estoque_detalhado.ZZcod_empresaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if key=#13 then
  begin
    if (ZZcod_empresa.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_estdet_empresa';//Estoque Detalhado
      chamou_cadastro := 'Fr_empresa';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Empresa';
      Fr_localizar.BT_cadastro.Visible := false;

      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i:=0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    Key:=#0;
  end;

end;

procedure TFr_estoque_detalhado.carrega_Combos_atrib;
begin
  //carrega Cor
  dao.Geral1('select * from cores order by cor');
  dao.q1.First;
  Cbcor.AddItem('', Self);
  while not(dao.Q1.eof) do
  begin
    Cbcor.AddItem(dao.Q1.fieldbyname('cor').AsString + ' /' + FMFUN.enchezero(dao.Q1.fieldbyname('id').AsString,3), Self);
    dao.Q1.Next;
  end;

  //carrega tamanho
  dao.Geral1('select * from tamanho order by tamanho');
  dao.q1.First;
  Cbtamanho.AddItem('', Self);
  while not(dao.Q1.eof) do
  begin
    Cbtamanho.AddItem(dao.Q1.fieldbyname('tamanho').AsString + ' /' + FMFUN.enchezero(dao.Q1.fieldbyname('id').AsString,3), Self);
    dao.Q1.Next;
  end;

  //carrega Numeração
  dao.Geral1('select * from numeracao');
  dao.q1.First;
  Cbnumeracao.AddItem('' , Self);
  while not(dao.Q1.eof) do
  begin
    Cbnumeracao.AddItem(dao.Q1.fieldbyname('numero').AsString , Self);
    dao.Q1.Next;
  end;


end;

procedure TFr_estoque_detalhado.FormShow(Sender: TObject);
begin
 // carrega_Combos_atrib;
  sg1.Cells[0,0]:= 'Código';
  sg1.Cells[1,0]:= 'Cor';
  sg1.Cells[2,0]:= 'Tamanho';
  sg1.Cells[3,0]:= 'Qtd. Estoque';
  sg1.Cells[4,0]:= '--------';
  sg1.Cells[5,0]:= 'Qtd. Geral';


end;

procedure TFr_estoque_detalhado.BitBtn3Click(Sender: TObject);
var
 Tabs: TTabSheet;
begin
  TabS := TTabSheet.Create(Pcestoque);
  TabS.Caption := 'Titulo do TabSheet';
  TabS.PageControl := Pcestoque;
  end;

procedure TFr_estoque_detalhado.ZZcod_empresaButtonClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_estdet_empresa';//Estoque Detalhado
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_estoque_detalhado.CbcorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;







procedure TFr_estoque_detalhado.busca_produto_unitario(leitor: boolean;
  cod_barras: String);
begin
  if leitor then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda from produto p '+
               'left join cod_barras cb on cb.cod_produto=p.cod_produto '+
               'where cb.cod_barras='+QuotedStr(cod_barras));
    dao.Q1.first;
    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      ZZcod_produto.SetFocus;
      exit;
    end
    else
    begin
      ZZcod_produto.Text:= dao.Q1.fieldbyname('cod_produto').AsString;
      Lbnom_produto.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
    end;

  end
  else
  if leitor = false then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda from produto p '+
               'where p.cod_produto = '+QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      ZZcod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_estoque_detalhado.ZZcod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_estdet_produto';
  chamou_cadastro := 'Fr_produto';

  Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_estoque_detalhado.busca_produto(loja, cod_produto, cor,
  tamanho, numeracao: String);
begin

end;

procedure TFr_estoque_detalhado.ZZcod_produtoExit(Sender: TObject);
begin
  if  ZZcod_produto.Text <> '' then
  begin
    dao.Geral2('select cod_produto, nom_produto, preco_venda from produto where cod_produto='+QuotedStr(ZZcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString+ '  -  R$'+FormatFloat('###,##0.00', dao.Q2.fieldbyname('preco_venda').AsFloat);
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      ZZcod_produto.Text:= '';
      ZZcod_produto.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_estoque_detalhado.BitBtn1Click(Sender: TObject);
var
    i:Integer;
begin
  sg1.Clear;
  sg1.RowCount:=2;
  sg1.Cells[0,0]:= 'Código';
  sg1.Cells[1,0]:= 'Cor';
  sg1.Cells[2,0]:= 'Tamanho';
  sg1.Cells[3,0]:= 'Qtd. Estoque';
  sg1.Cells[4,0]:= '--------';
  sg1.Cells[5,0]:= 'Qtd. Geral';

  dao.Geral1('select g.*, c.cor, t.tamanho from grade g '+
             'left join cores c on c.id=g.id_cor '+
             'left join tamanho t on t.id=g.id_tamanho '+
             'where g.cod_produto='+QuotedStr(ZZcod_produto.Text));
  i:= 1;
  if dao.Q1.RecordCount < 0 then
  begin
    dao.msg('Não Foi encontrado Grade para esse Produto');
    Exit;
  end;

  while not(dao.Q1.Eof) do
  begin
    sg1.Cells[0,i]:= dao.Q1.fieldbyname('cod_produto').AsString;
    sg1.Cells[1,i]:= dao.Q1.fieldbyname('cor').AsString;
    sg1.Cells[2,i]:= dao.Q1.fieldbyname('tamanho').AsString;
    sg1.Cells[3,i]:= dao.Q1.fieldbyname('est_individual').AsString;
    dao.Q1.Next;
    sg1.AddRow;
    i:= i+ 1;
  end;
  sg1.Cells[5,1]:= FloatToStr(sg1.ColumnSum(3,1,sg1.RowCount));
end;

end.
