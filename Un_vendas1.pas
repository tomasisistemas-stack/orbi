unit Un_vendas;
{ ********

}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, Menus, Grids,
  BaseGrid, AdvGrid,   ActnMan, ActnColorMaps,
  ComCtrls, ACBrBase, ACBrECF, ACBrRFD, ComObj, JvExExtCtrls,
  JvNavigationPane,  JvExStdCtrls, JvCheckBox, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox;

type
  TFr_vendas = class(TForm)
    MainMenu1: TMainMenu;
    Atalho21: TMenuItem;
    Panel1: tsPanel;
    Label9: tsLabel;
    PrNumDoc: TsEdit;
    PrDtaDoc: TsDateEdit;
    q_log: TFDQuery;
    q_venda2: TFDQuery;
    q_venda1: TFDQuery;
    Pa_faturamento: tsPanel;
    StandardColorMap1: TStandardColorMap;
    F2EstoqueDetalhado1: TMenuItem;
    Label2: tsLabel;
    Prcod_fop: TsComboEdit;
    Lbnom_fop: tsLabel;
    Prprazo_pgto: TMaskEdit;
    Label8: tsLabel;
    bt_localizar: TsBitBtn;
    CancelarFaturamento1: TMenuItem;
    Relatrios1: TMenuItem;
    RecebimentoCaixa1: TMenuItem;
    VendasporFormadePgto1: TMenuItem;
    Panel5: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc_Merc: TsBitBtn;
    bt_imprimir: TsBitBtn;
    Q_exc_merc: TFDQuery;
    Sb_Vendas: TStatusBar;
    OpesdaECF1: TMenuItem;
    EmitirLeituraX1: TMenuItem;
    EmitirReduoZ1: TMenuItem;
    CancelaUltimoCupom1: TMenuItem;
    Label6: tsLabel;
    Prqtd_parcelas: TsCurrencyEdit;
    Panel6: tsPanel;
    LbTotal_Liquido: tsLabel;
    Prtot_bruto: TsCurrencyEdit;
    LbTotal_Bruto: tsLabel;
    Prtot_liquido: TsCurrencyEdit;
    Label1: tsLabel;
    Prponto_usado: TsCurrencyEdit;
    zzvalor_credito: TsCurrencyEdit;
    Label3: tsLabel;
    Btcredito: TsBitBtn;
    Prdta_vencimento_consig: TsDateEdit;
    PC_vendas: TPageControl;
    tab_mercadorias: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: tsPanel;
    Label11: tsLabel;
    Lbnom_cliente: tsLabel;
    Lb_usuario: tsLabel;
    Lbnom_representante: tsLabel;
    Lb_orcamento: tsLabel;
    Lb_consignacao: tsLabel;
    Lb_entregue: tsLabel;
    Prcod_cliente: TsComboEdit;
    Prcod_representante: TsComboEdit;
    Prorcamento: TComboBox;
    Prconsignacao: TComboBox;
    ComboBox2: TComboBox;
    Prcod_empresa: TsEdit;
    Panel4: tsPanel;
    sgx: TAdvStringGrid;
    Prhora: TsEdit;
    q_cr1: TFDQuery;
    IB_Grid1: TIB_Grid;
    GroupBox8: TsGroupBox;
    Label30: tsLabel;
    Label31: tsLabel;
    Label51: tsLabel;
    Lbnom_fop_cr1: tsLabel;
    JvNavPanelDivider2: TJvNavPanelDivider;
    Crdtaven: TsDateEdit;
    Crvalor: TsCurrencyEdit;
    Crcod_fop: TsComboEdit;
    Crid: TsEdit;
    ds_cr1: TIB_DataSource;
    Button1: TButton;
    patroca: tsPanel;
    Label4: tsLabel;
    Label5: tsLabel;
    Prcontem_etiqueta: tsCheckbox;
    Prcontem_avaria: tsCheckbox;
    Prmotivo_troca: TRichEdit;
    Prnr_venda_original: TsEdit;
    Lbnr_venda_original: tsLabel;
    Prdesconto: TsCurrencyEdit;
    Lbdesconto: tsLabel;
    Prcredito_usado: TsCurrencyEdit;
    Label10: tsLabel;
    SpeedButton1: TsSpeedButton;
    Label12: tsLabel;
    Btinsere_cheque: TsBitBtn;
    Pacheque: tsPanel;
    Label57: tsLabel;
    Sg_cheque: TAdvStringGrid;
    HistoricodeProduto1: TMenuItem;
    procedure sgxKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure sgxCellChanging(Sender: TObject; OldRow, OldCol, NewRow,
      NewCol: Integer; var Allow: Boolean);
    procedure sgxClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgxSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgxCellsChanged(Sender: TObject; R: TRect);
    procedure sgxRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure Atalho21Click(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure F2EstoqueDetalhado1Click(Sender: TObject);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure sgxCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure bt_localizarClick(Sender: TObject);
    procedure ProrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure PrdescontoExit(Sender: TObject);
    procedure Prtot_liquidoKeyPress(Sender: TObject; var Key: Char);
    procedure btexc_MercClick(Sender: TObject);
    procedure CancelarFaturamento1Click(Sender: TObject);
    procedure sgxExit(Sender: TObject);
    procedure EmitirLeituraX1Click(Sender: TObject);
    procedure EmitirReduoZ1Click(Sender: TObject);
    procedure CancelaUltimoCupom1Click(Sender: TObject);
    procedure Prqtd_parcelasExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrconsignacaoExit(Sender: TObject);
    procedure ProrcamentoExit(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure BtcreditoClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Prtot_liquidoExit(Sender: TObject);
    procedure sgxxxKeyPress(Sender: TObject; var Key: Char);
    procedure sgxxxCellChanging(Sender: TObject; OldRow, OldCol, NewRow,
      NewCol: Integer; var Allow: Boolean);
    procedure sgxxxCellsChanged(Sender: TObject; R: TRect);
    procedure sgxxxClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgxxxExit(Sender: TObject);
    procedure sgxxxRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure sgxxxSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure q_cr1AfterScroll(IB_Dataset: TIB_Dataset);
    procedure Button1Click(Sender: TObject);
    procedure Crcod_fopExit(Sender: TObject);
    procedure Crcod_fopButtonClick(Sender: TObject);
    procedure Crcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure Prnr_venda_originalExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Btinsere_chequeClick(Sender: TObject);
    procedure HistoricodeProduto1Click(Sender: TObject);

  private
    procedure ativa_cr1(numdoc: String);
    { Private declarations }
  public
    { Public declarations }
//    insert_mode: Boolean;
    modo_insert: Boolean;
    edit_sg, id: String;
    linmax, lin_excluir : integer;

    procedure InsLinha(var SGX: TAdvStringGrid);

    procedure busca_produto;
    procedure busca_produto_unitario(leitor: boolean; cod_barras:String);

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_venda1(nr_documento: String);
    procedure ativa_venda2(nr_documento: String);

//   procedure ativa_entrada(id: String);//carrega a query q_produto
//    procedure ativa_entrada2(id: String);//carrega a query q_produto_fornecedor
//    procedure carrega_entrada2(nr_documento: String; cod_fornecedor: String);//carrega a query q_produto_fornecedor cod todos os forn. do produto
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

    procedure Grava_Sgx(insert : Boolean);
    procedure Faturar;
    procedure DeletaLinha(Linha: Integer);
    procedure mostra_sgx(numdoc: String);
    procedure monta_sgx;

    procedure Finaliza_venda(tipovenda : String);

    function verifica_produto(numdoc:string): boolean;//verifica qual foi o desconto do produto e se ele foi comprado realmente;
    procedure verifica_status_venda(n_documento:String);//verifica status da venda e preenche o statusbar

    procedure grava_venda_matriz;

    procedure grava_devolucao;
    function busca_credito(c_cliente: String):String;//busca os créditos e mostra no campo de credito do vendas
    procedure grava_credito_cliente(c_cliente, vl_credito, n_venda_original, nr_documento, obs, data: String);

    procedure cancelar_faturamento(usuario_desfaturou : String);//recebe como parametro o usuário que desfaturou que vem do fr_senha_especial
    procedure comprovante_venda;
    procedure comprovante_credito;
    procedure MontaTermoConsignacao(n_documento: String);
  end;

var
  Fr_vendas: TFr_vendas;
  EditarSGX: Boolean;
implementation

uses UnPri, Un_localizar, Un_dao, Un_estoque_detalhado, Math, UnFun,
  Un_sel_atributo, Un_sel_tipo_venda, UnSenha_especial, Un_credito,
  Un_vendas_industria2, Un_credito_fidelidade, Un_cheque_terceiros,
  Un_pesquisa_produto_vendas;

{$R *.dfm}

procedure TFr_vendas.sgxKeyPress(Sender: TObject;
  var Key: Char);
var
  qtd_char:integer;
  qtd, cod, tamanho : String;

begin
  If edit_sg = 'N' then
     Exit;

  If edit_sg = 'S' then
  begin
    if sgx.col = 1 then
    begin
      {If not( key in['0'..'9',#8] ) and (key <> #13) then
      begin
         beep;{somente delphi 2.0 ou >}
        // key:=#0;}
      //end;
    end;

    if (key=#13) then
    begin
      if (SGX.Col = 1) then
        if (sgx.Cells[1,lin]='') then
        begin
          busca_produto;
          if Fr_localizar.Qu_localizar.Active then
          begin
            sgx.Cells[2,lin]:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
            sgx.Cells[3,lin]:= '1';
            if mform = 'vendas' then
            begin
              sgx.Cells[5,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
              if sgx.Cells[4,lin] = '' then
                 sgx.Cells[4,lin] := '0';
              sgx.Cells[6,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
              sgx.Cells[9,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
              sgx.Cells[10,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);

            end;
            if Fr_localizar.Qu_localizar.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[7,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
                //modificado felipe 31/12/2008
                if (sgx.cells[7,lin] <> '') and (sgx.cells[8,lin] <> '') then
                begin
                  dao.Geral1('select * from grade where cod_produto='+QuotedStr(sgx.Cells[1,lin])+' and id_cor='+quotedStr(sgx.cells[7,lin])+' and id_tamanho='+quotedStr(sgx.cells[8,lin]));
                  if dao.Q1.RecordCount < 1 then
                  begin
                    dao.msg('A GRADE DIGITADA NÃO FOI ENCONTRADA NO CADASTRO DO PRODUTO!');
                    sgx.Cells[1,lin]:= '';
                    sgx.Cells[2,lin]:= '';
                    sgx.Cells[3,lin]:= '';
                    sgx.Cells[4,lin]:= '';
                    sgx.Cells[5,lin]:= '';
                    sgx.Cells[6,lin]:= '';
                    sgx.Cells[7,lin]:= '';
                    sgx.Cells[8,lin]:= '';
                    sgx.Cells[9,lin]:= '';
                    sgx.Cells[10,lin]:= '';
                    exit;
                  end;
                end
                else
                begin
                  dao.msg('DEVE SER INFORMADO A COR E TAMANHO DO PRODUTO!');
                  sgx.Cells[1,lin]:= '';
                  sgx.Cells[2,lin]:= '';
                  sgx.Cells[3,lin]:= '';
                  sgx.Cells[4,lin]:= '';
                  sgx.Cells[5,lin]:= '';
                  sgx.Cells[6,lin]:= '';
                  sgx.Cells[7,lin]:= '';
                  sgx.Cells[8,lin]:= '';
                  sgx.Cells[9,lin]:= '';
                  sgx.Cells[10,lin]:= '';
                  exit;
                end;
              end;
            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];

            sgx.Col:= 3;
          end;
        end
        else
        if (Length(sgx.Cells[1,lin])<12) then
        begin
          busca_produto_unitario(False, uppercase(sgx.Cells[1,lin]));

            if dao.Q1.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[7,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
                if (sgx.cells[7,lin] <> '') and (sgx.cells[8,lin] <> '') then
                begin
                  dao.Geral1('select * from grade where cod_produto='+QuotedStr(sgx.Cells[1,lin])+' and id_cor='+quotedStr(sgx.cells[7,lin])+' and id_tamanho='+quotedStr(sgx.cells[8,lin]));
                  if dao.Q1.RecordCount < 1 then
                  begin
                    dao.msg('A GRADE DIGITADA NÃO FOI ENCONTRADA NO CADASTRO DO PRODUTO!');
                    sgx.Cells[1,lin]:= '';
                    sgx.Cells[2,lin]:= '';
                    sgx.Cells[3,lin]:= '';
                    sgx.Cells[4,lin]:= '';
                    sgx.Cells[5,lin]:= '';
                    sgx.Cells[6,lin]:= '';
                    sgx.Cells[7,lin]:= '';
                    sgx.Cells[8,lin]:= '';
                    sgx.Cells[9,lin]:= '';
                    sgx.Cells[10,lin]:= '';
                    exit;
                  end;
                end
                else
                begin
                  dao.msg('DEVE SER INFORMADO A COR E TAMANHO DO PRODUTO!');
                  sgx.Cells[1,lin]:= '';
                  sgx.Cells[2,lin]:= '';
                  sgx.Cells[3,lin]:= '';
                  sgx.Cells[4,lin]:= '';
                  sgx.Cells[5,lin]:= '';
                  sgx.Cells[6,lin]:= '';
                  sgx.Cells[7,lin]:= '';
                  sgx.Cells[8,lin]:= '';
                  sgx.Cells[9,lin]:= '';
                  sgx.Cells[10,lin]:= '';
                  exit;
                end;
              end;

            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];

          if dao.Q1.RecordCount >= 1 then
            if edit_sg = 'S' then
            begin
              if (SGX.Col) = 4 then //se for ultima coluna insere linha nova.
                if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
                begin
                  sgx.Row:= sgx.RowCount - 1;
                  sgx.Col := 1;
                end
                else
                begin
                  InsLinha(SGX);
                  SGX.Col:= 1;
                end;
              end;

        end
        else
        begin
          busca_produto_unitario(true, uppercase(sgx.Cells[1,lin]));
        end
        else
          if SGX.Col = 4 then
            if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
            begin
              sgx.Row:= sgx.RowCount-1;
              sgx.Col:= 1;
            end
            else
            begin
              InsLinha(sgx);
              SGX.Col:= 1;
            end;

        {        if SGX.Col = 3 then
             if sgx.Cells[1,lin] <> '' then
             begin
               InsLinha(sgx);
               if lin <> sgx.RowCount-1 then
                  sgx.Row:= sgx.RowCount-1;
             end
             else
               SGX.Col:= SGX.Col + 1;}
    end;

  end;

  SGX:= TAdvStringGrid(Sender);
  if (SGX.Col = 3) or (SGX.Col = 4) or (SGX.Col = 5) or (SGX.Col = 6) or (SGX.Col = 7) or (SGX.Col = 8) then
  begin
     if Key = '.' then
        Key:= ',';
     if (Key = ',') and (pos(',', SGX.Cells[SGX.RealCol, SGX.Row]) > 0) then
        Key:= #0;

     if not(Key in['0'..'9', ',', #8, #13]) then//Verifica se foi digitado algo diferente
     begin                                      //do que 0 a 9 ou ','
        beep;
        Key:= #0;
     end;
     if (sgx.Col = 3) and (Key=#13) then
     begin
       sgx.Col:= sgx.Col + 1;
     end;
  end;


end;

procedure TFr_vendas.InsLinha(var SGX: TAdvStringGrid);
begin
   sgx.Col:=1;
   SGX.AddRow;
   SGX.Row:=SGX.Row+1;
   lin:= sgx.Row;
end;


procedure TFr_vendas.FormShow(Sender: TObject);
begin
  DecimalSeparator:=',';
  btexc_Merc.Caption:= 'Excluir'+#13+'Mercadoria';
  Btcredito.Caption:= 'Utilizar'+#13+'Créditos';
  Btcredito.Enabled:= false;
  sgx.Options := sgx.Options - [goEditing];
  Sgx.Clear;
  Sgx.RowCount:=2;

  edit_sg:= 'N';

  EditarSGX:=false;
  sgx.ColWidths[0]:=0;
  sgx.Cells[1,0]:= 'CÓDIGO';
  sgx.Cells[2,0]:= 'PRODUTO';
  sgx.Cells[3,0]:= 'QTD';
  sgx.Cells[4,0]:= 'DESC.';
  sgx.Cells[5,0]:= 'PREÇO';
  sgx.Cells[6,0]:= 'TOTAL';
  sgx.Cells[7,0]:= 'id_cor';
  sgx.Cells[8,0]:= 'id_tamanho';
  sgx.Cells[9,0]:= 'preco_bruto';
  sgx.Cells[10,0]:= 'sub_total_bruto';
  sgx.ColWidths[7]:=0;
  sgx.ColWidths[8]:=0;
  sgx.ColWidths[9]:=0;
  sgx.ColWidths[10]:=0;

  limpa_campos('Pr');
  readonly_true('Pr');


  if mform = 'vendas' then
  begin
   patroca.Visible:=false;
   Lbnr_venda_original.Visible:= false;
   Prnr_venda_original.Visible:= false;
   if not (ecf.Ativo) then
      ecf.Ativar;
  end
  else
  if mform = 'devolucao_cliente' then
  begin
    Lb_usuario.Visible:= false;
    Prcod_representante.Visible:= false;
    Lbnom_representante.Visible:= false;

    Lb_orcamento.Visible:= false;
    Prorcamento.Visible:= false;

    Lb_consignacao.Visible:= false;
    Prconsignacao.Visible:= false;

    Lbnr_venda_original.Visible:= true;
    Prnr_venda_original.Visible:= true;
    Btcredito.Visible:= false;
    Pa_faturamento.Visible:= false;
    PC_vendas.Pages[1].TabVisible:= false;
    zzvalor_credito.Visible:= false;
    Prponto_usado.Visible:= false;
    Fr_vendas.Caption:= 'DEVOLUÇÃO DE MERCADORIA CLIENTE PARA LOJA';
    patroca.Visible:=true;
  end
  else
  if mform = 'fechamento_consig' then
  begin
    ativa_venda1(numped);
    ativa_venda2(numped);
    mostra_campos('Pr');
    patroca.Visible:=false;
    Lbnr_venda_original.Visible:= false;
    Prnr_venda_original.Visible:= false;
    mostra_sgx(numped);
    btalt.Click;
  end;

end;

procedure TFr_vendas.btaltClick(Sender: TObject);
begin

  if PrNumDoc.Text = '' then
  begin
    dao.msg('Localize uma Venda!');
    exit;
  end;



{  if not(q_venda1.Active)  then
  begin
    if q_venda1.FieldByName('numdoc').AsString = '' then
    begin
      dao.msg('Localize uma Venda Antes de Alterar');
      exit;
    end;
  end;}

  dao.Geral4('select faturado from vendas1 where numdoc = '+QuotedStr(PrNumDoc.Text));
  if dao.Q4.FieldByName('faturado').AsString = '1' then
  begin
    dao.msg('Venda já Faturada!, chame o Supervisor para Liberar!');
    exit;
  end;

  modo_insert:= false;
  edit_sg:= 'S';
  btnov.Enabled:= false;
  btalt.Enabled:= false;
  btgra.Enabled:= true;
  btcan.Enabled:= true;
  btexc_Merc.Enabled := true;
  Btcredito.Enabled:= true;
  bt_localizar.Enabled:= false;
  readonly_false('Pr');
  Sb_Vendas.Panels[0].Text := 'ALTERANDO';
end;

procedure TFr_vendas.btcanClick(Sender: TObject);
begin
  btnov.Enabled:= true;
  btalt.Enabled:= true;
  btgra.Enabled:= false;
  btcan.Enabled:= false;
  btexc_Merc.Enabled:= false;
  bt_localizar.Enabled:= true;
  Btcredito.Enabled:= false;
  if not(dao.cn.InTransaction) then
     dao.cn.Rollback;

  if modo_insert then
  begin
    limpa_campos('Pr');
    monta_sgx;
  end
  else
  begin
    ativa_venda1(q_venda1.fieldbyname('numdoc').AsString);
    mostra_sgx(q_venda1.fieldbyname('numdoc').AsString);
    mostra_campos('Pr');
  end;
  if not(dao.cn.InTransaction) then (dao.cn.Rollback);
  edit_sg:= 'N';

  Sb_Vendas.Panels[0].Text := '';
end;

procedure TFr_vendas.btgraClick(Sender: TObject);
begin
  if (mform = 'vendas') or (mform = 'fechamento_consig') then
  begin
    if Prtot_liquido.Text = '0' then
    begin
      dao.msg('O Campo de Total Liquido não pode ser 0!');
      exit;
    end;
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('O Campo Cliente Deve ser Preenchido !');
      exit;
    end;
    if Prcod_representante.Text = '' then
    begin
      dao.msg('O Campo Vendedor(a) Deve ser Preenchido!');
      exit;
    end;
    if Prcod_fop.Text = '' then
    begin
      dao.msg('O Campo Forma de Pagamento Deve ser Preenchido!');
      exit;
    end;

    if Length(Prcod_cliente.Text) > 5 then
    begin
      dao.msg('O Campo Código do Campo Cliente está com Mais de 5 Digitos '+#13+'o Código não Deve Ultrapassar 4 digitos '+#13+'Localize Novamente o Cliente!');
      Prcod_cliente.SetFocus;
      exit;
    end;

    if ((Prconsignacao.Text = 'Não') or (Prconsignacao.Text = 'Fechamento')) and (Prorcamento.Text = 'Não') then
    begin
      Application.CreateForm(TFr_sel_tipo_venda, Fr_sel_tipo_venda);
      Fr_sel_tipo_venda.ShowModal;
      tipo_venda:= Fr_sel_tipo_venda.ZZtipovenda.Text ;
    end
    else
      tipo_venda:= 'O';


    if tipo_venda = 'N' then
    begin
      limpa_campos('Pr');
      mostra_sgx('0');
      edit_sg:='N';
      EditarSGX :=true ;
      exit;
    end;

    Prtot_bruto.text:= floattostr(sgx.ColumnSum(10,1,sgx.RowCount));
    if Prtot_liquido.Value < Prtot_bruto.Value then
//       Prtot_liquido.text:= floattostr(sgx.ColumnSum(6,1,sgx.RowCount) - Prcredito_usado.Value);


//    Prtot_liquido.Value:= Prtot_liquido.value - Prvalor_credito_usado.Value;
    Prtot_liquido.Text:= FormatFloat('###,##0.00', Prtot_liquido.Value);
    if Prconsignacao.ItemIndex = 1 then
    begin
      dao.Geral1('select prazo_vencimento_consignacao from configuracao where cod_conf='+QuotedStr('1'));
      Prdta_vencimento_consig.Date := PrDtaDoc.Date + dao.Q1.fieldbyname('prazo_vencimento_consignacao').AsFloat;
    end;
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;

    if modo_insert then
    begin
       id:= dao.insert('Pr','vendas1', 'numdoc', Fr_vendas, 'gen_venda1');
       dao.cn.Commit;
       PrNumDoc.Text:= id;
       ativa_venda1(PrNumDoc.Text);
    end
    else
    begin
       dao.update('vendas1','numdoc',q_venda1.fieldbyname('numdoc').AsString, 'Pr',Fr_vendas);
       dao.cn.Commit;
       ativa_venda1(PrNumDoc.Text);
    end;

    Grava_Sgx(modo_insert);
    readonly_true('Pr');

    edit_sg:='N';

    if tipo_venda <> 'N' then
    begin
      if (q_venda1.FieldByName('orcamento').AsString = '0') and ((q_venda1.FieldByName('consignacao').AsString = '0') or (q_venda1.FieldByName('consignacao').AsString = '2')) then
         Faturar;
         ativa_cr1(PrNumDoc.Text);
    end;

    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.Execsql('update vendas1 set tipo_venda=' + QuotedStr(tipo_venda)+' where numdoc= '+QuotedStr(PrNumDoc.Text));

    ativa_venda1(PrNumDoc.Text);
    ativa_venda2(q_venda1.fieldbyname('numdoc').AsString);

    if mform <> 'fechamento_consig' then
    begin
       if (tipo_venda = 'S') or (tipo_venda = 'O') then
       begin
         q_venda2.First;
         while not q_venda2.Eof do
         begin
           Fmfun.atualiza_estoque(q_venda2.fieldbyname('cod_produto').AsString, 'S', q_venda2.Fieldbyname('qtd').AsString,'R');
           if q_venda2.fieldbyname('grade').AsString = '0' then
             FRPRI.atualiza_estoque_grade(q_venda2.fieldbyname('cod_produto').AsString, q_venda2.fieldbyname('id_cor').AsString, '', q_venda2.fieldbyname('id_tamanho').AsString, 'S', q_venda2.Fieldbyname('qtd').AsString,'R');

           q_venda2.Next;
         end;
       end;
    end;

    if (q_venda1.FieldByName('orcamento').AsString = '0') and (q_venda1.FieldByName('consignacao').AsString = '0') then
    begin
//       grava_credito_cliente(Prcod_cliente.Text, Prtot_liquido.Text ,PrNumDoc.Text, dao.DtaSerStr);
    end;
    dao.cn.Commit;

    Finaliza_venda(tipo_venda); //aqui ele imprime o cupom
    mostra_sgx(PrNumDoc.Text);
    Sb_Vendas.Panels[0].Text := '';
    if q_venda1.FieldByName('faturado').AsString = '1' then
       Sb_Vendas.Panels[1].Text := 'FATURADO'
    else
       Sb_Vendas.Panels[1].Text := 'NÃO FATURADO';


    btnov.Enabled:= true;
    btalt.Enabled:= true;
    btgra.Enabled:= false;
    btcan.Enabled:= false;
    btexc_Merc.Enabled:= false;
    Btcredito.Enabled:= false;
    bt_localizar.Enabled:= true;

    Sb_Vendas.Panels[0].Text := '';
    if Prcod_cliente.Text <> '' then
       zzvalor_credito.Text:= busca_credito(Prcod_cliente.Text);
  end
  else
  {*********** DEVOLUÇÃO CLIENTE ***************************}
  if mform = 'devolucao_cliente' then
  begin
    if Prnr_venda_original.Text = '' then
    begin
      dao.msg('O campo Nº Venda Original não pode ficar em Branco!');
      exit;
    end;

    if MessageDlg('DESEJA FINALIZAR A DEVOLUÇÃO E GERAR O CREDITO AO CLIENTE?',mtConfirmation,[MBYES,mbNo],0) = mryes then
    begin
      grava_devolucao;
    end;
  end;


end;

procedure TFr_vendas.btnovClick(Sender: TObject);
begin
  PC_vendas.ActivePage:= tab_mercadorias;
  q_venda1.Close;
  q_venda1.active:= false;
  q_venda2.Close;
  q_venda2.active:= false;

  modo_insert:=true;
  edit_sg:='S';
  EditarSGX :=true ;

  btnov.Enabled:= false;
  btalt.Enabled:= false;
  btgra.Enabled:= true;
  btcan.Enabled:= true;
  btexc_Merc.Enabled := true;
  Btcredito.Enabled:= True;
  bt_localizar.Enabled:= false;

  readonly_false('Pr');
  limpa_campos('Pr');

//  sgx.ClearRows(1,SGX.RowCount);
//  SGX.Clear;
//  sgx.RowCount:= 1;

  monta_sgx;
  Prcod_empresa.Text := cod_empresa;
  PRDtaDoc.Text:= FormatDateTime('dd/mm/yyyy', FRPRI.DtaSerDt);
  Prcod_cliente.setfocus;
  Prcod_cliente.text:='9999';
  Lbnom_cliente.caption:='CONSUMIDOR';
  Prcod_fop.Text:= '1';
  Lbnom_fop.Caption:= 'DINHEIRO';
  Prprazo_pgto.Text:= '00/  /   /   /   /   /   /   ';
  Prqtd_parcelas.Text:= '1';
  Sb_Vendas.Panels[0].Text := 'INSERINDO';
  PRhora.Text:= TimeToStr(Time);
  q_cr1.Close;
  limpa_campos('Cr');
  Lbnom_fop_cr1.Caption:= '...';
end;

procedure TFr_vendas.sgxCellChanging(Sender: TObject; OldRow, OldCol,
  NewRow, NewCol: Integer; var Allow: Boolean);
var
  qtd, desconto, preco, sub_total, preco_bruto, sub_total_bruto: string;
begin
  //quando estiver mudando
//  col:= sgx.Col;
//  lin:= sgx.Row;
//  linmax:= sgx.RowCount;

  If edit_sg = 'N' then
     Exit;

  if (edit_sg = 'S') and (btnov.Enabled=False) then
  begin
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(10,1,sgx.RowCount-1));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(6,1,sgx.RowCount)-Prcredito_usado.Value);
  end;

  if (col=3) and (sgx.Cells[1,lin] <> '') then
  begin
    if ((sgx.Cells[3,lin]='') or (sgx.Cells[3,lin]='0')) then
    begin
      sgx.cells[3,lin]:= '1';
      sgx.Col:=3;
      dao.msg('O campo Qtd não pode ficar vazio ou 0 !');
      exit;
    end;
  end;

  if (col=4) and (sgx.Cells[1,lin] <> '') and (mform <> 'devolucao_cliente') then
  begin
    qtd:= FMFUN.BuscaTroca(sgx.Cells[3,lin],',','');

    sgx.Cells[5,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[9,lin],0)-(FMFUN.Str_to_float(sgx.Cells[9,lin],0)* FMFUN.Str_to_float(sgx.Cells[4,lin],0)/100));
    sgx.Cells[6,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[5,lin],0)* FMFUN.Str_to_float(sgx.Cells[3,lin],0));
    sgx.Cells[10,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[9,lin],0)*FMFUN.Str_to_float(sgx.Cells[3,lin],0));

//    sgx.Cells[5,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[9,lin],0)-(FMFUN.Str_to_float(sgx.Cells[9,lin],0)* FMFUN.Str_to_float(sgx.Cells[4,lin],0)/100));
//    sgx.Cells[6,lin]:= formatfloat('###,##0.00',strtofloat(FMFUN.BuscaTroca(sgx.Cells[5,lin],',','.'))*strtofloat(FMFUN.BuscaTroca(sgx.Cells[3,lin],',','.')));
//    sgx.Cells[10,lin]:= formatfloat('###,##0.00',strtofloat(FMFUN.BuscaTroca(sgx.Cells[9,lin],',','.'))*strtofloat(sgx.Cells[3,lin]));


  end;
  if (col=5) and (sgx.Cells[1,lin] <> '') and (mform <> 'devolucao_cliente') then
  begin
//    sgx.Cells[4,lin]:= formatfloat('0.0000',100-((sgx.cells5,lin)/sgx.Cells(9,lin))*100));
//    Prdesconto.Value:= 100-((sgx.ColumnSum(6,1,sgx.RowCount)/sgx.ColumnSum(10,1,sgx.RowCount))*100);

    sgx.Cells[4,lin]:= formatfloat('0.0000',100-((FMFUN.Str_to_float(sgx.Cells[5,lin],0)/ FMFUN.Str_to_float(sgx.Cells[9,lin],0))*100));

    //    sgx.Cells[4,lin]:= formatfloat('###,##0.00',strtofloat(sgx.Cells[9,lin])-(strtofloat(sgx.Cells[9,lin])*strtofloat(sgx.Cells[4,lin])/100));
    sgx.Cells[6,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[5,lin],0)* FMFUN.Str_to_float(sgx.Cells[3,lin],0));
    sgx.Cells[10,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[9,lin],0)* FMFUN.Str_to_float(sgx.Cells[3,lin],0));

  end;

end;

procedure TFr_vendas.busca_produto;
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

  Fr_localizar.Caption:='Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_vendas_produto';
  chamou_cadastro := 'Fr_produto';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Produto';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Grupo';
  Campos_combo[3] := 'Fornecedor';

  for i:=0 to 3 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
//  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
//  dao.Geral1('select qtd_estoque from produto where cod_produto='+QuotedStr(q_produtos.fieldbyname('cod_produto').AsString));
//  zzestoque_disponivel.Text:=dao.Q1.fieldbyname('qtd_estoque').AsString;
//  zzestoque.Text:=dao.Q1.fieldbyname('qtd_estoque').AsString;


end;

procedure TFr_vendas.busca_produto_unitario(leitor: boolean; cod_barras:String);
var
  id_produto, idcor, idtamanho, codigo_barras, nov_cod: string;
  mcn, i:integer;
begin
  if leitor then
  begin
    codigo_barras:= cod_barras;

//    for i:=1 to 6 do
//    begin
      mcn:= Length(codigo_barras);
      codigo_barras:=   copy(codigo_barras, 1 , mcn - 9);
//    end;

    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
               'left join cod_barras cb on cb.cod_produto=p.cod_produto '+
               'where cb.cod_barras like '+QuotedStr('%'+ codigo_barras +'%'));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      sgx.Col := 1;
      exit;
    end;

    if length(cod_barras) < 14 then
    begin
      if dao.Q1.FieldByName('grade').AsString = '0' then
      begin
        if (sgx.Cells[7,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
        begin
          Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
          FrSel_Atributo.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
          FrSel_Atributo.ShowModal;
          sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString +'- '+nom_cor +'- '+nom_tamanho;
        end;
      end
      else
        sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString;
    end
    else
    if length(trim(cod_barras)) = 14 then
    begin
      if copy(cod_barras,1,8) <> '' then
         dao.Geral2('select grade from produto where cod_pro2= '+QuotedStr(copy(cod_barras,1,8)));

      if dao.Q2.FieldByName('grade').AsString ='0' then
      begin
        dao.Geral3('select cod_produto, cod_pro2 from produto where cod_pro2='+QuotedStr(copy(cod_barras,1,8)));
        id_produto:= dao.Q3.fieldbyname('cod_produto').AsString;

        dao.Geral3('select id,cor, id_cor2 from cores where id_cor2='+QuotedStr(copy(cod_barras,9,3)));
        idcor:= dao.Q3.fieldbyname('id').AsString;
        Fr_vendas.sgx.Cells[7,lin]:= idcor;
        nom_cor:= dao.Q3.Fieldbyname('cor').AsString;

        dao.Geral3('select id, tamanho, id_tam2 from tamanho where id_tam2='+QuotedStr(copy(cod_barras,12,3)));
        idtamanho:= dao.Q3.fieldbyname('id').AsString;
        Fr_vendas.sgx.Cells[8,lin]:= idtamanho;

        nom_tamanho := dao.Q3.fieldbyname('tamanho').AsString;

        if (idcor = '') or (idtamanho = '') then
        begin
          dao.msg('Produto não encontrado!');
          sgx.Col:=1;
          exit;
        end;

        dao.Geral1('select p.cod_produto, p.cod_pro2 , p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, c.id_cor2, t.tamanho, t.id_tam2 from produto p '+
                   'left join grade gd on gd.cod_produto=p.cod_produto '+
                   'left join cores c on c.id=gd.id_cor '+
                   'left join tamanho t on t.id=gd.id_tamanho '+
                   'where p.cod_produto='+ QuotedStr(id_produto) + ' and gd.id_cor = ' + QuotedStr(idcor) + ' and id_tamanho = ' +  QuotedStr(idtamanho));

        sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString +'- '+nom_cor +'- '+nom_tamanho;

      end;
    end
    else
    if length(cod_barras) = 23 then
    begin
      Fr_vendas.sgx.Cells[7,lin]:= copy(cod_barras,6,3);
      dao.Geral2('select id, cor from cores where id='+QuotedStr(copy(cod_barras,6,3)));
      nom_cor:= dao.Q2.fieldbyname('cor').AsString;

      Fr_vendas.sgx.Cells[8,lin]:= copy(cod_barras,9,3);
      dao.Geral2('select id, tamanho from tamanho where id='+QuotedStr(copy(cod_barras,9,3)));
      nom_tamanho:= dao.Q2.fieldbyname('tamanho').AsString;
      sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString +'- '+nom_cor +'- '+nom_tamanho;
    end
    else
    if length(cod_barras) = 22 then
    begin
      Fr_vendas.sgx.Cells[7,lin]:= copy(cod_barras,5,3);
      dao.Geral2('select id, cor from cores where id='+QuotedStr(copy(cod_barras,5,3)));
      nom_cor:= dao.Q2.fieldbyname('cor').AsString;

      Fr_vendas.sgx.Cells[8,lin]:= copy(cod_barras,8,3);
      dao.Geral2('select id, tamanho from tamanho where id='+QuotedStr(copy(cod_barras,8,3)));
      nom_tamanho:= dao.Q2.fieldbyname('tamanho').AsString;
      sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString +'- '+nom_cor +'- '+nom_tamanho;
    end
    else
    if length(cod_barras) = 21 then
    begin
      Fr_vendas.sgx.Cells[7,lin]:= copy(cod_barras,5,3);
      dao.Geral2('select id, cor from cores where id='+QuotedStr(copy(cod_barras,5,3)));
      nom_cor:= dao.Q2.fieldbyname('cor').AsString;

      Fr_vendas.sgx.Cells[8,lin]:= copy(cod_barras,8,2);
      dao.Geral2('select id, tamanho from tamanho where id='+QuotedStr(copy(cod_barras,8,2)));
      nom_tamanho:= dao.Q2.fieldbyname('tamanho').AsString;
      sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString +'- '+nom_cor +'- '+nom_tamanho;
    end;

    sgx.Cells[1,lin]:= dao.Q1.fieldbyname('cod_produto').AsString;
    sgx.Cells[3,lin]:= '1';
    if (mform = 'vendas') or (mform = 'fechamento_consig') then
    begin
      sgx.Cells[4,lin]:= '0';
      sgx.Cells[5,lin]:=  FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      sgx.Cells[6,lin]:=  FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      sgx.Cells[9,lin]:=  FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      sgx.Cells[10,lin]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
   end;

   if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
   begin
     sgx.Row:= sgx.RowCount - 1;
     sgx.Col := 1;
   end
   else
     InsLinha(sgx);
  end
  else
  begin
    if sgx.Cells[1,lin] <> '' then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p '+
                 'where p.cod_produto = '+QuotedStr(cod_barras));

      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        sgx.Col:=1;
        exit;
      end;

      sgx.Cells[1,lin] := dao.Q1.fieldbyname('cod_produto').AsString;
      sgx.Cells[2,lin]:= dao.Q1.fieldbyname('nom_produto').AsString;
      sgx.Cells[3,lin]:= '1';
      if (mform = 'vendas') or (mform ='fechamento_consig') then
      begin
        if sgx.Cells[4,lin] = '' then
           sgx.Cells[4,lin] := '0';
        sgx.Cells[5,lin]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        sgx.Cells[6,lin]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        sgx.Cells[9,lin]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
        sgx.Cells[10,lin]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);

      end;
    end;
    sgx.Col:= 3;
  end;
end;

procedure TFr_vendas.sgxClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

end;

procedure TFr_vendas.sgxSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

  if (ACol = 6) or (Acol = 2) or (ACol = 9) or (Acol = 10) then
  begin
    sgx.Options := sgx.Options - [goEditing]
  end
  else
  begin
    sgx.Options := sgx.Options + [goEditing];
  end;



{  if (sgx.Col=4) or (sgx.Col=5) then
    col:=3;}
end;

procedure TFr_vendas.sgxCellsChanged(Sender: TObject; R: TRect);
begin
  //quando a celula for alterada

  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

  If edit_sg = 'N' then
     Exit;


//    decimalseparator:='.';
  if mform = 'vendas' then
  begin
     if (sgx.Cells[3,lin]<> '') and (sgx.Cells[5,lin] <> '') then
     begin
       sgx.Cells[6,lin]:= formatfloat('###,##0.00', FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[5,lin],0));
       sgx.Cells[10,lin]:= formatfloat('###,##0.00', FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[9,lin],0));
     end;
  end;
  if (edit_sg = 'S') and (btnov.Enabled=False) then
  begin
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(10,1,sgx.RowCount-1));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(6,1,sgx.RowCount));
  end;
  if (col=5) and (sgx.Cells[1,lin] <> '') and (mform <> 'devolucao_cliente') then
  begin
    sgx.Cells[4,lin]:= formatfloat('0.0000',100-((FMFUN.Str_to_float(sgx.Cells[5,lin],0)/ FMFUN.Str_to_float(sgx.Cells[9,lin],0))*100));
    sgx.Cells[6,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[5,lin],0)* FMFUN.Str_to_float(sgx.Cells[3,lin],0));
    sgx.Cells[10,lin]:= formatfloat('###,##0.00',FMFUN.Str_to_float(sgx.Cells[9,lin],0)* FMFUN.Str_to_float(sgx.Cells[3,lin],0));

  end;

//    decimalseparator:=',';

end;

procedure TFr_vendas.sgxRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
//  col:= sgx.Col;
//  lin:= sgx.Row;
 linmax:= sgx.RowCount;

  if (SGX.Col = 0) then
  begin
    sgx.Options := sgx.Options + [goEditing];
   // sgx.col := 1;
  end;

end;

procedure TFr_vendas.Atalho21Click(Sender: TObject);
begin
  FRPRI.ACBrCalculadora1.Execute;
end;


procedure TFr_vendas.ativa_venda1(nr_documento: String);
begin
  with q_venda1 do
  begin
    close;
    sql.clear;
    sql.add('select v1.*, c.nom_cliente, r.nom_representante, fop.nom_fop from vendas1 v1 '+
            'left join cliente c on c.cod_cliente=v1.cod_cliente '+
            'left join representante r on r.id= v1.cod_representante '+
            'left join fop fop on fop.cod_fop=v1.cod_fop '+
            'where numdoc='+QuotedStr(nr_documento));
    open;
  end;

end;

procedure TFr_vendas.limpa_campos(prefixo: ShortString);
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
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else
      if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else
      if Components[i] is tsCheckbox then
        tsCheckbox(components[i]).Checked:= false
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else
      if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex:=0;
    end;
  end;
  Lbnom_cliente.Caption:= '...';
  Lbnom_representante.Caption:= '...';
  Lbnom_fop.caption:= '...';
  
end;

procedure TFr_vendas.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text := q_venda1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TMaskEdit then
      begin
        campo:= TMaskEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TMaskEdit(FindComponent(campo)).Text := q_venda1.fieldbyname(campo1).AsString;
      end
{      else
      if Components[i] is TRichEdit then
      begin
        campo:= TRichEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TRichEdit(FindComponent(campo)).Text := q_venda1.fieldbyname(campo1).AsString;
      end}
      else
      if Components[i] is TsComboEdit then
      begin
        campo:= TsComboEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsComboEdit(FindComponent(campo)).Text :=q_venda1.fieldbyname(campo1).AsString;
      end
      else
      if Components[i] is TsCurrencyEdit then
      begin
        campo:= TsCurrencyEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_venda1.fieldbyname(campo1).AsFloat;
      end
      else
      if Components[i] is TComboBox then
      begin
        campo:= TComboBox(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TComboBox(FindComponent(campo)).ItemIndex := q_venda1.fieldbyname(campo1).AsInteger;
      end
      else
      if Components[i] is TsDateEdit then
      begin
        campo:= TsDateEdit(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TsDateEdit(FindComponent(campo)).Date := q_venda1.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end;//end do for
  Prtot_bruto.Value:= q_venda1.fieldbyname('tot_bruto').AsFloat;
  Prtot_liquido.Value:= q_venda1.fieldbyname('tot_liquido').AsFloat;

  Lbnom_cliente.Caption:=q_venda1.fieldbyname('nom_cliente').AsString;
  Lbnom_representante.Caption:= q_venda1.fieldbyname('nom_representante').AsString;
  Lbnom_fop.Caption:= q_venda1.fieldbyname('nom_fop').AsString;

  if q_venda1.FieldByName('faturado').AsString = '0' then
    Sb_Vendas.Panels[1].Text:= 'NÃO FATURADO'
  else
    Sb_Vendas.Panels[1].Text:= 'FATURADO';



  Screen.Cursor := crDefault;

end;

procedure TFr_vendas.readonly_false(prefixo: ShortString);
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=false
{      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=false}
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is tsCheckbox then
        tsCheckbox(components[i]).ReadOnly:=false
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=false
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=false;

    end;
  end;
  sgx.Options := sgx.Options + [goEditing];


end;

procedure TFr_vendas.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Copy(Components[i].Name,1,2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly:=True
{      else
      if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly:=True}
      else
      if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is tsCheckbox then
        tsCheckbox(components[i]).ReadOnly:=True
      else
      if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly:=True
      else
      if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly:=True;
    end;
  end;
  sgx.Options := sgx.Options - [goEditing];

end;


procedure TFr_vendas.Prcod_clienteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_venda_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo,6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i:=0 to 5 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
//  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas.Prcod_representanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Usuário';
  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_vendas_representante';
  chamou_cadastro := 'Fr_representante';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Vendedor';
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

procedure TFr_vendas.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_cliente.Text='') and (BtNov.Enabled=false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_venda_cliente';
      chamou_cadastro := 'Fr_cliente';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo,6);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'CNPJ';
      Campos_combo[3] := 'CPF';
      Campos_combo[4] := 'Cidade';

      for i:=0 to 5 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
//      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(sender as TWinControl, true,true);
    if mform = 'devolucao_cliente' then
    begin
      sgx.Col:=1;
      sgx.Row:=1;

    end;
    key:=#0;
  end;
end;

procedure TFr_vendas.F2EstoqueDetalhado1Click(Sender: TObject);
begin
  Application.CreateForm(TFr_estoque_detalhado, Fr_estoque_detalhado);
  Fr_estoque_detalhado.ShowModal;
  Fr_estoque_detalhado.Free;
end;

procedure TFr_vendas.Prcod_fopButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_venda_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Formas de Pagamento';
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

procedure TFr_vendas.Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_representante.Text = '') and (BtNov.Enabled=false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Usuário';
      chamou_pesquisa := 'fr_representante';
      chamou_form := 'fr_vendas_representante';
      chamou_cadastro := 'Fr_representante';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Vendedor';
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


procedure TFr_vendas.sgxCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  //PODE EDITAR A CELULA
//  If edit_sg = 'N' then
//    SelectNext(sender as TWinControl, true, true);


end;

procedure TFr_vendas.bt_localizarClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;
  It, J, Coluna: byte;
begin

  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar Vendas';
  chamou_pesquisa := 'fr_vendas';
  chamou_form := 'fr_vendas';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption:='Ca&dastro de'+#13+'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo,6);
  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';
  Campos_combo[5] := 'Vendedor';


  for i:=0 to 5 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  //no codigo do kit ocultar a coluna diminuindo o espaço para poder usar o código depois.

//  Fr_localizar.SGloc.ColumnsName.Text := 'Codigo,50' + #13 + 'Nome,330' + #13 + 'CNPJ, 90'+
//                                          #13 + 'CPF,90' + #13 + 'Cidade,150';//coloca titulo no String grid
//  Fr_localizar.SGloc.FormaColunas;//forma as colunas com os titulos

  Fr_localizar.ShowModal;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  if Fr_localizar.Qu_localizar.RecordCount > 0 then
  begin
    ativa_venda1(Fr_localizar.Qu_localizar.fieldbyname('numdoc').AsString);
    ativa_cr1(Fr_localizar.Qu_localizar.fieldbyname('numdoc').AsString);
    mostra_campos('Pr');
    mostra_sgx(Fr_localizar.Qu_localizar.fieldbyname('numdoc').AsString);
  end;


  if Prcod_cliente.Text <> '' then
     zzvalor_credito.Text:=  busca_credito(Prcod_cliente.Text);

  if q_venda1.Active = true then
    if q_venda1.FieldByName('faturado').AsString = '1' then
      Sb_Vendas.Panels[0].Text := 'VENDA FINALIZADA!'
    else
      Sb_Vendas.Panels[0].Text := 'VENDA NÃO FINALIZADA!';



end;

procedure TFr_vendas.Grava_Sgx(insert : Boolean);
var
  i: integer;
  id, num_documento, cod_produto, id_cor, id_tamanho, cmd, cod_empresa: String;
  qtd, preco, preco_bruto, sub_total_bruto, desconto : String;
  qtd_c, preco_c, total: real;  //aqui são os que vão armazenar os convertidos de string para float
  campo, vlr : String;
begin
  try
      sgx.Options := sgx.Options + [goEditing];

      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      for i:=1 to sgx.RowCount -1 do
      begin
        if sgx.cells[0,i] ='' then
        begin
          num_documento:= PrNumDoc.Text;
          cod_produto:= sgx.cells[1,i];
          qtd := sgx.cells[3,i]; //48,00
          qtd_c:=  FMFUN.Str_to_float(qtd,0);
          preco:= sgx.cells[5,i];
          preco_c:= FMFUN.Str_to_float(preco,0);
          desconto:= FMFUN.prepara_valor(sgx.Cells[4,i]);
          total:= preco_c * qtd_c;
          id_cor:= sgx.cells[7,i];
          id_tamanho:= sgx.cells[8,i];
          cod_empresa:= Prcod_empresa.Text;
          preco_bruto:= sgx.cells[9,i];
          sub_total_bruto := sgx.cells[10,i];
          cmd:= 'insert into vendas2 (';


          if num_documento <> '' then
          begin
            campo:= 'numdoc';
            vlr:= num_documento;
          end;

          if PrDtaDoc.Text <> '  /  /    ' then
          begin
            campo:= campo + ',' +'dtadoc';
            vlr:= vlr + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy',PrDtaDoc.Date));
          end;

          if cod_produto <> '' then
          begin
            campo:= campo +', ' + 'cod_produto';
            vlr:= vlr + ', ' + cod_produto;
          end;

          if qtd <> '' then
          begin
            campo:= campo + ', ' + 'qtd';
            vlr:= vlr + ', '+ FMFUN.prepara_valor(floattostr(qtd_c));
          end;

          if preco <> '' then
          begin
            campo:= campo + ', ' + 'preco';
            vlr:= vlr + ', '+ FMFUN.prepara_valor(FloatToStr(preco_c));
          end;

          if desconto <> '' then
          begin
            campo:= campo + ', ' + 'desconto';
            vlr:= vlr + ', '+ desconto;
    //        vlr:= vlr + ', '+ floattostr(preco_c);
          end;

          if total <> 0 then
          begin
            campo:= campo + ', ' + 'sub_total';
            vlr:= vlr + ', '+ FMFUN.prepara_valor(FloatToStr(total));
          end;

          if id_cor <> '' then
          begin
            campo:= campo +', ' + 'id_cor';
            vlr:= vlr + ', ' + id_cor;
          end;

          if id_tamanho <> '' then
          begin
            campo:= campo +', ' + 'id_tamanho';
            vlr:= vlr + ', ' + id_tamanho;
          end;

          if Prcod_cliente.Text <> '' then
          begin
            campo:= campo +', ' + 'cod_cliente';
            vlr:= vlr + ', ' + Prcod_cliente.Text;
          end;

          if cod_empresa <> '' then
          begin
            campo:= campo +', ' + 'cod_empresa';
            vlr:= vlr + ', ' + Prcod_empresa.Text;
          end;

          if preco_bruto <> '' then
          begin
            campo:= campo +', ' + 'preco_bruto';
            vlr:= vlr + ', ' + FMFUN.prepara_valor(sgx.cells[9,i]);
          end;

          if sub_total_bruto <> '' then
          begin
            campo:= campo +', ' + 'sub_total_bruto';
            vlr:= vlr + ', ' + FMFUN.prepara_valor(sgx.cells[10,i]);
          end;


          if (cod_produto <> '') and (qtd <> '') then
            dao.Execsql(cmd + campo+') values ('+vlr+')');

        end
        else
        begin
          sgx.Options := sgx.Options + [goEditing];

          id:= sgx.cells[0,i];
          num_documento:= PrNumDoc.Text;
          cod_produto:= sgx.cells[1,i];
          qtd := sgx.cells[3,i]; //48,00
          qtd_c:=  FMFUN.Str_to_float(qtd,0);
          preco:= sgx.cells[5,i];
          preco_c:= FMFUN.Str_to_float(preco,0);
          desconto:= FMFUN.prepara_valor(sgx.Cells[4,i]);
          total:= preco_c * qtd_c;
          id_cor:= sgx.cells[7,i];
          id_tamanho:= sgx.cells[8,i];
          preco_bruto:= sgx.cells[9,i];
          sub_total_bruto:= sgx.Cells[10,i];
          cmd:= 'update vendas2 set ';

          if num_documento <> '' then
          begin
            cmd:= cmd + ' numdoc ='+ num_documento;
          end;

          if cod_produto <> '' then
          begin
            cmd:= cmd + ', cod_produto='+ cod_produto;
          end;

          if qtd <> '' then
          begin
            cmd:= cmd + ', qtd = '+ FMFUN.prepara_valor(FloatToStr(qtd_c));
          end;

          if preco <> '' then
          begin
            cmd:= cmd + ', preco = '+ FMFUN.prepara_valor(FloattoStr(preco_c));
          end;

          if desconto <> '' then
          begin
            cmd:= cmd + ', desconto = ' + FMFUN.prepara_valor(desconto);
//            campo:= campo + ', ' + 'desconto';
 //           vlr:= vlr + ', '+ desconto;
          end;

          if total <> 0 then
          begin
            cmd:= cmd + ', sub_total = ' + FMFUN.prepara_valor(FloattoStr(total));
          end;

          if id_cor <> '' then
          begin
            cmd := cmd + ', id_cor = ' + QuotedStr(id_cor);
          end;

          if id_tamanho <> '' then
          begin
            cmd := cmd + ', id_tamanho = ' + QuotedStr(id_tamanho);
          end;

          if preco_bruto <> '' then
          begin
            cmd:= cmd +', ' + 'preco_bruto='+QuotedStr(FMFUN.prepara_valor(sgx.cells[9,i]));
          end;

          if sub_total_bruto <> '' then
          begin
            cmd:= cmd +', ' + 'sub_total_bruto='+QuotedStr(FMFUN.prepara_valor(sgx.cells[10,i]));
          end;

          if (cod_produto <> '') and (qtd <> '') then
             dao.Execsql(cmd + ' where id = ' + QuotedStr(id));
        end;
      end;
     dao.cn.Commit;

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao gravar informação do Grid de Produtos!'+#13+
                 e.message);

      dao.envia_email_suporte(e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao gravar os dados do Grid de produtos','felipesans@terra.com.br','','','');
    end;
  end;

end;

procedure TFr_vendas.ProrcamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    key:=#0;
  end;
end;

procedure TFr_vendas.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
 //   sgx.RowSelect[1]:=true;
    sgx.Col :=1;
  end;

end;

procedure TFr_vendas.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_fop.Text = '') and (btnov.Enabled = false) then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_venda_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Formas de Pagamento';
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

procedure TFr_vendas.PrdescontoExit(Sender: TObject);
begin
//felipe 05092009  Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
//felipe 05092009  Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));

 // Prtot_bruto.text:= FormatFloat('###,##0.00',sgx.ColumnSum(10,1,sgx.RowCount));
 // Prtot_liquido.text:= FormatFloat('###,##0.00',sgx.ColumnSum(6,1,sgx.RowCount));//-sgx.ColumnSum(10,1,sgx.RowCount)*(Prdesconto.Value/100));
//  Prtot_liquido.Text:= FormatFloat('###,##0.00',Prtot_liquido.Value-Prcredito_usado.Value);
end;

procedure TFr_vendas.Faturar;
var
  MVLRDIV,MPERDES,MPERACR:real;
  //faturamento
  I:integer;

  CTPAR:integer;
  MVLRPAR:EXTENDED;
  MNEWVLR:real;
  MVLRDIF:real;
  sequencia:integer;
  CTPGT:integer;
  MDIAVEN:integer;
  MNUMTIT,MNUMORI,FLANOR:string;
  cmd: String;
begin
  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;

  dao.Geral1('select faturado from vendas1 where numdoc='+QuotedStr(PrNumDoc.Text));

  if dao.Q1.FieldByName('faturado').AsString = 'S' then
  begin
    dao.msg('Está Venda já está Faturada!');
    exit;
  end;
  if Prprazo_pgto.Text='  /  /   /   /   /   /   /   ' then
  begin
    showmessage('Prazo de Pagamento não foi Preenchido.'+#13+
                '   Para Pagto A Vista, Digite 00');
    exit;
  end;

  FLANOR:='NOV';
  CTPAR:=0;
  I:=1;
  while I<=29 do
  begin
    if I<07 then
    begin
      if copy(Prprazo_pgto.Text,I,2)<> '  ' then CTPAR:=CTPAR+1;
      I:=I+3;
    end
    else
    begin
      if copy(Prprazo_pgto.Text,I,3)<> '   ' then CTPAR:=CTPAR+1;
      I:=I+4;
    end;
  end;
  MDIAVEN:= 0;
  MVLRPAR:= FMFUN.arredonda(q_venda1.fieldbyname('tot_liquido').AsFloat / CTPAR);
  MNEWVLR:= MVLRPAR*CTPAR;
  MVLRDIF:= q_venda1.fieldbyname('tot_liquido').AsFloat - MNEWVLR;
  sequencia:= 1;
  CTPGT:=1;
  for I:=1 to CTPAR do
  begin
   // if not(DMVEN.TRVEN.InTransaction) then DMVEN.TRVEN.StartTransaction;
//*      DMVEN.QUCR1.insert;

    if FLANOR='NOV' THEN
      MNUMORI:=q_venda1.fieldbyname('numdoc').AsString;

    if CTPGT<07 then
    begin
      MDIAVEN:=  strtoint(Trim(copy(q_venda1.fieldbyname('prazo_pgto').AsString,CTPGT,2)));
      CTPGT:=CTPGT+3;
    end
    else
    begin
      MDIAVEN:= strtoint(trim(copy(q_venda1.fieldbyname('prazo_pgto').AsString,CTPGT,3)));
      CTPGT:=CTPGT+4;
    end;

    if MNUMORI <> '' then
    begin
        MNUMTIT :=FMFUN.enchezero(MNUMORI,6);
       // MNUMTIT :=fmfun.enchezero(MNUMORI+ '-' + inttostr(sequencia),8);
    end;

    FLANOR:='FIM';
    //preenche a cr1.

    if (q_venda1.FieldByName('cod_fop').AsString = '1') then //or (q_venda1.FieldByName('cod_fop').AsString = '2') then
    begin
      DecimalSeparator:='.';
      cmd:= 'insert into cr1 (nr_documento, titulo, sequencia, dtaven, valor, cod_fop, dias_atraso, dtarec, valor_recebido, vlr_corrigido, saldo, cod_cliente, cod_empresa ';
      if q_venda1.FieldByName('num_cupom').AsString <> '' then
         cmd:= cmd + ', nr_cupom';

         cmd := cmd + ' )values ('+
             QuotedStr(q_venda1.fieldbyname('numdoc').AsString)+
            ' , ' + QuotedStr(MNUMTIT) + ',' + QuotedStr(inttostr(sequencia))+
            ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy',now + mdiaven)) + ',' + QuotedStr(floattostr(MVLRPAR)) +
            ' , ' + QuotedStr(q_venda1.fieldbyname('cod_fop').AsString) + ',' + QuotedStr('0') +
            ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy',now + mdiaven)) +
            ' , ' + QuotedStr(floattostr(MVLRPAR)) + ',' + QuotedStr(floattostr(MVLRPAR)) +
            ' , ' + QuotedStr('0') + ',' + QuotedStr(q_venda1.fieldbyname('cod_cliente').AsString)+','+QuotedStr(cod_empresa);

      if q_venda1.FieldByName('num_cupom').AsString <> '' then
         cmd:= cmd +' , ' + QuotedStr(q_venda1.fieldbyname('num_cupom').AsString);

       cmd := cmd + ')';

      dao.Execsql(cmd);
      DecimalSeparator:= ',';
    end
    else
    begin
      DecimalSeparator:= '.';                                                                                  // dtarec, vlrrec, vlr_corrigido, saldo_devedor,
      cmd:= 'insert into cr1 (nr_documento, titulo, sequencia, dtaven, valor, cod_fop, dias_atraso, cod_cliente, cod_empresa ';
      if q_venda1.FieldByName('num_cupom').AsString <> '' then
         cmd := cmd + ', nr_cupom';

      cmd:= cmd + ' )values ('+ QuotedStr(q_venda1.fieldbyname('numdoc').AsString)+
            ' , ' + QuotedStr(MNUMTIT) + ',' + QuotedStr(inttostr(sequencia))+
            ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy',now + mdiaven)) + ',' + QuotedStr(floattostr(MVLRPAR)) +
            ' , ' + QuotedStr(q_venda1.fieldbyname('cod_fop').AsString) +
            ' , ' + QuotedStr('0') + ',' + QuotedStr(q_venda1.fieldbyname('cod_cliente').AsString)+','+QuotedStr(cod_empresa);

      if q_venda1.FieldByName('num_cupom').AsString <> '' then
         cmd:= cmd + ' , ' + QuotedStr(q_venda1.fieldbyname('num_cupom').AsString);

      cmd := cmd + ')';

      dao.Execsql(cmd);
      DecimalSeparator:= ',';
    end;
  sequencia := sequencia + 1;

  end;
  dao.Execsql('update vendas1 set faturado='+QuotedStr('1') + ' where numdoc=' + QuotedStr(q_venda1.fieldbyname('numdoc').AsString));
  dao.cn.Commit;
end;

procedure TFr_vendas.Prtot_liquidoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btgra.SetFocus;
    key:=#0;
  end;
end;

procedure TFr_vendas.DeletaLinha(Linha: Integer);
var
  i, j: Integer;
begin
  with sgx do
  begin
    for i := Linha to RowCount-2 do
      for j := 0 to ColCount-1 do
      begin
        Cells[j, i] := Cells[j, i+1];

      end;

    RowCount := RowCount - 1

  end;
  If sgx.Row=0 then
  begin
//    monta_SgPro;
  end;
end;


procedure TFr_vendas.btexc_MercClick(Sender: TObject);
var
  id: String;
  i: integer;
  ac: real;
begin
  if  mform <> 'devolucao_cliente' then
  begin
    dao.Geral1('select numdoc, faturado from vendas1 where numdoc='+QuotedStr(PrNumDoc.Text));
    if dao.Q1.FieldByName('faturado').AsString = '1' then
    begin
      dao.msg('Não é Permitido Excluir Produto de Venda Faturada!');
      exit;
    end;
  end;

  if MessageDlg('Deseja Deletar o Item Selecionado!', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if modo_insert then
    begin
      id := sgx.Cells[0,sgx.Row];
      sgx.Cells[5,sgx.Row];
      sgx.ClearRows(sgx.Row,1);
      sgx.RemoveRows(sgx.Row,1);
    end
    else
//    sgx.RowCount:= sgx.RowCount -1;
//    DeletaLinha(lin);

    if modo_insert = false then
    begin
      id := sgx.Cells[0,sgx.Row];
      if id <> '' then
      begin
        with Q_exc_merc do
        begin
          close;
          sql.Clear;
          sql.add('delete from vendas2 where id = ' + QuotedStr(id));
          ExecSQL;
        end;
      end;
      sgx.Cells[5,sgx.Row];
      sgx.ClearRows(sgx.Row,1);
      sgx.RemoveRows(sgx.Row,1);
    end;
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));

    sgx.Col:=1;
    if sgx.RowCount > 1 then
       sgx.Row:=sgx.RowCount-1;

  end;
end;

procedure TFr_vendas.CancelarFaturamento1Click(Sender: TObject);
begin
  if mform <> 'devolucao_cliente' then
  begin
    if (PrNumDoc.Text <> '') and (btnov.Enabled=true) then
      dao.Geral2('select faturado from vendas1 where numdoc=' + QuotedStr(PrNumDoc.Text))
    else
      exit;

    if dao.Q2.FieldByName('faturado').AsString = '0' then
    begin
      dao.msg('Venda não Faturada!');
      exit;
    end;

    if messagedlg('Deseja Desfaturar essa Venda?', mtConfirmation, [mbYes,mbNo], 0) = mryes then
    begin
      Application.CreateForm(TFr_senha_especial,Fr_senha_especial);
      Fr_senha_especial.ShowModal;
      if liberado then
         cancelar_faturamento(dao.Q1.fieldbyname('codusu').AsString);

    end;
  end;


end;

procedure TFr_vendas.mostra_sgx(numdoc: String);
begin

  with q_venda2 do
  begin
    close;
    sql.clear;
    sql.add('select v2.*, p.nom_produto, p.grade from vendas2 v2 '+
            'left join produto p on p.cod_produto = v2.cod_produto '+
            'where numdoc = '+ QuotedStr(numdoc));

    open;
  end;
//  sgx.Clear;
//  sgx.RowCount:=2;
  monta_sgx;
  linMax:=1;
  q_venda2.First;
  while not(q_venda2.Eof) do
  begin
    sgx.EditorMode:=true;
    if linMax > 1 then
    begin
      sgx.AddRow;
    end;
    Sgx.Cells[0,linMax]:= q_venda2.fieldbyname('id').AsString;
    Sgx.Cells[1,linMax]:= q_venda2.fieldbyname('cod_produto').AsString;
    Sgx.Cells[2,linMax]:= q_venda2.fieldbyname('nom_produto').AsString;
    Sgx.Cells[3,linMax]:= q_venda2.fieldbyname('qtd').AsString;
    Sgx.Cells[4,linMax]:= FormatFloat('###,##0.00', q_venda2.fieldbyname('desconto').AsFloat);
    Sgx.Cells[5,linMax]:= FormatFloat('###,##0.00',q_venda2.fieldbyname('preco').AsFloat);
    Sgx.Cells[6,linMax]:= FormatFloat('###,##0.00',q_venda2.fieldbyname('sub_total').AsFloat);

    if q_venda2.fieldbyname('id_cor').AsString <> '' then
    begin
      Sgx.Cells[7,linMax]:= q_venda2.fieldbyname('id_cor').AsString;
      dao.Geral1('select * from cores where id='+QuotedStr(q_venda2.fieldbyname('id_cor').AsString));
    end;

    if q_venda2.fieldbyname('id_tamanho').AsString <> '' then
    begin
      Sgx.Cells[8,linMax]:= q_venda2.fieldbyname('id_tamanho').AsString;
      dao.Geral2('select * from tamanho where id='+QuotedStr(q_venda2.fieldbyname('id_tamanho').AsString));
    end;

    if (q_venda2.fieldbyname('id_cor').AsString <> '') and (q_venda2.fieldbyname('id_tamanho').AsString <> '') then
      Sgx.Cells[2,linMax]:= q_venda2.fieldbyname('nom_produto').AsString + '- '+ dao.Q1.fieldbyname('cor').AsString + '- ' + dao.Q2.fieldbyname('tamanho').AsString;

    Sgx.Cells[9,linMax]:= FormatFloat('###,##0.00',q_venda2.fieldbyname('preco_bruto').AsFloat);
    Sgx.Cells[10,linMax]:= FormatFloat('###,##0.00',q_venda2.fieldbyname('sub_total_bruto').AsFloat);




    q_venda2.Next;

    if not(q_venda2.Eof) then
       linMax:= linMax + 1;

  end;
    Sgx.EditorMode:=false;
    Sgx.Row:=linMax;
    Sgx.RowSelect[linmax - 1];


end;

procedure TFr_vendas.monta_sgx;
begin
  sgx.Clear;
  sgx.RowCount:=2;

  sgx.FixedRows:=1;
  sgx.ColWidths[0]:=0;
  sgx.Cells[1,0]:= 'CÓDIGO';
  sgx.Cells[2,0]:= 'PRODUTO';
  sgx.Cells[3,0]:= 'QTD';
  sgx.Cells[4,0]:= 'DESC.';
  sgx.Cells[5,0]:= 'PREÇO';
  sgx.Cells[6,0]:='TOTAL';
  sgx.Cells[7,0]:='id_cor';
  sgx.Cells[8,0]:='id_tamanho';
  sgx.Cells[9,0]:='preco_bruto';
  sgx.Cells[10,0]:='sub_total_bruto';
  sgx.ColWidths[7]:=0;//id_cor
  sgx.ColWidths[8]:=0;//id_tamanho
  sgx.ColWidths[9]:=0;//PRECO_BRUTO
  sgx.ColWidths[10]:=0;//sub total bruto

  sgx.Cells[10,0]:='subtotalbruto';

end;

procedure TFr_vendas.sgxExit(Sender: TObject);
begin
//felipe 05092009  Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
//felipe 05092009  Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));
  if (btnov.Enabled=False) then
  begin
    Prtot_bruto.text:= FormatFloat('###,##0.00',sgx.ColumnSum(10,1,sgx.RowCount));
    Prtot_liquido.text:= FormatFloat('###,##0.00',sgx.ColumnSum(6,1,sgx.RowCount)-Prcredito_usado.Value);//- (sgx.ColumnSum(6,1,sgx.RowCount) * (Prdesconto.Value/100)));
  end;
  if (Prtot_bruto.Text <> '') and (Prtot_liquido.Text <> '') and (btnov.Enabled=False) then
  begin
    Prdesconto.Value:= 100-((sgx.ColumnSum(6,1,sgx.RowCount)/sgx.ColumnSum(10,1,sgx.RowCount))*100);
    //Prdesconto.Value:= 100 -((Prtot_bruto.Value / Prtot_liquido.Value) * 100);
    if Prdesconto.Value < 0 then
       Prdesconto.Value:= Prdesconto.Value *-1;
  end;
end;

procedure TFr_vendas.Finaliza_venda(tipovenda: String);
var
  codpro,nompro,icm,uni,numcup,cpfcnp,est,obsfec:string;
  dtadoc,serdoc,numdoc,perdes , numcup_marcar :string;
  qtdpro,preuni,des,vlrdes:real;

begin
  if tipovenda = 'S' then
  begin
      //impressão para o cupom
    if MessageDlg('Deseja Imprimir o Cupom?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      ecf.ExibeMensagem:=true;
      ecf.BloqueiaMouseTeclado:=true;
      ecf.TestaPodeAbrirCupom;
//      Sleep(2000);
      ecf.AbreCupom();
      Num_cupom:=ecf.NumCupom;

      ecf.DescricaoGrande:=true;
      q_venda2.First;

      while not(q_venda2.Eof) do
      begin
        codpro:=q_venda2.fieldbyname('cod_produto').AsString;
        nompro:=q_venda2.fieldbyname('nom_produto').AsString;
        icm:='T03';
        qtdpro:=StrToFloatDef(q_venda2.fieldbyname('qtd').AsString,0);
        preuni:=StrToFloatDef(q_venda2.fieldbyname('preco').AsString,0);
        des:=0;
        uni:='PC';//q_vendas.fieldbyname('nomuni').AsString;

        ecf.VendeItem(codpro,nompro,icm,qtdpro,preuni,des,uni);
        q_venda2.Next;
      end;

      if q_venda1.FieldByName('desconto').AsFloat <> 0 then
      begin
        vlrdes:=q_venda1.fieldbyname('tot_bruto').AsFloat * q_venda1.fieldbyname('desconto').AsFloat/100;
        perdes:= '-' + FloatToStr(vlrdes);
        ecf.SubtotalizaCupom(StrToFloat(perdes));
      end
      else
        ecf.SubtotalizaCupom(0);

      ecf.EfetuaPagamento('01',ecf.Subtotal,'',false);

      if q_venda1.FieldByName('cod_cliente').AsString<>'9999' then
      begin
        if q_venda1.FieldByName('cod_cliente').AsString = '' then
        begin
//              obsfec:=DMCUP.QUVE1.fieldbyname('nomcab').AsString+#10+DMCUP.QUVE1.fieldbyname('endcab').AsString+'  '+DMCUP.QUVE1.fieldbyname('cepcli').AsString+#10+
//             DMCUP.QUVE1.FieldByName('cidcab').AsString+'/'+DMCUP.QUVE1.fieldbyname('ufcid').AsString+#10+
//             'CNPJ/CPF:'+DMCUP.QUVE1.FieldByName('cnpcab').AsString+'     I.E/R.G:'+DMCUP.QUVE1.FieldByName('iecab').AsString+DMCUP.QUVE1.fieldbyname('numide').AsString;
        end
        else
        begin
{          obsfec:=q_venda1.fieldbyname('nom_cliente').AsString + #10 + q_venda1.fieldbyname('endereco').AsString+'  '+q_venda1.fieldbyname('cep').AsString+#10+
          q_venda1.FieldByName('nom_cidade').AsString+'/'+q_venda1.fieldbyname('uf').AsString+#10+
          'CNPJ/CPF:'+q_venda1.FieldByName('cpf').AsString + q_venda1.fieldbyname('cnpj').AsString+'     I.E/R.G:'+q_venda1.FieldByName('ie').AsString + q_venda1.fieldbyname('rg').AsString;}
        end;
      end;

      if copy(q_venda1.FieldByName('prazo_pgto').AsString,1,2)<>'00' then
     //   obsfec:=obsfec+#10+'aceite________________________________________/___/___'+#10+'VOCE FOI ATENDIDO POR: '+q_venda1.fieldbyname('nome').AsString
      else
    //    obsfec:=obsfec+#10+'VOCE FOI ATENDIDO POR: '+q_venda1.fieldbyname('nome').AsString;

      ecf.FechaCupom(obsfec);

      num_cupom:=ecf.NumCupom;

    end
  end
  else
  if tipovenda = 'O' then
  begin

  end;

end;

procedure TFr_vendas.ativa_venda2(nr_documento: String);
begin
  with q_venda2 do
  begin
    close;
    sql.clear;
    sql.add('select v2.*, p.nom_produto, p.grade from vendas2 v2 '+
            'left join produto p on p.cod_produto = v2.cod_produto '+
            'where numdoc = '+ QuotedStr(nr_documento));

    open;
  end;

end;

procedure TFr_vendas.EmitirLeituraX1Click(Sender: TObject);
begin
  if MessageDlg('DESEJA EMITIR A LEITURA X', mtConfirmation, [mbyes, mbno], 0) = mrYes then
  begin
    ecf.LeituraX;

  end;
end;

procedure TFr_vendas.EmitirReduoZ1Click(Sender: TObject);
begin
  if MessageDlg('DESEJA EFETUAR A REDUÇÃO Z?',mtConfirmation,[mbyes,mbno],0) = mryes then
    ecf.ReducaoZ(Now);

end;

procedure TFr_vendas.CancelaUltimoCupom1Click(Sender: TObject);
begin
  if MessageDlg('DESEJA CANCELAR ULTIMO CUPOM?',mtConfirmation,[mbyes,mbno],0) = mryes then
     ecf.CancelaCupom;
end;

procedure TFr_vendas.Prqtd_parcelasExit(Sender: TObject);
begin
  if Prqtd_parcelas.Text= '1' then
  begin
    Prprazo_pgto.Text:= '00/  /   /   /   /   /   /   ';
  end
  else
  if Prqtd_parcelas.Text= '2' then
  begin
    Prprazo_pgto.Text:= '30/60/   /   /   /   /   /   ';
  end
  else
  if Prqtd_parcelas.Text= '3' then
  begin
    Prprazo_pgto.Text:= '30/60/090/   /   /   /   /   ';
  end
  else
  if Prqtd_parcelas.Text= '4' then
  begin
    Prprazo_pgto.Text:= '30/60/090/120/   /   /   /   ';
  end
  else
  if Prqtd_parcelas.Text= '5' then
  begin
    Prprazo_pgto.Text:= '30/60/090/120/150/   /   /   ';
  end
  else
  if Prqtd_parcelas.Text= '6' then
  begin
    Prprazo_pgto.Text:= '30/60/090/120/150/180/   /   ';
  end
  else
  if Prqtd_parcelas.Text= '7' then
  begin
    Prprazo_pgto.Text:= '30/60/090/120/150/180/210/   ';
  end
  else
  if Prqtd_parcelas.Text= '8' then
  begin
    Prprazo_pgto.Text:= '30/60/090/120/150/180/210/240';
  end;






end;

procedure TFr_vendas.grava_devolucao;
begin
  try
    if Prtot_liquido.Text = '0' then
    begin
      dao.msg('O Campo de Total Liquido não pode ser 0!');
      exit;
    end;
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('O Campo Cliente Deve ser Preenchido !');
      exit;
    end;

    if not(verifica_produto(Prnr_venda_original.Text)) then
       exit;

    btnov.Enabled:= true;
    btalt.Enabled:= true;
    btgra.Enabled:= false;
    btcan.Enabled:= false;
    btexc_Merc.Enabled:= false;
    bt_localizar.Enabled:= true;


    if not(dao.cn.InTransaction) then
       dao.cn.StartTransaction;

    Prtot_bruto.text:= floattostr(sgx.ColumnSum(10,1,sgx.RowCount));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(6,1,sgx.RowCount));//- (sgx.ColumnSum(5,1,sgx.RowCount)));// * (Prdesconto.Value/100)));

    if modo_insert then
    begin
      id:= dao.insert('Pr','vendas1', 'numdoc', Fr_vendas, 'gen_venda1');
      dao.cn.Commit;
      PrNumDoc.Text:= id;
      ativa_venda1(PrNumDoc.Text);
    end
    else
    begin
      dao.update('vendas1','numdoc',q_venda1.fieldbyname('numdoc').AsString, 'Pr',Fr_vendas);
      dao.cn.Commit;
    end;

    Grava_Sgx(modo_insert);
    readonly_true('Pr');

    edit_sg:='N';

    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set tipo_venda=' + QuotedStr('D') +' where numdoc='+QuotedStr(q_venda1.fieldbyname('numdoc').AsString));

    ativa_venda2(q_venda1.fieldbyname('numdoc').AsString);

    q_venda2.First;
    while not q_venda2.Eof do
    begin
      FRPRI.atualiza_estoque(q_venda2.fieldbyname('cod_produto').AsString, 'E', q_venda2.Fieldbyname('qtd').AsString,'R');
      if q_venda2.fieldbyname('grade').AsString = '0' then
        FRPRI.atualiza_estoque_grade(q_venda2.fieldbyname('cod_produto').AsString, q_venda2.fieldbyname('id_cor').AsString, '', q_venda2.fieldbyname('id_tamanho').AsString, 'E', q_venda2.Fieldbyname('qtd').AsString,'R');
      q_venda2.Next;
    end;
    grava_credito_cliente(Prcod_cliente.Text,Prtot_liquido.Text,Prnr_venda_original.Text,PrNumDoc.Text,Prmotivo_troca.Text, PrDtaDoc.Text);

    dao.Execsql('update vendas1 set faturado ='+quotedStr('1') + ' where numdoc='+QuotedStr(PrNumDoc.Text));
    dao.cn.Commit;
    sgx.Options := sgx.Options - [goEditing];

    Sb_Vendas.Panels[1].Text := 'DEVOLUÇÃO CONCLUIDA!';
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao gravar a Devolução de Mercadoria!'+#13+
                 e.message);

      dao.envia_email_suporte(e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Houve um erro ao gravar a Devolução de Mercadoria','felipesans@terra.com.br','','','');
    end;
  end;
end;

function TFr_vendas.verifica_produto(numdoc:string): boolean;
var
  i,qtd_nao_encontrada: integer;
  msg_faltou, msg_qtd : String;
begin
  //verificar se o produto existe
  for i:=1 to sgx.RowCount-1 do
  begin
    if sgx.Cells[1,i] <> '' then
    begin
      dao.Geral2('select grade from produto where cod_produto='+QuotedStr(sgx.Cells[1,i]));
      if dao.Q2.FieldByName('grade').AsString = '0' then //0=GRADE  1= SEM GRADE
      begin
        dao.Geral1('select cod_produto, v2.desconto, v2.preco,v2.sub_total, v2.preco_bruto, v2.sub_total_bruto, v1.cod_cliente, v1.dtadoc, v1.numdoc,v1.desconto from vendas2 v2 '+
                   'left join vendas1 v1 on v1.numdoc=v2.numdoc '+
                   'where v2.cod_produto='+ QuotedStr(sgx.Cells[1,i])+' and v2.id_cor='+QuotedStr(sgx.Cells[7,i])+' and v2.id_tamanho='+QuotedStr(sgx.Cells[8,i])+' and v1.numdoc='+QuotedStr(numdoc)+
                   ' order by v1.dtadoc desc limit 1 ');
      end
      else
      begin
        dao.Geral1('select cod_produto, v2.desconto, v2.preco,v2.sub_total, v2.preco_bruto, v2.sub_total_bruto, v1.cod_cliente, v1.dtadoc,v1.numdoc, v1.desconto from vendas2 v2 '+
                   'left join vendas1 v1 on v1.numdoc=v2.numdoc '+
                   'where v2.cod_produto='+ QuotedStr(sgx.Cells[1,i])+' and v1.numdoc='+QuotedStr(numdoc)+
                   ' order by v1.dtadoc desc limit 1');

      end;
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        msg_faltou:= msg_faltou +#13+ 'O PRODUTO  '+sgx.Cells[2,i]+'  NÃO CONSTA NAS COMPRAS DO CLIENTE!'+#13;
        qtd_nao_encontrada:= 1;
      end
      else
      begin
        sgx.Cells[4,i]:= formatfloat('###,##0.00', dao.q1.fieldbyname('desconto').AsFloat);
        sgx.Cells[5,i]:= formatfloat('###,##0.00', dao.q1.fieldbyname('preco').AsFloat);
        sgx.Cells[6,i]:= formatfloat('###,##0.00', dao.q1.fieldbyname('sub_total').AsFloat);
        sgx.Cells[9,i]:= formatfloat('###,##0.00', dao.q1.fieldbyname('preco_bruto').AsFloat);
        sgx.Cells[10,i]:= formatfloat('###,##0.00', dao.q1.fieldbyname('sub_total_bruto').AsFloat);

      end;
    end;
  end;

  if msg_faltou <> '' then
  begin
    dao.msg(msg_faltou);
  end;
  if qtd_nao_encontrada >= 1 then
    Result:= false
  else
    Result:= true;


end;

procedure TFr_vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ecf.Desativar;
end;

procedure TFr_vendas.PrconsignacaoExit(Sender: TObject);
begin
  if Prconsignacao.Text = 'S' then
  begin
    Pa_faturamento.Enabled:= false;

  end;

end;

procedure TFr_vendas.ProrcamentoExit(Sender: TObject);
begin
  if Prorcamento.Text = 'S' then
  begin
    Pa_faturamento.Enabled:= false;
  end;

end;

procedure TFr_vendas.verifica_status_venda(n_documento: String);
begin
  dao.Geral1('select consignacao, orcamento, faturado from venda1 where numdoc='+QuotedStr(n_documento));

  if dao.q1.fieldbyname('consignacao').AsString = '0' then
    Sb_vendas.Panels[0].text:= 'CONSIGNAÇÃO'
  else
  if dao.q1.fieldbyname('orcamento').AsString = '0' then
    Sb_vendas.Panels[0].text:= 'ORÇAMENTO';

  if (dao.Q1.FieldByName('faturado').AsString = '0') or (dao.Q1.FieldByName('faturado').AsString = '') then
    Sb_Vendas.Panels[1].Text:= 'NÃO FATURADO'
  else
  if (dao.Q1.FieldByName('faturado').AsString = '1') then
    Sb_Vendas.Panels[1].Text:= 'FATURADO'
  else
  if (dao.Q1.FieldByName('faturado').AsString = '2') then
    Sb_Vendas.Panels[1].Text:= 'CANCELADO';



end;

procedure TFr_vendas.grava_venda_matriz;
begin

end;

procedure TFr_vendas.grava_credito_cliente(c_cliente, vl_credito, n_venda_original, nr_documento, obs, data: String);
var
  p_credito, valor_credito: real;//percentual de crédito
  pontos_convertido: String;
begin
  {c_cliente - cod_cliente}
  {vl_credito - valor do credito a gravar }
  {n_venda_original - numero da venda original da devolução}
  {nr_documento - nr do documento de troca}
  {obs - obs sobre o crédito}
  {data - data do credto}

  dao.Execsql('insert into credito (cod_cliente, valor, pago, nr_documento, obs,data,nr_venda_original) values ('+
              QuotedStr(c_cliente)+','+QuotedStr(FMFUN.prepara_valor(vl_credito))+','+QuotedStr('N')+','+
              QuotedStr(nr_documento)+','+QuotedStr('CREDITO ORIGINARIO DA VENDA Nº:'+n_venda_original)+','+
              QuotedStr(FormatDateTime('dd.mm.yyyy',StrToDate(data)))+','+QuotedStr(n_venda_original)+')');


{  dao.Geral1('select valor_ponto_fidelidade from configuracao');
  if (dao.Q1.fieldbyname('valor_ponto_fidelidade').asfloat > 0) then
     pontos_convertido := floattostr(strtofloat(vl_compra) / dao.Q1.fieldbyname('valor_ponto_fidelidade').asfloat);

  if (pontos_convertido <> '') then
     dao.Execsql('update cliente set ponto_fidelidade = ponto_fidelidade + '+ FMFUN.prepara_valor(pontos_convertido) +' where cod_cliente='+QuotedStr(c_cliente));}

{  dao.Geral1('select * from tabela_credito');
  dao.Q1.First;

  p_credito:=0;
  while not(dao.Q1.Eof) do
  begin
    if (StrToFloat(valor_compra) >= dao.Q1.FieldByName('vlr_inicial').AsFloat) and (StrToFloat(valor_compra) <= dao.Q1.FieldByName('vlr_final').AsFloat) then
      p_credito:= dao.q1.fieldbyname('percentual_credito').AsFloat;
    dao.Q1.next;
  end;

  valor_credito:= StrToFloat(valor_compra) *(p_credito/100);
  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
  dao.Execsql('insert into credito (cod_cliente, valor, pago, nr_documento, data, percentual_credito) values ('+QuotedStr(c_cliente)+','+
  quotedStr(FMFUN.prepara_valor(floattostr(valor_credito)))+','+QuotedStr('N')+','+ QuotedStr(PrNumDoc.Text)+','+QuotedStr(FormatDateTime('dd.mm.yyyy',dao.DtaSerDt))+','+QuotedStr(FMFUN.prepara_valor(floattostr(p_credito)))+')');
  dao.cn.Commit;}

end;

procedure TFr_vendas.cancelar_faturamento(usuario_desfaturou : String);
var
  pontos: String;
begin
  if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
  q_venda2.First;
  while not(q_venda2.Eof) do
  begin
    FRPRI.atualiza_estoque(q_venda2.fieldbyname('cod_produto').AsString, 'E', q_venda2.fieldbyname('qtd').AsString,'R');
    FRPRI.atualiza_estoque_grade(q_venda2.fieldbyname('cod_produto').AsString, q_venda2.fieldbyname('id_cor').AsString ,'' , q_venda2.fieldbyname('id_tamanho').AsString, 'E' , q_venda2.fieldbyname('qtd').AsString,'R');
    q_venda2.Next;
  end;
  dao.Execsql('delete from cr1 where nr_documento='+QuotedStr(q_venda1.fieldbyname('numdoc').AsString));
  dao.Execsql('update vendas1 set faturado='+QuotedStr('0')+', usuario_desfaturou='+ QuotedStr(usuario_desfaturou) +' where numdoc = '+ QuotedStr(q_venda1.fieldbyname('numdoc').AsString));

  //cancelar pontos referente a Fidelidade
  dao.geral1('select valor_ponto_fidelidade from configuracao');
  if (dao.q1.FieldByName('valor_ponto_fidelidade').AsString <> '') and (dao.q1.FieldByName('valor_ponto_fidelidade').AsFloat <> 0) then
  begin
    pontos := floattostr(Prtot_liquido.value / dao.Q1.fieldbyname('valor_ponto_fidelidade').Asfloat);
    dao.Execsql2('update cliente set ponto_fidelidade = ponto_fidelidade -'+FMFUN.prepara_valor(pontos) + ' where cod_cliente='+ QuotedStr(Prcod_cliente.Text));
  end;

  dao.cn.commit;
end;

function TFr_vendas.busca_credito(c_cliente: String):String;
begin
  dao.Geral1('select ponto_fidelidade from cliente where cod_cliente='+QuotedStr(c_cliente));

  Result:= dao.Q1.fieldbyname('ponto_fidelidade').AsString;
end;

procedure TFr_vendas.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
     Lbnom_cliente.Caption:= '...';

  if Prcod_cliente.Text <> '' then
     zzvalor_credito.Text:= busca_credito(Prcod_cliente.Text);

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente='+QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      dao.Geral3('select * from credito where cod_cliente='+QuotedStr(Prcod_cliente.Text)+' and pago='+QuotedStr('N'));
      if dao.Q3.RecordCount > 0 then
      begin
        dao.msg('Este Cliente tem Créditos não Utilizados!');
      end;
      Lbnom_cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;

    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text:= '';
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas.BtcreditoClick(Sender: TObject);
begin
  if Prcod_cliente.Text = '' then
  begin
    dao.msg('O Campo Cliente não Pode Ficar em Branco');
    exit;
  end;

  Application.CreateForm(TFr_credito, Fr_credito);
  Fr_credito.MontaCL_credito(Prcod_cliente.Text);
  Fr_credito.zzcliente.Caption:= Lbnom_cliente.Caption;
  Fr_credito.ShowModal;
  //Fr_sel_fidelidade.mostra_creditos(Prcod_cliente.Text, Lbnom_cliente.Caption, PrNumDoc.Text);
 // Fr_sel_fidelidade.numdoc:= PrNumDoc.Text;
//  Fr_sel_fidelidade.ShowModal;

end;

procedure TFr_vendas.comprovante_venda;
var
  MSWord: variant;
  nom_arquivo, doc: String;
begin
  dao.Geral1('select v2.*,p.nom_produto from vendas2 v2 '+#13+
             'left join produto p on p.cod_produto=v2.cod_produto '+
             'where v2.numdoc='+QuotedStr(PrNumDoc.Text));


//   MSWord := CreateOleObject('Word.Application');
//   MSWord.Documents.Open('c:\orbi\Relatorios\imp_venda.doc');
//   MSWord.Visible:=true;

   DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\comprovante.xls');

   MSWord := CreateOleObject('Word.Application');
   MSWord.Documents.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\imp_venda.doc');
   MSWord.ActiveDocument.SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\comprovante.doc');
   msword.visible := false;

   MSWord.ActiveDocument.FormFields.Item('data').Result:= FormatDateTime('dd/mm/yyyy',PrDtaDoc.Date);
   MSWord.ActiveDocument.FormFields.Item('numdoc').Result:= PrNumDoc.Text;
   MSWord.ActiveDocument.FormFields.Item('cliente').Result:= Lbnom_cliente.Caption;

   MSWord.ActiveDocument.Tables.Item(1).Select;

   FRPRI.NumTab(MSWord,4,'');
   while not(dao.Q1.Eof) do
   begin
     FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.fieldbyname('nom_produto').AsString);
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('preco').AsFloat));
     FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('qtd').AsString);
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('sub_total').AsFloat));
     dao.Q1.Next;
   end;

   MSWord.ActiveDocument.Tables.Item(2).Select;

   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prtot_bruto.Value));
   FRPRI.NumTab(MSWord, 2, Lbnom_fop.Caption);//forma de pagamento
   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prdesconto.Value));
   FRPRI.NumTab(MSWord, 2, Prprazo_pgto.Text);//forma de pagamento
   FRPRI.NumTab(MSWord, 2, FormatFloat('###,##0.00', Prponto_usado.Value));//forma de pagamento
   FRPRI.NumTab(MSWord, 4, FormatFloat('###,##0.00', Prtot_liquido.Value));//forma de pagamento



   // SALVA O DOCUMENTO

   MSWord.Visible:=true;


end;

procedure TFr_vendas.bt_imprimirClick(Sender: TObject);
begin
  if PrNumDoc.Text = ''  then
  begin
    dao.msg('Você deve Localizar uma Venda!');
    exit;
  end;
    if Prconsignacao.ItemIndex = 1 then
       MontaTermoConsignacao(PrNumDoc.Text)
    else
    if mform ='devolucao_cliente' then
       comprovante_credito
    else   
      comprovante_venda;
end;

procedure TFr_vendas.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
     Lbnom_representante.Caption:= '...';

  if Prcod_representante.Text <> '' then
  begin
    dao.Geral2('select id, nom_representante from representante where id='+QuotedStr(Prcod_representante.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_representante.Text:= '';
      Prcod_representante.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_vendas.Prcod_fopExit(Sender: TObject);
begin
  if Prcod_fop.Text <> '' then
  begin
    dao.Geral2('select nom_fop from fop where cod_fop='+QuotedStr(Prcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fop.Caption := dao.Q2.fieldbyname('nom_fop').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fop.Text:= '';
      Prcod_fop.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas.MontaTermoConsignacao(n_documento: String);
var
  Msword, doc: variant;
begin
  dao.Geral1('select v2.*, p.nom_produto, cr.nom_cliente, p.grade, c.cor, t.tamanho, r.nom_representante from vendas2 v2 '+#13+
             'left join vendas1 v1 on v1.numdoc=v2.numdoc '+
             'left join produto p on p.cod_produto=v2.cod_produto '+
             'left join cores c on c.id=v2.id_cor '+
             'left join tamanho t on t.id=v2.id_tamanho '+
             'left join cliente cr on cr.cod_cliente=v2.cod_cliente '+
             'left join representante r on r.id=v1.cod_representante '+
             'where v2.numdoc='+QuotedStr(PrNumDoc.Text));

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\termo consignacao.xls');                              //rz sistemas

   MSWord := CreateOleObject('Word.Application');
   MSWord.Documents.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\termo_consignacao.doc');
   MSWord.ActiveDocument.SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\termo consignacao.doc');
   msword.visible := true;

   MSWord.ActiveDocument.Tables.Item(1).Select;

   FRPRI.NumTab(MSWord, 2, 'Nº Consignação: '+ dao.Q1.FieldByName('numdoc').AsString);
   FRPRI.NumTab(MSWord, 1, 'Data: '+ FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dtadoc').AsDateTime));
   FRPRI.NumTab(MSWord, 1, 'Cliente: '+ dao.Q1.FieldByName('nom_cliente').AsString);
   FRPRI.NumTab(MSWord, 1, 'Vendedor: '+ dao.Q1.FieldByName('nom_representante').AsString);

   FRPRI.NumTab(MSWord,4,'');
   while not(dao.Q1.Eof) do
   begin
     if dao.Q1.FieldByName('grade').AsString = '0' then
        FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.fieldbyname('nom_produto').AsString+'- '+dao.Q1.fieldbyname('cor').AsString+'- '+dao.Q1.fieldbyname('tamanho').AsString)
     else
        FRPRI.NumTab(MSWord, 1, dao.Q1.FieldByName('cod_produto').AsString+'/'+dao.Q1.fieldbyname('nom_produto').AsString);

     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('qtd').AsFloat));
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('preco').AsFloat));
     FRPRI.NumTab(MSWord, 1, FormatFloat('###,##0.00', dao.Q1.FieldByName('preco').AsFloat * dao.Q1.FieldByName('qtd').AsFloat));
     dao.Q1.Next;
   end;

   MSWord.ActiveDocument.FormFields.Item('total').Result:= formatfloat('###,##0.00', Prtot_liquido.Value);

   msword.Visible:= true;
end;

procedure TFr_vendas.Prtot_liquidoExit(Sender: TObject);
begin
{ FELIPE 17/08/2009}
  if (Prtot_liquido.Value > 0) and (Prtot_liquido.Value < Prtot_bruto.Value) then
  begin
//    Prdesconto.Value :=100-(Prtot_liquido.Value/Prtot_bruto.Value)*100;
    Prdesconto.Value :=100-((sgx.ColumnSum(6,1,sgx.RowCount)/sgx.ColumnSum(10,1,sgx.RowCount))*100);
  end;
end;

procedure TFr_vendas.comprovante_credito;
var
  Msword: variant;
begin
  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\comprovante credito.xls');

 { MSWord.Documents.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\comprovante_credito.doc');
  MSWord.ActiveDocument.SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\comprovante credito.doc');
  msword.visible := false;

  MSWord.ActiveDocument.FormFields.Item('loja').Result:= nom_empresa;
  MSWord.ActiveDocument.FormFields.Item('cliente').Result:= Lbnom_cliente.Caption;
  MSWord.ActiveDocument.FormFields.Item('valor').Result:= FormatFloat('###,##0.00',Prtot_liquido.Value);
  MSWord.ActiveDocument.FormFields.Item('dt_devolucao').Result:= FormatDateTime('dd/mm/yyyy', PrDtaDoc.Date);

  Msword.Visible:= true;
  }
end;

procedure TFr_vendas.sgxxxKeyPress(Sender: TObject; var Key: Char);
var
  qtd_char:integer;
  qtd, cod, tamanho : String;

begin
  If edit_sg = 'N' then
     Exit;

  If edit_sg = 'S' then
  begin
    if sgx.col = 1 then
    begin
      {If not( key in['0'..'9',#8] ) and (key <> #13) then
      begin
         beep;{somente delphi 2.0 ou >}
        // key:=#0;}
      //end;
    end;

    if (key=#13) then
    begin
      if (SGX.Col = 1) then
        if (sgx.Cells[1,lin]='') then
        begin
          busca_produto;
          if Fr_localizar.Qu_localizar.Active then
          begin
            sgx.Cells[2,lin]:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
            sgx.Cells[3,lin]:= '1';
            if mform = 'vendas' then
            begin
              sgx.Cells[4,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
              sgx.Cells[5,lin]:= formatfloat('0.00', Fr_localizar.Qu_localizar.fieldbyname('preco_venda').AsFloat);
            end;
            if Fr_localizar.Qu_localizar.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[6,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= Fr_localizar.Qu_localizar.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
                //modificado felipe 31/12/2008
                if (sgx.cells[6,lin] <> '') and (sgx.cells[7,lin] <> '') then
                begin
                  dao.Geral1('select * from grade where cod_produto='+QuotedStr(sgx.Cells[1,lin])+' and id_cor='+quotedStr(sgx.cells[6,lin])+' and id_tamanho='+quotedStr(sgx.cells[7,lin]));
                  if dao.Q1.RecordCount < 1 then
                  begin
                    dao.msg('A GRADE DIGITADA NÃO FOI ENCONTRADA NO CADASTRO DO PRODUTO!');
                    sgx.Cells[1,lin]:= '';
                    sgx.Cells[2,lin]:= '';
                    sgx.Cells[3,lin]:= '';
                    sgx.Cells[4,lin]:= '';
                    sgx.Cells[5,lin]:= '';
                    sgx.Cells[6,lin]:= '';
                    sgx.Cells[7,lin]:= '';
                    exit;
                  end;
                end
                else
                begin
                  dao.msg('DEVE SER INFORMADO A COR E TAMANHO DO PRODUTO!');
                  sgx.Cells[1,lin]:= '';
                  sgx.Cells[2,lin]:= '';
                  sgx.Cells[3,lin]:= '';
                  sgx.Cells[4,lin]:= '';
                  sgx.Cells[5,lin]:= '';
                  sgx.Cells[6,lin]:= '';
                  sgx.Cells[7,lin]:= '';
                  exit;
                end;
              end;
            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];

            sgx.Col:= 3;
          end;
        end
        else
        if (Length(sgx.Cells[1,lin])<12) then
        begin
          busca_produto_unitario(False, uppercase(sgx.Cells[1,lin]));

            if dao.Q1.FieldByName('grade').AsString = '0' then
            begin
              if (sgx.Cells[6,lin] = '') then //if a celula do atributo estiver vazia então chama o sel_atributo
              begin
                Application.CreateForm(TFrSel_Atributo, FrSel_Atributo);
                FrSel_Atributo.Caption:= dao.Q1.fieldbyname('nom_produto').AsString;
                FrSel_Atributo.ShowModal;
                sgx.Cells[2,lin]:= sgx.Cells[2,lin] +'- '+nom_cor +'- '+nom_tamanho;
                if (sgx.cells[6,lin] <> '') and (sgx.cells[7,lin] <> '') then
                begin
                  dao.Geral1('select * from grade where cod_produto='+QuotedStr(sgx.Cells[1,lin])+' and id_cor='+quotedStr(sgx.cells[6,lin])+' and id_tamanho='+quotedStr(sgx.cells[7,lin]));
                  if dao.Q1.RecordCount < 1 then
                  begin
                    dao.msg('A GRADE DIGITADA NÃO FOI ENCONTRADA NO CADASTRO DO PRODUTO!');
                    sgx.Cells[1,lin]:= '';
                    sgx.Cells[2,lin]:= '';
                    sgx.Cells[3,lin]:= '';
                    sgx.Cells[4,lin]:= '';
                    sgx.Cells[5,lin]:= '';
                    sgx.Cells[6,lin]:= '';
                    sgx.Cells[7,lin]:= '';
                    exit;
                  end;
                end
                else
                begin
                  dao.msg('DEVE SER INFORMADO A COR E TAMANHO DO PRODUTO!');
                  sgx.Cells[1,lin]:= '';
                  sgx.Cells[2,lin]:= '';
                  sgx.Cells[3,lin]:= '';
                  sgx.Cells[4,lin]:= '';
                  sgx.Cells[5,lin]:= '';
                  sgx.Cells[6,lin]:= '';
                  sgx.Cells[7,lin]:= '';
                  exit;
                end;
              end;

            end
            else
              sgx.Cells[2,lin]:= sgx.Cells[2,lin];

          if dao.Q1.RecordCount >= 1 then
            if edit_sg = 'S' then
            begin
              if (SGX.Col) = 3 then //se for ultima coluna insere linha nova.
                if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
                begin
                  sgx.Row:= sgx.RowCount - 1;
                  sgx.Col := 1;
                end
                else
                begin
                  InsLinha(SGX);
                  SGX.Col:= 1;
                end;
              end;

        end
        else
        begin
          busca_produto_unitario(true, uppercase(sgx.Cells[1,lin]));
        end
        else
          if SGX.Col = 3 then
            if (sgx.row >= 1) and (sgx.cells[1,sgx.RowCount-1] = '') then
            begin
              sgx.Row:= sgx.RowCount-1;
              sgx.Col:= 1;
            end
            else
            begin
              InsLinha(sgx);
              SGX.Col:= 1;
            end;

        {        if SGX.Col = 3 then
             if sgx.Cells[1,lin] <> '' then
             begin
               InsLinha(sgx);
               if lin <> sgx.RowCount-1 then
                  sgx.Row:= sgx.RowCount-1;
             end
             else
               SGX.Col:= SGX.Col + 1;}
    end;

  end;

  SGX:= TAdvStringGrid(Sender);
  if (SGX.Col = 3) or (SGX.Col = 4) or (SGX.Col = 5) or (SGX.Col = 6) or (SGX.Col = 7) or (SGX.Col = 8) then
  begin
     if Key = '.' then
        Key:= ',';
     if (Key = ',') and (pos(',', SGX.Cells[SGX.RealCol, SGX.Row]) > 0) then
        Key:= #0;

     if not(Key in['0'..'9', ',', #8, #13]) then//Verifica se foi digitado algo diferente
     begin                                      //do que 0 a 9 ou ','
        beep;
        Key:= #0;
     end;
{     if sgx.Col = 3 then
     begin
       decimalseparator:='.';
       qtd:= sgx.Cells[3,lin];
       sgx.Cells[5,lin]:= floattostr(FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[4,lin],0));
       decimalseparator:=',';
     end;}
  end;

end;

procedure TFr_vendas.sgxxxCellChanging(Sender: TObject; OldRow, OldCol,
  NewRow, NewCol: Integer; var Allow: Boolean);
begin
  If edit_sg = 'N' then
     Exit;

  if edit_sg = 'S' then
  begin
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount-1));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));
  end;

  if (col=3) and (sgx.Cells[1,lin] <> '') then
  begin
    if ((sgx.Cells[3,lin]='') or (sgx.Cells[3,lin]='0')) then
    begin
      sgx.cells[3,lin]:= '1';
      sgx.Col:=3;
      dao.msg('O campo Qtd não pode ficar vazio ou 0 !');
      exit;
    end;



  end;

end;

procedure TFr_vendas.sgxxxCellsChanged(Sender: TObject; R: TRect);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

  If edit_sg = 'N' then
     Exit;


//    decimalseparator:='.';
  if mform = 'vendas' then
     sgx.Cells[5,lin]:= formatfloat('0.00',FMFUN.Str_to_float(sgx.Cells[3,lin],0) * FMFUN.Str_to_float(sgx.Cells[4,lin],0));
  if edit_sg = 'S' then
  begin
    Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount-1));
    Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));
  end;

end;

procedure TFr_vendas.sgxxxClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

end;

procedure TFr_vendas.sgxxxExit(Sender: TObject);
begin
  Prtot_bruto.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount));
  Prtot_liquido.text:= floattostr(sgx.ColumnSum(5,1,sgx.RowCount)- (sgx.ColumnSum(5,1,sgx.RowCount) * (Prdesconto.Value/100)));

end;

procedure TFr_vendas.sgxxxRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  if (SGX.Col = 0) then
  begin
    sgx.col := 1;
  end;

end;

procedure TFr_vendas.sgxxxSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  col:= sgx.Col;
  lin:= sgx.Row;
  linmax:= sgx.RowCount;

  if (ACol = 4) or (ACol = 5) or (Acol = 2) then
  begin
    sgx.Options := sgx.Options - [goEditing]
  end
  else
  begin
    sgx.Options := sgx.Options + [goEditing];
  end;

end;


procedure TFr_vendas.ativa_cr1(numdoc: String);
begin
  with q_cr1 do
  begin
    close;
    sql.clear;
    sql.add('select cr.*, fp.nom_fop from cr1 cr '+
             'left join fop fp on fp.cod_fop=cr.cod_fop '+
             'where cr1.nr_documento ='+QuotedStr(numdoc));
    open;

    q_cr1.FieldByName('titulo').DisplayLabel:= 'Titulo';
    q_cr1.FieldByName('sequencia').DisplayLabel:= 'Seq.';
    q_cr1.FieldByName('dtaven').DisplayLabel:= 'Vencimento';
    q_cr1.FieldByName('valor').DisplayLabel:= 'Valor';
    q_cr1.FieldByName('nom_fop').DisplayLabel:= 'Forma Pagamento';

    q_cr1.FieldByName('id').Visible:= false;
    q_cr1.FieldByName('cod_cliente').Visible:= false;
    q_cr1.FieldByName('nr_documento').Visible:= false;
    q_cr1.FieldByName('cod_empresa').Visible:= false;
    q_cr1.FieldByName('cod_fop').Visible:= false;
    q_cr1.FieldByName('historico').Visible:= false;
    q_cr1.FieldByName('dtarec').Visible:= false;
    q_cr1.FieldByName('valor_recebido').Visible:= false;
    q_cr1.FieldByName('saldo').Visible:= false;
    q_cr1.FieldByName('dias_atraso').Visible:= false;
    q_cr1.FieldByName('vlr_corrigido').Visible:= false;
    q_cr1.FieldByName('desconto').Visible:= false;
    q_cr1.FieldByName('nr_cupom').Visible:= false;
    q_cr1.FieldByName('id_plano_contas').Visible:= false;
    q_cr1.FieldByName('id_representante').Visible:= false;
    q_cr1.FieldByName('id_representante').Visible:= false;
    q_cr1.FieldByName('vlr_comissao').Visible:= false;
  end;
end;



procedure TFr_vendas.q_cr1AfterScroll(IB_Dataset: TIB_Dataset);
var
    i: Integer;
begin
  Crid.Text:= q_cr1.fieldbyname('id').AsString;
  Crdtaven.Date:= q_cr1.fieldbyname('dtaven').AsDateTime;
  Crvalor.Value:= q_cr1.fieldbyname('valor').AsFloat;
  Crcod_fop.Text:= q_cr1.fieldbyname('cod_fop').AsString;
  Lbnom_fop_cr1.Caption:= q_cr1.fieldbyname('nom_fop').AsString;

  if Lbnom_fop.Caption = 'CHEQUE' then
  begin
    i:=1;
    Sg_cheque.Clear;
    Sg_cheque.RowCount:=2;
    Sg_cheque.Cells[0,0]:= 'Nº Cheque';
    Sg_cheque.Cells[1,0]:= 'Ag';
    Sg_cheque.Cells[2,0]:= 'C.C';
    Sg_cheque.Cells[3,0]:= 'Dta. Emissão';
    Sg_cheque.Cells[4,0]:= 'Dta. Vencimento';
    Sg_cheque.Cells[5,0]:= 'Valor';
    Sg_cheque.Cells[6,0]:= 'Titular';

    dao.Geral1('select * from cheque_terceiros where titulo_cr1='+QuotedStr(q_cr1.fieldbyname('titulo').AsString)+' and seq_cr1='+QuotedStr(q_cr1.fieldbyname('sequencia').AsString));
    if dao.Q1.RecordCount > 0 then
    begin
 //     Pacheque.Visible:= true;
      Sg_cheque.Cells[0,i]:= dao.Q1.fieldbyname('nr_cheque').AsString;
      Sg_cheque.Cells[1,i]:= dao.Q1.fieldbyname('nr_agencia').AsString;
      Sg_cheque.Cells[2,i]:= dao.Q1.fieldbyname('nr_conta_corrente').AsString;
      Sg_cheque.Cells[3,i]:= dao.Q1.fieldbyname('dta_emissao').AsString;
      Sg_cheque.Cells[4,i]:= dao.Q1.fieldbyname('dta_vencimento').AsString;
      Sg_cheque.Cells[5,i]:= FormatFloat('###,##0.00', dao.Q1.fieldbyname('valor').AsFloat);
      Sg_cheque.Cells[6,i]:= dao.Q1.fieldbyname('nom_titular').AsString;
      i:= i+1;
      dao.Q1.Next;
    end;
  end
  else
  begin
    Sg_cheque.Clear;
    Sg_cheque.RowCount:=2;
    Sg_cheque.Cells[0,0]:= 'Nº Cheque';
    Sg_cheque.Cells[1,0]:= 'Ag';
    Sg_cheque.Cells[2,0]:= 'C.C';
    Sg_cheque.Cells[3,0]:= 'Dta. Emissão';
    Sg_cheque.Cells[4,0]:= 'Dta. Vencimento';
    Sg_cheque.Cells[5,0]:= 'Valor';
    Sg_cheque.Cells[6,0]:= 'Titular';
//    Pacheque.Visible:= false;
  end;






end;

procedure TFr_vendas.Button1Click(Sender: TObject);
begin
  try
    if not(dao.cn.InTransaction) then (dao.cn.StartTransaction);
    dao.update('cr1','id',Crid.Text,'Cr',Fr_vendas);
    dao.cn.Commit;
    ativa_cr1(Prnumdoc.Text);
    dao.msg('Alterações Gravadas com Sucesso!');
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao gravar Alterações no grid do Contas a Receber!'+#13+
                 e.message);
      dao.envia_email_suporte(e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao gravar os dados no grid do cr1 form vendas_industria','felipesans@terra.com.br','','','');
    end;
  end;

end;

procedure TFr_vendas.Crcod_fopExit(Sender: TObject);
begin
  if Crcod_fop.Text <> '' then
  begin
    dao.Geral2('select nom_fop from fop where cod_fop='+QuotedStr(Crcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fop_cr1.Caption := dao.Q2.fieldbyname('nom_fop').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Crcod_fop.Text:= '';
      Crcod_fop.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_vendas.Crcod_fopButtonClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_venda_cr1_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Formas de Pagamento';
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

procedure TFr_vendas.Crcod_fopKeyPress(Sender: TObject; var Key: Char);
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
    if (Crcod_fop.Text = '') and (btnov.Enabled = false) then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_venda_cr1_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Formas de Pagamento';
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

procedure TFr_vendas.Prnr_venda_originalExit(Sender: TObject);
var
  dta_original:TDate;
begin
  if Prnr_venda_original.Text <> '' then
  begin
    dao.Geral1('select v1.cod_cliente, c.nom_cliente,v1.dtadoc, v1.desconto from vendas1 v1 '+
               'left join cliente c on c.cod_cliente=v1.cod_cliente '+
               'where v1.numdoc='+QuotedStr(Prnr_venda_original.Text));
    if dao.Q1.RecordCount > 0 then
    begin
      dta_original:= dao.Q1.fieldbyname('dtadoc').AsDateTime;
      if Now-dta_original > 30 then
      begin
        dao.msg('A Venda '+Prnr_venda_original.Text+' foi efetuada a mais de 30 dias sendo assim'+ #13 +
        'não mais possivel efetuar a troca');
        exit;
      end;
      Prdesconto.Value:= 0;
//FELIPE 11/12/2009      Prdesconto.Value:= dao.Q1.fieldbyname('desconto').AsFloat;
      Prcod_cliente.Text:= dao.Q1.fieldbyname('cod_cliente').AsString;
      Lbnom_cliente.Caption:= dao.Q1.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      dao.msg('Não foi encontrado a venda original desse produto!');
      Prnr_venda_original.Text:= '';
      Prdesconto.Value:= 0;
      exit;
    end;
  end;
end;

procedure TFr_vendas.SpeedButton1Click(Sender: TObject);
begin
 // dao.Geral1('select endereco, ');
  //ver artigo no site http://www.techtips.com.br/programacao/mapas-do-google-no-seu-aplicativo-delphi/
//  ShellExecute(0, Nil,  PChar('http://maps.google.com.br/maps?f=q&source=s_q&hl=pt-BR&geocode=&q=' +Clientes.FieldByName('Logradouro').AsString + ', ' + Clientes.FieldByName('Numero').AsString + ', ' +
 //     Clientes.FieldByName('Cidade').AsString + '-' + Clientes.FieldByName('UF').AsString + '&jsv=143c&sll=-23.186453,-46.884453? &sspn=0.478436,0.545883&g=&ie=UTF8&ct=clnk&cd=1?'), Nil, Nil, 0);
end;

procedure TFr_vendas.Btinsere_chequeClick(Sender: TObject);
begin
  if q_cr1.FieldByName('titulo').AsString = '' then
  begin
    dao.msg('Selecione um Titulo para inserir um Cheque!');
    exit;
  end;
  if Lbnom_fop_cr1.Caption <> 'CHEQUE' then
  begin
    dao.msg('Para inserir um cheque a forma de pagamento deve ser cheque!');
    exit;
  end;
  Application.CreateForm(TFr_cheque_terceiros,Fr_cheque_terceiros);
  Fr_cheque_terceiros.ShowModal;

end;

procedure TFr_vendas.HistoricodeProduto1Click(Sender: TObject);
begin
  Application.CreateForm(TFr_pesquisa_produto_venda, Fr_pesquisa_produto_venda);
  Fr_pesquisa_produto_venda.ShowModal;
end;

end.
