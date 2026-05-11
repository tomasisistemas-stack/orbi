unit Un_dados_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, StdCtrls, ComCtrls, sSpeedButton, sLabel, sCheckBox;

type
  TFr_dados_cliente = class(TForm)
    Lbnom_cliente: TLabel;
    Lbendereco: TLabel;
    Lbbairro: TLabel;
    Lbcidade: TLabel;
    Lbcep: TLabel;
    Lbcpf: TLabel;
    Lbrg: TLabel;
    Lbcnpj: TLabel;
    Lbie: TLabel;
    Lbfone: TLabel;
    Lbfax: TLabel;
    lbemail: TLabel;
    observacao: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btcloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Busca_dados_cliente(cod_cli: string);
    procedure monta_dados_cliente;
    { Public declarations }
  end;

var
  Fr_dados_cliente: TFr_dados_cliente;

implementation

uses Un_dao;

{$R *.dfm}


procedure TFr_dados_cliente.Busca_dados_cliente(cod_cli: string);
begin
  dao.Geral1('select a.COD_CLIENTE, a.DTA_CAD, a.PRI_COMPRA, a.NOM_CLIENTE, a.NOM_FANTASIA, a.ENDERECO, a.COMPLEMENTO, a.PROXIMO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, ' +
    'a.TELEFONE, a.EMAIL, a.AVISO, a.CNPJ, a.IE, a.IM, a.PROD_RURAL, a.CONTATO, a.FONE_CONTATO, a.LIMITE, a.CPF, a.RG, a.NATURALIDADE, ' +
    'a.EST_CIVIL, a.PAI, a.MAE, a.TIP_RESIDENCIA, a.ALUGUEL, a.EMPRESA, a.END_TRACLI, a.BAIRRO_TRABALHO, a.CID_TRABALHO, a.FONE_TRABALHO, ' +
    'a.CARGO, a.SALARIO, a.NOM_CONJUGUE, a.EMP_CONJ, a.END_EMP_CONJ, a.CID_EMP_CONJ, a.FONE_EMP_CONJ, a.CARGO_CONJ, a.NOM_REF1, a.FONE_REF1, a.OBS_REF1, a.NOM_REF2, ' +
    'a.FONE_REF2, a.OBS_REF2, a.CAD_SPC, a.DTA_CAD_SPC, a.DTA_ANIVERSARIO, a.OBSERVACOES, a.FAX, a.MANEQUIM, a.CALCADO, a.COR_PREFERIDA, a.CONTATO_PREFERIDO, ' +
    'a.ESTILO, a.CONTATO_FONE, a.CONTATO_EMAIL, a.CONTATO_CORRESPONDENCIA, a.ID_ANTIGO, a.PONTO_FIDELIDADE, a.ID_REPRESENTANTE, a.ID_FOP, a.PRAZO_MAXIMO, ' +
    'a.DESCONTO_MAXIMO, a.CLIENTE_BLOQUEADO, a.STATUS, a.COD_EMPRESA, a.NR_ENDERECO, a.NFE_EMAIL, a.SINCRONIZAR_PALM, a.PRE_CADASTRO, ' +
    'cd.nom_cidade, cd.uf from cliente a ' +
    'left join cidades cd on cd.cod_cidade = a.cod_cidade ' +
    'where a.cod_cliente=' + QuotedStr(cod_cli));
  if dao.Q1.RecordCount > 0 then
    monta_dados_cliente;
end;

procedure TFr_dados_cliente.monta_dados_cliente;
begin
  Lbnom_cliente.Caption := dao.q1.fieldbyname('nom_cliente').AsString;
  Lbendereco.Caption := dao.Q1.fieldbyname('endereco').AsString + ', ' + dao.Q1.fieldbyname('nr_endereco').AsString;
  Lbbairro.Caption := dao.q1.fieldbyname('bairro').AsString;
  Lbcidade.Caption := dao.q1.fieldbyname('nom_cidade').AsString + ' / ' + dao.q1.fieldbyname('uf').AsString;
  Lbcep.Caption := dao.q1.fieldbyname('cep').AsString;
  Lbcpf.Caption := dao.q1.fieldbyname('cpf').AsString;
  Lbrg.Caption := dao.q1.fieldbyname('rg').AsString;
  Lbcnpj.Caption := dao.q1.fieldbyname('cnpj').AsString;
  Lbie.Caption := dao.q1.fieldbyname('ie').AsString;
  Lbfone.Caption := dao.q1.fieldbyname('telefone').AsString;
  Lbfax.Caption := dao.q1.fieldbyname('fax').AsString;
  lbemail.Caption := dao.q1.fieldbyname('email').AsString;
 // Lbhome_page.Caption:= dao.q1.fieldbyname('home_page').AsString;
  observacao.Text := dao.q1.fieldbyname('observacoes').AsString;


end;




procedure TFr_dados_cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    close;

  end;
end;

procedure TFr_dados_cliente.btcloseClick(Sender: TObject);
begin
  close;
end;

end.
