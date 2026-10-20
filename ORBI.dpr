program ORBI;

uses
  uCEFApplication,
  Vcl.Forms,
  windows,
  dialogs,
  exceptlog,
  UnFun in 'UnFun.pas' {FMFUN},
  UnUsu in 'UnUsu.pas' {FRUSU},
  SendMailOptions in 'SendMailOptions.pas' {FormSendMailOptions},
  SendMail in 'SendMail.pas',
  UnLog in 'UnLog.pas' {FRLOG},
  UnSenha_especial in 'UnSenha_especial.pas' {Fr_senha_especial},
  Un_rel_fluxo_caixa in 'Un_rel_fluxo_caixa.pas' {RLfluxo_caixa},
  Un_inf_deposito in 'Un_inf_deposito.pas' {fr_inf_deposito},
  Un_Cotacao in 'Un_Cotacao.pas' {Fr_Cotacao},
  Un_Cliente in 'Un_Cliente.pas' {Fr_Cliente},
  Un_Transportadora in 'Un_Transportadora.pas' {Fr_Transportadora},
  Un_Fornecedor in 'Un_Fornecedor.pas' {Fr_fornecedor},
  Un_dao in 'Un_dao.pas' {dao},
  Un_cidade in 'Un_cidade.pas' {Fr_cidades},
  Un_localizar in 'Un_localizar.pas' {Fr_localizar},
  Un_configuracao in 'Un_configuracao.pas' {Fr_configuracao},
  Un_produto in 'Un_produto.pas' {Fr_produtos},
  Un_grupo in 'Un_grupo.pas' {Fr_grupo},
  Un_entrada in 'Un_entrada.pas' {Fr_entrada},
  Un_Cadempresa in 'Un_Cadempresa.pas' {Fr_Empresa},
  Un_amplia_foto in 'Un_amplia_foto.pas' {Fr_amplia_foto},
  Un_imp_codbarras in 'Un_imp_codbarras.pas' {Fr_eti_codbarras},
  Un_dm in 'Un_dm.pas' {Dm: TDataModule},
  Un_cor in 'Un_cor.pas' {Fr_cor},
  Un_tamanho in 'Un_tamanho.pas' {Fr_tamanho},
  Un_colecao in 'Un_colecao.pas' {Fr_colecao},
  Unacerto_estoque in 'Unacerto_estoque.pas' {fr_acerto_estoque},
  Un_opc_etiqueta in 'Un_opc_etiqueta.pas' {Fr_opc_etiqueta},
  Un_opc_relatorios in 'Un_opc_relatorios.pas' {Fr_opc_relatorios},
  Un_rel_cliente in 'Un_rel_cliente.pas' {Fr_rel_cliente},
  Un_rel_etiqueta_cliente in 'Un_rel_etiqueta_cliente.pas' {Rl_etiqueta_cliente},
  Un_contas_pagar in 'Un_contas_pagar.pas' {Fr_contas_pagar},
  Un_dados_fornecedor in 'Un_dados_fornecedor.pas' {Fr_dados_fornecedor},
  Un_contas_receber in 'Un_contas_receber.pas' {Fr_contas_receber},
  Un_dados_cliente in 'Un_dados_cliente.pas' {Fr_dados_cliente},
  Un_cheque_terceiros in 'Un_cheque_terceiros.pas' {Fr_cheque_terceiros},
  Un_cheques in 'Un_cheques.pas' {Fr_Emissao_cheques},
  Un_opc_relatorio_financeiro in 'Un_opc_relatorio_financeiro.pas' {Fr_opc_relatorio_financeiro},
  Unopc_rel_cheques in 'Unopc_rel_cheques.pas' {Fr_opc_rel_cheques},
  Un_representante in 'Un_representante.pas' {Fr_representante},
  Un_cfop in 'Un_cfop.pas' {Fr_CFOP},
  Un_tabela_unidade in 'Un_tabela_unidade.pas' {Fr_tabela_unidade},
  Un_ncm in 'Un_ncm.pas' {fr_ncm},
  Un_conta_corrente in 'Un_conta_corrente.pas' {Fr_conta_corrente},
  Un_categoria_estoque in 'Un_categoria_estoque.pas' {Fr_categoria_estoque},
  Un_prazo_pagamento in 'Un_prazo_pagamento.pas' {Fr_prazo_pagamento},
  Un_convercao in 'Un_convercao.pas' {Fr_convercao},
  Un_parametro_credito in 'Un_parametro_credito.pas' {Fr_parametro_credito},
  Un_montagem_carga in 'Un_montagem_carga.pas' {Fr_montagem_carga},
  Un_veiculos in 'Un_veiculos.pas' {fr_veiculo},
  Un_motorista in 'Un_motorista.pas' {Fr_motorista},
  Un_fechamento_carga in 'Un_fechamento_carga.pas' {Fr_fechamento_carga},
  Un_sel_plano_contas in 'Un_sel_plano_contas.pas' {Fr_sel_plano_contas},
  Un_manda_email in 'Un_manda_email.pas' {frform1},
  Un_imp_pedidos_lote in 'Un_imp_pedidos_lote.pas' {Fr_imp_pedidos_lote},
  Un_marcas in 'Un_marcas.pas' {Fr_marcas},
  Un_importacao_dados in 'Un_importacao_dados.pas' {Frimportacao_dados},
  Un_status_financeiro_cliente in 'Un_status_financeiro_cliente.pas' {Fr_status_financeiro_cliente},
  Un_Controle_Fretes in 'Un_Controle_Fretes.pas' {Fr_controle_fretes},
  Un_relatorio_cliente_vendedor in 'Un_relatorio_cliente_vendedor.pas' {Fr_relatorio_cliente_vendedor},
  Un_pesquisa_produto_vendas in 'Un_pesquisa_produto_vendas.pas' {Fr_pesquisa_produto_venda},
  un_rl_etiqueta_empresa in 'un_rl_etiqueta_empresa.pas' {fr_etiqueta_empresa},
  nfe_v200 in 'nfe_v200.pas',
  Un_banco in 'Un_banco.pas' {fr_banco},
  un_email_envio in 'un_email_envio.pas' {Fr_email_envio},
  Un_nfe_envio_lote in 'Un_nfe_envio_lote.pas' {fm_nfe_envio_lote},
  un_nfe_transmissao in 'un_nfe_transmissao.pas' {Fr_nfe_transmissao},
  un_alterar_senha in 'un_alterar_senha.pas' {fm_alterar_senha},
  Un_nfe_danfe in 'Un_nfe_danfe.pas' {fm_nfe_danfe},
  un_definir_saldo_inicial in 'un_definir_saldo_inicial.pas' {fm_definir_saldo_inicial},
  Un_plano_contas in 'Un_plano_contas.pas' {fr_plano_contas},
  Un_plano_conta_cad in 'Un_plano_conta_cad.pas' {fr_plano_conta_cad},
  un_conta_descontada in 'un_conta_descontada.pas' {Form1},
  un_conta_atrasada in 'un_conta_atrasada.pas' {fm_conta_atrasada},
  Un_nfe_arquivos in 'Un_nfe_arquivos.pas' {fm_nfe_arquivos},
  Un_status_emissor in 'Un_status_emissor.pas' {Fr_status_emissor},
  Un_vendas_industria2 in 'Un_vendas_industria2.pas' {Fr_vendas_industria2},
  un_motivo in 'un_motivo.pas' {FmMotivo},
  Un_categoria in 'Un_categoria.pas' {Fr_categoria},
  un_infoatu in 'un_infoatu.pas' {fmInfoAtu},
  Un_recibo in 'Un_recibo.pas' {Fr_recibo},
  un_palm_conexao in 'un_palm_conexao.pas' {FrPalmConexao},
  un_nfe_complementar in 'un_nfe_complementar.pas' {fr_nfe_complementar},
  Un_mala_direta in 'Un_mala_direta.pas' {FmMalaDireta},
  un_transf_valores in 'un_transf_valores.pas' {Fm_Transf_Valores},
  un_subcategoria in 'un_subcategoria.pas' {Fr_subcategoria},
  Un_produto_fornecedor in 'Un_produto_fornecedor.pas' {fm_produto_fornecedor},
  Un_frete_combinado in 'Un_frete_combinado.pas' {fr_frete_combinado},
  Un_etiquetas_produtos in 'Un_etiquetas_produtos.pas' {FmEtiquetasProdutos},
  un_olap_plano_conta in 'un_olap_plano_conta.pas' {fr_olap_plano_conta},
  un_olap_vendas in 'un_olap_vendas.pas' {fr_olap_vendas},
  Un_calcular_salarios in 'Un_calcular_salarios.pas' {FmCalcularSalario},
  Un_plano_contas_consulta in 'Un_plano_contas_consulta.pas' {fr_plano_contas_consulta},
  un_grade_comissao in 'un_grade_comissao.pas' {frm_grade_comissao},
  Un_ordem_compra in 'Un_ordem_compra.pas' {FmOrdemCompra},
  Un_calculo_plr_consulta in 'Un_calculo_plr_consulta.pas' {fr_calculo_plr_consulta},
  un_mais_precos in 'un_mais_precos.pas' {fm_mais_precos},
  Un_splash in 'Un_splash.pas' {fm_splash},
  un_ler_retorno in 'un_ler_retorno.pas' {fmLerRetornoCobranca},
  sms in 'sms.pas',
  un_aviso_representantes in 'un_aviso_representantes.pas' {fm_aviso_representantes},
  Un_aviso_representantes_avulso in 'Un_aviso_representantes_avulso.pas' {Fr_Aviso_Representantes_Avulso},
  un_altera_layout in 'un_altera_layout.pas' {fmAlterarLayout},
  Un_speedio_api in 'Un_speedio_api.pas',
  serverWebService in 'serverWebService.pas',
  un_remessa_boleto in 'un_remessa_boleto.pas' {frm_remessa_boleto},
  Un_motivo_nfe_cancel in 'Un_motivo_nfe_cancel.pas' {Fr_motivo_nfe_cancel},
  un_aviso_diretoria in 'un_aviso_diretoria.pas' {FrAvisosDiretoria},
  Un_forma_pagamento in 'Un_forma_pagamento.pas' {Fr_forma_pagamento},
  Un_nfe in 'Un_nfe.pas',
  Un_produto_nao_revenda in 'Un_produto_nao_revenda.pas' {Fr_produto_nao_revenda},
  un_ultimas_vendas in 'un_ultimas_vendas.pas' {fr_ultimas_vendas},
  un_impostos in 'un_impostos.pas' {FrImpostos},
  un_produto_detalhes in 'un_produto_detalhes.pas' {fr_produtos_detalhes},
  un_conexao_vendor in 'un_conexao_vendor.pas',
  un_escolhe_impressora_termica in 'un_escolhe_impressora_termica.pas' {fr_escolhe_impressora_termica},
  un_frente_caixa in 'un_frente_caixa.pas',
  Un_calcular_13o_salarios in 'Un_calcular_13o_salarios.pas' {FmCalcular13Salario},
  un_vendor_enviar_pedidos in 'un_vendor_enviar_pedidos.pas' {fm_vendor_enviar_pedidos},
  un_produto_simplificado in 'un_produto_simplificado.pas' {frm_produtos_simplificado},
  un_selec_uf in 'un_selec_uf.pas' {fm_selec_uf},
  un_produto_variacao in 'un_produto_variacao.pas' {fm_produto_variacao},
  un_pre_cadastro in 'un_pre_cadastro.pas' {fr_pre_cadastro},
  Un_produto_fornecedor_unidade in 'Un_produto_fornecedor_unidade.pas' {Fr_produto_fornecedor_unidade},
  AtualizaBD in 'AtualizaBD.pas',
  CnpjDll in 'CnpjDll.pas',
  conta_atrasada in 'conta_atrasada.pas' {Form2},
  DVs in 'DVs.pas',
  MidasLib,
  frmMontaXML in 'frmMontaXML.pas',
  un_controle_visitas in 'un_controle_visitas.pas' {fr_controle_visitas},
  Un_representantes_clientes in 'Un_representantes_clientes.pas' {Fr_representantes_clientes},
  un_email_nfe in 'un_email_nfe.pas' {frm_nfe_email},
  UnPri in 'UnPri.pas' {FRPRI},
  un_historico_processo_pedido in 'un_historico_processo_pedido.pas' {frm_historico_processo_pedido},
  un_entrada_producao in 'un_entrada_producao.pas' {frm_entrada_producao},
  alterar_status_ordem_producao in 'alterar_status_ordem_producao.pas' {frm_alterar_status_ordem_producao},
  un_controle_status_pedido in 'un_controle_status_pedido.pas' {frm_controle_status_pedido},
  Un_etapas_producao in 'Un_etapas_producao.pas' {fr_etapas_producao},
  un_estrutura_produto in 'un_estrutura_produto.pas' {frm_estrutura_produto},
  Un_telas in 'Un_telas.pas' {Fr_telas},
  alterar_status_pedido in 'alterar_status_pedido.pas' {frm_alterar_status_pedido},
  un_alterar_preco in 'un_alterar_preco.pas' {FmAlterarPreco},
  un_etiquetas_multiplos_produtos in 'un_etiquetas_multiplos_produtos.pas',
  un_pedido_simplificado in 'un_pedido_simplificado.pas' {Fr_pedido_simplificado},
  Un_PDV in 'PDV\Un_PDV.pas' {Fr_PDV},
  un_nfce_simplificado in 'un_nfce_simplificado.pas' {Fr_nfce_simplificado},
  Un_BB_Cobrancas in 'Un_BB_Cobrancas.pas',
  Un_BB_Cobrancas_Api in 'Un_BB_Cobrancas_Api.pas',
  Un_Error_Logger in 'Un_Error_Logger.pas',
  Un_CEF_Cobrancas_Api in 'Un_CEF_Cobrancas_Api.pas';

//UnPro in 'UnPro.pas' {FRPRO};

{$R *.res}

function RtlGetVersion(var lpVersionInformation: TOSVersionInfoEx): Longint; stdcall; external 'ntdll.dll';

function WindowsSuportaChromium: Boolean;
var
  Info: TOSVersionInfoEx;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.dwOSVersionInfoSize := SizeOf(Info);
  Result := (RtlGetVersion(Info) = 0) and (Info.dwMajorVersion >= 10);
end;
var
  handle: THandle;
  titulo: string;

begin

{  if WindowsSuportaChromium then
  begin
    GlobalCEFApp := TCefApplication.Create;
    if not GlobalCEFApp.StartMainProcess then
    begin
      GlobalCEFApp.Free;
      Halt(0);
    end;
  end
  else
    GlobalCEFApp := nil;  }


  {  handle:= FindWindow('tfrlog', nil);
    if handle <> 0 then
    begin
       showmessage('Atenção Sistema já Rodando no Computador!!!');
       Application.Terminate;
     end;}
  InstalarLoggerErros('ORBI');
  fm_splash := Tfm_splash.Create(Application);
  fm_splash.Show; //Inicializa o Splash
  fm_splash.ggProgress.Progress := 10;
  fm_splash.lbStatus.Caption := 'Carregando...';
  fm_splash.Refresh;
  sleep(100);

  fm_splash.ggProgress.Progress := 20;
  fm_splash.lbStatus.Caption := 'Carregando...';
  fm_splash.Refresh;
  sleep(100);
  Application.CreateForm(TFRPRI, FRPRI);
  FRPRI.DesabilitaTimers;

  Application.CreateForm(Tdao, dao);

  fm_splash.ggProgress.Progress := 30;
  fm_splash.lbStatus.Caption := 'Carregando...';
  fm_splash.Refresh;
  Application.CreateForm(Tdm, dm);
  sleep(100);

  fm_splash.ggProgress.Progress := 40;
  fm_splash.lbStatus.Caption := 'Abrindo a Tela de Login...';
  fm_splash.Refresh;
  sleep(100);

  Application.Initialize;
  Application.Title := 'ORBI';
  Application.CreateForm(TFRLOG, FRLOG);
  fm_splash.close;
  FRLOG.ShowModal;

  Application.Run;
   {
  if GlobalCEFApp <> nil then
    GlobalCEFApp.Free;
   }
end.
