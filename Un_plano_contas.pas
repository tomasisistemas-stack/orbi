unit Un_plano_contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids,  ExtCtrls,
  StdCtrls, Buttons, sPanel, sBitBtn, sGroupBox, sEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvExComCtrls, JvDBTreeView;

type
  Tfr_plano_contas = class(TForm)
    Q_Plano_Contas: TFDQuery;
    IB_DataSource1: TDataSource;
    Panel1: tsPanel;
    GroupBox1: TsGroupBox;
    edDesc: TsEdit;
    BtLocalizar: TsBitBtn;
    RadioGroup1: TRadioGroup;
    Q_Plano_ContasDESCRICAO: TStringField;
    Q_Plano_ContasID: TIntegerField;
    Q_Plano_ContasOPERACAO: TStringField;
    Q_Plano_ContasID_PAI: TIntegerField;
    Q_Plano_ContasNIVEL: TSmallintField;
    Q_Plano_ContasNR_CONTA: TStringField;
    Q_Plano_ContasNOVA_NR_CONTA: TStringField;
    procedure FormShow(Sender: TObject);
    function IB_TreeView1NewData(Amaster: Integer; Aauto: Boolean;
      var Aid: Integer): Boolean;
    procedure busca_plano_conta(id: string; nova_conta : boolean);
    function busca_prox_nr_conta(nr_conta: string): string;
    function IB_TreeView1ChangeData(Amaster, Aid: Integer;
      var Aname: string): Boolean;
    procedure IB_TreeView1DeleteData(id: Integer);
    function TemFilhos(id: string): Boolean;
    procedure CarregaDados;
    procedure BtLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fr_plano_contas: Tfr_plano_contas;
  idpai: string;
  nivel: string;
  n_conta: string;
  operacao: string;
  descricao: string;

implementation

uses Un_dao, Un_plano_conta_cad, StrUtils, unpri;

{$R *.dfm}

procedure Tfr_plano_contas.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

function Tfr_plano_contas.IB_TreeView1NewData(Amaster: Integer;
  Aauto: Boolean; var Aid: Integer): Boolean;

begin
  try
    Application.CreateForm(Tfr_plano_conta_cad, fr_plano_conta_cad);
    fr_plano_conta_cad.modo_insert := true;

    fr_plano_conta_cad.Prid.Enabled := false;

    fr_plano_conta_cad.Prid_pai.Enabled := false;
    fr_plano_conta_cad.Prnr_conta.Enabled := false;
    fr_plano_conta_cad.PrNivel.Enabled := false;
    fr_plano_conta_cad.prOperacao.Enabled := false;
    busca_plano_conta(inttostr(Q_Plano_Contas.Fieldbyname('id').asinteger), true);
    fr_plano_conta_cad.Prid_pai.Text := idpai;
    if operacao = 'D' then
      fr_plano_conta_cad.prOperacao.ItemIndex := 0
    else
      fr_plano_conta_cad.prOperacao.ItemIndex := 1;
    fr_plano_conta_cad.PrNivel.Text := nivel;
    fr_plano_conta_cad.Prnr_conta.Text := busca_prox_nr_conta(n_conta);
    fr_plano_conta_cad.btgra.Enabled := true;
    fr_plano_conta_cad.btcan.Enabled := true;
    fr_plano_conta_cad.ShowModal;
    if fr_plano_conta_cad.ModalResult = mrOk then
    begin
      Q_Plano_Contas.Close;
      Q_Plano_Contas.Open;
     // IB_TreeView1.LoadData;
    end;
  finally
    fr_plano_conta_cad.Free;
  end;
end;

function Tfr_plano_contas.busca_prox_nr_conta(nr_conta: string): string;
var
  nr1, nr2: string;
  nr: integer;
begin
  if nivel = '1' then
    Result := inttostr(strtoint(nr_conta) + 1)
  else
  begin

    nr2 := ReverseString(copy(ReverseString(nr_conta), 1, pos('.', ReverseString(nr_conta)) - 1));
    nr1 := ReverseString(copy(ReverseString(nr_conta), pos('.', ReverseString(nr_conta)), 10));
    nr := strtoint(nr2) + 1;

    if nivel = '4' then
      Result := nr1 + FormatFloat('00', nr)
    else
      Result := nr1 + FormatFloat('0', nr);
  end;
end;

procedure Tfr_plano_contas.busca_plano_conta(id: string; nova_conta : boolean);
begin
  dao.Geral1('select p1.descricao, p1.id, p1.operacao, p1.id_pai, p1.nivel, p1.nr_conta, (select max(p2.NR_CONTA) as nr_conta from plano_contas p2 where p2.ID_PAI = p1.ID_PAI) as nova_nr_conta from plano_contas p1 where p1.id = ' + QuotedStr(id));
  operacao := dao.Q1.fieldbyname('operacao').AsString;
  nivel := dao.Q1.fieldbyname('nivel').AsString;
  if nova_conta then
    n_conta := dao.Q1.fieldbyname('nova_nr_conta').AsString
  else
    n_conta := dao.Q1.fieldbyname('nr_conta').AsString;
  idpai := dao.Q1.fieldbyname('id_pai').AsString;
  descricao := dao.Q1.fieldbyname('descricao').AsString;
end;

function Tfr_plano_contas.IB_TreeView1ChangeData(Amaster, Aid: Integer;
  var Aname: string): Boolean;
begin
  try
    Application.CreateForm(Tfr_plano_conta_cad, fr_plano_conta_cad);
    fr_plano_conta_cad.modo_insert := false;

    fr_plano_conta_cad.Prid.Enabled := false;

    fr_plano_conta_cad.Prid_pai.Enabled := false;
    fr_plano_conta_cad.Prnr_conta.Enabled := false;
    fr_plano_conta_cad.PrNivel.Enabled := false;
    fr_plano_conta_cad.prOperacao.Enabled := false;

    busca_plano_conta(inttostr(dao.Q1.fieldbyname('ID').AsInteger), false);

    fr_plano_conta_cad.Prid_pai.Text := idpai;

    if operacao = 'D' then
      fr_plano_conta_cad.prOperacao.ItemIndex := 0
    else
      fr_plano_conta_cad.prOperacao.ItemIndex := 1;

    fr_plano_conta_cad.PrNivel.Text := nivel;
    fr_plano_conta_cad.Prnr_conta.Text := n_conta;
    fr_plano_conta_cad.PrDescricao.Text := descricao;
    fr_plano_conta_cad.Prid.Text := inttostr(dao.Q1.fieldbyname('ID').AsInteger);

    fr_plano_conta_cad.btgra.Enabled := true;
    fr_plano_conta_cad.btcan.Enabled := true;

    fr_plano_conta_cad.ShowModal;

    if fr_plano_conta_cad.ModalResult = mrOk then
    begin
      Q_Plano_Contas.Close;
      Q_Plano_Contas.Open;
      //IB_TreeView1.LoadData;
    end;
  finally
    fr_plano_conta_cad.Free;
  end;
end;

procedure Tfr_plano_contas.IB_TreeView1DeleteData(id: Integer);
begin
  try
    if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      if not TemFilhos(inttostr(dao.Q1.fieldbyname('ID').AsInteger)) then
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;
          dao.delete('id', inttostr(dao.Q1.fieldbyname('ID').AsInteger), 'plano_contas');
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;
        CarregaDados;
      end
      else
        showmessage('Plano de Conta não pode ser Excluído, pois o mesmo tem Planos de Conta Dependentes!');
    end;
  except
    raise Exception.Create('Erro ao Excluir o Registro!');
  end;
end;

function Tfr_plano_contas.TemFilhos(id: string): Boolean;
begin
  dao.Geral1('select (select count(*) from plano_contas p2 where p2.ID_PAI = p1.id) as filhos from PLANO_CONTAS p1 where p1.ID = ' + id);
  if dao.Q1.FieldByName('filhos').AsInteger > 0 then
    Result := true
  else
    Result := false;
end;

procedure Tfr_plano_contas.CarregaDados;
var
  sql_consulta: string;
begin
  Q_Plano_Contas.Close;
  sql_consulta := ' select ' +
    '   P1.id, ' +
    '   P1.id_pai, ' +
    '   P1.descricao, ' +
    '   P1.nr_conta, ' +
    '   trim(P1.nr_conta)||''-''||P1.descricao as conta ' +
    ' from ' +
    '   PLANO_CONTAS P4 ' +
    ' INNER JOIN PLANO_CONTAS P3 ON (P3.ID = P4.ID_PAI) ' +
    ' INNER JOIN PLANO_CONTAS P2 ON (P2.ID = P3.ID_PAI) ' +
    ' INNER JOIN PLANO_CONTAS P1 ON (P1.ID = P2.ID_PAI) ';

  if trim(edDesc.Text) <> '' then
    sql_consulta := sql_consulta +
      ' WHERE ' +
      '   P4.descricao like :desc';

  sql_consulta := sql_consulta +
    ' UNION ' +
    ' select ' +
    '   P2.id, ' +
    '   P2.id_pai, ' +
    '   P2.descricao, ' +
    '   P2.nr_conta, ' +
    '   trim(P2.nr_conta)||''-''||P2.descricao as conta ' +
    ' from ' +
    '   PLANO_CONTAS P4 ' +
    ' INNER JOIN PLANO_CONTAS P3 ON (P3.ID = P4.ID_PAI) ' +
    ' INNER JOIN PLANO_CONTAS P2 ON (P2.ID = P3.ID_PAI) ';

  if trim(edDesc.Text) <> '' then
    sql_consulta := sql_consulta +
      ' WHERE ' +
      '   P4.descricao like :desc';

  sql_consulta := sql_consulta +
    ' UNION ' +
    ' select ' +
    '   P3.id, ' +
    '   P3.id_pai, ' +
    '   P3.descricao, ' +
    '   P3.nr_conta, ' +
    '   trim(P3.nr_conta)||''-''||P3.descricao as conta ' +
    ' from ' +
    '   PLANO_CONTAS P4 ' +
    ' INNER JOIN PLANO_CONTAS P3 ON (P3.ID = P4.ID_PAI) ';

  if trim(edDesc.Text) <> '' then
    sql_consulta := sql_consulta +
      ' WHERE ' +
      '   P4.descricao like :desc';

  sql_consulta := sql_consulta +
    ' UNION ' +
    ' select ' +
    '   P4.id, ' +
    '   P4.id_pai, ' +
    '   P4.descricao, ' +
    '   P4.nr_conta, ' +
    '   trim(P4.nr_conta)||''-''||P4.descricao as conta ' +
    ' from ' +
    '   PLANO_CONTAS P4 ';

  if trim(edDesc.Text) <> '' then
    sql_consulta := sql_consulta +
      ' WHERE ' +
      '   P4.descricao like :desc';

  Q_Plano_Contas.SQL.Clear;
  Q_Plano_Contas.SQL.Add(sql_consulta);
  if trim(edDesc.Text) <> '' then
    Q_Plano_Contas.ParamByName('desc').AsString := '%' + edDesc.Text + '%';

  //    Q_Plano_Contas.SQL.Add(' WHERE descricao like ''%' + edDesc.Text + '%''');
//  Q_Plano_Contas.SQL.Add(' ORDER BY nr_conta');
  Q_Plano_Contas.Open;
  //IB_TreeView1.LoadData;
  {if RadioGroup1.ItemIndex = 0 then
    IB_TreeView1.FullExpand
  else
    IB_TreeView1.FullCollapse;  }
end;

procedure Tfr_plano_contas.BtLocalizarClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfr_plano_contas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


end.
