unit Un_sel_plano_contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid;

type
  TFr_sel_plano_contas = class(TForm)
    Sg: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SgClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure SgSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SgKeyPress(Sender: TObject; var Key: Char);
    procedure SgDblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
  public
    lin: integer;
    procedure monta_sg;
    procedure mostra_campos;
  end;

var
  Fr_sel_plano_contas: TFr_sel_plano_contas;

implementation

uses Un_dados_cliente, Un_dao, UnPri, Un_contas_pagar;

{$R *.dfm}

{ TFr_sel_plano_contas }

procedure TFr_sel_plano_contas.monta_sg;
var
  linmax: integer;
begin
  Sg.Clear;
  sg.RowCount := 2;
  linmax := 1;
  Sg.Cells[0, 0] := 'id';
  Sg.Cells[1, 0] := 'Identificador';
  Sg.Cells[2, 0] := 'Descrição';
  Sg.Cells[3, 0] := 'Operação';
  Sg.ColWidths[0] := 0;
  if chamou_form = 'CP1' then
    dao.Geral1('SELECT PC4.ID, PC4.NR_CONTA, PC1.DESCRICAO||'' -> ''||PC2.DESCRICAO||'' -> ''||PC3.DESCRICAO||'' -> ''||PC4.DESCRICAO ' +
      ' FROM PLANO_CONTAS PC4 INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      ' INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) WHERE PC4.NIVEL = 4 AND (PC3.ID IN (''40'') OR PC1.ID IN(''58''))')
  else
    dao.Geral1('select * from plano_contas order by nr_conta');

  dao.Q1.First;
  while not (dao.Q1.Eof) do
  begin
    if linMax >= 2 then
    begin
      Sg.AddRow;
    end;

    Sg.EditorMode := true;
//    Sg.fonongetselectColors Cells[0,linMax]:= dao.Q1.fieldbyname('id').AsString;
//    if dao.Q1.FieldByName('operacao').AsString = '' then
//      Sg.RowSelect[1].colo SelectionColor[linMax].cColor:= clBlue;
    Sg.Cells[0, linMax] := dao.Q1.fieldbyname('id').AsString;
    Sg.Cells[1, linMax] := dao.Q1.fieldbyname('nr_conta').AsString;
    Sg.Cells[2, linMax] := dao.Q1.fieldbyname('descricao').AsString;
    Sg.Cells[3, linMax] := dao.Q1.fieldbyname('operacao').AsString;
    linmax := linmax + 1;
    dao.Q1.Next;
  end;

end;

procedure TFr_sel_plano_contas.FormShow(Sender: TObject);
begin
  monta_sg;
end;

procedure TFr_sel_plano_contas.SgClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  lin := ARow;

end;

procedure TFr_sel_plano_contas.SgSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  lin := ARow;
end;

procedure TFr_sel_plano_contas.SgKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    mostra_campos;
  end;
end;

procedure TFr_sel_plano_contas.mostra_campos;
begin
  if chamou_form = 'cp1' then
  begin
    Fr_contas_pagar.Prid_plano_contas.Text := sg.Cells[1, lin];
    Fr_contas_pagar.Lbnom_plano_contas_N1.Caption := sg.Cells[2, lin];
    Fr_contas_pagar.Lbnom_plano_contas_N2.Caption := sg.Cells[3, lin];
    Fr_contas_pagar.Lbnom_plano_contas_N3.Caption := sg.Cells[4, lin];
    Fr_contas_pagar.Lbnom_plano_contas_N4.Caption := sg.Cells[5, lin];
  end;

end;

procedure TFr_sel_plano_contas.SgDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  mostra_campos;
end;

end.
