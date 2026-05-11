unit Un_dados_fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids,
  BaseGrid, AdvGrid, StdCtrls, Buttons, sSpeedButton, sLabel, sCheckBox, AdvObj;

type
  TFr_dados_fornecedor = class(TForm)
    Lbrazao_social: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure btcloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure monta_sgContato;
    procedure busca_dados_contato(cod_for: string);
    procedure monta_dados_contato;

    procedure Busca_dados_fornecedor(cod_for: string);
    procedure monta_dados_fornecedor;


    { Public declarations }
  end;

var
  Fr_dados_fornecedor: TFr_dados_fornecedor;

implementation

uses Un_dao;

{$R *.dfm}

{ TFr_dados_fornecedor }

procedure TFr_dados_fornecedor.Busca_dados_fornecedor(cod_for: string);
begin
  dao.Geral1('select a.COD_FORNECEDOR, a.RAZAO_SOCIAL, a.FANTASIA, a.TIP_PESSOA, a.ENDERECO, ' +
    'a.BAIRRO, a.COD_CIDADE, a.CEP, a.FONE, a.FAX, a.CNPCPF, a.IERG, a.EMAIL, a.HOME_PAGE, ' +
    'a.LUCRO_DEFINIDO, a.TIPO_EMPRESA, a.USO_PREPEDIDO, a.INATIVO, a.COMPLEMENTO, ' +
    'a.NR_ENDERECO, a.NFE_EMAIL, ' +
    'c.nom_cidade, c.uf from fornecedor a ' +
    'left join cidades c on c.cod_cidade = a.cod_cidade ' +
    'where a.cod_fornecedor=' + QuotedStr(cod_for));
  if dao.Q1.RecordCount > 0 then
    monta_dados_fornecedor;
end;

procedure TFr_dados_fornecedor.monta_dados_fornecedor;
begin
  Lbrazao_social.Caption := dao.q1.fieldbyname('razao_social').AsString;
  //LbFantasia.Caption := dao.q1.fieldbyname('fantasia').AsString;
  Lbendereco.Caption := dao.q1.fieldbyname('endereco').AsString;
  Lbbairro.Caption := dao.q1.fieldbyname('bairro').AsString;
  Lbcidade.Caption := dao.q1.fieldbyname('nom_cidade').AsString + ' / ' + dao.q1.fieldbyname('uf').AsString;
  Lbcep.Caption := dao.q1.fieldbyname('cep').AsString;
  Lbcnpj.Caption := dao.q1.fieldbyname('cnpcpf').AsString;
  Lbie.Caption := dao.q1.fieldbyname('ierg').AsString;
  Lbfone.Caption := dao.q1.fieldbyname('fone').AsString;
  Lbfax.Caption := dao.q1.fieldbyname('fax').AsString;
  lbemail.Caption := dao.q1.fieldbyname('email').AsString;
  //Lbhome_page.Caption := dao.q1.fieldbyname('home_page').AsString;




end;

procedure TFr_dados_fornecedor.monta_sgContato;
begin

end;

procedure TFr_dados_fornecedor.FormShow(Sender: TObject);
begin
  monta_sgContato;
end;

procedure TFr_dados_fornecedor.btcloseClick(Sender: TObject);
begin
  close;
end;

procedure TFr_dados_fornecedor.busca_dados_contato(cod_for: string);
begin
  dao.Geral1('select * from fornecedor_contato ');
  if dao.Q1.RecordCount > 0 then
    monta_dados_contato;
end;

procedure TFr_dados_fornecedor.monta_dados_contato;
begin

end;

end.
