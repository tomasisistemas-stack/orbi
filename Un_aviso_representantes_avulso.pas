unit Un_aviso_representantes_avulso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Grids,  ComCtrls, frxClass,
  DB, frxDBSet, ACBrBase, ACBrExtenso, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sEdit, sToolEdit, sCurrencyEdit, sComboEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_Aviso_Representantes_Avulso = class(TForm)
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Prid: TsEdit;
    lbForn: tsLabel;
    LbNom_fornecedor: tsLabel;
    lbTexto: tsLabel;
    fR_RELATORIO: TfrxReport;
    dst_recibo: TfrxDBDataset;
    q_aviso: TFDQuery;
    ACBrExtenso1: TACBrExtenso;
    PrASSUNTO: TsEdit;
    BtnEnviar: TsBitBtn;
    PrTEXTO: TMemo;
    q_avisoID: TIntegerField;
    q_avisoDATA_ENVIO: TDateField;
    q_avisoASSUNTO: TStringField;
    q_avisoTEXTO: TStringField;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PridKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure PrTEXTOChange(Sender: TObject);
  private
    { Private declarations }
  public
    tipo: string;
    { Public declarations }
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure mostra_campos(prefixo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    procedure ativa_aviso(id: string); //carrega a Q_cidade
  end;

var
  Fr_Aviso_Representantes_Avulso: TFr_Aviso_Representantes_Avulso;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar, unfun, un_ncm, un_aviso_representantes;

{$R *.dfm}

procedure TFr_Aviso_Representantes_Avulso.btaltClick(Sender: TObject);
begin
  try
    if PrID.Text = '' then
    begin
      dao.msg('Selecione um Recibo para Alterar!');
      exit;
    end;

    modo_insert := false;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;

  except
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;
      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        mostra_campos(PrID.Text);
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if PrID.Text = '' then
  begin
    showmessage('Não é possivel excluir este Aviso por não ter Código!');
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Aviso?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.delete('id', q_aviso.fieldbyname('id').AsString, 'AVISO_REPRESENTANTES_AVULSO');
    dao.cn.Commit;
    Limpa_campos;
      except
        dao.cn.Rollback;
        exit;
      end;
  end;
  // mostra_campos('');

end;

procedure TFr_Aviso_Representantes_Avulso.btgraClick(Sender: TObject);
begin
  try
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'AVISO_REPRESENTANTES_AVULSO', 'id', Fr_Aviso_Representantes_Avulso, 'gen_Aviso_Representante_Avulso');
      PrId.Text := id;
      ativa_aviso(id);
      btNov.setFocus;
    end
    else
      dao.update('AVISO_REPRESENTANTES_AVULSO', 'id', Prid.Text, 'Pr', Fr_Aviso_Representantes_Avulso);

    dao.cn.Commit;
    readonly_true;

  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    Limpa_campos;
    PrAssunto.setfocus;
  except

  end;
end;

procedure TFr_Aviso_Representantes_Avulso.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Aviso Representação';
  chamou_pesquisa := 'fr_aviso';
  chamou_form := 'fr_aviso';
  chamou_cadastro := 'Fr_aviso';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Avisos';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Assunto';
  Campos_combo[2] := 'Texto';

  for i := 0 to 2 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_aviso(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_Aviso_Representantes_Avulso.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = 'Pr' then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear
      else if Components[i] is TMemo then
        TMemo(components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex := 0;
    end;
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

end;

procedure TFr_Aviso_Representantes_Avulso.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.mostra_campos(prefixo: string);
var
  campo, campo1: string; //campo tem o nome do  sem tirar as primeiras letras
  //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TsEdit(FindComponent(campo)).Text := q_aviso.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsComboEdit(FindComponent(campo)).Text := q_aviso.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsCurrencyEdit(FindComponent(campo)).Value := q_aviso.fieldbyname(campo1).AsFloat;
    end
    else if Components[i] is TsDateEdit then
    begin
      campo := TsDateEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsDateEdit(FindComponent(campo)).Date := q_aviso.fieldbyname(campo1).AsDateTime;
    end
    else if Components[i] is TComboBox then
    begin
      campo := TComboBox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TComboBox(FindComponent(campo)).ItemIndex := q_aviso.fieldbyname(campo1).AsInteger;
    end
    else if Components[i] is TMaskEdit then
    begin
      campo := TMaskEdit(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TMaskEdit(FindComponent(campo)).Text := q_aviso.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TMemo then
    begin
      campo := TMemo(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TMemo(FindComponent(campo)).Text := q_aviso.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TRichEdit then
    begin
      campo := TRichEdit(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TRichEdit(FindComponent(campo)).Text := q_aviso.fieldbyname(campo1).AsString;
    end

    else if Components[i] is TDateTimePicker then
    begin
      campo := TDateTimePicker(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TDateTimePicker(FindComponent(campo)).DateTime := q_aviso.fieldbyname(campo1).AsDateTime;
    end;
  end;
  lbTexto.Caption := 'Texto: (' + inttostr(200 - PrTEXTO.GetTextLen) + ' caracteres)';
end;

procedure TFr_Aviso_Representantes_Avulso.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_Aviso_Representantes_Avulso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    if (ActiveControl.Name = 'PrTEXTO') then
      exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_Aviso_Representantes_Avulso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_Aviso_Representantes_Avulso.ativa_aviso(id: string);
begin
  with q_aviso do
  begin
    close;
    SQL.Clear;
    SQL.add('SELECT a.ID, a.DATA_ENVIO, a.ASSUNTO, a.TEXTO FROM AVISO_REPRESENTANTES_AVULSO a where a.id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_Aviso_Representantes_Avulso.Button1Click(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('Você deve Gravar o Aviso que está cadastrando!');
    btgra.SetFocus;
    Exit;

  end;
end;

procedure TFr_Aviso_Representantes_Avulso.BtnEnviarClick(Sender: TObject);
begin

  if trim(Prid.text) = '' then
  begin
    showmessage('Código tem que ser preenchido!');
    Prid.SetFocus;
    exit;
  end;

  if trim(PrASSUNTO.text) = '' then
  begin
    showmessage('Assunto tem que ser preenchido!');
    PrASSUNTO.SetFocus;
    exit;
  end;

  if trim(PrTEXTO.text) = '' then
  begin
    showmessage('Texto tem que ser preenchido!');
    PrTEXTO.SetFocus;
    exit;
  end;

  if MessageDlg('Enviar SMS e Email de Aviso aos Representantes?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
  begin
    Application.CreateForm(Tfm_aviso_representantes, fm_aviso_representantes);
    fm_aviso_representantes.Assunto_Aviso := prAssunto.Text;
    fm_aviso_representantes.Texto_Aviso := prTexto.Text + #13;
    fm_aviso_representantes.Anexo := '';
    fm_aviso_representantes.ShowModal;
  end;

end;

procedure TFr_Aviso_Representantes_Avulso.PrTEXTOChange(Sender: TObject);
begin
  lbTexto.Caption := 'Texto: (' + inttostr(200 - PrTEXTO.GetTextLen) + ' caracteres)';
end;

end.


