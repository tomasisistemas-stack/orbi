unit Un_sel_venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrSel_Venda = class(TForm)
    Label1: tsLabel;
    zztipo_venda: TsEdit;
    Label2: tsLabel;
    procedure zztipo_vendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure update_tipo_venda(num_doc: String);
  end;

var
  FrSel_Venda: TFrSel_Venda;

implementation

uses Un_dao, UnPri;

{$R *.dfm}

procedure TFrSel_Venda.update_tipo_venda(num_doc: String);
begin
  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
  dao.Execsql('update vendas1 set tipo_venda='+QuotedStr(zztipo_venda.Text)+' where numdoc='+QuotedStr(num_documento));
  dao.cn.Commit;
end;

procedure TFrSel_Venda.zztipo_vendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControlClass, true, true);
    key:=#0;
  end;

end;

end.
