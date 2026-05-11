unit Unacerto_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  Mask, ExtCtrls,
   sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sCurrEdit, sCurrencyEdit, sEdit, sMaskEdit,
  sCustomComboEdit, sTooledit, sComboEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_acerto_estoque = class(TForm)
    fracerto_estoque: TsGroupBox;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btsai: TsBitBtn;
    Label1: tsLabel;
    Label2: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Panel1: tsPanel;
    Label15: tsLabel;
    Prcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    Properacao: TComboBox;
    Prid: TsEdit;
    Prdata_acerto: TsDateEdit;
    Prmotivo: TsEdit;
    Prqtd_acerto: TsCurrencyEdit;
    GroupBox1: TsGroupBox;
    zzestoque_geral: TsCurrencyEdit;
    PrQtd_estoque: TsCurrencyEdit;
    btpro: TsBitBtn;
    q_acerto_estoque: TFDQuery;
    procedure btnovClick(Sender: TObject);
    procedure btsaiClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_produtoKeyPress(Sender: TObject;
      var Key: Char);
    procedure Prid_corButtonClick(Sender: TObject);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    modo_insert: Boolean;
    id: string;
    procedure readonly_true;
    procedure readonly_false;
    procedure ativa_acerto(id: string);
    procedure limpa_campos(prefixo: ShortString);
    function busca_est_geral(codpro: string): string;
    function busca_est_individual(codpro: string; id_tamanho: string; id_cor: string): string;
    procedure busca_produto_unitario(leitor: boolean; cod_barras: string);
    procedure busca_produto_microssiga;
    { Public declarations }
  end;

var
  fr_acerto_estoque: Tfr_acerto_estoque;

implementation

uses UnFun, UnPri,
  UnSenha_especial, Un_localizar, Un_dao, Un_grupo;

{$R *.dfm}

procedure Tfr_acerto_estoque.btnovClick(Sender: TObject);
begin
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;

  modo_insert := true;
  limpa_campos('Pr');
  Prdata_acerto.Date := dao.DtaSerDt;
  Prqtd_acerto.Value := 1;
  readonly_false;
  Prcod_produto.SetFocus;

end;

procedure Tfr_acerto_estoque.btsaiClick(Sender: TObject);
begin
  close;
end;

procedure Tfr_acerto_estoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure Tfr_acerto_estoque.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if btsai.Enabled = false then
  begin
    ShowMessage('ALGUM BOTÃO GRAVAR /CANCELAR ESTÁ PENDENTE');
    CanClose := false;
    exit;
  end
  else
  begin
    canclose := true;
  end;

end;

procedure Tfr_acerto_estoque.btaltClick(Sender: TObject);
begin
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;

  modo_insert := false;

end;


procedure Tfr_acerto_estoque.btgraClick(Sender: TObject);
var
  operacao: integer;
  acerto_estoque: real;
begin
  acerto_estoque := PrQtd_estoque.Value;
  if acerto_estoque > 0 then
    operacao := 0
  else
  begin
    operacao := 1;
    acerto_estoque := acerto_estoque * (-1);
  end;

  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := false;

  Properacao.ItemIndex := operacao;
  Prqtd_acerto.Value   := acerto_estoque;

  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'acerto_estoque', 'id', fr_acerto_estoque, 'gen_acerto_estoque');
      Prid.Text := id;
      ativa_acerto(id);
      btNov.setFocus;
    end
    else
      dao.update('acerto_estoque', 'id', q_acerto_estoque.fieldbyname('id').AsString, 'Pr', fr_acerto_estoque);

    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;


  zzestoque_geral.Text := busca_est_geral(Prcod_produto.Text);
  readonly_true;
end;

procedure Tfr_acerto_estoque.btcanClick(Sender: TObject);
begin
  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := false;

end;

procedure Tfr_acerto_estoque.Prcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_acerto_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

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

procedure Tfr_acerto_estoque.Prcod_produtoExit(Sender: TObject);
begin

  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    zzestoque_geral.Text := busca_est_geral(Prcod_produto.Text);
    dao.Geral3('select nom_produto from produto where cod_produto=' + QuotedStr(Prcod_produto.Text));
    lbnom_produto.Caption := dao.Q3.FieldByName('nom_produto').AsString;
  end;

end;

procedure Tfr_acerto_estoque.Prcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  usa_leitor: Boolean;
begin
  {If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
 //   key:=#0;
 // end;

  if key = #13 then
  begin
    if (Length(Prcod_produto.Text) < 12) and (Prcod_produto.Text <> '') then
      busca_produto_unitario(False, Prcod_produto.Text)
    else if (Prcod_produto.Text <> '') then
    begin
      busca_produto_unitario(true, Prcod_produto.Text);
      usa_leitor := true;
    end;

    if (Prcod_produto.Text = '') and (btnov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_acerto_produto';
      chamou_cadastro := 'Fr_produto';
      revenda := 'S';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
      Fr_localizar.BT_cadastro.Visible := true;

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
    btgra.SetFocus;
    //SelectNext(sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure Tfr_acerto_estoque.Prid_corButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Cor';

  chamou_pesquisa := 'fr_cor';
  chamou_form := 'fr_acerto_cor';
  chamou_cadastro := 'fr_cor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cores';
  Fr_localizar.BT_cadastro.Visible := true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

  for i := 0 to 1 do
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

procedure Tfr_acerto_estoque.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := False
    else if Components[i] is TsComboEdit then
      TsComboEdit(components[i]).ReadOnly := false
    else if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(components[i]).ReadOnly := false
    else if Components[i] is TsDateEdit then
      TsDateEdit(components[i]).ReadOnly := false
    else if Components[i] is tsCheckbox then
      tsCheckbox(components[i]).ReadOnly := False

  end;

end;

procedure Tfr_acerto_estoque.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True
    else if Components[i] is TsComboEdit then
      TsComboEdit(components[i]).ReadOnly := True
    else if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(components[i]).ReadOnly := True
    else if Components[i] is TsDateEdit then
      TsDateEdit(components[i]).ReadOnly := True
    else if Components[i] is tsCheckbox then
      tsCheckbox(components[i]).ReadOnly := True

  end;

end;

procedure Tfr_acerto_estoque.ativa_acerto(id: string);
begin
  with q_acerto_estoque do
  begin
    close;
    sql.clear;
    sql.add('select a.ID, a.COD_PRODUTO, a.QTD_ACERTO, a.OPERACAO, a.DATA_ACERTO, a.MOTIVO, a.USUARIO, a.ID_TAMANHO, a.ID_COR, a.GERAL, a.GRADE, ' +
      'p.nom_produto, p.cod_colecao, p.qtd_estoque, c.cor, t.tamanho ' +
      'from acerto_estoque a ' +
      'left join produto p on p.cod_produto= a.cod_produto ' +
      'left join tamanho t on t.id= a.id_tamanho ' +
      'left join cores c on c.id= a.id_cor ' +
      'where a.id=' + QuotedStr(id));
    open;
  end;

end;

procedure Tfr_acerto_estoque.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_acerto_estoque.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex := 0;

      if prefixo = 'Pr' then
        Lbnom_produto.Caption := '...';
    end;
  end;

end;

procedure Tfr_acerto_estoque.FormShow(Sender: TObject);
begin
  limpa_campos('Pr');
  readonly_true;
end;

function Tfr_acerto_estoque.busca_est_geral(codpro: string): string;
begin
  dao.Geral2('select qtd_estoque from produto where cod_produto = ' + QuotedStr(codpro));
  result := dao.Q2.fieldbyname('qtd_estoque').AsString;
end;

function Tfr_acerto_estoque.busca_est_individual(codpro: string; id_tamanho: string; id_cor: string): string;
begin
  dao.Geral2('select est_individual from grade where cod_produto = ' + QuotedStr(codpro) + ' and id_tamanho = ' + QuotedStr(id_tamanho) + ' and id_cor = ' + QuotedStr(id_cor));
  result := dao.Q2.fieldbyname('est_individual').AsString;

end;

procedure Tfr_acerto_estoque.busca_produto_unitario(leitor: boolean; cod_barras: string);
var
  cmd: string;
  id_produto, idcor, idtamanho: string;
begin
  if leitor then
  begin
    if length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' +
        'left join cod_barras cb on cb.cod_produto=p.cod_produto ' +
        'where cb.cod_barras=' + QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
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
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) + ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 3)));
        end;
      end
      else if length(trim(cod_barras)) = 14 then
      begin
        if copy(cod_barras, 1, 8) <> '' then
          dao.Geral2('select grade from produto where cod_pro2= ' + QuotedStr(copy(cod_barras, 1, 8)));

        if dao.Q2.FieldByName('grade').AsString = '0' then
        begin

          dao.Geral3('select cod_produto, cod_pro2 from produto where cod_pro2=' + QuotedStr(copy(cod_barras, 1, 8)));
          id_produto := dao.Q3.fieldbyname('cod_produto').AsString;
          dao.Geral3('select id, id_cor2 from cores where id_cor2=' + QuotedStr(copy(cod_barras, 9, 3)));
          idcor := dao.Q3.fieldbyname('id').AsString;
          dao.Geral3('select id, id_tam2 from tamanho where id_tam2=' + QuotedStr(copy(cod_barras, 12, 3)));
          idtamanho := dao.Q3.fieldbyname('id').AsString;

          dao.Geral1('select p.cod_produto, p.cod_pro2 , p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, c.id_cor2, t.tamanho, t.id_tam2 from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(id_produto) + ' and gd.id_cor = ' + QuotedStr(idcor) + ' and id_tamanho = ' + QuotedStr(idtamanho));
        end;
      end
      else if length(trim(cod_barras)) = 23 then
      begin
        if copy(cod_barras, 1, 5) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 5)));

        if dao.Q2.FieldByName('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 5)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 6, 3)) + ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 9, 3)));
        end;
      end;

      if length(trim(cod_barras)) = 14 then
      begin
        if dao.Q2.FieldByName('grade').AsString = '1' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(id_produto));
        end;
      end
      else
      begin
        if dao.Q2.FieldByName('grade').AsString = '1' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
        end;
      end;
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
      end;
    end;
  end;

  if not (leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' +
      'where p.cod_produto = ' + QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      Prcod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure Tfr_acerto_estoque.busca_produto_microssiga;
begin

end;


end.

