
unit Un_representante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, Buttons,
   Grids, BaseGrid, AdvGrid,  JvExStdCtrls,
  JvCheckBox;

type
  TFr_representante = class(TForm)
    GroupBox1: TsGroupBox;
    pcrep: TPageControl;
    Panel1: tsPanel;
    tab_dados: TTabSheet;
    tab_comissao: TTabSheet;
    tab_metas: TTabSheet;
    Label1: tsLabel;
    Prid: TsEdit;
    Label4: tsLabel;
    Prnom_empresa: TsEdit;
    Prendereco: TsEdit;
    Label5: tsLabel;
    Prbairro: TsEdit;
    Label6: tsLabel;
    Label7: tsLabel;
    Prcep: TMaskEdit;
    Label13: tsLabel;
    Prcnpj: TMaskEdit;
    Prfone: TMaskEdit;
    Label14: tsLabel;
    Label15: tsLabel;
    Prfax: TMaskEdit;
    Label16: tsLabel;
    Prcelular: TMaskEdit;
    Label17: tsLabel;
    Prie: TMaskEdit;
    Prcpf: TMaskEdit;
    Prrg: TMaskEdit;
    Label18: tsLabel;
    Label19: tsLabel;
    GroupBox2: TsGroupBox;
    Label20: tsLabel;
    Prnr_conta_corrente: TsEdit;
    Label21: tsLabel;
    Prnr_agencia: TsEdit;
    Prnr_banco: TsComboEdit;
    Label23: tsLabel;
    Banco: tsLabel;
    Label24: tsLabel;
    Premail: TsEdit;
    Label25: tsLabel;
    Prhome_page: TsEdit;
    GroupBox3: TsGroupBox;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    q_representante: TFDQuery;
    q_comissao: TFDQuery;
    q_metas: TFDQuery;
    GroupBox4: TsGroupBox;
    Sg_meta: TAdvStringGrid;
    Sg_comissao: TAdvStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Prnom_representante: TsEdit;
    Label2: tsLabel;
    zzcomissao_fixa: tsCheckbox;
    Prperc_comissao_fixa: TsCurrencyEdit;
    BitBtn1: TsBitBtn;
    Prid_cidade: TsComboEdit;
    Label3: tsLabel;
    LbNom_cidade: tsLabel;
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
    procedure Prnom_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure PRCod_cidadeButtonClick2(Sender: TObject);
    procedure PRRazao_SocialKeyPress2(Sender: TObject;
  var Key: Char);
    procedure Prid_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_cidadeExit(Sender: TObject);
    procedure Sg_comissaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure InsLinha(var SGX: TAdvStringGrid);
    { Private declarations }
  public
    modo_insert : Boolean;
    id, edit_sg: String;

    procedure limpa_campos(prefixo : ShortString);
    procedure mostra_campos(prefixo : String);
    procedure readonly_true(prefixo : String);
    procedure readonly_false(prefixo : String);
    procedure ativa_representante(id : String);
    procedure ativa_comissao(id_representante : String);
    procedure ativa_metas(id_representante : String);
    procedure monta_sg_meta;
    procedure monta_sg_comissao;

    procedure grava_comissao(id_representante: String);

    { Public declarations }
  end;

var
  Fr_representante: TFr_representante;

implementation

uses Un_dao, UnPri, Un_localizar;

{$R *.dfm}

procedure TFr_representante.ativa_comissao(id_representante: String);
begin
  with q_comissao do
  begin
    close;
    sql.clear;
    sql.add('select * from comissao c '+
            'where c.id_representante = '+QuotedStr(id_representante));
    open;
  end;

end;

procedure TFr_representante.ativa_metas(id_representante : String);
begin
  with q_metas do
  begin
    close;
    sql.clear;
    sql.add('select * from metas_representante m '+
            'where m.id_representante = '+QuotedStr(id_representante));
    open;
  end;
end;

procedure TFr_representante.ativa_representante(id: String);
begin
  with q_representante do
  begin
    close;
    sql.clear;
    sql.add('select r.*, c.nom_cidade from representante r '+
            'left join cidades c on c.cod_cidade = r.id_cidade '+
            'where r.id = '+QuotedStr(id));
    open;
  end;

end;

procedure TFr_representante.btaltClick(Sender: TObject);
begin
    modo_insert:=false;
    readonly_false('Pr');
    edit_sg:= 'S';
    Sg_comissao.Options := Sg_comissao.Options + [goEditing];
    //habilita botões

    Btnov.Enabled:=false;
    btalt.Enabled:=false;
    btgra.Enabled:=true;
    btcan.Enabled:=true;
    btexc.Enabled:=false;
    prnom_representante.SetFocus;
end;

procedure TFr_representante.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      btnov.Enabled:=true;
      btalt.Enabled:=true;
      btgra.Enabled:=false;
      btcan.Enabled:=False;
      btexc.Enabled:=true;

      if modo_insert then
      begin
        Limpa_campos('Pr');
        readonly_true('Pr');
      end
      else
      if modo_insert = false then
      begin
         mostra_campos('Pr');
         readonly_true('Pr');
      end;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_representante.btexcClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Titulo',mtConfirmation,[mbYes,mbno],0)=mryes then
  begin
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.Execsql('delete from cp1 where titulo='+QuotedStr(Prid.Text));
    dao.cn.Commit;
    FRPRI.msg('Titulo Excluido com Sucesso!');
  end;

end;

procedure TFr_representante.btgraClick(Sender: TObject);
begin
    if Prnom_representante.Text = '' then
    begin
      frpri.msg('O campo Representante deve ser preenchido!');
      pcrep.ActivePage:= tab_dados;
      Prnom_representante.SetFocus;
      exit;
    end;
    if Prid_cidade.Text = '' then
    begin
      frpri.msg('O campo Cidade deve ser preenchido!');
      pcrep.ActivePage:= tab_dados;
      Prid_cidade.SetFocus;
      exit;
    end;

    btnov.Enabled:=true;
    btalt.Enabled:=true;
    btgra.Enabled:=false;
    btcan.Enabled:=False;
    btexc.Enabled:=true;

    Screen.Cursor := crSQLWait;

    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
       id:= dao.insert('Pr','representante', 'id', Fr_representante, 'gen_representante');
       Prid.Text:= id;
       ativa_representante(id);
       //grava comissao

       btNov.setFocus;
    end
    else
       dao.update('representante','id',Prid.Text,'Pr', Fr_representante);

  // grava_comissao(Prid.Text);


    dao.cn.Commit;

    Sg_comissao.Options := Sg_comissao.Options - [goEditing];
    edit_sg:= 'N';
    Screen.Cursor := crDefault;

    readonly_true('Pr');

end;

procedure TFr_representante.BtnovClick(Sender: TObject);
begin
  modo_insert:=true;
  readonly_false('Pr');
  edit_sg:= 'S';
  Sg_comissao.Options := Sg_comissao.Options + [goEditing];
  //habilita botões
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  Limpa_campos('Pr');
  Prnom_representante.setfocus;
end;

procedure TFr_representante.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
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

    end;
  end;
  if prefixo = 'Pr' then
  begin
    LbNom_cidade.Caption:='...';
  end;


end;

procedure TFr_representante.monta_sg_meta;
begin
  Sg_meta.Cells[0,0] := 'Mês';
  Sg_meta.Cells[0,1] := 'Meta';
  Sg_meta.Cells[0,2] := 'Comissão';
  Sg_meta.Cells[0,3] := 'Atingido';
  Sg_meta.Cells[1,0] := 'Janeiro';
  Sg_meta.Cells[2,0] := 'Fevereiro';
  Sg_meta.Cells[3,0] := 'Março';
  Sg_meta.Cells[4,0] := 'Abril';
  Sg_meta.Cells[5,0] := 'Maio';
  Sg_meta.Cells[6,0] := 'Junho';
  Sg_meta.Cells[7,0] := 'Julho';
  Sg_meta.Cells[8,0] := 'Agosto';
  Sg_meta.Cells[9,0] := 'Setembro';
  Sg_meta.Cells[10,0] := 'Outubro';
  Sg_meta.Cells[11,0] := 'Novembro';
  Sg_meta.Cells[12,0] := 'Dezembro';







end;

procedure TFr_representante.mostra_campos(prefixo: String);
var
  i: integer;
  campo, campo1: String;
begin
  Screen.Cursor := crSQLWait;

  for i:=0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo:= TsEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TsEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TMaskEdit then
      begin
        campo:= TMaskEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TMaskEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TRichEdit then
      begin
        campo:= TRichEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TRichEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsComboEdit then
      begin
        campo:= TsComboEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsComboEdit(FindComponent(campo)).Text := q_representante.fieldbyname(campo1).AsString;
      end
{      else
      if Components[i] is TsCurrencyEdit then
      begin
        campo:= TsCurrencyEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_cliente.fieldbyname(campo1).AsFloat;
      end}


    end;
  end;//end do for

  LbNom_cidade.Caption:= q_representante.fieldbyname('nom_cidade').AsString;
  Screen.Cursor := crDefault;

end;

procedure TFr_representante.readonly_false(prefixo: String);
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=false
      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=false
    end;
  end;

end;

procedure TFr_representante.readonly_true(prefixo: String);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=True
      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=True;

    end;
  end;
end;

procedure TFr_representante.FormShow(Sender: TObject);
begin
  monta_sg_meta;
  monta_sg_comissao;
end;

procedure TFr_representante.monta_sg_comissao;
begin
    Sg_comissao.Cells[0,0]:= 'id';
    Sg_comissao.ColWidths[0] := 0;
    Sg_comissao.Cells[1,0]:= 'Desconto Inicial';
    Sg_comissao.Cells[2,0]:= 'Desconto Final';
    Sg_comissao.Cells[3,0]:= '% Comissão';
end;

procedure TFr_representante.PrCod_cidadeButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Cidade';

  chamou_pesquisa:= 'fr_representate';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Represenante';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i:=0 to 4 do
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

procedure TFr_representante.PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key:=#0;
  end;
end;

procedure TFr_representante.BitBtn1Click(Sender: TObject);
var
  //q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Representante';

  chamou_pesquisa:= 'fr_representate';
  chamou_form := 'fr_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Represenante';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i:=0 to 4 do
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

procedure TFr_representante.Prnom_representanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_representante.PRCod_cidadeButtonClick2(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption:='Localizar Cidade';

  chamou_pesquisa:= 'fr_cidades';
  chamou_form := 'fr_representante_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cidades';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

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

procedure TFr_representante.PRRazao_SocialKeyPress2(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key:=#0;
  end;
end;

procedure TFr_representante.Prid_cidadeKeyPress(Sender: TObject;
  var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if key = #13 then
  begin
    if (Prid_cidade.text = '') and (Btgra.Enabled = true) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cidade';

      chamou_pesquisa:= 'fr_cidades';
      chamou_form := 'fr_representante_cidade';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cidades';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

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
  end;
end;

procedure TFr_representante.Prid_cidadeExit(Sender: TObject);
begin
  if trim(PRid_cidade.Text) = '' then
     LbNom_cidade.Caption:= '...';

  if PRid_cidade.Text <> '' then
  begin
    dao.Geral2('select nom_cidade from cidades where cod_cidade='+QuotedStr(PRid_cidade.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cidade.Caption := dao.Q2.fieldbyname('nom_cidade').AsString;
    end
    else
    begin
      FRPRI.msg('Registro não Encontrado!');
      PRid_cidade.Text:= '';
      PRid_cidade.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_representante.Sg_comissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    if (edit_sg = 'S') and not(zzcomissao_fixa.Checked) then
    begin
      if (Sg_comissao.Col) = 2 then //se for ultima coluna insere linha nova.
        if (Sg_comissao.row >= 1) and (Sg_comissao.cells[1,Sg_comissao.RowCount-1] = '') then
        begin
          Sg_comissao.Row:= Sg_comissao.RowCount - 1;
          Sg_comissao.Col := 0;
        end
        else
        begin
          InsLinha(Sg_comissao);
          Sg_comissao.Col:= 0;
        end;
      end;
  end;

end;

procedure TFr_representante.InsLinha(var SGX: TAdvStringGrid);
begin
  sgx.Col:=1;
  SGX.AddRow;
  SGX.Row:=SGX.Row+1;
  lin:= sgx.Row;
end;




procedure TFr_representante.grava_comissao(id_representante : String);
var
  i: integer;
begin
  if not(dao.cn.InTransaction) then (dao.cn.StartTransaction);
  dao.Execsql('delete from comissao where id_representante='+QuotedStr(Prid.Text));

  for i:=0 to Sg_comissao.RowCount -1 do
  begin
     dao.Execsql('insert into comissao (id_representante, perc_minimo, perc_maximo, perc_comissao) values ('+QuotedStr(Prid.Text)+','+QuotedStr(Sg_comissao.Cells[0,i])+
      ','+QuotedStr(Sg_comissao.Cells[1,i])+','+ QuotedStr(Sg_comissao.Cells[2,i])+')');
  end;

  dao.cn.Commit;

end;

procedure TFr_representante.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    close;
  end;
end;

procedure TFr_representante.FormCloseQuery(Sender: TObject;
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

end.
