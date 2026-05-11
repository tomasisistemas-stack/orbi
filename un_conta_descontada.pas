unit un_conta_descontada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, Grids,
  DBGrids, DB, RxMemDS, Math, sLabel, sPanel, sBitBtn, sGroupBox, sCheckBox,
  acDBGrid, sEdit, sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sComboEdit, sComboBox;

type
  Tfrm_conta_descontada = class(TForm)
    Panel1: tsPanel;
    gbFormaPgto: TsGroupBox;
    cbConta: TsComboBox;
    gbDataMov: TsGroupBox;
    eddtMov: TsDateEdit;
    pnInsCheq: tsPanel;
    Btnov: TsBitBtn;
    Panel3: tsPanel;
    Panel4: tsPanel;
    dgContasPagar: Tdbgrid;
    mmContasPagar: TRxMemoryData;
    dsContapagar: TDataSource;
    mmContasPagarChequeNum: TIntegerField;
    mmContasPagarCodConta: TIntegerField;
    mmContasPagarConta: TStringField;
    mmContasPagarDataSacar: TDateField;
    mmContasPagarValor: TCurrencyField;
    stTotal: tsLabel;
    Label1: tsLabel;
    BtnOk: TsBitBtn;
    BitBtn2: TsBitBtn;
    mmContasPagarNominal: TStringField;
    mmContasPagarDataEmissao: TDateTimeField;
    gbDeposito: TsGroupBox;
    GroupBox5: TsGroupBox;
    edValor: TsCurrencyEdit;
    ckPgtoParcial: tscheckbox;
    PnDeposito: tsPanel;
    PnCheques: tsPanel;
    mmDeposito: TRxMemoryData;
    dsDeposito: TDataSource;
    mmDepositoConta: TIntegerField;
    mmDepositoTipoPagto: TIntegerField;
    mmDepositoValor: TCurrencyField;
    mmDepositoDescConta: TStringField;
    mmDepositoDescTipo: TStringField;
    dgDeposito: Tdbgrid;
    mmDepositoDataMov: TDateField;
    rgtipoPagto: TsRadioGroup;
    gbDescPerc: TsGroupBox;
    lbPercDesc: TsLabelFX;
    gbCheques: TsGroupBox;
    gbNCC: TsGroupBox;
    Lbnom_cc: tsLabel;
    edContaCheque: TsComboEdit;
    gbDataSacar: TsGroupBox;
    eddtSacar: TsDateEdit;
    gbCheqNum: TsGroupBox;
    edNumCheque: TsCurrencyEdit;
    gbValorCheque: TsGroupBox;
    edValorCheque: TsCurrencyEdit;
    gbNominal: TsGroupBox;
    edNominal: TsEdit;
    mmDepositoChequeNum: TIntegerField;
    mmDepositoDataSacar: TDateField;
    procedure FormShow(Sender: TObject);
    procedure cbContaChange(Sender: TObject);
    procedure CheckTotal(Origem: Integer; Inc: boolean = true);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure edContaChequeExit(Sender: TObject);
    procedure edContaChequeButtonClick(Sender: TObject);
    procedure dgContasPagarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgContasPagarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edValorChequeExit(Sender: TObject);
    procedure rgtipoPagtoClick(Sender: TObject);
    procedure dgDepositoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgDepositoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edValorExit(Sender: TObject);
    procedure ckPgtoParcialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Saldo, Total, Rateio, Desconto, Desconto_Perc: double;
    Conta_Pagar_Receber, Conta_Bancaria, cheque_master, Tipo_Pagto,
      extrato: Integer;
    Desc_Conta, Desc_Tipo_Pagto, historico: string;
    PAGAR, Antecipado: boolean;
    Listas_Contas: array of Integer;
    Autorizacao: boolean;

  end;

var
  frm_conta_descontada: Tfrm_conta_descontada;

implementation

uses Un_dao, UnFun, Un_cheques, Un_localizar, Unpri, unsenha_especial,
  Un_cheque_terceiros;

{$R *.dfm}

procedure Tfrm_conta_descontada.FormShow(Sender: TObject);
var
  itens_conta: string;
begin
  gbDescPerc.Visible := false;
  rgtipoPagto.Width := 596;

  eddtMov.Date := Now;
  stTotal.Caption := FormatFloat('R$ #,###,##0.00', Total);
  edValor.Value := Total;
  edValorCheque.Value := Total;
  Saldo := Total;
  cbConta.Items.Clear;
  gbCheques.Visible := false;
  gbDeposito.Visible := false;

  if PAGAR then
  begin
    cbConta.Items.Add('0-Cheques');
    PnCheques.Visible := true;
    dgContasPagar.Visible := true;
  end
  else
  begin
    cbConta.Items.Add(' ');
    PnCheques.Visible := false;
    dgContasPagar.Visible := false;
  end;

  dao.Geral1
    ('SELECT a.ID, B.NOM_BANCO,A.NR_AGENCIA,A.NOM_CONTA FROM CONTA_CORRENTE a LEFT OUTER JOIN BANCO B ON (B.ID = A.ID_BANCO) WHERE a.ATIVO = ''S'' ');
  dao.Q1.First;
  while not dao.Q1.eof do
  begin
    itens_conta := '';
    itens_conta := itens_conta + dao.Q1.fieldbyname('id').AsString;

    if not dao.Q1.fieldbyname('nom_banco').IsNull then
      itens_conta := itens_conta + '-' + dao.Q1.fieldbyname
        ('nom_banco').AsString;

    if not dao.Q1.fieldbyname('NR_AGENCIA').IsNull then
      itens_conta := itens_conta + '-' + dao.Q1.fieldbyname
        ('NR_AGENCIA').AsString;

    itens_conta := itens_conta + '-' + dao.Q1.fieldbyname('NOM_CONTA').AsString;

    cbConta.Items.Add(itens_conta);
    dao.Q1.Next;
  end;
  cbConta.ItemIndex := 0;

  if PAGAR then
    cbContaChange(Self);
end;

procedure Tfrm_conta_descontada.cbContaChange(Sender: TObject);
begin
  mmContasPagar.open;
  mmDeposito.open;

  if cbConta.ItemIndex = 0 then
  begin
    // edValor.Clear;
    gbCheques.Visible := true;
    gbDeposito.Visible := false;
    eddtSacar.SetFocus;
  end
  else
  begin
    Conta_Bancaria := StrToInt(Copy(cbConta.Text, 1,
      pos('-', cbConta.Text) - 1));
    Desc_Conta := Copy(cbConta.Text, pos('-', cbConta.Text) + 1,
      length(cbConta.Text));

    eddtSacar.Clear;
    edNumCheque.Clear;
    edContaCheque.Clear;
    // edValorCheque.Clear;
    edNominal.Clear;

    gbCheques.Visible := false;
    gbDeposito.Visible := true;

    dao.Geral1
      ('SELECT PC3.ID, CC.ANTECIPADO, cc.ID_BANCO FROM CONTA_CORRENTE CC INNER JOIN PLANO_CONTAS PC4 ON (PC4.ID = CC.ID_PLANO_CONTAS) INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI)  WHERE CC.ID = '
      + inttostr(Conta_Bancaria));

    Antecipado := dao.Q1.fieldbyname('ANTECIPADO').AsString = 'S';
    Autorizacao := dao.Q1.fieldbyname('ID_BANCO').IsNull and not pagar;

    if dao.Q1.fieldbyname('id').AsString = '3' then
    begin
      rgtipoPagto.Visible := true;
      Desc_Tipo_Pagto := 'Dinheiro';
      rgtipoPagto.SetFocus;
    end
    else
    begin
      rgtipoPagto.Visible := false;
      Tipo_Pagto := 2;
      Desc_Tipo_Pagto := 'Depósito';
      edValor.SetFocus;
    end;
  end;

  if (Saldo = 0) or (ckPgtoParcial.Checked) then
    BtnOk.Enabled := true
  else
    BtnOk.Enabled := false;

end;

procedure Tfrm_conta_descontada.BtnOkClick(Sender: TObject);
var
  cheque, x: Integer;
begin
  if not mmContasPagar.IsEmpty then
  begin
    cheque_master := fmfun.BuscaProxCheque;
    mmContasPagar.First;
    while not mmContasPagar.eof do
    begin

      cheque := fmfun.BuscaProxCheque;
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add
          ('INSERT INTO CHEQUES (ID, COD_CONTA_CORRENTE, NR_CHEQUE, DTA_EMISSAO, DTA_VENCIMENTO, VALOR, NOMINAL, HISTORICO, QUITADO, ID_MASTER)'
          + ' VALUES (' + inttostr(cheque) + ', ' +
          QuotedStr(mmContasPagarCodConta.AsString) + ', ' +
          mmContasPagarChequeNum.AsString + ', ' +
          QuotedStr(formatdatetime('dd/mm/yyyy', mmContasPagarDataEmissao.Value)
          ) + ', ' + QuotedStr(formatdatetime('dd/mm/yyyy',
          mmContasPagarDataSacar.Value)) + ', ' +
          StringReplace(FormatFloat('0.00', mmContasPagarValor.Value), ',', '.',
          [rfReplaceAll]) + ', ' + QuotedStr(mmContasPagarNominal.AsString) +
          ', ' + QuotedStr(historico) + ', ' + QuotedStr('N') + ', ' +
          inttostr(cheque_master) + ')');
        dao.Exec_sql.ExecSQL;
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      if messagedlg('Emitir Cheque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then
      begin
        Application.CreateForm(TFr_Emissao_cheques, Fr_Emissao_cheques);
        Fr_Emissao_cheques.pagamento := true;
        Fr_Emissao_cheques.ativa_cheques(inttostr(cheque));
        Fr_Emissao_cheques.ShowModal;
      end;

      mmContasPagar.Next;
    end;
  end
  else
    cheque_master := 0;

  if not mmDeposito.IsEmpty then
  begin
    mmDeposito.First;
    while not mmDeposito.eof do
    begin
      if (mmDepositoTipoPagto.Value <> 4) then
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;

          if PAGAR then
          begin
            for x := Low(Listas_Contas) to High(Listas_Contas) do
            begin
              extrato := fmfun.GravaExtrato(historico,
                QuotedStr(formatdatetime('dd/mm/yyyy',
                strtodate(frm_conta_descontada.eddtMov.Text))),
                mmDepositoConta.AsString, 'D', mmDepositoValor.AsFloat,
                mmDepositoTipoPagto.AsInteger);
              Conta_Pagar_Receber := Listas_Contas[x];
              fmfun.GravaExtratoConta(extrato, Conta_Pagar_Receber, 1);
            end;
          end
          else
          begin
            if not Antecipado then
            begin
              for x := Low(Listas_Contas) to High(Listas_Contas) do
              begin
                if (mmDepositoChequeNum.AsInteger > 0) then
                begin
                  historico := historico + 'em Cheque de Terceiros Nº: ' +
                    mmDepositoChequeNum.AsString;
                end;
                extrato := fmfun.GravaExtrato(historico,
                  QuotedStr(formatdatetime('dd/mm/yyyy',
                  strtodate(frm_conta_descontada.eddtMov.Text))),
                  mmDepositoConta.AsString, 'C', mmDepositoValor.AsFloat,
                  mmDepositoTipoPagto.AsInteger);
                Conta_Pagar_Receber := Listas_Contas[x];
                fmfun.GravaExtratoConta(extrato, Conta_Pagar_Receber, 2);
              end;
            end;
          end;

          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;
      end;
      mmDeposito.Next;
    end;
  end;

  Desconto_Perc := (Desconto / Total) * 100;

  if Saldo = 0 then
  begin
    if Desconto = 0 then
      Rateio := 1
    else
      Rateio := Desconto_Perc;
  end
  else
    Rateio := ((Total - Desconto) - (Saldo)) / (Total - Desconto);

  ModalResult := Mrok;
end;

procedure Tfrm_conta_descontada.CheckTotal(Origem: Integer;
  Inc: boolean = true);
begin
  if Origem = 0 then
  begin
    if Inc then
      Saldo := Saldo - mmContasPagarValor.Value
    else
      Saldo := Saldo + mmContasPagarValor.Value;
  end
  else
  begin
    if Inc then
    begin
      Saldo := Saldo - mmDepositoValor.Value;
      if rgtipoPagto.ItemIndex = 4 then
        Desconto := Desconto + mmDepositoValor.Value;
    end
    else
    begin
      Saldo := Saldo + mmDepositoValor.Value;
      if rgtipoPagto.ItemIndex = 4 then
        Desconto := Desconto - mmDepositoValor.Value;
    end;
  end;

  edValor.Value := Saldo;

  stTotal.Caption := FormatFloat('R$ #,###,##0.00', Saldo);
  if RoundTo(Saldo, -2) = 0 then
    BtnOk.Enabled := true
  else
    BtnOk.Enabled := false;
end;

procedure Tfrm_conta_descontada.BtnovClick(Sender: TObject);
begin
  if trim(cbConta.Text) = '' then
  begin
    showmessage('Escolha uma forma de pagamento!');
    exit;
  end;

  if gbCheques.Visible then
  begin
    mmContasPagar.Append;
    mmContasPagarChequeNum.AsInteger := edNumCheque.AsInteger;
    mmContasPagarCodConta.AsString := edContaCheque.Text;
    mmContasPagarConta.AsString := Lbnom_cc.Caption;
    mmContasPagarDataSacar.Value := eddtSacar.Date;
    mmContasPagarValor.Value := edValorCheque.Value;
    mmContasPagarNominal.AsString := edNominal.Text;
    mmContasPagarDataEmissao.Value := eddtMov.Date;
    mmContasPagar.Post;

    CheckTotal(0);
  end
  else
  begin
    mmDeposito.Append;

    if Autorizacao then
    begin
      Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
      Fr_senha_especial.nivel := '9';
      Fr_senha_especial.ShowModal;
      if not liberado then
        exit;
    end;

    if rgtipoPagto.ItemIndex = 2 then
    begin

      try
        Application.CreateForm(TFr_cheque_terceiros, Fr_cheque_terceiros);
        Fr_cheque_terceiros.conta_descontada := true;
        Fr_cheque_terceiros.ShowModal;
        if Fr_cheque_terceiros.ModalResult = Mrok then
        begin
          mmDepositoChequeNum.AsString := Fr_cheque_terceiros.Prnr_cheque.Text;
          mmDepositoDataSacar.AsString :=
            Fr_cheque_terceiros.Prdta_vencimento.Text;
          mmDepositoValor.Value := Fr_cheque_terceiros.Prvalor.Value;
        end
        else begin
          mmDeposito.Cancel;
          exit;
        end;

      finally
        Fr_cheque_terceiros.Free;
      end;
    end;
    mmDepositoConta.AsInteger := Conta_Bancaria;
    mmDepositoDescConta.AsString := Desc_Conta;
    mmDepositoTipoPagto.AsInteger := Tipo_Pagto;
    mmDepositoDescTipo.AsString := Desc_Tipo_Pagto;
    mmDepositoDataMov.Value := eddtMov.Date;
    if rgtipoPagto.ItemIndex <> 2 then
      mmDepositoValor.Value := edValor.Value;
    mmDeposito.Post;

    CheckTotal(1);
  end;

end;

procedure Tfrm_conta_descontada.edContaChequeExit(Sender: TObject);
begin
  if edContaCheque.Text <> '' then
  begin
    dao.Geral1
      ('SELECT a.ID, B.NOM_BANCO,A.NR_AGENCIA,A.NOM_CONTA FROM CONTA_CORRENTE a LEFT OUTER JOIN BANCO B ON (B.ID = A.ID_BANCO) WHERE A.ID = '
      + edContaCheque.Text);
    if dao.Q1.IsEmpty then
    begin
      showmessage('Conta Inexistente!');
      edContaCheque.Clear;
      edContaCheque.SetFocus;
    end
    else
      Lbnom_cc.Caption := dao.Q1.fieldbyname('NOM_BANCO').AsString + '-' +
        dao.Q1.fieldbyname('NOM_CONTA').AsString;
  end;
end;

procedure Tfrm_conta_descontada.edContaChequeButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_descontada_cheque';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';;

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_conta_descontada.dgContasPagarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  dgContasPagar.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure Tfrm_conta_descontada.dgContasPagarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    CheckTotal(0, false);
    if not mmContasPagar.IsEmpty then
      mmContasPagar.Delete;
  end;
end;

procedure Tfrm_conta_descontada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_conta_descontada.edValorChequeExit(Sender: TObject);
begin
  if RoundTo(edValorCheque.Value, -2) > RoundTo(Saldo, -2) then
  begin
    showmessage('Valor do Cheque não pode ser maior que o Saldo.');
    edValorCheque.SetFocus;
    exit;
  end;
end;

procedure Tfrm_conta_descontada.rgtipoPagtoClick(Sender: TObject);
begin
  rgtipoPagto.Width := 595;

  Tipo_Pagto := rgtipoPagto.ItemIndex;
  case Tipo_Pagto of
    0:
      Desc_Tipo_Pagto := 'Dinheiro';
    1:
      Desc_Tipo_Pagto := 'Cheque Próprio';
    2:
      Desc_Tipo_Pagto := 'Cheque de Terceiros';
    3:
      Desc_Tipo_Pagto := 'Permuta';
    4:
      Desc_Tipo_Pagto := 'Desconto (-)';
  end;

  if Tipo_Pagto = 4 then
  begin
    gbDescPerc.Visible := true;
    rgtipoPagto.Width := 538;
  end
  else
    gbDescPerc.Visible := false;

  edValorExit(Self);
  edValor.SetFocus;
end;

procedure Tfrm_conta_descontada.dgDepositoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    CheckTotal(1, false);
    if not mmDeposito.IsEmpty then
      mmDeposito.Delete;
  end;
end;

procedure Tfrm_conta_descontada.dgDepositoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  dgDeposito.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure Tfrm_conta_descontada.edValorExit(Sender: TObject);
var
  desc_item: double;
begin

  if RoundTo(edValor.Value, -2) > RoundTo(Saldo, -2) then
  begin
    showmessage('Valor não pode ser maior que o Saldo.');
    edValor.SetFocus;
    exit;
  end;

  desc_item := (edValor.Value / Total) * 100;
  lbPercDesc.Caption := FormatFloat('##0.00', desc_item);

end;

procedure Tfrm_conta_descontada.ckPgtoParcialClick(Sender: TObject);
begin
  if (mmContasPagar.IsEmpty) and (mmDeposito.IsEmpty) then
    exit
  else
    BtnOk.Enabled := ckPgtoParcial.Checked;
end;

end.
