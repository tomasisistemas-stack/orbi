unit Un_imp_codbarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, sPanel, sBitBtn,
  sLabel, sCheckBox, sEdit;

type
  TFr_eti_codbarras = class(TForm)
    Panel1: tsPanel;
    Label15: tsLabel;
    Label20: tsLabel;
    Label22: tsLabel;
    BitBtn1: TsBitBtn;
    Label1: tsLabel;
    EDQTD: TsEdit;
    Cbcor: TComboBox;
    Cbtamanho: TComboBox;
    Label2: tsLabel;
    Cbnumeracao: TComboBox;
    CbMercadoria: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure imp_etiqueta;
  end;

var
  Fr_eti_codbarras: TFr_eti_codbarras;

implementation

uses Un_dao, UnFun, UnPri;

{$R *.dfm}

{select mercadoria, ecfdesc from mercadoria m
left join gra}


procedure TFr_eti_codbarras.FormShow(Sender: TObject);
begin

//carrega combo das cores
  with dao.Q1S do
  begin
    close;
    sql.clear;
    sql.add('select descricao, mercadoria from mercadoria order by descricao');
    open;
  end;
  dao.Q1S.First;
  CbMercadoria.AddItem('', Self);
  while not (dao.Q1S.eof) do
  begin
    CbMercadoria.AddItem(dao.Q1S.fieldbyname('descricao').AsString + ' /' + FMFUN.enchevazio(dao.Q1S.fieldbyname('mercadoria').AsString, 14), Self);
    dao.Q1S.Next;
  end;


//carrega combo das cores
  with dao.Q1S do
  begin
    close;
    sql.clear;
    sql.add('select codigo, descricao from atribmerc1 order by descricao');
    open;
  end;
  dao.Q1S.First;
  Cbcor.AddItem('', Self);
  while not (dao.Q1S.eof) do
  begin
    Cbcor.AddItem(dao.Q1S.fieldbyname('descricao').AsString + ' /' + FMFUN.enchevazio(dao.Q1S.fieldbyname('codigo').AsString, 3), Self);
    dao.Q1S.Next;
  end;

  //carrega combo dos Tamanhos
  with dao.Q1S do
  begin
    close;
    sql.clear;
    sql.add('select codigo, descricao from atribmerc2 order by descricao');
    open;
  end;
  dao.Q1S.First;
  Cbtamanho.AddItem('', Self);
  while not (dao.Q1S.eof) do
  begin
    Cbtamanho.AddItem(dao.Q1S.fieldbyname('descricao').AsString + ' /' + FMFUN.enchevazio(dao.Q1S.fieldbyname('codigo').AsString, 3), Self);
    dao.Q1S.Next;
  end;

  //carrega combo dos Numeração
  with dao.Q1S do
  begin
    close;
    sql.clear;
    sql.add('select codigo, descricao from atribmerc3 order by descricao');
    open;
  end;
  dao.Q1S.First;
  Cbnumeracao.AddItem('', Self);
  while not (dao.Q1S.eof) do
  begin
    Cbnumeracao.AddItem(dao.Q1S.fieldbyname('descricao').AsString + ' /' + FMFUN.enchevazio(dao.Q1S.fieldbyname('codigo').AsString, 3), Self);
    dao.Q1S.Next;
  end;


end;




procedure TFr_eti_codbarras.BitBtn1Click(Sender: TObject);
var
  cmd: string;
begin

  cmd := 'select m.mercadoria,  m.ecfdesc, a1.descricao as cor, a2.descricao as tamanho, a3.descricao as numeracao from mercadoria m ' +
    'left join grade_templateit gi on gi.codigo=m.gradetempl ';

//    if Cbcor.ItemIndex > -1 then
  cmd := cmd + 'left join atribmerc1 a1 on a1.codigo=gi.atribmerc1 ';

//    if Cbtamanho.ItemIndex > -1 then
  cmd := cmd + 'left join atribmerc2 a2 on a2.codigo=gi.atribmerc2 ';

//    if Cbnumeracao.ItemIndex > -1 then
  cmd := cmd + 'left join atribmerc3 a3 on a3.codigo=gi.atribmerc3 ';

  cmd := cmd + 'where m.mercadoria =' + QuotedStr(copy(CbMercadoria.Text, (length(CbMercadoria.Text) - 13), 14));

  if Cbcor.ItemIndex > -1 then
    cmd := cmd + ' and gi.atribmerc1=' + QuotedStr(copy(Cbcor.Text, (length(Cbcor.Text) - 2), 3));

  if Cbtamanho.ItemIndex > -1 then
    cmd := cmd + ' and gi.atribmerc2=' + QuotedStr(copy(Cbtamanho.Text, (length(Cbtamanho.Text) - 2), 3));

  if Cbnumeracao.ItemIndex > -1 then
    cmd := cmd + ' and atribmerc3=' + QuotedStr(copy(Cbnumeracao.Text, (length(Cbnumeracao.Text) - 2), 3)); ;


  with dao.Q1S do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    open;
  end;

  if dao.Q1S.RecordCount > 0 then
    dao.msg(dao.Q1S.FieldByName('mercadoria').AsString + ' -  ' + dao.Q1S.FieldByName('descricao').AsString + #13 +
      '  cor= ' + dao.Q1S.FieldByName('cor').AsString + '  tamanho = ' + dao.Q1S.FieldByName('tamanho').AsString)
  else
    dao.msg('Não encontrou produto');

  imp_etiqueta;
end;

procedure TFr_eti_codbarras.imp_etiqueta;
var
  F: TextFile;
  cor, tamanho, QTD, cod_pro, descricao: string;
begin
  if MessageDlg('DESEJA IMPRIMIR A ETIQUETA?', mtConfirmation, [MBYES, MBNO], 0) = mryes then
  begin
    cor := dao.Q1S.fieldbyname('cor').AsString;
    tamanho := dao.Q1S.fieldbyname('tamanho').AsString;
    cod_pro := dao.Q1S.fieldbyname('mercadoria').AsString;
    descricao := dao.Q1S.fieldbyname('descricao').AsString;

    QTD := EDQTD.Text;
    AssignFile(F, 'LPT1');
    Rewrite(F);
    Writeln(F, ' ');
    Writeln(F, 'OD');
    Writeln(F, 'N');
//    Writeln(F,'O');
//    Writeln(F,'OC');
    Writeln(F, 'D7');
    Writeln(F, 'S2');
    Writeln(F, 'ZT');
    Writeln(F, 'Q400,B56+4');
    Writeln(F, 'q600');
    Writeln(F, 'A50,45,1,4,1,1,N,"-Beach Boutique-"');
    Writeln(F, 'A50,115,1,4,1,1,N,"' + 'COR: ' + cor + '"');
    Writeln(F, 'A50,160,1,4,1,1,N,"' + 'TAMANHO:' + tamanho + '"'); //95
    Writeln(F, 'A50,195,1,4,1,1,N,"' + cod_pro + '/' + descricao + '"');
//    Writeln(F,'C');

{    //ETIQUETA DO LADO
    Writeln(F,'A425,45,0,4,1,1,N,"LOJA INSTALADORA"');
    Writeln(F,'A390,115,0,4,1,1,N,"'+CODPRO+'"');
    Writeln(F,'A390,160,0,4,1,1,N,"'+mnom1+'"');
    Writeln(F,'A390,195,0,4,1,1,N,"'+mnom2+'"');
 }
    {    else
    begin
      Writeln(F,'A75,45,0,3,1,1,N,"LOJA INSTALADORA"');
      Writeln(F,'A55,115,0,3,1,1,N,"'+CODPRO+'"');
      Writeln(F,'A55,160,0,3,1,1,N,"'+MNOM1+'"');//95
      Writeln(F,'A55,195,0,3,1,1,N,"'+MNOM2+'"');

      //ETIQUETA DO LADO
      Writeln(F,'A425,45,0,3,1,1,N,"LOJA INSTALADORA"');
      Writeln(F,'A390,115,0,3,1,1,N,"'+CODPRO+'"');
      Writeln(F,'A390,160,0,3,1,1,N,"'+mnom1+'"');
      Writeln(F,'A390,195,0,3,1,1,N,"'+mnom2+'"');
    end;}

    Writeln(F, '' + 'P' + QTD + '');
    Writeln(F, ' ');
    Sleep(4000);
    CloseFile(F);
  end;


end;

procedure TFr_eti_codbarras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
