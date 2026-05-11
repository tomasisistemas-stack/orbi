unit Un_sel_atributo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, sBitBtn, sLabel, sCheckBox;

type
  TFrSel_Atributo = class(TForm)
    Gdid_Cor: TsComboEdit;
    Label20: tsLabel;
    LbCor: tsLabel;
    Gdid_tamanho: TsComboEdit;
    Label23: tsLabel;
    Lbtamanho: tsLabel;
    BitBtn1: TsBitBtn;
    procedure Gdid_CorButtonClick(Sender: TObject);
    procedure Gdid_CorKeyPress(Sender: TObject; var Key: Char);
    procedure Gdid_tamanhoButtonClick(Sender: TObject);
    procedure Gdid_tamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Gdid_CorExit(Sender: TObject);
    procedure Gdid_tamanhoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrSel_Atributo: TFrSel_Atributo;

implementation

uses Un_localizar, Un_dao, UnPri, Un_vendas;

{$R *.dfm}

procedure TFrSel_Atributo.Gdid_CorButtonClick(Sender: TObject);
var
//  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Cor';

  if mform = 'dev_consignacao' then
  begin
    chamou_pesquisa:= 'fr_cor';
    chamou_form := 'fr_dev_consignacao_cor';
    chamou_cadastro := 'fr_cor';
  end
  else
  if (mform = 'vendas') or (mform = 'devolucao_cliente') then
  begin
    chamou_pesquisa:= 'fr_cor';
    chamou_form := 'fr_vendas_cor';
    chamou_cadastro := 'fr_cor';
  end;

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cores';
  Fr_localizar.BT_cadastro.Visible:= true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

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

procedure TFrSel_Atributo.Gdid_CorKeyPress(Sender: TObject; var Key: Char);
var
//  q_campos_proponente: TFDQuery;
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if key=#13 then
  begin
    if (Gdid_Cor.Text ='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cor';

      if mform = 'dev_consignacao' then
      begin
        chamou_pesquisa:= 'fr_cor';
        chamou_form := 'fr_dev_consignacao_cor';
        chamou_cadastro := 'fr_cor';
      end
      else
      if (mform = 'vendas') or (mform = 'devolucao_cliente') then
      begin
        chamou_pesquisa:= 'fr_cor';
        chamou_form := 'fr_vendas_cor';
        chamou_cadastro := 'fr_cor';
      end;
      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cores';
      Fr_localizar.BT_cadastro.Visible:= true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Cor';

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

    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;

end;

procedure TFrSel_Atributo.Gdid_tamanhoButtonClick(Sender: TObject);
var
//  q_campos_proponente: TFDQuery;
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

  if mform = 'dev_consignacao' then
  begin
    chamou_pesquisa:= 'fr_tamanho';
    chamou_form := 'fr_dev_consignacao_tamanho';
    chamou_cadastro := 'fr_tamanho';
  end
  else
  if (mform = 'vendas') or (mform = 'devolucao_cliente') then
  begin
    chamou_pesquisa:= 'fr_tamanho';
    chamou_form := 'fr_vendas_tamanho';
    chamou_cadastro := 'fr_tamanho';
  end;

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Tamanhos';
  Fr_localizar.BT_cadastro.Visible:= true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

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

procedure TFrSel_Atributo.Gdid_tamanhoKeyPress(Sender: TObject;
  var Key: Char);
var
//  q_campos_proponente: TFDQuery;
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if key=#13 then
  begin
    if (Gdid_tamanho.Text ='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Tamanho';

      if mform = 'dev_consignacao' then
      begin
        chamou_pesquisa:= 'fr_tamanho';
        chamou_form := 'fr_dev_consignacao_tamanho';
        chamou_cadastro := 'fr_tamanho';
      end
      else
      if (mform = 'vendas') or (mform = 'devolucao_cliente') then
      begin
        chamou_pesquisa:= 'fr_tamanho';
        chamou_form := 'fr_vendas_tamanho';
        chamou_cadastro := 'fr_tamanho';
      end;

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+' Tamanhos';
      Fr_localizar.BT_cadastro.Visible:= true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Tamanho';

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

    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;

end;

procedure TFrSel_Atributo.BitBtn1Click(Sender: TObject);
begin
  Fr_vendas.sgx.Cells[7,lin]:= Gdid_Cor.Text;
  nom_cor:= LbCor.Caption;
  Fr_vendas.sgx.Cells[8,lin]:= Gdid_tamanho.Text;
  nom_tamanho:= Lbtamanho.Caption;

  close;

end;

procedure TFrSel_Atributo.Gdid_CorExit(Sender: TObject);
begin
  if  Gdid_Cor.Text <> '' then
  begin
    dao.Geral2('select cor from cores where id='+QuotedStr(Gdid_Cor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.Q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Gdid_Cor.Text:= '';
      Gdid_Cor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFrSel_Atributo.Gdid_tamanhoExit(Sender: TObject);
begin
  if Gdid_tamanho.Text <> '' then
  begin
    dao.Geral2('select tamanho from tamanho where id='+QuotedStr(Gdid_tamanho.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbtamanho.Caption := dao.Q2.fieldbyname('tamanho').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Gdid_tamanho.Text:= '';
      Gdid_tamanho.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFrSel_Atributo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
