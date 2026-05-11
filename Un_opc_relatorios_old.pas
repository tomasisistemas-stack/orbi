unit Un_opc_relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, registry, Comobj,
  JvExStdCtrls, JvCheckBox, frxCross, frxClass, frxExportMail, RdPrint;

type
  TFr_opc_relatorios = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Pa_botoes: tsPanel;
    bt_imprimir: TsBitBtn;
    p4: TsGroupBox;
    Prfinalizado: TRadioButton;
    Praberto: TRadioButton;
    Prtodos: TRadioButton;
    p2: TsGroupBox;
    zzfaturado: TRadioButton;
    zznao_faturado: TRadioButton;
    zzfaturado_todos: TRadioButton;
    ordenar1: TsGroupBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    fR_RELATORIO: TfrxReport;
    codigo_fiscal: tsPanel;
    loja: tsPanel;
    cliente: tsPanel;
    produto: tsPanel;
    fornecedor: tsPanel;
    grupo: tsPanel;
    Prcod_cliente: TsComboEdit;
    Lbl_cliente: tsLabel;
    Lbnom_cliente: tsLabel;
    Prcod_produto: TsComboEdit;
    Lbl_produto: tsLabel;
    Lbnom_produto: tsLabel;
    Lbl_empresa: tsLabel;
    Prempresa: TsComboEdit;
    Lbempresa: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    Lbl_fornecedor: tsLabel;
    Lbfornecedor: tsLabel;
    Prcod_fiscal: TsComboEdit;
    Lbl_cod_fiscal: tsLabel;
    Lbnom_cod_fiscal: tsLabel;
    Prcod_grupo: TsComboEdit;
    LbNom_Grupo: tsLabel;
    Lbl_grupo: tsLabel;
    p1: tsPanel;
    cidade: tsPanel;
    uf: tsPanel;
    marca: tsPanel;
    Prcod_marca: TsComboEdit;
    Lb_marca: tsLabel;
    Lbnom_marca: tsLabel;
    Pruf: TsComboEdit;
    Lbl_uf: tsLabel;
    lbuf: tsLabel;
    Prcod_cidade: TsComboEdit;
    Lbl_cidade: tsLabel;
    LbNom_cidade: tsLabel;
    PRmostrar_produto_estoque_zerado: tsCheckbox;
    frmail: TfrxMailExport;
    transportadora: tsPanel;
    Prcod_transportadora: TsComboEdit;
    Label38: tsLabel;
    LbNom_transportadora: tsLabel;
    ordenar2: TsGroupBox;
    Alfabeticamente: TRadioButton;
    RadioButton2: TRadioButton;
    vendedor: tsPanel;
    Label3: tsLabel;
    Lbnom_representante: tsLabel;
    Prcod_representante: TsComboEdit;
    fop: tsPanel;
    Label4: tsLabel;
    lbfop: tsLabel;
    Prfop: TsComboEdit;
    Gbdata: TsGroupBox;
    Label1: tsLabel;
    Label2: tsLabel;
    Prdta_inicial: TsDateEdit;
    Prdta_final: TsDateEdit;
    RD: TRDprint;
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_cidadeButtonClick(Sender: TObject);
    procedure PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure Prcod_cidadeExit(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure PrempresaButtonClick(Sender: TObject);
    procedure PrempresaKeyPress(Sender: TObject;
  var Key: Char);
    procedure Prcod_fiscalButtonClick(Sender: TObject);
    procedure Prcod_fiscalExit(Sender: TObject);
    procedure Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure PrufButtonClick(Sender: TObject);
    procedure PrufKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure PrempresaExit(Sender: TObject);
    procedure PrufExit(Sender: TObject);
    procedure Prcod_marcaButtonClick(Sender: TObject);
    procedure Prcod_marcaExit(Sender: TObject);
    procedure Prcod_marcaKeyPress(Sender: TObject; var Key: Char);
    procedure fR_RELATORIOGetValue(const VarName: String;
      var Value: Variant);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Prcod_transportadoraKeyPress(Sender: TObject;
  var Key: Char);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure PrfopButtonClick(Sender: TObject);
    procedure PrfopKeyPress(Sender: TObject; var Key: Char);
    procedure PrfopExit(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure RDNewPage(Sender: TObject; Pagina: Integer);
  private
    procedure relatorio_posicao_estoque_preco_venda(codgrupo,
      codpro: String);
    procedure relatorio_auxiliar_compra(Modo: ShortString;  tipofonte: TTipoFonte);
    procedure configuraRD(fonteTamanho: TSize; tipoImpressora: TModelo;
      qtdcoluna, qtdlinha: integer; qtdLpp: TLinha; testaporta,
      usaGerenciador: boolean);
    { Private declarations }
  public
    { Public declarations }
    procedure busca_produto_unitario(leitor: boolean; cod_barras:String);


    {*******RELATORIOS DE LISTAGEM********}
    procedure monta_rel_cliente(cod_cidade : String; uf : String);
    procedure monta_rel_cliente_completo(cod_cidade, uf, loja: String);
    procedure relatorio_pauta_produto(c_fornecedor: String; c_grupo: String);
    procedure monta_rel_pauta_venda(cod_grupo, cod_fonecedor : String);
    procedure monta_rel_pauta_venda_est(cod_grupo, cod_fonecedor: String);


    {*******RELATORIOS DE ESTOQUE*****}
    procedure relatorio_posicao_estoque(codgrupo: String; codfor:String);//simplificado
    procedure relatorio_posicao_estoque_ind(codgrupo: String; codfor:String);//simplificado

    procedure relatorio_posicao_estoque_custo(codgrupo: String; codpro:String);


    procedure relatorio_posicao_estoque_venda(codgrupo: String; codpro, codfor:String);
    procedure relatorio_posicao_estoque_venda_ind(codgrupo: String; codpro, codfor:String);

    procedure relatorio_posicao_estoque_completo(c_fornecedor: String);
    procedure relatorio_posicao_estoque_completo_simplificado(c_fornecedor: String);

    procedure relatorio_posicao_estoque_completo_simulada(c_fornecedor: String);


    procedure relatorio_historico_movimentacao_produto(cod_produto : String; empresa: String);

    {*******RELATORIO DE VENDAS********}
    {Detalhados}
    procedure relatorio_vendas_cliente(dta_inicial: TDate; dta_final: TDate; cod_cliente : String; cod_empresa: String; cod_fornecedor: String);
    procedure relatorio_vendas_cliente_ind(dta_inicial: TDate; dta_final: TDate; cod_cliente : String; cod_empresa: String);//sem cor e tamanho
    procedure relatorio_vendas_periodo(dta_inicial : String; dta_final: String);
    procedure relatorio_vendas_periodo_data(dta_inicial : String; dta_final: String);
    procedure relatorio_vendas_fornecedor_loja(c_fornecedor: String; c_loja: String);
    procedure relatorio_vendas_vendedor(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: String);//relatorio por periodo agrupado por vendedor
    procedure relatorio_rankin_clientes;
    procedure relatorio_rankin_clientes_simplificado(dta_inicial: TDate; dta_final: TDate);
    {Simplificados}
    procedure relatorio_vendas_padrao(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: String);


    {*******RELATORIO DE ENTRADAS********}
    procedure relatorio_notas_entradas(dta_inicial : String; dta_final: String);
    procedure relatorio_notas_entradas_detalhada(dta_inicial, dta_final, cod_for, cod_marca, cod_grupo: String);

    {*******RELATORIO DE TRANSFERENCIAS********}
    procedure relatorio_transferencias(dta_inicial : String; dta_final: String; cod_fornecedor, cod_marca, cod_grupo, cod_empresa: String);



    {*******RELATORIO DE CONSIGNAÇÃO}
    procedure relatorio_consig(c_cliente : String; dta_inicial: String; dta_final: String);

    {*******RELATORIO DE FINANCEIRO}
    procedure relatorio_cheques_terceiro;
    procedure relatorio_contas_receber(dta_ini, dta_fin, cod_empresa, cod_representante, cod_cliente, cod_fop, finalizado: String);


    {*******RELATORIO TRANSPORTADORA******}
    procedure relatorio_controle_fretes_transportadora(c_transportadora : String; dta_inicial: String; dta_final: String);

    {*******RELATORIO TRANSPORTADORA******}
    procedure relatorio_solicitacao_compra(codfor, codgru: string);//relatorio de solicitacao de compra mediante posição estoque minimo

    {*******RELATORIO COMISSÃO******}
    procedure relatorio_comissao_venda(codrep, dta_inicial, dta_final, faturado: string);

  end;

var
  Fr_opc_relatorios: TFr_opc_relatorios;
  tipo_fonte:TTipoFonte;

implementation

uses Un_dao, Un_rel_cliente, UnPri, Un_localizar, Math, 
  UnFun, Un_dm, DB;

{$R *.dfm}

{ TFr_opc_relatorios }

procedure TFr_opc_relatorios.monta_rel_cliente(cod_cidade: String; uf : String);
var
  cmd : String;
begin
  cmd:= 'select cod_cliente, nom_cliente, cd.nom_cidade, telefone, cd.uf from cliente c '+
        'left join cidades cd on cd.cod_cidade=c.cod_cidade ';

  if PrCod_Cidade.Text <> '' then
  begin
    cmd:= cmd + 'where cod_cidade='+ QuotedStr(PrCod_Cidade.Text);
  end;
  {  if Pruf.text <> '' then
  begin
    cmd:= cmd + 'where cd.uf='+ QuotedStr(PrCod_Cidade.Text);
  end;}

  cmd := cmd + ' order by cd.nom_cidade, nom_cliente';

  Application.CreateForm(TFr_rel_cliente, Fr_rel_cliente);
  with Fr_rel_cliente.qu_cliente do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  Fr_rel_cliente.lb_empresa.Caption:= nom_empresa;
  Fr_rel_cliente.Lb_titulo.Caption:= 'LISTAGEM DE CLIENTES';
  Fr_rel_cliente.Rl_cliente.Preview();

end;

procedure TFr_opc_relatorios.bt_imprimirClick(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro:=TRegistry.Create;
  Registro.RootKey:=HKEY_CURRENT_USER;
  Registro.OpenKey('software\Acta\Orbi',true);

  Registro.Free;

  if tipo_relatorio = 'relatorio_estoque_simples' then
  begin
    if area_atuacao = '0' then//comercio_vestuario
       relatorio_posicao_estoque(Prcod_grupo.Text, Prcod_fornecedor.Text)
    else
       relatorio_posicao_estoque_ind(Prcod_grupo.Text, Prcod_fornecedor.Text);

  end
  else
  if tipo_relatorio = 'relatorio_estoque_custo' then
  begin
    relatorio_posicao_estoque_custo(Prcod_grupo.Text, Prcod_produto.Text);
  end
  else
  if tipo_relatorio = 'relatorio_estoque_venda' then
  begin
    if area_atuacao = '0' then
       relatorio_posicao_estoque_venda(Prcod_grupo.Text, Prcod_produto.Text, Prcod_fornecedor.Text)
    else
       relatorio_posicao_estoque_venda_ind(Prcod_grupo.Text, Prcod_produto.Text, Prcod_fornecedor.Text)

  end
  else
  if tipo_relatorio = 'relatorio_cliente' then
  begin
    monta_rel_cliente('','');
  end
  else
  //Relatorio Vendas
  {Detalhados}
  if tipo_relatorio = 'vendas_periodo_vendedor' then
     relatorio_vendas_vendedor(Prcod_fornecedor.Text,Prempresa.Text,Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)
  else
  if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    if area_atuacao = '0' then//comercio_vestuario
      relatorio_vendas_cliente(Prdta_inicial.Date, Prdta_final.Date, Prcod_cliente.Text, Prempresa.Text, Prcod_fornecedor.Text)
    else
      relatorio_vendas_cliente_ind(Prdta_inicial.Date, Prdta_final.Date, Prcod_cliente.Text, Prempresa.Text);
  end
  else
  if tipo_relatorio = 'vendas_fornecedor_custo' then
     relatorio_vendas_fornecedor_loja(Prcod_fornecedor.Text, Prempresa.Text)
  else
  if tipo_relatorio = 'vendas_periodo_data' then
     relatorio_vendas_periodo_data(Prdta_inicial.Text, Prdta_final.Text)
  else
  {Simplificado}
  if tipo_relatorio = 'vendas_padrao' then
  begin
    if area_atuacao = '0' then//comercio_vestuario
      relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)
    else
      relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text);
  end
  else
  if tipo_relatorio = 'ranking_cliente' then
  begin
    relatorio_rankin_clientes;
  end
  else
  if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    relatorio_rankin_clientes_simplificado(Prdta_inicial.Date, Prdta_final.Date);
  end;



  if tipo_relatorio = 'relatorio_notas_entrada' then
     relatorio_notas_entradas(Prdta_inicial.Text, Prdta_final.Text)
  else
  if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
     relatorio_notas_entradas_detalhada(Prdta_inicial.Text, Prdta_final.Text, Prcod_fornecedor.Text, Prcod_marca.Text, Prcod_grupo.Text)
  else
  if tipo_relatorio = 'relatorio_estoque_completo' then
     relatorio_posicao_estoque_completo(Prcod_fornecedor.Text)
  else
  if tipo_relatorio = 'relatorio_estoque_simplificado' then
     relatorio_posicao_estoque_completo_simplificado(Prcod_fornecedor.Text)
  else
  if tipo_relatorio = 'relatorio_pauta_produto' then
     relatorio_pauta_produto(Prcod_fornecedor.Text, Prcod_grupo.Text)
  else
  if tipo_relatorio = 'relatorio_consignacao' then
     relatorio_consig(Prcod_cliente.Text, Prdta_inicial.Text, Prdta_final.Text)
  else
  if tipo_relatorio = 'cheque_terceiros' then
     relatorio_cheques_terceiro
  else
  if tipo_relatorio = 'controle_fretes_transportadora' then
     relatorio_controle_fretes_transportadora(Prcod_transportadora.Text,Prdta_inicial.Text,Prdta_final.Text)
  else
  if tipo_relatorio = 'relatorio_cliente_completo' then
     monta_rel_cliente_completo(Prcod_cidade.Text, Pruf.Text,Prempresa.Text)
  else
  if tipo_relatorio = 'pauta_venda' then
     monta_rel_pauta_venda(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else
  if tipo_relatorio = 'pauta_vendas_est' then
     monta_rel_pauta_venda_est(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else
  if tipo_relatorio = 'relatorio_transferencia' then
     relatorio_transferencias(Prdta_inicial.Text,Prdta_final.Text,Prcod_fornecedor.Text,Prcod_marca.Text, Prcod_grupo.Text,Prempresa.Text)
  else
  if tipo_relatorio = 'solicitacao_ordem_compra' then
  begin
    if area_atuacao = '0' then//comercio_vestuario
      //relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)
    else
      relatorio_solicitacao_compra(Prcod_fornecedor.Text,Prcod_grupo.Text);
  end
  else
  if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    if area_atuacao = '0' then//comercio_vestuario
      //relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)
    else
      relatorio_auxiliar_compra('visualizar',comp17);
  end
  else
  if tipo_relatorio = 'contas_receber' then
  begin
     if Prfinalizado.Checked then
        relatorio_contas_receber(Prdta_inicial.Text,Prdta_final.Text,Prempresa.Text,Prcod_representante.Text, Prcod_cliente.Text,Prfop.Text,'S')
     else
     if Praberto.Checked then
        relatorio_contas_receber(Prdta_inicial.Text,Prdta_final.Text,Prempresa.Text,Prcod_representante.Text, Prcod_cliente.Text,Prfop.Text,'N')
     else
     if Prtodos.Checked then
        relatorio_contas_receber(Prdta_inicial.Text,Prdta_final.Text,Prempresa.Text,Prcod_representante.Text, Prcod_cliente.Text,Prfop.Text,'T');


  end
  else
  if tipo_relatorio = 'comissao_venda' then
  begin
     if zzfaturado.Checked then
        relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text,Prdta_final.Text,'S')
     else
     if zznao_faturado.Checked then
        relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text,Prdta_final.Text,'N')
     else
     if zzfaturado_todos.Checked then
        relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text,Prdta_final.Text,'T')


  end

end;

procedure TFr_opc_relatorios.FormCreate(Sender: TObject);
var
registro:TRegistry;
begin
   registro:=TRegistry.Create;
   registro.RootKey:=HKEY_CURRENT_USER;
   registro.OpenKey('Software\Acta\Orbi',true);
   registro.Free;

end;

procedure Tfr_opc_relatorios.relatorio_posicao_estoque(codgrupo: String; codfor:String);
var
   cmd: String;
begin
  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\posicao_estoque_simplificado.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;

   cmd:='select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, g.nom_grupo, pro.preco_venda, f.razao_social from produto pro '+
        'left join grade gd on gd.cod_produto=pro.cod_produto '+
        'left join cores cr on cr.id=gd.id_cor '+
        'left join tamanho tm on tm.id=gd.id_tamanho '+
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal '+
        'left join grupo g on g.cod_grupo = pro.cod_grupo ';


   cmd := cmd + 'where pro.qtd_estoque > 0 and status='+QuotedStr('N');

   if codfor <> '' then
      cmd:= cmd + ' and pro.fornecedor_principal = '+QuotedStr(codfor);

   if codgrupo <> '' then
      cmd:= cmd + ' and pro.cod_grupo = '+ QuotedStr(codgrupo);

   cmd:= cmd + ' order by f.razao_social, g.nom_grupo';

  with DM.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    close;
  end;
  fr_relatorio.ShowReport;
end;




procedure TFr_opc_relatorios.FormShow(Sender: TObject);
begin
//dao.Geral1('select ema_login, ema_senha, ema_email, ema_nom_apresentacao, ema_smtp, ema_autenticacao from empresa where cod_empresa='+QuotedStr(cod_empresa));
//  fr_relatorio.FromName:= dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
  //   := dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
//frmail.FromMail:= '';//dao.Q1.fieldbyname('ema_email').AsString;
 // frmail.SmtpHost:= dao.Q1.fieldbyname('ema_smtp').AsString;;
 // frmail.Password:= dao.Q1.fieldbyname('ema_senha').AsString;
  //Fr_opc_relatorios.Height:= 607;
  Gbdata.Visible:= false;
  loja.Visible:= false;
  cliente.Visible:= false;
  produto.Visible:= false;
  fornecedor.Visible:= false;
  codigo_fiscal.Visible:= false;
  grupo.Visible:= false;
  marca.Visible:= false;
  uf.Visible:= false;
  transportadora.Visible:=false;
  cidade.Visible:= false;
  p1.Visible:= false;
  p2.Visible:= false;
  ordenar1.Visible:= false;
  ordenar2.Visible:= false;
  p4.Visible:= false;
  ordenar1.Visible:= false;
  fop.Visible:= False;
  vendedor.Visible:= False;

  //listagens Produtos, Clientes e etc
  if tipo_relatorio = 'relatorio_cliente_completo' then
  begin
    loja.visible:=true;
    uf.visible:=true;
    cidade.visible:=true;
  end
  else
  if tipo_relatorio = 'pauta_venda' then
  begin
    Gbdata.Visible:= false;
    grupo.visible:=true;
    fornecedor.visible:=true;
    ordenar2.Visible:= true;
    Fr_opc_relatorios.Height := 480;

  end
  else
  if tipo_relatorio = 'pauta_vendas_est' then
  begin
    Gbdata.Visible:= false;
    grupo.visible:=true;
    fornecedor.visible:=true;
    ordenar2.Visible:= true;
    Fr_opc_relatorios.Height := 480;

  end
  else
  {**Financeiro**}
  {Contas a Receber}
  if tipo_relatorio = 'contas_receber' then
  begin
    Gbdata.Visible:= True;
    Gbdata.TabOrder:=0;
    loja.visible:=true;
    cliente.visible:=true;
    vendedor.visible:=true;
    fop.Visible:= True;
    p4.Visible:= True;
  end
  else

  {**Estoque**}
  if tipo_relatorio = 'relatorio_estoque_simples' then
  begin
    fornecedor.Visible:=true;
    grupo.Visible:= true;
    loja.Visible:= false;
  end
  else
  if tipo_relatorio = 'relatorio_estoque_custo' then
  begin

    PRmostrar_produto_estoque_zerado.Visible:= true;

    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_cidade.Visible:= false;
    PrCod_Cidade.Visible:= false;
    LbNom_cidade.Visible:= false;

    Lbl_empresa.Visible:= false;
    Prempresa.Visible:= false;
    Lbempresa.Visible:= false;

    Lbl_produto.Top:= 17;
    Prcod_produto.Top:= 30;
    Lbnom_produto.Top:= 36;

    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;
  end
  else
  if tipo_relatorio = 'relatorio_estoque_completo' then
  begin
    fornecedor.Visible:=true;
    grupo.Visible:= true;
    loja.Visible:= true;
  end
  else
  if tipo_relatorio = 'relatorio_cliente' then
  begin

    Gbdata.Visible:= false;
    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_produto.Visible:= false;
    Prcod_produto.Visible:= false;
    Lbnom_produto.Visible:= false;

    Lbl_grupo.Visible:= false;
    Prcod_grupo.Visible:= false;
    LbNom_Grupo.Visible:= false;

    Lbnom_cod_fiscal.Visible:= false;
    Prcod_fiscal.Visible:= false;
    Lbl_cod_fiscal.Visible:= false;

    Lbl_empresa.Visible:= false;
    Prempresa.Visible:= false;
    Lbempresa.Visible:= false;



    Lbl_uf.Top:= 97;
    Pruf.Top:= 110;
    lbuf.Top:= 115;

    Lbl_uf.Left:= 12;
    Pruf.Left:= 8;
    lbuf.Left:= 91;
  end
  //relatorios de Vendas Lojas
  else
  if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    Gbdata.Visible:=true;
    p2.Visible:=True;
    Fr_opc_relatorios.Height:=500;
    loja.Visible:=true;
    cliente.Visible:= true;
    fornecedor.Visible:=True;
  end
  else
  if tipo_relatorio = 'vendas_periodo_data' then
  begin
    Gbdata.visible:= true;
    cliente.Visible:= true;
    fornecedor.Visible:=true;
    loja.Visible:=true;
    Fr_opc_relatorios.Height:=500;
  end
  else
  if tipo_relatorio = 'vendas_periodo_vendedor' then
  begin
    Gbdata.Visible:= True;
    Gbdata.TabOrder:=0;
    loja.visible:=true;
    vendedor.visible:=true;
    fornecedor.visible:=true;
    grupo.Visible:= True;
    marca.Visible:= True;

  end
  else
  if tipo_relatorio = 'vendas_padrao' then
  begin
    Gbdata.Visible:= True;
    loja.visible:=true;
    vendedor.visible:=true;
    fornecedor.visible:=true;
    grupo.Visible:= True;
    marca.Visible:= True;
    p2.Visible:= True;
  end
  else
  if tipo_relatorio = 'ranking_cliente' then
  begin
    Gbdata.Visible:=true;
    Fr_opc_relatorios.Height:=200;
  end
  else
  if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    Gbdata.Visible:=true;
    Fr_opc_relatorios.Height:=200;
  end

  //Relatorios Vendas Industria

  else
  if tipo_relatorio = 'vendas_padrao' then
  begin
    Gbdata.Visible:= True;
    loja.visible:=true;
    vendedor.visible:=true;
    fornecedor.visible:=true;
    grupo.Visible:= True;
    marca.Visible:= True;
  end




  else
  if tipo_relatorio = 'controle_fretes_transportadora' then
  begin
    Gbdata.Visible:=true;
    transportadora.Visible:= true;
    loja.Visible:=true;
    Fr_opc_relatorios.Height:=500;
  end
  else
  if tipo_relatorio = 'relatorio_notas_entrada' then
  begin
    Gbdata.Visible:= true;
    loja.Visible:=true;
    fornecedor.Visible:= true;

    grupo.Visible:=true;
    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;

  end
  else
  if tipo_relatorio = 'cheque_terceiros' then
  begin
    p4.Visible:= true;
    Fr_opc_relatorios.Height:=400
  end
  else
  if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
  begin
    Gbdata.Visible:= true;
    loja.Visible:= true;
    fornecedor.Visible:= True;
    grupo.Visible:= True;
    marca.Visible:= true;


  end
  else
  if tipo_relatorio = 'relatorio_estoque_completo' then
  begin

    Gbdata.Visible:= false;

    PRmostrar_produto_estoque_zerado.Visible:= true;
    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_cidade.Visible:= false;
    PrCod_Cidade.Visible:= false;
    LbNom_cidade.Visible:= false;

    Lbl_empresa.Visible:= false;
    Prempresa.Visible:= false;
    Lbempresa.Visible:= false;

    Lbl_fornecedor.Top:= 19;
    Prcod_fornecedor.Top:= 33;
    Lbfornecedor.Top:= 39;
    Lbl_fornecedor.Left:= 10;
    Prcod_fornecedor.Left:= 8;
    Lbfornecedor.Left:= 91;

    Lbl_produto.Top:= 17;
    Prcod_produto.Top:= 30;
    Lbnom_produto.Top:= 36;

    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;

    Lbl_produto.Visible:= false;
    Lbnom_produto.Visible:= false;
    Prcod_produto.Visible:= false;

    Lbl_grupo.Visible:= false;
    LbNom_Grupo.Visible:= false;
    Prcod_grupo.Visible:= false;

    Lbl_cod_fiscal.Visible:= false;
    Lbnom_cod_fiscal.Visible:= false;
    Prcod_fiscal.Visible:= false;

    Lbl_uf.Visible:= false;
    lbuf.Visible:= false;
    Pruf.Visible:= false;
    Gbdata.Visible:= false;
  end
  else
  if tipo_relatorio = 'relatorio_estoque_simplificado' then
  begin
    Gbdata.Visible:= false;

    PRmostrar_produto_estoque_zerado.Visible:= true;
    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_cidade.Visible:= false;
    PrCod_Cidade.Visible:= false;
    LbNom_cidade.Visible:= false;

    Lbl_empresa.Visible:= false;
    Prempresa.Visible:= false;
    Lbempresa.Visible:= false;

    Lbl_fornecedor.Top:= 19;
    Prcod_fornecedor.Top:= 33;
    Lbfornecedor.Top:= 39;
    Lbl_fornecedor.Left:= 10;
    Prcod_fornecedor.Left:= 8;
    Lbfornecedor.Left:= 91;

    Lbl_produto.Top:= 17;
    Prcod_produto.Top:= 30;
    Lbnom_produto.Top:= 36;

    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;

    Lbl_produto.Visible:= false;
    Lbnom_produto.Visible:= false;
    Prcod_produto.Visible:= false;

    Lbl_grupo.Visible:= false;
    LbNom_Grupo.Visible:= false;
    Prcod_grupo.Visible:= false;

    Lbl_cod_fiscal.Visible:= false;
    Lbnom_cod_fiscal.Visible:= false;
    Prcod_fiscal.Visible:= false;

    Lbl_uf.Visible:= false;
    lbuf.Visible:= false;
    Pruf.Visible:= false;
    Gbdata.Visible:= false;
  end
  else
  if tipo_relatorio = 'relatorio_pauta_produto' then
  begin
    Gbdata.Visible:= false;

    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_cidade.Visible:= false;
    PrCod_Cidade.Visible:= false;
    LbNom_cidade.Visible:= false;

    Lbl_empresa.Visible:= false;
    Prempresa.Visible:= false;
    Lbempresa.Visible:= false;

    Lbl_fornecedor.Top:= 19;
    Prcod_fornecedor.Top:= 33;
    Lbfornecedor.Top:= 39;
    Lbl_fornecedor.Left:= 10;
    Prcod_fornecedor.Left:= 8;
    Lbfornecedor.Left:= 91;

    Lbl_produto.Top:= 17;
    Prcod_produto.Top:= 30;
    Lbnom_produto.Top:= 36;

    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;

    Lbl_produto.Visible:= false;
    Lbnom_produto.Visible:= false;
    Prcod_produto.Visible:= false;

    Lbl_grupo.Visible:= true;
    LbNom_Grupo.Visible:= true;
    Prcod_grupo.Visible:= true;

    Lbl_cod_fiscal.Visible:= false;
    Lbnom_cod_fiscal.Visible:= false;
    Prcod_fiscal.Visible:= false;

    Lbl_uf.Visible:= false;
    lbuf.Visible:= false;
    Pruf.Visible:= false;
    Gbdata.Visible:= false;
  end
  else
  if tipo_relatorio = 'vendas_fornecedor_custo' then
  begin
    Lbl_cliente.Visible:= false;
    Prcod_cliente.Visible:= false;
    Lbnom_cliente.Visible:= false;

    Lbl_cidade.Visible:= false;
    PrCod_Cidade.Visible:= false;
    LbNom_cidade.Visible:= false;

    Lbl_empresa.Visible:= true;
    Prempresa.Visible:= true;
    Lbempresa.Visible:= true;

    Lbl_fornecedor.Top:= 19;
    Prcod_fornecedor.Top:= 33;
    Lbfornecedor.Top:= 39;
    Lbl_fornecedor.Left:= 10;
    Prcod_fornecedor.Left:= 8;
    Lbfornecedor.Left:= 91;

    Lbl_produto.Top:= 17;
    Prcod_produto.Top:= 30;
    Lbnom_produto.Top:= 36;

    Lbl_grupo.Top:= 54;
    Prcod_grupo.Top:= 66;
    LbNom_Grupo.Top:= 72;

    Lbl_produto.Visible:= false;
    Lbnom_produto.Visible:= false;
    Prcod_produto.Visible:= false;

    Lbl_grupo.Visible:= false;
    LbNom_Grupo.Visible:= false;
    Prcod_grupo.Visible:= false;

    Lbl_cod_fiscal.Visible:= false;
    Lbnom_cod_fiscal.Visible:= false;
    Prcod_fiscal.Visible:= false;

    Lbl_uf.Visible:= false;
    lbuf.Visible:= false;
    Pruf.Visible:= false;
    Gbdata.Visible:= true;
  end
  else
  if tipo_relatorio = 'relatorio_consignacao' then
  begin
    Gbdata.Visible:= true;
    cliente.Visible:= true;
    loja.Visible:=true;

  end
  else
  if tipo_relatorio = 'comissao_venda' then
  begin
    Gbdata.Visible:= true;
    vendedor.Visible:= true;
    p2.Visible:=true;

  end
  else
  if tipo_relatorio = 'relatorio_transferencia' then
  begin
    Gbdata.Visible:= true;
    loja.Visible:= true;
    fornecedor.Visible:=true;
    marca.Visible:=true;
    grupo.Visible:=true;

  end
  else
  if tipo_relatorio = 'solicitacao_ordem_compra' then
  begin
    fornecedor.Visible:=true;
    grupo.Visible:=true;
  end
  else
  if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    fornecedor.Visible:=true;
    grupo.Visible:=true;
  end;

end;

procedure TFr_opc_relatorios.Prcod_clienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_cliente';
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

procedure TFr_opc_relatorios.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
 If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prcod_cliente.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_opc_relatorio_cliente';
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

    SelectNext(sender as TWinControl, true,true);
    key:=#0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_cidadeButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Cidade';

  chamou_pesquisa:= 'fr_cidades';
  chamou_form := 'fr_opc_relatorio_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cidades';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

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

procedure TFr_opc_relatorios.PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key:=#0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_produto';
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

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
     Lbnom_produto.Caption:= '...';

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto='+QuotedStr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_produto.Text:= '';
      Prcod_produto.SetFocus;
      Exit;
    end;

  end;





end;

procedure TFr_opc_relatorios.Prcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
  usa_leitor: Boolean;
begin
 If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key=#13 then
  begin
    if (Length(Prcod_produto.Text) < 12) and (Prcod_produto.Text <> '') then
        busca_produto_unitario(False, Prcod_produto.Text)
    else
    if (Prcod_produto.Text <> '') then
    begin
        busca_produto_unitario(true, Prcod_produto.Text);
        usa_leitor:= true;
    end;
    If (Prcod_produto.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_opc_relatorio_produto';
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
{    if Prcod_produto.Text <> '' then
    begin
      dao.Geral1('select grade from produto where cod_produto='+QuotedStr(Prcod_produto.Text));
      if dao.Q1.FieldByName('grade').AsString = '1' then
         paAtributo.Enabled:= false
      else
         paAtributo.Enabled:= true;
    end;
    if paAtributo.Enabled=true then
      Emid_cor.SetFocus
    else
      Emqtd_entrada.SetFocus;

    if usa_leitor then
        BtgraEm.Click;}

    key:=#0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_grupoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Grupo';

  chamou_pesquisa:= 'fr_grupo';
  chamou_form := 'fr_opc_relatorio_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Grupos';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

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

procedure TFr_opc_relatorios.Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  chamou_form_old, chamou_pesquisa_old : String;

begin
 If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key = #13 then
  begin
    if (Prcod_grupo.Text ='') then
    begin
     //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Grupo';

      chamou_pesquisa:= 'fr_grupo';
      chamou_form := 'fr_opc_relatorio_grupo';
      chamou_cadastro := 'fr_grupo';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Grupos';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

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
    key:=#0;
  end;
end;

procedure TFr_opc_relatorios.busca_produto_unitario(leitor: boolean; cod_barras:String);
var
  cmd: String;
begin
  if leitor then
  begin
    if length(cod_barras) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
                 'left join cod_barras cb on cb.cod_produto=p.cod_produto '+
                 'where cb.cod_barras='+QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        FRPRI.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text:= dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
      end;
    end
    else
    begin
      if copy(cod_barras,1,4) <> '' then
         dao.Geral2('select grade from produto where cod_produto= '+QuotedStr(copy(cod_barras,1,4)));

      if dao.Q2.FieldByName('grade').AsString ='0' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p '+
                   'left join grade gd on gd.cod_produto=p.cod_produto '+
                   'left join cores c on c.id=gd.id_cor '+
                   'left join tamanho t on t.id=gd.id_tamanho '+
                   'where p.cod_produto='+ QuotedStr(copy(cod_barras,1,4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras,5,3)) + ' and id_tamanho = ' +  QuotedStr(copy(cod_barras,8,2)));
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
        FRPRI.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text:= dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
{        if dao.Q1.FieldByName('grade').AsString = '0' then
        begin
          Emid_cor.Text:= '';
          LbCor.Caption:='...';
          Emid_Tamanho.Text:= '';
          Lbtamanho.Caption:='...';

          Emid_cor.Text:= dao.Q1.fieldbyname('id_cor').AsString;
          LbCor.Caption:=dao.Q1.fieldbyname('cor').AsString;
          Emid_Tamanho.Text:= dao.Q1.fieldbyname('id_tamanho').AsString;
          Lbtamanho.Caption:=dao.Q1.fieldbyname('tamanho').AsString;
        end;}
      end;
    end;
  end;

  if not(leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
               'where p.cod_produto = '+QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      FRPRI.msg('Produto não encontrado!');
      Prcod_produto.SetFocus;
      exit;
    end;
  end;

end;




procedure TFr_opc_relatorios.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
     Lbnom_cliente.Caption:= '...';

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente='+QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_cliente.Text:= '';
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;


end;

procedure TFr_opc_relatorios.Prcod_cidadeExit(Sender: TObject);
begin
  if trim(Prcod_cidade.Text) = '' then
     LbNom_cidade.Caption:= '...';

end;

procedure TFr_opc_relatorios.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
     LbNom_Grupo.Caption:= '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo='+QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.Q2.fieldbyname('nom_grupo').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_grupo.Text:= '';
      Prcod_grupo.SetFocus;
      Exit;
    end;
  end;





end;

procedure Tfr_opc_relatorios.relatorio_posicao_estoque_custo(codgrupo: String; codpro:String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto:String;
   ac_qtd, ac_custo: Real;
   cmd: String;
begin

   cmd:='select f.cod_fornecedor, pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque,pro.custo, pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, gd.id_tamanho, gd.est_individual from produto pro '+
        'left join grade gd on gd.cod_produto=pro.cod_produto '+
        'left join cores cr on cr.id=gd.id_cor '+
        'left join tamanho tm on tm.id=gd.id_tamanho ';
   cmd := cmd + 'where pro.qtd_estoque > 0 ';

   if (codgrupo <> '') or (codpro <> '') then
   begin
     if codpro <> '' then
       cmd:= cmd + ' and pro.cod_produto = '+QuotedStr(codpro);
     if codgrupo <> '' then
        cmd:= cmd + ' and pro.cod_grupo = '+ QuotedStr(codgrupo);
   end;

   cmd:= cmd + ' order by pro.cod_produto';

   dao.Geral1(cmd);

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque.xls');
   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\posicao_estoque.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque.xls');

   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;
   Excel.WorkBooks[1].Sheets[1].Cells[5,2]:= dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.FieldByName('nom_produto').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[5,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
   Excel.WorkBooks[1].sheets[1].cells[5,9]:= 'Custo:';
   Excel.WorkBooks[1].Sheets[1].Cells[5,10]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[5,11]:= 'Total:';
   Excel.WorkBooks[1].Sheets[1].Cells[5,12]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * dao.Q1.FieldByName('qtd_estoque').AsFloat);

   ac_qtd:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
   cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
   linha:= 7 ;

   while not(dao.Q1.Eof) do
   begin
     if cod_produto <> dao.Q1.FieldByName('cod_produto').AsString then
     begin
       linha:= linha+2;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd Total:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,9]:= 'Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,10]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,11]:= 'Total:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,12]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * dao.Q1.FieldByName('qtd_estoque').AsFloat);

       ac_custo:= ac_custo + (dao.Q1.fieldbyname('qtd_estoque').AsFloat * dao.Q1.FieldByName('custo').AsFloat);
       cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
       ac_qtd:= ac_qtd + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
       linha:= linha+1;

       if dao.q1.fieldbyname('grade').AsString = '0' then
       begin
         Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Cor';
         Excel.workBooks[1].sheets[1].cells[linha,3]:= 'Tamanho';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= 'Qtd';
         linha:= linha+1;
       end;
     end;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= dao.Q1.FieldByName('cor').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q1.FieldByName('tamanho').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= dao.Q1.FieldByName('est_individual').AsString;

       linha:= linha+1;

       dao.Q1.Next;
   end;
   linha:= linha + 1;
   Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Qtd Total de Peças:';
   Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= ac_qtd;
   Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= 'Custo Total :';
   Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:= formatFloat('###,##0.00',ac_custo);

   // SALVA O DOCUMENTO
   nom_arquivo:= 'posicao estoque'+'.xls';

   Excel.Visible:= true;

end;

procedure Tfr_opc_relatorios.relatorio_posicao_estoque_preco_venda(codgrupo: String; codpro:String);
begin

end;


procedure TFr_opc_relatorios.PrempresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_empresa';
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

procedure TFr_opc_relatorios.PrempresaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key=#13 then
  begin
    if (Prempresa.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_opc_relatorio_empresa';
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
    key:=#0;

  end;
end;

procedure TFr_opc_relatorios.relatorio_historico_movimentacao_produto(
  cod_produto, empresa: String);

begin
  //busca as entradas
  dao.Geral1('select nr_documento, e1.dtadoc, qtd_entrada from entrada2 e2 ' +
             'left join entrada1 e1 on e1.nr_documento=e2.nr_documento '+
             'where e2.cod_produto= '+QuotedStr(cod_produto));

  dao.Geral2('select numdoc, v1.dtadoc, v2.quantidade from vendas2 v2 ' +
             'left join vendas1 v1 on v1.numdoc=v2.numdoc '+
             'where v2.cod_produto= '+QuotedStr(cod_produto));

  dao.Geral3('select id, cod_produto, data_acerto, qtd_acerto, operacao from acerto_estoque ac ' +
             'left join produto p on p.cod_produto=ac.cod_produto '+
             'where ac.cod_produto= '+QuotedStr(cod_produto));



end;

procedure TFr_opc_relatorios.Prcod_fiscalButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Código Fiscal';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_opc_relatorio_fiscal';
  chamou_cadastro := 'Fr_cod_fiscal';

  Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;


  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_fiscalExit(Sender: TObject);
begin
  if trim(Prcod_fiscal.Text) = '' then
     Lbnom_cod_fiscal.Caption:= '...';

  if Prcod_fiscal.Text <> '' then
  begin
    dao.Geral2('select nome from cod_fiscal where cod_fiscal='+QuotedStr(Prcod_fiscal.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cod_fiscal.Caption := dao.Q2.fieldbyname('nome').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_fiscal.Text:= '';
      Prcod_fiscal.SetFocus;
      Exit;
    end;

  end;


end;

procedure TFr_opc_relatorios.Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prcod_fiscal.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_opc_relatorio_fiscal';
      chamou_cadastro := 'Fr_cod_fiscal';

      Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Códigos Fiscais';
      Fr_localizar.BT_cadastro.Visible := false;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i:=0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 0;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_opc_relatorios.PrufButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Código Fiscal';
  chamou_pesquisa := 'fr_UF';
  chamou_form := 'fr_opc_relatorio_UF';
  chamou_cadastro := 'Fr_UF';

  Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,1);
  Campos_combo[0] := 'UF';
//  Campos_combo[1] := 'Nome';

  for i:=0 to 0 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;


  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrufKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin

  if key=#13 then
  begin
    if (Pruf.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar UF';
      chamou_pesquisa := 'fr_UF';
      chamou_form := 'fr_opc_relatorio_UF';
      chamou_cadastro := 'Fr_UF';

      Fr_localizar.BT_cadastro.Caption:= 'Cadastro de'+#13+'Códigos Fiscais';
      Fr_localizar.BT_cadastro.Visible := false;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,1);
      Campos_combo[0] := 'UF';
//      Campos_combo[1] := 'Nome';

      for i:=0 to 0 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 0;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;

end;

procedure TFr_opc_relatorios.relatorio_vendas_periodo(dta_inicial,
  dta_final: String);
var
  Excel: Variant;
  data: String;
  ac_data, ac_total: Real;
  lin: integer;
  nom_arquivo: string;

begin
  ac_data:= 0;
  ac_total:= 0;
  dao.Geral1('select V1.*, c.nom_cliente, u.nome from vendas1 v1 '+
             'left join cliente c on c.cod_cliente = v1.cod_cliente '+
             'left join tbusu u on u.codusu = v1.cod_usuario '+
             'where dtadoc between '+ QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date))+' and tipo_venda <> '+ QuotedStr('D') +
             ' and consignacao <>'+QuotedStr('1')+ ' and orcamento='+quotedStr('0')+
             ' order by nom_cliente, dtadoc');

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas.xls');
   Excel := CreateOleObject('Excel.Application');

   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\relatorio_vendas.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[1,2]:= '   '+nom_empresa;
   Excel.WorkBooks[1].sheets[1].cells[1,6]:= dao.DtaSerStr+' / '+ dao.HrSer;
   Excel.WorkBooks[1].sheets[1].cells[3,2]:= '   Relatório de Vendas Agrupado por Cliente';

   dao.Q1.First;
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A5:G5');
   FRPRI.BordaCelGeral(Excel,1,'A5:G5',2);
   Excel.WorkBooks[1].Sheets[1].Cells[4,2]:=  'CLIENTE: '+dao.Q1.FieldByName('nom_cliente').AsString;
   data:= dao.Q1.FieldByName('cod_cliente').AsString;
   lin:= 6 ;

   while not(dao.Q1.Eof) do
   begin
     if data <> dao.Q1.FieldByName('cod_cliente').AsString then
     begin
       lin:= lin+1;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':G'+inttostr(lin));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':G'+inttostr(lin),2);
       Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'TOTAL DO CLIENTE: '+FormatFloat('##,###0.00',ac_data);
       ac_data:= 0;
       lin:= lin + 2;

       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':G'+inttostr(lin));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':G'+inttostr(lin),2);
       Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'CLIENTE: '+dao.Q1.FieldByName('nom_cliente').AsString;;

       data:= dao.Q1.FieldByName('cod_cliente').AsString;
       lin:= lin+1;
     end;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= dao.Q1.FieldByName('numdoc').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= formatdatetime('dd/mm/yyyy', dao.Q1.FieldByName('dtadoc').AsDateTime);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= dao.Q1.FieldByName('tot_liquido').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,4]:= dao.Q1.FieldByName('desconto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,5]:= dao.Q1.FieldByName('prazo_pgto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,6]:= copy(dao.Q1.FieldByName('nome').AsString,1,15);

       lin:= lin + 1;
       ac_data:= ac_data + dao.Q1.fieldbyname('tot_liquido').AsFloat;
       if (dao.Q1.FieldByName('tot_liquido').AsFloat <> 0) or ((dao.Q1.FieldByName('tot_liquido').AsString ='')) then
          ac_total:= ac_total + dao.Q1.fieldbyname('tot_liquido').AsFloat;
       dao.Q1.Next;
   end;
   lin:= lin + 1;

   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':G'+inttostr(lin));
   FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':G'+inttostr(lin),2);
   Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'Total do Cliente: '+FormatFloat('##,###0.00',ac_data);

   dao.Geral2('select sum(tot_liquido) as total from vendas1 where dtadoc between '+
              QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date))+
             ' and tipo_venda <> '+ QuotedStr('D') + ' and consignacao <>'+QuotedStr('1')+ ' and orcamento='+quotedStr('0'));

   lin := lin + 2;
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':G'+inttostr(lin));
   FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':G'+inttostr(lin),2);
   Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= 'TOTAL DE VENDAS: '+FormatFloat('##,###0.00', dao.Q2.fieldbyname('total').AsFloat);

   // SALVA O DOCUMENTO
   nom_arquivo:= 'posicao estoque'+'.xls';

   Excel.Visible:= true;



end;

procedure TFr_opc_relatorios.relatorio_notas_entradas(dta_inicial,
  dta_final: String);
var
  Excel: Variant;
  c_fornecedor: String;
  ac_for,ac_qtd,ac_qtd_for, ac_total: Real;
  lin: integer;
  nom_arquivo: string;
  cmd: string;
begin
  ac_for:= 0;
  ac_total:= 0;
  ac_qtd:= 0;
  ac_qtd_for:= 0;

  cmd:= 'select e1.*,f.razao_social from entrada1 e1 '+
        'left join fornecedor f on f.cod_fornecedor = e1.cod_fornecedor ';

  if Prdta_inicial.Text <> '  /  /  ' then
     cmd:= cmd + 'where cod_fiscal ='+QuotedStr('2102')+' and e1.cod_fornecedor <> '+QuotedStr('43') +' and dta_documento between '+ QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date));

  if Prcod_fornecedor.Text <> '' then
     cmd:= cmd + ' and e1.cod_fornecedor = '+QuotedStr(Prcod_fornecedor.Text);

  cmd:= cmd + 'order by razao_social, dta_documento';

  dao.Geral1(cmd);

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\entrada notas.xls');
   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\entrada_notas.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\entrada notas.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[1,6]:= dao.DtaSerStr+' / '+ dao.HrSer;
   Excel.WorkBooks[1].sheets[1].cells[2,3]:= FormatDateTime('DD/MM/YYYY',Prdta_inicial.Date)+' ATÉ '+ FormatDateTime('DD/MM/YYYY',Prdta_final.Date);

   dao.Q1.First;
   Excel.WorkBooks[1].Sheets[1].Cells[4,2]:=  dao.Q1.FieldByName('razao_social').AsString;
   c_fornecedor:= dao.Q1.FieldByName('cod_fornecedor').AsString;
   lin:= 6 ;

   while not(dao.Q1.Eof) do
   begin
     if c_fornecedor <> dao.Q1.FieldByName('cod_fornecedor').AsString then
     begin
       lin:= lin+1;
       Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'Total do Fornecedor: ';
       Excel.WorkBooks[1].sheets[1].cells[lin,2]:= FormatFloat('##,###0.00',ac_for);
       ac_for:= 0;
       Excel.WorkBooks[1].sheets[1].cells[lin,3]:= 'Total Peças: ';
       Excel.WorkBooks[1].sheets[1].cells[lin,4]:= FormatFloat('##,###0.00',ac_qtd_for);
       ac_qtd_for:= 0;

       lin:= lin + 2;

       Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'FORNECEDOR: ';
       FRPRI.FontCel(Excel,1,1,10,1,'A'+inttostr(lin)+':E'+inttostr(lin));
       Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= dao.Q1.FieldByName('razao_social').AsString;
       c_fornecedor:= dao.Q1.FieldByName('cod_fornecedor').AsString;
       lin:= lin+1;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= 'NF';
       Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= 'DATA';
       Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= 'VL.TOTAL';
       Excel.WorkBooks[1].Sheets[1].Cells[lin,4]:= 'QTD.PEÇAS';
       lin:= lin + 1;



     end;
//       FRPRI.MesclaCel(Excel,1,'A'+IntToStr(lin)+':'+'D'+IntToStr(lin));
       Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= dao.Q1.FieldByName('nr_documento').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= dao.Q1.FieldByName('dta_documento').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= FormatFloat('##,###0.00', dao.Q1.FieldByName('vl_total').AsFloat);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,4]:= dao.Q1.FieldByName('tot_itens').AsString;

       lin:= lin + 1;
       ac_for:= ac_for + dao.Q1.fieldbyname('vl_total').AsFloat;
       ac_qtd_for:= ac_qtd_for + dao.Q1.fieldbyname('tot_itens').AsFloat;
       ac_qtd:= ac_qtd + dao.Q1.fieldbyname('tot_itens').AsFloat;
       ac_total:= ac_total + dao.Q1.fieldbyname('vl_total').AsFloat;

       dao.Q1.Next;
   end;
   lin:= lin + 1;
   Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= 'Total de Notas:';
   Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= FormatFloat('##,###0.00', ac_total);
   Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= 'Qtd. Total de Itens:';
   Excel.WorkBooks[1].Sheets[1].Cells[lin,4]:= FormatFloat('##,###0.00', ac_qtd);


   // SALVA O DOCUMENTO
   nom_arquivo:= 'entrada notas'+'.xls';
   Excel.Visible:= true;

end;

procedure TFr_opc_relatorios.Prcod_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prcod_fornecedor.Text ='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_opc_relatorio_fornecedor';
      chamou_cadastro := 'Fr_fornecedor';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fornecedores';
      Fr_localizar.BT_cadastro.Visible := false;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,4);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Razão Social';
      Campos_combo[2] := 'Fantasia';
      Campos_combo[3] := 'Cidade';

      for i:=0 to 3 do
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

procedure TFr_opc_relatorios.Prcod_fornecedorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_opc_relatorio_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false ;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'Cidade';

  for i:=0 to 3 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo(
  c_fornecedor: String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto, cd_fornecedor:String;
   ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
   custo_final, preco_venda_final: Real;
   cmd: String;
begin

   cmd:='select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque,pro.custo, pro.preco_venda,f.razao_social, pro.fornecedor_principal, '+
        'pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, gd.id_tamanho, gd.est_individual from produto pro '+
        'left join grade gd on gd.cod_produto=pro.cod_produto '+
        'left join cores cr on cr.id=gd.id_cor '+
        'left join tamanho tm on tm.id=gd.id_tamanho '+
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ';

   if (not(PRmostrar_produto_estoque_zerado.Checked)) or (Prcod_fornecedor.Text <> '') then
      cmd:= cmd + 'where ';

   If not(PRmostrar_produto_estoque_zerado.Checked) then
      cmd := cmd + 'pro.qtd_estoque > 0 ';

   if c_fornecedor <> '' then
   begin
     if (c_fornecedor <> '') and (not(PRmostrar_produto_estoque_zerado.Checked)) then
        cmd:= cmd + ' and pro.fornecedor_principal = '+ QuotedStr(c_fornecedor)
     else
        cmd:= cmd + ' pro.fornecedor_principal = '+ QuotedStr(c_fornecedor);
   end;
   cmd:= cmd + ' order by f.razao_social, pro.nom_produto';

   dao.Geral1(cmd);

   Excel := CreateOleObject('Excel.Application');
   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\posicao_estoque_completa.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;

//   FRPRI.FontCel(Excel,1,3,10,0,'A6:A:9');
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
   Excel.WorkBooks[1].Sheets[1].Cells[6,2]:= dao.Q1.FieldByName('razao_social').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[7,2]:= dao.Q1.FieldByName('nom_produto').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[7,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
   Excel.WorkBooks[1].sheets[1].cells[8,1]:= 'Custo:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,3]:= 'Tot.Custo:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,5]:= 'Venda:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,7]:= 'Tot.Venda:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);

   ac_qtd:= 0;
   ac_qtd_forn:= 0;

   ac_qtd:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
   ac_qtd_forn:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
   cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
   cd_fornecedor:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
   ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
   ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
   linha:= 10 ;

   while not(dao.Q1.Eof) do
   begin
     if cd_fornecedor <> dao.Q1.FieldByName('fornecedor_principal').AsString then
     begin
       linha:= linha+1;
       if cd_fornecedor <> '' then
       begin
         FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
         Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
         dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
       end;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
       ac_qtd_forn:= 0;
       linha:= linha + 2;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Fornecedor:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('razao_social').AsString;
       linha:= linha + 1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
       linha:= linha +1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       linha:= linha + 1;
       //cabeçalho
       if dao.Q1.fieldbyname('grade').AsString = '0' then
       begin
         Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Cor';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= 'Tamanho';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
         linha:= linha + 1;
       end;
       //final cabeçalho

       cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
       cd_fornecedor:= dao.Q1.FieldByName('fornecedor_principal').AsString;
     end;

     if cod_produto <> dao.Q1.FieldByName('cod_produto').AsString then
     begin
       //linha:= linha+1;

       FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
       linha:= linha +1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       linha:= linha + 1;
       ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
       ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;

       cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;

       if dao.q1.fieldbyname('grade').AsString = '0' then
       begin
         Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Cor';
         Excel.workBooks[1].sheets[1].cells[linha,2]:= 'Tamanho';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
         linha:= linha+1;
       end;
     end;

       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= dao.Q1.FieldByName('cor').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('tamanho').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q1.FieldByName('est_individual').AsString;
       ac_qtd_forn:= ac_qtd_forn + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
       ac_qtd:= ac_qtd + dao.Q1.fieldbyname('est_individual').AsFloat;
       linha:= linha+1;

       dao.Q1.Next;
   end;

   if cd_fornecedor <> '' then
   begin
     FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
     Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
     dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
     Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
     linha:= linha + 1;
   end;

   {Qtd Total}
   cmd:= 'select sum(qtd_estoque) as qtd from produto where status='+QuotedStr('N');
   if Prcod_fornecedor.Text <> '' then
      cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
   if Prcod_grupo.Text <> '' then
      cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
   dao.Geral3(cmd);
   ac_qtd:= dao.Q3.fieldbyname('qtd').AsFloat;

   {custo total}
   cmd :='select sum(custo*qtd_estoque) as custo_tot from produto where status='+QuotedStr('N');
   if Prcod_fornecedor.Text <> '' then
      cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
   if Prcod_grupo.Text <> '' then
      cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
   dao.Geral3(cmd);
   custo_final:= dao.Q3.fieldbyname('custo_tot').AsFloat;


   {somatorio}
   cmd:= 'select sum(preco_venda*qtd_estoque) as preco_tot from produto where status='+QuotedStr('N');
   if Prcod_fornecedor.Text <> '' then
      cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
   if Prcod_grupo.Text <> '' then
      cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
   dao.Geral3(cmd);
   preco_venda_final:= dao.Q3.fieldbyname('preco_tot').AsFloat;

   Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Qtd Total de Peças:';
   Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= FormatFloat('0.00', ac_qtd);
   Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= 'P. Custo Total :'+formatFloat('###,##0.00',custo_final);
   Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:= 'P. Venda Total :'+formatFloat('###,##0.00',preco_venda_final);

   // SALVA O DOCUMENTO
   Excel.Visible:= true;

end;

procedure TFr_opc_relatorios.relatorio_pauta_produto(c_fornecedor: String; c_grupo: String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto, cd_fornecedor, cd_grupo :String;
   ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
   cmd: String;
begin

   cmd:='select pro.cod_produto, pro.status, pro.nom_produto, pro.grade, pro.preco_venda,f.razao_social, g.nom_grupo, pro.fornecedor_principal, '+
        'pro.cod_grupo, g.nom_grupo from produto pro '+
        'left join grupo g on g.cod_grupo = pro.cod_grupo '+
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ';

   cmd:= cmd + 'where pro.status ='+QuotedStr('N');

   if Prcod_fornecedor.Text <> '' then
      cmd:= cmd + ' and fornecedor_principal = '+QuotedStr(c_fornecedor);

   if Prcod_grupo.Text <> '' then
      cmd:= cmd + ' and cod_grupo = '+QuotedStr(c_grupo);


   cmd:= cmd + ' order by f.razao_social, g.nom_grupo, pro.nom_produto';

   dao.Geral1(cmd);

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\pauta produto.xls');
   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\pauta_produto.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\pauta produto.xls');

   Excel.Visible := true;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
   FRPRI.BordaCelGeral(Excel,1,'A6:H6',2);
   Excel.WorkBooks[1].Sheets[1].Cells[6,2]:= dao.Q1.FieldByName('razao_social').AsString;

   FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A7:H7');
   FRPRI.BordaCelGeral(Excel,1,'A7:H7',2);
   Excel.WorkBooks[1].Sheets[1].Cells[7,2]:= dao.Q1.FieldByName('nom_grupo').AsString;
   cd_fornecedor:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
   cd_grupo:= dao.Q1.fieldbyname('cod_grupo').AsString;
   FRPRI.MesclaCel(Excel, 1, 'B9:E9');
   Excel.WorkBooks[1].Sheets[1].Cells[9,1]:= dao.Q1.FieldByName('cod_produto').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[9,2]:= dao.Q1.FieldByName('nom_produto').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[9,6]:= dao.Q1.FieldByName('preco_venda').AsString;

   linha:= 10 ;

   while not(dao.Q1.Eof) do
   begin
     if cd_fornecedor <> dao.Q1.FieldByName('fornecedor_principal').AsString then
     begin
       linha:= linha +2;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(linha)+':H'+inttostr(linha),2);
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Fornecedor';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('razao_social').AsString;
       cd_fornecedor:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
       linha:= linha + 1;
     end;

     if cd_grupo <> dao.Q1.FieldByName('cod_grupo').AsString then
     begin
       linha:= linha +1;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(linha)+':H'+inttostr(linha),2);
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Grupo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_grupo').AsString;
       cd_grupo:= dao.Q1.fieldbyname('cod_grupo').AsString;
       linha:= linha +1;
     end;

       FRPRI.MesclaCel(Excel, 1, 'B'+inttostr(linha)+ ':E'+inttostr(linha));
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= dao.Q1.FieldByName('cod_produto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= dao.Q1.FieldByName('preco_venda').AsString;

      dao.q1.Next;

   end;

   // SALVA O DOCUMENTO
   nom_arquivo:= 'pauta produto'+'.xls';
   Excel.Visible:= true;





end;


procedure TFr_opc_relatorios.relatorio_vendas_fornecedor_loja(c_fornecedor, c_loja: String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto, cd_fornecedor, cd_grupo :String;
   ac_qtd, ac_custo: Real;
   cmd: String;
begin
   if Prempresa.Text = '' then
   begin
     FRPRI.msg('Escolha uma Loja para se Conectar!');
     Prempresa.SetFocus;
     Exit;
   end;
   dao.Configura_CN_NET(Prempresa.Text);

   cmd:='select sum(v2.qtd) as tqtd, sum(p.custo) as tcusto, p.fornecedor_principal, f.razao_social from vendas2 v2 '+
        'left join produto p on p.cod_produto = v2.cod_produto '+
        'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal '+
        'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
        'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date)) +' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+' and tipo_venda <> '+QuotedStr('D')+
        ' and consignacao <>'+QuotedStr('1')+ ' and orcamento='+quotedStr('0');

   if Prcod_fornecedor.Text <> '' then
      cmd:= cmd + ' and p.fornecedor_principal = '+QuotedStr(c_fornecedor);

   cmd:= cmd + ' group by p.fornecedor_principal, f.razao_social ';
   cmd:= cmd + ' order by f.razao_social';

   dao.Geral1_NET(cmd);

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio de venda por fonecedor e loja.xls');
   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\venda_loja_fornecedor.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio de venda por fornecedor e loja.xls');
   Excel.Visible := true;

   Excel.WorkBooks[1].sheets[1].cells[1,7]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;
   ac_qtd:= 0;
   ac_custo:=0;

   if Prempresa.Text <> '' then
   begin
     dao.Geral3('select nom_empresa from empresa where cod_empresa='+QuotedStr(Prempresa.Text));
     Excel.WorkBooks[1].sheets[1].cells[2,2]:= 'Período: '+FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)+' a '+FormatDateTime('dd.mm.yyyy',Prdta_final.Date);
     Excel.WorkBooks[1].sheets[1].cells[3,2]:= dao.Q3.FieldByName('nom_empresa').AsString;
   end;

   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A5:H5');
   FRPRI.BordaCelGeral(Excel,1,'A5:G5',2);
   Excel.WorkBooks[1].Sheets[1].Cells[5,2]:= dao.q1_net.FieldByName('razao_social').AsString;

   cd_fornecedor:= dao.q1_net.fieldbyname('fornecedor_principal').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[7,1]:= formatfloat('###,##0.00', dao.q1_net.FieldByName('tcusto').AsFloat);
   Excel.WorkBooks[1].Sheets[1].Cells[7,2]:= dao.q1_net.FieldByName('tqtd').AsString;

   ac_custo:= dao.q1_net.fieldbyname('tcusto').AsFloat;
   ac_qtd:= dao.q1_net.fieldbyname('tqtd').AsFloat;
   linha:= 8;
   dao.q1_net.Next;
   while not(dao.q1_net.Eof) do
   begin
     if cd_fornecedor <> dao.q1_net.FieldByName('fornecedor_principal').AsString then
     begin
       linha:= linha + 1;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(linha)+':G'+inttostr(linha),2);
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'FORNECEDOR:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.q1_net.FieldByName('razao_social').AsString;
       cd_fornecedor:= dao.q1_net.fieldbyname('fornecedor_principal').AsString;
       linha:= linha + 1;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'T.CUSTO';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= 'T.QTD';
       linha:= linha + 1;
     end;
     Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= formatfloat('###,##0.00', dao.q1_net.FieldByName('tcusto').AsFloat);
     Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.q1_net.FieldByName('tqtd').AsString;
     ac_custo:= ac_custo + dao.q1_net.fieldbyname('tcusto').AsFloat;
     ac_qtd:= ac_qtd + dao.q1_net.fieldbyname('tqtd').AsFloat;

     dao.q1_net.Next;
     linha:= linha + 1;
   end;
   linha:= linha +2;
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
   Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'T.CUSTO GERAL: '+ FormatFloat('##,###0.00',ac_custo);
   Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= 'T.QTD GERAL: '+ FormatFloat('##,###0.00',ac_qtd);



   // SALVA O DOCUMENTO
   nom_arquivo:= 'relatorio de venda por fonecedor e loja'+'.xls';
   Excel.Visible:= true;


end;

procedure TFr_opc_relatorios.relatorio_vendas_periodo_data(dta_inicial,
  dta_final: String);
var
  Excel: Variant;
  data: String;
  ac_data_bruto, ac_data_liquido, desconto_dia: real;
  ac_total_liquido, ac_total_bruto, desconto_total:real;

  lin: integer;
  nom_arquivo: string;
begin
  ShortDateFormat:='dd/mm/yyyy';
  ac_data_bruto:= 0;
  ac_total_liquido:= 0;
  dao.Geral1('select V1.*, c.nom_cliente, u.nome from vendas1 v1 '+
             'left join cliente c on c.cod_cliente = v1.cod_cliente '+
             'left join tbusu u on u.codusu = v1.cod_usuario '+
             'where dtadoc between '+ QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date))+' and tipo_venda <> '+ QuotedStr('D') +
             ' and v1.consignacao <> '+QuotedStr('1')+ ' and v1.orcamento='+quotedStr('0')+' and v1.cod_fop<>'+quotedStr('9')+
             ' order by dtadoc, c.nom_cliente');

   if dao.Q1.RecordCount <=0 then
   begin
     FRPRI.msg('Não Foi Encontrado Registros para Gerar o RElatório!');
     exit;
   end;

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas agrupado por data.xls');
   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\relatorio_vendas_data.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas agrupado por data.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[1,2]:= nom_empresa;
   Excel.WorkBooks[1].sheets[1].cells[1,6]:= dao.DtaSerStr+' / '+ dao.HrSer;

   FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A2:F2');
   Excel.WorkBooks[1].sheets[1].cells[2,2]:= 'Relatório de Vendas Agrupado por Data';

   dao.Q1.First;

   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A4:F4');
   FRPRI.BordaCelGeral(Excel,1,'A4:F4',2);
   Excel.WorkBooks[1].Sheets[1].Cells[4,1]:= 'DATA: '+FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dtadoc').AsDateTime);
   Excel.WorkBooks[1].Sheets[1].Cells[5,1]:= 'Cliente';
   Excel.WorkBooks[1].Sheets[1].Cells[5,2]:= 'Tot.Bruto';
   Excel.WorkBooks[1].Sheets[1].Cells[5,3]:= 'Desc.';
   Excel.WorkBooks[1].Sheets[1].Cells[5,4]:= 'Tot.Liquido';
   Excel.WorkBooks[1].Sheets[1].Cells[5,5]:= 'Prazo';
   Excel.WorkBooks[1].Sheets[1].Cells[5,6]:= 'Vendedor';



   data:=  dao.Q1.FieldByName('dtadoc').AsString;
   lin:= 6 ;

   while not(dao.Q1.Eof) do
   begin
     if (data <> dao.Q1.FieldByName('dtadoc').AsString) then
     begin
       lin:= lin+1;
       if ac_data_bruto > 0 then
       begin
         desconto_dia:= 100-((ac_data_liquido/ac_data_bruto*100));
         FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':F'+inttostr(lin));
         FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':F'+inttostr(lin),2);
         Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'Total Bruto Dia: '+ FormatFloat('##,###0.00',ac_data_bruto)+' -  Desconto Médio: '+FormatFloat('###,##0.00', desconto_dia)+'%'+'    - Total Liquido Dia: '+FormatFloat('###,##0.00',ac_data_liquido);
       end;
       ac_data_bruto:= 0;
       ac_data_liquido:= 0;
       lin:= lin + 2;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':F'+inttostr(lin));
       FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':F'+inttostr(lin),2);
       Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'DATA:'+FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dtadoc').AsDateTime);;
       lin:= lin +1;
       Excel.WorkBooks[1].Sheets[1].Cells[1,lin]:= 'Cliente';
       Excel.WorkBooks[1].Sheets[1].Cells[2,lin]:= 'Tot.Bruto';
       Excel.WorkBooks[1].Sheets[1].Cells[3,lin]:= 'Desc.';
       Excel.WorkBooks[1].Sheets[1].Cells[4,lin]:= 'Tot.Liquido';
       Excel.WorkBooks[1].Sheets[1].Cells[5,lin]:= 'Prazo';
       Excel.WorkBooks[1].Sheets[1].Cells[6,lin]:= 'Vendedor';

       data:= dao.Q1.FieldByName('dtadoc').AsString;
       lin:= lin+1;
     end;



  //       FRPRI.MesclaCel(Excel,1,'A'+IntToStr(lin)+':'+'C'+IntToStr(lin));
  //       FRPRI.AlinhaCel(Excel,1,'A'+IntToStr(lin)+':'+'C'+IntToStr(lin), 1, 1);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= copy(dao.Q1.FieldByName('nom_cliente').AsString,1,28);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,2]:= FormatFloat('###,##0.00', dao.Q1.FieldByName('tot_bruto').AsFloat);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= dao.Q1.FieldByName('desconto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,4]:= formatfloat('###,##0.00',dao.Q1.FieldByName('tot_liquido').AsFloat);
       Excel.WorkBooks[1].Sheets[1].Cells[lin,5]:= dao.Q1.FieldByName('prazo_pgto').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[lin,6]:= Copy(dao.Q1.FieldByName('nome').AsString,1,12);

       lin:= lin + 1;
       ac_data_bruto:= ac_data_bruto + dao.Q1.fieldbyname('tot_bruto').AsFloat;
       ac_data_liquido:= ac_data_liquido + dao.Q1.fieldbyname('tot_liquido').AsFloat;

       if (dao.Q1.FieldByName('tot_bruto').AsFloat <> 0) or ((dao.Q1.FieldByName('tot_bruto').AsString ='')) then
          ac_total_bruto:= ac_total_bruto + dao.Q1.fieldbyname('tot_bruto').AsFloat;

       if (dao.Q1.FieldByName('tot_liquido').AsFloat <> 0) or ((dao.Q1.FieldByName('tot_liquido').AsString ='')) then
          ac_total_liquido:= ac_total_liquido + dao.Q1.fieldbyname('tot_liquido').AsFloat;

       dao.Q1.Next;
   end;
   lin:= lin + 1;

   if ac_data_bruto > 0 then
   begin
     desconto_dia:= 100-((ac_data_liquido/ac_data_bruto*100));
     FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(lin)+':F'+inttostr(lin));
     FRPRI.BordaCelGeral(Excel,1,'A'+inttostr(lin)+':F'+inttostr(lin),2);
     Excel.WorkBooks[1].sheets[1].cells[lin,1]:= 'Total Bruto Dia: '+ FormatFloat('##,###0.00',ac_data_bruto)+' -  Desconto Médio: '+FormatFloat('###,##0.00', desconto_dia)+'%'+'    - Total Liquido Dia: '+FormatFloat('###,##0.00',ac_data_liquido);
   end;

   lin:= lin + 2;

   dao.Geral2('select sum(tot_liquido) as total from vendas1 where dtadoc between '+
              QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date))+
             ' and tipo_venda <> '+quotedStr('D')+' and consignacao <>'+QuotedStr('1')+ ' and orcamento='+quotedStr('0'));

   dao.Geral3('select sum(tot_bruto) as totalb from vendas1 where dtadoc between '+
              QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',Prdta_final.Date))+
             ' and tipo_venda <> '+quotedStr('D')+' and consignacao <>'+QuotedStr('1')+ ' and orcamento='+quotedStr('0'));


   if dao.Q3.fieldbyname('totalb').AsFloat > 0 then
      desconto_total:= 100-((dao.Q2.fieldbyname('total').AsFloat/ dao.Q3.fieldbyname('totalb').AsFloat*100));
     Excel.WorkBooks[1].Sheets[1].Cells[lin,1]:= 'Total Bruto Geral: '+FormatFloat('###,##0.00',dao.Q3.fieldbyname('totalb').AsFloat)+'   - descontop Geral: '+FormatFloat('###,##0.00', desconto_total)+'    - Total Liquido Geral: '+FormatFloat('###,##0.00', dao.Q2.fieldbyname('total').AsFloat);
//   Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= FormatFloat('##,###0.00', dao.Q2.fieldbyname('total').AsFloat);


   // SALVA O DOCUMENTO
   nom_arquivo:= 'relatorio vendas data'+'.xls';

   Excel.Visible:= true;
   excel.WorkBooks[1].printpreview;

end;

procedure TFr_opc_relatorios.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
     Lbfornecedor.Caption:= '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text:= '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.PrempresaExit(Sender: TObject);
begin
  if trim(Prempresa.Text) = '' then
     Lbempresa.Caption:= '...';

  if Prempresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa='+QuotedStr(Prempresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa.Caption := dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prempresa.Text:= '';
      Prempresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.PrufExit(Sender: TObject);
begin
  if trim(Pruf.Text) = '' then
     lbuf.Caption:= '...';

  if Pruf.Text <> '' then
  begin
    dao.Geral2('select uf from uf where uf='+QuotedStr(Pruf.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbuf.Caption := dao.Q2.fieldbyname('uf').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Pruf.Text:= '';
      Pruf.SetFocus;
      Exit;
    end;

  end;


end;

procedure TFr_opc_relatorios.relatorio_consig(c_cliente : String; dta_inicial: String; dta_final: String);
begin
  with dm.Q_consignacao do
  begin
    close;
    sql.Clear;
    sql.add('SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,c.cor '+
            ',t.tamanho,cl.nom_cliente, v1.dta_vencimento_consig, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v2.qtd_devolvida, v1.prazo_pgto, v1.tot_liquido,usu.logusu FROM VENDAS2 v2 '+
            'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
            'left join fop fp on fp.cod_fop = v1.cod_fop '+
            'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
            'left join cores c on c.id = v2.id_cor '+
            'left join tamanho t on t.id = v2.id_tamanho '+
            'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
            'left join tbusu usu on usu.codusu=v1.cod_usuario '+
            'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
            ' and v1.consignacao='+QuotedStr('1'));

            if Prcod_cliente.Text <> '' then
               sql.add(' and v2.cod_cliente = ' + QuotedStr(c_cliente));
            if Prempresa.Text <> '' then
               sql.add(' and v1.cod_empresa = ' + QuotedStr(cod_empresa));

            sql.add(' order by v2.cod_cliente, v2.dtadoc ');
     open;
  end;



  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\relatorio_consignacao.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;



end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo_simulada(
  c_fornecedor: String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto, cd_fornecedor:String;
   ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
   cmd: String;
   qtd_entrada, qtd_venda, qtd_acerto: String;
begin
   cmd:='select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque,pro.custo, pro.preco_venda,f.razao_social, pro.fornecedor_principal, '+
        'pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, gd.id_tamanho, gd.est_individual from produto pro '+
        'left join grade gd on gd.cod_produto=pro.cod_produto '+
        'left join cores cr on cr.id=gd.id_cor '+
        'left join tamanho tm on tm.id=gd.id_tamanho '+
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ';

   if (not(PRmostrar_produto_estoque_zerado.Checked)) or (Prcod_fornecedor.Text <> '') then
      cmd:= cmd + 'where ';

   If not(PRmostrar_produto_estoque_zerado.Checked) then
      cmd := cmd + 'pro.qtd_estoque > 0 ';

   if c_fornecedor <> '' then
   begin
     if (c_fornecedor <> '') and (not(PRmostrar_produto_estoque_zerado.Checked)) then
        cmd:= cmd + ' and pro.fornecedor_principal = '+ QuotedStr(c_fornecedor)
     else
        cmd:= cmd + ' pro.fornecedor_principal = '+ QuotedStr(c_fornecedor);
   end;
   cmd:= cmd + ' order by f.razao_social, pro.nom_produto';

   dao.Geral1(cmd);

   Excel := CreateOleObject('Excel.Application');
   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\posicao_estoque_completa.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;

//   FRPRI.FontCel(Excel,1,3,10,0,'A6:A:9');
   FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
   Excel.WorkBooks[1].Sheets[1].Cells[6,2]:= dao.Q1.FieldByName('razao_social').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[7,2]:= dao.Q1.FieldByName('nom_produto').AsString;
   Excel.WorkBooks[1].Sheets[1].Cells[7,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
   Excel.WorkBooks[1].sheets[1].cells[8,1]:= 'Custo:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,3]:= 'Tot.Custo:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,5]:= 'Venda:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
   Excel.WorkBooks[1].sheets[1].cells[8,7]:= 'Tot.Venda:';
   Excel.WorkBooks[1].Sheets[1].Cells[8,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);

   ac_qtd:= 0;
   ac_qtd_forn:= 0;

   ac_qtd:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
   ac_qtd_forn:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
   cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
   cd_fornecedor:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
   ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
   ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
   linha:= 10 ;

   while not(dao.Q1.Eof) do
   begin
     if cd_fornecedor <> dao.Q1.FieldByName('fornecedor_principal').AsString then
     begin
       linha:= linha+1;
       if cd_fornecedor <> '' then
       begin
         FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
         Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
         dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
       end;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
       ac_qtd_forn:= 0;
       linha:= linha + 2;
       FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Fornecedor:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('razao_social').AsString;
       linha:= linha + 1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
       linha:= linha +1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       linha:= linha + 1;
       //cabeçalho
       if dao.Q1.fieldbyname('grade').AsString = '0' then
       begin
         Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Cor';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= 'Tamanho';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
         linha:= linha + 1;
       end;
       //final cabeçalho

       cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
       cd_fornecedor:= dao.Q1.FieldByName('fornecedor_principal').AsString;
     end;

     if cod_produto <> dao.Q1.FieldByName('cod_produto').AsString then
     begin
       //linha:= linha+1;

       FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
       linha:= linha +1;
       Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
       Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
       Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
       linha:= linha + 1;
       ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
       ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;

       cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;

       if dao.q1.fieldbyname('grade').AsString = '0' then
       begin
         Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Cor';
         Excel.workBooks[1].sheets[1].cells[linha,2]:= 'Tamanho';
         Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
         linha:= linha+1;
       end;
     end;

       Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= dao.Q1.FieldByName('cor').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('tamanho').AsString;
       Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q1.FieldByName('est_individual').AsString;
       ac_qtd_forn:= ac_qtd_forn + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
       ac_qtd:= ac_qtd + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
       linha:= linha+1;

       dao.Q1.Next;
   end;

   if cd_fornecedor <> '' then
   begin
     FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
     Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
     dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
     Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
     linha:= linha + 1;
   end;

   Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Qtd Total de Peças:';
   Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= ac_qtd;
   Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= 'P. Custo Total :'+formatFloat('###,##0.00',ac_custo);
   Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:= 'P. Venda Total :'+formatFloat('###,##0.00',ac_venda);

   // SALVA O DOCUMENTO
   Excel.Visible:= true;

end;






procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo_simplificado(
  c_fornecedor: String);
var
  cmd: String;
  Excel: Variant;
  i: integer;
begin
   cmd:='select f.razao_social, m.nom_marca,  sum(qtd_estoque) as t_estoque, sum(custo) as t_custo, sum(preco_venda) as t_venda from produto p '+
        'left join fornecedor f on f.cod_fornecedor = p.fornecedor_principal '+
        'left join marcas m on m.id = p.id_marca ';


   if (not(PRmostrar_produto_estoque_zerado.Checked)) or (Prcod_fornecedor.Text <> '') then
      cmd:= cmd + 'where ';

   If not(PRmostrar_produto_estoque_zerado.Checked) then
      cmd := cmd + ' qtd_estoque > 0 ';

{   if c_fornecedor <> '' then
   begin
     if (c_fornecedor <> '') and (not(PRmostrar_produto_estoque_zerado.Checked)) then
        cmd:= cmd + ' and pro.fornecedor_principal = '+ QuotedStr(c_fornecedor)
     else
        cmd:= cmd + ' pro.fornecedor_principal = '+ QuotedStr(c_fornecedor);
   end;}

   cmd := cmd + 'group by f.razao_social, m.nom_marca ';

   cmd:= cmd + ' order by nom_marca ';

   dao.Geral1(cmd);

   Excel := CreateOleObject('Excel.Application');
   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque simplificada.xls');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\doc_padrao.xls');
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque simplificada.xls');
   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[2,1]:= dao.DtaSerStr+' / '+ dao.HrSer;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= nom_empresa ;
   Excel.WorkBooks[1].sheets[1].cells[3,2]:= 'POSIÇÃO ESTOQUE SIMPLIFICADA POR MARCA';

   FRPRI.BordaCelGeral(Excel,1,'A5:E5',1);
   Excel.WorkBooks[1].sheets[1].cells[5,1]:= 'FORNECEDOR';
   Excel.WorkBooks[1].sheets[1].cells[5,2]:= 'MARCA';
   Excel.WorkBooks[1].sheets[1].cells[5,3]:= ' QTD. ESTOQUE';
//   Excel.WorkBooks[1].sheets[1].cells[5,4]:= ' T. CUSTO';
//   Excel.WorkBooks[1].sheets[1].cells[5,5]:= ' T. VENDA';
   i:=6;
   dao.Q1.First;
   while not(dao.q1.Eof) do
   begin
     Excel.WorkBooks[1].Sheets[1].Cells[i,1]:= dao.Q1.FieldByName('razao_social').AsString;
     Excel.WorkBooks[1].Sheets[1].Cells[i,2]:= dao.Q1.FieldByName('nom_marca').AsString;
     FRPRI.AlinhaCel(Excel,1,'C'+IntToStr(i)+':E'+IntToStr(i),2,4);
     Excel.WorkBooks[1].Sheets[1].Cells[i,3]:= dao.Q1.FieldByName('t_estoque').AsString;
//     Excel.WorkBooks[1].Sheets[1].Cells[i,4]:= FormatFloat('##,###0.00', dao.Q1.FieldByName('t_custo').AsFloat);
//     Excel.WorkBooks[1].Sheets[1].Cells[i,5]:= FormatFloat('##,###0.00', dao.Q1.FieldByName('t_venda').AsFloat);
     i:= i +1;
     dao.Q1.Next;
   end;
   Excel.Visible:= true;

end;

procedure TFr_opc_relatorios.Prcod_marcaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Marca';

  chamou_pesquisa:= 'fr_marca';
  chamou_form := 'fr_opc_relatorio_marca';
  chamou_cadastro := 'fr_marca';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Marcas';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
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

procedure TFr_opc_relatorios.Prcod_marcaExit(Sender: TObject);
begin
  if trim(Prcod_marca.Text) = '' then
     Lbnom_marca.Caption:= '...';

  if Prcod_marca.Text <> '' then
  begin
    dao.Geral2('select nom_marca from marcaS where ID='+QuotedStr(Prcod_marca.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_marca.Caption := dao.Q2.fieldbyname('nom_marca').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_marca.Text:= '';
      Prcod_marca.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.Prcod_marcaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  chamou_form_old, chamou_pesquisa_old : String;

begin
 If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key = #13 then
  begin
    if (Prcod_grupo.Text ='') then
    begin
     //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Marca';

      chamou_pesquisa:= 'fr_marca';
      chamou_form := 'fr_opc_relatorio_marca';
      chamou_cadastro := 'fr_marca';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Marcas';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,3);
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
    key:=#0;
  end;

end;

procedure TFr_opc_relatorios.relatorio_notas_entradas_detalhada(dta_inicial, dta_final, cod_for, cod_marca, cod_grupo: String);
begin
  with Dm.q_entradas do
  begin
    close;
    sql.Clear;
    sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, p.custo as custo_produto,'+
            'e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,'+
            'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao, e2.sub_total,'+
            'f.razao_social,p.ref_fabrica, f.fantasia, p.nom_produto, cr.cor, tm.tamanho, cl.descricao as nom_colecao,'+
            'm.nom_marca from entrada2 e2 '+
            'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) '+
            'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor '+
            'left join produto p on p.cod_produto=e2.cod_produto '+
            'left join cores cr on cr.id=e2.id_cor '+
            'left join tamanho tm on tm.id=e2.id_tamanho '+
            'left join colecao cl on cl.id=e2.cod_colecao '+
            'left join marcas m on m.id=p.id_marca '+
            'left join empresa e on e.cod_empresa = e1.empresa_destino '+
            'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal '+
            'where dta_documento between '+QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(dta_inicial)))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(dta_final)))+' and (cod_fiscal='+QuotedStr('2102')+' or cod_fiscal='+QuotedStr('1102')+')');
    if cod_for <> '' then
      sql.add(' and e1.cod_fornecedor='+QuotedStr(cod_for));

    if cod_marca <> '' then
      sql.add(' and p.id_marca='+QuotedStr(cod_marca));

    if cod_grupo <> '' then
      sql.add(' and p.cod_grupo='+QuotedStr(cod_grupo));

      sql.add(' order by f.razao_social, e2.nr_documento ');
    open;
  end;
  if Dm.q_entradas.RecordCount <=0 then
  begin
    FRPRI.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\notas_entrada_detalhada.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;


end;

procedure TFr_opc_relatorios.fR_RELATORIOGetValue(const VarName: String;
  var Value: Variant);
begin
  if mform = 'posicao_estoque_simplificada' then
  begin
  end
  else
  if tipo_relatorio = 'cheque_terceiros' then
  begin
    if VarName ='empresa' then
       value:= nom_empresa;
  end
  else
  if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'relatorio_consignacao' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'vendas_padrao' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'controle_fretes_transportadora' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'relatorio_cliente_completo' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
  end
  else
  if tipo_relatorio = 'pauta_venda' then
  begin
    if VarName = 'empresa' then
    begin
       Value:= nom_empresa;
    end;
    if VarName = 'email' then
    begin
       Value:= email_empresa +'     -      '+   home_page;
    end;
  end
  else
  if tipo_relatorio = 'pauta_vendas_est' then
  begin
    if VarName = 'empresa' then
    begin
       Value:= nom_empresa;
    end;
    if VarName = 'email' then
    begin
       Value:= email_empresa +'     -      '+   home_page;
    end;
  end
  else
  if tipo_relatorio = 'contas_receber' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'vendas_periodo_vendedor' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'ranking_cliente' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end
  else
  if tipo_relatorio = 'comissao_venda' then
  begin
    if VarName = 'empresa' then
       Value:= nom_empresa
    else
    if VarName = 'dtaini' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_inicial.Date)
    else
    if VarName = 'dtafin' then
       value:= FormatDateTime('dd/mm/yyyy',Prdta_final.Date)
  end;



end;

procedure TFr_opc_relatorios.relatorio_vendas_cliente(dta_inicial,
  dta_final: TDate; cod_cliente : String; cod_empresa: String; cod_fornecedor: String);
var
 cmd: string;
begin
  cmd:= 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email, '+
     't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, p.fornecedor_principal, e.nom_empresa, '+
     'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 '+
     'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
     'left join fop fp on fp.cod_fop = v1.cod_fop '+
     'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
     'left join cores c on c.id = v2.id_cor '+
     'left join tamanho t on t.id = v2.id_tamanho '+
     'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
     'left join representante r on r.id=v1.cod_representante '+
     'left join marcas m on m.id=p.id_marca '+
     'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal '+
     'left join empresa e on e.cod_empresa = v1.cod_empresa '+
     'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
     ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D');

      if Prcod_cliente.Text <> '' then
         cmd:= cmd + ' and v2.cod_cliente = ' + QuotedStr(cod_cliente);
      if Prempresa.Text <> '' then
         cmd:= cmd + ' and v1.cod_empresa = ' + QuotedStr(cod_empresa);

      if cod_fornecedor <> '' then
         cmd:= cmd + ' and p.fornecedor_principal='+QuotedStr(cod_fornecedor);

      cmd:= cmd + ' order by v2.cod_cliente, v2.dtadoc ';


  with dm.q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;


  if dm.q_vendas2.RecordCount <= 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\vendas_cliente.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;






end;

procedure TFr_opc_relatorios.relatorio_cheques_terceiro;
var
  cmd : string;
begin
  cmd:= 'SELECT NR_CHEQUE, NR_BANCO, NR_AGENCIA, NR_CONTA_CORRENTE, DTA_EMISSAO, DTA_VENCIMENTO, NOM_TITULAR'+
        ', VALOR, TITULO_CR1, TITULO_CP1, OBSERVACAO FROM CHEQUE_TERCEIROS';
  if Praberto.Checked then
    cmd:= cmd + ' where titulo_cp1 is null';
  if Prfinalizado.Checked then
    cmd:= cmd + ' where titulo_cp1 is not null';

  with Dm.q_cheques do
  begin
    Close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if Dm.q_cheques.RecordCount <= 0 then
  begin
    frpri.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\cheques_terceiros.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;



end;

procedure TFr_opc_relatorios.Prcod_transportadoraButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_opc_relatorio_transportadora';
  chamou_cadastro := 'Fr_transportadora';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Transportadoras';
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

procedure TFr_opc_relatorios.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
     LbNom_transportadora.Caption:= '...';

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2('select nome from transportadora where cod_transportadora='+QuotedStr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.Q2.fieldbyname('nome').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_transportadora.Text:= '';
      Prcod_transportadora.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.Prcod_transportadoraKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin

  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prcod_transportadora.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Transportadora';
      chamou_pesquisa := 'fr_transportadora';
      chamou_form := 'fr_opc_relatorio_transportadora';
      chamou_cadastro := 'Fr_transportadora';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Transportadoras';
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
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_opc_relatorios.relatorio_controle_fretes_transportadora(
  c_transportadora, dta_inicial, dta_final: String);
var
  cmd: String;
begin
  if Prdta_inicial.Text='  /  /    ' then
  begin
    FRPRI.msg('Preencha os campos de Data');
    exit;
  end;

  cmd:= 'select ve1.numdoc,ve1.nf, ve1.dta_emissao, cli.nom_cliente, ve1.tot_liquido, tra.nome , '+
        'cid.nom_cidade,cid.uf, ve1.vl_frete, ve1.contato_frete, fop.nom_fop,pz.prazo,ve1.faturado from vendas1 ve1 '+
        'left join cliente cli on ve1.cod_cliente=cli.cod_cliente '+
        'left join transportadora tra on ve1.cod_transportadora=tra.cod_transportadora '+
        'left join cidades cid on cli.cod_cidade=cid.cod_cidade '+
        'left join fop fp on ve1.cod_fop=fp.cod_fop '+
        'left join prazo pz on pz.id=ve1.cod_prazo_pgto ';
        cmd:= cmd + ' where ve1.dta_emissao between '+QuotedStr(FormatDateTime('dd.mm.yyyy',strtodate(dta_inicial)))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy',strtodate(dta_final)))+' and ve1.faturado='+QuotedStr('1');
        if Prcod_transportadora.Text <> '' then
          cmd:= cmd + ' and ve1.cod_transportadora='+QuotedStr(Prcod_transportadora.Text);
        cmd:= cmd + ' order by cli.nom_cliente';


  with Dm.Q_controle_fretes do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    open;
  end;


  if dm.Q_controle_fretes.RecordCount < 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\controle_fretes.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;


end;

procedure TFr_opc_relatorios.relatorio_vendas_cliente_ind(dta_inicial,
  dta_final: TDate; cod_cliente, cod_empresa: String);
var
 cmd: string;
begin
  cmd:='SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto, p.preco_venda, c.cor, '+
       'cl.telefone ,cl.email, p.fornecedor_principal, f.fantasia '+
       ',t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, '+
       'v2.preco_bruto, v2.desconto as desconto_item, e.nom_empresa, '+
       'v1.tot_bruto, v1.tot_liquido,r.nom_representante, V1.credito_usado, m.nom_marca FROM VENDAS2 v2 '+
       'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
       'left join fop fp on fp.cod_fop = v1.cod_fop '+
       'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
       'left join cores c on c.id = v2.id_cor '+
       'left join tamanho t on t.id = v2.id_tamanho '+
       'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
       'left join representante r on r.id=v1.cod_representante '+
       'left join marcas m on m.id=p.id_marca '+
       'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal '+
       'left join empresa e on e.cod_empresa = v1.cod_empresa '+
       'where v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and v1.cod_fop<>'+QuotedStr('9');

       if zzfaturado.Checked then
          cmd:= cmd + ' and v1.dta_emissao between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))
       else
          cmd:= cmd + ' and v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date));


       if Prcod_cliente.Text <> '' then
          cmd:= cmd + ' and v2.cod_cliente = ' + QuotedStr(cod_cliente);
       if Prempresa.Text <> '' then
          cmd:= cmd + ' and v1.cod_empresa = ' + QuotedStr(cod_empresa);

       if zzfaturado.Checked then
          cmd:= cmd + ' and faturado='+QuotedStr('1')
       else
       if zznao_faturado.Checked then
          cmd:= cmd + ' and faturado='+QuotedStr('0');

       cmd:= cmd + ' order by v2.cod_cliente, v2.dtadoc ';





{  cmd:= 'SELECT v2.cod_produto, v2.cod_cliente, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email '+
        ',t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, '+
        'v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 '+
        'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
        'left join fop fp on fp.cod_fop = v1.cod_fop '+
        'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
        'left join cores c on c.id = v2.id_cor '+
        'left join tamanho t on t.id = v2.id_tamanho '+
        'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
        'left join representante r on r.id=v1.cod_representante '+
        'left join marcas m on m.id=p.id_marca '+
        'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
        ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D');

         if Prcod_cliente.Text <> '' then
            cmd:= cmd + ' and v2.cod_cliente = ' + QuotedStr(cod_cliente);
         if Prempresa.Text <> '' then
            cmd:= cmd + ' and v1.cod_empresa = ' + QuotedStr(cod_empresa);
         cmd:= cmd + ' order by v2.cod_cliente, v2.dtadoc ';}

  with dm.q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas2.RecordCount < 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\vendas_cliente_ind.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_cliente_completo(cod_cidade, uf,
  loja: String);
var
  cmd : String;
  cmd2 : string;
begin
  cmd:= 'select c.cod_cidade, c.cod_empresa, c.nom_cliente, c.cod_cliente,c.endereco, c.cod_cidade, c.bairro, c.cep, c.telefone, '+
        'c.email, c.dta_aniversario, '+
        'e.nom_empresa, cd.nom_cidade,  cd.uf from cliente c '+
        'left join cidades cd on cd.cod_cidade = c.cod_cidade '+
        'left join empresa e on e.cod_empresa = c.cod_empresa ';

  if Prempresa.Text<>'' then
  begin
    if cmd2='' then
       cmd2:=' where c.cod_empresa ='+quotedstr(Prempresa.Text)
    else
       cmd2:=cmd2+' and c.cod_empresa ='+quotedstr(Prempresa.text);
  end;
  if Prcod_cidade.Text<>'' then
  begin
    if cmd2='' then
       cmd2:=' where c.cod_cidade='+quotedstr(Prcod_cidade.text)
    else
       cmd2:=cmd+' and c.cod_cidade'+quotedstr(Prcod_cidade.text);
  end;
  if Pruf.text<>'' then
  begin
    if cmd2='' then
       cmd2:=' where cd.uf='+quotedstr(Pruf.text)
    else
       cmd2:=cmd2+' and cd.uf='+quotedstr(Pruf.text);
  end;

  cmd2:= cmd2 + ' order by nom_cidade, nom_cliente';

  with dm.q_cliente do
  begin
    close;
    sql.clear;
    sql.add(cmd+cmd2);
    open;
  end;

  if not(fr_relatorio.LoadFromFile('C:\orbi\Relatorios\cliente_completo.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;




procedure TFr_opc_relatorios.monta_rel_pauta_venda(cod_grupo, cod_fonecedor: String);
var
  cmd, cmd2 :String;
begin
  cmd:= 'select cod_produto, nom_produto, unidade, qtd_embalagem, preco_venda, g.nom_grupo, qtd_estoque from produto p '+
        'left join grupo g on g.cod_grupo=p.cod_grupo '+
        'where status='+QuotedStr('N');



  if Prcod_grupo.Text<>'' then
  begin
    cmd:=cmd+' and p.cod_grupo = '+quotedstr(Prcod_grupo.text);
  end;

  if Prcod_fornecedor.Text<>'' then
  begin
    cmd2:= cmd2 + ' and p.fornecedor_principal = '+quotedstr(Prcod_fornecedor.text);
  end;

  cmd2:= cmd2 + ' order by nom_grupo, nom_produto';

  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not(fr_relatorio.LoadFromFile('C:\orbi\Relatorios\pauta_venda.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;



end;


procedure TFr_opc_relatorios.monta_rel_pauta_venda_est(cod_grupo, cod_fonecedor: String);
var
  cmd, cmd2 :String;
begin
  cmd:= 'select cod_produto, nom_produto, unidade, qtd_embalagem, preco_venda, g.nom_grupo, qtd_estoque from produto p '+
        'left join grupo g on g.cod_grupo=p.cod_grupo '+
        'where status='+QuotedStr('N');



  if Prcod_grupo.Text<>'' then
  begin
    cmd:=cmd+' and p.cod_grupo = '+quotedstr(Prcod_grupo.text);
  end;

  if Prcod_fornecedor.Text<>'' then
  begin
    cmd2:= cmd2 + ' and p.fornecedor_principal = '+quotedstr(Prcod_fornecedor.text);
  end;

  cmd2:= cmd2 + ' order by nom_grupo, nom_produto';

  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not(fr_relatorio.LoadFromFile('C:\orbi\Relatorios\pauta_venda_est.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;



procedure TFr_opc_relatorios.relatorio_transferencias(dta_inicial, dta_final, cod_fornecedor, cod_marca, cod_grupo, cod_empresa: String);
begin
  with Dm.q_entradas do
  begin
    close;
    sql.Clear;
    sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, p.custo as custo_produto,'+
            'e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,'+
            'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao, e2.sub_total,'+
            'f.razao_social,p.ref_fabrica, f.fantasia, p.nom_produto, cr.cor, tm.tamanho, cl.descricao as nom_colecao,'+
            'm.nom_marca from entrada2 e2 '+
            'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) '+
            'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor '+
            'left join produto p on p.cod_produto=e2.cod_produto '+
            'left join cores cr on cr.id=e2.id_cor '+
            'left join tamanho tm on tm.id=e2.id_tamanho '+
            'left join colecao cl on cl.id=e2.cod_colecao '+
            'left join marcas m on m.id=p.id_marca '+
            'left join empresa e on e.cod_empresa = e1.empresa_destino '+
            'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal '+
            'where dta_documento between '+QuotedStr(dta_inicial)+' and '+QuotedStr(dta_final)+' and (cod_fiscal='+QuotedStr('5152')+')'+' and rom_enviado='+QuotedStr('S'));

    if cod_empresa <> '' then
      sql.add(' and e1.empresa_destino='+QuotedStr(cod_empresa));

    if cod_fornecedor <> '' then
      sql.add(' and p.fornecedor_principal='+QuotedStr(cod_fornecedor));

    if cod_marca <> '' then
      sql.add(' and p.id_marca='+QuotedStr(cod_marca));

    if cod_grupo <> '' then
      sql.add(' and p.cod_grupo='+QuotedStr(cod_grupo));

      sql.add(' order by e.nom_empresa, fp.fantasia, p.nom_produto, e2.nr_documento ');
    open;
  end;
  if Dm.q_entradas.RecordCount <=0 then
  begin
    FRPRI.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;
  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\relacao_transferencias.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

  {  sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,'+
            'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao,'+
            'f.razao_social, f.fantasia, p.nom_produto, p.ref_fabrica, cr.cor, tm.tamanho, cl.descricao as nom_colecao,'+
            'm.nom_marca, e2.sub_total from entrada2 e2 '+
            'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) '+
            'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor '+
            'left join produto p on p.cod_produto=e2.cod_produto '+
            'left join cores cr on cr.id=e2.id_cor '+
            'left join tamanho tm on tm.id=e2.id_tamanho '+
            'left join colecao cl on cl.id=e2.cod_colecao '+
            'left join marcas m on m.id=p.id_marca '+
            'left join empresa e on e.cod_empresa = e1.empresa_destino '+
            'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal '+
            'where dta_documento between '+QuotedStr(dta_inicial)+' and '+QuotedStr(dta_final)+' and (cod_fiscal='+QuotedStr('5152')+')');}








end;

procedure TFr_opc_relatorios.Prcod_representanteButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Representante';
  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_opc_relatorio_representante';
  chamou_cadastro := 'Fr_representante';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Representante';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i:=0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
     Lbnom_representante.Caption:= '...';

  if Prcod_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante from representante where id='+QuotedStr(Prcod_representante.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prcod_representante.Text:= '';
      Prcod_representante.SetFocus;
      Exit;
    end;
  end;
end;


procedure TFr_opc_relatorios.PrfopButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_opc_relatorio_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fop';
  Fr_localizar.BT_cadastro.Visible := true;

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

procedure TFr_opc_relatorios.PrfopKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prfop.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_opc_relatorio_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fop';
      Fr_localizar.BT_cadastro.Visible := true;

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

    SelectNext(sender as TWinControl, true,true);
    key:=#0;
  end;

end;

procedure TFr_opc_relatorios.PrfopExit(Sender: TObject);
begin
  if trim(Prfop.Text) = '' then
     lbfop.Caption:= '...';

  if Prfop.Text <> '' then
  begin
    dao.Geral2('select nom_fop from fop where cod_fop='+QuotedStr(Prfop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbfop.Caption := dao.Q2.fieldbyname('nom_fop').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      Prfop.Text:= '';
      Prfop.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.relatorio_contas_receber(dta_ini, dta_fin, cod_empresa, cod_representante, cod_cliente, cod_fop, finalizado: String);
var
  cmd: string;
begin
  cmd:='select dtaven, dtarec, titulo, sequencia,valor, valor_recebido, '+
       'c.nom_cliente, c.telefone, fp.nom_fop, e.nom_empresa, r.nom_representante from cr1 cr1 '+
       'left join cliente c on c.cod_cliente= cr1.cod_cliente '+
       'left join fop fp on fp.cod_fop=cr1.cod_fop '+
       'left join empresa e on e.cod_empresa=cr1.cod_empresa '+
       'left join representante r on r.id=cr1.id_representante '+
       'where dtaven between '+QuotedStr(dta_ini)+' and '+QuotedStr(dta_fin);

   if Prempresa.Text <> '' then
      cmd:= cmd + ' and cr1.cod_empresa= '+QuotedStr(Prempresa.Text);

   if Prcod_representante.Text <> '' then
      cmd:= cmd + ' and cr1.cod_representante='+QuotedStr(Prcod_representante.Text);

   if Prcod_cliente.Text <> '' then
      cmd:= cmd + ' and cr1.cod_cliente='+QuotedStr(Prcod_cliente.Text);

   if Prfop.Text <> '' then
      cmd:= cmd + ' and cr1.cod_fop='+QuotedStr(Prfop.Text);

   if finalizado = 'S' then
      cmd:= cmd + ' and dtarec is not null '
   else
   if finalizado = 'N' then
      cmd:= cmd + ' and dtarec is null';


    cmd:= cmd + ' order by cr1.cod_empresa, cr1.dtaven';
    with Dm.q_contas_receber do
    begin
      Close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;

    if Dm.q_contas_receber.RecordCount <= 0 then
    begin
      frpri.msg('Não foi encontrado Registros para gerar o Relatório');
      exit;
    end;

    if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\contas_receber.fr3')) then
    begin
      FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
      exit;
    end;
    fr_relatorio.ShowReport;



   end;




procedure TFr_opc_relatorios.Prcod_representanteKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;

  if key=#13 then
  begin
    if (Prcod_representante.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Representante';
      chamou_pesquisa := 'fr_representante';
      chamou_form := 'fr_opc_relatorio_representante';
      chamou_cadastro := 'Fr_representante';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Representante';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,5);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Empresa';
      Campos_combo[3] := 'CNPJ';
      Campos_combo[4] := 'CPF';

      for i:=0 to 4 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;

end;

procedure TFr_opc_relatorios.relatorio_vendas_vendedor(c_fornecedor,
  c_loja, c_grupo, c_vendedor, c_marca: String);
var
  cmd: string;
begin
  cmd:= 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_principal, '+
     't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, '+
     'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 '+
     'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
     'left join fop fp on fp.cod_fop = v1.cod_fop '+
     'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
     'left join cores c on c.id = v2.id_cor '+
     'left join tamanho t on t.id = v2.id_tamanho '+
     'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
     'left join representante r on r.id=v1.cod_representante '+
     'left join marcas m on m.id=p.id_marca '+
     'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal '+
     'left join empresa e on e.cod_empresa = v1.cod_empresa '+
     'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
     ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D');

      if c_fornecedor <> '' then
         cmd:= cmd + ' and p.fornecedor_principal = ' + QuotedStr(c_fornecedor);

      if c_loja <> '' then
         cmd:= cmd + ' and v1.cod_empresa = ' + QuotedStr(c_loja);

      if c_grupo <> '' then
         cmd:= cmd + ' and p.cod_grupo='+QuotedStr(c_grupo);

      if c_vendedor <> '' then
         cmd:= cmd + ' and v1.cod_representante='+QuotedStr(c_vendedor);

      if c_marca <> '' then
         cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);

      cmd:= cmd + ' order by e.nom_empresa, r.nom_representante, f.fantasia, v1.numdoc ';

  with dm.q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas2.RecordCount <= 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\vendas_vendedor.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;




end;

procedure TFr_opc_relatorios.relatorio_vendas_padrao(c_fornecedor, c_loja,
  c_grupo, c_vendedor, c_marca: String);
var
  cmd: string;
begin
  cmd:= 'select numdoc, dtadoc, tot_liquido, c.nom_cliente from vendas1 v1 '+
        'left join cliente c on c.cod_cliente=v1.cod_cliente '+
        'where v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0');

      if zzfaturado.Checked then
         cmd:= cmd + ' and v1.dta_emissao between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))
      else
         cmd:= cmd + ' and v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date));

      if c_fornecedor <> '' then
         cmd:= cmd + ' and p.fornecedor_principal = ' + QuotedStr(c_fornecedor);

      if c_loja <> '' then
         cmd:= cmd + ' and v1.cod_empresa = ' + QuotedStr(c_loja);

      if c_grupo <> '' then
         cmd:= cmd + ' and p.cod_grupo='+QuotedStr(c_grupo);

      if c_vendedor <> '' then
         cmd:= cmd + ' and v1.cod_representante='+QuotedStr(c_vendedor);

      if c_marca <> '' then
         cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);

       if zzfaturado.Checked then
          cmd:= cmd + ' and faturado='+QuotedStr('1')
       else
       if zznao_faturado.Checked then
          cmd:= cmd + ' and faturado='+QuotedStr('0');

      cmd:= cmd + ' order by dtadoc';

  with dm.q_vendas1 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;


  if dm.q_vendas1.RecordCount < 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\vendas_padrao_ind.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_ind(codgrupo,
  codfor: String);
var
   Excel: Variant;
   nom_arquivo: string;
   linha: integer;
   cod_produto:String;
   ac_qtd: Real;
   cmd: String;
begin
  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\posicao_estoque_simplificado_ind.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;

   cmd:='select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, g.nom_grupo, pro.preco_venda, f.razao_social from produto pro '+
        'left join grade gd on gd.cod_produto=pro.cod_produto '+
        'left join cores cr on cr.id=gd.id_cor '+
        'left join tamanho tm on tm.id=gd.id_tamanho '+
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal '+
        'left join grupo g on g.cod_grupo = pro.cod_grupo ';


   cmd := cmd + 'where pro.qtd_estoque > 0 and status='+QuotedStr('N');

   if codfor <> '' then
      cmd:= cmd + ' and pro.fornecedor_principal = '+QuotedStr(codfor);

   if codgrupo <> '' then
      cmd:= cmd + ' and pro.cod_grupo = '+ QuotedStr(codgrupo);

   cmd:= cmd + ' order by f.razao_social, g.nom_grupo';

  with DM.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    close;
  end;
  fr_relatorio.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_venda(codgrupo,
  codpro, codfor: String);
var
   cmd: String;
begin
  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\posicao_estoque_preco_venda.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;

  cmd:='select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, g.nom_grupo, pro.preco_venda, f.razao_social from produto pro '+
       'left join grade gd on gd.cod_produto=pro.cod_produto '+
       'left join cores cr on cr.id=gd.id_cor '+
       'left join tamanho tm on tm.id=gd.id_tamanho '+
       'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal '+
       'left join grupo g on g.cod_grupo = pro.cod_grupo ';


  cmd := cmd + 'where pro.qtd_estoque > 0 and status='+QuotedStr('N');

  if codfor <> '' then
     cmd:= cmd + ' and pro.fornecedor_principal = '+QuotedStr(codfor);

  if codgrupo <> '' then
     cmd:= cmd + ' and pro.cod_grupo = '+ QuotedStr(codgrupo);

  cmd:= cmd + ' order by f.razao_social, g.nom_grupo';

  with DM.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    close;
  end;
  fr_relatorio.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_venda_ind(codgrupo,
  codpro, codfor: String);
begin

end;

procedure TFr_opc_relatorios.relatorio_solicitacao_compra(codfor,
  codgru: string);
var
  cmd: string;
  excel: Variant;
  i: Integer;
  qtd, ac_qtd, ac_totcusto: Real;
begin

  cmd:= 'select cod_produto, nom_produto, qtd_estoque, qtd_reservado, p.cod_grupo, g.nom_grupo, fornecedor_principal, custo from produto p '+
        'left join grupo g on g.cod_grupo=p.cod_grupo '+
        'where status='+QuotedStr('N');
  if codgru <> '' then
     cmd:= cmd + ' and p.cod_grupo =' +QuotedStr(codgru);

  if codfor <> '' then
    cmd:= cmd + ' and p.forncedor_principal = '+ QuotedStr(codfor);

  dao.Geral1(cmd);

//   DeleteFile(ExtractFilePath(ParamStr(0)) + 'Temporario\ordem compra.xls');

   Excel := CreateOleObject('Excel.Application');
   Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\ordem_compra.xls');
//   Excel.workbook

   Excel.Visible := false;

   Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

   dao.Q1.First;
//   Excel.

   Excel.WorkBooks[1].Sheets[1].Cells[2,4]:= FormatDateTime('dd/mm/yyyy', now);
   Excel.WorkBooks[1].Sheets[1].Cells[3,4]:= copy(dao.Q1.FieldByName('nom_grupo').AsString,1,35);
   i:= 13;
   while not(dao.Q1.Eof) do
   begin
     if dao.Q1.FieldByName('qtd_estoque').AsFloat - dao.Q1.FieldByName('qtd_reservado').AsFloat < 0 then
     begin
       Excel.WorkBooks[1].Sheets[1].Cells[i,1]:= dao.Q1.FieldByName('cod_produto').AsString+'/ '+copy(dao.Q1.FieldByName('nom_produto').AsString,1,41);
       qtd:= dao.Q1.FieldByName('qtd_estoque').AsFloat - dao.Q1.FieldByName('qtd_reservado').AsFloat;
       if qtd < 0 then
          qtd:= qtd * -1;

       FRPRI.AlinhaCel(Excel,1,'B'+IntToStr(i)+':E'+IntToStr(i),2,4);
       Excel.WorkBooks[1].Sheets[1].Cells[i,2]:= qtd;
       Excel.WorkBooks[1].sheets[1].cells[i,3]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
       Excel.WorkBooks[1].Sheets[1].Cells[i,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * qtd);
       ac_qtd:= ac_qtd + qtd;
       ac_totcusto:= ac_totcusto + dao.Q1.FieldByName('custo').AsFloat * qtd;
       i:= i +1;
     end;
     dao.Q1.Next;
   end;
   i:= i+1;
   FRPRI.AlinhaCel(Excel,1,'A'+IntToStr(i)+':E'+IntToStr(i),2,4);
   Excel.WorkBooks[1].sheets[1].cells[i,1]:= 'TOTAL:';
   FRPRI.BordaCelGeral(Excel,1,'B'+IntToStr(i)+':B'+IntToStr(i),2);
   Excel.WorkBooks[1].sheets[1].cells[i,2]:= FormatFloat('###,##0.00',ac_qtd);
   FRPRI.BordaCelGeral(Excel,1,'D'+IntToStr(i)+':D'+IntToStr(i),2);
   Excel.WorkBooks[1].sheets[1].cells[i,4]:= FormatFloat('###,##0.00',ac_totcusto);

  // Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'Temporario\ordem compra.xls');

   Excel.Visible:= true;

end;

procedure TFr_opc_relatorios.relatorio_comissao_venda(codrep, dta_inicial,
  dta_final, faturado: string);
var
  cmd: string;
begin
  cmd:= 'select numdoc, dtadoc, tot_liquido,vlr_comissao, c.nom_cliente, r.nom_representante, r.fone, r.celular, '+
        'r.nr_conta_corrente, r.nr_agencia, r.nr_banco  from vendas1 v1 '+
        'left join cliente c on c.cod_cliente=v1.cod_cliente '+
        'left join representante r on r.id=v1.cod_representante '+
        'where dtadoc between '+QuotedStr(dta_inicial)+' and ' +quotedstr(dta_final);

                                                        
  if codrep <> '' then
     cmd:= cmd + ' and cod_representante='+QuotedStr(codrep);

  if  faturado = 'S' then
     cmd:= cmd + ' and faturado='+QuotedStr('1')
  else
  if faturado = 'N' then
     cmd:= cmd + ' and faturado='+QuotedStr('0');

  cmd := cmd + ' order by nom_representante, dtadoc ';
  with Dm.q_comissao_venda do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    open;
  end;

  if dm.q_comissao_venda.RecordCount < 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\relatorio_comissao_venda.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;






end;

procedure TFr_opc_relatorios.relatorio_rankin_clientes;
var
  cmd: string;
  clientes: string;
begin
  cmd:='select first 30 v1.cod_cliente, c.nom_cliente, sum(tot_liquido) as tot_liquido from vendas1 v1 '+
       'left join cliente c on c.cod_cliente=v1.cod_cliente '+
       'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
       ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D')+
       ' group by v1.cod_cliente,c.nom_cliente '+
       ' order by 3 desc ';

  with dm.q_rankin_simplificado do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if Dm.q_rankin_simplificado.RecordCount > 0 then
  begin
    Dm.q_rankin_simplificado.First;
    while not(dm.q_rankin_simplificado.Eof) do
    begin
      if clientes = '' then
         clientes:= ' v2.cod_cliente='+quotedStr(Dm.q_rankin_simplificado.fieldbyname('cod_cliente').AsString)
      else
         clientes:= clientes + ' or v2.cod_cliente= '+quotedStr(Dm.q_rankin_simplificado.fieldbyname('cod_cliente').AsString);
      Dm.q_rankin_simplificado.Next;
    end;
  end;

  cmd:= 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email, '+
     't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, p.fornecedor_principal, e.nom_empresa, '+
     'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 '+
     'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
     'left join fop fp on fp.cod_fop = v1.cod_fop '+
     'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
     'left join cores c on c.id = v2.id_cor '+
     'left join tamanho t on t.id = v2.id_tamanho '+
     'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
     'left join representante r on r.id=v1.cod_representante '+
     'left join marcas m on m.id=p.id_marca '+
     'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal '+
     'left join empresa e on e.cod_empresa = v1.cod_empresa '+
     'where '+clientes+' and v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
     ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D');
      cmd:= cmd + ' order by v2.cod_cliente, v2.dtadoc ';


  with dm.q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;


  if dm.q_vendas2.RecordCount < 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\ranking_cliente.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;



end;

procedure TFr_opc_relatorios.relatorio_rankin_clientes_simplificado(dta_inicial: TDate; dta_final: TDate);
var
  cmd:string;
begin
  cmd:='select first 30 v1.cod_cliente, c.nom_cliente, sum(tot_liquido) as tot_liquido from vendas1 v1 '+
       'left join cliente c on c.cod_cliente=v1.cod_cliente '+
       'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
       ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D')+
       ' group by v1.cod_cliente, c.nom_cliente '+
       ' order by 3 desc ';

  with dm.q_rankin_simplificado do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_rankin_simplificado.RecordCount <= 0 then
  begin
    frpri.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fr_relatorio.LoadFromFile('c:\orbi\relatorios\ranking_cliente_simplificado.fr3')) then
  begin
    FRPRI.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;


procedure TFr_opc_relatorios.relatorio_auxiliar_compra(Modo: ShortString;  tipofonte: TTipoFonte); // relatorio auxiliar de compra
var
  totpag, total, custo, actot: real;
  cmd, gru_ant, for_ant: String;
  lh: integer;
begin
  tipo_fonte:= tipofonte;

  cmd:= cmd + 'select p.cod_produto, cod_prateleira, nom_produto, unidade, qtd_estoque_min, qtd_estoque, qtd_reservado, status, p.cod_grupo, g.nom_grupo, fornecedor_principal, f.razao_social from produto p '+
              'left join fornecedor f on f.cod_fornecedor = p.fornecedor_principal '+
              'left join grupo g on g.cod_grupo = p.cod_grupo '+
              'where status = ' + QuotedStr('N');

  if Prcod_fornecedor.Text <> '' then
     cmd:= cmd + 'and p.fornecedor_principal = ' + QuotedStr(PRcod_fornecedor.Text);

  if Prcod_grupo.Text <> '' then
     cmd:= cmd + 'and p.cod_grupo = ' + QuotedStr(PRcod_grupo.Text);

  cmd:= cmd + ' order by f.razao_social, g.nom_grupo, nom_produto';
  dao.Geral1(cmd);
  dao.Q1.First;
  for_ant:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
  gru_ant:= dao.Q1.fieldbyname('cod_grupo').AsString;
  lh:= 5;
  configuraRD(S17cpp,Epson,140, 70, Seis, false, true);

  rd.abrir;            // Inicia a montagem do relatório...
  LH:=10;
  rd.impf(08,01,'FORNECEDOR :' + dao.Q1.fieldbyname('razao_social').AsString,[tipo_fonte, negrito]);
  rd.impf(09,05,'GRUPO :' + dao.Q1.fieldbyname('nom_grupo').AsString,[tipo_fonte, negrito]);


  while not(dao.Q1.Eof) do // Enquanto não for o fim
  begin                          // do arquivo...
    if LH >= 60 then
    begin
      rd.novapagina;
      lh:=8;
    end;

    if for_ant <> dao.Q1.FieldByName('fornecedor_principal').AsString then
    begin
      rd.impf(LH,01,'FORNECEDOR :' + dao.Q1.fieldbyname('razao_social').AsString,[tipo_fonte, negrito]);
      for_ant:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
      lh:= lh + 2;
    end;

    if gru_ant <> dao.q1.FieldByName('cod_grupo').AsString then
    begin
      rd.impf(LH,05,'GRUPO :' + dao.Q1.fieldbyname('nom_grupo').AsString,[tipo_fonte, negrito]);
      gru_ant:= dao.Q1.fieldbyname('cod_grupo').AsString;
      lh:= lh + 1;
    end;
//  2   14       22                                       63             77                94                 112          122

    rd.impf(LH,02,dao.Q1.fieldbyname('cod_produto').AsString,[tipo_fonte]);
    rd.impf(LH,17,dao.Q1.fieldbyname('cod_prateleira').AsString,[tipo_fonte]);
    rd.impf(LH,23,copy(dao.q1.fieldbyname('nom_produto').AsString,1,40),[tipo_fonte]);
    rd.impf(LH,66,dao.Q1.fieldbyname('unidade').AsString,[tipo_fonte]);
    rd.impD(LH,76,formatfloat('###,##0.00',dao.Q1.fieldbyname('QTD_ESTOQUE').AsFloat),[tipo_fonte]);
    rd.impD(LH,86,formatfloat('###,##0.00',dao.Q1.fieldbyname('QTD_RESERVADo').AsFloat),[tipo_fonte]);
    rd.impD(LH,96,formatfloat('###,##0.00',dao.Q1.fieldbyname('QTD_ESTOQUE').AsFloat-dao.Q1.fieldbyname('QTD_RESERVADO').AsFloat),[tipo_fonte]);

    dao.Geral2('select first 1 e2.qtd_entrada, e2.custo, e1.dta_documento from entrada2 e2 '+
                 'left join entrada1 e1 on e1.nr_documento=e2.nr_documento and e1.cod_fornecedor=e2.cod_fornecedor '+
                 'where e2.cod_produto = '+QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString)+
                 ' order by e1.dta_documento desc');

    rd.impD(LH,106,formatfloat('###,##0.00',dao.Q2.fieldbyname('qtd_entrada').AsFloat),[tipo_fonte]);
    rd.impD(LH,116,formatfloat('###,##0.00',dao.Q2.fieldbyname('custo').AsFloat),[tipo_fonte]);
    if (dao.q2.FieldByName('dta_documento').AsString<>'') then
       rd.impf(LH,126,formatdatetime('dd/mm/yyyy', dao.q2.fieldbyname('dta_documento').AsDateTime),[tipo_fonte]);


    dao.Q1.next;
    lh:= lh + 1;

  end;
  rd.fechar;  // Encerra o relatório...

end;


procedure TFr_opc_relatorios.configuraRD(fonteTamanho: TSize;
  tipoImpressora: TModelo; qtdcoluna, qtdlinha: integer; qtdLpp: TLinha;
  testaporta, usaGerenciador: boolean);
begin
  //fonteTamanho: TSize; ex : s10cpp , s12cpp, s17cpp
  //tipoImpressora: TModelo; ex epson, grafico, hp, rima
  //qtdcoluna, qtdlinha: integer; ex numero inteiro
  // qtdLpp: TLinha; ex: seis , oito
  //testaporta, usaGerenciador: boolean); ex true ou false
  with RD do
  begin
    FonteTamanhoPadrao:= fonteTamanho;
    Impressora:= Impressora;
    TamanhoQteColunas:= qtdcoluna;
    TamanhoQteLinhas:= qtdlinha;
    qtdLpp:= qtdLpp;
    TestarPorta:= testaporta;
    UsaGerenciadorImpr:=usaGerenciador;
  end;
end;

                                 

procedure TFr_opc_relatorios.RDNewPage(Sender: TObject; Pagina: Integer);
begin
  if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    RD.impf(02,118,'Pág: ' + formatfloat('000',pagina),[normal]);
    if tipo_fonte = comp17 then
       RD.impf(03,002,'=======================================================================================================================================',[tipo_fonte]);

    RD.impc(04,050,'****   '+nom_empresa+'   ****', [NEGRITO]);
    RD.impc(05,050,'RELATÓRIO AUXILIAR DE COMPRA'   ,[tipo_fonte, negrito]);

    if tipo_fonte = comp17 then
       RD.impf(06,002,'=======================================================================================================================================',[tipo_fonte]);

    RD.impf(07,002,'Codigo       Pratel.             Produto                      Unid.  Disp      Res     Total     qtd Ent     Custo        Data_Ult ',[tipo_fonte]);
    //              2            14       22                                       63             77                94                 112          122
  end

end;

end.

