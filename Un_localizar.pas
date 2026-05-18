unit Un_localizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Mask,
  ExtCtrls, DBGrids, DB, ImgList, sFrameAdapter,
  sSkinProvider, sPanel, sBitBtn, sLabel, sCheckBox, acDBGrid, sDBCheckBox,
  RxMemDS, sGroupBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_localizar = class(TForm)
    ds_localizar: TDataSource;
    DgLocalizar: TDbGrid;
    Panel1: tsPanel;
    Label1: tsLabel;
    Label2: tsLabel;
    EDlocalizar: TMaskEdit;
    BT_cadastro: TsBitBtn;
    BT_pesquisar: TsBitBtn;
    CBcampos: TComboBox;
    zzbusca_qualquer: tscheckbox;
    ImageList1: TImageList;
    sSkinProvider1: TsSkinProvider;
    dsnone: TDataSource;
    Qu_localizar: TFDQuery;
    ckAgrupar: TsDBCheckBox;
    mmLocalizar: TRxMemoryData;
    ckAtivos: TRadioGroup;
    rgTipoFunc: TsRadioGroup;
    procedure BT_pesquisarClick(Sender: TObject);
    procedure CBcamposKeyPress(Sender: TObject; var Key: Char);
    procedure EDlocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure EDlocalizarEnter(Sender: TObject);
    procedure CBcamposSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sglocKeyPress(Sender: TObject; var Key: Char);
    procedure sglocDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DgLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure DgLocalizarDblClick(Sender: TObject);
    procedure BT_cadastroClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EDlocalizarExit(Sender: TObject);
    procedure EDlocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DgLocalizarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Qu_localizarAfterOpen(DataSet: TDataSet);
    procedure DgLocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    nova_pesquisa: boolean;
    procedure mostra_campos;
    procedure ListarSelecionados;

    procedure loc_categoria_estoque(valor: string);
    procedure loc_estrutura_clonar(valor: string);
    procedure loc_entrada_producao(valor: string);
    procedure loc_etapa_producao(valor: string);
    procedure loc_vendas(valor: string);
    procedure loc_produto(valor: string);
    procedure loc_Cliente(valor: string);
    procedure loc_fornecedor(valor: string);
    procedure loc_grupo(valor: string);
    procedure loc_usuario(valor: string);
    procedure loc_cidade(valor: string);
    procedure loc_mesoregiao(valor: string);
    procedure loc_microregiao(valor: string);
    procedure loc_fop(valor: string);
    procedure loc_cod_fiscal(valor: string);
    procedure loc_entrada(valor: string);
    procedure loc_empresa(valor: string);
    procedure loc_transportadora(valor: string);
    procedure loc_cores(valor: string);
    procedure loc_tamanho(valor: string);
    procedure loc_colecao(valor: string);
    procedure loc_vendas_carga(valor: string);
    // puxa todas as vendas não faturadas para a montagem de carga
    procedure loc_uf(valor: string);
    procedure loc_cheque_terceiros(valor: string);
    procedure loc_cheques(valor: string);
    procedure loc_representante(valor: string);
    procedure loc_conta_corrente(valor: string);
    procedure loc_banco(valor: string);
    procedure loc_motivo(valor: string);
    procedure loc_categoria(valor: string);
    procedure loc_mes(valor: string);
    procedure loc_prazo_pagamento(valor: string);
    procedure loc_unidade(valor: string);
    procedure loc_motorista(valor: string);
    procedure loc_veiculos(valor: string);
    procedure loc_cargas(valor: string);
    procedure loc_marca(valor: string);
    procedure loc_compra(valor: string);
    procedure loc_pre_pedido(valor: string);
    procedure loc_ncm(valor: string);
    procedure loc_plano_conta(valor: string);
    procedure loc_categoria_produto(valor: string);
    procedure loc_subcategoria_produto(valor: string);
    procedure loc_recibo(valor: string);
    procedure loc_vendas_ref(valor: string);
    procedure loc_vendas_complementar(valor: string);
    procedure loc_ordem_compra(valor: string);
    procedure loc_usuario_log(valor: string);
    procedure loc_aviso(valor: string);
    procedure loc_remessa_boleto(valor: string);
    { Public declarations }
  end;

var
  Fr_localizar: TFr_localizar;
  selecionados: string;
  tem_selecionado: boolean;

implementation

uses unpri, un_dao, Un_Fornecedor, Un_configuracao, Un_Cliente, Un_grupo,
  Un_produto, Un_entrada, Un_Transportadora, UnUsu, UnDmConSis,
  Un_Cadempresa, Math, Un_cor,
  un_tamanho, Un_colecao, Un_contas_pagar,
  Unacerto_estoque, Un_opc_relatorios,
  Un_contas_receber, Un_cheque_terceiros, Un_cheques,
  Un_representante, Un_banco, Un_conta_corrente, Un_vendas_industria2, Un_pedido_simplificado,
  Un_prazo_pagamento, Un_montagem_carga, Un_motorista, Un_veiculos,
  Un_marcas, Un_pedidos, Un_pesquisa_produto_vendas, Un_pre_pedido, Un_ncm,
  Un_nfe_envio_lote, Un_cidade, Un_nfe_arquivos, Un_nfe_danfe,
  un_conta_descontada,
  Un_categoria, un_subcategoria, Un_recibo, un_nfe_complementar,
  Un_mala_direta, un_transf_valores, Un_produto_fornecedor,
  Un_frete_combinado, Un_etiquetas_produtos, Un_calcular_salarios,
  Un_calcular_comissoes, Un_ordem_compra, Un_log, UnFun,
  Un_forma_pagamento, un_ler_retorno, Un_aviso_representantes_avulso,
  un_remessa_boleto, Un_motivo_nfe_cancel, Un_produto_nao_revenda,
  un_produto_detalhes, un_impostos, un_ultimas_vendas, Un_tabela_unidade,
  Un_calcular_13o_salarios, Un_cfop, un_controle_visitas, un_etiquetas_multiplos_produtos,
  Un_representantes_clientes, un_estrutura_produto, un_entrada_producao,
  Un_etapas_producao, Un_plano_contas, un_alterar_preco;

{$R *.dfm}

procedure TFr_localizar.BT_pesquisarClick(Sender: TObject);
begin
  mmLocalizar.DisableControls;
  if trim(EDlocalizar.Text) = trim('') then
  begin
    dao.msg('Digite ao menos 2 letras para pesquisar');
    EDlocalizar.setfocus;
    exit;
  end;
  if letra_maiuscula = false then
    letra_maiuscula := true;

  selecionados := '';

  if chamou_pesquisa = 'fr_log' then
  begin
    loc_usuario_log(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_fornecedor' then
  begin
    loc_fornecedor(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cidades' then
  begin
    if letra_maiuscula = false then
      letra_maiuscula := true;

    loc_cidade(trim(EDlocalizar.Text));

    letra_maiuscula := false;
  end
  else if chamou_pesquisa = 'fr_microregiao' then
  begin
    if letra_maiuscula = false then
      letra_maiuscula := true;

    loc_microregiao(trim(EDlocalizar.Text));

    letra_maiuscula := false;
  end
  else if chamou_pesquisa = 'fr_mesoregiao' then
  begin
    if letra_maiuscula = false then
      letra_maiuscula := true;

    loc_mesoregiao(trim(EDlocalizar.Text));

    letra_maiuscula := false;
  end
  else if chamou_pesquisa = 'fr_aviso' then
  begin
    loc_aviso(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_recibo' then
  begin
    loc_recibo(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cliente' then
  begin
    loc_Cliente(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_grupo' then
  begin
    loc_grupo(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_ordem_compra' then
  begin
    loc_ordem_compra(trim(EDlocalizar.Text));
  end
  else if (chamou_pesquisa = 'fr_subcategoria') or
    (chamou_pesquisa = 'fr_opc_relatorio_subcategoria') then
  begin
    loc_subcategoria_produto(trim(EDlocalizar.Text));
  end
  else if (chamou_pesquisa = 'fr_categoria') or
    (chamou_pesquisa = 'fr_opc_relatorio_categoria') then
  begin
    loc_categoria_produto(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_produto' then
  begin
    loc_produto(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_estrutura_clonar' then
  begin
    loc_estrutura_clonar(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_usuario' then
  begin
    loc_usuario(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cod_fiscal' then
  begin
    loc_cod_fiscal(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_fop' then
  begin
    loc_fop(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_entrada' then
  begin
    loc_entrada(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_transportadora' then
  begin
    loc_transportadora(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_usuario' then
  begin
    loc_usuario(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_plano_conta' then
  begin
    loc_plano_conta(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_empresa' then
  begin
    loc_empresa(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cor' then
  begin
    loc_cores(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_tamanho' then
  begin
    loc_tamanho(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_vendas' then
  begin
    loc_vendas(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_pedido_ref' then
  begin
    loc_vendas_ref(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_pedido_complementar' then
  begin
    loc_vendas_complementar(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_pedido' then
  begin
    loc_vendas(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_entrada_producao' then
  begin
    loc_entrada_producao(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_pedido_carga' then
  begin
    loc_vendas_carga(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_colecao' then
  begin
    loc_colecao(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cheque_terceiros' then
  begin
    loc_cheque_terceiros(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_cheques' then
  begin
    loc_cheques(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_supervisor' then
  begin
    loc_representante(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_representante' then
  begin
    loc_representante(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_banco' then
  begin
    loc_banco(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_etapa_producao' then
  begin
    loc_etapa_producao(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_motivo' then
  begin
    loc_motivo(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_conta_corrente' then
  begin
    loc_conta_corrente(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_categoria_estoque' then
  begin
    loc_categoria_estoque(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_prazo' then
  begin
    loc_prazo_pagamento(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_motorista' then
  begin
    loc_motorista(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_veiculos' then
  begin
    loc_veiculos(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_carga' then
  begin
    loc_cargas(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_marca' then
  begin
    loc_marca(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_unidade' then
  begin
    loc_unidade(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_compra' then
  begin
    loc_compra(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_UF' then
  begin
    loc_uf(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_prepedido' then
  begin
    loc_pre_pedido(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'fr_ncm' then
  begin
    loc_ncm(trim(EDlocalizar.Text));
  end
  else if chamou_pesquisa = 'frm_remessa_boleto' then
  begin
    loc_remessa_boleto(trim(EDlocalizar.Text));
  end;

  letra_maiuscula := false;

  mmLocalizar.EnableControls;

  DgLocalizar.setfocus;
end;

procedure TFr_localizar.loc_remessa_boleto(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'SELECT distinct a.ID, a.DATA, a.CONTA, c.NOM_CONTA ' +
    'FROM BOLETO_REMESSA_ORDEM a ' +
    'left outer join CONTA_CORRENTE c on (c.ID = a.CONTA) ';

  if CBcampos.Text = 'Nº Remessa' then
  begin
    cmd := cmd + 'where a.id = ' + QuotedStr(valor)+' order by a.DATA  desc';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Banco' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where c.NOM_CONTA like ' + QuotedStr('%' + valor + '%') +
        ' order by a.DATA  desc'
    else
      cmd := cmd + 'where c.NOM_CONTA like ' + QuotedStr(valor + '%') +
        ' order by a.DATA desc';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Conta' then
  begin
    cmd := cmd + 'where a.CONTA = ' + valor +  ' order by a.DATA  desc ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data' then
  begin
    cmd := cmd + 'where a.DATA like ' + QuotedStr(valor) +
      ' order by a.DATA desc';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Nº Remessa';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('conta').DisplayLabel := 'Conta';
  mmLocalizar.fieldbyname('conta').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_conta').DisplayLabel := 'Banco';
  mmLocalizar.fieldbyname('Data').DisplayLabel := 'Data';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_fornecedor(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select cod_fornecedor, Razao_social,Fantasia, CNPCPF, c.nom_cidade, c.uf  from fornecedor f '
    + 'left join cidades c on f.cod_cidade = c.cod_cidade ';

  if chamou_form = 'fr_entrada_fornecedor' then
    cmd := cmd + 'where inativo <> ''S'''
  else
    cmd := cmd + 'where 1 = 1';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + ' and cod_fornecedor = ' + QuotedStr(valor);
  end
  else if CBcampos.Text = 'Razão Social' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and razao_social like ' + QuotedStr('%' + valor + '%') +
        ' order by 1'
    else
      cmd := cmd + ' and razao_social like ' + QuotedStr(valor + '%') +
        ' order by 1';
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and CNPCPF like ' + QuotedStr('%' + valor + '%') +
        ' order by CNPCPF'
    else
      cmd := cmd + ' and CNPCPF like ' + QuotedStr(valor + '%') +
        ' order by CNPCPF';
  end
  else if CBcampos.Text = 'Fantasia' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and fantasia like ' + QuotedStr('%' + valor + '%') +
        ' order by 3 '
    else
      cmd := cmd + ' and fantasia like ' + QuotedStr(valor + '%') +
        ' order by 3';
  end
  else if CBcampos.Text = 'Cidade' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and c.nom_cidade like ' + QuotedStr('%' + valor + '%') +
        ' order by c.nom_cidade'
    else
      cmd := cmd + ' and c.nom_cidade like ' + QuotedStr(valor + '%') +
        ' order by c.nom_cidade';

  end;

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_fornecedor').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_fornecedor').DisplayWidth := 5;
  mmLocalizar.fieldbyname('razao_social').DisplayLabel :=
    'Fornecedor(Razão Social)';
  mmLocalizar.fieldbyname('Fantasia').DisplayLabel := 'Fornecedor(Fantasia)';
  mmLocalizar.fieldbyname('CNPCPF').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';
  mmLocalizar.fieldbyname('uf').DisplayLabel := 'UF';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_Cliente(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select cod_cliente, nom_cliente, nom_fantasia, c.nom_cidade, cnpj, CPF, IE from cliente cl '
    + 'left join cidades c on c.cod_cidade = cl.cod_cidade where 1 = 1 ';

  if frpri.TipUsu = '0' then
  begin
    if not frpri.supervisor then
      cmd := cmd + ' and ID_REPRESENTANTE = ' + frpri.Representante_id
    else
      cmd := cmd +
        ' and ID_REPRESENTANTE =  in (select r.ID from REPRESENTANTE r where r.FUNCIONARIO = ''0'' and r.ATIVO = ''S'')  and cl.cliente_bloqueado = ''N'' ';
  end;

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + ' and cod_cliente = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    cmd := cmd + ' and cnpj = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;

  end
  else if CBcampos.Text = 'CPF' then
  begin
    cmd := cmd + ' and cpf = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;

  end
  else if CBcampos.Text = 'I.E' then
  begin
    cmd := cmd + ' and ie = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Razão Social' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and nom_cliente like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_cliente'
    else
      cmd := cmd + ' and nom_cliente like ' + QuotedStr(valor + '%') +
        ' order by nom_cliente';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome Fantasia' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and NOM_FANTASIA like ' + QuotedStr('%' + valor + '%') +
        ' order by NOM_FANTASIA'
    else
      cmd := cmd + ' and NOM_FANTASIA like ' + QuotedStr(valor + '%') +
        ' order by NOM_FANTASIA';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Cidade' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and nom_cidade like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_cidade'
    else
      cmd := cmd + ' and nom_cidade like ' + QuotedStr(valor + '%') +
        ' order by nom_cidade';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_cliente').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_cliente').DisplayWidth := 5;

  mmLocalizar.fieldbyname('nom_cliente').DisplayLabel := 'Razão Social';

  mmLocalizar.fieldbyname('nom_fantasia').DisplayLabel := 'Nome Fantasia';

  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';

  mmLocalizar.fieldbyname('cnpj').DisplayLabel := 'CNPJ';

  mmLocalizar.fieldbyname('cpf').DisplayLabel := 'CPF';

  mmLocalizar.fieldbyname('ie').DisplayLabel := 'IE';

  // //DgLocalizar.SetFocus;

end;

procedure TFr_localizar.CBcamposKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    EDlocalizar.setfocus;
    Key := #0;
  end;

end;

procedure TFr_localizar.EDlocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BT_pesquisar.setfocus;
    Key := #0;
  end;

end;

procedure TFr_localizar.EDlocalizarEnter(Sender: TObject);
begin
  if (EDlocalizar.Text <> '') then
  begin
    EDlocalizar.EditMask := '';
    EDlocalizar.Text := stringreplace(EDlocalizar.Text, '.', '',
      [rfReplaceAll]);
    EDlocalizar.Text := stringreplace(EDlocalizar.Text, '/', '',
      [rfReplaceAll]);
    EDlocalizar.Text := stringreplace(EDlocalizar.Text, '-', '',
      [rfReplaceAll]);
  end;

  if CBcampos.Text = 'NCM' then
    EDlocalizar.EditMask := '!9999.99.99;1;_'
  else if CBcampos.Text = 'CNPJ' then
    EDlocalizar.EditMask := '!99.999.999/9999-99;1;_'
  else if CBcampos.Text = 'CPF' then
    EDlocalizar.EditMask := '!###.###.###-##;1;_'
  else if (CBcampos.Text = 'Data Vencimento') or
    (CBcampos.Text = 'Data da abertura da conta') or
    (CBcampos.Text = 'Data de aquisição') or (CBcampos.Text = 'Data Carga') then
    EDlocalizar.EditMask := '!99/99/9999;1;_'
  else
    EDlocalizar.EditMask := '';
end;
// loc_ordem_compra

procedure TFr_localizar.loc_ordem_compra(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'SELECT a.NR_OC, f.RAZAO_SOCIAL, a.DTA_DOCUMENTO FROM OC1 a inner join FORNECEDOR f on (f.COD_FORNECEDOR = a.COD_FORNECEDOR) ';

  if CBcampos.Text = 'Número' then
  begin
    cmd := cmd + 'where NR_OC = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where f.RAZAO_SOCIAL like ' + QuotedStr('%' + valor + '%') +
        ' order by f.RAZAO_SOCIAL'
    else
      cmd := cmd + 'where f.RAZAO_SOCIAL like ' + QuotedStr(valor + '%') +
        ' order by f.RAZAO_SOCIAL';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('NR_OC').DisplayLabel := 'Nº Ordem Compra';
  mmLocalizar.fieldbyname('RAZAO_SOCIAL').DisplayLabel := 'Fornecedor';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_usuario(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'SELECT a.CODUSU, a.LOGUSU FROM TBUSU a ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where CODUSU = ' + valor;
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where A.LOGUSU like ' + QuotedStr('%' + valor + '%') +
        ' order by A.LOGUSU'
    else
      cmd := cmd + 'where A.LOGUSU like ' + QuotedStr(valor + '%') +
        ' order by A.LOGUSU';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('CODUSU').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('CODUSU').DisplayWidth := 5;
  mmLocalizar.fieldbyname('LOGUSU').DisplayLabel := 'Nome';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_grupo(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select cod_grupo, nom_grupo from grupo ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where cod_grupo = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nom_grupo like ' + QuotedStr('%' + valor + '%') +
        ' order by 1'
    else
      cmd := cmd + 'where nom_grupo like ' + QuotedStr(valor + '%') +
        ' order by 1';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_grupo').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_grupo').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_grupo').DisplayLabel := 'Grupo';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_categoria_estoque(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, descricao from categoria_estoque ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Descrição' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where upper(descricao) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by descricao'
    else
      cmd := cmd + 'where upper(descricao) like ' +
        QuotedStr(UpperCase(valor) + '%') + ' order by descricao';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Descrição';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_categoria_produto(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, categoria from categoria ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where upper(categoria) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by categoria'
    else
      cmd := cmd + 'where upper(categoria) like ' +
        QuotedStr(UpperCase(valor) + '%') + ' order by categoria';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('categoria').DisplayLabel := 'Categoria';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_subcategoria_produto(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select distinct s.id, s.subcategoria, c.categoria from subcategoria s left outer join categoria c on (c.id = s.categoria) ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where s.id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where upper(s.subcategoria) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by s.subcategoria'
    else
      cmd := cmd + 'where upper(s.subcategoria) like ' +
        QuotedStr(UpperCase(valor) + '%') + ' order by s.subcategoria';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Categoria' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where upper(c.categoria) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by c.categoria'
    else
      cmd := cmd + 'where upper(c.categoria) like ' +
        QuotedStr(UpperCase(valor) + '%') + ' order by c.categoria';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('subcategoria').DisplayLabel := 'SubCategoria';
  mmLocalizar.fieldbyname('categoria').DisplayLabel := 'Categoria';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.CBcamposSelect(Sender: TObject);
begin
  EDlocalizar.clear;

end;

procedure TFr_localizar.mostra_campos;
begin
  if chamou_form = 'fr_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_representante.ativa_representante(mmLocalizar.fieldbyname('id')
        .AsString);
      Fr_representante.mostra_campos('Pr');
      Fr_representante.campo_pesquisado := CBcampos.Text;
      Fr_representante.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_fop' then
  begin
    if not Qu_localizar.IsEmpty then
      Fr_forma_pagamento.ativa_fop(mmLocalizar.fieldbyname('COD_FOP').AsString);
    Fr_forma_pagamento.mostra_campos('Pr');
    Fr_forma_pagamento.campo_pesquisado := CBcampos.Text;
    Fr_forma_pagamento.dado_pesquisado := EDlocalizar.Text;
    close;
  end
  else if chamou_form = 'fr_cc_remessa' then
  begin
    frm_remessa_boleto.PrCONTA.Text := mmLocalizar.fieldbyname('id').AsString;
    frm_remessa_boleto.PrCONTAExit(self);
    frm_remessa_boleto.Prid.Enabled := false;
    close;
  end
  else if chamou_form = 'frm_remessa_boleto' then
  begin
    if not Qu_localizar.IsEmpty then
      frm_remessa_boleto.Prid.Enabled := true;
    frm_remessa_boleto.modo_insert := false;
    frm_remessa_boleto.Prid.Text := mmLocalizar.fieldbyname('id').AsString;
    frm_remessa_boleto.PrCONTA.Text := mmLocalizar.fieldbyname('conta')
      .AsString;
    frm_remessa_boleto.Pridexit(self);
    frm_remessa_boleto.Prid.Enabled := false;
    close;
  end
  else if chamou_form = 'fr_remessa_boleto_nfe_arquivos' then
  begin
    fm_nfe_arquivos.edRemessa.Text := mmLocalizar.fieldbyname('id').AsString;
    close;
  end
  else if chamou_form = 'fr_cliente_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.mmLimiteBonificacaocod_produto.AsString :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      Fr_Cliente.mmLimiteBonificacaonom_produto.AsString :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
      close;
    end;
  end

  else if chamou_form = 'fr_estrutura_clonar' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_estrutura_produto.Clonar(mmLocalizar.fieldbyname('cod_produto')
        .AsString);
    end;
    close;
  end
  else if chamou_form = 'fr_produto_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_produtos.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_produtos.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_produtos.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_nao_revenda_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produto_nao_revenda.Prid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_produto_nao_revenda.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_produto_nao_revenda.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_produto_nao_revenda.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_produto_nao_revenda.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_comissao_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrCOMISSAO_PLANO_CONTAS.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_configuracao.LbCOMISSAO_PLANO_CONTASN1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_configuracao.LbCOMISSAO_PLANO_CONTASN2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_configuracao.LbCOMISSAO_PLANO_CONTASN3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_configuracao.LbCOMISSAO_PLANO_CONTASN4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_dec_terc_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrDEC_TERC_PLANO_CONTAS.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_configuracao.LbDEC_TERC_PLANO_CONTASN1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_configuracao.LbDEC_TERC_PLANO_CONTASN2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_configuracao.LbDEC_TERC_PLANO_CONTASN3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_configuracao.LbDEC_TERC_PLANO_CONTASN4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_plr_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrPLR_PLANO_CONTAS.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_configuracao.LbPLR_PLANO_CONTASN1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_configuracao.LbPLR_PLANO_CONTASN2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_configuracao.LbPLR_PLANO_CONTASN3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_configuracao.LbPLR_PLANO_CONTASN4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_salario_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrSALARIO_PLANO_CONTAS.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_configuracao.LbSALARIO_PLANO_CONTASN1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_configuracao.LbSALARIO_PLANO_CONTASN2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_configuracao.LbSALARIO_PLANO_CONTASN3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_configuracao.LbSALARIO_PLANO_CONTASN4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_vale_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrVALE_PLANO_CONTAS.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_configuracao.LbVALES_PLANO_CONTASN1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_configuracao.LbVALES_PLANO_CONTASN2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_configuracao.LbVALES_PLANO_CONTASN3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_configuracao.LbVALES_PLANO_CONTASN4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cc_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_conta_corrente.Prid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_conta_corrente.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_conta_corrente.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_conta_corrente.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_conta_corrente.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_representante_banco' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_representante.PRnr_banco.Text := mmLocalizar.fieldbyname('id')
        .AsString;
      Fr_representante.Lb_banco.caption :=
        mmLocalizar.fieldbyname('nom_banco').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_representante_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_representante.PRid_cidade.Text :=
        mmLocalizar.fieldbyname('cod_cidade').AsString;
      Fr_representante.LbNom_cidade.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Empresa.ativa_empresa(mmLocalizar.fieldbyname('cod_empresa').AsString);
      Fr_Empresa.mostra_campos('Pr');
      Fr_Empresa.campo_pesquisado := CBcampos.Text;
      Fr_Empresa.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cheque_terceiros' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_cheque_terceiros.ativa_cheque_terceiros(mmLocalizar.fieldbyname('id')
        .AsString);
      Fr_cheque_terceiros.mostra_campos('Pr');
      Fr_cheque_terceiros.campo_pesquisado := CBcampos.Text;
      Fr_cheque_terceiros.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cheques' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Emissao_cheques.ativa_cheques(mmLocalizar.fieldbyname('id').AsString);
      Fr_Emissao_cheques.mostra_campos('Pr');
      Fr_Emissao_cheques.campo_pesquisado := CBcampos.Text;
      Fr_Emissao_cheques.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_empresa_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Empresa.PRCod_cidade.Text := mmLocalizar.fieldbyname
        ('cod_cidade').AsString;
      Fr_Empresa.LbNom_cidade.caption := mmLocalizar.fieldbyname
        ('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_fornecedor_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_fornecedor.PRCod_cidade.Text := mmLocalizar.fieldbyname
        ('cod_cidade').AsString;
      Fr_fornecedor.LbNom_cidade.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_log' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_log.Prcod_usuario.Text := mmLocalizar.fieldbyname('codusu').AsString;
      Fr_log.lb_nom_ocupacao.caption := mmLocalizar.fieldbyname
        ('LOGUSU').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_fornecedor.ativa_fornecedor(mmLocalizar.fieldbyname('cod_fornecedor')
        .AsString);
      Fr_fornecedor.mostra_campos('PR');
      Fr_fornecedor.carrega_contato(mmLocalizar.fieldbyname('cod_fornecedor')
        .AsString);
      Fr_fornecedor.campo_pesquisado := CBcampos.Text;
      Fr_fornecedor.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.PRCod_cidade.Text := mmLocalizar.fieldbyname
        ('cod_cidade').AsString;
      Fr_Cliente.LbNom_cidade.caption := mmLocalizar.fieldbyname
        ('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_marca' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_marcas.ativa_marca(mmLocalizar.fieldbyname('id').AsString);
      Fr_marcas.mostra_campos('Pr');
      Fr_marcas.campo_pesquisado := CBcampos.Text;
      Fr_marcas.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.ativa_produto(mmLocalizar.fieldbyname('cod_produto')
        .AsString, true);
      Fr_produtos.mostra_campos('Pr');
      Fr_produtos.campo_pesquisado := CBcampos.Text;
      Fr_produtos.dado_pesquisado := EDlocalizar.Text;
      Fr_produtos.busca_qualquer_posicao_pesquisada := zzbusca_qualquer.Checked;
    end;
    close;
  end
  else if chamou_form = 'Fr_produto_nao_revenda' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produto_nao_revenda.ativa_produto
        (mmLocalizar.fieldbyname('cod_produto').AsString);
      Fr_produto_nao_revenda.mostra_campos('Pr');
      Fr_produto_nao_revenda.campo_pesquisado := CBcampos.Text;
      Fr_produto_nao_revenda.dado_pesquisado := EDlocalizar.Text;
      Fr_produto_nao_revenda.busca_qualquer_posicao_pesquisada :=
        zzbusca_qualquer.Checked;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prcod_grupo.Text := mmLocalizar.fieldbyname
        ('cod_grupo').AsString;
      Fr_produtos.LbNom_Grupo.caption := mmLocalizar.fieldbyname
        ('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ultimas_vendas_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_ultimas_vendas.Prcod_grupo.Text := mmLocalizar.fieldbyname('cod_grupo').AsString;
      fr_ultimas_vendas.LbNom_Grupo.caption := mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_unidade' then
  begin
    if not Qu_localizar.IsEmpty then
      Fr_produtos.Prunidade.Text := mmLocalizar.fieldbyname('unidade').AsString;
    close;
  end
  else if chamou_form = 'fr_oc_unidade' then
  begin
    if not Qu_localizar.IsEmpty then
      FmOrdemCompra.edunidade.Text := mmLocalizar.fieldbyname
        ('unidade').AsString;
    close;
  end
  else if chamou_form = 'fr_produto_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Pfcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_produtos.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_fornecedor_principal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prfornecedor_principal.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_produtos.LbNom_fornecedor_principal.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pesquisa_produto_venda' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pesquisa_produto_venda.Emcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      Fr_pesquisa_produto_venda.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_tamanho' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Gdid_tamanho.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbtamanho.caption := mmLocalizar.fieldbyname
        ('tamanho').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prcod_colecao.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbcolecao.caption := mmLocalizar.fieldbyname
        ('descricao').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_prepedido_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pre_pedido.Prcod_colecao.Text := mmLocalizar.fieldbyname('id')
        .AsString;
      Fr_pre_pedido.Lbcolecao.caption := mmLocalizar.fieldbyname
        ('descricao').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Plcod_empresa.Text := mmLocalizar.fieldbyname
        ('cod_empresa').AsString;
      Fr_produtos.Lbempresa.caption := mmLocalizar.fieldbyname
        ('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_prepedido_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pre_pedido.Prcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_pre_pedido.Lbempresa.caption := mmLocalizar.fieldbyname
        ('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_subcategoria' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prsubcategoria.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbsubcategoria.caption :=
        mmLocalizar.fieldbyname('subcategoria').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_marca' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prid_marca.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbmarca.caption := mmLocalizar.fieldbyname
        ('nom_marca').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente_cidade_trab' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.PRcid_trabalho.Text := mmLocalizar.fieldbyname
        ('cod_cidade').AsString;
      Fr_Cliente.Lbcid_trabalho.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente_cidade_trab_conj' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.PrCid_emp_Conj.Text := mmLocalizar.fieldbyname
        ('cod_cidade').AsString;
      Fr_Cliente.LbCid_emp_conj.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.ativa_cliente(mmLocalizar.fieldbyname('cod_cliente').AsString);
      Fr_Cliente.mostra_campos('Pr');
      Fr_Cliente.campo_pesquisado := CBcampos.Text;
      Fr_Cliente.dado_pesquisado := EDlocalizar.Text;
      Fr_Cliente.busca_qualquer_posicao_pesquisada := zzbusca_qualquer.Checked;
    end;
    close;
  end
  else if chamou_form = 'fr_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_grupo.ativa_grupo(mmLocalizar.fieldbyname('cod_grupo').AsString, true);
      Fr_grupo.mostra_campos('Pr');
      Fr_grupo.campo_pesquisado := CBcampos.Text;
      Fr_grupo.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_tabela_unidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_tabela_unidade.ativa_unidade(mmLocalizar.fieldbyname('UNIDADE')
        .AsString);
      Fr_tabela_unidade.mostra_campos('Pr');
      Fr_tabela_unidade.campo_pesquisado := CBcampos.Text;
      Fr_tabela_unidade.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_categoria' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_categoria.ativa_categoria(mmLocalizar.fieldbyname('id').AsString);
      Fr_categoria.mostra_campos('Pr');
      Fr_categoria.campo_pesquisado := CBcampos.Text;
      Fr_categoria.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_subcategoria' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_subcategoria.ativa_subcategoria(mmLocalizar.fieldbyname('id')
        .AsString);
      Fr_subcategoria.mostra_campos('Pr');
      Fr_subcategoria.campo_pesquisado := CBcampos.Text;
      Fr_subcategoria.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_cor.ativa_cor(mmLocalizar.fieldbyname('id').AsString);
      Fr_cor.mostra_campos('Pr');
      Fr_cor.campo_pesquisado := CBcampos.Text;
      Fr_cor.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_tamanho' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_tamanho.ativa_tamanho(mmLocalizar.fieldbyname('id').AsString);
      Fr_tamanho.mostra_campos('Pr');
      Fr_tamanho.campo_pesquisado := CBcampos.Text;
      Fr_tamanho.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_colecao.ativa_colecao(mmLocalizar.fieldbyname('id').AsString);
      Fr_colecao.mostra_campos('Pr');
      Fr_colecao.campo_pesquisado := CBcampos.Text;
      Fr_colecao.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end

  else if chamou_form = 'fr_entrada' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.ativa_entrada(mmLocalizar.fieldbyname('nr_documento').AsString,
        mmLocalizar.fieldbyname('cod_fornecedor').AsString);
      Fr_entrada.mostra_campos('Pr');
      Fr_entrada.campo_pesquisado := CBcampos.Text;
      Fr_entrada.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_saida_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_vendas_industria2.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      fr_nfe_complementar.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_categoria_cor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_categoria.dado_pesquisado := EDlocalizar.Text;
      Fr_categoria.PrCor.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_categoria.LbCor.caption := mmLocalizar.fieldbyname('cor').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_entrada.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_veiculos_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_veiculo.Ftcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      fr_veiculo.Lbfornecedor.caption := mmLocalizar.fieldbyname
        ('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prcod_fop.Text := mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_entrada.Lbnom_fop.caption := mmLocalizar.fieldbyname
        ('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_cod_fiscal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prcod_fiscal.Text := mmLocalizar.fieldbyname
        ('cod_fiscal').AsString;
      Fr_entrada.Lbnom_cod_fiscal.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_cod_fiscal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prcod_fiscal_produto.Text :=
        mmLocalizar.fieldbyname('cod_fiscal').AsString;
      Fr_produtos.Lbnom_cod_fiscal.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_frete_combinado_UF' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_frete_combinado.Pruf.Text := mmLocalizar.fieldbyname('UF').AsString;
      fr_frete_combinado.lbuf.caption := mmLocalizar.fieldbyname('UF').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_UF' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_opc_relatorios.Pruf.Text := mmLocalizar.fieldbyname('UF').AsString;
      Fr_opc_relatorios.lbuf.caption := mmLocalizar.fieldbyname('UF').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_UF_origem' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_opc_relatorios.PrufOrigem.Text :=
        mmLocalizar.fieldbyname('UF').AsString;
      Fr_opc_relatorios.lbufOrigem.caption :=
        mmLocalizar.fieldbyname('UF').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_UF_Destino' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
        begin
          if Fr_opc_relatorios.edUFDestino.Text = '' then
            Fr_opc_relatorios.edUFDestino.Text := mmLocalizar.fieldbyname('UF').AsString
          else
            Fr_opc_relatorios.edUFDestino.Text := Fr_opc_relatorios.edUFDestino.Text+','+mmLocalizar.fieldbyname('UF').AsString
        end
        else begin
          if Fr_opc_relatorios.edUFDestino.Text = '' then
            Fr_opc_relatorios.edUFDestino.Text := selecionados
          else
            Fr_opc_relatorios.edUFDestino.Text := Fr_opc_relatorios.edUFDestino.Text+','+selecionados;
        end;
      end
      else
        Fr_opc_relatorios.PrUFDestino.Text := mmLocalizar.fieldbyname('UF').AsString;

      Fr_opc_relatorios.lbUFDestino.caption := mmLocalizar.fieldbyname('UF').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_etiqueta_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmEtiquetasProdutos.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      FmEtiquetasProdutos.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.prNr_OC.Text := mmLocalizar.fieldbyname('Nr_OC').AsString;
      FmOrdemCompra.campo_pesquisado := CBcampos.Text;
      FmOrdemCompra.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      FmOrdemCompra.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra_produto_alt' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.edcodProdutoAlt.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      FmOrdemCompra.lbDescProdAlt.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_estrutura_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_estrutura_produto.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      frm_estrutura_produto.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_producao_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_entrada_producao.Mecod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      frm_entrada_producao.lbDescProduto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_producao_local' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_entrada_producao.PrLocal.Text :=
        mmLocalizar.fieldbyname('ID').AsString;
      frm_entrada_producao.lbdescEstoque.caption :=
        mmLocalizar.fieldbyname('DESCRICAO').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_categoria_estoque' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prcod_estoque.Text := mmLocalizar.fieldbyname('ID').AsString;
      Fr_produtos.Lbestoque.caption := mmLocalizar.fieldbyname
        ('DESCRICAO').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_estrutura_produto_insumo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_estrutura_produto.Mecod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      frm_estrutura_produto.lbProdutoDesc.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_mala_direta_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmMalaDireta.prcod_produto.Text := mmLocalizar.fieldbyname
        ('cod_produto').AsString;
      FmMalaDireta.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
    else if chamou_form = 'FmAlterarPreco_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmAlterarPreco.prcod_produto.Text := mmLocalizar.fieldbyname
        ('cod_produto').AsString;
      FmAlterarPreco.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end

  else if chamou_form = 'fr_opc_relatorio_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin

      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edProduto.Text :=
            mmLocalizar.fieldbyname('cod_produto').AsString
        else
          Fr_opc_relatorios.edProduto.Text := selecionados;
      end
      else
        Fr_opc_relatorios.prcod_produto.Text :=
          mmLocalizar.fieldbyname('cod_produto').AsString;

      Fr_opc_relatorios.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;

    end;
    close;
  end
  else if chamou_form = 'fr_ultimas_vendas_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_ultimas_vendas.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      fr_ultimas_vendas.lbNome_Cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edCliente.Text :=
            mmLocalizar.fieldbyname('cod_cliente').AsString
        else
          Fr_opc_relatorios.edCliente.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_cliente.Text :=
          mmLocalizar.fieldbyname('cod_cliente').AsString;

      Fr_opc_relatorios.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_frete_combinado_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_frete_combinado.PRCod_cidade.Text :=
        mmLocalizar.fieldbyname('cod_cidade').AsString;
      fr_frete_combinado.LbNom_cidade.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_microregiao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edMicroRegiao.Text :=
            mmLocalizar.fieldbyname('MICROCOD').AsString
        else
          Fr_opc_relatorios.edMicroRegiao.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_microregiao.Text :=
          mmLocalizar.fieldbyname('MICROCOD').AsString;

      Fr_opc_relatorios.LbNomemicroregiao.caption :=
        mmLocalizar.fieldbyname('MICRONOMEX').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_mesoregiao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edMesoRegiao.Text :=
            mmLocalizar.fieldbyname('MESOCOD').AsString
        else
          Fr_opc_relatorios.edMesoRegiao.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_mesoregiao.Text :=
          mmLocalizar.fieldbyname('MESOCOD').AsString;

      Fr_opc_relatorios.LbNome_mesoregiao.caption :=
        mmLocalizar.fieldbyname('MESONOMEX').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edCidade.Text :=
            mmLocalizar.fieldbyname('cod_cidade').AsString
        else
          Fr_opc_relatorios.edCidade.Text := selecionados;
      end
      else
        Fr_opc_relatorios.PRCod_cidade.Text :=
          mmLocalizar.fieldbyname('cod_cidade').AsString;

      Fr_opc_relatorios.LbNom_cidade.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_etiqueta_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmEtiquetasProdutos.Prcod_grupo.Text :=
        mmLocalizar.fieldbyname('cod_grupo').AsString;
      FmEtiquetasProdutos.LbNom_Grupo.caption :=
        mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.Prcod_grupo.Text := mmLocalizar.fieldbyname
        ('cod_grupo').AsString;
      FmOrdemCompra.LbNom_Grupo.caption :=
        mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_mala_direta_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmMalaDireta.Prcod_grupo.Text := mmLocalizar.fieldbyname
        ('cod_grupo').AsString;
      FmMalaDireta.LbNom_Grupo.caption :=
        mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
 else if chamou_form = 'FmAlterarPreco_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmAlterarPreco.Prcod_grupo.Text := mmLocalizar.fieldbyname
        ('cod_grupo').AsString;
      FmAlterarPreco.LbNom_Grupo.caption :=
        mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_grupo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edGrupo.Text :=
            mmLocalizar.fieldbyname('cod_grupo').AsString
        else
          Fr_opc_relatorios.edGrupo.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_grupo.Text :=
          mmLocalizar.fieldbyname('cod_grupo').AsString;

      Fr_opc_relatorios.LbNom_Grupo.caption :=
        mmLocalizar.fieldbyname('nom_grupo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_categoria' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edCategoria.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edCategoria.Text := selecionados;
      end
      else
        Fr_opc_relatorios.PrCategoria.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.lbCategoria.caption :=
        mmLocalizar.fieldbyname('categoria').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_subcategoria' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edSubCategoria.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edSubCategoria.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prsubcategoria.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.Lbsubcategoria.caption :=
        mmLocalizar.fieldbyname('subcategoria').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edfop.Text :=
            mmLocalizar.fieldbyname('cod_fop').AsString
        else
          Fr_opc_relatorios.edfop.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prfop.Text := mmLocalizar.fieldbyname
          ('cod_fop').AsString;

      Fr_opc_relatorios.lbfop.caption := mmLocalizar.fieldbyname
        ('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_opc_relatorios.Prempresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_opc_relatorios.Lbempresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_etiqueta_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmEtiquetasProdutos.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      FmEtiquetasProdutos.Lbfornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      FmOrdemCompra.Lbfornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_mala_direta_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmMalaDireta.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      FmMalaDireta.Lbfornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'FmAlterarPreco_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmAlterarPreco.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      FmAlterarPreco.Lbfornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edFornecedor.Text :=
            mmLocalizar.fieldbyname('cod_fornecedor').AsString
        else
          Fr_opc_relatorios.edFornecedor.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_fornecedor.Text :=
          mmLocalizar.fieldbyname('cod_fornecedor').AsString;

      Fr_opc_relatorios.Lbfornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin

        if selecionados = '' then
          Fr_opc_relatorios.edTransportadora.Text :=
            mmLocalizar.fieldbyname('cod_transportadora').AsString
        else
          Fr_opc_relatorios.edTransportadora.Text := selecionados;

      end
      else
        Fr_opc_relatorios.Prcod_transportadora.Text :=
          mmLocalizar.fieldbyname('cod_transportadora').AsString;

      Fr_opc_relatorios.LbNom_transportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_marca' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.ed_marca.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.ed_marca.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_marca.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.Lbnom_marca.caption :=
        mmLocalizar.fieldbyname('nom_marca').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edCodRepresentante.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edCodRepresentante.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prcod_representante.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_opc_relatorio_supervisor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edcodsupervisor.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edcodsupervisor.Text := selecionados;
      end
      else
        Fr_opc_relatorios.prcod_supervisor.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.Lbsupervisor.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_usuario_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FRUSU.Prcod_representante.Text := mmLocalizar.fieldbyname('id').AsString;
      FRUSU.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_fornecedor_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_produto_fornecedor.Emcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fm_produto_fornecedor.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Emcod_produto.Text := mmLocalizar.fieldbyname
        ('cod_produto').AsString;
      Fr_entrada.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prcod_transportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
      Fr_entrada.LbNom_transportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Prcod_colecao.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbcolecao.caption := mmLocalizar.fieldbyname
        ('descricao').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prempresa_destino.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_entrada.Lbempresa_destino.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_empresa_pertence' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prempresa.Text := mmLocalizar.fieldbyname
        ('cod_empresa').AsString;
      Fr_entrada.Lbempresa_pertence.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_vendas' then
  begin
    // Fr_vendas.ativa_venda1(mmlocalizar.fieldbyname('numdoc').AsString);
    // Fr_vendas.mostra_campos('Pr');
    // Fr_vendas.mostra_sgx(mmlocalizar.fieldbyname('numdoc').AsString);
    close;
  end
  else if chamou_form = 'fr_transportadora_cidade' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Transportadora.PRCod_cidade.Text :=
        mmLocalizar.fieldbyname('cod_cidade').AsString;
      Fr_Transportadora.LbNom_cidade.caption :=
        mmLocalizar.fieldbyname('nom_cidade').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Transportadora.ativa_transportadora
        (mmLocalizar.fieldbyname('cod_transportadora').AsString);
      Fr_Transportadora.mostra_campos('Pr');
      Fr_Transportadora.campo_pesquisado := CBcampos.Text;
      Fr_Transportadora.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_cor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Gdid_Cor.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.LbCor.caption := mmLocalizar.fieldbyname('cor').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_usuario_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FRUSU.Prcod_empresa.Text := mmLocalizar.fieldbyname
        ('cod_empresa').AsString;
      FRUSU.Lbnom_empresa.caption := mmLocalizar.fieldbyname
        ('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_usuario' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FRUSU.ativa_usuario(mmLocalizar.fieldbyname('codusu').AsString);
      FRUSU.mostra_campos('Pr');
      FRUSU.campo_pesquisado := CBcampos.Text;
      FRUSU.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cop_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.zzcod_fornecedor1.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_contas_pagar.LbNom_fornecedor1.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cop_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.zzcod_fop1.Text := mmLocalizar.fieldbyname
        ('cod_fop').AsString;
      Fr_contas_pagar.Lbnom_fop1.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cc_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_conta_corrente.Prid_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_conta_corrente.lb_empresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cop_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.ZZcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_contas_pagar.Lbnom_empresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_comissao_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrCOMISSAO_FORNECEDOR.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_configuracao.LbCOMISSAO_FORNECEDOR.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_dec_terc_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrDEC_TERC_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_configuracao.lbDecTercFornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_plr_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrPLR_FORNECEDOR.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_configuracao.LbPLR_FORNECEDOR.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_vale_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrVALE_FORNECEDOR.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_configuracao.LbVALE_FORNECEDOR.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfg_salario_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrSALARIO_FORNECEDOR.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_configuracao.LbSALARIO_FORNECEDOR.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cp1_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_contas_pagar.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_recibo_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_recibo.Prcod_fornecedor.Text := mmLocalizar.fieldbyname
        ('cod_fornecedor').AsString;
      Fr_recibo.LbNom_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_rel_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edPlanoContas.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edPlanoContas.Text := selecionados;
      end
      else
        Fr_opc_relatorios.Prid_plano_contas.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_opc_relatorios.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_opc_relatorios.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_opc_relatorios.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;

    end;
    close;
  end
  else if chamou_form = 'fr_zz_cr_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.zPrid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_receber.zLbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_contas_receber.zLbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_contas_receber.zLbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_contas_receber.zLbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_zz_cp_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.zPrid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_pagar.zLbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_contas_pagar.zLbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_contas_pagar.zLbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_contas_pagar.zLbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cp_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.Prid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_pagar.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_contas_pagar.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_contas_pagar.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_contas_pagar.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_recibo_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_recibo.Prid_plano_de_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_recibo.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_recibo.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_recibo.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_recibo.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cr_plano_conta' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Prid_plano_contas.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_receber.Lbnom_plano_contas_N1.caption :=
        mmLocalizar.fieldbyname('descricao1').AsString;
      Fr_contas_receber.Lbnom_plano_contas_N2.caption :=
        mmLocalizar.fieldbyname('descricao2').AsString;
      Fr_contas_receber.Lbnom_plano_contas_N3.caption :=
        mmLocalizar.fieldbyname('descricao3').AsString;
      Fr_contas_receber.Lbnom_plano_contas_N4.caption :=
        mmLocalizar.fieldbyname('descricao4').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cp1_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.Prcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_contas_pagar.Lbnom_empresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cp1_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.Prcod_fop.Text := mmLocalizar.fieldbyname
        ('cod_fop').AsString;
      Fr_contas_pagar.Lbnom_fop.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_acerto_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_acerto_estoque.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fr_acerto_estoque.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cor_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.zzcod_fop1.Text :=
        mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_contas_receber.Lbnom_fop1.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cor_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.ZZcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_contas_receber.Lbnom_empresa1.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cor_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Zzcod_cliente1.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      Fr_contas_receber.LbNom_cliente1.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_visita_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_controle_visitas.edcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      fr_controle_visitas.LbNom_cliente1.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cr1_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Prcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_contas_receber.Lbnom_empresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_frete_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_frete_combinado.edCliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      fr_frete_combinado.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cr1_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      Fr_contas_receber.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cr1_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Prcod_fop.Text :=
        mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_contas_receber.Lbnom_fop.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cr1_cheque_terceiros' then
  begin
    if not Qu_localizar.IsEmpty then
      Fr_contas_receber.mostra_dados_cheque_terceiros
        (mmLocalizar.fieldbyname('id').AsString);
    close;
  end
  else if chamou_form = 'fr_aviso' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Aviso_Representantes_Avulso.ativa_aviso(mmLocalizar.fieldbyname('id')
        .AsString);
      Fr_Aviso_Representantes_Avulso.mostra_campos('Pr');
      Fr_Aviso_Representantes_Avulso.campo_pesquisado := CBcampos.Text;
      Fr_Aviso_Representantes_Avulso.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_recibo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_recibo.ativa_recibo(mmLocalizar.fieldbyname('id').AsString);
      Fr_recibo.mostra_campos('Pr');
      Fr_recibo.campo_pesquisado := CBcampos.Text;
      Fr_recibo.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_cidades' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_cidades.ativa_cidade(mmLocalizar.fieldbyname('cod_cidade').AsString);
      Fr_cidades.mostra_campos('Pr');
      Fr_cidades.campo_pesquisado := CBcampos.Text;
      Fr_cidades.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_motivo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_motivo_nfe_cancel.ativa_motivo(mmLocalizar.fieldbyname('id').AsString);
      Fr_motivo_nfe_cancel.mostra_campos('Pr');
      Fr_motivo_nfe_cancel.campo_pesquisado := CBcampos.Text;
      Fr_motivo_nfe_cancel.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_motivo_vendas' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_etapa_producao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin

      fr_etapas_producao.ativa_banco(mmLocalizar.fieldbyname('id').AsString);
      fr_etapas_producao.mostra_campos('Pr');
      fr_etapas_producao.campo_pesquisado := CBcampos.Text;
      fr_etapas_producao.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_etapa_estrutura' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_etapas_producao.ativa_banco(mmLocalizar.fieldbyname('id').AsString);
      fr_etapas_producao.mostra_campos('Pr');
      fr_etapas_producao.campo_pesquisado := CBcampos.Text;
      fr_etapas_producao.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_banco' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_banco.ativa_banco(mmLocalizar.fieldbyname('id').AsString);
      fr_banco.mostra_campos('Pr');
      fr_banco.campo_pesquisado := CBcampos.Text;
      fr_banco.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_banco_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_conta_corrente.Prid_banco.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_conta_corrente.Prid_bancoexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_conta_corrente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_conta_corrente.ativa_conta(mmLocalizar.fieldbyname('id').AsString);
      Fr_conta_corrente.mostra_campos('Pr');
      Fr_conta_corrente.campo_pesquisado := CBcampos.Text;
      Fr_conta_corrente.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_relatorio_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      if tem_selecionado then
      begin
        if selecionados = '' then
          Fr_opc_relatorios.edContaCorrente.Text :=
            mmLocalizar.fieldbyname('id').AsString
        else
          Fr_opc_relatorios.edContaCorrente.Text := selecionados;
      end
      else
        Fr_opc_relatorios.prContaCorrente.Text :=
          mmLocalizar.fieldbyname('id').AsString;

      Fr_opc_relatorios.prContaCorrenteExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_extrato_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fm_Transf_Valores.edContaDestino.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fm_Transf_Valores.edContaDestinoExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_transf_cc_destino' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fm_Transf_Valores.edContaDestino.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fm_Transf_Valores.edContaDestinoExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_transf_cc_origem' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fm_Transf_Valores.edContaOrigem.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fm_Transf_Valores.edContaOrigemExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_cr' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.prCONTA_BOLETO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_receber.prCONTA_BOLETOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cor_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.ZzContaBoleto.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_receber.ZzContaBoletoExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_vendas' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.prCONTA_BOLETO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_vendas_industria2.prCONTA_BOLETOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_nfe_arquivos' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_arquivos.edCONTABOLETO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      fm_nfe_arquivos.edCONTABOLETOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_forma_pagamento.PrCONTA_PADRAO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_forma_pagamento.PrCONTA_PADRAOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_ler_retorno' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fmLerRetornoCobranca.prCONTA_BOLETO.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      fmLerRetornoCobranca.prCONTA_BOLETOexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_cc_descontada_cheque' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      frm_conta_descontada.edContaCheque.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      frm_conta_descontada.edContaChequeexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_conta_corrente_banco' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_conta_corrente.Prid_banco.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_conta_corrente.Lbbanco.caption :=
        mmLocalizar.fieldbyname('nom_banco').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_emissao_cheque_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Emissao_cheques.Prcod_conta_corrente.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_Emissao_cheques.Lbnom_cc.caption :=
        mmLocalizar.fieldbyname('nom_conta').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_emissao_cheque_loc_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Emissao_cheques.zzconta_corrente.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_Emissao_cheques.lbl_conta_corrente.caption :=
        mmLocalizar.fieldbyname('nom_conta').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_ref' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.edNfe_ref.Text :=
        mmLocalizar.fieldbyname('nfe').AsString;
      Fr_vendas_industria2.ed_Chave_nfe_ref.Text :=
        mmLocalizar.fieldbyname('Chave_nfe').AsString;
      Fr_vendas_industria2.PrNumdoc_Ref.Text :=
        mmLocalizar.fieldbyname('numdoc').AsString;
      Fr_vendas_industria2.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      Fr_vendas_industria2.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_vendas_industria2.Prcod_fiscal.Text :=
        mmLocalizar.fieldbyname('cod_fiscal').AsString;
      Fr_vendas_industria2.prEmpresa_faturar.Text :=
        mmLocalizar.fieldbyname('Empresa_Faturar').AsString;
      Fr_vendas_industria2.Prcod_transportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_producao' then
  begin
    hide;
    if not Qu_localizar.IsEmpty then
      frm_entrada_producao.CarregaEntrada(mmLocalizar.fieldbyname('codigo')
        .AsString);
    close;
  end
  // PEDIDO
  else if chamou_form = 'fr_pedido' then
  begin
    hide;
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.ativa_vendas1(mmLocalizar.fieldbyname('numdoc')
        .AsString);
      Fr_vendas_industria2.ativa_vendas2(mmLocalizar.fieldbyname('numdoc')
        .AsString);
      Fr_vendas_industria2.mostra_campos_vendas1('Pr');
      Fr_vendas_industria2.ativa_cr1(mmLocalizar.fieldbyname('numdoc')
        .AsString);
      Fr_vendas_industria2.DadosCCe;
      Fr_vendas_industria2.campo_pesquisado := CBcampos.Text;
      Fr_vendas_industria2.dado_pesquisado := EDlocalizar.Text;
      Fr_vendas_industria2.busca_qualquer_posicao_pesquisada :=
        zzbusca_qualquer.Checked;

    end;
    close;
  end  // PEDIDO SIMPLIFICADO
  else if chamou_form = 'fr_pedido_simplificado' then
  begin
    hide;
    if not Qu_localizar.IsEmpty then
    begin
      if chamou_pesquisa = 'fr_pedido' then
        Fr_pedido_simplificado.CarregarPorNumDoc(mmLocalizar.fieldbyname('numdoc').AsString)
      else if chamou_pesquisa = 'fr_cliente' then
        Fr_pedido_simplificado.Prcod_cliente.Text := mmLocalizar.fieldbyname('codigo').AsString
      else if chamou_pesquisa = 'fr_representante' then
        Fr_pedido_simplificado.Prcod_representante.Text := mmLocalizar.fieldbyname('codigo').AsString
      else if chamou_pesquisa = 'fr_fop' then
        Fr_pedido_simplificado.Prcod_fop.Text := mmLocalizar.fieldbyname('codigo').AsString
      else if chamou_pesquisa = 'fr_prazo' then
        Fr_pedido_simplificado.Prcod_prazo_pgto.Text := mmLocalizar.fieldbyname('codigo').AsString;
    end;
    close;
  end

  // PEDIDO
  else if chamou_form = 'fr_pedido_complementar' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.ativa_vendas1(mmLocalizar.fieldbyname('numdoc')
        .AsString);
      fr_nfe_complementar.mostra_campos('Pr');
      fr_nfe_complementar.campo_pesquisado := CBcampos.Text;
      fr_nfe_complementar.dado_pesquisado := EDlocalizar.Text;
      fr_nfe_complementar.busca_qualquer_posicao_pesquisada :=
        zzbusca_qualquer.Checked;
    end;
    close;
  end
  else if chamou_form = 'fr_nfe_envio_lote' then
  begin
    if not Qu_localizar.IsEmpty then
      fm_nfe_envio_lote.edPedido.Text := mmLocalizar.fieldbyname('id').AsString;
    close;
  end
  else if chamou_form = 'fr_grupo_filtro_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_grupo.ft_representante.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_grupo.ft_lb_nom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_representante_filtro_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_representante.ft_representante.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_representante.ft_lb_nom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_grade_comissao_filtro_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Com_Ft_Representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.lb_com_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_filtro_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.ft_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.ft_lb_nom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_prazo_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_prazo_pagamento.Edid_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_prazo_pagamento.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_grupo_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_grupo.Edid_representante.Text := mmLocalizar.fieldbyname('id')
        .AsString;
      Fr_grupo.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.Edid_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_produtos.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_Cliente.Prid_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_Cliente.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_zz_cp_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.zzRepresentante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_pagar.Lbnom_representante1.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_comissao_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmCalcularComissao.cod_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      FmCalcularComissao.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_13salario_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmCalcular13Salario.cod_funcionario.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      FmCalcular13Salario.Lbnom_funcionario.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_salario_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmCalcularSalario.cod_funcionario.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      FmCalcularSalario.Lbnom_funcionario.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cp_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_pagar.Prcod_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_pagar.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_vendas_industria2.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_representante' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_pedido_simplificado.LbNomRepresentante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cliente_representante_ck' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_representantes_clientes.Prcod_representante.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_representantes_clientes.Lbnom_representante.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_supervisor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.prcod_supervisor.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_vendas_industria2.Lbnom_supervisor.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_supervisor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_supervisor.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_pedido_simplificado.LbNomSupervisor.caption :=
        mmLocalizar.fieldbyname('nom_representante').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      fr_nfe_complementar.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.Prcod_cliente.Text := mmLocalizar.fieldbyname
        ('cod_cliente').AsString;
      Fr_entrada.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      Fr_vendas_industria2.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_cliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      Fr_pedido_simplificado.LbNomCliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_nfe_danfe_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_danfe.edCliente.Text := mmLocalizar.fieldbyname
        ('cod_cliente').AsString;
      fm_nfe_danfe.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end

  else if chamou_form = 'fr_nfe_danfe_arquivo_cliente' then
  begin
    fm_nfe_arquivos.edCliente.Text := mmLocalizar.fieldbyname
      ('cod_cliente').AsString;
    fm_nfe_arquivos.Lbnom_cliente.caption :=
      mmLocalizar.fieldbyname('nom_cliente').AsString;
    close;
  end
  else if chamou_form = 'fr_nfe_envio_lote_cliente' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_envio_lote.edCliente.Text :=
        mmLocalizar.fieldbyname('cod_cliente').AsString;
      fm_nfe_envio_lote.Lbnom_cliente.caption :=
        mmLocalizar.fieldbyname('nom_cliente').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_fop.Text :=
        mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_vendas_industria2.Lbnom_fop.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_fop.Text :=
        mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_pedido_simplificado.LbNomFop.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_nfe_arquivos_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_arquivos.edcodfop.Text := mmLocalizar.fieldbyname
        ('cod_fop').AsString;
      fm_nfe_arquivos.lbfop.caption := mmLocalizar.fieldbyname
        ('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedidos_item_cod_fiscal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Mecod_fiscal_item.Text :=
        mmLocalizar.fieldbyname('cod_fiscal').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_cfop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_CFOP.ativa_cfop(mmLocalizar.fieldbyname('cod_fiscal').AsString);
    end;
    close;
  end
  else if chamou_form = 'fr_pedidos_cod_fiscal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_fiscal.Text :=
        mmLocalizar.fieldbyname('cod_fiscal').AsString;
      Fr_vendas_industria2.Lbnom_cod_fiscal.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_cod_fiscal' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.Prcod_fiscal.Text :=
        mmLocalizar.fieldbyname('cod_fiscal').AsString;
      fr_nfe_complementar.Lbnom_cod_fiscal.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_cr1_fop' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Crcod_fop.Text :=
        mmLocalizar.fieldbyname('cod_fop').AsString;
      Fr_vendas_industria2.Lbforma_pgto.caption :=
        mmLocalizar.fieldbyname('nom_fop').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_prazo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_prazo_pagamento.ativa_prazo(mmLocalizar.fieldbyname('id').AsString);
      Fr_prazo_pagamento.mostra_campos('Pr');
      Fr_prazo_pagamento.campo_pesquisado := CBcampos.Text;
      Fr_prazo_pagamento.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_forma_prazo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_forma_pagamento.PrPrazo_Padrao.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_forma_pagamento.Lbprazo_pgto.caption :=
        mmLocalizar.fieldbyname('prazo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_prazo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_prazo_pgto.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_vendas_industria2.Lbprazo_pgto.caption :=
        mmLocalizar.fieldbyname('prazo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_prazo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_prazo_pgto.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_pedido_simplificado.LbNomPrazo.caption :=
        mmLocalizar.fieldbyname('prazo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_prazo' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.Prcod_prazo_pgto.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_pedido_simplificado.lbPrazo.caption :=
        mmLocalizar.fieldbyname('prazo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_produto_detalhes' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_produtos_detalhes.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fr_produtos_detalhes.prcod_produtoexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_etiquetas_multiplos_produtos' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_etiquetas_multiplos_produtos.Mecod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fr_etiquetas_multiplos_produtos.Mecod_produtoexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_ultimas_vendas_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_ultimas_vendas.prcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fr_ultimas_vendas.prcod_produtoexit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.mmVendas2COD_PRODUTO.AsString :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      Fr_vendas_industria2.mmVendas2NOM_PRODUTO.AsString :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_simplificado_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedido_simplificado.MeCodProduto.text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      Fr_pedido_simplificado.LbNomProduto.Caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_produto' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.Emcod_produto.Text :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      fr_nfe_complementar.Lbnom_produto.caption :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_produto_dev' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.mmVendas2COD_PRODUTO.AsString :=
        mmLocalizar.fieldbyname('cod_produto').AsString;
      Fr_vendas_industria2.mmVendas2NOM_PRODUTO.AsString :=
        mmLocalizar.fieldbyname('nom_produto').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.Prcod_transportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
      fr_nfe_complementar.LbNom_transportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_frete_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_frete_combinado.edTransportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
      fr_frete_combinado.lbTransportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.Prcod_transportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
      Fr_vendas_industria2.LbNom_transportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_nfe_danfe_arquivo_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_arquivos.edEmpresaFaturada.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      fm_nfe_arquivos.lbEmpresaFat.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_nfe_danfe_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fm_nfe_danfe.edEmpresaFaturada.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      fm_nfe_danfe.lbEmpresaFat.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_complemento_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_nfe_complementar.prEmpresa_faturar.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      fr_nfe_complementar.Lbempresa_faturamento.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ordem_compra_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FmOrdemCompra.Prcod_empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      FmOrdemCompra.Lbempresa_faturamento.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_vendas_industria2.prEmpresa_faturar.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_vendas_industria2.Lbempresa_faturamento.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_carga_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_montagem_carga.prcod_Empresa.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_montagem_carga.Lbempresa_faturamento.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_configuracao_frente_caixa_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_configuracao.PrFRENTE_CAIXA_EMPRESA_PADRAO.Text :=
        mmLocalizar.fieldbyname('cod_empresa').AsString;
      Fr_configuracao.Lbempresa_padrao.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_impostos_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      FrImpostos.cod_empresa.Text := mmLocalizar.fieldbyname
        ('cod_empresa').AsString;
      FrImpostos.Lbnom_empresa.caption :=
        mmLocalizar.fieldbyname('nom_empresa').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_carga' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_montagem_carga.ativa_carga1(mmLocalizar.fieldbyname('id').AsString);
      Fr_montagem_carga.mostra_campos('Pr');
      Fr_montagem_carga.ativa_carga2(mmLocalizar.fieldbyname('id').AsString);
      Fr_montagem_carga.carrega_sgx_carga2;
      Fr_montagem_carga.campo_pesquisado := CBcampos.Text;
      Fr_montagem_carga.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_pedido_monta_carga' then
  begin
    if not Qu_localizar.IsEmpty then
      Fr_montagem_carga.inserePedidoGrid(mmLocalizar.fieldbyname('numdoc')
        .AsString);
    close;
  end
  else if chamou_form = 'fr_monta_carga_transportadora' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_montagem_carga.Prcod_transportadora.Text :=
        mmLocalizar.fieldbyname('cod_transportadora').AsString;
      Fr_montagem_carga.LbNom_transportadora.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_monta_carga_motorista' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_montagem_carga.Prid_motorista.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_montagem_carga.Lbnom_motorista.caption :=
        mmLocalizar.fieldbyname('nome').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_monta_carga_veiculos' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_montagem_carga.Prid_veiculo.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_montagem_carga.Lbnom_veiculo.caption :=
        mmLocalizar.fieldbyname('nom_veiculo').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_motorista' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_motorista.ativa_motorista(mmLocalizar.fieldbyname('id').AsString);
      Fr_motorista.mostra_campos('Pr');
      Fr_motorista.campo_pesquisado := CBcampos.Text;
      Fr_motorista.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_entrada_veiculos' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_entrada.EmID_VEICULO.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_entrada.EmID_VEICULOExit(self);
    end;
    close;
  end
  else if chamou_form = 'fr_veiculos' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_veiculo.ativa_veiculos(mmLocalizar.fieldbyname('id').AsString);
      fr_veiculo.mostra_campos('Pr');
      fr_veiculo.campo_pesquisado := CBcampos.Text;
      fr_veiculo.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  // MONTAGEM DE PEDIDO COMPRA
  else if chamou_form = 'fr_compra' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedidos.ativa_pedido1(mmLocalizar.fieldbyname('nr_documento').AsString,
        mmLocalizar.fieldbyname('cod_fornecedor').AsString);
      Fr_pedidos.mostra_campos('Pr');
      Fr_pedidos.ativa_pedido2(mmLocalizar.fieldbyname('nr_documento').AsString,
        mmLocalizar.fieldbyname('cod_fornecedor').AsString);
      Fr_pedidos.carrega_pedido2;
    end;
    close;
  end
  else if chamou_form = 'fr_compra_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedidos.Prcod_colecao.Text := mmLocalizar.fieldbyname('id').AsString;
      Fr_pedidos.Lb_colecao.caption := mmLocalizar.fieldbyname
        ('descricao').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_compra_fornecedor' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedidos.Prcod_fornecedor.Text :=
        mmLocalizar.fieldbyname('cod_fornecedor').AsString;
      Fr_pedidos.lb_fornecedor.caption :=
        mmLocalizar.fieldbyname('razao_social').AsString + ' - ' +
        mmLocalizar.fieldbyname('fantasia').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_compra_empresa' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pedidos.Prcod_empresa.Text := mmLocalizar.fieldbyname
        ('cod_empresa').AsString;
      Fr_pedidos.Lbempresa.caption := mmLocalizar.fieldbyname
        ('nom_empresa').AsString;
    end;
    close;
  end

  else if chamou_form = 'fr_cr1_cc' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_contas_receber.Dpcod_conta.Text :=
        mmLocalizar.fieldbyname('id').AsString;
      Fr_contas_receber.lbconta.caption :=
        mmLocalizar.fieldbyname('nom_conta').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_prepedido' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_pre_pedido.ativa_pre_pedido1(mmLocalizar.fieldbyname('id').AsString);
      Fr_pre_pedido.mostra_campos('Pr');
      Fr_pre_pedido.ativa_pre_pedido2(mmLocalizar.fieldbyname('id').AsString);
      Fr_pre_pedido.carrega_sg_verao;
    end;
    close;
  end
  else if chamou_form = 'fr_fornecedor_colecao' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_fornecedor.zzcod_colecao.Text := mmLocalizar.fieldbyname('id')
        .AsString;
      Fr_fornecedor.Lbcolecao.caption := mmLocalizar.fieldbyname
        ('descricao').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_ncm' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      fr_ncm.ativa_ncm(mmLocalizar.fieldbyname('codigo').AsString);
      fr_ncm.mostra_campos('Pr');
      fr_ncm.campo_pesquisado := CBcampos.Text;
      fr_ncm.dado_pesquisado := EDlocalizar.Text;
    end;
    close;
  end
  else if chamou_form = 'fr_grupo_ncm' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_grupo.PrNCM.Text := mmLocalizar.fieldbyname('codigo').AsString;
      Fr_grupo.PrCest.Text := mmLocalizar.fieldbyname('CEST').AsString;
    end;
    close;
  end
  else if chamou_form = 'fr_subcategoria_categoria' then
  begin
    if not Qu_localizar.IsEmpty then
      Fr_subcategoria.PrCategoria.Text := mmLocalizar.fieldbyname('id')
        .AsString;
    close;
  end
  else if chamou_form = 'fr_produto_ncm' then
  begin
    if not Qu_localizar.IsEmpty then
    begin
      Fr_produtos.PrNCM.Text := mmLocalizar.fieldbyname('codigo').AsString;
      Fr_produtos.PrCest.Text := mmLocalizar.fieldbyname('CEST').AsString;
    end;
    close;
  end;
end;

procedure TFr_localizar.FormShow(Sender: TObject);
begin
{$IFDEF ORBICOLLETOR}
  // panel1.
{$ENDIF}
  if Qu_localizar.Active = true then
    Qu_localizar.open;

  { if letra_maiuscula = false then
    EDlocalizar.CharCase:= ecNormal
    else
    EDlocalizar.CharCase:= ecUpperCase;
  }
  zzbusca_qualquer.Checked := true;

  if tipo_empresa = 'filial' then
    BT_cadastro.Visible := false;

  if frpri.representacao then
    BT_cadastro.Visible := false;

  DgLocalizar.setfocus;
  if (EDlocalizar.Text = '') and (Pos('fr_pedido_simplificado', LowerCase(chamou_form)) <> 1) then
    EDlocalizar.setfocus;

  selecionados := '';
  tem_selecionado := false;

end;

procedure TFr_localizar.loc_produto(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select p.cod_produto, nom_produto, m.NOM_MARCA as marca, preco_venda, CAST(case when p.promocao = ''S'' then ''Sim'' else ''Não'' end  AS VARCHAR(10)) as promocao, g.nom_grupo, '+
         ' CAST(case when status = ''S'' then ''Não'' else ''Sim'' end AS VARCHAR(10)) as ativo  from produto p '
    +
  // 'left join produto_fornecedor pf on pf.cod_produto = p.cod_produto '+
  // 'left join fornecedor f on f.cod_fornecedor = pf.cod_fornecedor '+
    'left join grupo g on g.cod_grupo = p.cod_grupo ' +
    'left join marcas m on m.id = p.id_marca ';

  if (chamou_form = 'fr_pedido_produto') or (chamou_form = 'fr_entrada_produto')
    or (chamou_form = 'fr_produto_detalhes') then
    cmd := cmd + 'where (status=' + QuotedStr('N') +
      ' OR P.COD_PRODUTO IN (SELECT PRA.COD_PRODUTO FROM PRODUTO_REPRESENTANTE_INATIVOS PRA )) '
  else
    cmd := cmd + 'where (status=' + QuotedStr('N') + ' or status=' +
      QuotedStr('S') + ')';

  if revenda = 'S' then
    cmd := cmd + ' and revenda = ''S''';

  if revenda = 'N' then
    cmd := cmd + ' and revenda = ''N''';

  if ckAtivos.itemindex = 1 then
    cmd := cmd + ' and status = ''N'' ';

  if ckAtivos.itemindex = 2 then
    cmd := cmd + ' and status = ''S'' ';

  if chamou_form = 'fr_pedido_simplificado_produto' then
    cmd := cmd + ' and status = ''N'' ';


  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + ' and p.cod_produto = ' + QuotedStr(valor) +
      ' order by cod_produto ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Referencia' then
  begin
    cmd := cmd + ' and ref_fabrica = ' + QuotedStr(valor) +
      ' order by ativo, ref_fabrica ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Valor' then
  begin
    cmd := cmd + ' and preco_venda = ' +
      stringreplace(stringreplace(valor, '.', '', [rfReplaceAll]), ',', '.',
      [rfReplaceAll]) + ' order by ativo, valor ';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and nom_produto like ' + QuotedStr('%' + valor + '%') +
        ' order by ativo, nom_produto '
    else
      cmd := cmd + ' and nom_produto like ' + QuotedStr(valor + '%') +
        ' order by ativo, nom_produto ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Marca' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and m.nom_marca like ' + QuotedStr('%' + valor + '%') +
        ' order by ativo, nom_marca'
    else
      cmd := cmd + ' and g.nom_marca like ' + QuotedStr(valor + '%') +
        ' order by ativo, nom_marca';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end

  else if CBcampos.Text = 'Grupo' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and g.nom_grupo like ' + QuotedStr('%' + valor + '%') +
        ' order by ativo, nom_grupo'
    else
      cmd := cmd + ' and g.nom_grupo like ' + QuotedStr(valor + '%') +
        ' order by ativo, nom_grupo';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    cmd := '';
    cmd := 'select distinct pf.cod_fornecedor, f.razao_social, p.cod_produto, nom_produto, m.NOM_MARCA as marca, preco_venda, case when p.promocao = ''S'' then ''Sim'' else ''Não'' end as promocao, g.nom_grupo, '
      + 'case when status = ''S'' then ''Não'' else ''Sim'' end as ativo  from produto p '
      + 'left join produto_fornecedor pf on pf.cod_produto = p.cod_produto ' +
      'left join fornecedor f on f.cod_fornecedor = pf.cod_fornecedor ' +
      'left join grupo g on g.cod_grupo = p.cod_grupo ' +
      'left join marcas m on m.id = p.id_marca ' + 'where status=' +
      QuotedStr('S');

    // SGloc.ColumnsName.Text := 'Codigo,50' + #13 + 'Nome,300' + #13 + 'Preço,80' + #13+'Grupo,150' + #13 + 'Fornecedor,250';//coloca titulo no String grid

    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and f.razao_social like ' + QuotedStr('%' + valor + '%') +
        ' order by ativo, f.razao_social'
    else
      cmd := cmd + ' and f.razao_social like ' + QuotedStr(valor + '%') +
        ' order by  ativo, f.razao_social';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
    // mmlocalizar.fieldbyname('cod_fornecedor').Visible := false;

  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_produto').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('nom_produto').DisplayLabel := 'Produto';
  mmLocalizar.fieldbyname('marca').DisplayLabel := 'Marca';
  mmLocalizar.fieldbyname('promocao').DisplayLabel := 'Promoção';
  mmLocalizar.fieldbyname('preco_venda').DisplayLabel := 'Preço de Venda';
  mmLocalizar.fieldbyname('nom_grupo').DisplayLabel := 'Grupo';
  mmLocalizar.fieldbyname('ativo').DisplayLabel := 'Desativado';
  mmLocalizar.fieldbyname('ativo').Alignment := taCenter;

  if CBcampos.Text = 'Fornecedor' then
    mmLocalizar.fieldbyname('razao_social').DisplayLabel := 'Fornecedor';

end;

procedure TFr_localizar.loc_estrutura_clonar(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := 'SELECT ' + '  A.COD_PRODUTO, ' + '  A.NOM_PRODUTO ' + 'from ' +
    '  PRODUTO A ' + 'where ' + '  a.cod_produto in ' + '  ( ' + '     select '
    + '       b.cod_produto_acabado ' + '     from ' +
    '       estrutura_produto b ' + '    )';

  if CBcampos.Text = 'Codigo' then
  begin

    if valor = '' then
      cmd := cmd + ' order by a.cod_produto '
    else
    begin
      cmd := cmd + ' and a.cod_produto = ' + QuotedStr(valor) +
        ' order by a.cod_produto ';
    end;

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Produto' then
  begin
    if valor = '' then
      cmd := cmd + ' order by a.nom_produto '
    else
    begin
      if zzbusca_qualquer.Checked then
        cmd := cmd + ' and a.nom_produto like ' + QuotedStr('%' + valor + '%') +
          ' order by nom_produto '
      else
        cmd := cmd + ' and a.nom_produto like ' + QuotedStr(valor + '%') +
          ' order by a.nom_produto ';
    end;

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
    // mmlocalizar.fieldbyname('cod_fornecedor').Visible := false;

  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_produto').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('nom_produto').DisplayLabel := 'Produto';

end;

procedure TFr_localizar.sglocKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    mostra_campos;
  end;

end;

procedure TFr_localizar.sglocDblClick(Sender: TObject);
begin
  mostra_campos;
end;

procedure TFr_localizar.loc_usuario_log(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select codusu, LOGUSU from tbusu ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where codusu = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nome like ' + QuotedStr('%' + valor + '%') +
        ' order by nome'
    else
      cmd := cmd + 'where nome like ' + QuotedStr(valor + '%') +
        ' order by nome';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('codusu').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('codusu').DisplayWidth := 5;
  mmLocalizar.fieldbyname('LOGUSU').DisplayLabel := 'Nome';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
  end;
end;

procedure TFr_localizar.loc_cidade(valor: string);
var
  i: Integer;
begin

  if CBcampos.Text = 'Codigo' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select c.cod_cidade, c.nom_cidade, mi.MICRONOMEX, me.MESONOMEX, c.uf from cidades c inner join CADMICRO mi on mi.MICROCOD = c.MICROCOD inner join CADMESO me on me.MESOCOD = mi.MESOCOD where c.cod_cidade = '
        + QuotedStr(valor));
      open;
    end;

  end;

  if CBcampos.Text = 'Nome' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select c.cod_cidade, c.nom_cidade, mi.MICRONOMEX, me.MESONOMEX, c.uf from cidades c inner join CADMICRO mi on mi.MICROCOD = c.MICROCOD inner join CADMESO me on me.MESOCOD = mi.MESOCOD where c.nom_cidade like '
        + QuotedStr('%' + valor + '%') + ' order by nom_cidade ');
      open;
    end;
  end;

  if CBcampos.Text = 'Microregião' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select c.cod_cidade, c.nom_cidade, mi.MICRONOMEX, me.MESONOMEX, c.uf from cidades c inner join CADMICRO mi on mi.MICROCOD = c.MICROCOD inner join CADMESO me on me.MESOCOD = mi.MESOCOD where mi.MICRONOMEX like '
        + QuotedStr('%' + valor + '%') + ' order by nom_cidade ');
      open;
    end;
  end;

  if CBcampos.Text = 'Mesoregião' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select c.cod_cidade, c.nom_cidade, mi.MICRONOMEX, me.MESONOMEX, c.uf from cidades c inner join CADMICRO mi on mi.MICROCOD = c.MICROCOD inner join CADMESO me on me.MESOCOD = mi.MESOCOD where me.MESONOMEX like '
        + QuotedStr('%' + valor + '%') + ' order by nom_cidade ');
      open;
    end;
  end;

  if CBcampos.Text = 'UF' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select c.cod_cidade, c.nom_cidade, mi.MICRONOMEX, me.MESONOMEX, c.uf from cidades c inner join CADMICRO mi on mi.MICROCOD = c.MICROCOD inner join CADMESO me on me.MESOCOD = mi.MESOCOD where c.uf like '
        + QuotedStr('%' + valor + '%') + ' order by nom_cidade ');
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_cidade').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_cidade').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';

  mmLocalizar.fieldbyname('MICRONOMEX').DisplayLabel := 'Microregião';
  mmLocalizar.fieldbyname('MESONOMEX').DisplayLabel := 'Mesoregião';

  mmLocalizar.fieldbyname('uf').DisplayLabel := 'UF';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_mesoregiao(valor: string);
var
  i: Integer;
begin

  if CBcampos.Text = 'Codigo' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MESOCOD, MESONOMEX, UFCOD from CADMESO where MESOCOD = ' +
        QuotedStr(valor));
      open;
    end;
  end;

  if CBcampos.Text = 'Nome' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MESOCOD, MESONOMEX, UFCOD from CADMESO where MESONOMEX like '
        + QuotedStr('%' + valor + '%') + ' order by MESONOMEX');
      open;
    end;
  end;

  if CBcampos.Text = 'UF' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MESOCOD, MESONOMEX, UFCOD from CADMESO where UFCOD like '
        + QuotedStr('%' + valor + '%') + ' order by MESONOMEX');
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('MESOCOD').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('MESOCOD').DisplayWidth := 5;
  mmLocalizar.fieldbyname('MESONOMEX').DisplayLabel := 'Nome';
  mmLocalizar.fieldbyname('UFCOD').DisplayLabel := 'UF';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_microregiao(valor: string);
var
  i: Integer;
begin

  if CBcampos.Text = 'Codigo' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MC.MICROCOD, MC.MICRONOMEX, MS.MESONOMEX, MC.UFCOD from CADMICRO MC INNER JOIN CADMESO MS ON (MC.MESOCOD = MS.MESOCOD) where MC.MICROCOD = '
        + QuotedStr(valor) + ' order by MICRONOMEX');
      open;
    end;

  end;

  if CBcampos.Text = 'Nome' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MC.MICROCOD, MC.MICRONOMEX, MS.MESONOMEX, MC.UFCOD from CADMICRO MC INNER JOIN CADMESO MS ON (MC.MESOCOD = MS.MESOCOD) where MC.MICRONOMEX like '
        + QuotedStr('%' + valor + '%') + ' order by MICRONOMEX');
      open;
    end;
  end;

  if CBcampos.Text = 'Mesoregião' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MC.MICROCOD, MC.MICRONOMEX, MS.MESONOMEX, MC.UFCOD from CADMICRO MC INNER JOIN CADMESO MS ON (MC.MESOCOD = MS.MESOCOD) where MS.MESONOMEX like '
        + QuotedStr('%' + valor + '%') + ' order by MICRONOMEX');
      open;
    end;
  end;

  if CBcampos.Text = 'UF' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select MC.MICROCOD, MC.MICRONOMEX, MS.MESONOMEX, MC.UFCOD from CADMICRO MC INNER JOIN CADMESO MS ON (MC.MESOCOD = MS.MESOCOD) where MC.UFCOD like '
        + QuotedStr('%' + valor + '%') + ' order by MICRONOMEX');
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('MICROCOD').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('MICROCOD').DisplayWidth := 5;
  mmLocalizar.fieldbyname('MICRONOMEX').DisplayLabel := 'Nome';
  mmLocalizar.fieldbyname('MESONOMEX').DisplayLabel := 'MesoRegião';
  mmLocalizar.fieldbyname('UFCOD').DisplayLabel := 'UF';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_fop(valor: string);
var
  i: Integer;
  cmd, ativo: string;
begin
  cmd := '';
  cmd := 'select cod_fop, nom_fop, ATIVO from fop ';

  ativo := '';

  if chamou_form = 'fr_pedido_fop' then
    ativo := ' AND ATIVO = ''S''';

  if chamou_form = 'fr_pedido_simplificado_fop' then
    ativo := ' AND ATIVO = ''S'' AND INATIVO_PALM = ''N''';

  if CBcampos.Text = 'Código' then
  begin

    if valor = '' then
      cmd := cmd + ' order by nom_fop '
    else
      cmd := cmd + 'where cod_fop = ' + QuotedStr(valor) + ativo;

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin

    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nom_fop like ' + QuotedStr('%' + valor + '%') + ativo
        + ' order by nom_fop'
    else
      cmd := cmd + 'where nom_fop like ' + QuotedStr(valor + '%') + ativo +
        ' order by nom_fop';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_fop').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_fop').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_fop').DisplayLabel := 'Forma Pgto';
  mmLocalizar.fieldbyname('nom_fop').DisplayWidth := 50;
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_cod_fiscal(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select cod_fiscal, Nome from cod_fiscal ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where cod_fiscal = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nome like ' + QuotedStr('%' + valor + '%') +
        ' order by nome'
    else
      cmd := cmd + 'where nome like ' + QuotedStr(valor + '%') +
        ' order by nome';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_fiscal').DisplayLabel := 'Código Fiscal';
  mmLocalizar.fieldbyname('nome').DisplayLabel := 'Nome';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_entrada(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select E1.nr_documento, e1.DTA_DOCUMENTO,  ' +
         'e1.DTA_DOCUMENTO as data_ord, e1.cod_fornecedor, f.razao_social, ' +
         'f.cnpcpf, coalesce(e1.VL_TOTAL,0) as VL_TOTAL ' +
         'from entrada1 e1 ' +
         'left join fornecedor f on f.cod_fornecedor = e1.cod_fornecedor ';

  if (CBcampos.Text = 'Nº Documento') and (EDlocalizar.Text <> '') then
  begin
    cmd := cmd + 'where E1.nr_documento = ' + QuotedStr(valor) +
      ' order by E1.nr_documento desc ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    cmd := cmd + 'where f.cnpcpf = ' + QuotedStr(valor) +
      ' order by data_ord desc, E1.nr_documento desc ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;

  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where f.razao_social like ' + QuotedStr('%' + valor + '%') +
        ' order by data_ord desc, f.razao_social, e1.nr_documento desc '
    else
      cmd := cmd + 'where f.razao_social like ' + QuotedStr(valor + '%') +
        ' order by data_ord desc, F.razao_social, e1.nr_documento desc ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Codigo Fiscal' then
  begin
    cmd := cmd + 'where e1.cod_fiscal like ' + QuotedStr(valor + '%');

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd + ' order by data_ord desc, e1.nr_documento desc ');
      open;
    end;
  end;

  if (Qu_localizar.RecordCount <= 0) or (Qu_localizar.Active = false) then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI', MB_ICONWARNING);
    exit;
  end;
  mmLocalizar.fieldbyname('cod_fornecedor').Visible := false;
  mmLocalizar.fieldbyname('nr_documento').DisplayLabel := 'Documento';
  mmLocalizar.fieldbyname('nr_documento').Alignment := taCenter;
  mmLocalizar.fieldbyname('DTA_DOCUMENTO').DisplayLabel := 'Data';
  mmLocalizar.fieldbyname('razao_social').DisplayLabel := 'Fornecedor';
  mmLocalizar.fieldbyname('cnpcpf').DisplayLabel := 'Cnpj/Cpf';
  mmLocalizar.fieldbyname('VL_TOTAL').DisplayLabel := 'Total';
  mmLocalizar.fieldbyname('VL_TOTAL').DisplayWidth := 10;
  // DgLocalizar.SetFocus;
end;

procedure TFr_localizar.DgLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    mostra_campos;
  end;
end;

procedure TFr_localizar.ListarSelecionados;
var
  valor, campo: string;
begin
  campo := mmLocalizar.Fields[0].FieldName;
  valor := mmLocalizar.Fields[0].AsString;
  tem_selecionado := false;
  mmLocalizar.DisableControls;
  mmLocalizar.First;
  selecionados := '';
  while not mmLocalizar.Eof do
  begin
    if mmLocalizar.fieldbyname('check').Value = true then
    begin
      if chamou_pesquisa <> 'fr_UF' then
        selecionados := selecionados + mmLocalizar.Fields[0].AsString + ';'
      else
        selecionados := selecionados + QuotedStr(mmLocalizar.Fields[0].AsString) + ','
    end;
    mmLocalizar.Next
  end;
  selecionados := copy(selecionados, 1, length(selecionados) - 1);
  tem_selecionado := selecionados <> '';
  mmLocalizar.Locate(campo, valor, [loCaseInsensitive]);
  mmLocalizar.EnableControls;
end;

procedure TFr_localizar.DgLocalizarDblClick(Sender: TObject);
begin
  if mmLocalizar.Active = false then
    exit;

  mmLocalizar.Edit;
  if mmLocalizar.fieldbyname('check').Value = true then
    mmLocalizar.fieldbyname('check').Value := false
  else
    mmLocalizar.fieldbyname('check').Value := true;
  mmLocalizar.post;
  ListarSelecionados;
  // mostra_campos;
end;

procedure TFr_localizar.BT_cadastroClick(Sender: TObject);
begin
  if chamou_cadastro = 'Fr_produto' then
  begin
    Application.CreateForm(TFr_produtos, Fr_produtos);
    Fr_produtos.ShowModal;
    Fr_produtos.Free;
  end
  else if chamou_cadastro = 'Fr_servicos' then
  begin
    Application.CreateForm(TFr_produto_nao_revenda, Fr_produto_nao_revenda);
    Fr_produto_nao_revenda.ShowModal;
  end
  else if chamou_cadastro = 'fr_cor' then
  begin
    Application.CreateForm(TFr_cor, Fr_cor);
    Fr_cor.ShowModal;
  end
  else if chamou_cadastro = 'fr_motivo' then
  begin
    Application.CreateForm(TFr_motivo_nfe_cancel, Fr_motivo_nfe_cancel);
    Fr_motivo_nfe_cancel.ShowModal;
  end
  else if chamou_cadastro = 'fr_plano_conta' then
  begin
    Application.CreateForm(Tfr_plano_contas, fr_plano_contas);
    fr_plano_contas.ShowModal;
  end
  else if chamou_cadastro = 'fr_unidade' then
  begin
    Application.CreateForm(TFr_tabela_unidade, Fr_tabela_unidade);
    Fr_tabela_unidade.ShowModal;
  end
  else if chamou_cadastro = 'fr_tamanho' then
  begin
    Application.CreateForm(TFr_tamanho, Fr_tamanho);
    Fr_tamanho.ShowModal;
  end
  else if chamou_cadastro = 'Fr_colecao' then
  begin
    Application.CreateForm(TFr_colecao, Fr_colecao);
    Fr_colecao.ShowModal;
  end
  else if chamou_cadastro = 'Fr_cliente' then
  begin
    Application.CreateForm(TFr_Cliente, Fr_Cliente);
    Fr_Cliente.ShowModal;
  end
  else if chamou_cadastro = 'Fr_fornecedor' then
  begin
    Application.CreateForm(TFr_fornecedor, Fr_fornecedor);
    Fr_fornecedor.ShowModal;
  end
  else if chamou_cadastro = 'Fr_transportadora' then
  begin
    Application.CreateForm(TFr_Transportadora, Fr_Transportadora);
    Fr_Transportadora.ShowModal;
  end
  else if chamou_cadastro = 'fr_grupo' then
  begin
    Application.CreateForm(TFr_grupo, Fr_grupo);
    Fr_grupo.ShowModal;
  end
  else if chamou_cadastro = 'fr_subcategoria' then
  begin
    Application.CreateForm(TFr_subcategoria, Fr_subcategoria);
    Fr_subcategoria.ShowModal;
  end
  else if chamou_cadastro = 'fr_categoria' then
  begin
    Application.CreateForm(TFr_categoria, Fr_categoria);
    Fr_categoria.ShowModal;
  end
  else if chamou_cadastro = 'fr_colecao' then
  begin
    Application.CreateForm(TFr_colecao, Fr_colecao);
    Fr_colecao.ShowModal;
  end
  else if chamou_cadastro = 'fr_representante' then
  begin
    Application.CreateForm(TFr_representante, Fr_representante);
    Fr_representante.ShowModal;
  end
  else if chamou_cadastro = 'fr_supervisor' then
  begin
    Application.CreateForm(TFr_representante, Fr_representante);
    Fr_representante.ShowModal;
  end
  else if chamou_cadastro = 'fr_fop' then
  begin
    Application.CreateForm(TFr_forma_pagamento, Fr_forma_pagamento);
    Fr_forma_pagamento.ShowModal;
  end
  else if chamou_cadastro = 'fr_prazo' then
  begin
    Application.CreateForm(TFr_prazo_pagamento, Fr_prazo_pagamento);
    Fr_prazo_pagamento.ShowModal;
  end
  else if chamou_cadastro = 'fr_veiculos' then
  begin
    Application.CreateForm(Tfr_veiculo, fr_veiculo);
    fr_veiculo.ShowModal;
  end
  else if chamou_cadastro = 'fr_marca' then
  begin
    Application.CreateForm(TFr_marcas, Fr_marcas);
    Fr_marcas.ShowModal;
  end
  else if chamou_cadastro = 'fr_motorista' then
  begin
    Application.CreateForm(TFr_motorista, Fr_motorista);
    Fr_motorista.ShowModal;
  end
  else if chamou_cadastro = 'Fr_cheque_terceiros' then
  begin
    Application.CreateForm(TFr_cheque_terceiros, Fr_cheque_terceiros);
    Fr_cheque_terceiros.ShowModal;
  end

end;

procedure TFr_localizar.loc_empresa(valor: string);
var
  i: Integer;
begin

  if CBcampos.Text = 'Codigo' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select cod_empresa, nom_empresa, CNPJ from empresa where cod_empresa = '
        + QuotedStr(valor));
      open;
    end;

  end;

  if CBcampos.Text = 'Nome' then
  begin
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add('select cod_empresa, nom_empresa, CNPJ from empresa where nom_empresa like '
        + QuotedStr('%' + valor + '%'));
      open;
    end;

  end;
  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_empresa').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_empresa').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_empresa').DisplayLabel := 'Nome';
  mmLocalizar.fieldbyname('CNPJ').DisplayLabel := 'CNPJ';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_plano_conta(valor: string);
var
  i: Integer;
  sqlplano: string;
begin
  sqlplano := 'SELECT ' +
    '  COALESCE(PC4.ID, COALESCE(PC3.ID, COALESCE(PC2.ID, PC1.ID))) AS ID, ' +
    '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
    '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
    '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
    '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' + 'FROM ' +
    '  PLANO_CONTAS PC1 ' +
    'LEFT OUTER JOIN PLANO_CONTAS PC2 ON (PC1.ID = PC2.ID_PAI) ' +
    'LEFT OUTER JOIN PLANO_CONTAS PC3 ON (PC2.ID = PC3.ID_PAI) ' +
    'LEFT OUTER JOIN PLANO_CONTAS PC4 ON (PC3.ID = PC4.ID_PAI) ' +
    'WHERE 1 = 1';

  if chamou_form = 'fr_cp_plano_conta' then
    sqlplano := sqlplano +
      ' AND PC4.NIVEL = 4 AND (PC3.ID IN (''118'') OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''43'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58''))';

  if chamou_form = 'fr_cr_plano_conta' then
    sqlplano := sqlplano + ' AND PC4.NIVEL = 4 AND (PC3.ID IN (''7''))';

  if CBcampos.Text = 'Codigo' then
    sqlplano := sqlplano + ' AND PC4.ID = ' + QuotedStr(valor);

  if CBcampos.Text = 'N° Conta' then
    sqlplano := sqlplano + ' AND PC4.NR_CONTA like ' +
      QuotedStr('%' + valor + '%');

  if CBcampos.Text = 'Descrição' then
    sqlplano := sqlplano +
      '  AND (COALESCE(PC4.DESCRICAO, COALESCE(PC3.DESCRICAO, coalesce(PC2.DESCRICAO, PC1.DESCRICAO))) like '
      + QuotedStr('%' + valor + '%') + ')';

  sqlplano := sqlplano + ' limit 1 ';
  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(sqlplano);
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('ID').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;

  mmLocalizar.fieldbyname('DESCRICAO1').DisplayLabel := 'Nível 1';
  mmLocalizar.fieldbyname('DESCRICAO2').DisplayLabel := 'Nível 2';
  mmLocalizar.fieldbyname('DESCRICAO3').DisplayLabel := 'Nível 3';
  mmLocalizar.fieldbyname('DESCRICAO4').DisplayLabel := 'Nível 4';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_transportadora(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select cod_transportadora, Nome from transportadora ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where cod_transportadora = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nome like ' + QuotedStr('%' + valor + '%') +
        ' order by nome'
    else
      cmd := cmd + 'where nome like ' + QuotedStr(valor + '%') +
        ' order by nome';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('cod_transportadora').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('cod_transportadora').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nome').DisplayLabel := 'Nome';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_cores(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, cor from cores ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Cor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where cor like ' + QuotedStr('%' + valor + '%') +
        ' order by cor'
    else
      cmd := cmd + 'where cor like ' + QuotedStr(valor + '%') + ' order by cor';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('cor').DisplayLabel := 'Cor';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_tamanho(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, tamanho from tamanho ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Tamanho' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where tamanho like ' + QuotedStr('%' + valor + '%') +
        ' order by tamanho'
    else
      cmd := cmd + 'where tamanho like ' + QuotedStr(valor + '%') +
        ' order by tamanho';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('tamanho').DisplayLabel := 'Tamanho';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_vendas_ref(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select a.NUMDOC , a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, ' +
    'a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, '
    + 'a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, ' +
    'a.TIPO_VENDA, a.QTD_PARCELAS , a.USUARIO_DESFATUROU, ' +
    'a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, a.DTA_EMISSAO, '
    + 'a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, '
    + 'a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, '
    + 'a.VL_FRETE, a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, '
    + 'a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, '
    + 'a.VENDA_ENVIADA, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, ' +
    'a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, '
    + 'a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, '
    + 'a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, '
    + 'c.nom_cliente, c.nom_fantasia, c.cnpj, c.cpf, cd.nom_cidade, ' +
    'r.nom_representante, f.razao_social ' + 'from vendas1 a ' +
    'left join cliente c on c.cod_cliente = a.cod_cliente ' +
    'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
    'left join representante r on r.id = a.cod_representante ' +
    'left join fornecedor f on f.cod_fornecedor = a.cod_fornecedor ' +
    ' where a.status_nfe = 100 ';

  if CBcampos.Text = 'Numero' then
    cmd := cmd + 'and a.numdoc = ' + QuotedStr(valor)
  else if CBcampos.Text = 'CPF' then
    cmd := cmd + 'and c.cpf = ' + QuotedStr(valor) +
      ' order by c.cpf, a.NUMDOC DESC'
  else if CBcampos.Text = 'CNPJ' then
    cmd := cmd + 'and c.cnpj = ' + QuotedStr(valor) +
      ' order by c.cnpj, a.NUMDOC DESC'
  else if CBcampos.Text = 'NFE' then
    cmd := cmd + 'and a.nfe = ' + QuotedStr(valor)
  else if CBcampos.Text = 'NF' then
    cmd := cmd + 'and a.nf = ' + QuotedStr(valor)
  else if CBcampos.Text = 'Cidade' then // CIDADE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and cd.nom_cidade like ' + QuotedStr('%' + valor + '%') +
        ' order by cd.nom_cidade, a.NUMDOC DESC '
    else
      cmd := cmd + 'and cd.nom_cidade like ' + QuotedStr(valor + '%') +
        ' order by cd.nom_cidade, a.NUMDOC DESC';
  end
  else if CBcampos.Text = 'Cliente - Razão S.' then // CLIENTE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and c.nom_cliente like ' + QuotedStr('%' + valor + '%') +
        ' order by c.nom_cliente, a.NUMDOC DESC'
    else
      cmd := cmd + 'and c.nom_cliente like ' + QuotedStr(valor + '%') +
        ' order by c.nom_cliente, a.NUMDOC DESC';

  end
  else if CBcampos.Text = 'Cliente - Fantasia' then // CLIENTE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and c.NOM_FANTASIA like ' + QuotedStr('%' + valor + '%') +
        ' order by c.NOM_FANTASIA, a.NUMDOC DESC'
    else
      cmd := cmd + 'and c.NOM_FANTASIA like ' + QuotedStr(valor + '%') +
        ' order by c.NOM_FANTASIA, a.NUMDOC DESC';
  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and f.razao_social like ' + QuotedStr('%' + valor + '%') +
        ' order by f.razao_social, a.NUMDOC DESC '
    else
      cmd := cmd + 'and f.razao_social like ' + QuotedStr(valor + '%') +
        ' order by f.razao_social, a.NUMDOC DESC';
  end
  else if CBcampos.Text = 'Vendedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and r.nom_representante like ' +
        QuotedStr('%' + valor + '%') +
        ' order by r.nom_representante, a.NUMDOC DESC '
    else
      cmd := cmd + 'and r.nom_representante like ' + QuotedStr(valor + '%') +
        ' order by r.nom_representante, a.NUMDOC DESC';
  end;

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('numdoc').DisplayLabel := 'Numero';
  mmLocalizar.fieldbyname('nom_cliente').DisplayLabel :=
    'Cliente - Razão Social';
  mmLocalizar.fieldbyname('nom_fantasia').DisplayLabel :=
    'Cliente - Nome Fantasia';
  mmLocalizar.fieldbyname('CNPJ').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('CPF').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';
  mmLocalizar.fieldbyname('nom_representante').DisplayLabel := 'Vendedor';
  mmLocalizar.fieldbyname('cod_cliente').Visible := false;

  // //DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_vendas(valor: string);
var
  i: Integer;
  cmd1, cmd, cmd_aux, representante_cmd, cmd_cidades, cmd_cliente,
    cmd_fornecedor, cmd_representante, cmd_televendas: string;
begin
  cmd := '';

  cmd := 'select ' +#13+
    '  case v1.orcamento ' +#13+
    '  when 1 ' +#13+
    '  then ''ORÇAMENTO'' ' +#13+
    '  else case v1.faturado ' +#13+
    '       when 0 ' +#13+
    '       then ''ABERTO'' ' +#13+
    '       else case v1.faturado ' +#13+
    '            when 1 ' +#13+
    '            then case ' +#13+
    '                 when (v1.nfe_dev is null and coalesce(cast(v1.nfeentradasaida as integer), 0) = 0) ' +#13+
    '                  and coalesce(V1.PROCESSO_ID, 0) NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
    '                 then ''FATURADO'' ' +#13+
    '                 else case when coalesce(cast(v1.tiponfe as integer),0) = 1 ' +
    '                      then ''FATURADO-COMPLEMENTAR'' '+
    '                      else ''FATURADO-DEVOLUÇÃO'' ' +#13+
    '                      end '+
    '                 end ' +#13+
    '            else case v1.faturado ' +#13+
    '                 when 2 ' +#13+
    '                 then ''CANCELADA'' ' +#13+
    '                 else case v1.faturado ' +#13+
    '                      when 3 ' +#13+
    '                      then ''DEVOLUÇÃO/REMESSA'' ' +#13+
    '                      else case v1.faturado ' +#13+
    '                           when 4 ' +#13+
    '                           then ''DESATIVADO'' ' +#13+
    '                           else case v1.faturado ' +#13+
    '                                when 5 ' +#13+
    '                                then ''NFE DENEGADA'' ' +#13+
    '                                end ' +#13+
    '                           end ' +#13+
    '                      end ' +#13+
    '                 end ' +#13+
    '            end ' +#13+
    '       end ' +#13+
    '  end as status, ' +#13+
    '  numdoc, ' +#13+
    '  v1.nfe, ' +#13+
    '  v1.DTADOC as Data, ' +#13+
    '  coalesce(v1.COD_FORNECEDOR, v1.cod_cliente) as cod_cliente, ' +#13+
    '  coalesce(f.RAZAO_SOCIAL, c1.nom_cliente) as Cliente, ' +#13+
    '  coalesce(f.FANTASIA, c1.nom_fantasia) as nom_fantasia, ' +#13+
    '  coalesce(f.CNPCPF, c1.cnpj) as cnpj, ' +#13+
    '  coalesce(f.CNPCPF, c1.cpf) as cpf, ' +#13+
    '  coalesce(v1.tot_liquido, 0) as Total, ' +#13+
    '  coalesce(cf.NOM_CIDADE, cd.nom_cidade) as nom_cidade, ' +#13+
    '  r.nom_representante, ' +
    '  t.nom_representante as televendas '+
    'from vendas1 v1 ';

  cmd_cliente := 'left join cliente c1 on c1.cod_cliente = v1.cod_cliente '+#13;
  cmd_cidades := 'left join cidades cd on cd.cod_cidade =  c1.cod_cidade '+#13;
  cmd_fornecedor := 'left join fornecedor f on f.cod_fornecedor = v1.cod_fornecedor left join cidades cf on cf.cod_cidade = f.cod_cidade '+#13;
  cmd_representante :='left join representante r on r.id = v1.cod_representante '+#13;
  cmd_televendas :='left join representante t on t.id = v1.cod_supervisor '+#13;

  if (frpri.TipUsu = '0') then
  begin
    if not frpri.supervisor then
    begin
      cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente '+#13;
      representante_cmd := representante_cmd + ' and c1.id_representante = ' + frpri.Representante_id+#13;
    end
    else
    begin
      cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente '+#13;
      representante_cmd := representante_cmd +' and c1.id_representante =  in (select r.ID from REPRESENTANTE r where r.FUNCIONARIO = ''0'' and r.ATIVO = ''S'')  and cl.cliente_bloqueado = ''N'' '+#13;
    end;
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end;

  if CBcampos.Text = 'Numero' then
  begin
    cmd_aux := cmd_aux + 'where v1.numdoc = ' + QuotedStr(valor) +#13+ representante_cmd +#13+ ' order by orcamento desc, status, numdoc desc ';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'CPF' then
  begin
    cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente '+#13;
    cmd_aux := cmd_aux + 'where c1.cpf = ' + QuotedStr(valor) + representante_cmd + ' order by orcamento desc, status, c1.cpf, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente '+#13;
    cmd_aux := cmd_aux + 'where c1.cnpj = ' + QuotedStr(valor) + representante_cmd + ' order by orcamento desc, status, c1.cnpj, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'NFE' then
  begin
    cmd_aux := cmd_aux + 'where v1.nfe = ' + QuotedStr(valor) + representante_cmd + ' order by orcamento desc, status, nfe desc ';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
     + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'NF' then
  begin
    cmd_aux := cmd_aux + 'where v1.nf = ' + QuotedStr(valor) + representante_cmd + ' order by orcamento desc, status, nf desc ';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Cidade' then // CIDADE
  begin
    cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente ';
    cmd_cidades := 'inner join cidades cd on cd.cod_cidade = c1.cod_cidade ';
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where cd.nom_cidade like ' + QuotedStr('%' + valor + '%') + representante_cmd + ' order by orcamento desc, status, cd.nom_cidade, NUMDOC DESC '
    else
      cmd_aux := cmd_aux + 'where cd.nom_cidade like ' + QuotedStr(valor + '%') + representante_cmd + ' order by orcamento desc, status, cd.nom_cidade, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Cliente - Código' then // CLIENTE
  begin
    cmd_cliente := 'inner join cliente c1 on  c1.cod_cliente = v1.cod_cliente ';
    cmd_aux := cmd_aux + 'where c1.cod_cliente = ' + valor +
      ' order by orcamento desc, status, c1.cod_cliente, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Cliente - Razão S.' then // CLIENTE
  begin
    cmd_cliente := 'inner join cliente c1 on c1.cod_cliente = v1.cod_cliente ';
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where c1.nom_cliente like ' +
        QuotedStr('%' + valor + '%') + representante_cmd +
        ' order by orcamento desc, status, c1.nom_cliente, NUMDOC DESC'
    else
      cmd_aux := cmd_aux + 'where c1.nom_cliente like ' + QuotedStr(valor + '%')
        + representante_cmd + ' order by orcamento desc, status, c1.nom_cliente, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
      + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Cliente - Fantasia' then // CLIENTE
  begin
    cmd_cliente :=
      'inner join cliente  c1 on  c1.cod_cliente = v1.cod_cliente ';
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where c1.NOM_FANTASIA like ' +
        QuotedStr('%' + valor + '%') + representante_cmd +
        ' order by orcamento desc, status, c1.NOM_FANTASIA, NUMDOC DESC'
    else
      cmd_aux := cmd_aux + 'where c1.NOM_FANTASIA like ' +
        QuotedStr(valor + '%') + representante_cmd +
        ' order by orcamento desc, status, c1.NOM_FANTASIA, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    cmd_fornecedor :=
      ' left join fornecedor f on f.cod_fornecedor = v1.cod_fornecedor left join cidades cf on cf.cod_cidade = f.cod_cidade ';
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where f.razao_social like ' +
        QuotedStr('%' + valor + '%') + representante_cmd +
        ' order by orcamento desc, status, f.razao_social, NUMDOC DESC '
    else
      cmd_aux := cmd_aux + 'where f.razao_social like ' + QuotedStr(valor + '%')
        + representante_cmd + ' order by orcamento desc, status, f.razao_social, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Vendedor' then
  begin
    cmd_representante :=
      'inner join representante r on r.id = v1.cod_representante ';
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where r.nom_representante like ' +
        QuotedStr('%' + valor + '%') + representante_cmd +
        ' order by orcamento desc, status, r.nom_representante, NUMDOC DESC '
    else
      cmd_aux := cmd_aux + 'where r.nom_representante like ' +
        QuotedStr(valor + '%') + representante_cmd +
        ' order by orcamento desc, status, r.nom_representante, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end
  else if CBcampos.Text = 'Televendas' then
  begin
    cmd_televendas :='inner join representante t on t.id = v1.cod_supervisor '+#13;
    if zzbusca_qualquer.Checked then
      cmd_aux := cmd_aux + 'where t.nom_representante like ' +
        QuotedStr('%' + valor + '%') + representante_cmd +
        ' order by orcamento desc, status, t.nom_representante, NUMDOC DESC '
    else
      cmd_aux := cmd_aux + 'where t.nom_representante like ' +
        QuotedStr(valor + '%') + representante_cmd +
        ' order by orcamento desc, status, t.nom_representante, NUMDOC DESC';
    cmd1 := cmd_representante + cmd_fornecedor + cmd_cliente + cmd_cidades
       + cmd_televendas + cmd_aux;
  end;

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd1 + ' LIMIT 1000 ');
    sql.SaveToFile('teste.sql');
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('status').DisplayLabel := 'Status';
  mmLocalizar.fieldbyname('Numdoc').DisplayLabel := 'Numero';
  mmLocalizar.fieldbyname('Numdoc').DisplayWidth := 5;
  mmLocalizar.fieldbyname('Numdoc').Alignment := taCenter;
  mmLocalizar.fieldbyname('Nfe').DisplayLabel := 'NF-e';
  mmLocalizar.fieldbyname('Nfe').DisplayWidth := 5;
  mmLocalizar.fieldbyname('Nfe').Alignment := taCenter;
  mmLocalizar.fieldbyname('Data').DisplayLabel := 'Data';
  mmLocalizar.fieldbyname('Data').Alignment := taCenter;
  mmLocalizar.fieldbyname('Cliente').DisplayLabel := 'Cliente - Razão Social';
  mmLocalizar.fieldbyname('Cliente').DisplayWidth := 50;
  mmLocalizar.fieldbyname('nom_fantasia').DisplayLabel := 'Cliente - Nome Fantasia';
  mmLocalizar.fieldbyname('nom_fantasia').DisplayWidth := 30;
  mmLocalizar.fieldbyname('CNPJ').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('CPF').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';
  mmLocalizar.fieldbyname('nom_cidade').DisplayWidth := 20;
  mmLocalizar.fieldbyname('nom_representante').DisplayLabel := 'Vendedor';
  mmLocalizar.fieldbyname('nom_representante').DisplayWidth := 20;
  mmLocalizar.fieldbyname('televendas').DisplayLabel := 'Televendas';
  mmLocalizar.fieldbyname('televendas').DisplayWidth := 20;
  mmLocalizar.fieldbyname('cod_cliente').Visible := false;
  mmLocalizar.fieldbyname('cnpj').DisplayWidth := 18;
  mmLocalizar.fieldbyname('cpf').DisplayWidth := 18;
  mmLocalizar.fieldbyname('total').DisplayLabel := 'Total';
  mmLocalizar.fieldbyname('total').DisplayWidth := 10;
  { mmlocalizar.fieldbyname('status').DisplayWidth:= 140;
  }
  // //DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_vendas_complementar(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select numdoc, dtadoc, v1.cod_cliente, c.nom_cliente, c.nom_fantasia, c.cnpj, c.cpf, tot_liquido Total, cd.nom_cidade, r.nom_representante, v1.nf as NF, f.razao_social as fornecedor from vendas1 v1 '
    + 'left join cliente c on c.cod_cliente = v1.cod_cliente ' +
    'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
    'left join representante r on r.id = v1.cod_representante ' +
    'left join fornecedor f on f.cod_fornecedor = v1.cod_fornecedor where (numdoc_ref is not null) ';

  if CBcampos.Text = 'Numero' then
    cmd := cmd + 'and numdoc = ' + QuotedStr(valor)
  else if CBcampos.Text = 'CPF' then
    cmd := cmd + 'and c.cpf = ' + QuotedStr(valor) +
      ' order by c.cpf, NUMDOC DESC'
  else if CBcampos.Text = 'CNPJ' then
    cmd := cmd + 'and c.cnpj = ' + QuotedStr(valor) +
      ' order by c.cnpj, NUMDOC DESC'
  else if CBcampos.Text = 'NFE' then
    cmd := cmd + 'and v1.nfe = ' + QuotedStr(valor)
  else if CBcampos.Text = 'NF' then
    cmd := cmd + 'and v1.nf = ' + QuotedStr(valor)
  else if CBcampos.Text = 'Cidade' then // CIDADE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and cd.nom_cidade like ' + QuotedStr('%' + valor + '%') +
        ' order by cd.nom_cidade, NUMDOC DESC '
    else
      cmd := cmd + 'and cd.nom_cidade like ' + QuotedStr(valor + '%') +
        ' order by cd.nom_cidade, NUMDOC DESC';
  end
  else if CBcampos.Text = 'Cliente - Razão S.' then // CLIENTE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and c.nom_cliente like ' + QuotedStr('%' + valor + '%') +
        ' order by c.nom_cliente, NUMDOC DESC'
    else
      cmd := cmd + 'and c.nom_cliente like ' + QuotedStr(valor + '%') +
        ' order by c.nom_cliente, NUMDOC DESC';

  end
  else if CBcampos.Text = 'Cliente - Fantasia' then // CLIENTE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and c.NOM_FANTASIA like ' + QuotedStr('%' + valor + '%') +
        ' order by c.NOM_FANTASIA, NUMDOC DESC'
    else
      cmd := cmd + 'and c.NOM_FANTASIA like ' + QuotedStr(valor + '%') +
        ' order by c.NOM_FANTASIA, NUMDOC DESC';
  end
  else if CBcampos.Text = 'Fornecedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and f.razao_social like ' + QuotedStr('%' + valor + '%') +
        ' order by f.razao_social, NUMDOC DESC '
    else
      cmd := cmd + 'and f.razao_social like ' + QuotedStr(valor + '%') +
        ' order by f.razao_social, NUMDOC DESC';
  end;

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('numdoc').DisplayLabel := 'Numero';
  mmLocalizar.fieldbyname('nom_cliente').DisplayLabel :=
    'Cliente - Razão Social';
  mmLocalizar.fieldbyname('nom_fantasia').DisplayLabel :=
    'Cliente - Nome Fantasia';
  mmLocalizar.fieldbyname('CNPJ').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('CPF').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';
  mmLocalizar.fieldbyname('nom_representante').DisplayLabel := 'Vendedor';
  mmLocalizar.fieldbyname('cod_cliente').Visible := false;
  { mmlocalizar.fieldbyname('cnpj').DisplayWidth:= 120;
    mmlocalizar.fieldbyname('cpf').DisplayWidth:= 120;
    mmlocalizar.fieldbyname('total').DisplayWidth:= 90;
  }
  // //DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_colecao(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, descricao from colecao ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where descricao like ' + QuotedStr('%' + valor + '%') +
        ' order by descricao'
    else
      cmd := cmd + 'where descricao like ' + QuotedStr(valor + '%') +
        ' order by descricao';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Coleção';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_uf(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select uf from UF ';

  if Trim(valor) <> '' then
  begin
    if CBcampos.Text = 'UF' then
    begin
      cmd := cmd + 'where UF = ' + QuotedStr(valor);
    end
    else if CBcampos.Text = 'Nome' then
    begin
      if zzbusca_qualquer.Checked then
        cmd := cmd + 'where UF like ' + QuotedStr('%' + valor + '%') + ' order by UF'
      else
        cmd := cmd + 'where UF like ' + QuotedStr(valor + '%') + ' order by UF';
    end;
  end;

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

end;

procedure TFr_localizar.loc_cheque_terceiros(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, nr_cheque, nr_agencia, nr_conta_corrente , nom_titular , dta_vencimento, valor from cheque_terceiros ct ';

  if CBcampos.Text <> '' then
    cmd := cmd + 'where ';

  if CBcampos.Text = 'Nº Cheque' then
  begin
    cmd := cmd + 'nr_cheque = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nº agência' then
  begin
    cmd := cmd + 'nr_agencia = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nº Conta Corrente' then
  begin
    cmd := cmd + 'nr_conta_corrente = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Titular' then
  begin
    cmd := cmd + 'nom_titular like ' + QuotedStr('%' + valor + '%');

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data Vencimento' then
  begin
    cmd := cmd + 'dta_vencimento = ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(valor)));

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Valor' then
  begin
    cmd := cmd + 'valor = ' + stringreplace(stringreplace(valor, '.', '',
      [rfReplaceAll]), ',', '.', [rfReplaceAll]);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').Visible := false;

  mmLocalizar.fieldbyname('nr_cheque').DisplayLabel := 'Nº Cheque';

  mmLocalizar.fieldbyname('nr_agencia').DisplayLabel := 'Nº Agência';

  mmLocalizar.fieldbyname('nr_conta_corrente').DisplayLabel :=
    'Nº Conta Corrente';

  mmLocalizar.fieldbyname('nom_titular').DisplayLabel := 'Titular';

  mmLocalizar.fieldbyname('dta_vencimento').DisplayLabel := 'Vencimento';

  mmLocalizar.fieldbyname('valor').DisplayLabel := 'Valor';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_cheques(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, cod_conta_corrente, nominal, nr_cheque, dta_vencimento, valor from cheques ';

  if CBcampos.Text <> '' then
    cmd := cmd + 'where ';

  if CBcampos.Text = 'Nº Cheque' then
  begin
    cmd := cmd + 'nr_cheque = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nº Conta Corrente' then
  begin
    cmd := cmd + 'cod_conta_corrente = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nominal' then
  begin
    cmd := cmd + 'nominal like ' + QuotedStr('%' + valor + '%');

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data Vencimento' then
  begin
    cmd := cmd + 'dta_vencimento = ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(valor)));

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Valor' then
  begin
    cmd := cmd + 'valor = ' + stringreplace(stringreplace(valor, '.', '',
      [rfReplaceAll]), ',', '.', [rfReplaceAll]);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').Visible := false;

  mmLocalizar.fieldbyname('nr_cheque').DisplayLabel := 'Nº Cheque';
  mmLocalizar.fieldbyname('nr_cheque').DisplayWidth := 5;

  mmLocalizar.fieldbyname('cod_conta_corrente').DisplayLabel :=
    'Nº Conta Corrente';
  mmLocalizar.fieldbyname('cod_conta_corrente').DisplayWidth := 5;

  mmLocalizar.fieldbyname('dta_vencimento').DisplayLabel := 'Vencimento';
  mmLocalizar.fieldbyname('dta_vencimento').DisplayWidth := 5;

  mmLocalizar.fieldbyname('valor').DisplayLabel := 'Valor';
  mmLocalizar.fieldbyname('valor').DisplayWidth := 5;

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.Timer1Timer(Sender: TObject);
begin
  dao.msg('12312r1');
end;

procedure TFr_localizar.loc_representante(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select r.id, r.nom_representante, c.nom_cidade, r.nom_empresa, r.cnpj, r.cpf, r.ativo from representante r '
    + 'left join cidades c on c.cod_cidade = r.id_cidade ';

  if ((chamou_form = 'fr_opc_relatorio_supervisor') or
    (chamou_form = 'fr_opc_relatorio_representante') or
    (chamou_form = 'fr_pedido_representante') or
    (chamou_form = 'fr_pedido_supervisor')) then
    cmd := cmd +
      ' where r.ativo = ''S'' and r.funcionario in (''0'', ''1'', ''4'') '
  else if chamou_form <> 'fr_representante' then
    cmd := cmd + ' where r.ativo = ''S'' '
  else if (chamou_form = 'fr_pedido_simplificado_supervisor') then
    cmd := cmd + ' where r.ativo = ''S'' and r.funcionario in (''4'') '
  else if (chamou_form = 'fr_pedido_simplificado_representante') then
    cmd := cmd + ' where r.ativo = ''S'' and r.funcionario in (''0'', ''1'') '
  else begin
    cmd := cmd + ' where 1 = 1 ';

    if ckAtivos.itemindex = 1 then
      cmd := cmd + ' and r.ativo = ''S'' ';

    if ckAtivos.itemindex = 2 then
      cmd := cmd + ' and r.ativo = ''N'' ';

    if rgTipoFunc.ItemIndex > 0 then
      cmd := cmd + ' and r.funcionario = ' + quotedstr(inttostr(rgTipoFunc.ItemIndex - 1));


  end;
  if (frpri.TipUsu = '0') then
    cmd := cmd + ' and ID = ' + frpri.Representante_id;

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'and id = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and nom_representante like ' + QuotedStr('%' + valor + '%')
      // +
      // ' Order by nom_representante '
    else
      cmd := cmd + 'and nom_representante like ' + QuotedStr(valor + '%'); // +
    // ' Order by nom_representante ';



    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Empresa' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and nom_empresa like ' + QuotedStr('%' + valor + '%') //
      // ' Order by nom_empresa '
    else
      cmd := cmd + 'and nom_empresa like ' + QuotedStr(valor + '%');
    // ' Order by nom_empresa ';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    cmd := cmd + 'and cnpj =' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CPF' then
  begin
    cmd := cmd + 'and cpf =' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;

  mmLocalizar.fieldbyname('nom_representante').DisplayLabel := 'Nome';
  mmLocalizar.fieldbyname('nom_representante').DisplayWidth := 50;

  mmLocalizar.fieldbyname('nom_empresa').DisplayLabel := 'Empresa';
  mmLocalizar.fieldbyname('nom_empresa').DisplayWidth := 20;

  mmLocalizar.fieldbyname('cnpj').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('cnpj').DisplayWidth := 18;

  mmLocalizar.fieldbyname('cpf').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('cpf').DisplayWidth := 18;

  // mmlocalizar.fieldbyname('ie').DisplayLabel:='IE';
  // mmlocalizar.fieldbyname('ie').DisplayWidth:=80;

  /// /DgLocalizar.SetFocus;


end;

procedure TFr_localizar.loc_conta_corrente(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select c.id, b.NOM_BANCO, b.NR_BANCO, c.nom_conta, c.nr_agencia, c.nr_conta, c.dta_abertura_conta from conta_corrente c left outer join banco b on b.ID = c.ID_BANCO  where 1 = 1 ';

  if chamou_form = 'fr_cc_vendas' then
    cmd := cmd + ' and c.ativo = ''S''';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + ' and c.id = ' + QuotedStr(valor) +
      ' order by b.nr_banco, c.id';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome da Conta' then
  begin
    cmd := cmd + ' and c.nom_conta like ' + QuotedStr('%' + valor + '%') +
      ' order by c.nom_conta, c.id';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Banco' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + ' and b.nom_banco like ' + QuotedStr('%' + valor + '%') +
        ' order by b.nr_banco, c.nom_conta';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Numero da Agencia' then
  begin
    cmd := cmd + ' and c.nr_agencia = ' + QuotedStr(valor) +
      ' order by b.nr_banco, c.nr_agencia';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data da abertura da conta' then
  begin
    cmd := cmd + ' and c.dta_abertura_conta = ' + QuotedStr(valor) +
      ' order by  b.nr_banco, dta_abertura_conta';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('NOM_BANCO').DisplayLabel := 'Banco';
  mmLocalizar.fieldbyname('nr_agencia').DisplayLabel := 'Numero da agencia';
  mmLocalizar.fieldbyname('nr_conta').DisplayLabel := 'Numero da CC';
  mmLocalizar.fieldbyname('dta_abertura_conta').DisplayLabel :=
    'Data da abertura da conta';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_banco(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, nom_banco, nr_banco from banco ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome do banco' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nom_banco like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_banco';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Numero do banco' then
  begin
    cmd := cmd + 'where nr_banco = ' + QuotedStr(valor) + ' order by nr_banco';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_banco').DisplayLabel := 'Nome do banco';
  mmLocalizar.fieldbyname('nr_banco').DisplayLabel := 'Numero do banco';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_etapa_producao(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, descricao from etapa_producao ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Descrição' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where descricao like ' + QuotedStr('%' + valor + '%') +
        ' order by descricao';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Nome do banco';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_motivo(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'SELECT a.ID, a.MOTIVO FROM NFE_MOTIVO_CANCEL a ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where a.id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Motivo' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where a.MOTIVO like ' + QuotedStr('%' + valor + '%') +
        ' order by a.MOTIVO';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('motivo').DisplayLabel := 'Motivo';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_categoria(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, descricao from categoria_estoque ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Descrição' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where descricao like ' + QuotedStr('%' + valor + '%') +
        ' order by descricao'
    else
      cmd := cmd + 'where descricao like ' + QuotedStr(valor + '%') +
        ' order by descricao';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Descrição';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_mes(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, mes from mes ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor) + ' order by id';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Mês' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where mes like ' + QuotedStr('%' + valor + '%') +
        ' order by mes';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('mes').DisplayLabel := 'Mês';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_prazo_pagamento(valor: string);
var
  i: Integer;
  cmd, ativo, vendedor: string;
begin
  cmd := '';
  cmd := 'select id, prazo, ativo from prazo ';

  ativo := '';
  if chamou_form = 'fr_pedido_prazo' then
    ativo := ' AND ATIVO = ''S''';

  if chamou_form = 'fr_pedido_simplificado_prazo' then
    ativo := ' AND ATIVO = ''S'' AND INATIVO_PALM = ''N''';

  vendedor := '';
  if (frpri.TipUsu = '0') or (frpri.TipUsu = '1') or frpri.representacao then
    vendedor := ' AND INATIVO_PALM = ''N''';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor) + ativo + vendedor +
      ' order by id';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;

  end
  else if CBcampos.Text = 'Descrição' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where prazo like ' + QuotedStr('%' + valor + '%') + ativo +
        vendedor + ' order by prazo'
    else
      cmd := cmd + 'where prazo like ' + QuotedStr(valor + '%') + ativo +
        vendedor + ' order by prazo';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('prazo').DisplayLabel := 'Descrição';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_unidade(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select unidade from unidade ';

  if CBcampos.Text = 'Unidade' then
  begin
    cmd := cmd + 'where unidade like ' + QuotedStr('%' + valor + '%') +
      ' order by unidade';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;
  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('unidade').DisplayLabel := 'Unidade';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_vendas_carga(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select numdoc, dtadoc, v1.cod_cliente, c.nom_cliente, c.cnpj, c.cpf, tot_liquido, cd.nom_cidade, r.nom_representante from vendas1 v1 '
    + 'left join cliente c on c.cod_cliente = v1.cod_cliente ' +
    'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
    'left join representante r on r.id = v1.cod_representante ';

  if CBcampos.Text = 'Numero' then
  begin

    cmd := cmd + 'where numdoc = ' + QuotedStr(valor) + ' and faturado=' +
      QuotedStr('0');
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CPF' then
  begin
    cmd := cmd + 'where c.cpf = ' + QuotedStr(valor) + ' and faturado=' +
      QuotedStr('0');
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CNPJ' then
  begin
    cmd := cmd + 'where c.cnpj = ' + QuotedStr(valor) + ' and faturado=' +
      QuotedStr('0');
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Cidade' then // CIDADE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where cd.nom_cidade like ' + QuotedStr('%' + valor + '%') +
        ' and faturado=' + QuotedStr('0') + ' order by cd.nom_cidade '
    else
      cmd := cmd + 'where cd.nom_cidade like ' + QuotedStr(valor + '%') +
        ' and faturado=' + QuotedStr('0') + ' order by cd.nom_cidade';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Cliente' then // CLIENTE
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where c.nom_cliente like ' + QuotedStr('%' + valor + '%') +
        ' and faturado=' + QuotedStr('0') + ' order by c.nom_cliente'
    else
      cmd := cmd + 'where c.nom_cliente like ' + QuotedStr(valor + '%') +
        ' and faturado=' + QuotedStr('0') + ' order by c.nom_cliente';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Vendedor' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where r.nom_representante like ' +
        QuotedStr('%' + valor + '%') + ' and faturado=' + QuotedStr('0') +
        ' order by r.nom_representante '
    else
      cmd := cmd + 'where r.nom_representante like ' + QuotedStr(valor + '%') +
        ' and faturado=' + QuotedStr('0') + ' order by r.nom_representante';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('numdoc').DisplayLabel := 'Numero';
  mmLocalizar.fieldbyname('nom_cliente').DisplayLabel := 'Cliente';
  mmLocalizar.fieldbyname('CNPJ').DisplayLabel := 'CNPJ';
  mmLocalizar.fieldbyname('CPF').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('nom_cidade').DisplayLabel := 'Cidade';
  mmLocalizar.fieldbyname('nom_representante').DisplayLabel := 'Vendedor';

  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_motorista(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select * from motorista ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome do motorista' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nome like ' + QuotedStr('%' + valor + '%') +
        ' order by nome';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Fone' then
  begin
    cmd := cmd + 'where fone = ' + QuotedStr(valor) + ' order by fone';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Celular' then
  begin
    cmd := cmd + 'where celular = ' + QuotedStr(valor) + ' order by celular';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'RG' then
  begin
    cmd := cmd + 'where rg = ' + QuotedStr(valor) + ' order by rg';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CPF' then
  begin
    cmd := cmd + 'where cpf = ' + QuotedStr(valor) + ' order by cpf';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;
  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nome').DisplayLabel := 'Nome do motorista';
  mmLocalizar.fieldbyname('fone').DisplayLabel := 'Placa';
  mmLocalizar.fieldbyname('celular').DisplayLabel := 'Celular';
  mmLocalizar.fieldbyname('cpf').DisplayLabel := 'CPF';
  mmLocalizar.fieldbyname('rg').DisplayLabel := 'RG';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_veiculos(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, nom_veiculo, placa, dt_aquisicao from veiculos where 1 = 1 ';

  if chamou_form = 'fr_monta_carga_veiculos' then
    cmd := cmd + 'and trim(placa) <> ''-'' ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'and id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome do veiculo' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'and nom_veiculo like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_veiculo';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Placa' then
  begin
    cmd := cmd + 'and placa = ' + QuotedStr(valor) + ' order by placa';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data de aquisição' then
  begin
    cmd := cmd + 'and dt_aquisicao = ' + QuotedStr(valor) +
      ' order by dt_aquisicao';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;
  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_veiculo').DisplayLabel := 'Nome do veiculo';
  mmLocalizar.fieldbyname('placa').DisplayLabel := 'Placa';
  mmLocalizar.fieldbyname('dt_aquisicao').DisplayLabel := 'Data de aquisição';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_cargas(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, mdfe, c1.nom_carga, dta_carga, t.nome, c1.situacao_mdfe from carga1 c1 ' +
    'left join transportadora t on t.cod_transportadora=c1.cod_transportadora ';

  if CBcampos.Text = 'Nº Carga' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nº MDFe' then
  begin
    cmd := cmd + 'where mdfe = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome da Carga' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nom_carga like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_carga'
    else
      cmd := cmd + 'where nom_carga like ' + QuotedStr(valor + '%') +
        ' order by nom_carga';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Transportadora' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where t.nome like ' + QuotedStr('%' + valor + '%') +
        ' order by t.nome '
    else
      cmd := cmd + 'where t.nome like ' + QuotedStr(valor + '%') +
        ' order by t.nome ';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data Carga' then
  begin
    cmd := cmd + 'where dta_carga = ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(valor))) +
      ' order by dta_carga';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;
  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Nº Carga';
  mmLocalizar.fieldbyname('mdfe').DisplayLabel := 'Nº MDFe';
  mmLocalizar.fieldbyname('nom_carga').DisplayLabel := 'Nome Carga';
  mmLocalizar.fieldbyname('dta_carga').DisplayLabel := 'Data Carga';
  mmLocalizar.fieldbyname('nome').DisplayLabel := 'Transportadora';
  mmLocalizar.fieldbyname('situacao_mdfe').DisplayLabel := 'Sit';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_marca(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select id, nom_marca from marcas ';

  if CBcampos.Text = 'Codigo' then
  begin
    cmd := cmd + 'where id = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Nome' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where nom_marca like ' + QuotedStr('%' + valor + '%') +
        ' order by nom_marca'
    else
      cmd := cmd + 'where nom_marca like ' + QuotedStr(valor + '%') +
        ' order by nom_marca';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('nom_marca').DisplayLabel := 'Marca';
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_compra(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select p.nr_documento, p.nr_pedido_fornecedor, p.cod_fornecedor, p.dta_pedido, f.razao_social, f.fantasia, c.descricao from pedidos1 p '
    + 'left join fornecedor f on f.cod_fornecedor=p.cod_fornecedor ' +
    'left join colecao c on c.id=p.cod_colecao ';

  // 'Número do Sistema';
  // 'Número Pedido Fornecedor';
  // 'Razão social';
  // 'Fantasia';
  // 'Data';
  // 'Coleção';

  if CBcampos.Text = 'Número do Sistema' then
  begin
    cmd := cmd + 'where p.nr_documento = ' + QuotedStr(valor);
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Número Pedido Fornecedor' then
  begin
    cmd := cmd + 'where p.nr_pedido_fornecedor = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Razão Social' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where f.razao_social like ' + QuotedStr('%' + valor + '%')
    else
      cmd := cmd + 'where f.razao_social like ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Fantasia' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where f.fantasia like ' + QuotedStr('%' + valor + '%')
    else
      cmd := cmd + 'where f.fantasia like ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data' then
  begin
    cmd := cmd + 'where dta_pedido =' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Coleção' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where c.descricao like ' + QuotedStr('%' + valor + '%')
    else
      cmd := cmd + 'where c.descricao like ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  // mmlocalizar.fieldbyname('id').Visible:=false;
  mmLocalizar.fieldbyname('cod_fornecedor').Visible := false;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Coleção';
  mmLocalizar.fieldbyname('nr_documento').DisplayLabel := 'N° do Pedido';
  mmLocalizar.fieldbyname('nr_pedido_fornecedor').DisplayLabel :=
    'N° do Pedido Fornecedor';
  mmLocalizar.fieldbyname('dta_pedido').DisplayLabel := 'Data do pedido';
  mmLocalizar.fieldbyname('fantasia').DisplayLabel := 'Fantasia';
  mmLocalizar.fieldbyname('razao_social').DisplayLabel := 'Razão social';

  // DgLocalizar.SetFocus;
end;

procedure TFr_localizar.loc_pre_pedido(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := '';
  cmd := 'select p1.id, c.descricao, data from pre_pedido1 p1 ' +
    'left join colecao c on c.id = p1.cod_colecao ';

  if (CBcampos.Text = 'Nº Pre-Pedido') and (EDlocalizar.Text <> '') then
  begin
    cmd := cmd + 'where p1.id = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Coleção' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where c.descricao like ' + QuotedStr('%' + valor + '%') +
        ' order by c.descricao'
    else
      cmd := cmd + 'where c.descricao like ' + QuotedStr(valor + '%') +
        ' order by c.descricao';

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Data' then
  begin
    cmd := cmd + 'where p1.data = ' + QuotedStr(valor);

    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if (Qu_localizar.RecordCount <= 0) or (Qu_localizar.Active = false) then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;
  // mmlocalizar.fieldbyname('cod_fornecedor').Visible:=false;
  mmLocalizar.fieldbyname('id').DisplayLabel := 'Nº Pré-Pedido';
  mmLocalizar.fieldbyname('id').DisplayWidth := 10;
  // DgLocalizar.SetFocus;

end;

procedure TFr_localizar.loc_recibo(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := 'SELECT a.ID, a.sacado, a.emitente, a.DATA, coalesce(a.VALOR,0) as valor FROM RECIBO a ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where a.ID = ' + valor + ' order by ID desc';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Sacado' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where upper(a.sacado) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by sacado, ID desc';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Emitente' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where  upper(a.emitente) like ' +
        QuotedStr('%' + UpperCase(valor) + '%') + ' order by emitente, ID desc';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;
  mmLocalizar.fieldbyname('id').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('id').DisplayWidth := 5;
  mmLocalizar.fieldbyname('sacado').DisplayLabel := 'Sacado';
  mmLocalizar.fieldbyname('emitente').DisplayLabel := 'Emitente';
  mmLocalizar.fieldbyname('data').DisplayLabel := 'Data';
  mmLocalizar.fieldbyname('valor').DisplayLabel := 'Valor';
  // DgLocalizar.SetFocus;
end;

procedure TFr_localizar.loc_ncm(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := 'select codigo, descricao, cest from ncm ';

  if CBcampos.Text = 'NCM' then
  begin
    cmd := cmd + 'where codigo like ' + QuotedStr('%' + valor + '%') +
      ' order by codigo';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Descrição' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where descricao like ' + QuotedStr('%' + valor + '%') +
        ' order by descricao';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'CEST' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where cest like ' + QuotedStr('%' + valor + '%') +
        ' order by cest';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;
  mmLocalizar.fieldbyname('codigo').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('codigo').DisplayWidth := 5;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Descrição';
  // DgLocalizar.SetFocus;
end;

procedure TFr_localizar.loc_aviso(valor: string);
var
  i: Integer;
  cmd: string;
begin
  cmd := 'SELECT a.ID, a.ASSUNTO, a.TEXTO FROM AVISO_REPRESENTANTES_AVULSO a ';

  if CBcampos.Text = 'Código' then
  begin
    cmd := cmd + 'where codigo like ' + QuotedStr('%' + valor + '%') +
      ' order by codigo';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Assunto' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where a.assunto like ' + QuotedStr('%' + valor + '%') +
        ' order by a.assunto';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end
  else if CBcampos.Text = 'Texto' then
  begin
    if zzbusca_qualquer.Checked then
      cmd := cmd + 'where a.texto like ' + QuotedStr('%' + valor + '%') +
        ' order by a.texto';
    with Qu_localizar do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin
    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;
  mmLocalizar.fieldbyname('ID').DisplayLabel := 'Código';
  mmLocalizar.fieldbyname('ID').DisplayWidth := 5;
  mmLocalizar.fieldbyname('Assunto').DisplayLabel := 'Assunto';
  // DgLocalizar.SetFocus;
end;


procedure TFr_localizar.EDlocalizarExit(Sender: TObject);
begin
  if (ActiveControl.Name <> 'CBcampos') and (ActiveControl.Name <> 'BT_cadastro')
  then
  begin

    if (CBcampos.Text = 'Codigo') or (CBcampos.Text = 'Código') or
      (CBcampos.Text = 'Valor') or (CBcampos.Text = 'Numero') or
      (CBcampos.Text = 'NFE') or (CBcampos.Text = 'NF') or
      (CBcampos.Text = 'Cliente - Código') then
      if (not FMFUN.verificaNumerico(EDlocalizar.Text)) and
        (length(trim(EDlocalizar.Text)) > 0) then
      begin
        showmessage('Dado tem que ser sempre Numérico!');
        EDlocalizar.setfocus;
      end;
    if (CBcampos.Text = 'CNPJ') then
      if EDlocalizar.Text = '  .   .   /    -  ' then
      begin
        showmessage('CNPJ tem que ser preenchido!');
        EDlocalizar.setfocus;
      end;

    if (CBcampos.Text = 'CPF') then
      if EDlocalizar.Text = '   .   .   -  ' then
      begin
        showmessage('CPF tem que ser preenchido!');
        EDlocalizar.setfocus;
      end;

    if (CBcampos.Text = 'NCM') then
      if EDlocalizar.Text = '    .  .  ' then
      begin
        showmessage('NCM tem que ser preenchido!');
        EDlocalizar.setfocus;
      end;
  end;
end;

procedure TFr_localizar.EDlocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  localizar: string;
begin
  if (EDlocalizar.Text <> '') then
  begin
    localizar := stringreplace(EDlocalizar.Text, '.', '', [rfReplaceAll]);
    localizar := stringreplace(localizar, '/', '', [rfReplaceAll]);
    localizar := stringreplace(localizar, '-', '', [rfReplaceAll]);
  end;

  if (Key = vk_back) and (trim(localizar) = '') then
    EDlocalizar.clear;
end;

procedure TFr_localizar.DgLocalizarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DrawState: Integer;
  DrawRect: TRect;
const
  IsChecked: array [boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
begin
  if (chamou_pesquisa <> 'fr_pedido') and (chamou_pesquisa <> 'fr_produto') and
    (chamou_pesquisa <> 'fr_fop') and (chamou_pesquisa <> 'fr_prazo') then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      DgLocalizar.Canvas.Font.Color := clWhite;
      DgLocalizar.Canvas.Brush.Color := clBlue;
    end
    else if odd(Qu_localizar.RecNo) then
    begin
      DgLocalizar.Canvas.Font.Color := clBlack;
      DgLocalizar.Canvas.Brush.Color := $CCFFFF;
    end
    else
    begin
      DgLocalizar.Canvas.Font.Color := clBlack;
      DgLocalizar.Canvas.Brush.Color := clWhite;
    end;
    DgLocalizar.Canvas.FillRect(Rect);
    DgLocalizar.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.AsString);
  end;

  if chamou_pesquisa = 'fr_fop' then
  begin
    if Column.Field = mmLocalizar.fieldbyname('ativo') then
    begin
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      DgLocalizar.Canvas.Brush.Color := clWhite;
      mmLocalizar.fieldbyname('ativo').DisplayLabel := 'Ativo';
      mmLocalizar.fieldbyname('ativo').DisplayWidth := 4;
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 4);
        DgLocalizar.Hint := 'Ativado';
      end
      else
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 2);
        DgLocalizar.Hint := 'Desativado';
      end;
    end
    else
    begin
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        DgLocalizar.Canvas.Font.Color := clBlack;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clBlack;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end
      else
      begin
        DgLocalizar.Canvas.Font.Color := clGray;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clGray;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;
      DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol]
        .Field, State);
    end;
  end;

  if chamou_pesquisa = 'fr_representante' then
  begin
    if Column.Field = mmLocalizar.fieldbyname('ativo') then
    begin
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      DgLocalizar.Canvas.Brush.Color := clWhite;
      mmLocalizar.fieldbyname('ativo').DisplayLabel := 'Ativo';
      mmLocalizar.fieldbyname('ativo').DisplayWidth := 4;
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 4);
        DgLocalizar.Hint := 'Ativado';
      end
      else
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 2);
        DgLocalizar.Hint := 'Desativado';
      end;
    end
    else
    begin
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        DgLocalizar.Canvas.Font.Color := clBlack;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clBlack;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end
      else
      begin
        DgLocalizar.Canvas.Font.Color := clGray;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clGray;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;
      DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol]
        .Field, State);
    end;
  end
  else if chamou_pesquisa = 'fr_prazo' then
  begin
    if Column.Field = mmLocalizar.fieldbyname('ativo') then
    begin
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      DgLocalizar.Canvas.Brush.Color := clWhite;
      mmLocalizar.fieldbyname('ativo').DisplayLabel := 'Ativo';
      mmLocalizar.fieldbyname('ativo').DisplayWidth := 4;
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 4);
        DgLocalizar.Hint := 'Ativado';
      end
      else
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 2);
        DgLocalizar.Hint := 'Desativado';
      end;
    end
    else
    begin
      if mmLocalizar.fieldbyname('ativo').AsString = 'S' then
      begin
        DgLocalizar.Canvas.Font.Color := clBlack;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clBlack;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end
      else
      begin
        DgLocalizar.Canvas.Font.Color := clGray;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clGray;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;
      DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol]
        .Field, State);
    end;
  end;

  if chamou_pesquisa = 'fr_produto' then
                                         begin
    if mmLocalizar.fieldbyname('promocao').AsString = 'Sim' then
    begin
      DgLocalizar.Canvas.Font.Style := [fsBold];
      DgLocalizar.Canvas.Font.Color := clPurple;
      DgLocalizar.Canvas.Brush.Color := clWhite;

      if gdSelected in State then
      begin
        DgLocalizar.Canvas.Font.Color := clWhite;
        DgLocalizar.Canvas.Brush.Color := clPurple;
      end;
      DgLocalizar.Canvas.FillRect(Rect);
    end
    else if mmLocalizar.fieldbyname('ativo').AsString = 'Sim' then
    begin
      DgLocalizar.Canvas.Font.Color := clBlack;
      DgLocalizar.Canvas.Brush.Color := clWhite;

      if gdSelected in State then
      begin
        DgLocalizar.Canvas.Font.Color := clWhite;
        DgLocalizar.Canvas.Brush.Color := clBlack;
      end;
      DgLocalizar.Canvas.FillRect(Rect);
    end
    else
    begin
      DgLocalizar.Canvas.Font.Color := clGray;
      DgLocalizar.Canvas.Brush.Color := clWhite;

      if gdSelected in State then
      begin
        DgLocalizar.Canvas.Font.Color := clWhite;
        DgLocalizar.Canvas.Brush.Color := clGray;
      end;
      DgLocalizar.Canvas.FillRect(Rect);
    end;

    DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol]
      .Field, State);

    if Column.Field = mmLocalizar.fieldbyname('ativo') then
    begin
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      DgLocalizar.Canvas.Brush.Color := clWhite;
      mmLocalizar.fieldbyname('promocao').DisplayLabel := 'Promoção';
      mmLocalizar.fieldbyname('ativo').DisplayLabel := 'Ativo';
      mmLocalizar.fieldbyname('ativo').DisplayWidth := 4;
      if mmLocalizar.fieldbyname('ativo').AsString = 'Sim' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 5);
        DgLocalizar.Hint := 'Ativado';
      end
      else
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 4, Rect.Top + 1, 2);
        DgLocalizar.Hint := 'Desativado';
      end;
    end;
  end;

  if chamou_pesquisa = 'fr_carga' then
  begin
    if Column.Field = mmLocalizar.fieldbyname('situacao_mdfe') then
    begin
      DgLocalizar.Canvas.Brush.Color := clWhite;
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      mmLocalizar.fieldbyname('situacao_mdfe').DisplayLabel := 'Sit';
      mmLocalizar.fieldbyname('situacao_mdfe').DisplayWidth := 3;

      case mmLocalizar.fieldbyname('situacao_mdfe').AsInteger of
        0:
          begin
            ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
            DgLocalizar.Hint := 'Aberto';
          end;
        1:
          begin
            ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 3);
            DgLocalizar.Hint := 'MDF-e Autorizada';
          end;
        2:
          begin
            ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 2);
            DgLocalizar.Hint := 'MDF-e Cancelada';
          end;
        3:
          begin
            ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 1);
            DgLocalizar.Hint := 'MDF-e Encerrada';
          end;

      end;
    end
    else begin
      case mmLocalizar.fieldbyname('situacao_mdfe').AsInteger of
        0:
          begin
            DgLocalizar.Canvas.Font.Color := clTeal;
            DgLocalizar.Canvas.Brush.Color := clWhite;

            if gdSelected in State then
            begin
              DgLocalizar.Canvas.Font.Color := clWhite;
              DgLocalizar.Canvas.Brush.Color := clTeal;
            end;
            DgLocalizar.Canvas.FillRect(Rect);
          end;
        1:
          begin
            DgLocalizar.Canvas.Font.Color := clFuchsia;
            DgLocalizar.Canvas.Brush.Color := clWhite;

            if gdSelected in State then
            begin
              DgLocalizar.Canvas.Font.Color := clWhite;
              DgLocalizar.Canvas.Brush.Color := clFuchsia;
            end;
            DgLocalizar.Canvas.FillRect(Rect);
          end;
        2:
          begin
            DgLocalizar.Canvas.Font.Color := clGray;
            DgLocalizar.Canvas.Brush.Color := clWhite;

            if gdSelected in State then
            begin
              DgLocalizar.Canvas.Font.Color := clWhite;
              DgLocalizar.Canvas.Brush.Color := clGray;
            end;
            DgLocalizar.Canvas.FillRect(Rect);
          end;
        3:
          begin
            DgLocalizar.Canvas.Font.Color := clNavy;
            DgLocalizar.Canvas.Brush.Color := clWhite;

            if gdSelected in State then
            begin
              DgLocalizar.Canvas.Font.Color := clWhite;
              DgLocalizar.Canvas.Brush.Color := clNavy;
            end;
            DgLocalizar.Canvas.FillRect(Rect);
          end;
      end;
      DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol].Field, State);
    end;
  end;


  if chamou_pesquisa = 'fr_pedido' then
  begin
    if Column.Field = mmLocalizar.fieldbyname('Status') then
    begin
      DgLocalizar.Canvas.Brush.Color := clWhite;
      DgLocalizar.Canvas.FillRect(Rect);
      DgLocalizar.showhint := true;
      mmLocalizar.fieldbyname('Status').DisplayLabel := 'Sit';
      mmLocalizar.fieldbyname('Status').DisplayWidth := 3;

      if mmLocalizar.fieldbyname('Status').AsString = 'ABERTO' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
        DgLocalizar.Hint := 'Aberto';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'ORÇAMENTO' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 8);
        DgLocalizar.Hint := 'Orçamento';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'FATURADO' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 1);
        DgLocalizar.Hint := 'Faturado';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'FATURADO-DEVOLUÇÃO' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 7);
        DgLocalizar.Hint := 'Faturado-Devolução';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'CANCELADA' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 2);
        DgLocalizar.Hint := 'Cancelada';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'DEVOLUÇÃO/REMESSA' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 3);
        DgLocalizar.Hint := 'Devolução/Remessa';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'DESATIVADO' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 4);
        DgLocalizar.Hint := 'Desativado';
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'NFE DENEGADA' then
      begin
        ImageList1.Draw(DgLocalizar.Canvas, Rect.Left + 2, Rect.Top + 1, 6);
        DgLocalizar.Hint := 'NFe Denegada';
      end;
    end
    else
    begin
      if mmLocalizar.fieldbyname('Status').AsString = 'ABERTO' then
      begin
        DgLocalizar.Canvas.Font.Color := clTeal;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clTeal;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'NFE DENEGADA' then
      begin
        DgLocalizar.Canvas.Font.Color := clRed;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clRed;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'ORÇAMENTO' then
      begin
        DgLocalizar.Canvas.Font.Color := clFuchsia;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clFuchsia;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'FATURADO' then
      begin
        DgLocalizar.Canvas.Font.Color := clNavy;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clNavy;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'FATURADO-DEVOLUÇÃO' then
      begin
        DgLocalizar.Canvas.Font.Color := clBackground;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clBackground;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      if mmLocalizar.fieldbyname('Status').AsString = 'CANCELADA' then
      begin
        DgLocalizar.Canvas.Font.Color := clGray;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clGray;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;
      if mmLocalizar.fieldbyname('Status').AsString = 'DEVOLUÇÃO/REMESSA' then
      begin
        DgLocalizar.Canvas.Font.Color := clMaroon;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clMaroon;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;
      if mmLocalizar.fieldbyname('Status').AsString = 'DESATIVADO' then
      begin
        DgLocalizar.Canvas.Font.Color := clOlive;
        DgLocalizar.Canvas.Brush.Color := clWhite;

        if gdSelected in State then
        begin
          DgLocalizar.Canvas.Font.Color := clWhite;
          DgLocalizar.Canvas.Brush.Color := clOlive;
        end;
        DgLocalizar.Canvas.FillRect(Rect);
      end;

      DgLocalizar.DefaultDrawDataCell(Rect, DgLocalizar.columns[DataCol]
        .Field, State);
    end;
  end;

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      ckAgrupar.Left := Rect.Left + DgLocalizar.Left + 2;
      ckAgrupar.Top := Rect.Top + DgLocalizar.Top + 2;
      ckAgrupar.Width := Rect.Right - Rect.Left;
      ckAgrupar.Height := Rect.Bottom - Rect.Top;

      ckAgrupar.Visible := true;
    end
  end
  else
  begin

    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      DgLocalizar.Canvas.FillRect(Rect);
      DrawFrameControl(DgLocalizar.Canvas.handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;

end;

procedure TFr_localizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Qu_localizar.close;
end;

procedure TFr_localizar.Qu_localizarAfterOpen(DataSet: TDataSet);
var
  x, tam, ant: Integer;
begin
  if Qu_localizar.IsEmpty then
  begin
    ds_localizar.DataSet := dsnone.DataSet;
    exit;
  end;
  { else
    ds_localizar.DataSet := Qu_localizar;
  }
  Qu_localizar.DisableControls;

  mmLocalizar.FieldDefs.clear;

  for x := 0 to Qu_localizar.fieldcount - 1 do
  begin
    if Qu_localizar.Fields[x].DataType = ftstring then
      mmLocalizar.FieldDefs.add(Qu_localizar.Fields[x].FieldName,
        Qu_localizar.Fields[x].DataType, Qu_localizar.Fields[x].DataSize)
    else if (Qu_localizar.Fields[x].DataType = ftBCD) or
            (Qu_localizar.Fields[x].DataType = ftFloat) or
            (Qu_localizar.Fields[x].DataType = ftFMTBcd)
    then
      mmLocalizar.FieldDefs.add(Qu_localizar.Fields[x].FieldName, ftFloat)
    else
      mmLocalizar.FieldDefs.add(Qu_localizar.Fields[x].FieldName,
        Qu_localizar.Fields[x].DataType);
  end;

  mmLocalizar.FieldDefs.add('check', ftBoolean);

  for x := 0 to Qu_localizar.fieldcount - 1 do
  begin
    Qu_localizar.First;

    while not Qu_localizar.Eof do
    begin

      if tam < length((Qu_localizar.Fields[x].AsString)) then
      begin
        tam := length((Qu_localizar.Fields[x].AsString));
        Qu_localizar.Fields[x].DisplayWidth := tam;
      end;
      Qu_localizar.Next;
    end;

  end;

  mmLocalizar.close;
  mmLocalizar.EmptyTable;
  mmLocalizar.open;
  Qu_localizar.First;

  while not Qu_localizar.Eof do
  begin
    mmLocalizar.Append;

    for x := 0 to Qu_localizar.fieldcount - 1 do
    begin
      mmLocalizar.Fields[x].DisplayLabel := Qu_localizar.Fields[x].DisplayLabel;

      if (mmLocalizar.Fields[x].DataType = ftFloat) or (mmLocalizar.Fields[x].DataType = ftFMTBcd) then
      begin
        TNumericField(mmLocalizar.Fields[x]).DisplayFormat := '#,###,##0.00';
        mmLocalizar.Fields[x].value := Qu_localizar.Fields[x].value;
      end
      else if (mmLocalizar.Fields[x].DataType = ftString) or (mmLocalizar.Fields[x].DataType = ftString) then
        mmLocalizar.Fields[x].AsString := Qu_localizar.Fields[x].AsString
      else
        mmLocalizar.Fields[x].AsVariant := Qu_localizar.Fields[x].AsVariant;
    end;

    mmLocalizar.post;
    Qu_localizar.Next;
  end;

  Qu_localizar.First;
  mmLocalizar.First;

  for x := 0 to mmLocalizar.fieldcount - 1 do
  begin

    if ant <> x then
    begin
      ant := x;
      tam := 0;
    end;
    mmLocalizar.First;
    mmLocalizar.Fields[x].DisplayWidth := 1;
    while not mmLocalizar.Eof do
    begin
      tam := length(trim(mmLocalizar.Fields[x].AsString));
      if mmLocalizar.Fields[x].DisplayWidth < tam then
        mmLocalizar.Fields[x].DisplayWidth := tam;

      // mmLocalizar.fields[x].DisplayWidth := 10;
      mmLocalizar.Next;
    end;

  end;

  mmLocalizar.First;
  mmLocalizar.fieldbyname('check').DisplayLabel := ' ';
  Qu_localizar.EnableControls;
  if ds_localizar.DataSet = nil then
    ds_localizar.DataSet := mmLocalizar;

end;

procedure TFr_localizar.DgLocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    DgLocalizarDblClick(self);
end;

procedure TFr_localizar.loc_entrada_producao(valor: string);
var
  i: Integer;
  cmd1, cmd, cmd_aux, representante_cmd, cmd_cidades, cmd_cliente,
    cmd_fornecedor, cmd_representante: string;
begin
  cmd := '';

  cmd := 'select ' + '  EP.CODIGO, ' + '  EP.DT_EMISSAO, ' +
    '  EP.LOCAL, ' + '  CE.DESCRICAO ' + 'from ENTRADA_PRODUCAO EP ' +
    'LEFT OUTER JOIN CATEGORIA_ESTOQUE CE ON CE.ID = EP.LOCAL';

  if CBcampos.Text = 'Nº Documento' then
    cmd_aux := cmd_aux + ' where ep.codigo = ' + QuotedStr(valor)
  else if CBcampos.Text = 'Local' then
    cmd_aux := cmd_aux + ' where ce.descricao like ''%' + valor + '%'''
  else if CBcampos.Text = 'Emissão' then
    cmd_aux := cmd_aux + ' where ep.dt_emissao = ' + QuotedStr(valor);

  with Qu_localizar do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd_aux + ' limit 100 ');
    // sql.SaveToFile('teste.sql');
    open;
  end;

  if Qu_localizar.RecordCount <= 0 then
  begin

    MessageBox(handle, 'Não Foi Encontrado Registro com Este Dado!', 'ORBI',
      MB_ICONWARNING);
    exit;
  end;

  mmLocalizar.fieldbyname('codigo').DisplayLabel := 'Nº Dcto.';
  mmLocalizar.fieldbyname('codigo').DisplayWidth := 5;
  mmLocalizar.fieldbyname('codigo').Alignment := taCenter;
  mmLocalizar.fieldbyname('dt_emissao').DisplayLabel := 'Emissão';
  mmLocalizar.fieldbyname('dt_emissao').DisplayWidth := 5;
  mmLocalizar.fieldbyname('dt_emissao').Alignment := taCenter;
  mmLocalizar.fieldbyname('descricao').DisplayLabel := 'Local';
  mmLocalizar.fieldbyname('descricao').DisplayWidth := 100;

end;

end.








