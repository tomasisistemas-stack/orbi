
unit Un_funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, Buttons,
   Grids, BaseGrid, AdvGrid,  JvExStdCtrls,
  JvCheckBox, xmldom, XMLIntf, msxmldom, XMLDoc, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFr_funcionario = class(TForm)
    GroupBox1: TsGroupBox;
    pcrep: TPageControl;
    Panel1: tsPanel;
    tab_dados: TTabSheet;
    tab_comissao: TTabSheet;
    tab_metas: TTabSheet;
    Label1: tsLabel;
    Prcodigo: TsEdit;
    Prendereco: TsEdit;
    Label5: tsLabel;
    Prbairro: TsEdit;
    Label6: tsLabel;
    Label7: tsLabel;
    Prcep: TMaskEdit;
    Prfone: TMaskEdit;
    Label14: tsLabel;
    Label15: tsLabel;
    Prfax: TMaskEdit;
    Label16: tsLabel;
    Prfone_cel: TMaskEdit;
    Prcpf: TMaskEdit;
    Prrg: TMaskEdit;
    Label18: tsLabel;
    Label19: tsLabel;
    Label24: tsLabel;
    Premail: TsEdit;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    q_funcionario: TFDQuery;
    GroupBox4: TsGroupBox;
    Sg_meta: TAdvStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Prnome: TsEdit;
    Label2: tsLabel;
    BitBtn1: TsBitBtn;
    Prid_cidade: TsComboEdit;
    Label3: tsLabel;
    LbNom_cidade: tsLabel;
    PrPERC_COMISSAO_FIXA: TsCurrencyEdit;
    Label4: tsLabel;
    PrCNH: TMaskEdit;
    Label8: tsLabel;
    PrNReg: TMaskEdit;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrCod_cidadeButtonClick(Sender: TObject);
    procedure PRRazao_SocialKeyPress(Sender: TObject;
      var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure PRCod_cidadeButtonClick2(Sender: TObject);
    procedure PRRazao_SocialKeyPress2(Sender: TObject;
      var Key: Char);
    procedure Prid_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_cidadeExit(Sender: TObject);
    procedure Sg_comissaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prnr_bancoButtonClick(Sender: TObject);
    procedure Prnr_bancoExit(Sender: TObject);
    procedure Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure PrnomeKeyPress(Sender: TObject; var Key: Char);
    procedure Sg_comissaoCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure PrPERC_COMISSAO_FIXAEnter(Sender: TObject);
    procedure Sg_comissaoEnter(Sender: TObject);
    procedure zzcomissao_fixaClick(Sender: TObject);
    procedure Sg_comissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure InsLinha(var SGX: TAdvStringGrid);
    { Private declarations }
  public
    modo_insert: Boolean;
    id: string;

    procedure limpa_campos(prefixo: ShortString);
    procedure mostra_campos(prefixo: string);

    procedure readonly_true(prefixo: string);
    procedure readonly_false(prefixo: string);

    procedure ativa_representante(id: string);
    procedure ativa_comissao(id_representante: string);
    procedure ativa_metas(id_representante: string);

    procedure carrega_sg_comissao;

    procedure monta_sg_meta;
    procedure monta_sg_comissao;

    procedure grava_comissao;
    procedure AtualizaRepresentantesWeb;
    procedure DeletaRepresentantesWeb;
    { Public declarations }
  end;

var
  Fr_funcionario: TFr_funcionario;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun;

{$R *.dfm}

procedure TFr_funcionario.ativa_comissao(id_representante: string);
begin
  with q_comissao do
  begin
    close;
    sql.clear;
    sql.add('select * from comissao c ' +
      'where c.id_representante = ' + QuotedStr(id_representante));
    open;
  end;

end;

procedure TFr_funcionario.ativa_metas(id_representante: string);
begin
  with q_metas do
  begin
    close;
    sql.clear;
    sql.add('select * from metas_representante m ' +
      'where m.id_representante = ' + QuotedStr(id_representante));
    open;
  end;
end;

procedure TFr_funcionario.ativa_representante(id: string);
begin
  with q_representante do
  begin
    close;
    sql.clear;
    sql.add('select r.*, c.nom_cidade, c.uf, b.nr_banco, b.nom_banco from representante r ' +
      'left join banco b on b.id = r.nr_banco ' +
      'left join cidades c on c.cod_cidade = r.id_cidade ' +
      'where r.id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_funcionario.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    showmessage('Você deve escolher um representante para altera-lo!');
    exit;
  end;
  modo_insert := false;
  readonly_false('Pr');
  Sg_comissao.Options := Sg_comissao.Options + [goEditing];
  //habilita botões
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  prnom_representante.SetFocus;
  readonly_false('Pr');
end;

procedure TFr_funcionario.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos('Pr');
        Sg_comissao.Options := Sg_comissao.Options + [goEditing];
      end
      else
        if modo_insert = false then
        begin
          mostra_campos('Pr');
          Sg_comissao.Options := Sg_comissao.Options - [goEditing];
        end;
    end
    else
      exit;
  except
  end;
  readonly_true('Pr');
end;

procedure TFr_funcionario.btexcClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    showmessage('Selecione um representante para excluír primeiramente!');
    exit;
  end;
  if MessageDlg('Deseja excluír o representante?', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.Execsql('delete from representante where id =' + QuotedStr(Prid.Text));
      dao.Execsql('delete from comissao where id_representante =' + QuotedStr(Prid.Text));
      dao.cn.Commit;
      dao.msg('Representante excluído com sucesso!');
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro na exclusão do representante! ' +
          e.message);
      end;
    end;
  end;
  readonly_true('Pr');
end;

procedure TFr_funcionario.btgraClick(Sender: TObject);
begin
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
  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := False;
  btexc.Enabled := true;
  if zzcomissao_fixa.Checked = false then
    Prperc_comissao_fixa.text := '';
  Screen.Cursor := crSQLWait;
  if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
  if modo_insert then
  begin
    id := dao.insert('Pr', 'representante', 'id', Fr_representante, 'gen_representante');
    Prid.Text := id;
    ativa_representante(id);
    btNov.setFocus;
  end
  else
    dao.update('representante', 'id', Prid.Text, 'Pr', Fr_representante);
  grava_comissao;
  dao.cn.Commit;
  AtualizaRepresentantesWeb;
  ativa_comissao(prid.text);
  carrega_sg_comissao;
  Sg_comissao.Options := Sg_comissao.Options - [goEditing];
  Screen.Cursor := crDefault;
  readonly_true('Pr');

  if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
  dao.cn.Commit;
end;

procedure TFr_funcionario.DeletaRepresentantesWeb;
var
  TSConsulta: TStringList;
  Resposta: TStringStream;
  logado: string;
begin
  dao.Geral2('SELECT a.SITE, a.USUARIO_SITE, a.LOGIN_SITE FROM CONFIGURACAO a');

  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&login'] := dao.Q2.fieldbyname('USUARIO_SITE').AsString;
  TSConsulta.Values['&senha'] := dao.Q2.fieldbyname('LOGIN_SITE').AsString;
  try
    idHttpGeral.Post('http://' + dao.Q2.fieldbyname('site').AsString + 'admin/login_imp.php?', TSConsulta, Resposta);
  except
    exit;
  end;
  XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := True;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromStream(Resposta);
  logado := XMLGeral.DocumentElement.ChildNodes['resultado'].NodeValue;
  TSConsulta.Free;
  Resposta.Free;
  XMLGeral.Active := False;
  if logado = 'NÃO LOGADO' then
    exit;
  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&modo'] := 'deleta_representante';
  TSConsulta.Values['&id'] := Prid.Text;
  try
    idHttpGeral.Post('http://' + dao.Q2.fieldbyname('site').AsString + 'admin/importar.php?', TSConsulta, Resposta);
    TSConsulta.free;
  except
    exit;
  end;
end;

procedure TFr_funcionario.AtualizaRepresentantesWeb;
var
  TSConsulta: TStringList;
  Resposta: TStringStream;
  logado: string;
begin
  dao.Geral2('SELECT a.SITE, a.USUARIO_SITE, a.LOGIN_SITE FROM CONFIGURACAO a');

  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&login'] := dao.Q2.fieldbyname('USUARIO_SITE').AsString;
  TSConsulta.Values['&senha'] := dao.Q2.fieldbyname('LOGIN_SITE').AsString;
  try
    idHttpGeral.Post('http://' + dao.Q2.fieldbyname('site').AsString + 'admin/login_imp.php?', TSConsulta, Resposta);
  except
    exit;
  end;
  XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := True;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromStream(Resposta);
  logado := XMLGeral.DocumentElement.ChildNodes['resultado'].NodeValue;
  TSConsulta.Free;
  Resposta.Free;
  XMLGeral.Active := False;
  if logado = 'NÃO LOGADO' then
    exit;
  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&modo'] := 'representante';
  TSConsulta.Values['&id'] := Prid.Text;
  TSConsulta.Values['&nome'] := PrWeb_Nome.Text;
  TSConsulta.Values['&fone'] := Prcelular.Text;
  TSConsulta.Values['&cidades'] := PrWEB_CIDADES_ATUACAO.Text;
  TSConsulta.Values['&uf'] := PrUF_ATUACAO.Text;
  try
    idHttpGeral.Post('http://' + dao.Q2.fieldbyname('site').AsString + 'admin/importar.php?', TSConsulta, Resposta);
    TSConsulta.free;
  except
    exit;
  end;
end;


procedure TFr_funcionario.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  Sg_comissao.Options := Sg_comissao.Options + [goEditing];
  //habilita botões
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Limpa_campos('Pr');
  Prnom_representante.setfocus;
  readonly_false('Pr');
  sg_comissao.ClearNormalCells;
  sg_comissao.RowCount := 2;
end;

procedure TFr_funcionario.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else
        if Components[i] is TsComboEdit then
          TsComboEdit(components[i]).Clear
        else
          if Components[i] is TsCurrencyEdit then
            TsCurrencyEdit(components[i]).Clear
          else
            if Components[i] is TsDateEdit then
              TsDateEdit(components[i]).Clear
            else
              if Components[i] is TMaskEdit then
                TMaskEdit(components[i]).Clear
              else
                if Components[i] is tsCheckbox then
                  tsCheckbox(Components[i]).Checked := false;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    LbNom_cidade.Caption := '...';
  end;
end;

procedure TFr_funcionario.monta_sg_meta;
begin
  Sg_meta.Cells[0, 0] := 'Mês';
  Sg_meta.Cells[0, 1] := 'Meta';
  Sg_meta.Cells[0, 2] := 'Comissão';
  Sg_meta.Cells[0, 3] := 'Atingido';
  Sg_meta.Cells[1, 0] := 'Janeiro';
  Sg_meta.Cells[2, 0] := 'Fevereiro';
  Sg_meta.Cells[3, 0] := 'Março';
  Sg_meta.Cells[4, 0] := 'Abril';
  Sg_meta.Cells[5, 0] := 'Maio';
  Sg_meta.Cells[6, 0] := 'Junho';
  Sg_meta.Cells[7, 0] := 'Julho';
  Sg_meta.Cells[8, 0] := 'Agosto';
  Sg_meta.Cells[9, 0] := 'Setembro';
  Sg_meta.Cells[10, 0] := 'Outubro';
  Sg_meta.Cells[11, 0] := 'Novembro';
  Sg_meta.Cells[12, 0] := 'Dezembro';







end;

procedure TFr_funcionario.mostra_campos(prefixo: string);
var
  i: integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;

  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_representante.fieldbyname(campo1).AsFloat;
      end;
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end;
      if Components[i] is tsCheckbox then
      begin
        campo := tsCheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_representante.fieldbyname(campo1).AsString = 'S' then
          tsCheckbox(FindComponent(campo)).Checked := true
        else
          tsCheckbox(FindComponent(campo)).Checked := false;
      end;
      if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end;
    end;
  end; //end do for

  LbNom_cidade.Caption := q_representante.fieldbyname('nom_cidade').AsString + ' - ' +
    q_representante.fieldbyname('uf').AsString;
  Lb_banco.caption := q_representante.fieldbyname('nom_banco').AsString;

  Screen.Cursor := crDefault;

end;

procedure TFr_funcionario.readonly_false(prefixo: string);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else
        if Components[i] is TMaskEdit then
          TMaskEdit(components[i]).ReadOnly := false
        else
          if Components[i] is TsComboEdit then
            TsComboEdit(components[i]).ReadOnly := false
    end;
  end;

end;

procedure TFr_funcionario.readonly_true(prefixo: string);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else
        if Components[i] is TMaskEdit then
          TMaskEdit(components[i]).ReadOnly := True
        else
          if Components[i] is TsComboEdit then
            TsComboEdit(components[i]).ReadOnly := True;

    end;
  end;
end;

procedure TFr_funcionario.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  monta_sg_meta;
  monta_sg_comissao;

end;

procedure TFr_funcionario.monta_sg_comissao;
begin
  Sg_comissao.Cells[0, 0] := 'id';
  Sg_comissao.ColWidths[0] := 0;
  Sg_comissao.Cells[1, 0] := 'Desconto Inicial';
  Sg_comissao.Cells[2, 0] := 'Desconto Final';
  Sg_comissao.Cells[3, 0] := '% Comissão';
end;

procedure TFr_funcionario.PrCod_cidadeButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_representate';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_funcionario.PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_funcionario.BitBtn1Click(Sender: TObject);
var
  //q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Btnov.enabled = false then
  begin
    showmessage('Você deve gravar ou cancelar as informações antes de localizar!');
    exit;
  end;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.visible := false;

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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_funcionario.PRCod_cidadeButtonClick2(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_representante_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
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

procedure TFr_funcionario.PRRazao_SocialKeyPress2(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_funcionario.Prid_cidadeKeyPress(Sender: TObject;
  var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if key = #13 then
  begin
    if (Prid_cidade.text <> '') then
    begin
      SelectNext(sender as TWinControl, true, true);
      key := #0;
    end;
    if (Prid_cidade.text = '') and (Btgra.Enabled = true) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_representante_cidade';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

      for i := 0 to 1 do
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
  end;
end;

procedure TFr_funcionario.Prid_cidadeExit(Sender: TObject);
begin
  if trim(PRid_cidade.Text) = '' then
    LbNom_cidade.Caption := '...';

  if PRid_cidade.Text <> '' then
  begin
    dao.Geral2('select nom_cidade, uf from cidades where cod_cidade=' + QuotedStr(PRid_cidade.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cidade.Caption := dao.Q2.fieldbyname('nom_cidade').AsString + ' - ' +
        dao.Q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PRid_cidade.Text := '';
      PRid_cidade.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_funcionario.Sg_comissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (zzcomissao_fixa.Checked) then
  begin
    if key = #13 then
    begin
      if (Sg_comissao.Cells[1, sg_comissao.Row] <> '') and //Verifica se todos os campos daquela linha estao preenchidos
        (Sg_comissao.Cells[2, sg_comissao.Row] <> '') and
        (Sg_comissao.Cells[3, sg_comissao.Row] <> '')
        then
      begin
        if (Sg_comissao.row = sg_comissao.RowCount - 1) and (Sg_comissao.cells[1, Sg_comissao.RowCount - 1] <> '') then
          Sg_comissao.AddRow;
      end;
    end;
  end;
end;

procedure TFr_funcionario.InsLinha(var SGX: TAdvStringGrid);
begin
  sgx.Col := 1;
  SGX.AddRow;
  SGX.Row := SGX.Row + 1;
  lin := sgx.Row;
end;

procedure TFr_funcionario.grava_comissao;
var
  i: integer;
  cmd: string;
  campo: string;
  valor: string;
  id_repres: string;
  perc_min, perc_max, perc_comissao: string;
  comando_sql: string;
  x: integer;
begin
  if not (dao.cn.InTransaction) then (dao.cn.StartTransaction);
  if Prid.Text <> '' then
    dao.Execsql('delete from comissao where id_representante=' + QuotedStr(Prid.Text));

  if (zzcomissao_fixa.Checked) then
  begin
    if PrPERC_COMISSAO_FIXA.Text = '' then
      dao.Execsql('insert into representante (perc_comissao_fixa) values (' + quotedstr('0') + ')')
    else
      dao.Execsql('insert into representante (perc_comissao_fixa) values (' + quotedstr(FMFUN.prepara_valor(Prperc_comissao_fixa.Text)) + ')');
    exit;
  end;
  for i := 1 to Sg_comissao.RowCount - 1 do
  begin
    if sg_comissao.cells[2, i] <> '' then
    begin
      dao.Execsql('insert into comissao (id_representante, perc_minimo, perc_maximo, perc_comissao) values (' + QuotedStr(Prid.Text) + ',' + QuotedStr(FMFUN.prepara_valor(Sg_comissao.Cells[1, i])) +
        ',' + QuotedStr(fmfun.prepara_valor(Sg_comissao.Cells[2, i])) + ',' + QuotedStr(fmfun.prepara_valor(Sg_comissao.Cells[3, i])) + ')');
      dao.Execsql('update representante set perc_comissao_fixa =' + quotedstr('0') + ' where id =' + quotedstr(prid.text));
    end;
  end;
end;

procedure TFr_funcionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    close;
  end;
end;

procedure TFr_funcionario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Você deve Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_funcionario.Prnr_bancoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar banco';
  chamou_pesquisa := 'fr_banco';
  chamou_form := 'fr_representante_banco';
  chamou_cadastro := 'Fr_banco';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do banco';
  Campos_combo[2] := 'Número do banco';

  for i := 0 to 2 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;
  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_funcionario.Prnr_bancoExit(Sender: TObject);
begin
  if Prnr_banco.text = '' then
    Lb_banco.caption := '...';
  if Prnr_banco.text <> '' then
  begin
    dao.Geral1('select id, nom_banco from banco where id =' + quotedstr(Prnr_banco.text));
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


procedure TFr_funcionario.Prnr_bancoKeyPress(Sender: TObject;
  var Key: Char);
var
  valor_combo: string;
  i: integer;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  Campos_combo: array of string;
begin
  if (key = #13) and (Prnr_banco.text <> '') then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
  if (key = #13) and (prnr_banco.text = '') then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar banco';
    chamou_pesquisa := 'fr_banco';
    chamou_form := 'fr_representante_banco';
    chamou_cadastro := 'Fr_banco';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Código';
    Campos_combo[1] := 'Nome do banco';
    Campos_combo[2] := 'Número do banco';

    for i := 0 to 2 do
    begin
      valor_combo := campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(valor_combo);
    end;
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  end;
end;


procedure TFr_funcionario.PrnomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_funcionario.Sg_comissaoCellChanging(Sender: TObject;
  OldRow, OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  if newcol = 0 then
  begin
    allow := false;
    Sg_comissao.cells[oldcol, sg_comissao.Row];
  end;
end;

procedure TFr_funcionario.PrPERC_COMISSAO_FIXAEnter(Sender: TObject);
begin
  if zzcomissao_fixa.Checked = true then
    Sg_comissao.Enabled := false
  else
    Sg_comissao.Enabled := true;
end;

procedure TFr_funcionario.Sg_comissaoEnter(Sender: TObject);
begin
  if zzcomissao_fixa.Checked = true then
    Sg_comissao.Enabled := false
  else
    Sg_comissao.Enabled := true;
end;

procedure TFr_funcionario.zzcomissao_fixaClick(Sender: TObject);
begin
  if zzcomissao_fixa.Checked = true then
    Sg_comissao.Enabled := false
  else
    Sg_comissao.Enabled := true;
end;

procedure TFr_funcionario.carrega_sg_comissao;
var
  x: integer;
begin
  sg_comissao.ClearNormalCells;
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
      sg_comissao.cells[3, x] := q_comissao.fieldbyname('perc_comissao').AsString;
      q_comissao.Next;
      if not q_comissao.eof then
      begin
        sg_comissao.addrow;
        x := x + 1;
      end;
    end;
  end;
end;

procedure TFr_funcionario.Sg_comissaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then
  begin
    if (sg_comissao.Cells[0, sg_comissao.row] <> '') and (btalt.enabled = false) then
    begin
      dao.Execsql('delete from comissao where id =' + quotedstr(sg_comissao.Cells[0, sg_comissao.row]));
      dao.cn.commit;
      ativa_comissao(prid.Text);
      carrega_sg_comissao;
    end;
  end;
end;

end.

