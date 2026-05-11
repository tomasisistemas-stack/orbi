unit un_grade_comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask,
  DB, RxMemDS, DBCtrls, sSpeedButton, sPanel, sBitBtn, sGroupBox,
  acDBGrid;

type
  Tfrm_grade_comissao = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgGradeComissoes: Tdbgrid;
    Panel4: tsPanel;
    GbFtTipo: TsGroupBox;
    cbftTipo: TComboBox;
    btok: TsBitBtn;
    GbTipo: TsGroupBox;
    cbTipo: TDBComboBox;
    gbMargemIni: TsGroupBox;
    edMargIni: TDBEdit;
    gbMargemFim: TsGroupBox;
    edMargFim: TDBEdit;
    gbComissaoInterno: TsGroupBox;
    edComissaoInterno: TDBEdit;
    gbComOut: TsGroupBox;
    edComissaoOutros: TDBEdit;
    sbInserir: TsSpeedButton;
    mmGradeComissao: TRxMemoryData;
    mmGradeComissaocheck: TBooleanField;
    dsGradeComissao: TDataSource;
    mmGradeComissaoTipo: TStringField;
    mmGradeComissaoInicio: TFloatField;
    mmGradeComissaoFim: TFloatField;
    mmGradeComissaoComissaoInterno: TFloatField;
    mmGradeComissaoComissaoOutros: TFloatField;
    BtConferir: TsSpeedButton;
    sbAlterar: TsSpeedButton;
    sbSalvar: TsSpeedButton;
    procedure sbInserirClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure CarregaGrid;
    procedure BtConferirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dgGradeComissoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_grade_comissao: Tfrm_grade_comissao;

implementation

uses un_dao;

{$R *.dfm}

procedure Tfrm_grade_comissao.sbInserirClick(Sender: TObject);
begin
  mmGradeComissao.Append;
  sbSalvar.Enabled := true;
  sbInserir.Enabled := false;
  sbAlterar.Enabled := false;
end;

procedure Tfrm_grade_comissao.btokClick(Sender: TObject);
var
  sql, where: string;
begin
  sql := 'SELECT a.ID, a.TIPO, a.INICIO, a.FIM, a.COMISSAO_INTERNO, a.COMISSAO_OUTROS FROM GRADE_COMISSAO a WHERE a.tipo = ' + quotedstr(cbftTipo.text);

  dao.Geral1(sql + where + ' order by A.INICIO ');

  CarregaGrid;
end;

procedure Tfrm_grade_comissao.CarregaGrid;
begin
  dao.Q1.first;
  mmGradeComissao.Close;
  mmGradeComissao.EmptyTable;
  mmGradeComissao.Open;
  while not dao.Q1.eof do
  begin
    mmGradeComissao.Append;
    mmGradeComissaoTipo.AsString := dao.Q1.fieldbyname('TIPO').AsString;
    mmGradeComissaoInicio.Value := dao.Q1.fieldbyname('INICIO').Value;
    mmGradeComissaoFim.Value := dao.Q1.fieldbyname('FIM').Value;
    mmGradeComissaoComissaoInterno.Value := dao.Q1.fieldbyname('COMISSAO_INTERNO').Value;
    mmGradeComissaoComissaoOutros.Value := dao.Q1.fieldbyname('COMISSAO_OUTROS').Value;
    mmGradeComissao.Post;
    dao.Q1.next;
  end;
  mmGradeComissao.First;
end;

procedure Tfrm_grade_comissao.BtConferirClick(Sender: TObject);
begin
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM GRADE_COMISSAO a WHERE a.tipo = ' + quotedstr(mmGradeComissaoTipo.AsString));
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
    exit;
  end;

  mmGradeComissao.First;
  while not mmGradeComissao.eof do
  begin
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Exec_sql.SQL.Clear;
      dao.Exec_sql.SQL.Add('INSERT INTO GRADE_COMISSAO (TIPO, INICIO, FIM, COMISSAO_INTERNO, COMISSAO_OUTROS) ' +
        ' VALUES (' + quotedstr(mmGradeComissaoTipo.AsString) + ', ' + StringReplace(formatfloat('#0.00', mmGradeComissaoInicio.Value), ',', '.', [rfReplaceAll]) + ', ' + StringReplace(formatfloat('#0.00', mmGradeComissaoFim.Value), ',', '.', [rfReplaceAll]) + ', ' + StringReplace(formatfloat('#0.00', mmGradeComissaoComissaoInterno.Value), ',', '.', [rfReplaceAll]) + ', ' + StringReplace(formatfloat('#0.00', mmGradeComissaoComissaoOutros.Value), ',', '.', [rfReplaceAll]) + ')');
      dao.Exec_sql.ExecSQL;
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;
    mmGradeComissao.Next;
  end;
  mmGradeComissao.First;
end;

procedure Tfrm_grade_comissao.FormShow(Sender: TObject);
begin
  mmGradeComissao.Open;
end;

procedure Tfrm_grade_comissao.sbSalvarClick(Sender: TObject);
begin
  mmGradeComissao.Post;
  sbInserir.Enabled := true;
  sbAlterar.Enabled := true;
  sbSalvar.Enabled := false;
end;

procedure Tfrm_grade_comissao.sbAlterarClick(Sender: TObject);
begin
  mmGradeComissao.Edit;
  sbSalvar.Enabled := true;
  sbInserir.Enabled := false;
  sbAlterar.Enabled := false;
end;

procedure Tfrm_grade_comissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_grade_comissao.dgGradeComissoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_delete then
  begin
    mmGradeComissao.Delete;
  end;
end;

end.

