unit un_pre_cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, ExtCtrls, sPanel,
  sGroupBox, sLabel, sBevel;

type
  Tfr_pre_cadastro = class(TForm)
    sPanel1: TsPanel;
    BtnConsultaCNPJ: TsBitBtn;
    gbCNPJ: TsGroupBox;
    PrCNPJ: TsMaskEdit;
    gbStatus: TsGroupBox;
    sBevel1: TsBevel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    gbCodigo: TsGroupBox;
    lbCod_cliente: TsLabelFX;
    gbNom_Cliente: TsGroupBox;
    lbNom_cliente: TsLabelFX;
    gbPrNom_Fantasia: TsGroupBox;
    LbNom_Fantasia: TsLabelFX;
    gbEndereco: TsGroupBox;
    LbEndereco: TsLabelFX;
    gbNr_Endereco: TsGroupBox;
    lbNr_Endereco: TsLabelFX;
    gbComplemento: TsGroupBox;
    LbComplemento: TsLabelFX;
    gbBairro: TsGroupBox;
    lbBairro: TsLabelFX;
    gbCidade: TsGroupBox;
    lbCidade: TsLabelFX;
    gbCep: TsGroupBox;
    LBCEP: TsLabelFX;
    gbIE: TsGroupBox;
    LBIE: TsLabelFX;
    btnImportar: TsBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultaCNPJClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    procedure ChecarConexao;
    function conexao(servidor, banco: string): boolean;
    procedure ConsultaClienteBD(cnpj: string);
    procedure ConsultaClienteReceita;
    function BuscaDadosPorCNPJ(cnpj_cpf: string): boolean;
    procedure ImportarDadosLocal;
    procedure ImportarDadosServ;
    procedure LimparDados;
    function MontaSQLImport(cod_cliente : string): string;
    function ConsultaClienteLOCAL(cnpj: string): boolean;
    function MontaSQL(cnpj: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_pre_cadastro: Tfr_pre_cadastro;
  cod_cidade: string;

implementation

uses Un_dao, UnFun, un_selec_uf;

function Tfr_pre_cadastro.conexao(servidor, banco: string): boolean;
begin
  dao.CN_Vendor_Origem.connected := false;
  dao.CN_Vendor_Origem.params.values['server']  := servidor;
  dao.CN_Vendor_Origem.params.values['database']  := banco;
  try
    dao.CN_Vendor_Origem.connected := true;
    Result := true;
  except
    Result := false;
  end;
end;
{$R *.dfm}

procedure Tfr_pre_cadastro.ChecarConexao;
  procedure BuscarServidorClientes;
  var
    servidor_clientes, servidor_bd_clientes: string;
  begin
    dao.Geral4('SELECT a.MODULO_VENDOR, a.VENDOR_SERVIDOR_BD_EXTERNO, a.VENDOR_SERVIDOR_BD_INTERNO, a.VENDOR_BD FROM CONFIGURACAO a');
    if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_INTERNO').AsString,
      dao.Q4.fieldbyname('a.VENDOR_BD').asstring) then
    begin
      if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_EXTERNO').asstring,
        dao.Q4.fieldbyname('a.VENDOR_BD').asstring) then
      begin
        {lbstatus.caption := 'Sem conexão!!!';
        lbstatus.Font.Color := clMaroon;}
        BtnConsultaCNPJ.enabled := false;
        exit;
      end;
    end;

//    lbstatus.caption := 'Conectado!!!';
    BtnConsultaCNPJ.enabled := true;

    dao.q1_vendor.SQL.Text :=
      'SELECT a.VENDOR_SERVIDOR_CLIENTES, a.VENDOR_BD_CLIENTES FROM CONFIGURACAO a';
    dao.q1_vendor.open;
    if (dao.q1_vendor.fieldbyname('VENDOR_SERVIDOR_CLIENTES').AsString = '') or
      dao.q1_vendor.fieldbyname('VENDOR_SERVIDOR_CLIENTES').IsNull then
      exit;

    servidor_clientes := dao.q1_vendor.fieldbyname('VENDOR_SERVIDOR_CLIENTES').AsString;
    servidor_bd_clientes := dao.q1_vendor.fieldbyname('VENDOR_BD_CLIENTES').AsString;

    if conexao(servidor_clientes, servidor_bd_clientes) then
    begin
      {lbstatus.caption := 'Conectado!!!';
      BtnConsultaCNPJ.enabled := true;
      lbstatus.Font.Color := clNavy;}
    end
    else
    begin
//      lbstatus.caption := 'Sem conexão!!!';
      BtnConsultaCNPJ.enabled := false;
      //lbstatus.Font.Color := clMaroon;
      exit;
    end;
  end;
begin
  BuscarServidorClientes;
end;

procedure Tfr_pre_cadastro.FormShow(Sender: TObject);
begin
  LimparDados;
  ChecarConexao;
end;

procedure Tfr_pre_cadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dao.CN_Vendor_Origem.connected := false;
end;

function Tfr_pre_cadastro.MontaSQL(cnpj : string): string;
begin
  Result := 'select cl.id_representante, r.NOM_REPRESENTANTE, cl.COD_CLIENTE, cl.NOM_CLIENTE, cl.NOM_FANTASIA, cl.CNPJ, cl.IE, cl.ENDERECO, cl.NR_ENDERECO, ' +
    ' cl.COMPLEMENTO, cl.BAIRRO, cl.COD_CIDADE, cd.NOM_CIDADE||''-''||cd.UF as cidade, cl.CEP from cliente cl ' +
    ' inner join cidades cd on cd.cod_cidade = cl.COD_CIDADE ' +
    ' inner join representante r on r.id = cl.id_representante ' +
    'where cl.CNPJ = ''' + cnpj + '''';
end;

function Tfr_pre_cadastro.ConsultaClienteLOCAL(cnpj: string):boolean;
begin
  dao.Geral3(MontaSQL(cnpj));

  lbCod_cliente.Caption  := dao.q3.fieldbyname('Cod_cliente').AsString;
  lbNom_cliente.Caption  := dao.q3.fieldbyname('Nom_cliente').AsString;
  LbNom_Fantasia.Caption := dao.q3.fieldbyname('Nom_Fantasia').AsString;
  LbEndereco.Caption     := dao.q3.fieldbyname('Endereco').AsString;
  lbNr_Endereco.Caption  := dao.q3.fieldbyname('Nr_Endereco').AsString;
  LbComplemento.Caption  := dao.q3.fieldbyname('Complemento').AsString;
  lbBairro.Caption       := dao.q3.fieldbyname('Bairro').AsString;
  lbCidade.Caption       := dao.q3.fieldbyname('cidade').AsString;
  LBCEP.Caption          := dao.q3.fieldbyname('cep').AsString;
  LBIE.Caption           := dao.q3.fieldbyname('ie').AsString;
  cod_cidade             := dao.q3.fieldbyname('cod_cidade').AsString;

  Result := not dao.q3.isempty;
end;


procedure Tfr_pre_cadastro.ConsultaClienteBD(cnpj: string);
begin
  dao.q2_vendor.Close;
  dao.q2_vendor.SQL.Clear;
  dao.q2_vendor.SQL.Text := MontaSQL(cnpj);
  dao.q2_vendor.open;
  if dao.q2_vendor.IsEmpty then
    ConsultaClienteReceita
  else
  begin
    lbCod_cliente.Caption := dao.q2_vendor.fieldbyname('Cod_cliente').AsString;
    lbNom_cliente.Caption := dao.q2_vendor.fieldbyname('Nom_cliente').AsString;
    LbNom_Fantasia.Caption := dao.q2_vendor.fieldbyname('Nom_Fantasia').AsString;
    LbEndereco.Caption := dao.q2_vendor.fieldbyname('Endereco').AsString;
    lbNr_Endereco.Caption := dao.q2_vendor.fieldbyname('Nr_Endereco').AsString;
    LbComplemento.Caption := dao.q2_vendor.fieldbyname('Complemento').AsString;
    lbBairro.Caption := dao.q2_vendor.fieldbyname('Bairro').AsString;
    lbCidade.Caption := dao.q2_vendor.fieldbyname('cidade').AsString;
    LBCEP.Caption := dao.q2_vendor.fieldbyname('cep').AsString;
    LBIE.Caption := dao.q2_vendor.fieldbyname('ie').AsString;
    cod_cidade := dao.q2_vendor.fieldbyname('cod_cidade').AsString;

    if dao.q2_vendor.fieldbyname('id_representante').AsString <>
      Representante_usuario then
    begin
      //Lbstatus.Caption := 'Cliente associado ao representante: ' +   dao.q2_vendor.fieldbyname('NOM_REPRESENTANTE').AsString;
      //Lbstatus.Font.Color := clMaroon;
      btnImportar.Enabled := false;
    end
    else
    begin
      btnImportar.Enabled := true;
    end;
  end;
end;

procedure Tfr_pre_cadastro.LimparDados;
begin
  //lbStatus.Caption := '';
  lbCod_cliente.Caption := '';
  lbNom_cliente.Caption := '';
  LbNom_Fantasia.Caption := '';
  LbEndereco.Caption := '';
  lbNr_Endereco.Caption := '';
  LbComplemento.Caption := '';
  lbBairro.Caption := '';
  lbCidade.Caption := '';
  LBCEP.Caption := '';
  LBIE.Caption := '';
end;

procedure Tfr_pre_cadastro.BtnConsultaCNPJClick(Sender: TObject);
begin
  Limpardados;
  if not ConsultaClienteLOCAL(PrCNPJ.Text) then
    ConsultaClienteBD(PrCNPJ.Text);
end;

function Tfr_pre_cadastro.BuscaDadosPorCNPJ(cnpj_cpf: string): boolean;
var
  captcha: string;
begin
  Application.CreateForm(Tfm_selec_uf, fm_selec_uf);
  fm_selec_uf.lbuf.Visible := false;
  fm_selec_uf.cbUF.Visible := false;

  fm_selec_uf.ShowModal;
  if fm_selec_uf.ModalResult = mrok then
    captcha := fm_selec_uf.edCaptcha.Text;

  cnpj_cpf := fmfun.LimpaCNPJ(cnpj_cpf);

  if captcha = '' then
    exit;

  fmfun.ACBrConsultaCNPJ1.Consulta(cnpj_cpf, Captcha, true);
end;

function Tfr_pre_cadastro.MontaSQLImport(cod_cliente : string): string;
begin
  Result := 'INSERT INTO CLIENTE (COD_CLIENTE, Nom_cliente, Nom_Fantasia,  Endereco, Nr_Endereco, Complemento, Bairro, cod_Cidade, CEP, IE, CNPJ, id_representante)' +
    'VALUES (''' + cod_cliente + ''', ''' + LBNom_cliente.caption + ''', ''' + lbNom_Fantasia.caption +
      ''',''' + lbEndereco.caption + ''',''' + lbNr_Endereco.caption + ''',''' +
    lbComplemento.caption + ''',''' + lbBairro.caption + ''', ''' +
      cod_Cidade + ''', ''' + lbCEP.caption + ''', ''' + lbIE.caption + ''', ''' + PrCNPJ.Text + ''', ''' + Representante_usuario + ''')';
end;

procedure Tfr_pre_cadastro.ImportarDadosLocal;
begin
  try
  dao.cn.StartTransaction;
  dao.Execsql(MontaSQLImport(lbCod_cliente.Caption));
  dao.cn.Commit;
  finally
    {Lbstatus.Font.Color := clNavy;
    Lbstatus.Caption    := 'Dados importados com Sucesso!!!';}
    btnImportar.Enabled := false;
  end;
end;

procedure Tfr_pre_cadastro.ImportarDadosServ;
begin
  dao.CN_Vendor_Origem.StartTransaction;

  dao.q2_vendor.SQL.Text := 'select nextval(''gen_cliente'') as gen_id from configuracao';
  dao.q2_vendor.Open;
  lbcod_cliente.Caption  := dao.Q2_vendor.fieldbyname('gen_id').AsString;

  dao.exec_sql_vendor.SQL.Clear;
  dao.exec_sql_vendor.SQL.Text := MontaSQLImport(lbCod_cliente.Caption);
  dao.exec_sql_vendor.ExecSQL;

  dao.CN_Vendor_Origem.Commit;

  ConsultaClienteBD(PrCNPJ.Text);
end;

procedure Tfr_pre_cadastro.ConsultaClienteReceita;
begin
  if BuscaDadosPorCNPJ(PrCNPJ.Text) then
  begin
    with fmfun.ACBrConsultaCNPJ1 do
    begin
      LbNom_Cliente.Caption := RazaoSocial;
      LbNom_Fantasia.Caption := Fantasia;
      LbCep.Caption := FMFUN.FormataCEP(CEP);
      LbEndereco.Caption := Endereco;
      Lbnr_endereco.caption := Numero;
      LbComplemento.caption := Complemento;
      LbBairro.caption := Bairro;
      dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = ''' + uf + ''' AND NOM_cidade = ' + QuotedStr(Cidade));
      if dao.q2.RecordCount > 0 then
      begin
        Lbcidade.Caption := dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.Q2.fieldbyname('UF').AsString;
        cod_cidade := dao.Q2.fieldbyname('cod_CIDADE').AsString;
      end;
      ImportarDadosServ;
      btnImportar.Enabled := true;
    end;
  end;
end;
procedure Tfr_pre_cadastro.btnImportarClick(Sender: TObject);
begin
 ImportarDadosLocal;
end;

end.
