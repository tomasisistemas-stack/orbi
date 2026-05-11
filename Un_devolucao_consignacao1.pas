unit Un_devolucao_consignacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  Mask, StdCtrls, ComCtrls, Grids,
  BaseGrid, AdvGrid, Buttons,  JvExExtCtrls, JvComponent,
  JvPanel, comobj, Menus,  JvExtComponent, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox;

type
  TFr_devolucao_consignacao = class(TForm)
    Gbdad1: tsPanel;
    Gbdad2: tsPanel;
    Label7: tsLabel;
    Prtot_bruto: TsCurrencyEdit;
    Panel2: tsPanel;
    btnov: TsBitBtn;                                        
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btloc: TsBitBtn;
    Prnum_consignacao: TsEdit;
    Label4: tsLabel;
    Prdta_consignacao: TsDateEdit;
    Label5: tsLabel;
    Panel4: tsPanel;
    Label1: tsLabel;
    Prnum_devolucao: TsEdit;
    Prdta_devolucao: TsDateEdit;                   
    Label2: tsLabel;
    Panel5: tsPanel;
    sgx: TAdvStringGrid;
    q_devolucao1: TFDQuery;
    q_devolucao2: TFDQuery;
    Prcod_cliente: TsComboEdit;
    Label11: tsLabel;
    LBnom_cliente: tsLabel;
    Gbdados: TsGroupBox;
    Label15: tsLabel;
    Dmcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    paAtributo: tsPanel;
    Label10: tsLabel;
    LbCor: tsLabel;
    Lbtamanho: tsLabel;
    Label23: tsLabel;
    Dmid_cor: TsComboEdit;
    Dmid_Tamanho: TsComboEdit;
    Label3: tsLabel;
    GroupBox2: TsGroupBox;
    Btnovdm: TsBitBtn;
    btaltdm: TsBitBtn;
    btgradm: TsBitBtn;
    btcandm: TsBitBtn;
    btexcdm: TsBitBtn;
    Dmqtd: TsCurrencyEdit;
    Dmid: TsEdit;
    Dmpreco: TsCurrencyEdit;
    Paconsignacoes: TJvPanel;
    TVconsig: TTreeView;
    BtConsig: TButton;
    Panel1: tsPanel;
    SpeedButton1: TsSpeedButton;
    MainMenu1: TMainMenu;
    FechamentodeConsignao1: TMenuItem;
    FechamentodeConsignao2: TMenuItem;
    ComprovantedeDevoluo1: TMenuItem;
    RelaodeConsignaes1: TMenuItem;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btlocClick(Sender: TObject);
    procedure sgxCellChanging(Sender: TObject; OldRow, OldCol,
  NewRow, NewCol: Integer; var Allow: Boolean);
    procedure sgxCellsChanged(Sender: TObject; R: TRect);
    procedure sgxClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgxExit(Sender: TObject);
    procedure sgxKeyPress(Sender: TObject;
  var Key: Char);
    procedure sgxRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
    procedure sgxSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_consignacaoExit(Sender: TObject);
    procedure Prnum_consignacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prnum_consignacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dmcod_produtoButtonClick(Sender: TObject);
    procedure Dmcod_produtoExit(Sender: TObject);
    procedure Dmcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
    procedure Dmid_corButtonClick(Sender: TObject);
    procedure Dmid_corKeyPress(Sender: TObject; var Key: Char);
    procedure Dmid_TamanhoButtonClick(Sender: TObject);
    procedure Dmid_TamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnovdmClick(Sender: TObject);
    procedure btaltdmClick(Sender: TObject);
    procedure btgradmClick(Sender: TObject);
    procedure btcandmClick(Sender: TObject);
    procedure BtnovdmEnter(Sender: TObject);
    procedure DmqtdKeyPress(Sender: TObject; var Key: Char);
    procedure Dmid_corExit(Sender: TObject);
    procedure Dmid_TamanhoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TVconsigClick(Sender: TObject);
    procedure TVconsigDblClick(Sender: TObject);
    procedure BtConsigClick(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure btexcdmClick(Sender: TObject);
    procedure FechamentodeConsignao2Click(Sender: TObject);
    procedure ComprovantedeDevoluo1Click(Sender: TObject);
  private
    procedure monta_sgx;
    procedure DeletaLinha(Linha: Integer);

    { Private declarations }
  public
    modo_insert: Boolean;
    modo_insert_dm: boolean;
    edit_sg, id: String;
    linmax, lin_excluir : integer;
    preco_venda: real;
    qtd_anterior, produto_anterior, cor_anterior, tamanho_anterior: String;

    procedure InsLinha(var SGX: TAdvStringGrid);

    procedure busca_produto;
    procedure busca_produto_unitario(leitor: boolean; cod_barras:String);

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_devolucao1(nr_documento: String);
    procedure ativa_devolucao2(nr_documento: String);

    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

    procedure limpa_sgx;
    procedure Grava_Sgx(insert : Boolean);
    procedure insere_reg_sgPro(tipo: String);

    function totaliza_devolucao : real;
    function confere_produto: boolean;//responsavel por conferir se o produto existe na consig. e sua qtd tbm.
    procedure baixa_qtd_devolvida(q_devolver, tipo, n_doc, c_cli, c_pro, id_cor, id_tamanho: String);//tipo e=entrada s=saida
    procedure scroll_sgx;
    procedure MontaComprovanteDevolucao;

  end;

var
  Fr_devolucao_consignacao: TFr_devolucao_consignacao;

implementation

uses Un_dao, Un_localizar, UnPri, UnFun, Un_sel_atributo, Un_vendas,
  Un_fec_consignacao;

{$R *.dfm}

procedure TFr_devolucao_consignacao.ativa_devolucao1(nr_documento: String);
begin
  with q_devolucao1 do
  begin
    close;
    sql.clear;
    sql.add('select v1.*, c.nom_cliente, u.logusu, u.nome, fop.nom_fop from vendas1 v1 '+
            'left join cliente c on c.cod_cliente=v1.cod_cliente '+
            'left join tbusu u on u.codusu=v1.cod_usuario '+
            'left join fop fop on fop.cod_fop=v1.cod_fop '+
            'where numdoc='+QuotedStr(nr_documento));
    open;
  end;

end;

procedure TFr_devolucao_consignacao.ativa_devolucao2(nr_documento: String);
begin
  with q_devolucao2 do
  begin
    close;
    sql.clear;
    sql.add('select dv2.*, p.nom_produto, p.grade from dev_consignacao2 dv2 '+
            'left join produto p on p.cod_produto = dv2.cod_produto '+
            'where num_devolucao = '+ QuotedStr(nr_documento));

    open;
  end;

end;

procedure TFr_devolucao_consignacao.btaltClick(Sender: TObject);
begin
  try
    if Prnum_devolucao.Text = '' then
    begin
      dao.msg('');
    end;
    modo_insert:=false;
    readonly_false('Pr');
    //habilita botões
    btnov.Enabled:=false;
    btalt.Enabled:=false;
    btgra.Enabled:=true;
    btcan.Enabled:=true;
    btexc.Enabled:=false;
    btloc.Enabled:=false;


  except
  end;
end;

procedure TFr_devolucao_consignacao.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin

  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      btnov.Enabled:=true;
      btalt.Enabled:=true;
      btgra.Enabled:=false;
      btcan.Enabled:=False;
      btexc.Enabled:=true;
      btloc.Enabled:=true;
     Gbdad1.Enabled:= false;
     Gbdad2.Enabled:= false;
     btcandm.Click;


      if modo_insert then
      begin
        Limpa_campos('Pr');
        readonly_true('Pr');
      end
      else
      if modo_insert = false then
      begin
        // mostra_campos(Prcod_grupo.Text);
         readonly_true('Pr');
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_devolucao_consignacao.btexcClick(Sender: TObject);
var
  condicao: String;
begin
  dao.msg('Para Excluir essa Consinação deve ser Solicitado ao administrador do Sistema!');


{  if Prcod_grupo.Text='' then
  begin
    showmessage('Não é possivel excluir este Grupo por não ter Código!');
    PrNom_grupo.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Cidade?', mtConfirmation, [mbyes, mbno], 0) =mryes then
  begin
    tipo:='3';
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.delete('cod_grupo',q_grupo.fieldbyname('cod_grupo').AsString,'grupo');
    dao.cn.Commit;
    Limpa_campos;
  end;
 // mostra_campos('');}

end;

procedure TFr_devolucao_consignacao.btgraClick(Sender: TObject);
var
 i : integer;
begin
  try
    if Prnum_consignacao.Text = '' then
    begin
      dao.msg('Preencha o campo Nº Consignação!');
      Prnum_consignacao.SetFocus;
      exit;
    end;

    if Prdta_consignacao.Text = '' then
    begin
      dao.msg('Preencha o campo Data Consignação!');
      Prdta_consignacao.SetFocus;
      exit;
    end;


  //  if not(confere_produto) then
  //     exit;

    btnov.Enabled:=true;
    btalt.Enabled:=true;
    btgra.Enabled:=false;
    btcan.Enabled:=False;
    btexc.Enabled:=true;
    btloc.Enabled:=true;
    Gbdad1.Enabled:= false;
    Gbdad2.Enabled:= false;

    if modo_insert then
    begin
      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      id:= dao.insert('Pr','dev_consig1', 'num_devolucao', Fr_devolucao_consignacao, 'gen_dev_consig1');
      dao.cn.Commit;
      Prnum_devolucao.Text:= id;
      ativa_devolucao1(Prnum_devolucao.Text);
    end
    else
    begin
      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.update('dev_consig1','num_devolucao',q_devolucao1.fieldbyname('id').AsString, 'Pr',Fr_devolucao_consignacao);
      dao.cn.Commit;
    end;
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
      Grava_Sgx(true)
    else
      Grava_Sgx(false);


    try
      for i:= 1 to sgx.RowCount-1 do
      begin
        dao.Geral1('select grade from produto where cod_produto='+QuotedStr(sgx.Cells[1,i]));
        if dao.Q1.FieldByName('grade').AsString = '0' then
        begin
          FRPRI.atualiza_estoque(sgx.Cells[1,i],'E', sgx.Cells[3,i],'R');
          FRPRI.atualiza_estoque_grade(sgx.Cells[1,i], sgx.Cells[6,i],'', sgx.Cells[7,i], 'E', sgx.Cells[3,i],'R');
        end
        else
          FRPRI.atualiza_estoque(sgx.Cells[1,i],'E', sgx.Cells[3,i],'R');
      end;

    except
      on e: Exception do
      begin
        dao.msg('Houve um erro na Atualização do Estoque na Devolução de Consignação!'+#13+#13+
                    e.Message);

      dao.envia_email_suporte(e.Message + #13 + 'Data: '+ dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao Gravar Registro 1 exception do procedimento Entrada1','felipesans@terra.com.br','','','');

      end;
    end;

    dao.cn.Commit;


    readonly_true('Pr');

  except
  end;
end;




procedure TFr_devolucao_consignacao.btnovClick(Sender: TObject);
begin
  try
    modo_insert:=true;
    readonly_false('Pr');
    //habilita botões
    btnov.Enabled:=false;
    btalt.Enabled:=false;
    btgra.Enabled:=true;
    btcan.Enabled:=true;
    btexc.Enabled:=false;
    btloc.Enabled:=false;
    Gbdad1.Enabled:= true;
    Gbdad2.Enabled:= true;
    Prnum_consignacao.SetFocus;

    edit_sg:= 'S';
    limpa_campos('Pr');
    limpa_campos('Dm');

    sgx.Clear;
    sgx.RowCount:=2;
    monta_sgx;
    linmax:=1;
    Prdta_devolucao.Date := dao.DtaSerDt;


  except

  end;
end;

procedure TFr_devolucao_consignacao.btlocClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Devolução de Consignação';
  chamou_pesquisa := 'fr_devolucao_consig';
  chamou_form := 'fr_devolucao_consig';
  chamou_cadastro := 'Fr_devolucao_consig';

  Fr_localizar.BT_cadastro.Caption:='';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cliente';
  Campos_combo[2] := 'Data';


  for i:=0 to 2 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_devolucao_consignacao.busca_produto;
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
  chamou_form := 'fr_dev_consignacao_produto';
  chamou_cadastro := 'Fr_produto';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Produto';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Grupo';
  Campos_combo[3] := 'Fornecedor';

  for i:=0 to 3 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
//  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_devolucao_consignacao.busca_produto_unitario(leitor: boolean;
  cod_barras: String);
var
  cmd: String;
  id_produto, idcor, idtamanho: string;

begin
  if leitor then
  begin
    if length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
                 'left join cod_barras cb on cb.cod_produto=p.cod_produto '+
                 'where cb.cod_barras='+QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        DMcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Dmcod_produto.Text:= dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
      end;
    end

    else
    begin
      if length(trim(cod_barras)) = 22 then
      begin
        if copy(cod_barras,1,4) <> '' then
           dao.Geral2('select grade from produto where cod_produto= '+QuotedStr(copy(cod_barras,1,4)));

        if dao.Q2.FieldByName('grade').AsString ='0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p '+
                     'left join grade gd on gd.cod_produto=p.cod_produto '+
                     'left join cores c on c.id=gd.id_cor '+
                     'left join tamanho t on t.id=gd.id_tamanho '+
                     'where p.cod_produto='+ QuotedStr(copy(cod_barras,1,4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras,5,3)) + ' and id_tamanho = ' +  QuotedStr(copy(cod_barras,8,3)));
        end;
      end
      else
      if length(trim(cod_barras)) = 14 then
      begin
        if copy(cod_barras,1,8) <> '' then
           dao.Geral2('select grade from produto where cod_pro2= '+QuotedStr(copy(cod_barras,1,8)));

        if dao.Q2.FieldByName('grade').AsString ='0' then
        begin
          dao.Geral3('select cod_produto, cod_pro2 from produto where cod_pro2='+QuotedStr(copy(cod_barras,1,8)));
          id_produto:= dao.Q3.fieldbyname('cod_produto').AsString;
          dao.Geral3('select id, id_cor2 from cores where id_cor2='+QuotedStr(copy(cod_barras,9,3)));
          idcor:= dao.Q3.fieldbyname('id').AsString;
          dao.Geral3('select id, id_tam2 from tamanho where id_tam2='+QuotedStr(copy(cod_barras,12,3)));
          idtamanho:= dao.Q3.fieldbyname('id').AsString;

          dao.Geral1('select p.cod_produto, p.cod_pro2 , p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, c.id_cor2, t.tamanho, t.id_tam2 from produto p '+
                     'left join grade gd on gd.cod_produto=p.cod_produto '+
                     'left join cores c on c.id=gd.id_cor '+
                     'left join tamanho t on t.id=gd.id_tamanho '+
                     'where p.cod_produto='+ QuotedStr(id_produto) + ' and gd.id_cor = ' + QuotedStr(idcor) + ' and id_tamanho = ' +  QuotedStr(idtamanho));
        end;
      end
      else
      if length(trim(cod_barras)) < 22 then
      begin
        if copy(cod_barras,1,4) <> '' then
           dao.Geral2('select grade from produto where cod_produto= '+QuotedStr(copy(cod_barras,1,4)));

        if dao.Q2.FieldByName('grade').AsString ='0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p '+
                     'left join grade gd on gd.cod_produto=p.cod_produto '+
                     'left join cores c on c.id=gd.id_cor '+
                     'left join tamanho t on t.id=gd.id_tamanho '+
                     'where p.cod_produto='+ QuotedStr(copy(cod_barras,1,4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras,5,3)) + ' and id_tamanho = ' +  QuotedStr(copy(cod_barras,8,3)));
        end;
      end
      else
      if length(trim(cod_barras)) >= 23 then
      begin
        if copy(cod_barras,1,5) <> '' then
           dao.Geral2('select grade from produto where cod_produto= '+QuotedStr(copy(cod_barras,1,5)));

        if dao.Q2.FieldByName('grade').AsString ='0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p '+
                     'left join grade gd on gd.cod_produto=p.cod_produto '+
                     'left join cores c on c.id=gd.id_cor '+
                     'left join tamanho t on t.id=gd.id_tamanho '+
                     'where p.cod_produto='+ QuotedStr(copy(cod_barras,1,5)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras,6,3)) + ' and id_tamanho = ' +  QuotedStr(copy(cod_barras,9,3)));
        end;
      end;


      if dao.Q2.FieldByName('grade').AsString ='1' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p '+
                   'left join grade gd on gd.cod_produto=p.cod_produto '+
                   'left join cores c on c.id=gd.id_cor '+
                   'left join tamanho t on t.id=gd.id_tamanho '+
                   'where p.cod_produto='+ QuotedStr(copy(cod_barras,1,4)));
      end;


      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Dmcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Dmcod_produto.Text:= dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
        if dao.Q1.FieldByName('grade').AsString = '0' then
        begin
          Dmid_cor.Text:= '';
          LbCor.Caption:='...';
          Dmid_Tamanho.Text:= '';
          Lbtamanho.Caption:='...';

          Dmid_cor.Text:= dao.Q1.fieldbyname('id_cor').AsString;
          LbCor.Caption:=dao.Q1.fieldbyname('cor').AsString;
          Dmid_Tamanho.Text:= dao.Q1.fieldbyname('id_tamanho').AsString;
          Lbtamanho.Caption:=dao.Q1.fieldbyname('tamanho').AsString;
        end;
      end;
    end;
  end;

  if not(leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
               'where p.cod_produto = '+QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      Dmcod_produto.SetFocus;
      exit;
    end;
  end;


end;


procedure TFr_devolucao_consignacao.Grava_Sgx(insert: Boolean);
var
  i: integer;
  id, num_documento, cod_produto, id_cor, id_tamanho, cmd: String;
  qtd, preco : String;
  qtd_c, preco_c, total: real;  //aqui são os que vão armazenar os convertidos de string para float
  campo, vlr : String;
begin
  if insert then
  begin
    sgx.Options := sgx.Options + [goEditing];

//    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    for i:=1 to sgx.RowCount -1 do
    begin
      num_documento:= Prnum_devolucao.Text;
      cod_produto:= sgx.cells[1,i];
      qtd := sgx.cells[3,i]; //48,00
      qtd_c:=  FMFUN.Str_to_float(qtd,0);
      preco:= sgx.cells[4,i];
      preco_c:= FMFUN.Str_to_float(preco,0);
      total:= preco_c * qtd_c;
      id_cor:= sgx.cells[6,i];
      id_tamanho:= sgx.cells[7,i];

      cmd:= 'insert into dev_consig2 (';

      if num_documento <> '' then
      begin
        campo:= 'num_devolucao';
        vlr:= num_documento;
      end;

      if cod_produto <> '' then
      begin
        campo:= campo +', ' + 'cod_produto';
        vlr:= vlr + ', ' + cod_produto;
      end;

      if qtd <> '' then
      begin
        campo:= campo + ', ' + 'qtd';
        vlr:= vlr + ', '+ FMFUN.prepara_valor(qtd);
      end;

      if preco <> '' then
      begin
        campo:= campo + ', ' + 'preco';
        vlr:= vlr + ', '+ FMFUN.prepara_valor(preco);
      end;

      if total <> 0 then
      begin
        campo:= campo + ', ' + 'sub_total';
        vlr:= vlr + ', '+ FMFUN.prepara_valor(FloatToStr(total));
      end;

      if id_cor <> '' then
      begin
        campo:= campo +', ' + 'id_cor';
        vlr:= vlr + ', ' + FMFUN.prepara_valor(id_cor);
      end;

      if id_tamanho <> '' then
      begin
        campo:= campo +', ' + 'id_tamanho';
        vlr:= vlr + ', ' + FMFUN.prepara_valor(id_tamanho);
      end;

      if Prcod_cliente.Text <> '' then
      begin
        campo:= campo +', ' + 'cod_cliente';
        vlr:= vlr + ', ' + Prcod_cliente.Text;
      end;

      if (cod_produto <> '') and (qtd <> '') then
        dao.Execsql(cmd + campo+') values ('+vlr+')');
    end;

//    dao.cn.Commit;

    end
    else
    begin
      sgx.Options := sgx.Options + [goEditing];

  //    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      for i:=1 to sgx.RowCount -1 do
      begin
        id:= sgx.cells[0,i];
        num_documento:= Prnum_devolucao.Text;
        cod_produto:= sgx.cells[1,i];
        qtd := sgx.cells[3,i]; //48,00
        qtd_c:=  FMFUN.Str_to_float(qtd,0);
        preco:= sgx.cells[4,i];
        preco_c:= FMFUN.Str_to_float(preco,0);
        total:= preco_c * qtd_c;
        id_cor:= sgx.cells[6,i];
        id_tamanho:= sgx.cells[7,i];

        cmd:= 'update dev_consig2 set ';

        if num_documento <> '' then
        begin
          cmd:= cmd + ' num_devolucao ='+ num_documento;
        end;

        if cod_produto <> '' then
        begin
          cmd:= cmd + ', cod_produto='+ cod_produto;
        end;

        if qtd <> '' then
        begin
          cmd:= cmd + ', qtd = '+ FMFUN.prepara_valor(FloatToStr(qtd_c));
        end;

        if preco <> '' then
        begin
          cmd:= cmd + ', preco = '+ FMFUN.prepara_valor(floattostr(preco_c));
        end;

        if total <> 0 then
        begin
          cmd:= cmd + ', sub_total = ' + FMFUN.prepara_valor(FloatToStr(total));
        end;

        if id_cor <> '' then
        begin
          cmd := cmd + ', id_cor = ' + QuotedStr(id_cor);
        end;

        if id_tamanho <> '' then
        begin
          cmd := cmd + ', id_tamanho = ' + QuotedStr(id_tamanho);
        end;

        if Prcod_cliente.Text <> '' then
        begin
          cmd := cmd + ', cod_cliente = ' + QuotedStr(Prcod_cliente.Text);
        end;

        if (cod_produto <> '') and (qtd <> '') then
           dao.Execsql(cmd + ' where id = ' + QuotedStr(id));
      end;
  //    dao.cn.Commit;

  end;

end;

procedure TFr_devolucao_consignacao.InsLinha(var SGX: TAdvStringGrid);
begin
  sgx.Col:=1;
  SGX.AddRow;
  SGX.Row:=SGX.Row+1;
  lin:= sgx.Row;
end;

procedure TFr_devolucao_consignacao.limpa_campos(prefixo: ShortString);
var
  i: integer;

begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    LBnom_cliente.Caption:= '...';
  end;

end;

procedure TFr_devolucao_consignacao.monta_sgx;
begin
//  sgx.ColWidths[0]:=0;
  sgx.Cells[1,0]:= 'CÓDIGO';
  sgx.Cells[2,0]:= 'PRODUTO';
  sgx.Cells[3,0]:= 'QTD';
  sgx.Cells[4,0]:= 'PREÇO';
  sgx.Cells[5,0]:= 'TOTAL';
  sgx.ColWidths[6]:=0;
  sgx.ColWidths[7]:=0;

end;

procedure TFr_devolucao_consignacao.mostra_campos(prefixo: ShortString);
var
  i: integer;
  campo, campo1: String;
begin
  Screen.Cursor := crSQLWait;

  for i:=0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo:= TsEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TsEdit(FindComponent(campo)).Text := q_devolucao1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TMaskEdit then
      begin
        campo:= TMaskEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TMaskEdit(FindComponent(campo)).Text := q_devolucao1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsComboEdit then
      begin
        campo:= TsComboEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsComboEdit(FindComponent(campo)).Text :=q_devolucao1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsCurrencyEdit then
      begin
        campo:= TsCurrencyEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_devolucao1.fieldbyname(campo1).AsFloat;
      end
      else
      if Components[i] is TComboBox then
      begin
        campo:= TComboBox(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TComboBox(FindComponent(campo)).ItemIndex := q_devolucao1.fieldbyname(campo1).AsInteger;
      end
      else
      if Components[i] is TsDateEdit then
      begin
        campo:= TsDateEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TsDateEdit(FindComponent(campo)).Date := q_devolucao1.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end;//end do for
//  Prtot_bruto.Value := q_devolucao1.fieldbyname('tot_bruto').AsFloat;

  Lbnom_cliente.Caption:=q_devolucao1.fieldbyname('nom_cliente').AsString;
//  Lbnom_usuario.Caption:= q_venda1.fieldbyname('nome').AsString;
//  Lbnom_fop.Caption:= q_venda1.fieldbyname('nom_fop').AsString;




  Screen.Cursor := crDefault;

end;


procedure TFr_devolucao_consignacao.readonly_false(prefixo: ShortString);
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=false
{      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=false}
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=false
{      else
      if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly:=false}
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=false;

    end;
  end;
  sgx.Options := sgx.Options + [goEditing];

end;

procedure TFr_devolucao_consignacao.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=True
{      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=True}
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=True
{      else
      if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly:=True}
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=True;
    end;
  end;
  sgx.Options := sgx.Options - [goEditing];

end;

procedure TFr_devolucao_consignacao.sgxCellChanging(Sender: TObject; OldRow, OldCol,
  NewRow, NewCol: Integer; var Allow: Boolean);
begin
 //quando estiver mudando
 //  col:= sgx.Col;
 //  lin:= sgx.Row;
 //  linmax:= sgx.RowCount;

{  If edit_sg = 'N' then
     Exit;

  if (col=3) and (sgx.Cells[1,lin] <> '') then
  begin
    if ((sgx.Cells[3,lin]='') or (sgx.Cells[3,lin]='0')) then
    begin
      sgx.cells[3,lin]:= '1';
      sgx.Col:=3;
      dao.msg('O campo Qtd não pode ficar vazio ou 0 !');
      exit;
    end;


  end;}

end;

procedure TFr_devolucao_consignacao.sgxCellsChanged(Sender: TObject; R: TRect);
begin
  //quando a celula for alterada

//  col:= sgx.Col;
//  lin:= sgx.Row;
  linmax:= sgx.RowCount;

{  If edit_sg = 'N' then
     Exit;

    sgx.Cells[5,lin]:= formatfloat('0.00',FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[4,lin],0));
  if edit_sg = 'S' then
  begin
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
  end;
 }
end;

procedure TFr_devolucao_consignacao.sgxClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;
  scroll_sgx;
end;

procedure TFr_devolucao_consignacao.sgxExit(Sender: TObject);
begin
//  Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
//  Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));

end;

procedure TFr_devolucao_consignacao.sgxKeyPress(Sender: TObject;
  var Key: Char);
var
  qtd_char:integer;
  qtd, cod, tamanho : String;

begin
{  col:= sgx.Col;
  lin:= sgx.Row;
//felipe  linmax:= sgx.RowCount;

  If edit_sg = 'N' then
     Exit;


  if edit_sg = 'S' then
  begin
    if key = #46 then
      if (col=1) then
      begin
        sgx.Cells[2,lin]:= '';
      end;
  end;
  If edit_sg = 'S' then
  begin
    if (key=#13) then
    begin
      if (SGX.Col = 1) then
        if (sgx.Cells[1,lin]='') then
        begin
          busca_produto;
          if Fr_localizar.Qu_localizar.Active then
          begin
            sgx.Cells[2,lin]:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
            sgx.Cells[3,lin]:= '1';
            sgx.Cells[4,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
            sgx.Cells[5,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);

            if Fr_localizar.Qu_localizar.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[6,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
              end;
            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];

           sgx.Col:= 3;
          end;
        end
        else
        if (Length(sgx.Cells[1,lin])<12) then
        begin
           busca_produto_unitario(False, sgx.Cells[1,lin]);
           sgx.Cells[6,lin] := '';

            if dao.Q1.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[6,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
              end;
            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];


          if dao.Q1.RecordCount >= 1 then
            if edit_sg = 'S' then
            begin
              if (SGX.Col) = 3 then //se for ultima coluna insere linha nova.
                if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
                begin
                  sgx.Row:= sgx.RowCount - 1;
                  sgx.Col := 1;
                end
                else
                begin
                  InsLinha(SGX);
                  SGX.Col:= 1;
                end;
              end;



        end
        else
        begin
          busca_produto_unitario(true, sgx.Cells[1,lin]);


        end
        else
          if SGX.Col = 3 then
            if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
            begin
              sgx.Row:= sgx.RowCount-1;
              sgx.Col:= 1;
            end
            else
            begin
              InsLinha(sgx);
              SGX.Col:= 1;
            end;

          if sgx.Cells[1, sgx.Row] <> '' then
          begin
            dao.Geral1('select v2.cod_produto, v2.id_cor, v2.id_tamanho, v2.qtd, v2.qtd_devolvida, p.nom_produto from vendas2 v2 '+
                       'left join produto p on p.cod_produto=v2.cod_produto '+
                       'where v2.cod_produto='+ QuotedStr(sgx.Cells[1,sgx.row])+' and v2.id_cor='+ QuotedStr(FrSel_Atributo.Gdid_Cor.Text) +
                       ' and v2.id_tamanho='+ QuotedStr(FrSel_Atributo.Gdid_tamanho.Text)+' and v2.numdoc= '+ QuotedStr(Prnum_consignacao.Text));

            if dao.Q1.RecordCount <= 0 then
            begin
              dao.msg('O produto '+dao.q1.fieldbyname('nom_produto').AsString+ ' não consta na Consignação Nº: '+Prnum_consignacao.Text+#13+
                        '                       ou                  '+#13+
                        '            este Produto já foi Devolvido! ');
              sgx.Cells[1,sgx.row] := '';
              sgx.Cells[2,sgx.row] := '';
              sgx.Cells[3,sgx.row] := '';
              sgx.Cells[4,sgx.row] := '';
              sgx.Cells[5,sgx.row] := '';
              sgx.Cells[6,sgx.row] := '';
              sgx.Cells[7,sgx.row] := '';
              sgx.Row:= sgx.row;
              exit;
            end;

            if (strtofloat(sgx.Cells[3,sgx.row])) > (dao.Q1.FieldByName('qtd').AsFloat - dao.Q1.FieldByName('qtd_devolvida').AsFloat) then
            begin
              dao.msg('A Quantidade Devolvida é superior a Qtd que consta na Consignação'+#13+
                        'que é de '+dao.Q1.fieldbyname('qtd').AsString);
              sgx.Cells[3,sgx.row]:='1';
              sgx.Row:= sgx.row;
              sgx.col:= 3;
              exit;
            end;
          end;
    end;

  end;

  SGX:= TAdvStringGrid(Sender);
  if (SGX.Col = 3) or (SGX.Col = 4) or (SGX.Col = 5) or (SGX.Col = 6) or (SGX.Col = 7) or (SGX.Col = 8) then
  begin
     if Key = '.' then
        Key:= ',';
     if (Key = ',') and (pos(',', SGX.Cells[SGX.RealCol, SGX.Row]) > 0) then
        Key:= #0;

     if not(Key in['0'..'9', ',', #8, #13]) then//Verifica se foi digitado algo diferente
     begin                                      //do que 0 a 9 ou ','
        beep;
        Key:= #0;
     end;
{     if sgx.Col = 3 then
     begin
       decimalseparator:='.';
       qtd:= sgx.Cells[3,lin];
       sgx.Cells[5,lin]:= floattostr(FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[4,lin],0));
       decimalseparator:=',';
     end;}
 { end;
 }

end;

procedure TFr_devolucao_consignacao.sgxRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
//  col:= sgx.Col;
//  lin:= sgx.Row;
//felipe  linmax:= sgx.RowCount;
  if (SGX.Col = 0) then
  begin
    sgx.col := 1;
  end;

end;

procedure TFr_devolucao_consignacao.sgxSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
//  col:= sgx.Col;
  lin:= ARow;
  linmax:= sgx.RowCount-1;

{  if (ACol = 4) or (ACol = 5) or (Acol = 2) then
  begin
    sgx.Options := sgx.Options - [goEditing]
  end
  else
  begin
    sgx.Options := sgx.Options + [goEditing];
  end;}



{  if (sgx.Col=4) or (sgx.Col=5) then
    col:=3;}
end;

procedure TFr_devolucao_consignacao.FormShow(Sender: TObject);
begin
  sgx.Options := sgx.Options - [goEditing];
  Sgx.Clear;
  Sgx.RowCount:=2;

  edit_sg:= 'N';

  EditarSGX:=false;
//  sgx.ColWidths[0]:=0;
  sgx.Cells[1,0]:= 'CÓDIGO';
  sgx.Cells[2,0]:= 'PRODUTO';
  sgx.Cells[3,0]:= 'QTD';
  sgx.Cells[4,0]:= 'PREÇO';
  sgx.Cells[5,0]:= 'TOTAL';
  sgx.ColWidths[6]:=0;
  sgx.ColWidths[7]:=0;
  mform:= 'dev_consignacao';
  readonly_true('Pr');

  BtConsig.Caption:= 'localizar'+#13+'Consignações'+#13+'do Cliente';
  Gbdados.Enabled:= false;
  Gbdad1.Enabled:= false;
  Gbdad2.Enabled:= false;
end;

procedure TFr_devolucao_consignacao.Prcod_clienteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_dev_consignacao_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo,6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i:=0 to 5 do
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

procedure TFr_devolucao_consignacao.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if key=#13 then
  begin
    if (Prcod_cliente.Text='') and (BtNov.Enabled=false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_dev_consignacao_cliente';
      chamou_cadastro := 'Fr_cliente';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo,6);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'CNPJ';
      Campos_combo[3] := 'CPF';
      Campos_combo[4] := 'Cidade';

      for i:=0 to 5 do
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

//    SelectNext(sender as TWinControl, true,true);
    Btnovdm.SetFocus;
    key:=#0;
  end;
end;

procedure TFr_devolucao_consignacao.Prdta_consignacaoExit(Sender: TObject);
var
  MyRect: TGridRect;
begin
  if (Prnum_consignacao.Text <> '') and (Prdta_consignacao.Text <> '  /  /    ') then
  begin
    dao.Geral1('select numdoc, dtadoc, v1.cod_cliente, c.nom_cliente from vendas1 v1 '+
               'left join cliente c on c.cod_cliente=v1.cod_cliente '+
               'where consignacao='+QuotedStr('1')+' and numdoc='+QuotedStr(Prnum_consignacao.Text)+ ' and dtadoc = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_consignacao.Date)));

    if dao.Q1.RecordCount <= 0 then
    begin
      dao.msg('NÃO FOI ENCONTRADO UMA CONSIGNAÇÃO COM ESTE NUMERO NA DATA INFORMADA!');
      Prnum_consignacao.SetFocus;
      exit;
    end
    else
    begin
      Prcod_cliente.Text:= dao.Q1.fieldbyname('cod_cliente').AsString;
      LBnom_cliente.Caption:= dao.Q1.fieldbyname('nom_cliente').AsString;
      Btnovdm.SetFocus;
//      sgx.Col:=1;
//      sgx.Row:=1;
    end;
  end;

end;

procedure TFr_devolucao_consignacao.Prnum_consignacaoKeyPress(
  Sender: TObject; var Key: Char);
begin


  if key= #13 then
  begin
    selectNext(sender as TWinControl, true, true);
    key:= #0;
  end;
end;

procedure TFr_devolucao_consignacao.baixa_qtd_devolvida(q_devolver, tipo, n_doc, c_cli, c_pro, id_cor, id_tamanho: String);//tipo e=entrada s=saida
var
  i : integer;
  qtd_devolver : real;// armazena a qtd que sera devolvida
  qtd_devolvida : real;//armazena a qtd já devolvida do produto
  qtd_produto: real;//armazena a qtd do produto que foi lançada na venda
  qtd_devolver_calc : real; //quantidade a devolver já calculada
  qtd_devolver_calc_conv : String;//quntidade a devolver convertida
  resto: real;
  grade: String;
begin
  qtd_devolver:= 0;
  qtd_devolvida:= 0;
  qtd_produto:= 0;
  resto:= 0;

  dao.Geral2('select grade from produto where cod_produto='+QuotedStr(c_pro));
  if dao.q2.fieldbyname('grade').AsString = '0' then
     grade := 'S'
  else
     grade := 'N';

  if grade = 'S' then
     dao.Geral1('select sum(qtd) as qtd, sum(qtd_devolvida) as qtddev from vendas2 where cod_produto = '+QuotedStr(c_pro)+' and id_cor='+QuotedStr(id_cor)+' and id_tamanho='+QuotedStr(id_tamanho)+ ' and numdoc ='+QuotedStr(n_doc))
  else
     dao.Geral1('select sum(qtd) as qtd, sum(qtd_devolvida) as qtddev from vendas2 where cod_produto = '+QuotedStr(c_pro)+' and numdoc ='+QuotedStr(n_doc));

  qtd_devolver:= strtofloat(q_devolver);
  qtd_devolvida:= dao.Q1.fieldbyname('qtddev').AsFloat;
  qtd_produto:= dao.Q1.fieldbyname('qtd').AsFloat;


  qtd_devolver_calc:=  qtd_devolver - resto;
  qtd_devolver_calc_conv := floattostr(qtd_devolver_calc);

  dao.Q1.First;
  while not(dao.Q1.Eof) do
  begin
     if (qtd_produto-qtd_devolvida) < qtd_devolver then
        resto:= resto + (qtd_produto-qtd_devolvida) - qtd_devolver
     else
        resto:= 0;

     if grade = 'S' then
        dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida + '+ qtd_devolver_calc_conv +' where numdoc='+quotedStr(n_doc)+' and cod_cliente='+quotedStr(c_cli)+' and cod_produto='+quotedStr(c_pro)+' and id_cor='+ QuotedStr(id_cor)+' and id_tamanho='+ QuotedStr(id_tamanho))
     else
        dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida + '+ qtd_devolver_calc_conv +' where numdoc='+quotedStr(n_doc)+' and cod_cliente='+quotedStr(c_cli)+' and cod_produto='+quotedStr(c_pro));

    dao.Q1.Next;
  end;

end;

procedure TFr_devolucao_consignacao.Prnum_consignacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    //ShowMessage('O nº da tecla: '+Char(ORD(Key))+' é => '+IntToStr(key));

end;

function TFr_devolucao_consignacao.confere_produto: boolean;
var
  i: integer;
  msg_contem, msg_qtd_superior, msg: String;
begin
  Result:= true;
  if Dmcod_produto.Text <> '' then
  begin
    dao.Geral2('select grade from produto where cod_produto='+QuotedStr(Dmcod_produto.Text));

    if dao.Q2.FieldByName('grade').AsString = '0' then
    begin
      dao.Geral2('select v2.cod_produto, v2.id_cor, v2.id_tamanho, sum(v2.qtd) as totqtd, sum(v2.qtd_devolvida) as totqtddev, v2.preco, p.nom_produto, t.tamanho, c.cor from vendas2 v2 '+
                 'left join produto p on p.cod_produto=v2.cod_produto '+
                 'left join tamanho t on t.id= v2.id_tamanho '+
                 'left join cores c on c.id= v2.id_cor '+
                 'where v2.cod_produto='+ QuotedStr(Dmcod_produto.Text)+' and v2.id_cor='+ QuotedStr(Dmid_cor.Text) +
                 ' and v2.id_tamanho='+ QuotedStr(Dmid_Tamanho.Text)+' and v2.numdoc= '+ QuotedStr(Prnum_consignacao.Text)+
                 ' group by v2.cod_produto, v2.id_cor,  v2.id_tamanho, v2.preco, p.nom_produto, t.tamanho, c.cor ');
    end
    else
    begin
      dao.Geral1('select v2.cod_produto, v2.preco, p.nom_produto from vendas2 v2 '+
                 'left join produto p on p.cod_produto = v2.cod_produto '+
                 'where v2.cod_produto='+QuotedStr(Dmcod_produto.Text)+' and numdoc='+QuotedStr(Prnum_consignacao.Text));

      dao.Geral2('select v2.cod_produto, sum(v2.qtd) as totqtd, sum(v2.qtd_devolvida) as totqtddev from vendas2 v2 '+
                 'where v2.cod_produto='+ QuotedStr(Dmcod_produto.Text)+' and v2.numdoc= '+ QuotedStr(Prnum_consignacao.Text)+
                 ' group by v2.cod_produto ');


    end;

    if dao.Q1.RecordCount <= 0 then
    begin
      dao.msg('ESTE PRODUTO NÃO CONSTA NA CONSIGNAÇÃO!');
      Result:= false;
    end;

    if (Dmqtd.value > (dao.Q2.FieldByName('totqtd').AsFloat - dao.Q2.FieldByName('totqtddev').AsFloat)) then
    begin
      dao.msg('QUANTIDADE SUPERIOR A ADQUIRIDA NA CONSIGNAÇÃO'+#13+'QUANTIDADE MÁXIMA A SER DEVOLVIDA: '+FormatFloat('###,##0.00',(dao.Q2.FieldByName('totqtd').AsFloat - dao.Q2.FieldByName('totqtddev').AsFloat)));
      Result:= false;
    end;
  end;
end;

procedure TFr_devolucao_consignacao.Dmcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_dev_consignacao_produto';
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
 // Fr_localizar.Free;
  if Fr_localizar.Qu_localizar.RecordCount <=0 then
  begin
    Dmcod_produto.Text:='';
    Dmcod_produto.SetFocus;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_devolucao_consignacao.Dmcod_produtoExit(Sender: TObject);
begin

{  if trim(dmcod_produto.Text) = '' then
     Lbnom_produto.Caption:= '...';

  if Dmcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto='+QuotedStr(Dmcod_produto.Text));
      Lbnom_produto.Caption:= dao.Q2.fieldbyname('nom_produto').AsString;
  end;}

end;

procedure TFr_devolucao_consignacao.Dmcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
  usa_leitor: Boolean;
begin
  if key=#13 then
  begin
    if (Length(dmcod_produto.Text) < 12) and (dmcod_produto.Text <> '') then
        busca_produto_unitario(False, dmcod_produto.Text)
    else
    if (dmcod_produto.Text <> '') then
    begin
        busca_produto_unitario(true, dmcod_produto.Text);
        usa_leitor:= true;
    end;
    If (dmcod_produto.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_dev_consignacao_produto';
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

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

{    if Fr_localizar.Qu_localizar.Active then
      if Fr_localizar.Qu_localizar.RecordCount <=0 then
      begin
        Dmcod_produto.Text:='';
        Dmcod_produto.SetFocus;
      end;}

    if dmcod_produto.Text <> '' then
    begin
      dao.Geral1('select grade from produto where cod_produto='+QuotedStr(dmcod_produto.Text));
      if dao.Q1.FieldByName('grade').AsString = '1' then
         paAtributo.Enabled:= false
      else
         paAtributo.Enabled:= true;

      if (paAtributo.Enabled=true) then
        dmid_cor.SetFocus
      else
        Dmqtd.SetFocus;
    end;

    if usa_leitor then
        Btgradm.Click;

    key:=#0;
  end;
end;

procedure TFr_devolucao_consignacao.Dmid_corButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Cor';

  chamou_pesquisa:= 'fr_cor';
  chamou_form := 'fr_dev_consignacao_cor';
  chamou_cadastro := 'fr_cor';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cores';
  Fr_localizar.BT_cadastro.Visible:= true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

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

procedure TFr_devolucao_consignacao.Dmid_corKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if key=#13 then
  begin
    if (dmid_Cor.Text ='') and (Btnovdm.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cor';

      chamou_pesquisa:= 'fr_cor';
      chamou_form := 'fr_dev_consignacao_cor';
      chamou_cadastro := 'fr_cor';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cores';
      Fr_localizar.BT_cadastro.Visible:= true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Cor';

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
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;

end;

procedure TFr_devolucao_consignacao.Dmid_TamanhoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Tamanho';

  chamou_pesquisa:= 'fr_tamanho';
  chamou_form := 'fr_dev_consignacao_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+' Tamanhos';
  Fr_localizar.BT_cadastro.Visible:= true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

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

procedure TFr_devolucao_consignacao.Dmid_TamanhoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if key=#13 then
  begin
    if (dmid_tamanho.Text ='') and (Btnovdm.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Tamanho';

      chamou_pesquisa:= 'fr_tamanho';
      chamou_form := 'fr_dev_consignacao_tamanho';
      chamou_cadastro := 'fr_tamanho';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+' Tamanhos';
      Fr_localizar.BT_cadastro.Visible:= true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Tamanho';

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
    Dmqtd.SetFocus;
    //SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_devolucao_consignacao.BtnovdmClick(Sender: TObject);
begin
  if btnov.Enabled = true then
  begin
    dao.msg('Para Devolver um Item é necessario clicar no botão Incluir');
    exit;
  end;

  if (Prnum_consignacao.Text = '') or (Prdta_consignacao.Text = '') then
  begin
    dao.msg('ANTES DE PROSSEGUIR PREENCHA OS CAMPOS Nº CONSIGNAÇÃO E DATA CONSIGNAÇÃO');
    Prnum_consignacao.setfocus;
    exit;
  end;


  Btnovdm.Enabled:= false;
  btaltdm.Enabled:= false;
  btgradm.Enabled:= true;
  btcandm.Enabled:= true;
  btexcdm.Enabled:= false;
  Gbdados.Enabled:= true;
  modo_insert_dm:= true;

  Dmcod_produto.Clear;
  Lbnom_produto.Caption:='...';
  Dmqtd.Value:= 1;
  Dmid_cor.Clear;
  LbCor.Caption:='...';
  Dmid_Tamanho.Clear;
  Lbtamanho.Caption:='...';

  Dmcod_produto.SetFocus;
end;

procedure TFr_devolucao_consignacao.btaltdmClick(Sender: TObject);
begin
  Btnovdm.Enabled:= false;
  btaltdm.Enabled:= false;
  btgradm.Enabled:= true;
  btcandm.Enabled:= true;
  btexcdm.Enabled:= false;
  Gbdados.Enabled:= true;
  modo_insert_dm:= false;
  qtd_anterior := Dmqtd.Text;
  produto_anterior := Dmcod_produto.Text;
  cor_anterior:= Dmid_cor.Text;
  tamanho_anterior:= Dmid_Tamanho.Text;
  Dmcod_produto.SetFocus;
end;

procedure TFr_devolucao_consignacao.btgradmClick(Sender: TObject);
var
  grade : String;
begin
  if (Dmqtd.Text='') or (Dmqtd.Value=0) then
  begin
    dao.msg('O Campo Quantidade deve ser preenchido!');
    Dmqtd.SetFocus;
    exit;
  end;
  if paAtributo.Enabled=true then
  begin
    if (LbCor.Caption='') or (LbCor.Caption='...') then
    begin
      dao.msg('informe a Cor do Produto!');
      dmid_cor.SetFocus;
      exit;
    end;

    if (Lbtamanho.Caption='') or (Lbtamanho.Caption='...') then
    begin
      dao.msg('informe o Tamanho do Produto!');
      dmid_Tamanho.SetFocus;
      exit;
    end;
  end;
  if confere_produto = false then
  begin
    Dmcod_produto.Text := '';
    Lbnom_produto.Caption:='';
    Dmcod_produto.SetFocus;
    Dmid_cor.Text:='';
    LbCor.Caption:='...';
    Dmid_Tamanho.Text:='';
    Lbtamanho.Caption:='...';
    Dmqtd.value := 0;
    exit;
  end
  else
  begin
    dao.Geral1('select v2.cod_produto, v2.preco from vendas2 v2 '+
               'where v2.cod_produto='+QuotedStr(Dmcod_produto.Text)+' and numdoc='+QuotedStr(Prnum_consignacao.Text));
    Dmpreco.Value := dao.Q1.fieldbyname('preco').AsFloat;
  end;

  if modo_insert_dm = false then
  begin
    dao.Geral2('select grade from produto where cod_produto='+QuotedStr(produto_anterior));
    if dao.q2.fieldbyname('grade').AsString = '0' then
       grade := 'S'
    else
       grade := 'N';
    if grade = 'S' then
       dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida - '+ qtd_anterior +' where numdoc='+quotedStr(Prnum_consignacao.Text)+' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(produto_anterior)+' and id_cor='+ QuotedStr(cor_anterior)+' and id_tamanho='+ QuotedStr(tamanho_anterior))
    else
       dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida - '+ qtd_anterior +' where numdoc='+quotedStr(Prnum_consignacao.Text)+' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(produto_anterior));
  end;

  if Dmcod_produto.Text <> '' then
  begin
     dao.Geral1('select grade from produto where cod_produto='+QuotedStr(Dmcod_produto.Text));
     if dao.q1.FieldByName('grade').AsString = '0' then
       baixa_qtd_devolvida(Dmqtd.Text ,'E', Prnum_consignacao.Text, Prcod_cliente.Text, Dmcod_produto.Text,Dmid_cor.Text,Dmid_Tamanho.Text)
     else
       baixa_qtd_devolvida(Dmqtd.Text ,'E', Prnum_consignacao.Text, Prcod_cliente.Text, Dmcod_produto.Text,'','');

  end
  else
  begin
    dao.msg('Selecione um Produto da Tabela Acima para dar Baixa!');
    Exit;
  end;


  Btnovdm.Enabled:= true;
  btaltdm.Enabled:= true;
  btgradm.Enabled:= false;
  btcandm.Enabled:= false;
  btexcdm.Enabled:= true;
  Gbdados.Enabled:= false;

  if modo_insert_dm then
  begin
    Sgx.EditMode:=true;
    id:= dao.insert('Dm','dev_consig2','id',Fr_devolucao_consignacao,'gen_dev_consig2');
    insere_reg_sgPro('1');

  end
  else
  begin
    Sgx.EditMode:=true;
    dao.update('dev_consig2','id',sgx.Cells[0,lin],'Dm',Fr_devolucao_consignacao);
    insere_reg_sgPro('2');
  end;
  Prtot_bruto.Value:= totaliza_devolucao;
  Btnovdm.SetFocus;

end;

procedure TFr_devolucao_consignacao.btcandmClick(Sender: TObject);
begin
  Btnovdm.Enabled:= true;
  btaltdm.Enabled:= true;
  btgradm.Enabled:= false;
  btcandm.Enabled:= false;
  btexcdm.Enabled:= true;
  Gbdados.Enabled:= false;




end;

procedure TFr_devolucao_consignacao.insere_reg_sgPro(tipo: String);
begin
  if tipo='1' then // 1= insert
  begin
    if Sgx.cells[0,linMax]<> '' then
    begin
      Sgx.AddRow;
      linmax:= Sgx.RowCount-1; //linMax+1;
    end;

    Sgx.EditorMode:=true;
    sgx.Cells[0,linMax]:= id;
    Dmid.Text:= id;
    sgx.Cells[1,linMax]:= dmcod_produto.Text;
    sgx.Cells[2,linMax]:= Lbnom_produto.Caption;
    sgx.Cells[3,linMax]:= dmqtd.Text;
    sgx.Cells[4,linMax]:= FormatFloat('###,##0.00', Dmpreco.Value);
    sgx.Cells[5,linMax]:= FormatFloat('###,##0.00', Dmpreco.Value * Dmqtd.Value);
    sgx.Cells[6,linMax]:= dmid_cor.Text;
    sgx.Cells[7,linMax]:= dmid_Tamanho.Text;

    sgx.EditorMode:=false;
    sgx.Row:=sgx.RowCount-1;
    sgx.RowSelect[Sgx.RowCount-1];
  end
  else
  if tipo='2' then
  begin
    sgx.EditorMode:=true;
    sgx.Cells[0,lin]:= id;
    Dmid.Text:= id;
    sgx.Cells[1,lin]:= dmcod_produto.Text;
    sgx.Cells[2,lin]:= Lbnom_produto.Caption;
    sgx.Cells[3,lin]:= dmqtd.Text;
    sgx.Cells[4,lin]:= FormatFloat('###,##0.00', Dmpreco.Value);
    sgx.Cells[5,lin]:= FormatFloat('###,##0.00', Dmpreco.Value * Dmqtd.Value);
    sgx.Cells[6,lin]:= dmid_cor.Text;
    sgx.Cells[7,lin]:= dmid_Tamanho.Text;

    sgx.EditorMode:=false;
    sgx.Row:=lin;
    sgx.RowSelect[lin];

  end;
end;



procedure TFr_devolucao_consignacao.BtnovdmEnter(Sender: TObject);
begin
  if Btnovdm.Focused then
  begin
    Btnovdm.Brush.Color:= clred;
  end;
end;

procedure TFr_devolucao_consignacao.DmqtdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    btgradm.SetFocus;
    key:= #0;
  end;

end;

procedure TFr_devolucao_consignacao.Dmid_corExit(Sender: TObject);
begin
  if trim(Dmid_cor.Text) = '' then
     LbCor.Caption:= '...';

  if Dmid_cor.Text <> '' then
  begin
    dao.Geral2('select cor from cores where id='+QuotedStr(Dmid_Cor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.Q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Dmid_cor.Text:= '';
      Dmid_cor.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_devolucao_consignacao.Dmid_TamanhoExit(Sender: TObject);
begin
  if trim(Dmid_Tamanho.Text) = '' then
     Lbtamanho.Caption:= '...';

  if Dmid_Tamanho.Text <> '' then
  begin
    dao.Geral2('select tamanho from tamanho where id='+QuotedStr(Dmid_Tamanho.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbtamanho.Caption := dao.Q2.fieldbyname('tamanho').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Dmid_Tamanho.Text:= '';
      Dmid_Tamanho.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_devolucao_consignacao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if KEY = #27 then
  begin
    close;
  end
end;

procedure TFr_devolucao_consignacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Você deve Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_devolucao_consignacao.limpa_sgx;
begin





end;

function TFr_devolucao_consignacao.totaliza_devolucao : real;
begin
  Result :=  sgx.ColumnSum(4,1,sgx.RowCount);
end;

procedure TFr_devolucao_consignacao.SpeedButton1Click(Sender: TObject);
begin
  Paconsignacoes.Visible:= false;
end;

procedure TFr_devolucao_consignacao.TVconsigClick(Sender: TObject);
var
  f:String;
  nivel: integer;
begin
  nivel := TVconsig.Selected.Level;
  f := TVconsig.Selected.Text;


end;

procedure TFr_devolucao_consignacao.TVconsigDblClick(Sender: TObject);
var
  valor: String;
begin
  if TVconsig.Selected.Level = 0 then
  begin
    valor:= TVconsig.Selected.Text;
    Prnum_consignacao.Text:= copy(valor,1,6);
    Prdta_consignacao.Text:= copy(valor,15,10);
    Paconsignacoes.Visible:= false;
  end;
end;

procedure TFr_devolucao_consignacao.BtConsigClick(Sender: TObject);
var
  pai: TTreeNode;
begin
  if Prcod_cliente.Text = '' then
  begin
    dao.msg('Escolha um Cliente');
    Prcod_cliente.SetFocus;
    exit;
  end;


  dao.Geral1('select * from vendas1 where cod_cliente='+QuotedStr(Prcod_cliente.Text)+' and consignacao = '+QuotedStr('1'));
  if dao.Q1.RecordCount <= 0 then
  begin
    dao.msg('Não Foi Encontrado Consignações para este Cliente!');
    exit;
  end;

  while not(dao.Q1.Eof) do
  begin
    pai := TVconsig.Items.Add(nil, FMFUN.enchezero(dao.q1.fieldbyname('numdoc').AsString,6)+' - '+FMFUN.enchevazio(FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dtadoc').AsDateTime),15)+' - '+FMFUN.enchevazio(FormatFloat('###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat),20));
    dao.Geral2('select v2.*, p.nom_produto from vendas2 v2 '+
               'left join produto p on p.cod_produto=v2.cod_produto '+
               'where numdoc= '+QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));
    while not(dao.Q2.Eof) do
    begin
      TVconsig.Items.AddChild(pai,dao.Q2.fieldbyname('cod_produto').AsString+'/'+dao.Q2.fieldbyname('nom_produto').AsString+'  -   '+ dao.Q2.fieldbyname('qtd').AsString);
      dao.Q2.Next;
    end;
    dao.Q1.Next;
  end;
  Paconsignacoes.Height := 397;

  Paconsignacoes.Visible:= true;


end;

procedure TFr_devolucao_consignacao.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
     LBnom_cliente.Caption:= '...';

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente='+QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LBnom_cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text:= '';
      Prcod_cliente.SetFocus;
      Exit;
    end;

  end;


end;

procedure TFr_devolucao_consignacao.btexcdmClick(Sender: TObject);
var
  grade : String;
begin
  try
    if (BtNov.Enabled=true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
//      PcEntrada.ActivePageIndex:=0;
      btnov.SetFocus;
      exit;
    end;

    if sgx.Cells[0,lin] = '' then
    begin
      showmessage('Deve ser Selecionado um Produto para Excluir!');
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Produto da Devolução?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      dao.Geral2('select grade from produto where cod_produto='+QuotedStr(Dmcod_produto.Text));
      if dao.q2.fieldbyname('grade').AsString = '0' then
         grade := 'S'
      else
         grade := 'N';
      if grade = 'S' then
         dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida - '+ Dmqtd.Text +' where numdoc='+quotedStr(Prnum_consignacao.Text)+' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(Dmcod_produto.Text)+' and id_cor='+ QuotedStr(Dmid_cor.Text)+' and id_tamanho='+ QuotedStr(Dmid_Tamanho.Text))
      else
         dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida - '+ Dmqtd.Text +' where numdoc='+quotedStr(Prnum_consignacao.Text)+' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(Dmcod_produto.Text));

      DeletaLinha(lin);
      limpa_campos('Dm');
      dao.msg('Produto excluido com sucesso!');
    end;
    except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir o Produto da Devolução Mercadoria!'+#13+
                 e.message);

      dao.envia_email_suporte('Erro ao excluir produto '+Lbnom_produto.Caption+' da Devolução Mercadoria 2: '+Prnum_devolucao.Text+'   - Ciente : '+LBnom_cliente.Caption  + #13 + e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao excluir Arquivo','felipesans@terra.com.br','','','');
    end;
  end;

end;

procedure TFr_devolucao_consignacao.DeletaLinha(Linha: Integer);
var
  i, j: Integer;
begin
  with sgx do
  begin
    for i:= linha to RowCount do
      Rows[i]:= Rows[i+1];
    if RowCount >2 then
       RowCount:=RowCount-1;
  end; // With Grade

  If sgx.Row=1 then
  begin
    monta_sgx;
  end;

end;



procedure TFr_devolucao_consignacao.scroll_sgx;
begin
  if (lin <> 0) and not(sgx.EditMode) then
  begin
    Dmid.Text:= sgx.Cells[0,lin];
    if Dmid.Text <> '' then
    begin
      Dmcod_produto.Text:= sgx.Cells[1,lin];
      Lbnom_produto.Caption:= sgx.Cells[2,lin];
      Dmqtd.Text:= sgx.Cells[3,lin];
      Dmpreco.Text := sgx.Cells[4,lin];

      if sgx.Cells[1,lin] <> '' then
        dao.Geral1('select grade from produto where cod_produto='+QuotedStr(sgx.Cells[1,lin]));
      if dao.Q1.FieldByName('grade').AsString = '1' then
         paAtributo.Visible:= false
      else
         paAtributo.Visible:= true;


      if sgx.Cells[6,lin] <> '' then
      begin
        dao.Geral1('select * from cores where id = '+QuotedStr(sgx.Cells[6,lin]));
        Dmid_cor.Text:= sgx.Cells[6,lin];
        LbCor.Caption := dao.Q1.fieldbyname('cor').AsString;
      end;


      if sgx.Cells[7,lin] <> '' then
      begin
        dao.Geral1('select * from tamanho where id = '+QuotedStr(sgx.Cells[7,lin]));
        Dmid_Tamanho.Text:= sgx.Cells[7,lin];
        Lbtamanho.Caption:= dao.Q1.fieldbyname('tamanho').AsString;
      end;
    end;
  end;

end;

procedure TFr_devolucao_consignacao.MontaComprovanteDevolucao;
var
  MSWord: variant;
  nom_arquivo, doc: String;
begin
  dao.Geral1('select d2.*,p.nom_produto from dev_consig2 d2 '+#13+
             'left join produto p on p.cod_produto=d2.cod_produto '+
             'where d2.num_devolucao='+QuotedStr(Prnum_devolucao.Text));


//   MSWord := CreateOleObject('Word.Application');
//   MSWord.Documents.Open('c:\orbi\Relatorios\imp_venda.doc');
//   MSWord.Visible:=true;

   msword:=createoleobject('word.application');
   doc :=msword.documents.open('c:\orbi\relatorios\comp_devolucao_consig.doc');
   msword.visible:=true;


   MSWord.ActiveDocument.FormFields.Item('data').Result:= FormatDateTime('dd/mm/yyyy',Prdta_devolucao.Date);
   MSWord.ActiveDocument.FormFields.Item('numdoc').Result:= Prnum_devolucao.Text;
   MSWord.ActiveDocument.FormFields.Item('cliente').Result:= LBnom_cliente.Caption;

   MSWord.ActiveDocument.Tables.Item(1).Select;

   FRPRI.NumTab(MSWord,4,'');
   while not(dao.Q1.Eof) do
   begin
     FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.fieldbyname('nom_produto').AsString);
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('preco').AsFloat));
     FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('qtd').AsString);
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('sub_total').AsFloat));
     dao.Q1.Next;
   end;

   MSWord.ActiveDocument.Tables.Item(2).Select;

   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prtot_bruto.Value));
//   FRPRI.NumTab(MSWord, 2, Lbnom_fop.Caption);//forma de pagamento
//   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prdesconto.Value));
//   FRPRI.NumTab(MSWord, 2, Prprazo_pgto.Text);//forma de pagamento
//   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prvalor_credito_usado.Value));//forma de pagamento
//   FRPRI.NumTab(MSWord, 4, FormatFloat('###,##0.00', Prtot_liquido.Value));//forma de pagamento



   // SALVA O DOCUMENTO
   nom_arquivo:= 'comprovante devolucao'+ '.doc';
   DeleteFile(ExtractFilePath(ParamStr(0)) + 'Relatorios\' + nom_arquivo);
   MSWord.ActiveDocument.SaveAs(ExtractFilePath(ParamStr(0)) + 'Relatorios\' + nom_arquivo);

   MSWord.Visible:=true;

end;

procedure TFr_devolucao_consignacao.FechamentodeConsignao2Click(
  Sender: TObject);
begin
  Application.CreateForm(TFr_fec_consignacao, Fr_fec_consignacao);
  Fr_fec_consignacao.ShowModal;
end;

procedure TFr_devolucao_consignacao.ComprovantedeDevoluo1Click(
  Sender: TObject);
begin
  MontaComprovanteDevolucao;

end;

end.
