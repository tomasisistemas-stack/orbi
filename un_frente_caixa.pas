unit un_frente_caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls;

type
  TFrenteCaixa = class(TThread)
  private
    procedure Geral1_Frente(cmd: string);
    procedure Geral2_Frente(cmd: string);
    procedure Geral3_Frente(cmd: string);
    procedure Execsql1_Frente(cmd: string);
    procedure Execsql2_Frente(cmd: string);
    procedure conf_CN_Frete;
  public
    constructor Create();
    destructor Free();
    procedure cliente(codigo: string);
    procedure produto(numero: string);
    procedure pedido(numero: string);
    procedure Itens(numero: string);
  end;

implementation

uses Un_dao;

constructor TFrenteCaixa.Create();
begin
  inherited Create(True);
  conf_CN_Frete;
  FreeOnTerminate := false; // Libera o objeto após terminar.
  Priority := tpNormal;
  Resume; // Inicia o Thread.
end;

destructor TFrenteCaixa.Free();
begin
  dao.CN_Frente.connected := false;
  //  inherited Free();
end;

procedure TFrenteCaixa.Geral1_Frente(cmd: string);
begin
  try
    with dao.q1_Frente do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o Procedimento!' + #13 + e.message);
      {dao.envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TFrenteCaixa.Geral2_Frente(cmd: string);
begin
  try
    with dao.q2_Frente do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o Procedimento!' + #13 +
        e.message);
{      dao.envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TFrenteCaixa.Geral3_Frente(cmd: string);
begin
  try
    with dao.q3_Frente do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o Procedimento!' + #13 +
        e.message);
{      dao.envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TFrenteCaixa.Execsql1_Frente(cmd: string);
begin
  try
    with dao.exec_sql_Frente do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    //    grava_log(cmd, '');

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o ExecSql!' + #13 +
        e.message);

{      dao.envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br', '',
        '', '');}

    end;
  end;

end;

procedure TFrenteCaixa.Execsql2_Frente(cmd: string);
begin
  try
    with dao.exec_sql_Frente2 do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    //    grava_log(cmd, '');

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o ExecSql!' + #13 +
        e.message);

{      dao.envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br', '',
        '', '');
 }
    end;
  end;

end;

procedure TFrenteCaixa.conf_CN_Frete;
begin
  dao.Geral1('SELECT a.FRENTE_CAIXA_SERVIDOR_BD, a.FRENTE_CAIXA_BD FROM CONFIGURACAO a');
  dao.CN_Frente.Params.add('Server='+dao.Q1.fieldbyname('FRENTE_CAIXA_SERVIDOR_BD').AsString);
  dao.CN_Frente.Params.add('Database='+dao.Q1.fieldbyname('FRENTE_CAIXA_BD').AsString);
  if not dao.CN_Frente.Connected then
    dao.CN_Frente.Connected := true;
end;

procedure TFrenteCaixa.cliente(codigo: string);
var
  sql_insert, sql_update: string;
begin
 { //if not dao.cn_frente.InTransaction then
    dao.cn_frente.StartTransaction;
  }
  Geral1_Frente('SELECT a.CODIGO, a.NOME FROM CLIENTE a WHERE a.CODIGO = ' +
    codigo);

  dao.Geral1('SELECT CLIENTE.COD_CLIENTE, CLIENTE.NOM_CLIENTE, CLIENTE.NOM_FANTASIA, COALESCE (CLIENTE.DTA_CAD, CURRENT_DATE) AS DTA_CAD, CLIENTE.CONTATO, CLIENTE.CNPJ, ' +
    'CLIENTE.IE, CLIENTE.IM, CLIENTE.ENDERECO, CLIENTE.NR_ENDERECO, CLIENTE.COMPLEMENTO, CLIENTE.BAIRRO, ' +
    'CIDADES.NOM_CIDADE, CIDADES.UF, CLIENTE.CEP FROM CLIENTE inner join CIDADES on cliente.COD_CIDADE = CIDADES.COD_CIDADE ' +
    'WHERE CLIENTE.COD_CLIENTE = ' + codigo);

  if dao.q1_frente.IsEmpty then
  begin
    sql_insert :=
      'INSERT INTO CLIENTE (CODIGO, NOME, FANTASIA, SITUACAO, CADASTRO, CONTATO, CNPJ_CNPF, IE_RG, IM, ENDERECO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, UF, CEP) VALUES ( ';
    sql_insert := sql_insert +
      dao.q1.fieldbyname('COD_CLIENTE').AsString + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('NOM_CLIENTE').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('NOM_FANTASIA').AsString) + ',' +
      '''Ativo'',' +
      QUOTEDSTR(formatdatetime('dd.mm.yyyy',
        dao.q1.fieldbyname('DTA_CAD').AsDateTime)) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('CONTATO').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('CNPJ').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('IE').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('IM').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('ENDERECO').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('NR_ENDERECO').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('COMPLEMENTO').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('BAIRRO').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('NOM_CIDADE').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('UF').AsString) + ',' +
      QUOTEDSTR(dao.q1.fieldbyname('CEP').AsString) + ') ';

    Execsql1_Frente(sql_insert);
  end
  else
  begin
    sql_update := 'UPDATE CLIENTE SET ' +
      ' NOME = ' + QUOTEDSTR(dao.q1.fieldbyname('NOM_CLIENTE').AsString) + ',' +
      ' FANTASIA = ' + QUOTEDSTR(dao.q1.fieldbyname('NOM_FANTASIA').AsString) +
        ',' +
      ' SITUACAO = ''Ativo'',' +
      ' CONTATO = ' + QUOTEDSTR(dao.q1.fieldbyname('CONTATO').AsString) + ',' +
      ' CNPJ_CNPF = ' + QUOTEDSTR(dao.q1.fieldbyname('CNPJ').AsString) + ',' +
      ' IE_RG = ' + QUOTEDSTR(dao.q1.fieldbyname('IE').AsString) + ',' +
      ' IM = ' + QUOTEDSTR(dao.q1.fieldbyname('IM').AsString) + ',' +
      ' ENDERECO = ' + QUOTEDSTR(dao.q1.fieldbyname('ENDERECO').AsString) + ','
        +
      ' NUMERO = ' + QUOTEDSTR(dao.q1.fieldbyname('NR_ENDERECO').AsString) + ','
        +
      ' COMPLEMENTO = ' + QUOTEDSTR(dao.q1.fieldbyname('COMPLEMENTO').AsString) +
        ',' +
      ' BAIRRO = ' + QUOTEDSTR(dao.q1.fieldbyname('BAIRRO').AsString) + ',' +
      ' CIDADE = ' + QUOTEDSTR(dao.q1.fieldbyname('NOM_CIDADE').AsString) + ','
        +
      ' UF = ' + QUOTEDSTR(dao.q1.fieldbyname('UF').AsString) + ',' +
      ' CEP = ' + QUOTEDSTR(dao.q1.fieldbyname('CEP').AsString) +
      ' WHERE CODIGO = ' + codigo;
    Execsql1_Frente(sql_update);
  end;

  dao.cn_frente.Commit;

end;

procedure TFrenteCaixa.produto(numero: string);
var
  sql_insert, sql_update: string;
begin
  dao.Geral3('SELECT PRODUTO.COD_PRODUTO, PRODUTO.CODIGO_BARRA, substring(PRODUTO.NOM_PRODUTO from 1 for 40) as nom_produto, PRODUTO.UNIDADE, ' +
    'PRODUTO.OBSERVACAO, coalesce(PRODUTO.FORNECEDOR_PRINCIPAL, ''null'') as fornecedor_principal, PRODUTO.PESO, PRODUTO.QTD_ESTOQUE, ' +
    'PRODUTO.ESTOQUE_MINIMO, PRODUTO.CUSTO, PRODUTO.LUCRO, PRODUTO.PRECO_VENDA, PRODUTO.COD_FISCAL_PRODUTO, ' +
    'PRODUTO.IPI, PRODUTO.DTA_ULT_ENTRADA, PRODUTO.DTA_ULT_SAIDA, PRODUTO.DTA_ULT_ATUALIZACAO, PRODUTO.NCM, ' +
    'SUBCATEGORIA.IMAGEM_BD, PRODUTO.STATUS, PRODUTO.OBSERVACAO,CASE WHEN PRODUTO.TRIB_ICMS = ''8'' THEN ''60'' ELSE ''00'' END AS CST FROM PRODUTO ' +
    'LEFT OUTER JOIN SUBCATEGORIA ON SUBCATEGORIA.ID = PRODUTO.SUBCATEGORIA  ' +
    'INNER JOIN VENDAS2 ON VENDAS2.COD_PRODUTO = PRODUTO.COD_PRODUTO ' +
    'WHERE VENDAS2.NUMDOC = ' + numero);

  dao.Q3.First;

  while not dao.q3.Eof do
  begin

    Geral1_Frente('SELECT a.CODIGO, a.DESCRICAO FROM ESTOQUE a WHERE a.CODIGO = '
      + dao.Q3.FieldByName('cod_produto').AsString);

    if dao.q1_frente.IsEmpty then
    begin
      sql_insert := 'INSERT INTO ESTOQUE (CODIGO, BARRAS, DESCRICAO, UND, CARACTERISTICAS, FORNECEDOR, PESO, QTD, QTD_IDEAL, PRECO_CUSTO, MARGEM_LUCRO,'
        +
        'PRECO_VENDA, CF, ALIQ_IPI, ULTIMA_COMPRA, ULTIMA_VENDA, DATA_CADASTRO,  COD_NCM, OBSERVACOES, OST, ST, SITUACAO) VALUES ( ';

      sql_insert := sql_insert +
        dao.q3.fieldbyname('COD_PRODUTO').AsString + ',' +
        QUOTEDSTR(dao.q3.fieldbyname('CODIGO_BARRA').AsString) + ',' +
        QUOTEDSTR(dao.q3.fieldbyname('NOM_PRODUTO').AsString) + ',' +
        QUOTEDSTR(dao.q3.fieldbyname('UNIDADE').AsString) + ',' +
        QUOTEDSTR(dao.q3.fieldbyname('OBSERVACAO').AsString) + ',' +
        dao.q3.fieldbyname('FORNECEDOR_PRINCIPAL').AsString + ',' +
        stringreplace(formatfloat('0.00', dao.q3.fieldbyname('PESO').AsFloat),
          ',', '.', [rfReplaceAll]) + ', ' +
        stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('QTD_ESTOQUE').AsFloat), ',', '.', [rfReplaceAll]) +
          ', ' +
        stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('ESTOQUE_MINIMO').AsFloat), ',', '.', [rfReplaceAll])
          + ', ' +
        stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('CUSTO').AsCurrency), ',', '.', [rfReplaceAll]) + ', '
          +
        stringreplace(formatfloat('0.00', dao.q3.fieldbyname('LUCRO').AsFloat),
          ',', '.', [rfReplaceAll]) + ', ' +
        stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('PRECO_VENDA').AsCurrency), ',', '.', [rfReplaceAll])
          + ', ' +
        QUOTEDSTR(dao.q3.fieldbyname('COD_FISCAL_PRODUTO').AsString) + ',' +
        stringreplace(formatfloat('0.00', dao.q3.fieldbyname('IPI').AsFloat),
          ',', '.', [rfReplaceAll]) + ', ' +
        QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_ENTRADA').AsDateTime)) + ',' +
        QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_SAIDA').AsDateTime)) + ',' +
        QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_ATUALIZACAO').AsDateTime)) + ',' +
        quotedstr(stringreplace(dao.q3.fieldbyname('NCM').AsString, '.', '',
          [rfReplaceAll])) + ', ' +
        QUOTEDSTR(dao.q3.fieldbyname('OBSERVACAO').AsString) + ',' +
        '''0'',' +
        QUOTEDSTR(dao.q3.fieldbyname('CST').AsString) + ', ''Ativo'')';

      Execsql1_Frente(sql_insert);
    end
    else
    begin
      sql_update := 'UPDATE ESTOQUE SET ' +
        'BARRAS = ' + QUOTEDSTR(dao.q3.fieldbyname('CODIGO_BARRA').AsString) +
          ',' +
        'DESCRICAO = ' + QUOTEDSTR(dao.q3.fieldbyname('NOM_PRODUTO').AsString) +
          ',' +
        'UND = ' + QUOTEDSTR(dao.q3.fieldbyname('UNIDADE').AsString) + ',' +
        'CARACTERISTICAS = ' +
          QUOTEDSTR(dao.q3.fieldbyname('OBSERVACAO').AsString) + ',' +
        'FORNECEDOR = ' + dao.q3.fieldbyname('FORNECEDOR_PRINCIPAL').AsString +
          ',' +
        'PESO = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('PESO').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
        'QTD = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('QTD_ESTOQUE').AsFloat), ',', '.', [rfReplaceAll]) +
          ', ' +
        'QTD_IDEAL = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('ESTOQUE_MINIMO').AsFloat), ',', '.', [rfReplaceAll])
          + ', ' +
        'PRECO_CUSTO = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('CUSTO').AsCurrency), ',', '.', [rfReplaceAll]) + ', '
          +
        'MARGEM_LUCRO = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('LUCRO').AsFloat), ',', '.', [rfReplaceAll]) + ', ' +
        'PRECO_VENDA = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('PRECO_VENDA').AsCurrency), ',', '.', [rfReplaceAll])
          + ', ' +
        'CF = ' + QUOTEDSTR(dao.q3.fieldbyname('COD_FISCAL_PRODUTO').AsString) +
          ',' +
        'ALIQ_IPI = ' + stringreplace(formatfloat('0.00',
          dao.q3.fieldbyname('IPI').AsFloat), ',', '.', [rfReplaceAll]) + ', ' +
        'ULTIMA_COMPRA = ' + QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_ENTRADA').AsDateTime)) + ',' +
        'ULTIMA_VENDA = ' + QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_SAIDA').AsDateTime)) + ',' +
        'DATA_CADASTRO = ' + QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTA_ULT_ATUALIZACAO').AsDateTime)) + ',' +
        'COD_NCM = ' +
          quotedstr(stringreplace(dao.q3.fieldbyname('NCM').AsString, '.', '',
          [rfReplaceAll])) + ', ' +
        'OST = 0,' +
        'ST = ' + QUOTEDSTR(dao.q3.fieldbyname('CST').AsString) + ',' +
        'SITUACAO = ''Ativo'',' +
        'OBSERVACOES = ' + QUOTEDSTR(dao.q3.fieldbyname('OBSERVACAO').AsString)
          +
        ' WHERE CODIGO = ' + dao.Q3.FieldByName('cod_produto').AsString;
      Execsql1_Frente(sql_update);
    end;

    dao.Q3.Next;
  end;
end;

procedure TFrenteCaixa.pedido(numero: string);
var
  sql_insert: string;
  desconto_pedido: real;
begin
  {//if not dao.cn_frente.InTransaction then  }
    dao.cn_frente.StartTransaction;
  Geral2_Frente('SELECT a.NUMERO FROM CABDAV a WHERE a.NUMERO = ' + numero);

  if dao.q2_frente.IsEmpty then
  begin
    dao.Geral2('SELECT NUMDOC, COD_CLIENTE, DTADOC, TOT_LIQUIDO, TOT_BRUTO FROM VENDAS1 WHERE NUMDOC  = ' + numero);
    desconto_pedido := dao.q2.fieldbyname('TOT_BRUTO').AsCurrency -
      dao.q2.fieldbyname('TOT_LIQUIDO').AsCurrency;

    sql_insert :=
      'INSERT INTO CABDAV (NUMERO, TITULO, CLIENTE, DATA_DAV, VALOR_TOT_DES, VALOR_TOT_PRO, VALOR_TOT_DAV, IMPRESSO) VALUES ( ';
    sql_insert := sql_insert +
      dao.q2.fieldbyname('NUMDOC').AsString + ',' +
      '''PED.VENDA'', ' +
      dao.q2.fieldbyname('COD_CLIENTE').AsString + ',' +
      QUOTEDSTR(formatdatetime('dd.mm.yyyy',
        dao.q2.fieldbyname('DTADOC').AsDateTime)) + ',' +
      stringreplace(formatfloat('0.00', desconto_pedido), ',', '.',
        [rfReplaceAll]) + ', ' +
      stringreplace(formatfloat('0.00',
        dao.q2.fieldbyname('TOT_BRUTO').AsCurrency), ',', '.', [rfReplaceAll]) +
        ', ' +
      stringreplace(formatfloat('0.00',
        dao.q2.fieldbyname('TOT_LIQUIDO').AsCurrency), ',', '.', [rfReplaceAll]) +
        ',0) ';
    Execsql2_Frente(sql_insert);
  end;

  dao.cn_frente.Commit;
end;

procedure TFrenteCaixa.Itens(numero: string);
var
  sql_insert, sql_update: string;
  desconto, acrescimo, preco_bruto, preco, sub_total, sub_total_bruto, qtd:
    real;
  procedure AtualizaPreco(id_produto: string);
  begin
    sql_update := 'UPDATE ESTOQUE SET ' +
      'PRECO_VENDA = ' + stringreplace(formatfloat('0.00', preco_bruto), ',',
        '.', [rfReplaceAll]) +
      ' WHERE CODIGO = ' + id_produto;
    Execsql1_Frente(sql_update);
  end;
begin
  //if not dao.cn_frente.InTransaction then
    dao.cn_frente.StartTransaction;

  dao.Geral3('SELECT VENDAS2.NUMDOC, VENDAS1.COD_CLIENTE, VENDAS1.DTADOC, VENDAS2.ID, VENDAS2.COD_PRODUTO, substring(PRODUTO.NOM_PRODUTO from 1 for 40) as NOM_PRODUTO, ' +
    'PRODUTO.UNIDADE, VENDAS2.QTD, VENDAS2.DESCONTO_VALOR, VENDAS2.PRECO_BRUTO, VENDAS2.PRECO, VENDAS2.SUB_TOTAL, VENDAS2.DESCONTO from  VENDAS2 INNER JOIN VENDAS1 ON VENDAS1.NUMDOC = VENDAS2.NUMDOC ' +
    'INNER JOIN PRODUTO ON PRODUTO.COD_PRODUTO = VENDAS2.COD_PRODUTO WHERE VENDAS2.NUMDOC = ' +
      numero);

  dao.Q3.First;
  while not dao.Q3.Eof do
  begin
    Geral3_Frente('SELECT ITEDAV.NUMERO, ITEDAV.TITULO, ITEDAV.CLIENTE, ITEDAV.ITEM, ITEDAV.CODIGO, ITEDAV.DESCRICAO, '
      +
      'ITEDAV.UND, ITEDAV.QTD, ITEDAV.VALOR_UNITA, ITEDAV.VALOR_TOTAL FROM ITEDAV ' +
      'WHERE numero = ' + dao.Q3.fieldbyname('NUMDOC').AsString + ' and item = '
        + dao.Q3.fieldbyname('id').AsString);

    if dao.q3_frente.IsEmpty then
    begin

      preco_bruto := dao.q3.fieldbyname('PRECO_BRUTO').AsCurrency;
      preco := dao.q3.fieldbyname('PRECO').AsCurrency;
      qtd := dao.q3.fieldbyname('QTD').AsFloat;
      sub_total_bruto := preco_bruto * qtd;
      sub_total := preco * qtd;

      desconto := ((sub_total_bruto - sub_total) +
        dao.q3.fieldbyname('DESCONTO_VALOR').AsCurrency) / qtd;
      acrescimo := (sub_total - sub_total_bruto) / qtd;

      if acrescimo < 0 then
        acrescimo := 0;

      if desconto < 0 then
        desconto := 0
      else begin
        preco := preco - desconto;
        sub_total := preco * qtd;
      end;

      if acrescimo >= preco_bruto then
      begin
        repeat
          preco_bruto := preco_bruto + 0.01;
          acrescimo := acrescimo - 0.01;
        until acrescimo < preco_bruto;
        AtualizaPreco(dao.q3.fieldbyname('COD_PRODUTO').AsString);
      end;

      (* if desconto >= preco_bruto then
       begin
         repeat
           preco_bruto := preco_bruto - 1;
           desconto    := desconto + 1;
         until desconto < preco_bruto;
       end; *)

      sql_insert :=
        'INSERT INTO ITEDAV (NUMERO, TITULO, CLIENTE, DATA_DAV, ITEM, CODIGO, DESCRICAO, UND, QTD, DESCONTO, ACRESCIMO, VALOR_UNITA, VALOR_TOTAL, CANCELADO) VALUES ( ';
      sql_insert := sql_insert +
        dao.q3.fieldbyname('NUMDOC').AsString + ',' +
        '''PED.VENDA'', ' +
        dao.q3.fieldbyname('COD_CLIENTE').AsString + ',' +
        QUOTEDSTR(formatdatetime('dd.mm.yyyy',
          dao.q3.fieldbyname('DTADOC').AsDateTime)) + ',' +
        dao.q3.fieldbyname('ID').AsString + ',' +
        dao.q3.fieldbyname('COD_PRODUTO').AsString + ',' +
        quotedstr(dao.q3.fieldbyname('NOM_PRODUTO').AsString) + ',' +
        quotedstr(dao.q3.fieldbyname('UNIDADE').AsString) + ',' +
        stringreplace(formatfloat('0.00', dao.q3.fieldbyname('QTD').Asfloat),
          ',', '.', [rfReplaceAll]) + ',' +
        stringreplace(formatfloat('0.00', desconto), ',', '.', [rfReplaceAll]) +
          ',' +
        stringreplace(formatfloat('0.00', acrescimo), ',', '.', [rfReplaceAll]) +
          ',' +
        stringreplace(formatfloat('0.00', preco_bruto), ',', '.', [rfReplaceAll])
          + ',' +
        stringreplace(formatfloat('0.00', sub_total), ',', '.', [rfReplaceAll]) +
          ', 0)';
      Execsql1_Frente(sql_insert);
    end;
    dao.Q3.Next;
  end;
  dao.cn_frente.Commit;

end;

end.

