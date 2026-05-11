unit un_conexao_vendor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  Forms, IdFTPCommon, IdFTP, IdComponent, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TConexaoVendor = class(TThread)
  private
    vendor: boolean;
    cont: integer;
    bytesToTransfer: int64;
    FTP: TIdFTP;

{$IFDEF ORBI}
    procedure _OnWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: System.int64);
    procedure _OnWork(Sender: TObject; AWorkMode: TWorkMode;
      AWorkCount: System.int64);
    procedure MostraFTP;
{$ENDIF}
    procedure Geral1_Vendor(cmd: string);
    procedure Geral2_Vendor(cmd: string);
    procedure Geral3_Vendor(cmd: string);
    procedure Execsql1_Vendor(cmd: string);
    procedure Execsql2_Vendor(cmd: string);
    procedure conf_CN_Vendor;
  public
    representante: string;
    constructor Create();
    destructor Free();
    procedure Mostra;
    procedure AtualizarDados(tabela: string);
    procedure ExportarDados(tabela: string);
    procedure ImportarDados;
    procedure EnviarVisitas;

    procedure pedido(numero: string);
    procedure RegistrarConexao(tipo: string);
{$IFDEF ORBI}
    procedure LimparDir(extensao: string);
    function BaixarFTP(extensao: string): boolean;
{$ENDIF}
    function conexao(servidor, banco: string): boolean;
  end;

implementation

uses Un_dao,  Un_splash, un_dm, UnFun{$IFDEF ORBI},
  Unpri{$ENDIF}{$IFDEF ORBIPALM}, Un_menuprincipal{$ENDIF};

constructor TConexaoVendor.Create();
begin
  inherited Create(True);
  FreeOnTerminate := false; // Libera o objeto após terminar.
  Priority := tpNormal;
  conf_CN_Vendor;
  Resume; // Inicia o Thread.
end;

destructor TConexaoVendor.Free();
begin
  dao.CN_Vendor_Origem.connected := false;
  // inherited Free();
end;

procedure TConexaoVendor.Geral1_Vendor(cmd: string);
begin
  try
    with dao.q1_vendor do
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
{      dao.envia_email_suporte(e.message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;
{$IFDEF ORBI}

function TConexaoVendor.BaixarFTP(extensao: string): boolean;
var
  pathSaida: string;
  F: TSearchRec;
  x: integer;
  vendor, baixar: boolean;
  Arquivos: TStringList;
  data_ftp, data_local: Tdatetime;
begin
  if not DirectoryExists('vendor_' + dao.NomeBanco) then
    CreateDir('vendor_' + dao.NomeBanco);

  pathSaida := ExtractFilePath(Application.ExeName) + 'vendor_' + dao.NomeBanco + '\';

  dao.geral1('select MODULO_VENDOR, VENDOR_FTP_HOST, VENDOR_FTP_HOST_EXTERNO, VENDOR_FTP_USUARIO, VENDOR_FTP_SENHA from CONFIGURACAO');

  vendor := dao.Q1.fieldbyname('MODULO_VENDOR').AsString = 'S';
  if not vendor then
    exit;

  { dm.FTPSite.Host := dao.Q1.fieldbyname('VENDOR_FTP_HOST_EXTERNO').AsString;
    dm.FTPSite.Username := dao.Q1.fieldbyname('VENDOR_FTP_USUARIO').AsString;
    dm.FTPSite.Password := dao.Q1.fieldbyname('VENDOR_FTP_SENHA').AsString;
    Arquivos := TStringList.create;
    dm.FTPSite.connected := false;
    try
    dm.FTPSite.Connect;
    except
    dm.FTPSite.connected := false;
    dm.FTPSite.Host := dao.Q1.fieldbyname('VENDOR_FTP_HOST').AsString;
  }
  FTP := TIdFTP.Create(nil);

{$IFDEF ORBI}
  FTP.onWork := _OnWork;
  FTP.onWorkBegin := _OnWorkBegin;
{$ENDIF}
  FTP.Host := dao.Q1.fieldbyname('VENDOR_FTP_HOST_EXTERNO').AsString;
  FTP.Username := dao.Q1.fieldbyname('VENDOR_FTP_USUARIO').AsString;
  FTP.Password := dao.Q1.fieldbyname('VENDOR_FTP_SENHA').AsString;
  FTP.ReadTimeout := 600000;
  FTP.Port := 2121;
  Arquivos := TStringList.Create;
  FTP.Disconnect;
  try
    FTP.Connect;
  except
    FTP.Disconnect;
    FTP.Host := dao.Q1.fieldbyname('VENDOR_FTP_HOST').AsString;

    fm_splash.ggProgress.Visible := True;
    fm_splash.lbStatus.Visible := True;
    fm_splash.lbArquivos.Caption := 'Conectando FTP...';
    fm_splash.Update;
    try
      FTP.Connect;
    except
      fm_splash.ggProgress.Visible := True;
      fm_splash.lbStatus.Visible := True;
      fm_splash.lbArquivos.Caption := 'Sem conexão...';
      fm_splash.Update;
      sleep(2000);
      fm_splash.hide;
      Result := false;
    end;
  end;

  if FTP.Connected then
  begin
    fm_splash.lbArquivos.Caption := 'Conectado ao FTP...';
    fm_splash.Update;
    // transfere um arquivo texto
    FTP.Passive := True;
    // dm.FTPSite.TransferType := ftASCII;
    FTP.TransferType := ftBinary;

    if extensao = 'sql' then
      DeleteFile(pathSaida + 'vendor_' + frpri.Representante_id + '.sql');

    if extensao = 'sql' then
      FTP.List(Arquivos, '*_' + frpri.Representante_id + '.' + extensao, false)
    else
      FTP.List(Arquivos, '*.' + extensao, false);

    fm_splash.pgArquivos.MaxValue := Arquivos.count;
    fm_splash.lbStatus.Visible := True;
    fm_splash.ggProgress.Visible := True;
    fm_splash.lbArquivos.Caption := 'Baixando Arquivos...';
    fm_splash.Refresh;
    for x := 0 to Arquivos.count - 1 do
    begin
      fm_splash.lbArquivos.Caption := 'Baixando Arquivos...';
      fm_splash.lbStatus.Caption := Arquivos[x];
      Synchronize(Mostra);
      bytesToTransfer := FTP.Size(Arquivos[x]);
      baixar := True;

      if (FileExists(pathSaida + Arquivos[x])) then
        baixar := FMFUN.TamanhoArquivo(pathSaida + Arquivos[x]) <>
          bytesToTransfer;

      if baixar then
        FTP.Get(Arquivos[x], pathSaida + Arquivos[x], True);

      fm_splash.pgArquivos.AddProgress(1);
      Synchronize(Mostra);
    end;
    FTP.Quit;
    FTP.Disconnect;
    FTP.Free;
    Arquivos.Free;
    Result := True;
  end
  else
  begin
    fm_splash.lbArquivos.Caption := 'Não Conectado ao FTP...';
    fm_splash.Update;
    Result := false;
  end;
end;

procedure TConexaoVendor._OnWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: int64);
begin
{$IFDEF ORBIPALM}
  fmPrincipal.PgItem.MaxValue := bytesToTransfer;
{$ENDIF}
{$IFDEF ORBI}
  if (fm_splash = nil) then
    exit;
  fm_splash.ggProgress.MaxValue := bytesToTransfer;
{$ENDIF}
  Synchronize(MostraFTP);
end;

procedure TConexaoVendor._OnWork(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCount: int64);
begin
{$IFDEF ORBIPALM}
  fmPrincipal.PgItem.Progress := AWorkCount;
{$ENDIF}
{$IFDEF ORBI}
  if (fm_splash = nil) then
    exit;
  fm_splash.ggProgress.Progress := AWorkCount;
{$ENDIF}
  Synchronize(MostraFTP);
end;

procedure TConexaoVendor.MostraFTP;
begin
{$IFDEF ORBIPALM}
  fmPrincipal.Refresh;
{$ENDIF}
{$IFDEF ORBI}
  fm_splash.Refresh;
{$ENDIF}
end;

procedure TConexaoVendor.LimparDir(extensao: string);
var
  pathSaida: string;
  F: TSearchRec;
  Ret: integer;
begin
  if not DirectoryExists('vendor') then
    CreateDir('vendor');
  pathSaida := ExtractFilePath(Application.ExeName) + 'vendor\';
  Ret := FindFirst(pathSaida + '*.' + extensao, faAnyFile, F);

  while Ret = 0 do
  begin
    DeleteFile(pathSaida + F.Name);
    Ret := FindNext(F);
  end;
end;
{$ENDIF}

procedure TConexaoVendor.Geral2_Vendor(cmd: string);
begin
  try
    with dao.q2_vendor do
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
{      dao.envia_email_suporte(e.message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TConexaoVendor.Geral3_Vendor(cmd: string);
begin
  try
    with dao.q3_vendor do
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
{      dao.envia_email_suporte(e.message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar o procedimento Geral1 módulo Dao',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TConexaoVendor.Execsql1_Vendor(cmd: string);
begin
  try
    with dao.exec_sql_vendor do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    // grava_log(cmd, '');

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o ExecSql!' + #13 + e.message);

{      dao.envia_email_suporte(e.message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br',
        '', '', '');
 }
    end;
  end;

end;

procedure TConexaoVendor.Execsql2_Vendor(cmd: string);
begin
  try
    with dao.exec_sql_vendor2 do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    // grava_log(cmd, '');

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o ExecSql!' + #13 + e.message);

{      dao.envia_email_suporte(e.message + #13 + cmd + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br',
        '', '', '');
 }
    end;
  end;

end;

function TConexaoVendor.conexao(servidor, banco: string): boolean;
begin
  dao.CN_Vendor_Origem.Params.Add('Server='+servidor);
  dao.CN_Vendor_Origem.Params.Add('Database'+banco);
  try
    if not dao.CN_Vendor_Origem.Connected then
      dao.CN_Vendor_Origem.Connected := true;
    Result := True;
  except
    Result := false;
  end;
end;

procedure TConexaoVendor.conf_CN_Vendor;
begin
  dao.Geral5
    ('SELECT a.MODULO_VENDOR, a.VENDOR_SERVIDOR_BD_EXTERNO, a.VENDOR_SERVIDOR_BD_INTERNO, a.VENDOR_BD FROM CONFIGURACAO a');

  vendor := dao.Q5.fieldbyname('MODULO_VENDOR').AsString = 'S';

  if not vendor then
    exit;
end;

procedure TConexaoVendor.Mostra;
begin
{$IFDEF ORBIPALM}
  fmPrincipal.PgItem.Progress := cont;
  fmPrincipal.Refresh;
{$ENDIF}
{$IFDEF ORBI}
  fm_splash.ggProgress.Progress := cont;
  fm_splash.Refresh;
{$ENDIF}
end;

procedure TConexaoVendor.ImportarDados;
var
  ImportSql: TStringList;
  x, tot_file: integer;
  tabela, id, pathSaida: string;
  F: TSearchRec;
  Ret: integer;
  novo_prazo: tdate;
begin
  if not dao.CN_Vendor_Origem.Connected then
  begin
    dao.Geral4
      ('SELECT a.VENDOR_SERVIDOR_BD_INTERNO, a.VENDOR_BD, a.VENDOR_SERVIDOR_BD_EXTERNO FROM CONFIGURACAO a');
    dao.Q4.open;
    if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_INTERNO').AsString,
      dao.Q4.fieldbyname('VENDOR_BD').AsString) then
      if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_EXTERNO').AsString,
        dao.Q4.fieldbyname('VENDOR_BD').AsString) then
      begin
        showmessage('Sem conexão!!!');
        exit;
      end;
  end;

  dao.q2_vendor.sql.text := 'SELECT current_date as hoje FROM configuracao ';
  dao.q2_vendor.open;
  novo_prazo := dao.q2_vendor.fieldbyname('hoje').AsDateTime + 2;
  dao.q2_vendor.close;
  dao.CN_Vendor_Origem.connected := false;

  ImportSql := TStringList.Create;
  if not DirectoryExists('vendor_' + dao.NomeBanco) then
    CreateDir('vendor_' + dao.NomeBanco);
  if FileExists('vendor_' + dao.NomeBanco + '\vendor_' + Representante_usuario +
    '.sql') then
    ImportSql.LoadFromFile('vendor_' + dao.NomeBanco + '\vendor_' +
      Representante_usuario + '.sql');

  pathSaida := ExtractFilePath(Application.ExeName) + 'vendor_' +
    dao.NomeBanco + '\';

  fm_splash.ggProgress.Visible := True;
  fm_splash.lbStatus.Visible := True;
  fm_splash.ggProgress.MaxValue := ImportSql.count;
  fm_splash.lbStatus.Caption := 'Importando Dados';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;
  cont := 0;
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  for x := 0 to ImportSql.count - 1 do
  begin
    // dao.Execsql(ImportSql[x]);
    dao.IS_IMPORTAR_DADOS.SQLSCRIPTS[0].sql.text := ImportSql[x];
    try
      dao.IS_IMPORTAR_DADOS.ValidateAll;
      dao.IS_IMPORTAR_DADOS.ExecuteAll;
    except
      //
    end;

    fm_splash.Refresh;
    cont := cont + 1;
    fm_splash.lbStatus.Caption := 'Importando Dados - Linha: ' + inttostr(x);
    Synchronize(Mostra);
  end;
  { dao.IS_IMPORTAR_DADOS.SQL.Text := ImportSql.Text;
    dao.IS_IMPORTAR_DADOS.Execute; }
  dao.cn.Commit;
  ImportSql.Free;

  tot_file := 0;

  Ret := FindFirst(pathSaida + '*.bmp', faAnyFile, F);
  while Ret = 0 do
  begin
    tot_file := tot_file + 1;
    Ret := FindNext(F);
  end;
  fm_splash.ggProgress.Visible := True;
  fm_splash.lbStatus.Visible := True;
  fm_splash.ggProgress.MaxValue := tot_file;
  fm_splash.lbStatus.Caption := 'Gravando Imagens';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;
  cont := 0;

  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  Ret := FindFirst(pathSaida + '*.bmp', faAnyFile, F);
  while Ret = 0 do
  begin
    tabela := copy(F.Name, 1, pos('_', F.Name) - 1);
    id := copy(F.Name, pos('_', F.Name) + 1, 10);
    id := copy(id, 1, pos('.', id) - 1);
    dao.qrGravaFoto.close;
    dao.qrGravaFoto.sql.text := 'UPDATE ' + tabela +
      ' set imagem_bd =:foto where id =:codigo';
    dao.qrGravaFoto.Params[0].AsStream := TFileStream.Create(pathSaida + F.Name, fmOpenRead);
    dao.qrGravaFoto.ParamByName('codigo').value := id;
    dao.qrGravaFoto.open;
    cont := cont + 1;
    Ret := FindNext(F);
    Synchronize(Mostra);
  end;
  dao.cn.Commit;

  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  dao.ExecSQL('update vendas1 set cod_representante=' + Representante_usuario +
    ' where faturado = 1 ');
  dao.ExecSQL
    ('delete FROM VENDAS1 a where a.NUMDOC_DESTINO in (SELECT B.NUMDOC FROM VENDAS1 B WHERE B.FATURADO = 1) ');
  dao.ExecSQL('update CONFIGURACAO set VENDOR_PRAZO_ATUALIZAR = ' +
    quotedstr(formatdatetime('dd.mm.yyyy', novo_prazo)));
  dao.cn.Commit;

  RegistrarConexao('ATUALIZAÇÃO DE DADOS');

end;

procedure TConexaoVendor.RegistrarConexao(tipo: string);
begin
  // registrar a data/horário de conexão...
  {if not dao.CN_Vendor_Origem.InTransaction then
    dao.CN_Vendor_Origem.StartTransaction;
   }
  dao.exec_sql_vendor.sql.Clear;
  dao.exec_sql_vendor.sql.text :=
    'INSERT INTO CONEXAO_VENDOR (COD_REPRESENTANTE, DATA_CONEXAO, HORA_CONEXAO, TIPO) '
    + 'VALUES (' + Representante_usuario + ', ''' + formatdatetime('dd/mm/yyyy',
    now) + ''', ''' + formatdatetime('hh:mm:ss', now) + ''', ''' + tipo
    + ''') ';
  dao.exec_sql_vendor.ExecSQL;

  dao.CN_Vendor_Origem.Commit;
end;

procedure TConexaoVendor.ExportarDados(tabela: string);
var
  sql_insert, campo_id, campo_imagem, valor_id, order, rep, aux_sql,
    delete_sql: string;
  x: integer;
  lista_vazia: boolean;
  ExportSql: TStringList;
  Q3, Q4, Q5: TFDQuery;
  procedure CriarQuery(var VendorQ: TFDQuery; sql: string);
  begin
    VendorQ := TFDQuery.Create(dao);
    VendorQ.Connection := dao.Q1.Connection;
    VendorQ.Transaction := dao.Q1.Transaction;
    VendorQ.sql.Clear;
    VendorQ.sql.text := sql;
    VendorQ.open;
  end;
  procedure DestruirQuery(var VendorQ: TFDQuery);
  begin
    if VendorQ <> nil then
      FreeAndNil(VendorQ);
  end;

  function ListaUltimosPedidos: string;
  var
    lista: string;
    lista_clientes: TStringList;
    h: integer;
    Q1, Q2: TFDQuery;
  begin
    lista := '';
    CriarQuery(Q1,
      ' SELECT c.COD_CLIENTE FROM CLIENTE C WHERE C.ID_REPRESENTANTE = ' + rep +
      ' and (current_date - 365) < (select max(dtadoc) from vendas1 v1 where v1.COD_cliente = c.COD_CLIENTE) ');

    Q1.first;
    lista_clientes := TStringList.Create;
    while not Q1.Eof do
    begin
      lista_clientes.add(Q1.fieldbyname('COD_CLIENTE').AsString);
      Q1.Next;
    end;
    DestruirQuery(Q1);

    for h := 0 to lista_clientes.count - 1 do
    begin
      CriarQuery(Q2,
        'SELECT V11.NUMDOC FROM VENDAS1 V11 WHERE v11.COD_FISCAL not in (''6152'', ''6409'') and v11.NFE_DEV is null and V11.faturado = 1 and V11.COD_CLIENTE = '
        + lista_clientes[h] + ' order by v11.numdoc desc limit 5  ');
      while not Q2.Eof do
      begin
        lista := lista + Q2.fieldbyname('NUMDOC').AsString + ',';
        Q2.Next;
      end;
      DestruirQuery(Q2);
    end;

    FreeAndNil(lista_clientes);
    lista_vazia := lista = '';
    Result := copy(lista, 1, length(lista) - 1);
  end;

begin
{
  if not vendor then
    exit;

  lista_vazia := True;

  aux_sql := '';
  if representante <> '' then
    aux_sql := ' and r.id = ' + representante;

  CriarQuery(Q5,
    'select id, nom_representante from REPRESENTANTE r where r.ATIVO = ''S'' AND r.TIPO_SISTEMA in (2,3) and r.FUNCIONARIO in (0,1) '
    + aux_sql);
  Q5.first;
  while not Q5.Eof do
  begin
    ExportSql := TStringList.Create;

    rep := Q5.fieldbyname('id').AsString;

    if not DirectoryExists('vendor') then
      CreateDir('vendor');

    if FileExists('vendor\vendor_' + rep + '.sql') then
      ExportSql.LoadFromFile('vendor\vendor_' + rep + '.sql');

    delete_sql := '';
    aux_sql := '';

    if tabela = 'cliente' then
      order := ' where id_representante = ' + rep +
        ' order by id_representante '
    else if tabela = 'cliente_visitas' then
    begin
      order := ' where cod_cliente in (select cod_cliente from cliente where id_representante = ' + rep + ')';
      delete_sql := ' where enviado = ''S''';
    end
    else if tabela = 'representante' then
    begin
      order := ' where id = ' + rep;
    end
    else if tabela = 'produto' then
    begin
      order := ' where status <> ''S'' or cod_produto in (select pra.cod_produto from produto_representante_inativos pra where pra.id_representante = '
        + rep + ')';
    end
    else if tabela = 'tbusu' then
    begin
      order := ' where COD_REPRESENTANTE = ' + rep;
    end
    else if tabela = 'vendas1' then
    begin
      aux_sql := ' where numdoc in (' + ListaUltimosPedidos + ')';
      order := aux_sql + 'order by numdoc ';
      delete_sql :=
        ' where faturado = 1 and cod_cliente in (select cod_cliente from cliente where id_representante = '
        + rep + ')';
    end
    else if tabela = 'vendas2' then
    begin
      aux_sql := ' where numdoc in (' + ListaUltimosPedidos + ')';
      order := aux_sql + 'order by numdoc ';
      delete_sql :=
        ' where numdoc in (select numdoc from vendas1 where faturado = 1 and cod_cliente in (select cod_cliente from cliente where id_representante = '
        + rep + ')) ';
    end
    else if tabela = 'cr1' then
    begin
      aux_sql := ' where nr_documento in (' + ListaUltimosPedidos + ')';
      order := aux_sql + 'order by nr_documento ';
      delete_sql :=
        ' where nr_documento in (select numdoc from vendas1 where faturado = 1 and cod_cliente in (select cod_cliente from cliente where id_representante = '
        + rep + ')) ';
    end
    else
      order := '';

    if lista_vazia and ((tabela = 'vendas1') or (tabela = 'vendas2') or
      (tabela = 'cr1')) then
      exit;

    CriarQuery(Q4, 'select * from ' + tabela + order);
}
{$IFDEF ORBIPALM}
    fmPrincipal.LbItem.Visible := True;
    fmPrincipal.PgItem.Visible := True;
    fmPrincipal.PgItem.MaxValue := Q4.recordcount;
    fmPrincipal.LbItem.Caption := 'Carregandos Dados de Origem...';
    fmPrincipal.PgItem.Progress := 0;
    fmPrincipal.Update;
{$ENDIF}
{$IFDEF ORBI}
    fm_splash.lbStatus.Visible := True;
    fm_splash.ggProgress.Visible := True;
    fm_splash.ggProgress.MaxValue := Q4.recordcount;
    fm_splash.lbStatus.Caption := 'Carregandos Dados de Origem...';
    fm_splash.ggProgress.Progress := 0;
    fm_splash.Update;
{$ENDIF}
    // fm_splash.Show;
    cont := 0;
    campo_imagem := '';
(*
    sql_insert := 'DELETE FROM ' + tabela + delete_sql + ';';
    ExportSql.add(sql_insert);

    while not Q4.Eof do
    begin

      if tabela = 'cliente' then
      begin
        if rep <> Q4.fieldbyname('ID_REPRESENTANTE').AsString then
        begin
          rep := Q4.fieldbyname('ID_REPRESENTANTE').AsString;

        end;
      end;

      sql_insert := 'INSERT INTO ' + tabela + ' ( ';

      for x := 0 to Q4.fieldcount - 1 do
      begin

        if Q4.Fields[x].IsPrimary then
          campo_id := Q4.Fields[x].FieldName;

        if not((tabela = 'vendas2') and (Q4.Fields[x].FieldName = 'ID')) then
        begin
          if not Q4.Fields[x].IsBlob then
            sql_insert := sql_insert + Q4.Fields[x].FieldName + ','
          else
          begin
            if not Q4.Fields[x].IsText and
              ((Q4.Fields[x].IsNotNull) and (Q4.Fields[x].AsString <> '')) then
            begin
              Q4.Fields[x].SaveToFile('vendor\' + tabela + '_' +
                Q4.fieldbyname(campo_id).AsString + '.bmp');
              campo_imagem := Q4.Fields[x].FieldName;
            end
            else
              sql_insert := sql_insert + Q4.Fields[x].FieldName + ',';

          end;
        end;
      end;

      sql_insert := copy(sql_insert, 1, length(sql_insert) - 1) + ') ';

      sql_insert := sql_insert + 'VALUES(';

      for x := 0 to Q4.fieldcount - 1 do
      begin

        if not((tabela = 'vendas2') and (Q4.Fields[x].FieldName = 'ID')) then
        begin

          if Q4.Fields[x].AsString = '' then
            sql_insert := sql_insert + 'null,'
          else if Q4.Fields[x].IsDateOnly then
            sql_insert := sql_insert +
              quotedstr(formatdatetime('dd/mm/yyyy', Q4.Fields[x].AsDateTime)) + ','
          else if Q4.Fields[x].IsDateTime then
          begin
            if length(trim(Q4.Fields[x].AsString)) <= 8 then
              sql_insert := sql_insert +
                quotedstr(formatdatetime('hh:mm:ss',
                Q4.Fields[x].AsDateTime)) + ','
            else
              sql_insert := sql_insert +
                quotedstr(formatdatetime('dd/mm/yyyy hh:mm:ss',
                Q4.Fields[x].AsDateTime)) + ',';
          end
          else if Q4.Fields[x].IsNumeric then
            sql_insert := sql_insert + stringreplace(Q4.Fields[x].AsString, ',',
              '.', [rfReplaceAll]) + ','
          else if not Q4.Fields[x].IsBlob or (campo_imagem = '') then
            sql_insert := sql_insert +
              quotedstr(stringreplace(Q4.Fields[x].AsString, #13#10, ' ',
              [rfReplaceAll])) + ',';

          if Q4.Fields[x].IsPrimary then
            valor_id := Q4.Fields[x].AsString;
        end;
      end;

      sql_insert := copy(sql_insert, 1, length(sql_insert) - 1) + ');';

      // dao.Exec_sql.SQL.Text := sql_insert;
      // dao.Exec_sql.SQL.SaveToFile('teste1.sql');
      // dao.Exec_sql.ExecSQL;

      ExportSql.add(sql_insert);
{$IFDEF ORBIPALM}
      fmPrincipal.LbItem.Caption := 'Gerando script...';
      fmPrincipal.Update;
{$ENDIF}
{$IFDEF ORBI}
      fm_splash.lbStatus.Caption := 'Gerando script...';
      fm_splash.Update;
{$ENDIF}
      cont := cont + 1;
      Synchronize(Mostra);
      Q4.Next;
      // sleep(100);
    end;
    DestruirQuery(Q4);
    ExportSql.SaveToFile('vendor\vendor_' + rep + '.sql');
    FreeAndNil(ExportSql);
    Q5.Next;
  end;
  DestruirQuery(Q5);
  dao.cn.commit;
  *)
  fm_splash.close;
end;

procedure TConexaoVendor.AtualizarDados(tabela: string);
var
  sql_insert, campo_id, campo_imagem, valor_id: string;
  x: integer;
begin
(*
  dao.q1_vendor.close;
  dao.q1_vendor.sql.text := 'select * from ' + tabela;
  dao.q1_vendor.open;
  dao.q1_vendor.first;

  fm_splash.ggProgress.Visible := True;
  fm_splash.lbStatus.Visible := True;
  fm_splash.ggProgress.MaxValue := dao.q1_vendor.recordcount;
  fm_splash.lbStatus.Caption := 'Carregandos Dados de Origem...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;
  cont := 0;
  campo_imagem := '';
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  dao.Exec_sql.sql.text := 'DELETE FROM ' + tabela;
  dao.Exec_sql.ExecSQL;
  fm_splash.lbStatus.Caption := 'Limpando Dados de Destino...';
  fm_splash.Refresh;

  while not dao.q1_vendor.Eof do
  begin
    sql_insert := 'INSERT INTO ' + tabela + ' ( ';

    for x := 0 to dao.q1_vendor.fieldcount - 1 do
    begin

      if dao.q1_vendor.Fields[x].IsPrimary then
        campo_id := dao.q1_vendor.Fields[x].FieldName;

      if not dao.q1_vendor.Fields[x].IsBlob then
        sql_insert := sql_insert + dao.q1_vendor.Fields[x].FieldName + ','
      else
      begin
        dao.q1_vendor.Fields[x].SaveToFile('temp.bmp');

        if not dao.q1_vendor.Fields[x].IsText and
          (dao.q1_vendor.Fields[x].AsString <> '') then
          campo_imagem := dao.q1_vendor.Fields[x].FieldName
        else
          sql_insert := sql_insert + dao.q1_vendor.Fields[x].FieldName + ',';

      end;
    end;

    sql_insert := copy(sql_insert, 1, length(sql_insert) - 1) + ') ';

    sql_insert := sql_insert + 'VALUES(';

    for x := 0 to dao.q1_vendor.fieldcount - 1 do
    begin
      if dao.q1_vendor.Fields[x].AsString = '' then
        sql_insert := sql_insert + 'null,'
      else if dao.q1_vendor.Fields[x].IsNumeric then
        sql_insert := sql_insert + stringreplace
          (dao.q1_vendor.Fields[x].AsString, ',', '.', [rfReplaceAll]) + ','
      else if not dao.q1_vendor.Fields[x].IsBlob or (campo_imagem = '') then
        sql_insert := sql_insert +
          quotedstr(dao.q1_vendor.Fields[x].AsString) + ',';

      if dao.q1_vendor.Fields[x].IsPrimary then
        valor_id := dao.q1_vendor.Fields[x].AsString;
    end;

    sql_insert := copy(sql_insert, 1, length(sql_insert) - 1) + ')';

    dao.Exec_sql.sql.text := sql_insert;
    dao.Exec_sql.sql.SaveToFile('teste1.sql');
    dao.Exec_sql.ExecSQL;
    fm_splash.lbStatus.Caption := 'Inserindo Dados...';
    fm_splash.Refresh;

    if campo_imagem <> '' then
    begin
      fm_splash.lbStatus.Caption := 'Atualizando Dados de Imagens...';
      fm_splash.Refresh;
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.qrGravaFoto.close;
      dao.qrGravaFoto.sql.text := 'UPDATE ' + tabela + ' SET ' + campo_imagem +
        ' =:' + campo_imagem + ' WHERE ' + campo_id + ' =:' + campo_id;
      dao.qrGravaFoto.ParamByName(campo_imagem).LoadFromFile('temp.bmp');
      dao.qrGravaFoto.ParamByName(campo_id).AsString := valor_id;
      dao.qrGravaFoto.open;
    end;

    cont := cont + 1;
    Synchronize(Mostra);
    dao.q1_vendor.Next;
  end;
  dao.cn.Commit;
  fm_splash.close;
  *)
end;

procedure TConexaoVendor.EnviarVisitas;
begin
(*
  dao.Geral4
    ('SELECT a.VENDOR_SERVIDOR_BD_INTERNO, a.VENDOR_BD, a.VENDOR_SERVIDOR_BD_EXTERNO FROM CONFIGURACAO a');
  dao.Q4.open;
  if not dao.CN_Vendor_Origem.Connected then
  begin
    if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_INTERNO').AsString,
      dao.Q4.fieldbyname('a.VENDOR_BD').AsString) then
      if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_EXTERNO').AsString,
        dao.Q4.fieldbyname('a.VENDOR_BD').AsString) then
      begin
        showmessage('Sem conexão!!!');
        exit;
      end;
  end;

  dao.geral1
    ('select a.COD_CLIENTE, a.DATA, a.VENDEU, a.MOTIVO_N_VENDA, a.VALOR_PEDIDO, a.ENVIADO from cliente_visitas a where a.enviado = ''S''');
  dao.Q1.first;

  if not dao.CN_Vendor_Origem.InTransaction then
    dao.CN_Vendor_Origem.StartTransaction;

  while not dao.Q1.Eof do
  begin
    dao.exec_sql_vendor2.sql.text :=
      'INSERT INTO CLIENTE_VISITAS (COD_CLIENTE, DATA, VENDEU, VALOR_PEDIDO, ENVIADO) VALUES ('
      + FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_CLIENTE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DATA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VENDEU')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VALOR_PEDIDO')) + ', ''S'');';
      dao.exec_sql_vendor2.ExecSQL;
    dao.Q1.Next;
  end;
  dao.CN_Vendor_Origem.Commit;

  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  dao.ExecSQL('update cliente_visitas set enviado = ''S''');
  dao.cn.Commit;
*)
end;

procedure TConexaoVendor.pedido(numero: string);
var
  sql_insert, numdoc_destino, numdoc_enviado: string;
  hoje: tdate;

  function ChecarPedidoRepetido: string;
  begin
    Result := '';
    dao.q1_vendor.sql.text := 'select numdoc from vendas1 ' + 'where dtadoc = '
      + FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DTADOC')) + ' and ' +
      'cod_cliente  = ' + FMFUN.PegaValorParaSql
      (dao.Q1.fieldbyname('cod_cliente')) + ' and ' + 'TOT_LIQUIDO  = ' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('TOT_LIQUIDO'));
    dao.q1_vendor.open;
    if not dao.q1_vendor.IsEmpty then
      Result := dao.q1_vendor.fieldbyname('numdoc').AsString;
    dao.q1_vendor.close;
  end;

  procedure pedido_item;
  var
    sql_insert_item: string;
  begin
    dao.geral2('select * from vendas2 a where a.numdoc = ' + numero);
    dao.Q2.first;

    while not dao.Q2.Eof do
    begin
      sql_insert_item := 'INSERT INTO VENDAS2 (' + 'NUMDOC,' + 'COD_PRODUTO,' +
        'COD_CLIENTE,' + 'COD_REPRESENTANTE,' + 'ID_COR,' + 'ID_TAMANHO,' +
        'QTD,' + 'QTD_DEVOLVIDA,' + 'DEVOLVIDO,' + 'PRECO,' + 'SUB_TOTAL,' +
        'DESCONTO,' + 'VOLUME,' + 'COD_EMPRESA,' + 'NR_PEDIDO_PALM,' +
        'PRECO_BRUTO,' + 'SUB_TOTAL_BRUTO,' + 'VLR_COMISSAO,' + 'TROCA,' +
        'COD_FISCAL_ITEM,' + 'ICMS_ITEM,' + 'VLR_ICMS_ST,' + 'VLR_BC_ST,' +
        'VLR_ICMS_ITEM,' + 'NCM,' + 'VLR_BC,' + 'IPI_ITEM,' + 'VLR_IPI_ITEM,' +
        'VLR_AGR_ITEM,' + 'TRIB_ICMS,' + 'CESTA_BASICA,' + 'COD_SUPERVISOR,' +
        'QTD_EMBALAGEM,' + 'PRECO_CUSTO,' + 'PERC_COMISSAO,' + 'PROMOCAO,' +
        'DESCONTO_MAX,' + 'CHECADO,' + 'PRECO_BASE)' + 'VALUES (' +
        numdoc_destino + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_PRODUTO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_CLIENTE')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_REPRESENTANTE')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('ID_COR')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('ID_TAMANHO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('QTD')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('QTD_DEVOLVIDA')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('DEVOLVIDO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PRECO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('SUB_TOTAL')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('DESCONTO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VOLUME')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_EMPRESA')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('NR_PEDIDO_PALM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PRECO_BRUTO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('SUB_TOTAL_BRUTO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_COMISSAO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('TROCA')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_FISCAL_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('ICMS_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_ICMS_ST')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_BC_ST')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_ICMS_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('NCM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_BC')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('IPI_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_IPI_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('VLR_AGR_ITEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('TRIB_ICMS')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('CESTA_BASICA')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('COD_SUPERVISOR')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('QTD_EMBALAGEM')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PRECO_CUSTO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PERC_COMISSAO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PROMOCAO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('DESCONTO_MAX')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('CHECADO')) + ',' + FMFUN.PegaValorParaSql
        (dao.Q2.fieldbyname('PRECO_BASE')) + ')';

      dao.exec_sql_vendor2.sql.text := sql_insert_item;
      dao.exec_sql_vendor2.ExecSQL;

      dao.Q2.Next;
    end;
  end;

begin
  dao.Geral4
    ('SELECT a.VENDOR_SERVIDOR_BD_INTERNO, a.VENDOR_BD, a.VENDOR_SERVIDOR_BD_EXTERNO FROM CONFIGURACAO a');
  dao.Q4.open;
  if not dao.CN_Vendor_Origem.Connected then
  begin
    if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_INTERNO').AsString,
      dao.Q4.fieldbyname('a.VENDOR_BD').AsString) then
      if not conexao(dao.Q4.fieldbyname('VENDOR_SERVIDOR_BD_EXTERNO').AsString,
        dao.Q4.fieldbyname('a.VENDOR_BD').AsString) then
      begin
        showmessage('Sem conexão!!!');
        exit;
      end;
  end;

  dao.q2_vendor.sql.text := 'SELECT  nextval(''Gen_venda1'') AS numdoc, current_date as hoje FROM configuracao ';
  dao.q2_vendor.open;
  numdoc_destino := dao.q2_vendor.fieldbyname('numdoc').AsString;
  hoje := dao.q2_vendor.fieldbyname('hoje').AsDateTime;
  dao.q2_vendor.close;

  dao.geral1('select * from vendas1 a where a.numdoc = ' + numero);
  dao.Q1.first;
 {
  if not dao.CN_Vendor_Origem.InTransaction then
    dao.CN_Vendor_Origem.StartTransaction;
 }
  while not dao.Q1.Eof do
  begin
    sql_insert := 'INSERT INTO VENDAS1 (' + ' NUMDOC, ' + ' HORA, ' +
      ' DTADOC, ' + ' COD_CLIENTE, ' + ' COD_USUARIO, ' + ' COD_EMPRESA, ' +
      ' FATURADO, ' + ' CONSIGNACAO, ' + ' ORCAMENTO, ' + ' ENTREGUE, ' +
      ' TOT_BRUTO, ' + ' DESCONTO, ' + ' TOT_LIQUIDO, ' + ' PRAZO_PGTO, ' +
      ' COD_FOP, ' + ' NUM_CUPOM, ' + ' TIPO_VENDA, ' + ' QTD_PARCELAS, ' +
      ' PONTO_USADO, ' + ' USUARIO_DESFATUROU, ' + ' COD_REPRESENTANTE, ' +
      ' COD_PRAZO_PGTO, ' + ' CUSTO_TOTAL, ' + ' LUCRO_MEDIO, ' +
      ' DTA_EMISSAO, ' + ' DTA_SAIDA, ' + ' EMPRESA_FATURAR, ' + ' NF, ' +
      ' OBSERVACOES_PEDIDO, ' + ' OBSERVACOES_NOTA, ' + ' COD_TRANSPORTADORA, '
      + ' TIPO_FRETE, ' + ' VOLUME_NOTA, ' + ' PESO_NOTA, ' + ' COD_CARGA, ' +
      ' VL_FRETE, ' + ' CONTATO_FRETE, ' + ' PED_IMPRESSO, ' +
      ' DTA_VENCIMENTO_CONSIG, ' + ' CANCELADO, ' + ' CONTEM_AVARIA, ' +
      ' CONTEM_ETIQUETA, ' + ' MOTIVO_TROCA, ' + ' NR_VENDA_ORIGINAL, ' +
      ' PEDIDO, ' + ' VENDA_ENVIADA, ' + ' CREDITO_USADO, ' +
      ' NR_PEDIDO_PALM, ' + ' BOLETO_ANEXO, ' + ' COD_FISCAL, ' +
      ' VLR_COMISSAO, ' + ' VLR_BC_ICMS, ' + ' VLR_ICMS, ' + ' VLR_ST, ' +
      ' VLR_TOT_NF, ' + ' VLR_BC_ICMS_ST, ' + ' CHAVE_NFE, ' + ' RECIBO_NFE, ' +
      ' STATUS_NFE, ' + ' MOTIVO_NFE, ' + ' DIGEST_NFE, ' + ' PROTOCOLO_NFE, ' +
      ' DATA_REC_NFE, ' + ' JUSTIF_CANC_NFE, ' + ' COD_SUPERVISOR, ' +
      ' COD_FORNECEDOR, ' + ' NFE, ' + ' VLR_IPI, ' + ' PALM_NR_CONEXAO, ' +
      ' SINCRONIZAR_PALM, ' + ' NUMDOC_REF, ' + ' FRETE_COMBINADO, ' +
      ' DT_FRETE_COMBINADO, ' + ' EMAIL_NFE, ' + ' EMAIL_PEDIDO, ' +
      ' PEDIDO_VENDEDOR, ' + ' USUARIO_CHECOU_PEDIDO_VENDEDOR, ' +
      ' CONTA_BOLETO, ' + ' USUARIO_CHECOU_FRETE_COMBINADO, ' +
      ' CARTACORRECAO, ' + ' AVISOGNRE, ' + ' MOTIVO_NFE_CANCEL_INTERNO, ' +
      ' USUARIO_LIBEROU_DESCONTO, ' + ' MOTIVO_LIBERACAO_DESCONTO, ' +
      ' CHAVE_NFE_DEV, ' + ' RECIBO_NFE_DEV, ' + ' STATUS_NFE_DEV, ' +
      ' MOTIVO_NFE_DEV, ' + ' DIGEST_NFE_DEV, ' + ' PROTOCOLO_NFE_DEV, ' +
      ' DATA_REC_NFE_DEV, ' + ' JUSTIF_CANC_NFE_DEV, ' + ' NFE_DEV, ' +
      ' PERC_COMISSAO, ' + ' LIBERAR_FATURAMENTO, ' + ' NUMDOC_GRUPO, ' +
      ' DESCONTO_VALOR) ' + 'VALUES (' +

      numdoc_destino + ',' +

      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('HORA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DTADOC')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_CLIENTE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_USUARIO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_EMPRESA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('FATURADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CONSIGNACAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('ORCAMENTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('ENTREGUE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('TOT_BRUTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DESCONTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('TOT_LIQUIDO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PRAZO_PGTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_FOP')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NUM_CUPOM')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('TIPO_VENDA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('QTD_PARCELAS')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PONTO_USADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('USUARIO_DESFATUROU')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_REPRESENTANTE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_PRAZO_PGTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CUSTO_TOTAL')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('LUCRO_MEDIO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DTA_EMISSAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DTA_SAIDA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('EMPRESA_FATURAR')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NF')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('OBSERVACOES_PEDIDO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('OBSERVACOES_NOTA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_TRANSPORTADORA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('TIPO_FRETE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VOLUME_NOTA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PESO_NOTA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_CARGA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VL_FRETE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CONTATO_FRETE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PED_IMPRESSO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DTA_VENCIMENTO_CONSIG')) + ','
      + FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CANCELADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CONTEM_AVARIA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CONTEM_ETIQUETA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('MOTIVO_TROCA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NR_VENDA_ORIGINAL')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PEDIDO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VENDA_ENVIADA')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CREDITO_USADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NR_PEDIDO_PALM')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('BOLETO_ANEXO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_FISCAL')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_COMISSAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_BC_ICMS')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_ICMS')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_ST')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_TOT_NF')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_BC_ICMS_ST')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CHAVE_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('RECIBO_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('STATUS_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('MOTIVO_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DIGEST_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PROTOCOLO_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DATA_REC_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('JUSTIF_CANC_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_SUPERVISOR')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('COD_FORNECEDOR')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('VLR_IPI')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PALM_NR_CONEXAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('SINCRONIZAR_PALM')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NUMDOC_REF')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('FRETE_COMBINADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DT_FRETE_COMBINADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('EMAIL_NFE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('EMAIL_PEDIDO')) + ',' + '1,' +
      FMFUN.PegaValorParaSql
      (dao.Q1.fieldbyname('USUARIO_CHECOU_PEDIDO_VENDEDOR')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CONTA_BOLETO')) + ',' +
      FMFUN.PegaValorParaSql
      (dao.Q1.fieldbyname('USUARIO_CHECOU_FRETE_COMBINADO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CARTACORRECAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('AVISOGNRE')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('MOTIVO_NFE_CANCEL_INTERNO')) +
      ',' + FMFUN.PegaValorParaSql
      (dao.Q1.fieldbyname('USUARIO_LIBEROU_DESCONTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('MOTIVO_LIBERACAO_DESCONTO')) +
      ',' + FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('CHAVE_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('RECIBO_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('STATUS_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('MOTIVO_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DIGEST_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PROTOCOLO_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DATA_REC_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('JUSTIF_CANC_NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NFE_DEV')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('PERC_COMISSAO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('LIBERAR_FATURAMENTO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('NUMDOC_GRUPO')) + ',' +
      FMFUN.PegaValorParaSql(dao.Q1.fieldbyname('DESCONTO_VALOR')) + ')';

    numdoc_enviado := ChecarPedidoRepetido;

    if numdoc_enviado = '' then
    begin
      dao.exec_sql_vendor.sql.text := sql_insert;
      dao.exec_sql_vendor.ExecSQL;
      pedido_item;
    end
    else
      numdoc_destino := numdoc_enviado;

    dao.Q1.Next;
     {
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
      }
    dao.ExecSQL('update vendas1 set numdoc_destino =' + numdoc_destino +
      ' where numdoc = ' + numero);
    dao.ExecSQL('update CONFIGURACAO set DATA_ULTIMO_ENVIO =' +
      quotedstr(formatdatetime('dd.mm.yyyy', hoje)));
    dao.cn.Commit;

  end;

  dao.CN_Vendor_Origem.Commit;
  // showmessage('Pedido Enviado com Sucesso!');
end;

end.
