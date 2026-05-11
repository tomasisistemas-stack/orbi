unit TesteImagensBd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, sPanel, sBitBtn,
  sLabel, sCheckBox, acDBGrid;

type
  Tfm_teste_imagens_bd = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    DBGrid1: Tdbgrid;
    DBImage1: TDBImage;
    Label1: tsLabel;
    Label2: tsLabel;
    dsSubCategoria: TDataSource;
    mmSubCategoria: TRxMemoryData;
    mmSubCategoriaID: TIntegerField;
    mmSubCategoriaSUBCATEGORIA: TStringField;
    mmSubCategoriaIMAGEM_BD: TBlobField;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_teste_imagens_bd: Tfm_teste_imagens_bd;

implementation

uses
  un_dao, UnFun, UnPri;

{$R *.dfm}

procedure Tfm_teste_imagens_bd.FormShow(Sender: TObject);
begin
  dao.Geral1('SELECT a.ID, a.SUBCATEGORIA, a.IMAGEM_BD FROM SUBCATEGORIA a');
  dao.Q1.First;
  if not mmSubCategoria.Active then
    mmSubCategoria.open;
  while not dao.q1.Eof do
  begin
    try
      mmSubCategoria.Append;
      mmSubCategoriaID.AsString := dao.q1.fieldbyname('id').AsString;
      mmSubCategoriaSUBCATEGORIA.AsString := dao.q1.fieldbyname('SUBCATEGORIA').AsString;

      TBlobField(dao.q1.fieldbyname('imagem_bd')).SaveToFile('foto.jpg');
      fmfun.ConverterJPegParaBmp('foto.jpg');
      mmSubCategoriaIMAGEM_BD.LoadFromFile('foto.bmp');

      DeleteFile('foto.bmp');
      DeleteFile('foto.jpg');

      mmSubCategoria.Post;
    except
      dao.envia_email_suporte('Erro de Imagem: ' + dao.q1.fieldbyname('id').AsString + '-' + dao.q1.fieldbyname('SUBCATEGORIA').AsString + #13 + 'Data: ' + frpri.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario + #13 + 'Máquina:' + FMFUN.COMPUTADOR + #13
        +
        'Versão:' + versao, 'Erro ORBI', 'claudioplasfan@terra.com.br', '', '',
        '');

    end;
    dao.q1.Next;
  end;
  dao.Q1.First;
end;

end.

