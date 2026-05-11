unit Un_relatorio_cliente_vendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint,  StdCtrls, Buttons, CheckLst, Grids,
   sBitBtn, sLabel, sCheckBox,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TFr_relatorio_cliente_vendedor = class(TForm)
    Label1: tsLabel;
    LKCODUF: TDBLookupComboBox;
    LKLBCODUF: TDBLookupComboBox;
    Button1: TButton;
    LBCID: TCheckListBox;
    BTIMP: TButton;
    BTTOD: TsBitBtn;
    rb_tod_rep: TRadioButton;
    CBRELSIM: tscheckbox;
    QUUF: TFDQuery;
    DSCODUF: TDataSource;
    QUGERREL: TFDQuery;
    DSQUGERREL: TDataSource;
    QUCLI: TFDQuery;
    DSQUCLI: TDataSource;
    RDCLICID: TRDprint;
    QUREP: TFDQuery;
    DSREP: TDataSource;
    lkcodrep: TComboBox;
    procedure BTIMPClick(Sender: TObject);
    procedure BTTODClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure lkcodrepEnter(Sender: TObject);
    procedure rb_tod_repClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_relatorio_cliente_vendedor: TFr_relatorio_cliente_vendedor;

implementation

uses Un_dao;

{$R *.dfm}

procedure TFr_relatorio_cliente_vendedor.BTIMPClick(Sender: TObject);
var
  i, lh: integer;
  MNOMCID, cmd: string;
  orient: TPrinterOrientation;

begin
  cmd := 'select a.COD_CLIENTE, a.DTA_CAD, a.PRI_COMPRA, a.NOM_CLIENTE, a.NOM_FANTASIA, a.ENDERECO, ' +
    'a.COMPLEMENTO, a.PROXIMO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, a.TELEFONE, a.EMAIL, ' +
    'a.AVISO, a.CNPJ, a.IE, a.IM, a.PROD_RURAL, a.CONTATO, a.FONE_CONTATO, a.LIMITE, a.CPF, a.RG, ' +
    'a.NATURALIDADE, a.EST_CIVIL, a.PAI, a.MAE, a.TIP_RESIDENCIA, a.ALUGUEL, a.EMPRESA, ' +
    'a.END_TRACLI, a.BAIRRO_TRABALHO, a.CID_TRABALHO, a.FONE_TRABALHO, a.CARGO, a.SALARIO, ' +
    'a.NOM_CONJUGUE, a.EMP_CONJ, a.END_EMP_CONJ, a.CID_EMP_CONJ, a.FONE_EMP_CONJ, a.CARGO_CONJ, ' +
    'a.NOM_REF1, a.FONE_REF1, a.OBS_REF1, a.NOM_REF2, a.FONE_REF2, a.OBS_REF2, a.CAD_SPC, ' +
    'a.DTA_CAD_SPC, a.DTA_ANIVERSARIO, a.OBSERVACOES, a.FAX, a.MANEQUIM, a.CALCADO, ' +
    'a.COR_PREFERIDA, a.CONTATO_PREFERIDO, a.ESTILO, a.CONTATO_FONE, a.CONTATO_EMAIL, ' +
    'a.CONTATO_CORRESPONDENCIA, a.ID_ANTIGO, a.PONTO_FIDELIDADE, a.ID_REPRESENTANTE, a.ID_FOP, a.PRAZO_MAXIMO, a.DESCONTO_MAXIMO, ' +
    'a.CLIENTE_BLOQUEADO, a.STATUS, a.COD_EMPRESA, a.NR_ENDERECO, a.NFE_EMAIL, a.SINCRONIZAR_PALM, a.PRE_CADASTRO, cid.nom_cidade from cliente a ' +
    'left join cidades cid on cid.cod_cidade=a.cod_cidade ';
  if not rb_tod_rep.Checked then
    cmd := cmd + 'where id_representante = ' + QuotedStr(QUREP.fieldbyname('id').AsString);
  cmd := cmd + ' order by cid.nom_cidade';

  with qucli do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if CBRELSIM.Checked = false then
  begin

    QUCLI.First;
    RDCLICID.Abrir;
    lh := 2;
    if rb_tod_rep.Checked then
      RDCLICID.ImpC(lh, 10, '***RELATORIO COMPLETO DE CLIENTES*** PLASFAN IND E COM DE PLASTICOS', [negrito])
    else
      RDCLICID.ImpC(lh, 10, '***RELATORIO COMPLETO DE CLIENTES*** DO REPRESENTANTE: ' + lkcodrep.Text + ' PLASFAN IND E COM DE PLASTICOS', [negrito]);

    for i := 0 to (LBCID.Items.count - 1) do
    begin
      if LBCID.Checked[i] = true then
      begin
       // showmessage(LBCID.Items.ValueFromIndex[i]);
        MNOMCID := LBCID.Items.ValueFromIndex[i];
        if QUCLI.Locate('nom_cidade', MNOMCID, []) then
        begin
          lh := lh + 1;
          RDCLICID.ImpF(lh, 40, 'CIDADE...:' + QUCLI.fieldbyname('nom_cidade').value, [comp12]);
          lh := lh + 2;

          while not (QUCLI.Eof) and (QUCLI.FieldByName('nom_cidade').Value = MNOMCID) do
          begin
            if lh > 61 then
            begin
              RDCLICID.Novapagina;
              lh := 2;
            end;
            if QUCLI.FieldByName('nom_cliente').Value <> null then
              RDCLICID.ImpF(lh, 01, 'NOME.....:' + QUCLI.fieldbyname('nom_cliente').Value, [comp17, negrito]);
            LH := LH + 1;

            if QUCLI.FieldByName('endereco').Value <> null then
              RDCLICID.ImpF(lh, 01, 'ENDERECO.:' + QUCLI.fieldbyname('endereco').Value, [comp17]);

            if QUCLI.FieldByName('bairro').Value <> null then
              RDCLICID.ImpF(lh, 72, 'BAIRRO:' + QUCLI.fieldbyname('bairro').Value, [comp17]);

            if QUCLI.FieldByName('cep').Value <> null then
              RDCLICID.ImpF(lh, 100, 'CEP......:' + QUCLI.fieldbyname('cep').Value, [comp17]);
            LH := LH + 1;

            if QUCLI.FieldByName('cnpj').Value <> null then
              RDCLICID.ImpF(lh, 01, 'CNPJ......:' + QUCLI.fieldbyname('cnpj').Value, [comp17]);

            if QUCLI.FieldByName('ie').Value <> null then
              RDCLICID.ImpF(lh, 32, 'IE:' + QUCLI.fieldbyname('ie').Value, [comp17]);

            if QUCLI.FieldByName('contato').Value <> null then
              RDCLICID.ImpF(lh, 53, 'CONTATO:' + QUCLI.fieldbyname('contato').Value, [comp17]);

            if QUCLI.FieldByName('telefone').Value <> null then
              RDCLICID.ImpF(lh, 79, 'FONE:' + QUCLI.fieldbyname('telefone').Value, [comp17]);

            RDCLICID.ImpF(lh, 100, 'E-MAIL:' + QUCLI.fieldbyname('email').AsString, [comp17]);

            lh := lh + 2;

            QUCLI.Next;
          end;

        end;
      end;
    end;
    RDCLICID.Fechar;
  end; //end do primeiro if

  if CBRELSIM.Checked = true then
  begin
    QUCLI.First;



    RDCLICID.Abrir;
    lh := 2;

    if rb_tod_rep.Checked then
      RDCLICID.ImpC(lh, 10, '***RELATORIO COMPLETO DE CLIENTES*** PLASFAN IND E COM DE PLASTICOS', [negrito])
    else
      RDCLICID.ImpC(lh, 10, '***RELATORIO COMPLETO DE CLIENTES*** DO REPRESENTANTE: ' + lkcodrep.Text + ' PLASFAN IND E COM DE PLASTICOS', [negrito]);

    for i := 0 to (LBCID.Items.count - 1) do
    begin
      if LBCID.Checked[i] = true then
      begin
       // showmessage(LBCID.Items.ValueFromIndex[i]);

        MNOMCID := LBCID.Items.ValueFromIndex[i];
        if QUCLI.Locate('nom_cidade', MNOMCID, []) then
        begin
          lh := lh + 1;
          RDCLICID.ImpF(lh, 40, 'CIDADE...:' + QUCLI.fieldbyname('nom_cidade').value, [comp12]);
          lh := lh + 1;
          RDCLICID.ImpF(LH, 02, '          CODIGO/ CLIENTE                                          FONE                CNPJ    ', [comp17, negrito]);
          lh := lh + 2;

          while not (QUCLI.Eof) and (QUCLI.FieldByName('nom_cidade').Value = MNOMCID) do
          begin
            if lh > 61 then
            begin
              RDCLICID.Novapagina;
              lh := 2;
            end;
            RDCLICID.ImpF(lh, 01, QUCLI.fieldbyname('cod_cliente').AsString + '/' + QUCLI.fieldbyname('nom_cliente').AsString, [comp17]);
            RDCLICID.ImpF(lh, 65, QUCLI.fieldbyname('telefone').AsString, [comp17]);
            RDCLICID.ImpF(lh, 85, QUCLI.fieldbyname('cnpj').AsString, [comp17]);
            lh := lh + 1;

            QUCLI.Next;
          end;

        end;
      end;
    end;
    RDCLICID.Fechar;
  end;
end;

procedure TFr_relatorio_cliente_vendedor.BTTODClick(Sender: TObject);
var
  I: integer;
begin
  if BTTOD.Caption = 'MARCAR TODOS' then
  begin
    for I := 0 to (LBCID.Items.Count - 1) do LBCID.checked[I] := true;
    BTTOD.Caption := 'DESMARCAR TODOS'
  end
  else
  begin
    for I := 0 to (LBCID.Items.Count - 1) do LBCID.checked[I] := false;
    BTTOD.Caption := 'MARCAR TODOS'
  end;

end;

procedure TFr_relatorio_cliente_vendedor.Button1Click(Sender: TObject);
begin
  with QUGERREL do
  begin
    close;
    sql.Clear;
    sql.add('select uf,nom_cidade from cidades');
    if not rb_tod_rep.Checked then
      sql.Add('where uf=:muf')
    else
      sql.Add('where uf=:muf');

    sql.Add('order by nom_cidade');
    ParamByName('muf').AsString := QUUF.fieldbyname('uf').AsString;
  end;
  LBCID.Items.Clear;
  QUGERREL.First;
  while not (QUGERREL.Eof) do
  begin
    LBCID.Items.Add(' ' + QUGERREL.fieldbyname('nom_cidade').Value);
    QUGERREL.Next;
  end;
end;

procedure TFr_relatorio_cliente_vendedor.lkcodrepEnter(Sender: TObject);
begin
  rb_tod_rep.Checked := false;
end;

procedure TFr_relatorio_cliente_vendedor.rb_tod_repClick(Sender: TObject);
begin
  lkcodrep.Text := '';

end;

procedure TFr_relatorio_cliente_vendedor.FormShow(Sender: TObject);
begin
  QUUF.Open;
  QUREP.Open;
  rb_tod_rep.checked := true;

end;

end.
