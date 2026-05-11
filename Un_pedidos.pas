unit Un_pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Mask, Buttons,
  ExtCtrls,  ComCtrls, frxClass, Menus, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sCurrEdit, sCurrencyEdit, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sComboEdit,  AdvObj,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_pedidos = class(TForm)
    Panel3: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Prnr_documento: TsEdit;
    Label1: tsLabel;
    Prdta_pedido: TsDateEdit;
    Label3: tsLabel;
    Label2: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    lb_fornecedor: tsLabel;
    Label4: tsLabel;
    Prcod_colecao: TsComboEdit;
    Lb_colecao: tsLabel;
    Probs: TRichEdit;
    Label5: tsLabel;
    Prnr_pedido_fornecedor: TsEdit;
    Label6: tsLabel;
    PC_pedido: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    sg_pedido2: TAdvStringGrid;
    Sg_historico: TAdvStringGrid;
    Label8: tsLabel;
    Panel1: tsPanel;
    btexc_hist: TsBitBtn;
    btcan_hist: TsBitBtn;
    btgra_hist: TsBitBtn;
    btalt_hist: TsBitBtn;
    btnov_hist: TsBitBtn;
    Label9: tsLabel;
    Label10: tsLabel;
    Hphora: TsEdit;
    Hpnr_pedido: TsEdit;
    Hpcod_fornecedor: TsEdit;
    Hpcod_usuario: TsEdit;
    ed_usuario: TsEdit;
    Label11: tsLabel;
    Hpdescricao: TRichEdit;
    Hpdata: TsDateEdit;
    id_historico: TsEdit;
    Prprazo_ent_inicial: TsDateEdit;
    q_pedido2: TFDQuery;
    fr_relatorio: TfrxReport;
    MainMenu1: TMainMenu;
    Imprimir1: TMenuItem;
    Formulariodepedido1: TMenuItem;
    q_historico: TFDQuery;
    Panel2: tsPanel;
    RB_pedido: TRadioButton;
    RB_ordem: TRadioButton;
    Prtotal_custo: TsCurrencyEdit;
    Prtotal_venda: TsCurrencyEdit;
    Label13: tsLabel;
    Label14: tsLabel;
    Label35: tsLabel;
    Prcod_empresa: TsComboEdit;
    Lbempresa: tsLabel;
    zzpreview: TsEdit;
    zzcol_principal: TsEdit;
    zzalto_verao: TsEdit;
    Label15: tsLabel;
    Label16: tsLabel;
    Label17: tsLabel;
    Label18: tsLabel;
    zzPreview_ant: TsEdit;
    zzcol_principal_ant: TsEdit;
    zzAlto_verao_ant: TsEdit;
    Label19: tsLabel;
    Label20: tsLabel;
    Label21: tsLabel;
    Label22: tsLabel;
    Prprazo_ent_final: TsDateEdit;
    Label23: tsLabel;
    Panel4: tsPanel;
    Panel5: tsPanel;
    Prfop: TsEdit;
    Label24: tsLabel;
    Label25: tsLabel;
    Prpolitica_praca: TsEdit;
    Label26: tsLabel;
    Panel6: tsPanel;
    Panel7: tsPanel;
    Label27: tsLabel;
    zzgiro: TsEdit;
    Label28: tsLabel;
    CurrencyEdit2: TsCurrencyEdit;
    CurrencyEdit3: TsCurrencyEdit;
    Label7: tsLabel;
    Label12: tsLabel;
    Prmarkup: TsCurrencyEdit;
    Label29: tsLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    q_pedido1: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure sg_pedido2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_colecaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_colecaoButtonClick(Sender: TObject);
    procedure Prcod_colecaoExit(Sender: TObject);
    procedure sg_pedido2CellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Formulariodepedido1Click(Sender: TObject);
    procedure Prnr_pedido_fornecedorKeyPress(Sender: TObject;
      var Key: Char);
    procedure btgra_histClick(Sender: TObject);
    procedure btnov_histClick(Sender: TObject);
    procedure btalt_histClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcan_histClick(Sender: TObject);
    procedure btexc_histClick(Sender: TObject);
    procedure Prprazo_maximoKeyPress(Sender: TObject; var Key: Char);
    procedure sg_pedido2KeyPress(Sender: TObject; var Key: Char);
    procedure Sg_historicoCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure Prnr_documentoKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_pedidoKeyPress(Sender: TObject; var Key: Char);
    procedure fr_relatorioGetValue(const VarName: String;
      var Value: Variant);
    procedure sg_pedido2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_pedido2CellsChanged(Sender: TObject; R: TRect);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure sg_pedido2GeTsEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);

  private
    procedure monta_sg_Historico;
    { Private declarations }
  public
    modo_insert : Boolean;
    modo_insert_hist : Boolean;
    id: String;

    procedure monta_sg_pedido2;
    procedure limpa_campos(prefixo : ShortString);

    procedure limpa_sg_pedidos;
    procedure limpa_sg_historico;

    procedure iguala_linhas;

    procedure mostra_campos(prefixo : String);
    procedure grava_pedidos2;

    procedure readonly_true(prefixo : String);
    procedure readonly_false(prefixo : String);

    procedure ativa_pedido1(nr_documento, cod_fornecedor:string);
    procedure ativa_pedido2(nr_documento, cod_fornecedor : String);
    procedure ativa_historico(nr_documento, cod_fornecedor : String);

    procedure envia_email;
    procedure carrega_pedido2;
    procedure carrega_historico;

    procedure busca_cota_colecao(cod_colecao, cod_fornecedor: string);
  end;

var
  Fr_pedidos: TFr_pedidos;

implementation

uses Un_dao, UnPri, Un_localizar, Un_representante, Un_dm, UnFun, Math;

{$R *.dfm}

{ TForm1 }

procedure TFr_pedidos.monta_sg_pedido2;
begin
  with sg_pedido2 do
  begin
    cells[0,0]:='id';
    cells[1,0]:='Grupo';
    cells[2,0]:='Produto';
    cells[3,0]:='Referência';
    cells[4,0]:='Custo';
    cells[5,0]:='Pre. Venda';
    cells[6,0]:='Cor';
    cells[7,0]:='P';
    cells[8,0]:='PP';
    cells[9,0]:='M';
    cells[10,0]:='G';
    cells[11,0]:='GG';
    cells[12,0]:='XG';
    cells[13,0]:='S';
    cells[14,0]:='L';
    cells[15,0]:='XL';
    cells[16,0]:='XXL';
    cells[17,0]:='24';
    cells[18,0]:='25';
    cells[19,0]:='26';
    cells[20,0]:='28';
    cells[21,0]:='29';
    cells[22,0]:='30';
    cells[23,0]:='31';
    cells[24,0]:='32';
    cells[25,0]:='33';
    cells[26,0]:='34';
    cells[27,0]:='35';
    cells[28,0]:='36';
    cells[29,0]:='37';
    cells[30,0]:='38';
    cells[31,0]:='39';
    cells[32,0]:='39.5';
    cells[33,0]:='40';
    cells[34,0]:='40.5';
    cells[35,0]:='41';
    cells[36,0]:='41.5';
    cells[37,0]:='42';
    cells[38,0]:='42.5';
    cells[39,0]:='43';
    cells[40,0]:='43.5';
    cells[41,0]:='44';
    cells[42,0]:='44.5';
    cells[43,0]:='46';
    cells[44,0]:='48';
    cells[45,0]:='50';
    cells[46,0]:='52';
    cells[47,0]:='54';
    cells[48,0]:='56';
    cells[49,0]:='80';
    cells[50,0]:='85';
    cells[51,0]:='90';
    cells[52,0]:='100';
    cells[53,0]:='105';
    cells[54,0]:='110';
    cells[55,0]:='115';
    cells[56,0]:='120';

    ColWidths[0]:=0;
    ColWidths[1]:=80;
    ColWidths[3]:=65;
    ColWidths[4]:=60;
    ColWidths[5]:=60;

    ColWidths[7]:=27;
    ColWidths[8]:=27;
    ColWidths[9]:=27;
    ColWidths[10]:=27;
    ColWidths[11]:=27;
    ColWidths[12]:=27;
    ColWidths[13]:=27;
    ColWidths[14]:=27;
    ColWidths[15]:=27;
    ColWidths[16]:=27;
    ColWidths[17]:=27;
    ColWidths[18]:=27;
    ColWidths[19]:=27;
    ColWidths[20]:=27;
    ColWidths[21]:=27;
    ColWidths[22]:=27;
    ColWidths[23]:=27;
    ColWidths[24]:=27;
    ColWidths[25]:=27;
    ColWidths[26]:=27;
    ColWidths[27]:=27;
    ColWidths[28]:=27;
    ColWidths[29]:=27;
    ColWidths[30]:=27;
    ColWidths[31]:=27;
    ColWidths[32]:=27;
    ColWidths[33]:=27;
    ColWidths[34]:=27;
    ColWidths[35]:=27;
    ColWidths[36]:=27;
    ColWidths[37]:=27;
    ColWidths[38]:=27;
    ColWidths[39]:=27;
    ColWidths[40]:=27;
    ColWidths[41]:=27;
    ColWidths[42]:=27;
    ColWidths[43]:=27;
    ColWidths[44]:=27;
    ColWidths[45]:=27;
    ColWidths[46]:=27;
    ColWidths[47]:=27;
    ColWidths[48]:=27;
    ColWidths[49]:=27;
    ColWidths[50]:=27;
    ColWidths[51]:=27;
    ColWidths[52]:=27;
    ColWidths[53]:=27;
    ColWidths[54]:=27;
    ColWidths[55]:=27;
    ColWidths[56]:=27;






//    cells[1,0]:='Ref. fabrica';
//    cells[2,0]:='Unidade';
 //   cells[3,0]:='Qtd.Emb';
//    cells[4,0]:='Qtd.';
 //   cells[5,0]:='Qtd. recebida';
 //   cells[6,0]:='Cor';
  //  cells[7,0]:='Tamanho';
   // cells[8,0]:='Custo bruto';
    //cells[9,0]:='Desconto';
//    cells[10,0]:='Custo líquido';
///    cells[11,0]:='Marckup';
//    cells[12,0]:='Preço da venda';
 //   ColWidths[13]:=0;
  end;
end;


procedure TFr_pedidos.monta_sg_Historico;
begin
  with Sg_historico do
  begin
    cells[0,0]:='Data';
    cells[1,0]:='Hora';
    cells[2,0]:='Descrição';
  end;
  Sg_historico.ColWidths[3]:=0;
end;

procedure TFr_pedidos.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  monta_sg_pedido2;
  monta_sg_Historico;
  sg_pedido2.Options := sg_pedido2.Options - [goEditing];
  Hpdescricao.ReadOnly:=true;
  PC_PEDIDO.TabIndex:=0;

end;

procedure TFr_pedidos.sg_pedido2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_delete then
  if sg_pedido2.Row =1 then
  begin
    sg_pedido2.ClearRows(1,1);
    if sg_pedido2.RowCount > 1 then
    sg_pedido2.RemoveRows(1,1);
  end
  else
  begin
    if sg_pedido2.cells[13,sg_pedido2.Row]<>'' then
    begin
      dao.Execsql('delete from pedidos2 where id='+quotedstr(sg_pedido2.cells[13,sg_pedido2.Row]));
      dao.cn.Commit;
    end;
      sg_pedido2.ClearRows(sg_pedido2.Row,1);
      if sg_pedido2.RowCount > 1 then
         sg_pedido2.RemoveRows(1,1);
  end;
end;

procedure TFr_pedidos.ativa_pedido2(nr_documento, cod_fornecedor : String);
begin
  with q_pedido2 do
  begin
    close;
    sql.clear;
    sql.add('select * from pedidos2 where nr_documento='+QuotedStr(nr_documento)+' and cod_fornecedor ='+ QuotedStr(cod_fornecedor));
    open;
  end;
end;

procedure TFr_pedidos.carrega_pedido2;
var
  x:integer;
begin
  sg_pedido2.ClearNormalCells;
  sg_pedido2.RowCount:=2;
  FORMATSETTINGS.DecimalSeparator:='.';
  if q_pedido2.recordcount>=1 then
  begin
    q_pedido2.first;
    x:=1;
    while not (q_pedido2.eof) do
    begin
      sg_pedido2.cells[0,x]:=q_pedido2.fieldbyname('nom_produto').AsString;
      sg_pedido2.cells[1,x]:=q_pedido2.fieldbyname('ref_fabrica').AsString;
      sg_pedido2.cells[2,x]:=q_pedido2.fieldbyname('unidade').AsString;
      sg_pedido2.cells[3,x]:=q_pedido2.fieldbyname('qtd_embalagem').AsString;
      sg_pedido2.cells[4,x]:=q_pedido2.fieldbyname('qtd').AsString;
      sg_pedido2.cells[5,x]:=q_pedido2.fieldbyname('qtd_recebida').AsString;
      sg_pedido2.cells[6,x]:=q_pedido2.fieldbyname('cor').AsString;
      sg_pedido2.cells[7,x]:=q_pedido2.fieldbyname('tamanho').AsString;
      sg_pedido2.cells[8,x]:=q_pedido2.fieldbyname('custo_bruto').AsString;
      sg_pedido2.cells[9,x]:=q_pedido2.fieldbyname('desconto').AsString;
      sg_pedido2.cells[10,x]:=q_pedido2.fieldbyname('custo_liquido').AsString;
      sg_pedido2.cells[11,x]:=q_pedido2.fieldbyname('marckup').AsString;
      sg_pedido2.cells[12,x]:=q_pedido2.fieldbyname('preco_venda').AsString;
      sg_pedido2.cells[13,x]:=q_pedido2.fieldbyname('id').AsString;
      q_pedido2.Next;
      if not q_pedido2.eof then
      begin
        sg_pedido2.addrow;
        x:=x+1;
      end;
    end;
  end;
  FORMATSETTINGS.DecimalSeparator:=','
end;

procedure TFr_pedidos.ativa_pedido1(nr_documento, cod_fornecedor: string);
begin
  with q_pedido1 do
  begin
    close;
    SQL.Clear;
    SQL.add('select p.*, f.cod_fornecedor, f.razao_social, f.fantasia, c.id , c.descricao from pedidos1 p '+
            'left join fornecedor f on f.cod_fornecedor = p.cod_fornecedor '+
            'left join colecao c on c.id= p.cod_colecao '+
            'where p.nr_documento = '+ QuotedStr(nr_documento)+' and p.cod_fornecedor='+QuotedStr(cod_fornecedor));
    open;
  end;
end;

procedure TFr_pedidos.limpa_campos(prefixo: ShortString);
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Clear;
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear;
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear;
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear;
      if Components[i] is TMemo then
        TMemo(Components[i]).Clear;
    end;
  end;
end;

procedure TFr_pedidos.mostra_campos(prefixo: String);
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
        TsEdit(FindComponent(campo)).Text := q_pedido1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsDateEdit then
      begin
        campo:= TsDateEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TsDateEdit(FindComponent(campo)).Date := q_pedido1.fieldbyname(campo1).AsDateTime;
      end
      else
      if Components[i] is TsComboEdit then
      begin
        campo:= TsComboEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsComboEdit(FindComponent(campo)).Text := q_pedido1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TMemo then
      begin
        campo:= TMemo(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TMemo(FindComponent(campo)).Text := q_pedido1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TRichEdit then
      begin
        campo:= TRichEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TRichEdit(FindComponent(campo)).Text := q_pedido1.fieldbyname(campo1).AsString;
      end;
    end;
  end;//end do for
  lb_fornecedor.Caption:=q_pedido1.fieldbyname('razao_social').AsString+' - '+q_pedido1.fieldbyname('fantasia').AsString;
  Lb_colecao.caption:=q_pedido1.fieldbyname('descricao').AsString;
  Screen.Cursor := crDefault;
end;

procedure TFr_pedidos.readonly_false(prefixo: String);
var
  i:integer;
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
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false;
    end;
  end;
end;

procedure TFr_pedidos.readonly_true(prefixo: String);
var
  i:integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=true
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=true
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=true
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=true;
    end;
  end;
end;

procedure TFr_pedidos.grava_pedidos2;
var
  i : integer;
  cmd: string;
  campo: string;
  comando_sql: string;
  x: integer;
begin
  FORMATSETTINGS.DecimalSeparator:='.';
  for i:=1 to sg_pedido2.rowcount-1 do
  begin
    cmd:='';
    if sg_pedido2.cells[13,i]<>'' then
    begin
      cmd:= 'update pedidos2 set ';
      if sg_pedido2.cells[0,i]<>'' then
      begin
        cmd:=cmd+'nom_produto';
        cmd:=cmd+'='+QuotedStr(sg_pedido2.cells[0,i]);  //num_produto
      end;

      if sg_pedido2.cells[1,i]<> '' then
      begin
        cmd:=cmd+',ref_fabrica';
        cmd:=cmd+'='+QuotedStr(sg_pedido2.cells[1,i]);
      end;

      if sg_pedido2.cells[2,i]<>'' then
      begin
        cmd:=cmd+',unidade';
        cmd:=cmd+'='+ QuotedStr(sg_pedido2.cells[2,i]);
      end;

      if sg_pedido2.cells[3,i]<> '' then
      begin
        cmd:=cmd+',qtd_embalagem';
        cmd:=cmd+'='+ QuotedStr(sg_pedido2.cells[3,i]);
      end;

      if sg_pedido2.cells[4,i]<>'' then
      begin
        cmd:=cmd+',qtd';
        cmd:=cmd+'='+ QuotedStr(sg_pedido2.cells[4,i]);
      end;

      if sg_pedido2.cells[5,i]<> '' then
      begin
        cmd:=cmd+',qtd_recebida';
        cmd:=cmd+'='+QuotedStr(sg_pedido2.cells[5,i]);
      end;

      if sg_pedido2.cells[6,i]<>'' then
      begin
        cmd:=cmd+',cor';
        cmd:=cmd+'='+QuotedStr(sg_pedido2.cells[6,i]);
      end;

      if sg_pedido2.cells[7,i]<> '' then
      begin
        cmd:=cmd+',tamanho';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[7,i]);
      end;

      if sg_pedido2.cells[8,i]<>'' then
      begin
        cmd:=cmd+',custo_bruto';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[8,i]);
      end;

      if sg_pedido2.cells[9,i]<> '' then
      begin
        cmd:=cmd+',desconto';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[9,i]);
      end;

      if sg_pedido2.cells[10,i]<>'' then
      begin
        cmd:=cmd+',custo_liquido';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[10,i]);
      end;

      if sg_pedido2.cells[11,i]<>'' then
      begin
        cmd:=cmd+',marckup';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[11,i]);
      end;

      if sg_pedido2.cells[12,i]<>'' then
      begin
        cmd:=cmd+',preco_venda';
        cmd:=cmd+ '='+QuotedStr(sg_pedido2.cells[12,i]);
      end;

      if Prnr_documento.text<>'' then
      begin
        cmd:=cmd+',nr_documento';
        cmd:=cmd+'='+QuotedStr(Prnr_documento.text);  //num_produto
      end;

      if Prcod_fornecedor.text<> '' then
      begin
        cmd:=cmd+',cod_fornecedor';
        cmd:=cmd+'='+QuotedStr(Prcod_fornecedor.text);
      end;

      dao.Execsql(cmd);
    end;
    if sg_pedido2.cells[13,i]='' then
    begin
      cmd:= 'insert into pedidos2 (';
      if sg_pedido2.cells[0,i]<>'' then
         cmd:=cmd+'nom_produto';
      if sg_pedido2.cells[1,i]<> '' then
         cmd:=cmd+',ref_fabrica';
      if sg_pedido2.cells[2,i]<>'' then
         cmd:=cmd+',unidade';
      if sg_pedido2.cells[3,i]<> '' then
         cmd:=cmd+',qtd_embalagem';
      if sg_pedido2.cells[4,i]<>'' then
         cmd:=cmd+',qtd';
      if sg_pedido2.cells[5,i]<> '' then
         cmd:=cmd+',qtd_recebida';
      if sg_pedido2.cells[6,i]<>'' then
         cmd:=cmd+',cor';
      if sg_pedido2.cells[7,i]<> '' then
         cmd:=cmd+',tamanho';
      if sg_pedido2.cells[8,i]<>'' then
         cmd:=cmd+',custo_bruto';
      if sg_pedido2.cells[9,i]<> '' then
         cmd:=cmd+',desconto';
      if sg_pedido2.cells[10,i]<>'' then
         cmd:=cmd+',custo_liquido';
      if sg_pedido2.cells[11,i]<>'' then
         cmd:=cmd+',marckup';
      if sg_pedido2.cells[12,i]<>'' then
         cmd:=cmd+',preco_venda';

      if Prnr_documento.text<>'' then
         cmd:=cmd+',nr_documento';    //inserindo o nr_ documento
      if Prcod_fornecedor.text<> '' then
         cmd:=cmd+',cod_fornecedor';  //inserindo o cod_fornecedor


      cmd:= cmd + ') values (';

      if sg_pedido2.cells[0,i]<>'' then
         cmd:=cmd+QuotedStr(sg_pedido2.cells[0,i]);  //num_produto

      if sg_pedido2.cells[1,i]<>'' then
         cmd:=cmd+','+QuotedStr(sg_pedido2.cells[1,i]);//ref_fabrica

      if sg_pedido2.cells[2,i]<>'' then
        cmd:=cmd+ ','+ QuotedStr(sg_pedido2.cells[2,i]);//unidade

      if sg_pedido2.cells[3,i]<>'' then
        cmd:=cmd+ ','+ QuotedStr(sg_pedido2.cells[3,i]);//qtd_embalagem

      if sg_pedido2.cells[4,i]<>'' then
        cmd:=cmd+ ','+ QuotedStr(sg_pedido2.cells[4,i]);//qtd

      if sg_pedido2.cells[5,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[5,i]);//qtd_recebida

      if sg_pedido2.cells[6,i]<>'' then
        cmd:=cmd+','+QuotedStr(sg_pedido2.cells[6,i]);//id_cor

      if sg_pedido2.cells[7,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[7,i]);//id_tamanho

      if sg_pedido2.cells[8,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[8,i]);//custo_bruto

      if sg_pedido2.cells[9,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[9,i]);//desconto

      if sg_pedido2.cells[10,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[10,i]);//custo_liquido

      if sg_pedido2.cells[11,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[11,i]);//marckup

      if sg_pedido2.cells[12,i]<>'' then
        cmd:=cmd+ ','+QuotedStr(sg_pedido2.cells[12,i]);//preço venda

      if Prnr_documento.text<>'' then
        cmd:=cmd+ ','+QuotedStr(Prnr_documento.text);//inserindo o nr_ documento

      if Prcod_fornecedor.text<>'' then
        cmd:=cmd+ ','+QuotedStr(Prcod_fornecedor.text);//inserindo o cod_fornecedor

      cmd:= cmd +')';

      dao.Execsql(cmd);
    end;
  end;
  FORMATSETTINGS.DecimalSeparator:=',';
end;

procedure TFr_pedidos.btcanClick(Sender: TObject);
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
        limpa_campos('Hp');
        limpa_sg_pedidos;
        limpa_sg_historico;
        sg_pedido2.Options := sg_pedido2.Options + [goEditing];
        sg_historico.Options := sg_pedido2.Options + [goEditing];
        lb_colecao.caption:='...';
        lb_fornecedor.caption:='...';
        id_historico.Text:='';
      end
      else
      if modo_insert = false then
      begin
        mostra_campos('Pr');
        sg_pedido2.Options := sg_pedido2.Options - [goEditing];
      end;
    end
    else
      exit;
  except
  end;
    readonly_true('Pr');
end;

procedure TFr_pedidos.btexcClick(Sender: TObject);
begin
  if Prnr_documento.Text='' then
  begin
    showmessage('Selecione um Pedido para Excluír!');
    exit;
  end;
  if MessageDlg('Deseja excluír o pedido?',mtConfirmation,[mbYes,mbno],0)=mryes then
  begin
    try
      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.Execsql('delete from pedidos1 where nr_documento ='+QuotedStr(Prnr_documento.Text)+' and cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text) );
      dao.Execsql('delete from pedidos2 where nr_documento ='+QuotedStr(Prnr_documento.Text)+' and cod_fornecedor ='+quotedstr(Prcod_fornecedor.text));
      dao.Execsql('delete from pedido_historico where nr_pedido ='+QuotedStr(Prnr_documento.Text)+' and cod_fornecedor ='+quotedstr(Prcod_fornecedor.text));
      dao.cn.Commit;
      dao.msg('Pedido excluído com sucesso!');
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro na exclusão do pedido! '+
        e.message);
      end;
    end;
  readonly_true('Pr');
  limpa_campos('Pr');
  limpa_campos('Hp');
  limpa_sg_pedidos;
  limpa_sg_historico;
  sg_pedido2.Options := sg_pedido2.Options - [goEditing];
  end;
end;

procedure TFr_pedidos.BtproClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
 //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
begin
  if Btnov.enabled=false then
  begin
    showmessage('Você deve gravar ou cancelar as informações antes de localizar!');
    exit;
  end;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar pedido';

  chamou_pesquisa:= 'fr_compra';
  chamou_form := 'fr_compra';
  chamou_cadastro := 'fr_compra';

  Fr_localizar.BT_cadastro.visible:=false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,6);
  Campos_combo[0] := 'Número do Sistema';
  Campos_combo[1] := 'Número Pedido Fornecedor';
  Campos_combo[2] := 'Razão Social';
  Campos_combo[3] := 'Fantasia';
  Campos_combo[4] := 'Data';
  Campos_combo[5] := 'Coleção';

  for i:=0 to 5 do
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

procedure TFr_pedidos.Prcod_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if (key = #13) and (Prcod_fornecedor.text<>'') then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
  if (key = #13) and (Prcod_fornecedor.text='') then
  begin
    if (BtNov.Enabled = false) and (Prcod_fornecedor.Text='') then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_compra_fornecedor';
      chamou_cadastro := 'Fr_fornecedor';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fornecedores';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo,4);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Razão Social';
      Campos_combo[2] := 'Fantasia';
      Campos_combo[3] := 'Cidade';

      for i:=0 to 3 do
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
    key:= #0;
  end;
end;


procedure TFr_pedidos.Prcod_fornecedorButtonClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if (BtNov.Enabled = false) then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption:='Localizar Fornecedor';
    chamou_pesquisa := 'fr_fornecedor';
    chamou_form := 'fr_compra_fornecedor';
    chamou_cadastro := 'Fr_fornecedor';

    Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Fornecedores';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo,4);
    Campos_combo[0] := 'Código';
    Campos_combo[1] := 'Razão Social';
    Campos_combo[2] := 'Fantasia';
    Campos_combo[3] := 'Cidade';

    for i:=0 to 3 do
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


procedure TFr_pedidos.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
     lb_fornecedor.Caption:= '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social, fantasia, lucro_definido, cod_fornecedor from fornecedor where cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lb_fornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString+' / '+ dao.Q2.fieldbyname('fantasia').AsString;
      sg_pedido2.Cells[11,1]:= FormatFloat('###,##0.00', (FMFUN.Str_to_float(dao.Q2.fieldbyname('lucro_definido').AsString,0)/100));

      dao.Geral3('select giro from giro_fornecedor where cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text));
      if dao.Q3.RecordCount >0 then
      begin
        dao.Q3.Last;
        zzgiro.Text:= dao.Q3.fieldbyname('giro').AsString;
      end;

    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text:= '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_pedidos.Prcod_colecaoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  if (key = #13) and (Prcod_colecao.Text='') then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption:='Localizar coleção';
    chamou_pesquisa := 'fr_colecao';
    chamou_form := 'fr_compra_colecao';
    chamou_cadastro := 'fr_colecao';

    Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Coleção';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo,2);
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
    SelectNext(sender as TWinControl, true, true);
    key:=#0;

  end;
end;


procedure TFr_pedidos.Prcod_colecaoButtonClick(Sender: TObject);
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

    Fr_localizar.Caption:='Localizar coleção';
    chamou_pesquisa := 'fr_colecao';
    chamou_form := 'fr_compra_colecao';
    chamou_cadastro := 'fr_colecao';

    Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Coleção';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo,2);
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

procedure TFr_pedidos.Prcod_colecaoExit(Sender: TObject);
begin
  if trim(Prcod_colecao.text) = '' then
     Lb_colecao.Caption:= '...';
  if Prcod_colecao.text <> '' then
  begin
    dao.Geral2('select descricao, id from colecao where id='+QuotedStr(Prcod_colecao.text));
    if dao.q2.RecordCount > 0 then
    begin
      Lb_colecao.Caption := dao.Q2.fieldbyname('descricao').AsString;
      busca_cota_colecao(Prcod_colecao.Text,Prcod_fornecedor.Text);
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_colecao.Text:= '';
      Prcod_colecao.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_pedidos.sg_pedido2CellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  if newcol=13 then
  begin
   // allow:=false;
    //sg_pedido2.cells[oldcol ,sg_pedido2.Row];

  end;

    sg_pedido2.FloatingFooter.ColumnCalc[7]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[8]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[9]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[10]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[11]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[12]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[13]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[14]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[15]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[16]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[17]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[18]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[19]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[20]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[21]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[22]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[23]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[24]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[25]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[26]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[27]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[28]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[29]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[30]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[31]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[32]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[33]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[34]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[35]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[36]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[37]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[38]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[39]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[40]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[41]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[42]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[43]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[44]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[45]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[46]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[47]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[48]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[49]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[50]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[51]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[52]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[53]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[54]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[55]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[56]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[57]:= acSUM;
    sg_pedido2.FloatingFooter.ColumnCalc[58]:= acSUM;


    Prtotal_custo.Value:= sg_pedido2.ColumnSum(10,1,sg_pedido2.RowCount);
    Prtotal_venda.Value:= sg_pedido2.ColumnSum(12,1,sg_pedido2.RowCount);

end;

procedure TFr_pedidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra_hist.Enabled = true then
  begin
    raise Exception.Create('Grave ou cancele o historico antes de sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

  if btgra.Enabled = true then
  begin
    raise Exception.Create('Grave ou cancele as informações antes de sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;
end;

procedure TFr_pedidos.Formulariodepedido1Click(Sender: TObject);
begin
  if Prnr_documento.text='' then
  begin
    showmessage('Selecione um Pedido para Imprimir um Formulário!');
    exit;
  end;

  with dm.q_pedidos do
  begin
    close;
    sql.clear;
    sql.add('Select p1.*, p2.nom_produto, p2.ref_fabrica, p2.unidade, p2.qtd_embalagem, '+
            'p2.qtd, p2.cor, p2.tamanho, p2.custo_bruto, p2.desconto, '+
            'p2.custo_liquido, p2.marckup, p2.preco_venda, '+
            'cl.id, cl.descricao, f.cod_fornecedor, '+
            'f.fantasia, f.razao_social from pedidos1 p1 '+
            'left join pedidos2 p2 on (p2.nr_documento = p1.nr_documento) and (p2.cod_fornecedor = p1.cod_fornecedor) '+
            'left join colecao cl on cl.id = p1.cod_colecao '+
            'left join fornecedor f on f.cod_fornecedor = p1.cod_fornecedor '+
            'where p2.nr_documento='+quotedstr(Prnr_documento.text)+' and p2.cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text));
    open;
  end;
  if not fr_relatorio.LoadFromFile('C:\orbi\Relatorios\pedidos.fr3') then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema'+#13+'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;

procedure TFr_pedidos.Prnr_pedido_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_pedidos.btgra_histClick(Sender: TObject);
begin
  if btnov.enabled=true then
  begin
    showmessage('Você deve iniciar ou alterar um pedido para poder acrescentar histórico');
    exit;
  end;

  if Prcod_fornecedor.Text = '' then
  begin
    dao.msg('O campo fornecedor deve ser preenchido!');
    Prcod_fornecedor.SetFocus;
    exit;
  end;
  if Prnr_documento.Text = '' then
  begin
    dao.msg('O campo numero do documento deve ser preenchido!');
    exit;
  end;

  if Hpdescricao.Text = '' then
  begin
    dao.msg('A descrição deve estar preenchida!');
    Hpdescricao.SetFocus;
    exit;
  end;

  Hpdata.Date:=Date;
  Hphora.Text:= timetostr(now);
  ed_usuario.text:= nom_usuario;
  Hpcod_usuario.Text:= cod_usuario;
  Hpcod_fornecedor.text:= Prcod_fornecedor.text;
  Hpnr_pedido.text:= Prnr_documento.Text;

  Hpdescricao.ReadOnly:=true;

  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
  if modo_insert_hist=true then
  begin
    if sg_historico.cells[1,sg_historico.rowcount -1] <> '' then
       Sg_historico.addrow;
    id:= dao.insert('Hp','pedido_historico','id', Fr_pedidos, 'gen_pedido_historico');
    Sg_historico.cells[0,sg_historico.RowCount-1]:=Hpdata.Text;
    Sg_historico.cells[1,sg_historico.RowCount-1]:=Hphora.text;
    Sg_historico.cells[2,sg_historico.RowCount-1]:=Hpdescricao.Text;
    Sg_historico.cells[3,sg_historico.RowCount-1]:=id;
    id_historico.text:=id;
  end
  else
  begin
    dao.update('pedido_historico','id',id_historico.Text,'Hp', Fr_pedidos);
    Sg_historico.cells[0,sg_historico.Row]:=Hpdata.Text;
    Sg_historico.cells[1,sg_historico.Row]:=Hphora.text;
    Sg_historico.cells[2,sg_historico.Row]:=Hpdescricao.Text;
  end;
  dao.cn.Commit;

  btnov_hist.Enabled:=true;
  btalt_hist.Enabled:=true;
  btgra_hist.Enabled:=false;
  btcan_hist.Enabled:=False;
  btexc_hist.Enabled:=true;
end;

procedure TFr_pedidos.btnov_histClick(Sender: TObject);
begin
  if btnov.enabled=true then
  begin
    showmessage('Você deve iniciar ou alterar um pedido para poder acrescentar histórico!');
    exit;
  end;
  limpa_campos('Hp');

  modo_insert_hist:=true;

  btnov_hist.Enabled:=false;
  btalt_hist.Enabled:=false;
  btgra_hist.Enabled:=true;
  btcan_hist.Enabled:=true;
  btexc_hist.Enabled:=false;

  Hpdescricao.ReadOnly:=false;
end;

procedure TFr_pedidos.btalt_histClick(Sender: TObject);
begin
  if btnov.enabled=true then
  begin
    showmessage('Você deve iniciar ou alterar um pedido para poder acrescentar histórico!');
    exit;
  end;
  if id_historico.text= '' then
  begin
    showmessage('Selecione um histórico para alterar!');
    exit;
  end;


  modo_insert_hist:=false;
  ed_usuario.text:= nom_usuario;
  Hpcod_usuario.Text:= cod_usuario;
  Hpcod_fornecedor.text:= Prcod_fornecedor.text;
  Hpnr_pedido.text:= Prnr_documento.Text;

  Btnov_hist.Enabled:=false;
  btalt_hist.Enabled:=false;
  btgra_hist.Enabled:=true;
  btcan_hist.Enabled:=true;
  btexc_hist.Enabled:=false;
  Hpdescricao.ReadOnly:=false;

end;

procedure TFr_pedidos.BtnovClick(Sender: TObject);
begin
  modo_insert:=true;
  Limpa_campos('Pr');
  limpa_campos('Hp');
  limpa_sg_pedidos;
  limpa_sg_historico;
  readonly_false('Pr');
  id_historico.Text:='';

  lb_fornecedor.Caption:='...';
  Lb_colecao.Caption:='...';
  RB_pedido.Checked:=True;
  RB_ordem.Checked:=false;
  monta_sg_pedido2;
  sg_pedido2.Options := sg_pedido2.Options + [goEditing];

  dao.geral1('select nextval(''gen_pedido1'') as gen_id from configuracao');

  Prnr_documento.text:= floattostr(dao.q1.fieldbyname('gen_id').AsFloat + 1);
  if not dao.cn.InTransaction then dao.cn.StartTransaction;
  dao.Execsql('set generator gen_pedido1 to '+Prnr_documento.Text);
  dao.cn.Commit;

  //habilita botões
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  Prnr_pedido_fornecedor.SetFocus;

  sg_pedido2.cells[4,1]:= '0';
  sg_pedido2.cells[5,1]:= '0';


end;

procedure TFr_pedidos.btaltClick(Sender: TObject);
begin
  modo_insert:=false;
  readonly_false('Pr');
  //habilita botões
  Btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  sg_pedido2.Options := sg_pedido2.Options + [goEditing];
end;

procedure TFr_pedidos.btgraClick(Sender: TObject);
begin
  if Prcod_fornecedor.Text = '' then
  begin
    dao.msg('O campo fornecedor deve ser preenchido!');
    Prcod_fornecedor.SetFocus;
    exit;
  end;
  if Prcod_colecao.Text = '' then
  begin
    dao.msg('O campo coleção deve ser preenchido!');
    Prcod_colecao.SetFocus;
    exit;
  end;
  if Prdta_pedido.Text =  '  /  /    ' then
  begin
    dao.msg('A data do pedido deve ser preenchido!');
    Prcod_colecao.SetFocus;
    exit;
  end;
  if sg_pedido2.cells[0,1] = '' then
  begin
    showmessage('O produto deve estar preenchido!');
    exit;
  end;
  if sg_pedido2.cells[1,1]='' then
  begin
    showmessage('A ref. de fabrica deve estar preenchida!');
    exit;
  end;
  if sg_pedido2.cells[12,1]='' then
  begin
    showmessage('O preço de venda deve estar preenchido!');
    exit;
  end;
  if (rb_pedido.Checked = false) and (rb_ordem.Checked = false) then
  begin
    showmessage('Você deve selecionar o tipo de pedido!');
    exit;
  end;

  Screen.Cursor := crSQLWait;

  btnov.Enabled:=true;
  btalt.Enabled:=true;
  btgra.Enabled:=false;
  btcan.Enabled:=False;
  btexc.Enabled:=true;

  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
  if modo_insert then
  begin
    id:= dao.insert('Pr','pedidos1','id',Fr_pedidos,'GEN_PEDIDO1');
    Prnr_documento.Text:=id;
    ativa_pedido1(Prnr_documento.Text, Prcod_fornecedor.Text);
    btNov.setFocus;
  end
  else
    dao.update('pedidos1','nr_documento','cod_fornecedor',Prnr_documento.Text,Prcod_fornecedor.Text,'Pr', Fr_pedidos);


  grava_pedidos2;
  dao.cn.Commit;

  if rb_pedido.Checked then
     dao.Execsql('update pedidos1 set tipo_pedido = ''pedido'' where nr_documento ='+quotedstr(Prnr_documento.Text))
  else
     dao.Execsql('update pedidos1 set tipo_pedido = ''ordem'' where nr_documento ='+quotedstr(Prnr_documento.Text));
  dao.cn.commit;


  Screen.Cursor := crDefault;
  readonly_true('Pr');
  sg_pedido2.Options := sg_pedido2.Options - [goEditing];
end;

procedure TFr_pedidos.btcan_histClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      btnov_hist.Enabled:=true;
      btalt_hist.Enabled:=true;
      btgra_hist.Enabled:=false;
      btcan_hist.Enabled:=False;
      btexc_hist.Enabled:=true;

      if modo_insert_hist=true then
         Hpdescricao.Text:=''
      else
        Hpdescricao.text:=Sg_historico.Cells[2,sg_historico.row];
    end
    else
      exit;
  except
  end;
    Hpdescricao.ReadOnly:=true;
end;

procedure TFr_pedidos.btexc_histClick(Sender: TObject);
begin
  if Sg_historico.Row < 0 then
  begin
    showmessage('Selecione um histórico para excluír!');
    exit;
  end;

  if MessageDlg('Deseja excluír este histórico?',mtConfirmation,[mbYes,mbno],0)=mryes then
  begin
    try
      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.Execsql('delete from pedido_historico where id ='+QuotedStr(id_historico.text));
      if Sg_historico.Row = 1 then
      sg_historico.ClearRowSelect
      else
      Sg_historico.RemoveRows(sg_historico.Row,1);

      dao.msg('Histórico excluído com sucesso!');
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro na exclusão do histórico! '+
        e.message);
      end;
    end;
  end;
  Hpdescricao.ReadOnly:=true;
end;

procedure TFr_pedidos.iguala_linhas;
begin
  with sg_pedido2 do
  begin
    addrow;

    cells[1,sg_pedido2.RowCount-1]:= sg_pedido2.cells[1,sg_pedido2.RowCount-2];
    cells[2,sg_pedido2.RowCount-1]:= sg_pedido2.cells[2,sg_pedido2.RowCount-2];
    cells[3,sg_pedido2.RowCount-1]:= sg_pedido2.cells[3,sg_pedido2.RowCount-2];
    cells[4,sg_pedido2.RowCount-1]:= sg_pedido2.cells[4,sg_pedido2.RowCount-2];
    cells[5,sg_pedido2.RowCount-1]:= sg_pedido2.cells[5,sg_pedido2.RowCount-2];
    cells[6,sg_pedido2.RowCount-1]:= sg_pedido2.cells[6,sg_pedido2.RowCount-2];

  end;
end;

procedure TFr_pedidos.Prprazo_maximoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as twincontrol, true, true);
  end;

  if not(key in ['0'..'9', #8]) then
  key := #0;

end;

procedure TFr_pedidos.sg_pedido2KeyPress(Sender: TObject; var Key: Char);
var
  enter: Boolean;
begin
  enter:=false;
  if key<>#13 then
     enter:=false
  else
     enter:=true;

  if (key=#13) and (sg_pedido2.col=56) then
  begin
    iguala_linhas;
    Sg_pedido2.Row:=sg_pedido2.RowCount-1;
    sg_pedido2.col:=0;
    exit;
  end;

  if (key=#13) and (enter=true) then
  begin
    sg_pedido2.Col:= sg_pedido2.col+1;
    enter:=true;
    exit;
  end;
end;

procedure TFr_pedidos.Sg_historicoCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  if Sg_historico.cells[3,NewRow]<>'' then
  begin
    id_historico.text:= Sg_historico.cells[3,NewRow];
    Hpdescricao.Text:= Sg_historico.cells[2,NewRow];
  end;
end;

procedure TFr_pedidos.Prnr_documentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_pedidos.Prdta_pedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

procedure TFr_pedidos.ativa_historico(nr_documento,
  cod_fornecedor: String);
begin
  with q_historico do
  begin
    close;
    sql.clear;
    sql.add('select id ,data, hora, descricao, nr_pedido, cod_fornecedor from pedido_historico where nr_pedido='+QuotedStr(nr_documento)+' and cod_fornecedor ='+ QuotedStr(cod_fornecedor));
    open;
  end;

end;

procedure TFr_pedidos.carrega_historico;
var
  x:integer;
begin
  sg_historico.ClearNormalCells;
  sg_historico.RowCount:=2;
  if q_historico.recordcount>=1 then
  begin
    q_historico.first;
    x:=1;
    while not (q_historico.eof) do
    begin
      sg_historico.cells[0,x]:=q_historico.fieldbyname('data').AsString;
      sg_historico.cells[1,x]:=q_historico.fieldbyname('hora').AsString;
      sg_historico.cells[2,x]:=q_historico.fieldbyname('descricao').AsString;
      sg_historico.cells[3,x]:=q_historico.fieldbyname('id').AsString;
      q_historico.Next;
      if not q_historico.eof then
      begin
        sg_historico.addrow;
        x:=x+1;
      end;
    end;
  end;
end;

procedure TFr_pedidos.envia_email;
begin

end;


procedure TFr_pedidos.limpa_sg_historico;
begin
  sg_historico.ClearNormalCells;
  sg_historico.RowCount:=2;
end;

procedure TFr_pedidos.limpa_sg_pedidos;
begin
  sg_pedido2.ClearNormalCells;
  sg_pedido2.RowCount:=3;
end;

procedure TFr_pedidos.fr_relatorioGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'empresa' then
     Value:= nom_empresa
end;

procedure TFr_pedidos.sg_pedido2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  lin:= ARow;
  col:=ACol;
end;

procedure TFr_pedidos.sg_pedido2CellsChanged(Sender: TObject; R: TRect);
var
 custo_liquido: Real;
begin

  if (col=4) or (col=6) or (col=7) then//or (col=4) or (col=10) or (col=11) then
  begin
    custo_liquido:= FMFUN.Str_to_float(sg_pedido2.Cells[8,lin],0) * FMFUN.Str_to_float(sg_pedido2.Cells[4,lin],0);
    sg_pedido2.Cells[6,lin]:= FormatFloat('###,##0.00', custo_liquido);
    sg_pedido2.Cells[7,lin]:= formatfloat('###,##0.00',custo_liquido+(custo_liquido * ((FMFUN.Str_to_float(sg_pedido2.Cells[11,lin],0)*100)/100)));
    Prtotal_custo.Value:= sg_pedido2.ColumnSum(10,1,sg_pedido2.RowCount);
    Prtotal_venda.Value:= sg_pedido2.ColumnSum(12,1,sg_pedido2.RowCount);

  end;

end;

procedure TFr_pedidos.Prcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_compra_empresa';
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

procedure TFr_pedidos.Prcod_empresaExit(Sender: TObject);
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

procedure TFr_pedidos.Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
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
      chamou_form := 'fr_compra_empresa';
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

procedure TFr_pedidos.busca_cota_colecao(cod_colecao, cod_fornecedor: string);
var
  data: string;
begin
  dao.Geral1('select p2.preview, p2.col_principal, p2.alto_verao from pre_pedido2 p2 '+
             'left join pre_pedido1 p1 on p1.id = p2.id_pre1 '+
             'where p1.cod_colecao='+QuotedStr(cod_colecao)+' and cod_fornecedor='+QuotedStr(cod_fornecedor));

  if dao.Q1.RecordCount > 0 then
  begin
    zzpreview.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('preview').AsFloat);
    zzcol_principal.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('col_principal').AsFloat);
    zzalto_verao.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('alto_verao').AsFloat);
  end
  else
  begin
    dao.msg('Não Foi Encontrado um Pre-Pedido para essa coleção!');

  end;

  //cotas da ultima coleção
  dao.Geral2('select id from colecao where  extract(year from dt_inicio_colecao)='+ floattostr(strtofloat(Copy(Prdta_pedido.Text,7,4))-1));

  dao.Geral1('select p2.preview, p2.col_principal, p2.alto_verao from pre_pedido2 p2 '+
             'left join pre_pedido1 p1 on p1.id = p2.id_pre1 '+
             'where p1.cod_colecao='+QuotedStr(dao.Q2.fieldbyname('id').AsString)+' and cod_forncedor='+QuotedStr(cod_fornecedor));
  if dao.Q1.RecordCount > 0 then
  begin
    zzPreview_ant.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('preview').AsFloat);
    zzcol_principal_ant.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('col_principal').AsFloat);
    zzAlto_verao_ant.Text:= FormatFloat('##,###0.00',dao.Q1.fieldbyname('alto_verao').AsFloat);
  end








end;

procedure TFr_pedidos.sg_pedido2GeTsEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
  1:begin
      AEditor := edComboEdit;
      sg_pedido2.ClearComboString;
      sg_pedido2.AddComboString('ABRIGO');
      sg_pedido2.AddComboString('ACESSORIO');
      sg_pedido2.AddComboString('BERMUDA');
      sg_pedido2.AddComboString('BLUSA');
      sg_pedido2.AddComboString('BLUSÃO');
      sg_pedido2.AddComboString('CALÇA');
      sg_pedido2.AddComboString('CAMISA');
      sg_pedido2.AddComboString('CAMISETA');
      sg_pedido2.AddComboString('CAMISOLA');
      sg_pedido2.AddComboString('CASACO');
      sg_pedido2.AddComboString('CINTO');
      sg_pedido2.AddComboString('JAQUETA');
      sg_pedido2.AddComboString('MINI-SAIA');
      sg_pedido2.AddComboString('VESTIDO');
      sg_pedido2.AddComboString('SAIA');
    end;
  end;
end;
end.













