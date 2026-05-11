unit UnSel_Coluna_etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls,
  CheckLst, ComCtrls, sPageControl, sBitBtn, sLabel, sCheckBox;

type
  TFrsel_coluna_Etiqueta = class(TForm)
    zzcoluna1: tsCheckbox;
    zzcoluna2: tsCheckbox;
    Label1: tsLabel;
    Pc_etiqueta: TsPageControl;
    tab_eti_completa: TsTabSheet;
    tab_eti_individual: TsTabSheet;
    Image1: TImage;
    BitBtn1: TsBitBtn;
    Image2: TImage;
    Label2: tsLabel;
    Cl_Produtos: TCheckListBox;
    BitBtn2: TsBitBtn;
    Primprime_um: tsCheckbox;
    Cbetiqueta: TComboBox;
    Label3: tsLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure zzcoluna1Click(Sender: TObject);
    procedure zzcoluna2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Pc_etiquetaChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    letra: integer;
    inicia_cl, coluna_atual: string;
    i: Integer;
    function monta_cod_barras: string;
    procedure imp_etiqueta(cor, tamanho, cod_produto, colecao, descricao, cod_barras, qtd, preco, col_inicia: string);
    procedure monta_itens;
    procedure imprime_etiqueta_avulso;
    procedure imprime_etiqueta_moveis(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string); //imprime etiquetas 5 X 7,5 roupas
    procedure imprime_etiqueta(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string); //imprime etiquetas 5 X 7,5 roupas
    procedure imprime_eti_home(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string); //imprime as etiquetas de 5 x 2,5 de altura cosmeticos
    procedure imprime_avulso_etiqueta; //imprime etiquetas 5 X 7,5 roupas
    procedure imprime_avulso_etiqueta_home; //imprime etiquetas 5 X 7,5 roupas
    {***Authentic***}
    procedure imprime_etiqueta_authentic(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string); //imprime etiquetas 5 X 7,5 roupas
    procedure imprime_etiqueta_authentic_avulso;



    procedure monta_combo_etiquetas;
    { Public declarations }
  end;

var
  Frsel_coluna_Etiqueta: TFrsel_coluna_Etiqueta;

implementation

uses Un_dao, Un_entrada, UnFun, UnPri;

{$R *.dfm}

procedure TFrsel_coluna_Etiqueta.BitBtn1Click(Sender: TObject);
var
  cmd: string;
  cod_barras: string;
  i: integer;
  qtd_etiqueta: string;
begin
  if Cbetiqueta.ItemIndex = 0 then
    imprime_etiqueta('', Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString, Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString)
  else
    if Cbetiqueta.ItemIndex = 1 then
      imprime_eti_home('', Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString, Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString)
    else
      if Cbetiqueta.ItemIndex = 2 then
        imprime_etiqueta_moveis('', Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString, Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString)
      else
        if Cbetiqueta.ItemIndex = 3 then
          imprime_etiqueta_authentic('', Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString, Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString);

end;

function TFrsel_coluna_Etiqueta.monta_cod_barras: string;
var
  barras: string;
begin
  barras := FMFUN.enchezero(dao.Q1.fieldbyname('cod_produto').AsString, 4) + FMFUN.enchezero(dao.Q1.fieldbyname('id_cor').AsString, 3) +
    FMFUN.enchezero(dao.Q1.fieldbyname('id_tamanho').AsString, 3) + FMFUN.enchezero(dao.Q1.fieldbyname('cod_colecao').AsString, 3) +
    FMFUN.enchezero(dao.Q1.fieldbyname('nr_documento').AsString, 6) + FMFUN.enchezero(dao.Q1.fieldbyname('cod_fornecedor').AsString, 3);
  Result := barras;

end;

procedure TFrsel_coluna_Etiqueta.zzcoluna1Click(Sender: TObject);
begin
  zzcoluna2.Checked := false;

end;

procedure TFrsel_coluna_Etiqueta.zzcoluna2Click(Sender: TObject);
begin
  zzcoluna1.Checked := false;
end;

procedure TFrsel_coluna_Etiqueta.imp_etiqueta(cor, tamanho, cod_produto, colecao, descricao, cod_barras, qtd, preco, col_inicia: string);
var
  F: TextFile;
begin
//  if MessageDlg('DESEJA IMPRIMIR A(S) ETIQUETA(S)?',mtConfirmation,[MBYES,MBNO],0)=mryes then
//  begin
  if col_inicia = '1' then
  begin
    coluna_atual := '1';
    AssignFile(F, 'd:\' + IntToStr(letra) + '.txt');
//      AssignFile(F,'\\ir01\zebra');
    Rewrite(F);
    Writeln(F, ' ');
    Writeln(F, 'O');
    Writeln(F, 'N');
    Writeln(F, 'D7');
    Writeln(F, 'S2');
    Writeln(F, 'ZT');
    Writeln(F, 'Q576,24');
    Writeln(F, 'q800');

    writeln(F, 'B750,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
    Writeln(F, 'A750,28,2,3,1,1,N,"' + 'R$: ' + preco + '"'); // etiqueta de cima

    writeln(F, 'B750,220,2,1,2,2,60,N,"' + cod_barras + '"');
    Writeln(F, 'A750,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

    writeln(F, 'B750,365,2,1,2,2,60,N,"' + cod_barras + '"');

    Writeln(F, 'A770,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
    Writeln(F, 'A770,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
    Writeln(F, 'A770,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

 //     Writeln(F,'A750,515,2,1,1,1,N,"Trocas somente no prazo"');
 //     Writeln(F,'A750,500,2,1,1,1,N,"maximo de 30 dias"');
//      Writeln(F,'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');

//      Writeln(F,'A700,560,2,3,1,2,N,"Beach Boutique"');

    Writeln(F, '' + 'P' + qtd + '');
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
  end
  else
    if col_inicia = '2' then
    begin
      coluna_atual := '2';
//      AssignFile(F,'LPT1');
      AssignFile(F, 'd:\' + inttostr(letra) + '.txt');
//      AssignFile(F,'\\ir01\zebra');
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');

      writeln(F, 'B360,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A350,28,2,3,1,1,N,"' + 'R$: ' + preco + '"'); // etiqueta de cima

      writeln(F, 'B360,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A350,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

      writeln(F, 'B365,365,2,1,2,2,60,N,"' + cod_barras + '"');

      writeln(F, 'B365,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A365,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
      Writeln(F, 'A365,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
      Writeln(F, 'A365,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

  //      Writeln(F,'A350,515,2,1,1,1,N,"Trocas somente no prazo"');
 //       Writeln(F,'A350,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');

  //      Writeln(F,'A330,560,2,3,1,2,N,"Beach Boutique"');

      Writeln(F, '' + 'P' + qtd + '');
      Writeln(F, ' ');
      Sleep(1000);
      CloseFile(F);
    end
    else
      if col_inicia = 'C' then
      begin
        coluna_atual := '1';
        AssignFile(F, 'd:\' + IntToStr(letra) + '.txt');
//      AssignFile(F,'\\ir01\zebra');
        Rewrite(F);
        Writeln(F, ' ');
        Writeln(F, 'O');
        Writeln(F, 'N');
        Writeln(F, 'D7');
        Writeln(F, 'S2');
        Writeln(F, 'ZT');
        Writeln(F, 'Q576,24');
        Writeln(F, 'q800');

        writeln(F, 'B750,91,2,1,2,2,60,N,"' + monta_cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A750,28,2,3,1,1,N,"' + 'R$: ' + FormatFloat('###,##0.00', dao.q1.fieldbyname('preco_venda').asFloat) + '"'); // etiqueta de cima

        writeln(F, 'B750,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A750,155,2,3,1,1,N,"' + 'R$: ' + FormatFloat('###,##0.00', dao.q1.fieldbyname('preco_venda').asFloat) + '"');

//      Writeln(F,'A770,280,2,3,1,1,N,"'+'COLECAO: '+ copy(dao.q1.fieldbyname('descricao').asstring,1,15)+'"');
        writeln(F, 'B750,365,2,1,2,2,60,N,"' + cod_barras + '"');

        Writeln(F, 'A770,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
        Writeln(F, 'A770,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
        Writeln(F, 'A770,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

        Writeln(F, 'A750,515,2,1,1,1,N,"Trocas somente no prazo"');
        Writeln(F, 'A750,500,2,1,1,1,N,"maximo de 30 dias"');
        Writeln(F, 'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');

        Writeln(F, 'A700,560,2,3,1,2,N,"Beach Boutique"');

        dao.Q1.Next;
        if not (dao.Q1.Eof) then
          coluna_atual := '2';

        if not (dao.Q1.Eof) then
        begin

          writeln(F, 'B360,91,2,1,2,2,60,N,"' + monta_cod_barras + '"'); //etiqueta de baixo
          Writeln(F, 'A350,28,2,3,1,1,N,"' + 'R$: ' + FormatFloat('###,##0.00', dao.q1.fieldbyname('preco_venda').AsFloat) + '"'); // etiqueta de cima

          writeln(F, 'B360,220,2,1,2,2,60,N,"' + monta_cod_barras + '"');
          Writeln(F, 'A350,155,2,3,1,1,N,"' + 'R$: ' + FormatFloat('###,##0.00', dao.q1.fieldbyname('preco_venda').asFloat) + '"');


          writeln(F, 'B365,365,2,1,2,2,60,N,"' + cod_barras + '"');
          Writeln(F, 'A365,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
          Writeln(F, 'A365,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
          Writeln(F, 'A365,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

          Writeln(F, 'A350,515,2,1,1,1,N,"Trocas somente no prazo"');
          Writeln(F, 'A350,500,2,1,1,1,N,"maximo de 30 dias"');
          Writeln(F, 'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');

          Writeln(F, 'A330,560,2,3,1,2,N,"Beach Boutique"');

        end;
        Writeln(F, '' + 'P' + qtd + '');
        Writeln(F, ' ');
        Sleep(1000);
        CloseFile(F);

      end

      else
        if col_inicia = 'E' then
        begin
          coluna_atual := '1';
//      AssignFile(F,'LPT1');
          AssignFile(F, 'd:\' + IntToStr(letra) + '.txt');
  //    AssignFile(F,'\\ir01\zebra');
          Rewrite(F);
          Writeln(F, ' ');
          Writeln(F, 'O');
          Writeln(F, 'N');
          Writeln(F, 'D7');
          Writeln(F, 'S2');
          Writeln(F, 'ZT');
          Writeln(F, 'Q576,24');
          Writeln(F, 'q800');

          writeln(F, 'B750,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
          Writeln(F, 'A750,28,2,3,1,1,N,"' + 'R$: ' + preco + '"'); // etiqueta de cima

          writeln(F, 'B750,220,2,1,2,2,60,N,"' + cod_barras + '"');
          Writeln(F, 'A750,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

          writeln(F, 'B750,365,2,1,2,2,60,N,"' + cod_barras + '"');

          Writeln(F, 'A770,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
          Writeln(F, 'A770,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
          Writeln(F, 'A770,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

          Writeln(F, 'A750,515,2,1,1,1,N,"Trocas somente no prazo"');
          Writeln(F, 'A750,500,2,1,1,1,N,"maximo de 30 dias"');
          Writeln(F, 'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');

          Writeln(F, 'A700,560,2,3,1,2,N,"Beach Boutique"');
      {*********}
          coluna_atual := '2';
          writeln(F, 'B360,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
          Writeln(F, 'A350,28,2,3,1,1,N,"' + 'R$: ' + preco + '"'); // etiqueta de cima

          writeln(F, 'B360,220,2,1,2,2,60,N,"' + cod_barras + '"');
          Writeln(F, 'A350,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

          writeln(F, 'B365,365,2,1,2,2,60,N,"' + cod_barras + '"');
          Writeln(F, 'A365,395,2,3,1,1,N,"' + 'TAMANHO: ' + dao.q1.fieldbyname('tamanho').asstring + '"');
          Writeln(F, 'A365,420,2,3,1,1,N,"' + 'COR:' + dao.q1.fieldbyname('cor').asstring + '"');
          Writeln(F, 'A365,445,2,3,1,1,N,"' + copy(dao.q1.fieldbyname('nom_produto').asstring, 1, 25) + '"');

          Writeln(F, 'A350,515,2,1,1,1,N,"Trocas somente no prazo"');
          Writeln(F, 'A350,500,2,1,1,1,N,"maximo de 30 dias"');
          Writeln(F, 'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');

          Writeln(F, 'A330,560,2,3,1,2,N,"Beach Boutique"');

          Writeln(F, '' + 'P' + qtd + '');
          Writeln(F, ' ');
          Sleep(1000);
          CloseFile(F);
        end;

 // end;
end;



procedure TFrsel_coluna_Etiqueta.Button1Click(Sender: TObject);
var
  qtd_etiqueta: real;
begin
  qtd_etiqueta := strtofloaT(formatfloat('0', (5 / 2)));


end;

procedure TFrsel_coluna_Etiqueta.Pc_etiquetaChange(Sender: TObject);
begin
  if Pc_etiqueta.ActivePage = tab_eti_individual then
  begin
    monta_itens;


  end;
end;

procedure TFrsel_coluna_Etiqueta.monta_itens;
begin
  dao.Geral2('select e2.id, e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where e2.nr_documento=' + QuotedStr(Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString) + ' and e2.cod_fornecedor=' + QuotedStr(Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString));

  while not (dao.Q2.Eof) do
  begin
    Cl_Produtos.Items.Add(' ' + Fr_transferencia.AjustaStr(dao.q2.fieldbyname('id').AsString, 10) + ' - ' + Fr_transferencia.AjustaStr(dao.q2.fieldbyname('cod_produto').AsString, 5) + ' - ' + Fr_transferencia.AjustaStr(formatfloat('###,##0.00', dao.Q2.fieldbyname('preco_venda').AsFloat), 15) + ' - ' + dao.Q2.fieldbyname('nom_produto').AsString + ' - ' + dao.Q2.fieldbyname('cor').AsString + ' - ' + dao.Q2.fieldbyname('tamanho').AsString);
    dao.Q2.Next;
  end;



end;

procedure TFrsel_coluna_Etiqueta.imprime_etiqueta_avulso;
var
  condicao: string;
  i: integer;
  qtd_etiqueta: string;

begin
  if (not (zzcoluna1.Checked)) and (not (zzcoluna2.Checked)) then
  begin
    dao.msg('Informe a Coluna Inicial!');
    exit;
  end;

  if zzcoluna1.Checked then
  begin
    inicia_cl := 'C';
    coluna_atual := 'C';
  end
  else
    if zzcoluna2.Checked then
    begin
      inicia_cl := 'C';
      coluna_atual := 'C';
    end;

  for i := 0 to (Cl_Produtos.Items.Count - 1) do
  begin
    if Cl_Produtos.checked[I] then
    begin
      if condicao = '' then
        condicao := condicao + ' e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10))
      else
        condicao := condicao + ' and e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10));

    end;
  end;

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where' + condicao);

//             'where e2.nr_documento='+QuotedStr(Fr_entrada.q_entrada1.fieldbyname('nr_documento').AsString)+' and e2.cod_fornecedor='+QuotedStr(Fr_entrada.q_entrada1.fieldbyname('cod_fornecedor').AsString));

  dao.Q1.First;








end;

procedure TFrsel_coluna_Etiqueta.BitBtn2Click(Sender: TObject);
begin
  if Cbetiqueta.ItemIndex = 0 then
    imprime_avulso_etiqueta
  else
    if Cbetiqueta.ItemIndex = 1 then
      imprime_avulso_etiqueta_home
    else
      if Cbetiqueta.ItemIndex = 3 then
        imprime_etiqueta_authentic_avulso;

  //imprime_etiqueta_avulso;
end;

procedure TFrsel_coluna_Etiqueta.FormShow(Sender: TObject);
begin
  Pc_etiqueta.ActivePage := tab_eti_completa;
  monta_combo_etiquetas;
  Cbetiqueta.ItemIndex := 0;
  dao.geral1('select caminho_cod_barras from configuracao where cod_conf=' + QuotedStr('1'));

  caminho_imp_cod_barras := dao.Q1.fieldbyname('caminho_cod_barras').AsString;

end;

procedure TFrsel_coluna_Etiqueta.imprime_etiqueta(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string);
var
  tot_itens: integer;
  i, j: integer;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda: string;
begin
  dao.Geral1('select sum(qtd_entrada) as tot from entrada2 where nr_documento=' + QuotedStr(nr_documento) + ' and cod_fornecedor=' + QuotedStr(cod_fornecedor));
  tot_itens := dao.Q1.fieldbyname('tot').AsInteger;
  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where e2.nr_documento=' + QuotedStr(nr_documento) + ' and e2.cod_fornecedor=' + QuotedStr(cod_fornecedor));

  dao.Q1.First;
  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end;
    end
    else
    begin
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');
      writeln(F, 'B750,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A750,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B750,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A750,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
      writeln(F, 'B750,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A770,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A770,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A770,445,2,3,1,1,N,"' + descricao + '"');
//        Writeln(F,'A750,515,2,1,1,1,N,"Trocas somente no prazo"');
//        Writeln(F,'A750,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A700,560,2,3,1,2,N,"Beach Boutique"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2
        writeln(F, 'B360,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A350,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); // etiqueta de cima
        writeln(F, 'B360,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A350,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
        writeln(F, 'B365,365,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A365,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A365,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A365,445,2,3,1,1,N,"' + descricao + '"');
//        Writeln(F,'A350,515,2,1,1,1,N,"Trocas somente no prazo"');
//        Writeln(F,'A350,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A330,560,2,3,1,2,N,"Beach Boutique"');
      end;
    end;

    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;


end;




procedure TFrsel_coluna_Etiqueta.imprime_eti_home(mod_etiqueta: string; nr_documento: string; cod_fornecedor: string);
var
  tot_itens: integer;
  i, j: integer;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  Aid_cor: array of string;
  Aid_tamanho: array of string;
  Acod_produto: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda, cod_produto, id_cor, id_tamanho: string;
begin
  dao.Geral1('select sum(qtd_entrada) as tot from entrada2 where nr_documento=' + QuotedStr(nr_documento) + ' and cod_fornecedor=' + QuotedStr(cod_fornecedor));
  tot_itens := dao.Q1.fieldbyname('tot').AsInteger;
  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);
  SetLength(Aid_cor, tot_itens);
  SetLength(Aid_tamanho, tot_itens);
  SetLength(Acod_produto, tot_itens);

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where e2.nr_documento=' + QuotedStr(nr_documento) + ' and e2.cod_fornecedor=' + QuotedStr(cod_fornecedor));

  dao.Q1.First;
  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        Aid_cor[i] := dao.q1.fieldbyname('id_cor').AsString;
        Aid_tamanho[i] := dao.q1.fieldbyname('id_tamanho').AsString;
        Acod_produto[i] := dao.Q1.fieldbyname('cod_produto').asString;
        i := i + 1;
      end;
    end
    else
    begin
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      Aid_cor[i] := dao.q1.fieldbyname('id_cor').AsString;
      Aid_tamanho[i] := dao.q1.fieldbyname('id_tamanho').AsString;
      Acod_produto[i] := dao.Q1.fieldbyname('cod_produto').asString;
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := Acod_barras[i];
      preco_venda := Apreco_venda[i];
      id_cor := Aid_cor[i];
      id_tamanho := Aid_tamanho[i];
      cod_produto := Acod_produto[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q200,24');
      Writeln(F, 'q800');
      Writeln(F, 'A550,20,2,1,1,1,N,"' + cod_produto + '.' + id_cor + '.' + id_tamanho + '"'); //***********
      Writeln(F, 'A765,20,2,2,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B765,90,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A770,110,2,2,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A770,130,2,2,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A770,150,2,2,1,1,N,"' + descricao + '"');
//        Writeln(F,'A700,188,2,2,1,2,N,"Beach Boutique Home"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];
        id_cor := Aid_cor[i];
        id_tamanho := Aid_tamanho[i];
        cod_produto := Acod_produto[i];
      //coluna 2

        Writeln(F, 'A150,20,2,1,1,1,N,"' + cod_produto + '.' + id_cor + '.' + id_tamanho + '"'); //***********
        Writeln(F, 'A350,20,2,2,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
        writeln(F, 'B365,90,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A365,110,2,2,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A365,130,2,2,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A365,150,2,2,1,1,N,"' + descricao + '"');
//        Writeln(F,'A330,188,2,2,1,2,N,"Beach Boutique Home"');

      end;
    end;

    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.monta_combo_etiquetas;
begin
  dao.Geral1('select id, nom_etiqueta from etiqueta order by id ');
  dao.Q1.First;
  Cbetiqueta.Clear;

  while not (dao.Q1.eof) do
  begin
    Cbetiqueta.AddItem(FMFUN.enchezero(dao.Q1.fieldbyname('id').AsString, 3) + '-' + dao.Q1.fieldbyname('nom_etiqueta').AsString, Cbetiqueta);
    dao.Q1.Next;
  end;

end;

procedure TFrsel_coluna_Etiqueta.imprime_avulso_etiqueta;
var
  condicao: string;
  i, j: integer;
  ac: integer;
  qtd_etiqueta: string;
  tot_itens: integer;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda: string;


begin
  if (not (zzcoluna1.Checked)) and (not (zzcoluna2.Checked)) then
  begin
    dao.msg('Informe a Coluna Inicial!');
    exit;
  end;

  for i := 0 to (Cl_Produtos.Items.Count - 1) do
  begin
    if Cl_Produtos.checked[I] then
    begin
      if condicao = '' then
        condicao := condicao + ' e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10))
      else
        condicao := condicao + ' and e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10));

    end;
  end;

  if Primprime_um.Checked then
  begin
    dao.Geral1('select id as tot from entrada2 e2 ' +
      'where ' + condicao);

    dao.Q1.First;
    ac := 1;
    while not (dao.Q1.Eof) do
    begin
      ac := ac + 1;
      dao.Q1.Next;
    end;
  end
  else
  begin
    dao.Geral1('select sum(qtd_entrada) as tot from entrada2 e2 ' +
      'where ' + condicao);
  end;
  if Primprime_um.Checked then
    tot_itens := ac
  else
    tot_itens := dao.Q1.fieldbyname('tot').AsInteger;

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where ' + condicao);


  dao.Q1.First;

  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);

  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end;
    end
    else
    begin
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');
      writeln(F, 'B780,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A780,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B780,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
      writeln(F, 'B780,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A780,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A780,445,2,3,1,1,N,"' + descricao + '"');
//        Writeln(F,'A780,515,2,1,1,1,N,"Trocas somente no prazo"');
//        Writeln(F,'A780,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A780,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A710,560,2,3,1,2,N,"Beach Boutique"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2
        writeln(F, 'B370,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A370,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); // etiqueta de cima
        writeln(F, 'B370,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
        writeln(F, 'B370,365,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A370,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A370,445,2,3,1,1,N,"' + descricao + '"');
//        Writeln(F,'A370,515,2,1,1,1,N,"Trocas somente no prazo"');
//        Writeln(F,'A370,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A370,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A340,560,2,3,1,2,N,"Beach Boutique"');
      end;
    end;
    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.imprime_avulso_etiqueta_home;
var
  tot_itens: integer;
  i, j: integer;
  ac: integer;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda, condicao: string;
begin
  if (not (zzcoluna1.Checked)) and (not (zzcoluna2.Checked)) then
  begin
    dao.msg('Informe a Coluna Inicial!');
    exit;
  end;

  for i := 0 to (Cl_Produtos.Items.Count - 1) do
  begin
    if Cl_Produtos.checked[I] then
    begin
      if condicao = '' then
        condicao := condicao + ' e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10))
      else
        condicao := condicao + ' and e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10));
    end;
  end;

  if Primprime_um.Checked then
  begin
    dao.Geral1('select id as tot from entrada2 e2 ' +
      'where ' + condicao);

    dao.Q1.First;
    ac := 1;
    while not (dao.Q1.Eof) do
    begin
      ac := ac + 1;
      dao.Q1.Next;
    end;

  end
  else
  begin
    dao.Geral1('select sum(qtd_entrada) as tot from entrada2 e2 ' +
      'where ' + condicao);
  end;
  if Primprime_um.Checked then
    tot_itens := ac
  else
    tot_itens := dao.Q1.fieldbyname('tot').AsInteger;


  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where ' + condicao);

  dao.Q1.First;

  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);
  i := 0;

  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      if Primprime_um.Checked then
      begin
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end
      else
      begin
        for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
        begin
          Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
          Acor[i] := dao.Q1.fieldbyname('cor').AsString;
          Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
          Acod_barras[i] := monta_cod_barras;
          Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
          i := i + 1;
        end;
      end;
    end
    else
    begin
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q200,24');
      Writeln(F, 'q800');
      Writeln(F, 'A765,20,2,2,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B765,90,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A770,110,2,2,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A770,130,2,2,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A770,150,2,2,1,1,N,"' + descricao + '"');
//        Writeln(F,'A700,188,2,2,1,2,N,"Beach Boutique Home"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2

        Writeln(F, 'A350,20,2,2,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
        writeln(F, 'B365,90,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A365,110,2,2,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A365,130,2,2,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A365,150,2,2,1,1,N,"' + descricao + '"'); //nome do produto
//        Writeln(F,'A330,188,2,2,1,2,N,"Beach Boutique Home"');

      end;
    end;
    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.imprime_etiqueta_moveis(mod_etiqueta,
  nr_documento, cod_fornecedor: string);
var
  tot_itens: integer;
  i, j: integer;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda: string;
begin
  dao.Geral1('select sum(qtd_entrada) as tot from entrada2 where nr_documento=' + QuotedStr(nr_documento) + ' and cod_fornecedor=' + QuotedStr(cod_fornecedor));
  tot_itens := dao.Q1.fieldbyname('tot').AsInteger;
  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where e2.nr_documento=' + QuotedStr(nr_documento) + ' and e2.cod_fornecedor=' + QuotedStr(cod_fornecedor));

  dao.Q1.First;
  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end;
    end
    else
    begin
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');
      writeln(F, 'B780,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A780,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B780,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
      writeln(F, 'B780,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A780,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A780,445,2,3,1,1,N,"' + descricao + '"');
        //Writeln(F,'A750,515,2,1,1,1,N,"Trocas somente no prazo"');
        //Writeln(F,'A750,500,2,1,1,1,N,"maximo de 30 dias"');
       // Writeln(F,'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A710,560,2,3,1,2,N,"Beach Boutique Home"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2
        writeln(F, 'B370,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A370,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); // etiqueta de cima
        writeln(F, 'B370,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
        writeln(F, 'B370,365,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A370,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A370,445,2,3,1,1,N,"' + descricao + '"');
    //    Writeln(F,'A350,515,2,1,1,1,N,"Trocas somente no prazo"');
     //   Writeln(F,'A350,500,2,1,1,1,N,"maximo de 30 dias"');
     //   Writeln(F,'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A340,560,2,3,1,2,N,"Beach Boutique Home"');
      end;
    end;

    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.imprime_etiqueta_authentic(mod_etiqueta,
  nr_documento, cod_fornecedor: string);
var
  tot_itens: integer;
  i, j: integer;
  Acod_pro: array of string;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  Aid_cor: array of string;
  Aid_tamanho: array of string;
  F: TextFile;
  cor, tamanho, descricao, cod_barras, coluna, preco_venda, cod_prod, id_cor, id_tamanho: string;
begin
  dao.Geral1('select sum(qtd_entrada) as tot from entrada2 where nr_documento=' + QuotedStr(nr_documento) + ' and cod_fornecedor=' + QuotedStr(cod_fornecedor));
  tot_itens := dao.Q1.fieldbyname('tot').AsInteger;
  SetLength(Acod_pro, tot_itens);
  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);
  SetLength(Aid_cor, tot_itens);
  SetLength(Aid_tamanho, tot_itens);

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where e2.nr_documento=' + QuotedStr(nr_documento) + ' and e2.cod_fornecedor=' + QuotedStr(cod_fornecedor));

  dao.Q1.First;
  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Acod_pro[i] := dao.q1.fieldbyname('cod_produto').AsString;
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Aid_cor[i] := dao.q1.fieldbyname('id_cor').AsString;
        Aid_tamanho[i] := dao.Q1.fieldbyname('id_tamanho').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end;
    end
    else
    begin
      Acod_pro[i] := copy(dao.q1.fieldbyname('cod_produto').AsString, 1, 25);
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Aid_cor[i] := dao.q1.fieldbyname('id_cor').AsString;
      Aid_tamanho[i] := dao.Q1.fieldbyname('id_tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;

    dao.Q1.Next;

  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      cod_prod := Acod_pro[i];
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      id_cor := Aid_cor[i];
      id_tamanho := Aid_tamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');
      writeln(F, 'B780,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A560,28,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"'); //***********
      Writeln(F, 'A780,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B780,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A560,155,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"'); //****************
      Writeln(F, 'A780,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
      writeln(F, 'B780,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A780,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A780,445,2,3,1,1,N,"' + descricao + '"');
      Writeln(F, 'A780,515,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"');
//        Writeln(F,'A750,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A700,560,2,3,1,2,N,"Beach Boutique"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        id_cor := Aid_cor[i];
        id_tamanho := Aid_tamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2
        writeln(F, 'B370,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A370,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); // etiqueta de cima
        Writeln(F, 'A170,28,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"');
        writeln(F, 'B370,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
        Writeln(F, 'A170,155,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"');
        writeln(F, 'B370,365,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A370,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A370,445,2,3,1,1,N,"' + descricao + '"');
        Writeln(F, 'A370,515,2,1,1,1,N,"' + cod_prod + '.' + id_cor + '.' + id_tamanho + '"');
      //  Writeln(F,'A350,500,2,1,1,1,N,"maximo de 30 dias"');
      //  Writeln(F,'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');
        //Writeln(F,'A330,560,2,3,1,2,N,"Beach Boutique"');
      end;
    end;

    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.imprime_etiqueta_authentic_avulso;
var
  condicao: string;
  i, j: integer;
  ac: integer;
  qtd_etiqueta: string;
  tot_itens: integer;
  Acod_pro: array of string;
  Aproduto: array of string;
  Acor: array of string;
  Atamanho: array of string;
  Acod_barras: array of string;
  Apreco_venda: array of string;
  F: TextFile;
  cod_prod, cor, tamanho, descricao, cod_barras, coluna, preco_venda: string;

begin
  if (not (zzcoluna1.Checked)) and (not (zzcoluna2.Checked)) then
  begin
    dao.msg('Informe a Coluna Inicial!');
    exit;
  end;

  for i := 0 to (Cl_Produtos.Items.Count - 1) do
  begin
    if Cl_Produtos.checked[I] then
    begin
      if condicao = '' then
        condicao := condicao + ' e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10))
      else
        condicao := condicao + ' and e2.id = ' + FMFUN.Alltrim(copy(Cl_Produtos.Items.ValueFromIndex[i], 0, 10));

    end;
  end;

  if Primprime_um.Checked then
  begin
    dao.Geral1('select id as tot from entrada2 e2 ' +
      'where ' + condicao);

    dao.Q1.First;
    ac := 1;
    while not (dao.Q1.Eof) do
    begin
      ac := ac + 1;
      dao.Q1.Next;
    end;
  end
  else
  begin
    dao.Geral1('select sum(qtd_entrada) as tot from entrada2 e2 ' +
      'where ' + condicao);
  end;
  if Primprime_um.Checked then
    tot_itens := ac
  else
    tot_itens := dao.Q1.fieldbyname('tot').AsInteger;

  dao.Geral1('select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto,e2.qtd_entrada, p.nom_produto, cr.cor, tm.tamanho, cl.id as cod_colecao, cl.descricao, p.preco_venda,e2.id_cor,e2.id_tamanho  from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'left join cores cr on cr.id=e2.id_cor ' +
    'left join tamanho tm on tm.id=e2.id_tamanho ' +
    'left join colecao cl on cl.id=p.cod_colecao ' +
    'where ' + condicao);


  dao.Q1.First;

  SetLength(Acod_pro, tot_itens);
  SetLength(Aproduto, tot_itens);
  SetLength(Acor, tot_itens);
  SetLength(Atamanho, tot_itens);
  SetLength(Acod_barras, tot_itens);
  SetLength(Apreco_venda, tot_itens);

  i := 0;
  while not (dao.Q1.Eof) do
  begin //nome + cor + tamanho
    if dao.Q1.FieldByName('qtd_entrada').AsFloat > 1 then
    begin
      for j := 1 to dao.Q1.fieldbyname('qtd_entrada').AsInteger do
      begin
        Acod_pro[i] := dao.q1.fieldbyname('cod_produto').AsString;
        Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
        Acor[i] := dao.Q1.fieldbyname('cor').AsString;
        Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
        Acod_barras[i] := monta_cod_barras;
        Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        i := i + 1;
      end;
    end
    else
    begin
      Acod_pro[i] := dao.q1.fieldbyname('cod_produto').AsString;
      Aproduto[i] := copy(dao.q1.fieldbyname('nom_produto').AsString, 1, 25);
      Acor[i] := dao.Q1.fieldbyname('cor').AsString;
      Atamanho[i] := dao.q1.fieldbyname('tamanho').AsString;
      Acod_barras[i] := monta_cod_barras;
      Apreco_venda[i] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      i := i + 1;
    end;
    dao.Q1.Next;
  end;

  coluna := '1';
  i := 0;
  while i <= tot_itens - 1 do
  begin
    if i <= tot_itens - 1 then
    begin
      cod_prod := Acod_pro[i];
      descricao := Aproduto[i];
      cor := Acor[i];
      tamanho := Atamanho[i];
      cod_barras := acod_barras[i];
      preco_venda := Apreco_venda[i];
    end;
    if i <= tot_itens then
    begin
  //      AssignFile(F,'d:\'+IntToStr(letra)+'.txt');
      AssignFile(F, caminho_imp_cod_barras);
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');
      writeln(F, 'B780,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
      Writeln(F, 'A780,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); //etiqueta de cima
      writeln(F, 'B780,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
      writeln(F, 'B780,365,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A780,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
      Writeln(F, 'A780,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A780,445,2,3,1,1,N,"' + descricao + '"');
      Writeln(F, 'A780,515,2,1,1,1,N,"' + cod_prod + '-' + cor + '-' + tamanho + '"');
//        Writeln(F,'A750,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A750,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A700,560,2,3,1,2,N,"Beach Boutique"');
      i := i + 1;
      if i <= tot_itens - 1 then
      begin
        cod_prod := Acod_pro[i];
        descricao := Aproduto[i];
        cor := Acor[i];
        tamanho := Atamanho[i];
        cod_barras := acod_barras[i];
        preco_venda := Apreco_venda[i];

      //coluna 2
        writeln(F, 'B370,91,2,1,2,2,60,N,"' + cod_barras + '"'); //etiqueta de baixo
        Writeln(F, 'A370,28,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"'); // etiqueta de cima
        writeln(F, 'B370,220,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,155,2,3,1,1,N,"' + 'R$: ' + preco_venda + '"');
        writeln(F, 'B370,365,2,1,2,2,60,N,"' + cod_barras + '"');
        Writeln(F, 'A370,395,2,3,1,1,N,"' + 'TAMANHO: ' + tamanho + '"');
        Writeln(F, 'A370,420,2,3,1,1,N,"' + 'COR:' + cor + '"');
        Writeln(F, 'A370,445,2,3,1,1,N,"' + descricao + '"');
        Writeln(F, 'A370,515,2,1,1,1,N,"' + cod_prod + '-' + cor + '-' + tamanho + '"');
//        Writeln(F,'A350,500,2,1,1,1,N,"maximo de 30 dias"');
//        Writeln(F,'A350,480,2,1,1,1,N,"a partir da data:    /    /     "');
//        Writeln(F,'A330,560,2,3,1,2,N,"Beach Boutique"');
      end;
    end;
    Writeln(F, '' + 'P' + '1' + ''); //qtd de etiquetas
    Writeln(F, ' ');
    Sleep(1000);
    CloseFile(F);
    i := i + 1;
    letra := letra + 1;
  end;

end;

procedure TFrsel_coluna_Etiqueta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
