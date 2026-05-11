unit alterar_status_ordem_producao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tfrm_alterar_status_ordem_producao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btOK: TButton;
    gbStatus: TGroupBox;
    cbStatus: TComboBox;
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    status : string;
  end;

var
  frm_alterar_status_ordem_producao: Tfrm_alterar_status_ordem_producao;

implementation

{$R *.dfm}

procedure Tfrm_alterar_status_ordem_producao.btOKClick(Sender: TObject);
begin
  status := cbStatus.Text;
  ModalResult := mrOk;
end;

end.
