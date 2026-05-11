unit Un_veiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, 
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, ComCtrls, sPageControl, Grids,
  DBGrids, acDBGrid, acDBTextFX, sBevel, DB, sComboEdit,
  sCurrEdit, sCurrencyEdit,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfr_veiculo = class(TForm)
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    q_veiculos: TFDQuery;
    pgVeiculos: TsPageControl;
    TabVeiculo: TsTabSheet;
    Label1: TsLabel;
    Prid: TsEdit;
    Label2: TsLabel;
    Prnom_veiculo: TsEdit;
    Label3: TsLabel;
    Label4: TsLabel;
    Prdt_aquisicao: TsDateEdit;
    TabDespesas: TsTabSheet;
    sPanel1: TsPanel;
    sDBGrid1: Tdbgrid;
    Panel3: TsPanel;
    BtNovEm: TsBitBtn;
    BtAltEm: TsBitBtn;
    pnSaldo: TsPanel;
    sBevel1: TsBevel;
    sDBTextFX1: TsDBTextFX;
    sLabel1: TsLabel;
    q_despesas: TFDQuery;
    ds_despesas: TDataSource;
    q_total_despesas: TFDQuery;
    ds_total_despesas: TDataSource;
    Lbl_Colaborador: TsLabel;
    ftcod_fornecedor: TsComboEdit;
    LbFornecedor: TsLabel;
    sLabel2: TsLabel;
    ftMovDe: TsDateEdit;
    sLabel3: TsLabel;
    ftMovAte: TsDateEdit;
    ftNota: TsCurrencyEdit;
    sLabel4: TsLabel;
    BtEmConsulta: TsBitBtn;
    tabConsumo: TsTabSheet;
    q_consumo: TFDQuery;
    ds_consumo: TDataSource;
    sDBGrid2: Tdbgrid;
    PrHodometro_Inicial: TsCurrencyEdit;
    sLabel5: TsLabel;
    gbProximaRevisao: TsGroupBox;
    PrPROXIMA_REVISAO_DATA: TsDateEdit;
    PrPROXIMA_REVISAO_HODOMETRO: TsCurrencyEdit;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    PrRenavam: TsMaskEdit;
    sLabel9: TsLabel;
    PrTara: TsCurrencyEdit;
    sLabel10: TsLabel;
    PrCapKg: TsCurrencyEdit;
    sLabel11: TsLabel;
    PrCapm3: TsCurrencyEdit;
    PrTipoRodado: TsRadioGroup;
    PrTipoCarroceria: TsRadioGroup;
    sLabel12: TsLabel;
    PrUF: TsEdit;
    q_despesasid_veiculo: TIntegerField;
    q_despesasnr_documento: TIntegerField;
    q_despesasdta_documento: TDateField;
    q_despesascod_fornecedor: TIntegerField;
    q_despesasfornecedor: TMemoField;
    q_despesasvl_total: TBCDField;
    q_total_despesastotal: TFMTBCDField;
    q_consumoid: TIntegerField;
    q_consumonr_documento: TIntegerField;
    q_consumodta_documento: TDateField;
    q_consumofornecedor: TMemoField;
    q_consumoproduto: TMemoField;
    q_consumohodometro_anterior: TIntegerField;
    q_consumohodometro: TIntegerField;
    q_consumoqtd_entrada: TBCDField;
    q_consumocusto_final: TBCDField;
    q_consumosub_total: TBCDField;
    q_consumomedia_consumo: TFMTBCDField;
    Prplaca: TsEdit;
    procedure btnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_veiculoKeyPress(Sender: TObject; var Key: Char);
    procedure PrplacaKeyPress(Sender: TObject; var Key: Char);
    procedure Prdt_aquisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PridEnter(Sender: TObject);

    procedure BtNovEmClick(Sender: TObject);
    procedure BtAltEmClick(Sender: TObject);
    procedure BtEmConsultaClick(Sender: TObject);
    procedure ftcod_fornecedorButtonClick(Sender: TObject);
    procedure ftcod_fornecedorExit(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_false(prefixo: string);
    procedure readonly_true(prefixo: string);
    procedure CarregaDespesas;

  public
    tipo: string;
    id: string;
    modo_insert: Boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure ativa_veiculos(id: string);
    procedure mostra_campos(prefixo: string);
  end;

var
  fr_veiculo: Tfr_veiculo;

implementation

uses UnPri, Un_dao, Un_localizar, Un_entrada;

{$R *.dfm}

{ TForm1 }

procedure Tfr_veiculo.ativa_veiculos(id: string);
begin

  with q_veiculos do
  begin
    close;
    sql.Clear;
    sql.Add('select * from veiculos where id =' + quotedstr(id));
    open;
  end;

end;

procedure Tfr_veiculo.CarregaDespesas;
var
  sql, sql_aux: string;
begin
  sql := 'SELECT DISTINCT     ' +
    '  e2.ID_VEICULO,  ' +
    '  e1.NR_DOCUMENTO,  ' +
    '  e1.DTA_DOCUMENTO, ' +
    '  f.COD_FORNECEDOR, ' +
    '  f.COD_FORNECEDOR||''-''||f.RAZAO_SOCIAL as FORNECEDOR, ' +
    '  e1.VL_TOTAL       ' +
    'FROM ENTRADA1 e1    ' +
    'INNER JOIN FORNECEDOR f on f.COD_FORNECEDOR = e1.COD_FORNECEDOR ' +
    'INNER JOIN ENTRADA2 e2 on e2.NR_DOCUMENTO = e1.NR_DOCUMENTO and e2.COD_FORNECEDOR = e1.COD_FORNECEDOR ' +
    'INNER JOIN PRODUTO p on p.COD_PRODUTO = e2.COD_PRODUTO ' +
    'INNER JOIN VEICULOS v on v.ID = e2.ID_VEICULO ' +
    'where e2.ID_VEICULO = ' + Prid.Text;

  sql_aux := '';

  if ftNota.Value > 0 then
    sql_aux := sql_aux + ' and e1.NR_DOCUMENTO = ' + ftNota.Text;

  if trim(ftcod_fornecedor.Text) <> '' then
    sql_aux := sql_aux + ' and e1.COD_FORNECEDOR = ' + ftcod_fornecedor.Text;

  if ftMovDe.Date > 0 then
    sql_aux := sql_aux + ' and e1.DTA_DOCUMENTO >= ' + QuotedStr(formatdatetime('dd.mm.yyyy', ftMovDe.Date));

  if ftMovAte.Date > 0 then
    sql_aux := sql_aux + ' and e1.DTA_DOCUMENTO <= ' + QuotedStr(formatdatetime('dd.mm.yyyy', ftMovAte.Date));

  q_despesas.Close;
  q_despesas.sql.Clear;
  q_despesas.sql.Text := sql + sql_aux + ' ORDER BY DTA_DOCUMENTO DESC, NR_DOCUMENTO';
  q_despesas.Open;

  sql := 'SELECT distinct '+
         '  coalesce(sum(coalesce(e1.VL_TOTAL,0)),0) as total '+
         'FROM ENTRADA1 e1 '+
         'where '+
         ' 0 <                '+
         ' (                  '+
         '   select count(*)  '+
         '   from ENTRADA2 e2 '+
         '   INNER JOIN VEICULOS v on v.ID = e2.ID_VEICULO '+
         '   where                                       '+
         '     e1.NR_DOCUMENTO   = e2.NR_DOCUMENTO and   '+
         '     e1.COD_FORNECEDOR = e2.COD_FORNECEDOR and '+
         '     e2.ID_VEICULO = '+ Prid.Text +
         ' ) ';

  q_total_despesas.Close;
  q_total_despesas.sql.Clear;
  q_total_despesas.sql.Text := sql + sql_aux;
  q_total_despesas.Open;

  q_consumo.Close;
  q_consumo.ParamByName('veiculo').AsInteger := StrToInt(Prid.Text);
  q_consumo.Open;

end;

procedure Tfr_veiculo.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear
    else
      if components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Clear;
  end;
end;


procedure Tfr_veiculo.mostra_campos(prefixo: string);
var
  campo, campo1: string;
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_veiculos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_veiculos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_veiculos.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if not q_veiculos.fieldbyname(campo1).isnull then
          TComboBox(FindComponent(campo)).ItemIndex := q_veiculos.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_veiculos.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_veiculos.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_veiculos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TDateTimePicker then
      begin
        campo := TDateTimePicker(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TDateTimePicker(FindComponent(campo)).DateTime := q_veiculos.fieldbyname(campo1).AsDateTime;
      end;
    end;

  end; // end do for



  CarregaDespesas;

end;

procedure Tfr_veiculo.readonly_false(prefixo: string);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false;
      if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false;
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;
end;


procedure Tfr_veiculo.readonly_true(prefixo: string);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true;
      if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true;
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;
    end;
  end;
end;


procedure Tfr_veiculo.btnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  Prnom_veiculo.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
  Limpa_campos;
end;

procedure Tfr_veiculo.btaltClick(Sender: TObject);
begin
  try
    if Prid.Text = '' then
    begin
      dao.msg('Localize um veiculo antes de alterar!');
      exit;
    end;
    modo_insert := false;
    readonly_false('Pr');
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
  except
  end;
end;

procedure Tfr_veiculo.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select placa from veiculos where placa=' + QuotedStr(Prplaca.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('Já existe um veiculo cadastrado com esta placa, o carro que esta cadastrado com esta placa é' + q_veiculos.fieldbyname('nom_veiculo').AsString);
        Prplaca.SetFocus;
        Exit;
      end;
    end;
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'veiculos', 'id', Fr_veiculo, 'gen_veiculo');
      Prid.Text := id;
      ativa_veiculos(id);
      btNov.setFocus;
    end
    else
      dao.update('veiculos', 'id', q_veiculos.fieldbyname('id').AsString, 'Pr', Fr_veiculo);
    dao.cn.commit;
    readonly_true('Pr');
  except
    dao.cn.Rollback;
  end;
end;



procedure Tfr_veiculo.btcanClick(Sender: TObject);
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
        readonly_true('Pr');
      end
      else
        if modo_insert = false then
        begin
          mostra_campos(Prid.Text);
          readonly_true('Pr');
        end;
    end
    else
      exit;
  except
  end;
end;

procedure Tfr_veiculo.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir este carro, pois não esta com código!');
    Prid.SetFocus;
    Exit;
  end;
  if MessageDlg('Tem certeza que deseja excluir este veiculo?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
      if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.delete('id', q_veiculos.fieldbyname('id').AsString, 'veiculos');
      dao.cn.Commit;
      Limpa_campos;
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure Tfr_veiculo.btproClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar veiculos';
  chamou_pesquisa := 'fr_veiculos';
  chamou_form := 'fr_veiculos';
  chamou_cadastro := 'fr_veiculos';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'veiculos';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do veiculo';
  Campos_combo[2] := 'Placa';
  Campos_combo[3] := 'Data de aquisição';

  for i := 0 to 3 do
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
    Fr_localizar.loc_veiculos(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure Tfr_veiculo.FormCloseQuery(Sender: TObject;
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


procedure Tfr_veiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure Tfr_veiculo.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;


procedure Tfr_veiculo.Prnom_veiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;


procedure Tfr_veiculo.PrplacaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;


procedure Tfr_veiculo.Prdt_aquisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_veiculo.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  ftMovDe.Date  := now-30;
  ftMovAte.Date := now;
end;

procedure Tfr_veiculo.PridEnter(Sender: TObject);
begin
  Prid.ReadOnly := true;
end;


procedure Tfr_veiculo.BtNovEmClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_entrada, Fr_entrada);
    Fr_entrada.servico := true;
    Fr_entrada.servico_insercao := true;
    Fr_entrada.veiculo := Prid.text;
    Fr_entrada.ShowModal;
  finally
    Fr_entrada.Free;
    q_despesas.Refresh;
    q_total_despesas.Refresh;
  end;
end;

procedure Tfr_veiculo.BtAltEmClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_entrada, Fr_entrada);
    Fr_entrada.servico := true;
    Fr_entrada.servico_alteracao := true;
    Fr_entrada.veiculo := Prid.text;
    Fr_entrada.numdoc := q_despesasNR_DOCUMENTO.AsString;
    Fr_entrada.fornecedor := q_despesasCOD_FORNECEDOR.AsString;
    Fr_entrada.ShowModal;
  finally
    Fr_entrada.Free;
    q_despesas.Refresh;
    q_total_despesas.Refresh;
  end;
end;

procedure Tfr_veiculo.BtEmConsultaClick(Sender: TObject);
begin
  CarregaDespesas;
end;

procedure Tfr_veiculo.ftcod_fornecedorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_veiculos_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

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

procedure Tfr_veiculo.ftcod_fornecedorExit(Sender: TObject);
begin
  if ftcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(ftcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      ftcod_fornecedor.Text := '';
      ftcod_fornecedor.SetFocus;
      Exit;
    end;
  end;
end;

end.








