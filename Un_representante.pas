unit Un_representante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, Buttons,
   Grids, BaseGrid, AdvGrid, xmldom, XMLIntf, msxmldom, XMLDoc,
  IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, sPageControl, sPanel,
  sBitBtn, IdFTP, IdFTPCommon,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sEdit, sToolEdit, sComboEdit, DBGrids, acDBGrid, DB,
  RxMemDS, VclTee.Series, VclTee.TeEngine, VclTee.TeeProcs, VclTee.Chart,
  VclTee.DbChart, sRadioButton,
  frxClass, frxExportPDF, frxDBSet, frxChart, ACBrBase,
  ACBrSocket, ACBrCEP, sDBText, DBCtrls, sDBEdit, sSpeedButton, ShellApi,
  ToolWin, sToolBar, ImgList,  VclTee.TeeGDIPlus, Xml.adomxmldom,
  frxExportBaseDialog, RxToolEdit, RxDBCtrl, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_representante = class(TForm)
    GroupBox1: TsGroupBox;
    pcrep: TsPageControl;
    Panel1: tsPanel;
    tab_dados: TsTabSheet;
    Label1: tsLabel;
    Prid: TsEdit;
    Label4: tsLabel;
    Prnom_empresa: TsEdit;
    Prendereco: TsEdit;
    Label5: tsLabel;
    Prbairro: TsEdit;
    Label6: tsLabel;
    Label7: tsLabel;
    Prcep: TMaskEdit;
    Label13: tsLabel;
    Prcnpj: TMaskEdit;
    Prfone: TMaskEdit;
    Label14: tsLabel;
    Label15: tsLabel;
    PrWhatsApp: TMaskEdit;
    Label16: tsLabel;
    Prcelular: TMaskEdit;
    Label17: tsLabel;
    Prie: TMaskEdit;
    Prcpf: TMaskEdit;
    Prrg: TMaskEdit;
    Label18: tsLabel;
    Label19: tsLabel;
    grDadosBancarios: TsGroupBox;
    Label20: tsLabel;
    Prnr_conta_corrente: TsEdit;
    Label21: tsLabel;
    Prnr_agencia: TsEdit;
    Prnr_banco: TsComboEdit;
    Lb_banco: tsLabel;
    Banco: tsLabel;
    Label24: tsLabel;
    Premail: TsEdit;
    Label25: tsLabel;
    Prhome_page: TsEdit;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    q_representante: TFDQuery;
    q_comissao: TFDQuery;
    Prnom_representante: TsEdit;
    Label2: tsLabel;
    BitBtn1: TsBitBtn;
    Prid_cidade: TsComboEdit;
    Label3: tsLabel;
    LbNom_cidade: tsLabel;
    grDadosSite: TsGroupBox;
    Label9: tsLabel;
    PrWeb_Nome: TsEdit;
    PrWEB_CIDADES_ATUACAO: TsEdit;
    Label10: tsLabel;
    PrUF_ATUACAO: TsEdit;
    Label11: tsLabel;
    XMLGeral: TXMLDocument;
    idHttpGeral: TIdHTTP;
    PrSalario: TsCurrencyEdit;
    lbSalario: tsLabel;
    PrAtivo: tscheckbox;
    PrSupervisor: tscheckbox;
    BtBuscaEnd: TsBitBtn;
    BtBuscaCEP: TsBitBtn;
    PrObs: TRichEdit;
    Label22: tsLabel;
    PrFuncionario: TsRadioGroup;
    Label23: tsLabel;
    Prtitular_conta: TsEdit;
    dsGradeComissao: TDataSource;
    mmGradeComissao: TRxMemoryData;
    mmGradeComissaoMargem: TFloatField;
    mmGradeComissaopreco_dado: TCurrencyField;
    mmGradeComissaoDesconto: TFloatField;
    mmGradeComissaoDiferenca: TFloatField;
    mmGradeComissaoPerc_Comissao: TFloatField;
    mmAnaliseVendas: TRxMemoryData;
    dsAnaliseVendas: TDataSource;
    mmAnaliseVendasMes: TStringField;
    mmAnaliseVendasTotal: TCurrencyField;
    mmAnaliseVendasMargem: TFloatField;
    mmAnaliseVendasMes_ord: TDateField;
    mmAnaliseVendasMeta: TCurrencyField;
    fR_RELATORIO: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    dst_comissao: TfrxDBDataset;
    ACBrCEP1: TACBrCEP;
    PrTipo_Sistema: TsRadioGroup;
    lbPLR: tsLabel;
    PrPLR_Valor: TsCurrencyEdit;
    mmAnaliseVendasID: TIntegerField;
    PrAdmissao: TsDateEdit;
    sLabel9: tsLabel;
    sLabel10: tsLabel;
    PrDemissao: TsDateEdit;
    sLabel11: tsLabel;
    btnOperadora: TsBitBtn;
    PrOperadora: TsEdit;
    q_cidades_atuacao: TFDQuery;
    Image1: TImage;
    mmTeto: TRxMemoryData;
    dsTeto: TDataSource;
    mmTetoID_REPRESENTANTE: TIntegerField;
    mmTetoTETO: TCurrencyField;
    mmTetoCOMISSAO: TFloatField;
    q_teto: TFDQuery;
    sLabel12: tsLabel;
    Prcod_tablet: TsEdit;
    sTabSheet1: TsTabSheet;
    GroupBox2: TsGroupBox;
    sPanel7: TsPanel;
    ft_lb_nom_representante: TsLabel;
    sLabel13: TsLabel;
    BtPesqDesc: TsBitBtn;
    ft_representante: TsComboEdit;
    Panel11: TsPanel;
    gbRepre: TsGroupBox;
    Lbnom_grupo: TDBText;
    edcod_grupo: TRxDBComboEdit;
    gbDescMax: TsGroupBox;
    edDescMaximo: TDBEdit;
    Panel12: TsPanel;
    BtNovoDescEsp: TsBitBtn;
    BtAltDescEsp: TsBitBtn;
    BtGravarDescEsp: TsBitBtn;
    BtCancDescEsp: TsBitBtn;
    BtExcDescEsp: TsBitBtn;
    ckAltTodos: TCheckBox;
    DBGrid6: TDBGrid;
    mmDescEspecial: TRxMemoryData;
    mmDescEspecialCOD_GRUPO: TIntegerField;
    mmDescEspecialDESCRICAO: TStringField;
    mmDescEspecialCIDADE: TStringField;
    mmDescEspecialDESCONTO_MAXIMO: TFloatField;
    dsDescEspecial: TDataSource;
    Prsomente_consumidor_final: TsCheckBox;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrCod_cidadeButtonClick(Sender: TObject);
    procedure PRRazao_SocialKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure PRCod_cidadeButtonClick2(Sender: TObject);
    procedure PRRazao_SocialKeyPress2(Sender: TObject; var Key: Char);
    procedure Prid_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_cidadeExit(Sender: TObject);
    procedure Sg_comissaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prnr_bancoButtonClick(Sender: TObject);
    procedure Prnr_bancoExit(Sender: TObject);
    procedure Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure PrPERC_COMISSAO_FIXAEnter(Sender: TObject);
    procedure zzcomissao_fixaClick(Sender: TObject);
    procedure BtBuscaEndClick(Sender: TObject);
    procedure BtBuscaCEPClick(Sender: TObject);

    procedure ft_produtoButtonClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure BtnImpMetaClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);

    procedure btnOperadoraClick(Sender: TObject);
    procedure BtnExportarVendorClick(Sender: TObject);

    procedure Prcod_tabletExit(Sender: TObject);
    procedure BtPesqDescClick(Sender: TObject);
    procedure BtNovoDescEspClick(Sender: TObject);
    procedure BtAltDescEspClick(Sender: TObject);
    procedure BtGravarDescEspClick(Sender: TObject);
    procedure BtCancDescEspClick(Sender: TObject);
    procedure BtExcDescEspClick(Sender: TObject);
    procedure ft_representanteExit(Sender: TObject);
    procedure ft_representanteButtonClick(Sender: TObject);
  private
    FCnt: Integer;
    procedure InsLinha(var SGX: TAdvStringGrid);

    procedure AnalisaVendas;
    procedure ativa_teto_comissao(id_representante: string);
    procedure GravarTetoComissao;
    procedure BuscaDescEspecial(CodRep : string);
    procedure AtualizarTodos;
    procedure GravarDescGrupo;
    { Private declarations }
  public
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: Boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;

    procedure limpa_campos(prefixo: ShortString);
    procedure mostra_campos(prefixo: string);

    procedure readonly_true(prefixo: string);
    procedure readonly_false(prefixo: string);

    procedure ativa_representante(id: string);
    procedure ativa_comissao(id_representante: string);
    procedure ativa_metas(id_representante: string);

    procedure carrega_sg_comissao;

    procedure monta_sg_comissao;

    procedure grava_comissao;
    procedure AtualizaRepresentantesWeb;
    procedure DeletaRepresentantesWeb;
    { Public declarations }
  end;

var
  Fr_representante: TFr_representante;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun, Un_dm, Un_splash, un_conexao_vendor;

{$R *.dfm}

procedure TFr_representante.ativa_comissao(id_representante: string);
begin
  with q_comissao do
  begin
    close;
    sql.clear;
    sql.add('select * from comissao c ' + 'where c.id_representante = ' +
      QuotedStr(id_representante));
    open;
  end;

end;

procedure TFr_representante.ativa_metas(id_representante: string);
begin
  with dm.q_metas do
  begin
    close;
    sql.clear;
    sql.add('select * from metas_representante m ' +
      'where m.id_representante = ' + QuotedStr(id_representante));
    open;
  end;
end;

procedure TFr_representante.ativa_teto_comissao(id_representante: string);
begin
  with q_teto do
  begin
    close;
    sql.clear;
    sql.add('SELECT a.ID_REPRESENTANTE, a.TETO, a.COMISSAO FROM REPRESENTANTE_TETO_COMISSAO a where a.id_representante = '
      + QuotedStr(id_representante));
    open;
  end;

  mmTeto.close;
  mmTeto.EmptyTable;
  mmTeto.open;

  while not q_teto.eof do
  begin
    mmTeto.Append;
    mmTetoID_REPRESENTANTE.AsInteger := q_teto.fieldbyname('ID_REPRESENTANTE')
      .AsInteger;
    mmTetoTETO.AsCurrency := q_teto.fieldbyname('TETO').AsCurrency;
    mmTetoCOMISSAO.AsFloat := q_teto.fieldbyname('COMISSAO').AsFloat;
    mmTeto.Post;
    q_teto.next;
  end;

  mmTeto.First;

end;

procedure TFr_representante.ativa_representante(id: string);
begin
  with q_representante do
  begin
    close;
    sql.clear;
    sql.add('select a.ID, a.NOM_REPRESENTANTE, A.TIPO_COMISSAO, a.admissao, a.demissao, a.comissao_fixa, a.NOM_EMPRESA, a.ENDERECO, a.BAIRRO, a.CEP, '
      + 'a.ID_CIDADE, a.CPF, a.RG, a.CNPJ, a.IE, a.FONE, a.FAX, a.CELULAR, A.OPERADORA, a.NR_CONTA_CORRENTE, '
      + 'a.NR_AGENCIA, a.NR_BANCO, a.EMAIL, a.HOME_PAGE, a.PERC_COMISSAO_FIXA, a.MARGEM_PLR, '
      + 'a.ATIVO, a.FUNCIONARIO, a.WEB_NOME, a.UF_ATUACAO, a.WEB_CIDADES_ATUACAO, a.SINCRONIZAR_PALM, '
      + 'a.SALARIO, a.PLR, a.PLR_FABRICA, a.SUPERVISOR, a.OBS, a.TITULAR_CONTA, c.nom_cidade, c.uf, '
      + 'a.MARGEM_MINIMA, a.MARGEM_IDEAL, a.INDICE_ABAIXO, a.indice_acima, a.tipo_sistema, '
      + 'b.nr_banco, b.nom_banco, a.plr_valor, a.whatsapp, a.COD_TABLET, a.somente_consumidor_final from representante a '
      + 'left join banco b on b.id = cast(a.nr_banco as integer) '
      + 'left join cidades c on c.cod_cidade = a.id_cidade '
      + 'where a.id = ' + id);
    open;
  end;

end;

procedure TFr_representante.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    showmessage('Você deve escolher um representante para altera-lo!');
    exit;
  end;
  modo_insert := false;
  readonly_false('Pr');
  // habilita botões
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Prnom_representante.SetFocus;
  readonly_false('Pr');
end;

procedure TFr_representante.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin
      Btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := false;
      btexc.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('Pr');
      end
      else if modo_insert = false then
      begin
        mostra_campos('Pr');
      end;
    end
    else
      exit;
  except
  end;
  readonly_true('Pr');
end;

procedure TFr_representante.btexcClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    showmessage('Selecione um representante para excluír primeiramente!');
    exit;
  end;
  if MessageDlg('Deseja excluír o representante?', mtConfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from representante where id =' +
        QuotedStr(Prid.Text));
      dao.Execsql('delete from comissao where id_representante =' +
        QuotedStr(Prid.Text));
      dao.cn.Commit;
      dao.msg('Representante excluído com sucesso!');
    except
      on e: Exception do
      begin
        dao.cn.Rollback;
        dao.msg('Houve um erro na exclusão do representante! ' + e.message);
      end;
    end;
  end;
  readonly_true('Pr');
end;

procedure TFr_representante.BtExcDescEspClick(Sender: TObject);
begin
  mmDescEspecial.Delete;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
  dao.Exec_sql.SQL.Text := 'DELETE FROM GRUPO_REPRESENTANTE WHERE COD_GRUPO = '+mmDescEspecialCOD_GRUPO.AsString+' AND ID_REPRESENTANTE = '+Prid.text;
  dao.Exec_sql.ExecSQL;

end;

procedure TFr_representante.AtualizarTodos;
begin
  dao.Exec_sql.SQL.Text := 'DELETE FROM GRUPO_REPRESENTANTE WHERE ID_REPRESENTANTE = '+Prid.text;
  dao.Exec_sql.ExecSQL;

  dao.Exec_sql.SQL.Text := 'insert into GRUPO_REPRESENTANTE '+
                           '(ID_REPRESENTANTE, COD_GRUPO, DESCONTO_MAXIMO) '+
                           'select '+Prid.text+', r.cod_grupo, '+FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.')+
                           'from grupo r ';

  dao.Exec_sql.ExecSQL;
  BuscaDescEspecial(Prid.Text);
end;

procedure TFr_representante.btgraClick(Sender: TObject);
var sql : string;
begin
  if trim(Prcod_tablet.Text) = '' then
    Prcod_tablet.Text := '0';


  if Prnom_representante.Text = '' then
  begin
    dao.msg('O campo Representante deve ser preenchido!');
    pcrep.ActivePage := tab_dados;
    Prnom_representante.SetFocus;
    exit;
  end;
  if Prid_cidade.Text = '' then
  begin
    dao.msg('O campo Cidade deve ser preenchido!');
    pcrep.ActivePage := tab_dados;
    Prid_cidade.SetFocus;
    exit;
  end;

  Btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := false;
  btexc.Enabled := true;
  { if zzcomissao_fixa.Checked = false then
    Prperc_comissao_fixa.text := ''; }
  Screen.Cursor := crSQLWait;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'representante', 'id', Fr_representante,
        'gen_representante');
      Prid.Text := id;
      ativa_representante(id);
      Btnov.SetFocus;
    end
    else
      dao.update('representante', 'id', Prid.Text, 'Pr', Fr_representante);
    grava_comissao;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  GravarTetoComissao;

  if home_page <> '' then
  begin
    if PrAtivo.Checked then
      AtualizaRepresentantesWeb
    else
      DeletaRepresentantesWeb;
  end;
  Screen.Cursor := crDefault;
  readonly_true('Pr');

  FMFUN.GerarCodigoMobile(strtoint(Prid.Text));

end;

procedure TFr_representante.GravarTetoComissao;
var
  sql: string;
begin
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if Prid.Text <> '' then
    begin
      try
        if not(dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql := ' DELETE FROM REPRESENTANTE_TETO_COMISSAO WHERE ID_REPRESENTANTE = '
          + Prid.Text;
        dao.Execsql(sql);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;

    mmTeto.First;
    while not mmTeto.eof do
    begin
      sql := ' INSERT INTO REPRESENTANTE_TETO_COMISSAO (ID_REPRESENTANTE, TETO, COMISSAO) '
        + ' VALUES ( ' + Prid.Text + ', ' +
        FMFUN.BuscaTroca(mmTetoTETO.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmTetoCOMISSAO.AsString, ',', '.') + ') ';
      dao.Execsql(sql);

      mmTeto.next;
    end;
    mmTeto.First;

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_representante.DeletaRepresentantesWeb;
var
  Consulta: TStringStream;
begin
  Consulta := TStringStream.Create('');
  Consulta.WriteString('modo=deleta_representante');
  Consulta.WriteString('&id=' + Prid.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_representante.AtualizaRepresentantesWeb;
var
  Consulta: TStringStream;
begin
  Consulta := TStringStream.Create('');
  Consulta.WriteString('modo=representante');
  Consulta.WriteString('&id=' + Prid.Text);
  Consulta.WriteString('&nome=' + PrWeb_Nome.Text);
  Consulta.WriteString('&fone=' + Prcelular.Text);
  Consulta.WriteString('&fone1=' + Prfone.Text);
  Consulta.WriteString('&cidades=' + PrWEB_CIDADES_ATUACAO.Text);
  Consulta.WriteString('&uf=' + PrUF_ATUACAO.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_representante.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  // habilita botões
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  limpa_campos('Pr');
  Prnom_representante.SetFocus;
  readonly_false('Pr');
end;

procedure TFr_representante.BtNovoDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;
  mmDescEspecial.Cancel;
  mmDescEspecial.Append;
  edcod_grupo.SetFocus;
end;

procedure TFr_representante.limpa_campos(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).Checked := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).clear
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).clear
      else if Components[i] is TRadioGroup then
        TRadioGroup(Components[i]).ItemIndex := 0;

    end;
  end;
  if prefixo = 'Pr' then
  begin
    LbNom_cidade.Caption := '...';
  end;
end;

procedure TFr_representante.mostra_campos(prefixo: string);
var
  i: Integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;

  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          q_representante.fieldbyname(campo1).AsFloat;
      end;
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_representante.fieldbyname
          (campo1).AsString;
      end;
      if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        if q_representante.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end;
      if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_representante.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TsRadioGroup then
      begin
        campo := TsRadioGroup(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsRadioGroup(Components[i]).ItemIndex :=
          q_representante.fieldbyname(campo1).AsInteger;
      end;
      if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text :=
          q_representante.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date :=
          q_representante.fieldbyname(campo1).AsDateTime;
      end;
      if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text :=
          q_representante.fieldbyname(campo1).AsString;
      end;
    end;
  end; // end do for

  Lb_banco.Caption := q_representante.fieldbyname('nom_banco').AsString;

  Screen.Cursor := crDefault;

  Prid_cidadeExit(self);
  if (PrFuncionario.ItemIndex = 0) or (PrFuncionario.ItemIndex = 1) or
    (PrFuncionario.ItemIndex = 4) then
  begin
    AnalisaVendas;
    ativa_teto_comissao(Prid.Text);
    // CarregarMapaAtuacao;
  end;
  BuscaDescEspecial(Prid.Text);
end;

procedure TFr_representante.readonly_false(prefixo: string);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_representante.readonly_true(prefixo: string);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;
    end;
  end;
end;

procedure TFr_representante.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  monta_sg_comissao;
  if frpri.TipUsu = '0' then
  begin
    Btnov.Visible := false;
    btexc.Visible := false;
  end;

  if frpri.TipUsu < '9' then
  begin
    lbSalario.Visible := false;
    lbPLR.Visible := false;
    PrSalario.Visible := false;
    PrPLR_Valor.Visible := false;
  end;

end;

procedure TFr_representante.monta_sg_comissao;
begin
end;

procedure TFr_representante.PrCod_cidadeButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_representate';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_representante.PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_representante.BitBtn1Click(Sender: TObject);
var
  // q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Btnov.Enabled = false then
  begin
    showmessage
      ('Você deve gravar ou cancelar as informações antes de localizar!');
    exit;
  end;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_representante(Fr_localizar.EDlocalizar.Text);
  end;
  Fr_localizar.ckAtivos.Visible := True;
  Fr_localizar.rgTipoFunc.Visible := true;
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_representante.PRCod_cidadeButtonClick2(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_representante_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_representante.PRRazao_SocialKeyPress2(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_representante.Prid_cidadeKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Key = #13 then
  begin
    if (Prid_cidade.Text <> '') then
    begin
      SelectNext(Sender as twincontrol, true, true);
      Key := #0;
    end;
    if (Prid_cidade.Text = '') and (btgra.Enabled = true) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_representante_cidade';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

      for i := 0 to 1 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(valor_combo);
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
  end;
end;

procedure TFr_representante.Prcod_tabletExit(Sender: TObject);
var
 id : string;
begin
  if trim(Prcod_tablet.Text) = '0' then exit;
  if trim(Prcod_tablet.Text) = '' then exit;
  if trim(prid.Text) = '' then id := '0' else id := prid.Text;

  dao.Geral2('select id from representante r where r.id <> ' + id +
    ' and  r.cod_tablet = ' + Prcod_tablet.Text);
  if dao.q2.RecordCount > 0 then
  begin
    dao.msg('Código já utilizado!');
    Prcod_tablet.Text := '';
    Prcod_tablet.SetFocus;
    exit;
  end;
end;

procedure TFr_representante.Prid_cidadeExit(Sender: TObject);
begin
  if trim(Prid_cidade.Text) = '' then
    LbNom_cidade.Caption := '...';

  if Prid_cidade.Text <> '' then
  begin
    dao.Geral2('select nom_cidade, uf from cidades where cod_cidade=' +
      QuotedStr(Prid_cidade.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cidade.Caption := dao.q2.fieldbyname('nom_cidade').AsString + ' - '
        + dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_cidade.Text := '';
      Prid_cidade.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_representante.Sg_comissaoKeyPress(Sender: TObject; var Key: Char);
begin
  { if not (zzcomissao_fixa.Checked) then
    begin
    if key = #13 then
    begin
    if (Sg_comissao.Cells[1, sg_comissao.Row] <> '') and
    //Verifica se todos os campos daquela linha estao preenchidos
    (Sg_comissao.Cells[2, sg_comissao.Row] <> '') and
    (Sg_comissao.Cells[3, sg_comissao.Row] <> '') then
    begin
    if (Sg_comissao.row = sg_comissao.RowCount - 1) and
    (Sg_comissao.cells[1, Sg_comissao.RowCount - 1] <> '') then
    Sg_comissao.AddRow;
    end;
    end;
    end; }
end;

procedure TFr_representante.InsLinha(var SGX: TAdvStringGrid);
begin
  SGX.Col := 1;
  SGX.AddRow;
  SGX.Row := SGX.Row + 1;
  lin := SGX.Row;
end;

procedure TFr_representante.grava_comissao;
var
  i: Integer;
  cmd: string;
  campo: string;
  valor: string;
  id_repres: string;
  perc_min, perc_max, perc_comissao: string;
  comando_sql: string;
  x: Integer;
begin
  { if not (dao.cn.InTransaction) then
    (dao.cn.StartTransaction);
    if Prid.Text <> '' then
    dao.Execsql('delete from comissao where id_representante=' +
    QuotedStr(Prid.Text));

    if (zzcomissao_fixa.Checked) then
    begin
    if PrPERC_COMISSAO_FIXA.Text = '' then
    dao.Execsql('insert into representante (perc_comissao_fixa) values (' +
    quotedstr('0') + ')')
    else
    dao.Execsql('insert into representante (perc_comissao_fixa) values (' +
    quotedstr(FMFUN.prepara_valor(Prperc_comissao_fixa.Text)) + ')');
    exit;
    end;
    for i := 1 to Sg_comissao.RowCount - 1 do
    begin
    if sg_comissao.cells[2, i] <> '' then
    begin
    dao.Execsql('insert into comissao (id_representante, perc_minimo, perc_maximo, perc_comissao) values (' + QuotedStr(Prid.Text) + ',' +
    QuotedStr(FMFUN.prepara_valor(Sg_comissao.Cells[1, i])) +
    ',' + QuotedStr(fmfun.prepara_valor(Sg_comissao.Cells[2, i])) + ',' +
    QuotedStr(fmfun.prepara_valor(Sg_comissao.Cells[3, i])) + ')');
    dao.Execsql('update representante set perc_comissao_fixa =' +
    quotedstr('0') + ' where id =' + quotedstr(prid.text));
    end;
    end; }
end;

procedure TFr_representante.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
  end;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_representante.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    MessageBox(handle,
      'Você deve Gravar ou Cancelar as Informações Antes de Sair!', 'ORBI',
      MB_ICONWARNING);
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_representante.Prnr_bancoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar banco';
  chamou_pesquisa := 'fr_banco';
  chamou_form := 'fr_representante_banco';
  chamou_cadastro := 'Fr_banco';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do banco';
  Campos_combo[2] := 'Número do banco';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_representante.Prnr_bancoExit(Sender: TObject);
begin
  if Prnr_banco.Text = '' then
    Lb_banco.Caption := '...';
  if Prnr_banco.Text <> '' then
  begin
    dao.Geral1('select id, nom_banco from banco where id =' +
      QuotedStr(Prnr_banco.Text));
    if dao.Q1.RecordCount >= 1 then
    begin
      Lb_banco.Caption := dao.Q1.fieldbyname('nom_banco').AsString;
    end
    else
    begin
      showmessage('Não foi encontrado nenhum banco com este código!');
      Prnr_banco.SetFocus;
    end;
  end;
end;

procedure TFr_representante.Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
var
  valor_combo: string;
  i: Integer;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  Campos_combo: array of string;
begin
  if (Key = #13) and (Prnr_banco.Text <> '') then
  begin
    SelectNext(Sender as twincontrol, true, true);
    Key := #0;
  end;
  if (Key = #13) and (Prnr_banco.Text = '') then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    // guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar banco';
    chamou_pesquisa := 'fr_banco';
    chamou_form := 'fr_representante_banco';
    chamou_cadastro := 'Fr_banco';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
    Fr_localizar.BT_cadastro.Visible := true;

    // preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Código';
    Campos_combo[1] := 'Nome do banco';
    Campos_combo[2] := 'Número do banco';

    for i := 0 to 2 do
    begin
      valor_combo := Campos_combo[i];
      Fr_localizar.CBcampos.Items.add(valor_combo);
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
end;

procedure TFr_representante.Prnom_representanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_representante.PrPERC_COMISSAO_FIXAEnter(Sender: TObject);
begin
  { if zzcomissao_fixa.Checked = true then
    Sg_comissao.Enabled := false
    else
    Sg_comissao.Enabled := true; }
end;

procedure TFr_representante.zzcomissao_fixaClick(Sender: TObject);
begin
  { if zzcomissao_fixa.Checked = true then
    Sg_comissao.Enabled := false
    else
    Sg_comissao.Enabled := true; }
end;

procedure TFr_representante.carrega_sg_comissao;
var
  x: Integer;
begin
  { sg_comissao.ClearNormalCells;
    sg_comissao.RowCount := 2;
    if q_comissao.recordcount >= 1 then
    begin
    zzcomissao_fixa.Checked := false;
    Sg_comissao.Enabled := true;
    q_comissao.first;
    x := 1;
    while not (q_comissao.eof) do
    begin
    sg_comissao.cells[0, x] := q_comissao.fieldbyname('id').AsString;
    sg_comissao.cells[1, x] := q_comissao.fieldbyname('perc_minimo').AsString;
    sg_comissao.cells[2, x] := q_comissao.fieldbyname('perc_maximo').AsString;
    sg_comissao.cells[3, x] :=
    q_comissao.fieldbyname('perc_comissao').AsString;
    q_comissao.Next;
    if not q_comissao.eof then
    begin
    sg_comissao.addrow;
    x := x + 1;
    end;
    end;
    end; }
end;

procedure TFr_representante.BtBuscaEndClick(Sender: TObject);
begin

  if trim(Prcep.Text) = '-' then
  begin
    showmessage('Informe o CEP!!');
    Prcep.SetFocus;
    exit;
  end;

  ACBrCEP1.BuscarPorCEP(Prcep.Text);
  Prendereco.SetFocus;

end;

procedure TFr_representante.BtCancDescEspClick(Sender: TObject);
begin
  mmDescEspecial.cancel;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_representante.BtAltDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;

  mmDescEspecial.Edit;
  edcod_grupo.SetFocus;
end;

procedure TFr_representante.BtBuscaCEPClick(Sender: TObject);
var
  dados_consulta_cep: TStringList;
  resultado, tipo_logradouro, logradouro, uf, cidade, bairro, numero: string;
begin
  if trim(Prendereco.Text) = '' then
  begin
    showmessage('Endereço precisa ser preenchido!');
    Prendereco.SetFocus;
    exit;
  end;

  if trim(Prid_cidade.Text) = '' then
  begin
    showmessage('Cidade precisa ser preenchido!');
    Prid_cidade.SetFocus;
    exit;
  end;

  dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' +
    QuotedStr(Prid_cidade.Text));

  tipo_logradouro := Copy(Prendereco.Text, 1, pos(' ', Prendereco.Text));
  logradouro := Copy(Prendereco.Text, pos(' ', Prendereco.Text),
    Length(Prendereco.Text));
  numero := '1';
  bairro := Prbairro.Text;
  uf := dao.q2.fieldbyname('uf').AsString;
  cidade := dao.q2.fieldbyname('nom_cidade').AsString;

  dados_consulta_cep := TStringList.Create;
  dados_consulta_cep := frpri.BuscaCEP(tipo_logradouro, logradouro, uf, cidade,
    bairro, numero);
  resultado := dados_consulta_cep.Values['resultado'];

  if resultado <> '1' then
  begin
    showmessage('CEP não encontrado!');
    Prcep.SetFocus;
    exit;
  end;

  Prcep.Text := dados_consulta_cep.Values['cep'];
  Prendereco.Text := dados_consulta_cep.Values['endereco'];
  Prbairro.Text := dados_consulta_cep.Values['bairro'];
  Prid_cidade.Text := dados_consulta_cep.Values['cidade'];
  Prid_cidadeExit(self);
  Prendereco.SetFocus;
  // FMFUN.Atualiza_Qtd_Consultas_CEP;
end;





procedure TFr_representante.ft_representanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_representante_filtro_representante';
  chamou_cadastro := 'fr_representante';


  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;


  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
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

procedure TFr_representante.ft_representanteExit(Sender: TObject);
begin
  if trim(ft_representante.Text) = '' then
    ft_lb_nom_representante.Caption := '...';

  if ft_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(ft_representante.Text));
    if dao.q2.RecordCount > 0 then
      ft_lb_nom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      ft_representante.Text := '';
      ft_representante.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_representante.ft_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_representante_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';
  Campos_combo[3] := 'Referencia';
  Campos_combo[4] := 'Grupo';
  Campos_combo[5] := 'Fornecedor';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_representante.BuscaDescEspecial(CodRep : string);
begin

  dao.Geral1('select '+
             '  G.COD_GRUPO, '+
             '  pr.ID_REPRESENTANTE, '+
             '  G.NOM_GRUPO, '+
             '  pr.DESCONTO_MAXIMO '+
             'From GRUPO G '+
             'inner join GRUPO_REPRESENTANTE pr on (pr.COD_GRUPO = G.COD_GRUPO) '+
             '  where  pr.ID_REPRESENTANTE = '+CodRep+
             '  order by NOM_GRUPO ');
  dao.Q1.first;
  mmDescEspecial.Close;
  mmDescEspecial.EmptyTable;
  mmDescEspecial.Open;
  while not dao.Q1.eof do
  begin
    mmDescEspecial.Append;
    mmDescEspecialCOD_GRUPO.AsString := dao.Q1.fieldbyname('COD_GRUPO').AsString;
    mmDescEspecialDESCRICAO.AsString := dao.Q1.fieldbyname('NOM_GRUPO').AsString;
    mmDescEspecialDESCONTO_MAXIMO.VALUE := dao.Q1.fieldbyname('DESCONTO_MAXIMO').VALUE;
    mmDescEspecial.Post;
    dao.Q1.next;
  end;

end;

procedure TFr_representante.GravarDescGrupo;
var sql : string;
begin
  if modo_insert then
  begin
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql := ' INSERT INTO GRUPO_REPRESENTANTE (COD_GRUPO, ID_REPRESENTANTE, DESCONTO_MAXIMO) ' + ' VALUES ( ' + mmDescEspecialCOD_GRUPO.AsString + ', ' + Prid.Text + ', ' + FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.') + ') ';
        dao.Execsql(sql);

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
  end
  else begin
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);

        sql := 'UPDATE GRUPO_REPRESENTANTE '+
               'SET DESCONTO_MAXIMO = '+FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.')+
               'WHERE '+
               '  COD_GRUPO = '+ mmDescEspecialCOD_GRUPO.AsString +' AND '+
               '  ID_REPRESENTANTE = '+ Prid.Text;
        dao.Execsql(sql);

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

  end;

end;

procedure TFr_representante.BtPesqDescClick(Sender: TObject);
var
  sql : string;
  WindowList : Pointer;
begin
  if Trim(ft_representante.Text) = '' then
  begin
    dao.msg('O campo Representante à ser copiado deve ser preenchido!');
    ft_representante.SetFocus;
    exit;
  end;


  BuscaDescEspecial(ft_representante.Text);
  try
    if not (dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    sql := ' DELETE FROM GRUPO_REPRESENTANTE WHERE ID_REPRESENTANTE = ' + Prid.Text;
    dao.Execsql(sql);

    mmDescEspecial.DisableControls;
    mmDescEspecial.First;

    WindowList := DisableTaskWindows(fm_splash.Handle);
    fm_splash.ggProgress.MaxValue := mmDescEspecial.RecordCount;
    fm_splash.lbStatus.Caption := 'Copiando Registros...';
    fm_splash.ggProgress.Progress := 0;
    fm_splash.Show;

    while not mmDescEspecial.Eof do
    begin

      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      sql := ' INSERT INTO GRUPO_REPRESENTANTE (COD_GRUPO, ID_REPRESENTANTE, DESCONTO_MAXIMO) ' + ' VALUES ( ' + mmDescEspecialCOD_GRUPO.AsString + ', ' + Prid.Text + ', ' + FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.') + ') ';
      dao.Execsql(sql);

      fm_splash.ggProgress.AddProgress(1);
      fm_splash.refresh;

      mmDescEspecial.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  mmDescEspecial.EnableControls;
  mmDescEspecial.First;

  EnableTaskWindows(WindowList);
  fm_splash.Hide;
end;

procedure TFr_representante.AnalisaVendas;
begin
{  dm.q_metas.close;

  dm.q_metas.sql.Text := 'SELECT ' +
                         '  mr.id, ' +
                         '  r.id as codrep, ' +
                         '  r.nom_representante, ' +
                         '  mr.MES, ' +
                         '  cast(substring(mr.mes from 4 for 4)||''/''||substring(mr.mes from 1 for 2) as varchar(20)) as mes_inv, ' +
                         '  coalesce(mr.VL_VENDA,0) as meta, ' +
                         '  coalesce(mr.TOTAL_FATURADO,0) as TOTAL_FATURADO, ' +
                         '  coalesce(mr.TOTAL_ABERTO,0) as TOTAL_ABERTO, ' +
                         '  coalesce(mr.MARGEM_FATURADO,0) as MARGEM_FATURADO, ' +
                         '  coalesce(mr.MARGEM_ABERTO,0) as MARGEM_ABERTO ' +
                         'FROM METAS_REPRESENTANTE mr ' +
                         'inner join REPRESENTANTE r on r.id = mr.ID_REPRESENTANTE ' +
                         'where cast(substring(mr.mes from 4 for 4) as VARCHAR(4)) = cast(extract(year from current_date) as varchar(4)) and r.id = ' + Prid.Text;

  dm.q_metas.open;
  dm.q_metas.First;
  mmAnaliseVendas.close;
  mmAnaliseVendas.EmptyTable;
  mmAnaliseVendas.open;

  while not dm.q_metas.eof do
  begin
    mmAnaliseVendas.Append;
    mmAnaliseVendasID.AsInteger := dm.q_metas.fieldbyname('ID').AsInteger;
    mmAnaliseVendasMes.AsString := dm.q_metas.fieldbyname('MES').AsString;
    mmAnaliseVendasTotal.Value := dm.q_metas.fieldbyname
      ('TOTAL_FATURADO').Value;
    mmAnaliseVendasMargem.Value := dm.q_metas.fieldbyname
      ('MARGEM_FATURADO').Value;
    mmAnaliseVendasMes_ord.AsString := '01/' + dm.q_metas.fieldbyname
      ('MES').AsString;
    mmAnaliseVendasMeta.Value := dm.q_metas.fieldbyname('META').AsCurrency;
    mmAnaliseVendas.Post;
    dm.q_metas.next;
  end;

  mmAnaliseVendas.First;
 }
end;

procedure TFr_representante.btnImprimirClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if mmGradeComissao.RecordCount = 0 then
    exit;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\grade_comissao.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;
end;

procedure TFr_representante.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin

  if VarName = 'empresa' then
    Value := nom_empresa;
end;

procedure TFr_representante.BtnImpMetaClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\metas_comerciais.fr3'))
  then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;
end;

procedure TFr_representante.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  i: Integer;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    showmessage('Endereço não Encontrado.')
  else
  begin
    for i := 0 to ACBrCEP1.Enderecos.Count - 1 do
    begin
      with ACBrCEP1.Enderecos[i] do
      begin
        Prendereco.Text := trim(tipo_logradouro + ' ' + logradouro);
        // prcomplemento.Text := Complemento;
        Prbairro.Text := bairro;
        Prid_cidade.Text := COPY(IBGE_Municipio, 1, 6);
        Prid_cidadeExit(Self);
      end;
    end;
  end;
end;



procedure TFr_representante.btnOperadoraClick(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(handle, 'open',
    pchar('http://consultanumero.abr.net.br:8080/consultanumero/consulta/consultaSituacaoAtual'),
    nil, nil, Sw_ShowNormal);
end;

procedure TFr_representante.BtGravarDescEspClick(Sender: TObject);
var
  nLinha : Integer;
  vDesc : Double;
begin
  if ckAltTodos.Checked then
  begin
    mmDescEspecial.post;
    AtualizarTodos;
  end
  else begin
    mmDescEspecial.post;
    GravarDescGrupo;
  end;

  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_representante.BtnExportarVendorClick(Sender: TObject);
var
  sql_insert: TStringList;
  sql_insert_part, sql_consulta, sql_representante, sql_vendas2, numdoc, tabela,
    representante: string;
  x, tentativa, total_rep, cont_rep: Integer;
  Vendor: TConexaoVendor;

  procedure EnviaFTP(extensao: string);
  var
    pathSaida: string;
    F: TSearchRec;
    Ret: Integer;
    Vendor: Boolean;
  begin
    pathSaida := ExtractFilePath(Application.ExeName) + 'vendor\';

    dao.Geral1
      ('select VENDOR_FTP_HOST, VENDOR_FTP_USUARIO, VENDOR_FTP_SENHA from CONFIGURACAO');

    { vendor := frpri.modulo_vendedor;

      if not vendor then
      exit; }

    dm.FTPSite.Host := dao.Q1.fieldbyname('VENDOR_FTP_HOST').AsString;
    dm.FTPSite.Username := dao.Q1.fieldbyname('VENDOR_FTP_USUARIO').AsString;
    dm.FTPSite.Password := dao.Q1.fieldbyname('VENDOR_FTP_SENHA').AsString;
    dm.FTPSite.port := 2121;

    dm.FTPSite.disconnect;
    dm.FTPSite.Connect;
    if dm.FTPSite.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPSite.Passive := true;
      // dm.FTPSite.TransferType := ftASCII;
      dm.FTPSite.TransferType := ftBinary;
      Ret := FindFirst(pathSaida + '*.' + extensao, faAnyFile, F);
      while Ret = 0 do
      begin
        dm.FTPSite.put(pathSaida + F.Name, F.Name);
        Ret := FindNext(F);
      end;
      dm.FTPSite.Quit;
      dm.FTPSite.disconnect;
    end;
  end;

  procedure LimparDir(extensao: string);
  var
    pathSaida: string;
    F: TSearchRec;
    Ret: Integer;
  begin
    pathSaida := ExtractFilePath(Application.ExeName) + 'vendor\';
    Ret := FindFirst(pathSaida + '*.' + extensao, faAnyFile, F);

    while Ret = 0 do
    begin
      DeleteFile(pathSaida + F.Name);
      Ret := FindNext(F);
    end;
  end;

begin
  { fm_splash.lbStatus.visible := false;
    fm_splash.ggProgress.Visible := false; }
  Vendor := TConexaoVendor.Create();

  fm_splash.pgArquivos.Visible := true;
  fm_splash.lbArquivos.Visible := true;
  fm_splash.pgArquivos.MaxValue := 6;
  fm_splash.pgArquivos.progress := 0;
  fm_splash.lbStatus.Caption := '';
  fm_splash.ggProgress.Visible := false;
  fm_splash.lbStatus.Visible := false;
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  fm_splash.pgArquivos.Visible := true;
  fm_splash.lbArquivos.Visible := true;
  fm_splash.pgArquivos.MaxValue := 7;
  fm_splash.lbArquivos.Caption := 'Atualização de Dados...';
  fm_splash.pgArquivos.progress := 0;
  fm_splash.update;

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Código Fiscal...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;

  Vendor.ExportarDados('cod_fiscal');

  Vendor.representante := Prid.Text;

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Produtos...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('produto');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Subcategoria de Produtos...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('subcategoria');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Categoria de Produtos...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('categoria');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Marcas...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('marcas');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Grupos...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('grupo');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Forma de Pagamento...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('fop');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Prazo...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('prazo');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Prazo por Representante...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('PRAZO_REPRESENTANTE');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Produto por Representante...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('PRODUTO_REPRESENTANTE');

  fm_splash.lbArquivos.Caption :=
    'Atualização de Dados - Grupo por Representante...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('GRUPO_REPRESENTANTE');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - NCM';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('ncm');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - MVA';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('mva');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - ICMS';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('icms');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - CORES';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('cores');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Usuários...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('tbusu');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Representantes...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('representante');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Clientes...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('cliente');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Visitas...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('cliente_visitas');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Vendas Itens...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('vendas2');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Faturas...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('cr1');

  fm_splash.lbArquivos.Caption := 'Atualização de Dados - Vendas...';
  fm_splash.pgArquivos.AddProgress(1);
  fm_splash.update;
  Vendor.ExportarDados('vendas1');
  fm_splash.hide;

  Vendor.Free;

  try
    EnviaFTP('sql');
  finally
    LimparDir('sql');
  end;

  try
    EnviaFTP('bmp');
  finally
    LimparDir('bmp');
  end;
end;


end.
