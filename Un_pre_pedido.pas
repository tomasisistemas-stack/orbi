unit Un_pre_pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, Grids, BaseGrid,
  AdvGrid, ComCtrls,  Buttons, sPanel, sBitBtn, sLabel, sCheckBox,
  sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit,
  sComboEdit,  AdvObj, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_pre_pedido = class(TForm)
    Prid: TsEdit;
    Lbcolecao: tsLabel;
    Prcod_colecao: TsComboEdit;
    lblcod_colecao: tsLabel;
    Lbempresa: tsLabel;
    Prcod_empresa: TsComboEdit;
    Label35: tsLabel;
    fa: tsLabel;
    Label3: tsLabel;
    Prcota_colecao: TsCurrencyEdit;
    Pc_estacoes: TPageControl;
    tab_verao: TTabSheet;
    tab_inverno: TTabSheet;
    q_pre_pedido2: TFDQuery;
    pa1: tsPanel;
    Rbverao: TRadioButton;
    Rb_inverno: TRadioButton;
    btexc: TsBitBtn;
    btcan: TsBitBtn;
    btgra: TsBitBtn;
    btalt: TsBitBtn;
    Btnov: TsBitBtn;
    Prdata: TsDateEdit;
    Label1: tsLabel;
    sg_verao: TAdvStringGrid;
    zzvalor_restante: TsCurrencyEdit;
    Label5: tsLabel;
    sg_inverno: TAdvStringGrid;
    BtLocalizar: TsBitBtn;
    Q_pre_pedido1: TFDQuery;
    procedure Prcod_colecaoButtonClick(Sender: TObject);
    procedure Prcod_colecaoExit(Sender: TObject);
    procedure Prcod_colecaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RbveraoClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick2(Sender: TObject);
    procedure sg_veraoCellChanging(Sender: TObject; OldRow, OldCol, NewRow,
      NewCol: Integer; var Allow: Boolean);
    procedure BtLocalizarClick(Sender: TObject);
    procedure sg_veraoCellsChanged(Sender: TObject; R: TRect);
    procedure Rb_invernoClick(Sender: TObject);
  private
    { Private declarations }
  public
    modo_insert: Boolean;
    id: string;
    procedure monta_sg_verao;
    procedure monta_sg_inverno;

    procedure busca_fornecedores;//busca os fornecedores para montar no string grid
    procedure grava_sg_verao;
    procedure grava_sg_inverno;

    procedure carrega_sg_verao;
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure ativa_pre_pedido1(id: String);
    procedure ativa_pre_pedido2(id: String);
    procedure mostra_campos(prefixo: ShortString);
    procedure totaliza_cota;                          


    { Public declarations }
  end;

var
  Fr_pre_pedido: TFr_pre_pedido;

implementation

uses Un_localizar, Un_dao, UnPri, UnFun;

{$R *.dfm}

procedure TFr_pre_pedido.monta_sg_verao;
begin
  Sg_verao.Cells[0,0]:='Fornecedor';
  Sg_verao.Cells[1,0]:='Giro %';
  Sg_verao.Cells[2,0]:='Preview';
  Sg_verao.Cells[3,0]:='Col. Principal';
  Sg_verao.Cells[4,0]:='Alto Verão';
  Sg_verao.Cells[5,0]:='id';
  Sg_verao.Cells[6,0]:='cod_fornecedor';
  Sg_verao.ColWidths[0]:=299;
  Sg_verao.ColWidths[1]:=100;
  Sg_verao.ColWidths[2]:=100;
  Sg_verao.ColWidths[3]:=100;
  Sg_verao.ColWidths[4]:=100;
  Sg_verao.ColWidths[5]:=0;
  Sg_verao.ColWidths[6]:=0;

end;

procedure TFr_pre_pedido.monta_sg_inverno;
begin
  sg_inverno.Cells[0,0]:='Fornecedor';
  sg_inverno.Cells[1,0]:='Giro %';
  sg_inverno.Cells[2,0]:='Preview';
  sg_inverno.Cells[3,0]:='Col. Principal';
  sg_inverno.Cells[4,0]:='id';
  sg_inverno.Cells[5,0]:='cod_fornecedor';
  sg_inverno.ColWidths[0]:=299;
  sg_inverno.ColWidths[1]:=100;
  sg_inverno.ColWidths[2]:=100;
  sg_inverno.ColWidths[3]:=100;
  sg_inverno.ColWidths[4]:=0;
  sg_inverno.ColWidths[5]:=0;
end;

procedure TFr_pre_pedido.Prcod_colecaoButtonClick(Sender: TObject);
var
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

  Fr_localizar.Caption:='Localizar Coleção';

  chamou_pesquisa:= 'fr_colecao';
  chamou_form := 'fr_prepedido_colecao';
  chamou_cadastro := 'fr_colecao';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Colecao';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;


  Fr_localizar.ShowModal;
 // Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_pre_pedido.Prcod_colecaoExit(Sender: TObject);
begin
  if trim(Prcod_colecao.Text) = '' then
     Lbcolecao.Caption:= '...';

  if Prcod_colecao.Text <> '' then
  begin
    dao.Geral2('select descricao from colecao where id='+QuotedStr(Prcod_colecao.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbcolecao.Caption := dao.Q2.fieldbyname('descricao').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_colecao.Text:= '';
      Prcod_colecao.SetFocus;
      Exit;
    end;
  end;

  if Prcod_empresa.Text = '' then
  begin
    dao.msg('Informe a Loja para o Sistema Puxar os Fornecedores!');
    Prcod_colecao.SetFocus;
    Exit;
  end;

  if (Prcod_colecao.Text <> '') and (Prcod_empresa.Text <> '') then
  begin
    busca_fornecedores;
  end;



end;

procedure TFr_pre_pedido.Prcod_colecaoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;

 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if key= #13 then
  begin
    if (Prcod_colecao.Text ='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Coleção';

      chamou_pesquisa:= 'fr_colecao';
      chamou_form := 'fr_prepedido_colecao';
      chamou_cadastro := 'fr_colecao';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Colecao';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i:=0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;

    end;
    SelectNext(sender as TWinControl, true, true);
    key:=#0;

  end;
end;

procedure TFr_pre_pedido.Prcod_empresaButtonClick(Sender: TObject);
var
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

  Fr_localizar.Caption:='Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_prepedido_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo,2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_pre_pedido.Prcod_empresaExit(Sender: TObject);
begin
  if trim(Prcod_empresa.Text) = '' then
     Lbempresa.Caption:= '...';

  if Prcod_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa='+QuotedStr(Prcod_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa.Caption := dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_empresa.Text:= '';
      Prcod_empresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_pre_pedido.Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin

 If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key=#13 then
  begin
    if (Prcod_empresa.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_prepedido_empresa';
      chamou_cadastro := 'Fr_empresa';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Empresa';
      Fr_localizar.BT_cadastro.Visible := false;

      SetLength(Campos_combo,2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i:=0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
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

procedure TFr_pre_pedido.busca_fornecedores;
var
    i: Integer;
begin
   dao.Geral1('select f.cod_fornecedor, f.fantasia  from fornecedor f '+
              'left join loja_fornecedor ep on ep.cod_fornecedor = f.cod_fornecedor '+
              ' where f.uso_prepedido='+QuotedStr('S')+' and f.inativo='+QuotedStr('N')+' and ep.cod_empresa='+QuotedStr(Prcod_empresa.Text)+
              ' order by fantasia');

   if dao.q1.recordcount > 0 then
   begin
     i:=1;
     dao.Q1.First;
     while not(dao.Q1.Eof) do
     begin
       Sg_verao.Cells[0,i]:=dao.Q1.fieldbyname('fantasia').AsString;
       dao.Geral2('select id, cod_colecao, giro from giro_fornecedor where cod_fornecedor='+QuotedStr(dao.Q1.fieldbyname('cod_fornecedor').AsString)+
                  ' order by id desc');
       Sg_verao.Cells[1,i]:= dao.Q2.fieldbyname('giro').AsString;
       Sg_verao.Cells[2,i]:='0';
       Sg_verao.Cells[3,i]:='0';
       Sg_verao.Cells[4,i]:='0';
       Sg_verao.Cells[6,i]:=dao.Q1.fieldbyname('cod_fornecedor').AsString;

       Sg_verao.AddRow;
       I:= I +1;
       dao.Q1.Next;

     end;
   end;

   if dao.q1.recordcount > 0 then
   begin
     i:=1;
     dao.Q1.First;
     while not(dao.Q1.Eof) do
     begin
       Sg_inverno.Cells[0,i]:=dao.Q1.fieldbyname('fantasia').AsString;
       dao.Geral2('select id, cod_colecao, giro from giro_fornecedor where cod_fornecedor='+QuotedStr(dao.Q1.fieldbyname('cod_fornecedor').AsString)+
                  ' order by id desc');
       Sg_inverno.Cells[1,i]:= dao.Q2.fieldbyname('giro').AsString;
       Sg_inverno.Cells[2,i]:='0';
       Sg_inverno.Cells[3,i]:='0';
       Sg_inverno.Cells[5,i]:=dao.Q1.fieldbyname('cod_fornecedor').AsString;

       Sg_inverno.AddRow;
       I:= I +1;
       dao.Q1.Next;
     end;
   end;

end;

procedure TFr_pre_pedido.FormShow(Sender: TObject);
begin
  monta_sg_verao;
end;

procedure TFr_pre_pedido.RbveraoClick(Sender: TObject);
begin
  tab_verao.TabVisible:= True;
  tab_inverno.TabVisible:= false;

end;

procedure TFr_pre_pedido.btaltClick(Sender: TObject);
begin
    modo_insert:=false;
    readonly_false('Pr');
    //habilita botões
    Prcod_empresa.Enabled:= false;

    btnov.Enabled:=false;
    btalt.Enabled:=false;
    btgra.Enabled:=true;
    btcan.Enabled:=true;
    btexc.Enabled:=false;

end;

procedure TFr_pre_pedido.btcanClick(Sender: TObject);
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
        limpa_campos('Pr');
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

procedure TFr_pre_pedido.btexcClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir Este Pré Pedido',mtConfirmation,[mbYes,mbno],0)=mryes then
  begin
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.Execsql('delete from cr1 where titulo='+QuotedStr(Prid.Text));
    dao.cn.Commit;
    dao.msg('Titulo Excluido com Sucesso!');
  end;

end;

procedure TFr_pre_pedido.btgraClick(Sender: TObject);
begin
    if Prcod_empresa.Text = '' then
    begin
      dao.msg('O campo Loja deve ser preenchido!');
      Prcod_empresa.SetFocus;
    end;
    if Prcod_colecao.Text = '' then
    begin
      dao.msg('O campo Coleção deve ser preenchido!');
      Prcod_colecao.SetFocus;
    end;
    if Prcota_colecao.Value = 0 then
    begin
      dao.msg('O campo Cota Coleção deve ser preenchido!');
      Prcota_colecao.SetFocus;
      exit;
    end;

    if zzvalor_restante.Value < 0 then
    begin
      dao.msg('Você Dividiu entre fornecedores um Valor maior do que a Cota estipulada!');
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
      id:= dao.insert('Pr','pre_pedido1', 'id', Fr_pre_pedido, 'gen_pre_pedido1');
      Prid.Text:= id;
      ativa_pre_pedido1(id);
      Btnov.setFocus;
    end
    else
      dao.update('pre_pedido1','id',Prid.Text,'Pr', Fr_pre_pedido);

    grava_sg_verao;

    if Rbverao.Checked then
       dao.Execsql('update pre_pedido1 set estacao='+QuotedStr('V')+' where id='+QuotedStr(Prid.Text))
    else
       dao.Execsql('update pre_pedido1 set estacao='+QuotedStr('I')+' where id='+QuotedStr(Prid.Text));

    dao.cn.Commit;

    ativa_pre_pedido1(Prid.Text);
    ativa_pre_pedido2(Prid.Text);

    if Rbverao.Checked then
       monta_sg_verao;

    if Rb_inverno.Checked then
       monta_sg_inverno;


    Screen.Cursor := crDefault;

    readonly_true('Pr');

end;

procedure TFr_pre_pedido.BtnovClick2(Sender: TObject);
begin
  modo_insert:=true;
  readonly_false('Pr');
  Prcod_empresa.SetFocus;
  //habilita botões
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  Limpa_campos('Pr');
  sg_verao.Clear;
  sg_verao.RowCount:=2;
  sg_inverno.Clear;
  sg_inverno.RowCount:=2;

  monta_sg_verao;
  monta_sg_inverno;
  Prdata.Date:= Now;
  Rbverao.Checked:= true;
  Sg_verao.Options := Sg_verao.Options + [goEditing];
  Sg_verao.EditMode:= True;
end;

procedure TFr_pre_pedido.limpa_campos(prefixo: ShortString);
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
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbempresa.Caption:='...';
    Lbcolecao.Caption:='...';
  end;
end;

procedure TFr_pre_pedido.readonly_false(prefixo: ShortString);
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
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=false;
    end;
  end;

end;

procedure TFr_pre_pedido.readonly_true(prefixo: ShortString);
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
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=True;

    end;
  end;
end;

procedure TFr_pre_pedido.ativa_pre_pedido1(id: String);
begin
  with Q_pre_pedido1 do
  begin
    close;
    sql.clear;
    sql.add('select p1.*, c.descricao, e.nom_empresa from pre_pedido1 p1 '+
            'left join colecao c on c.id=p1.cod_colecao '+
            'left join empresa e on e.cod_empresa=p1.cod_empresa '+
            'where p1.id='+QuotedStr(id));
    open;
  end;

end;


procedure TFr_pre_pedido.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text := Q_pre_pedido1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsComboEdit then
      begin
        campo:= TsComboEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsComboEdit(FindComponent(campo)).Text :=Q_pre_pedido1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsCurrencyEdit then
      begin
        campo:= TsCurrencyEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsCurrencyEdit(FindComponent(campo)).Value := Q_pre_pedido1.fieldbyname(campo1).AsFloat;
      end
      else
      if Components[i] is TsDateEdit then
      begin
        campo:= TsDateEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TsDateEdit(FindComponent(campo)).Date := Q_pre_pedido1.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end;//end do for
  Lbempresa.Caption:=Q_pre_pedido1.fieldbyname('nom_empresa').AsString;
  Lbcolecao.Caption:= Q_pre_pedido1.fieldbyname('descricao').AsString;
//  carrega_entrada2(PrNr_documento.Text, Prcod_fornecedor.Text);

  Screen.Cursor := crDefault;

end;










procedure TFr_pre_pedido.grava_sg_verao;
var
  i:Integer;
  cod_fornecedor, id_pre1, giro, preview, col_principal, alto_verao: string;
  cmd:string;

  valor, campo: string;
begin
  if modo_insert = True then
  begin
    Sg_verao.Options := Sg_verao.Options + [goEditing];
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    for i:=1 to Sg_verao.RowCount -1 do
    begin
      if Sg_verao.cells[0,i] <>'' then
      begin
        cod_fornecedor:= Sg_verao.cells[6,i];
        id_pre1:= Prid.Text;

        if Sg_verao.cells[1,i] = '' then
           giro:='0'
        else
           giro:= Sg_verao.cells[1,i];

        if Sg_verao.cells[2,i] = '' then
           preview:= '0'
        else
           preview:= Sg_verao.cells[2,i];

        if Sg_verao.cells[3,i] = '' then
           col_principal:= '0'
        else
           col_principal:= Sg_verao.cells[3,i];

        if Sg_verao.cells[4,i] = '' then
           alto_verao:= '0'
        else
           alto_verao:= Sg_verao.cells[4,i];


       if cod_fornecedor <> '' then
       begin
           campo:= campo + 'cod_fornecedor';
           valor:= valor + QuotedStr(cod_fornecedor);
       end;
       if id_pre1 <> '' then
       begin
           campo:= campo + ',id_pre1';
           valor:= valor + ','+ QuotedStr(id_pre1);
       end;
       if giro <> '' then
       begin
           campo:= campo + ',giro_anterior';
           valor:= valor + ','+QuotedStr(giro);
       end;
       if preview <> '' then
       begin
           campo:= campo + ',preview';
           valor:= valor +', '+ QuotedStr(preview);
       end;
       if col_principal <> '' then
       begin
           campo:= campo + ',col_principal';
           valor:= valor + ', '+QuotedStr(col_principal);
       end;
       if alto_verao <> '' then
       begin
           campo:= campo + ',alto_verao';
           valor:= valor + ','+QuotedStr(alto_verao);
       end;

       dao.Execsql('insert into pre_pedido2 ('+campo+') values ('+valor+')');
       campo:=''; valor:='';

      end;
    end;
  end
  else
  begin
    Sg_verao.Options := Sg_verao.Options + [goEditing];
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    for i:=1 to Sg_verao.RowCount -1 do
    begin
      cmd:='';
      id:= Sg_verao.cells[5,i];
      if Sg_verao.cells[1,i] = '' then
           giro:='0'
        else
           giro:= Sg_verao.cells[1,i];

        if Sg_verao.cells[2,i] = '' then
           preview:= '0'
        else
           preview:= Sg_verao.cells[2,i];

        if Sg_verao.cells[3,i] = '' then
           col_principal:= '0'
        else
           col_principal:= Sg_verao.cells[3,i];

        if Sg_verao.cells[4,i] = '' then
           alto_verao:= '0'
        else
           alto_verao:= Sg_verao.cells[4,i];

        if giro <> '' then
        begin
          cmd:= cmd + ' giro_anterior ='+ FMFUN.prepara_valor(giro);
        end;

        if preview <> '' then
        begin
          cmd:= cmd + ', preview ='+ FMFUN.prepara_valor(preview);
        end;

        if col_principal <> '' then
        begin
          cmd:= cmd + ', col_principal = '+ FMFUN.prepara_valor(col_principal);
        end;

        if alto_verao <> '' then
        begin
          cmd:= cmd + ', alto_verao = '+ FMFUN.prepara_valor(alto_verao);
        end;

        dao.Execsql('update pre_pedido2 set '+ cmd + ' where id= '+QuotedStr(id));


    end;
  end;
end;

procedure TFr_pre_pedido.grava_sg_inverno;
var
  i:Integer;
  cod_fornecedor, id_pre1, giro, preview, col_principal, alto_verao: string;
  cmd:string;

  valor, campo: string;
begin
  if modo_insert = True then
  begin
    Sg_inverno.Options := Sg_inverno.Options + [goEditing];
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    for i:=1 to Sg_inverno.RowCount -1 do
    begin
      if Sg_inverno.cells[0,i] <>'' then
      begin
        cod_fornecedor:= Sg_inverno.cells[6,i];
        id_pre1:= Prid.Text;

        if Sg_inverno.cells[1,i] = '' then
           giro:='0'
        else
           giro:= Sg_inverno.cells[1,i];

        if Sg_inverno.cells[2,i] = '' then
           preview:= '0'
        else
           preview:= Sg_inverno.cells[2,i];

        if Sg_inverno.cells[3,i] = '' then
           col_principal:= '0'
        else
           col_principal:= Sg_inverno.cells[3,i];


       if cod_fornecedor <> '' then
       begin
           campo:= campo + 'cod_fornecedor';
           valor:= valor + QuotedStr(cod_fornecedor);
       end;
       if id_pre1 <> '' then
       begin
           campo:= campo + ',id_pre1';
           valor:= valor + ','+ QuotedStr(id_pre1);
       end;
       if giro <> '' then
       begin
           campo:= campo + ',giro_anterior';
           valor:= valor + ','+QuotedStr(giro);
       end;
       if preview <> '' then
       begin
           campo:= campo + ',preview';
           valor:= valor +', '+ QuotedStr(preview);
       end;
       if col_principal <> '' then
       begin
           campo:= campo + ',col_principal';
           valor:= valor + ', '+QuotedStr(col_principal);
       end;

       dao.Execsql('insert into pre_pedido2 ('+campo+') values ('+valor+')');
       campo:=''; valor:='';

      end;
    end;
  end
  else
  begin
    Sg_inverno.Options := Sg_inverno.Options + [goEditing];
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    for i:=1 to Sg_inverno.RowCount -1 do
    begin
      cmd:='';
      id:= Sg_inverno.cells[5,i];
      if Sg_inverno.cells[1,i] = '' then
           giro:='0'
        else
           giro:= Sg_inverno.cells[1,i];

        if Sg_inverno.cells[2,i] = '' then
           preview:= '0'
        else
           preview:= Sg_inverno.cells[2,i];

        if Sg_inverno.cells[3,i] = '' then
           col_principal:= '0'
        else
           col_principal:= Sg_inverno.cells[3,i];

        if giro <> '' then
        begin
          cmd:= cmd + ' giro_anterior ='+ FMFUN.prepara_valor(giro);
        end;

        if preview <> '' then
        begin
          cmd:= cmd + ', preview ='+ FMFUN.prepara_valor(preview);
        end;

        if col_principal <> '' then
        begin
          cmd:= cmd + ', col_principal = '+ FMFUN.prepara_valor(col_principal);
        end;


        dao.Execsql('update pre_pedido2 set '+ cmd + ' where id= '+QuotedStr(id));


    end;
  end;
end;



procedure TFr_pre_pedido.sg_veraoCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  totaliza_cota;
end;

procedure TFr_pre_pedido.BtLocalizarClick(Sender: TObject);
var
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

  Fr_localizar.Caption:='Localizar Pré-Pedidos';
  chamou_pesquisa := 'fr_prepedido';
  chamou_form := 'fr_prepedido';
  chamou_cadastro := 'Fr_prepedido';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Entrada';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,3);
  Campos_combo[0] := 'Nº Pre-Pedido';
  Campos_combo[1] := 'Coleção';
  Campos_combo[2] := 'Data';

  for i:=0 to 2 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
//  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  if Q_pre_pedido1.FieldByName('estacao').AsString ='V' then
  begin
    Rbverao.Checked:=True;
    tab_verao.TabVisible:=True;
    tab_inverno.TabVisible:=False;
  end
  else
  begin
    Rb_inverno.Checked:=True;
    tab_inverno.TabVisible:= True;
    tab_verao.TabVisible:=False;
  end;
  totaliza_cota;
end;

procedure TFr_pre_pedido.ativa_pre_pedido2(id: String);
begin
  with q_pre_pedido2 do
  begin
    close;
    sql.clear;
    sql.add('select p2.*, f.fantasia  from pre_pedido2 p2 '+
            'left join fornecedor f on f.cod_fornecedor=p2.cod_fornecedor '+
            'where p2.id_pre1='+QuotedStr(id));
    open;
  end;

end;

procedure TFr_pre_pedido.carrega_sg_verao;
var
  linmax: Integer;
begin
  sg_verao.Clear;
  sg_verao.RowCount:=2;
  monta_sg_verao;
  linMax:=1;
  q_pre_pedido2.First;
  while not(q_pre_pedido2.Eof) do
  begin
    sg_verao.EditorMode:=true;
    if linMax > 1 then
    begin
      sg_verao.AddRow;
    end;
    sg_verao.Cells[0,linMax]:= q_pre_pedido2.fieldbyname('fantasia').AsString;
    sg_verao.Cells[1,linMax]:= q_pre_pedido2.fieldbyname('giro_anterior').AsString;

//    SgCp1.ColSelect[2].  Cells[1,linMax]:= q_cp1.fieldbyname('titulo').AsString;

    sg_verao.Cells[2,linMax]:= FormatFloat('###,##0.00', q_pre_pedido2.fieldbyname('preview').AsFloat);
    sg_verao.Cells[3,linMax]:= FormatFloat('###,##0.00', q_pre_pedido2.fieldbyname('col_principal').AsFloat);
    sg_verao.Cells[4,linMax]:= FormatFloat('###,##0.00', q_pre_pedido2.fieldbyname('alto_verao').AsFloat);
    sg_verao.Cells[5,linMax]:= q_pre_pedido2.fieldbyname('id').AsString;
    sg_verao.Cells[6,linMax]:= q_pre_pedido2.fieldbyname('cod_fornecedor').AsString;

    q_pre_pedido2.Next;

    if not(q_pre_pedido2.Eof) then
       linMax:= linMax + 1;

  end;
    sg_verao.EditorMode:=false;
    sg_verao.Row:=linMax;
    sg_verao.RowSelect[linmax];



end;

procedure TFr_pre_pedido.totaliza_cota;
var
  ac_preview, ac_col_principal, ac_alto_verao:Real;
begin
  ac_preview:=0;
  ac_col_principal:=0;
  ac_alto_verao:=0;

  if Rbverao.Checked then
  begin
    ac_preview:= sg_verao.ColumnSum(2,1,sg_verao.RowCount);
    ac_col_principal:= sg_verao.ColumnSum(3,1,sg_verao.RowCount);
    ac_alto_verao:= sg_verao.ColumnSum(4,1,sg_verao.RowCount);
  end
  else
  begin
    ac_preview:= sg_inverno.ColumnSum(2,1,sg_verao.RowCount);
    ac_col_principal:= sg_inverno.ColumnSum(3,1,sg_verao.RowCount);
  end;
  if Rbverao.Checked then
     zzvalor_restante.Value:= Prcota_colecao.Value-(ac_preview+ac_col_principal+ac_alto_verao)
  else
     zzvalor_restante.Value:= Prcota_colecao.Value-(ac_preview+ac_col_principal);


end;

procedure TFr_pre_pedido.sg_veraoCellsChanged(Sender: TObject; R: TRect);
begin
  totaliza_cota;
end;

procedure TFr_pre_pedido.Rb_invernoClick(Sender: TObject);
begin
  tab_verao.TabVisible:= false;
  tab_inverno.TabVisible:= true;

end;

end.



