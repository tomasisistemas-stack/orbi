unit Un_Error_Logger;

interface

uses
  SysUtils, Classes, Forms;

procedure InstalarLoggerErros(const ASistema: string);
function CapturarPilhaExcecaoAplicacao: string;
procedure RegistrarErroAplicacao(E: Exception; const ARotina: string = '';
  const ASQL: string = ''; const ADetalhe: string = '';
  const ACallStack: string = '');
procedure RegistrarMensagemErroAplicacao(const AMensagem: string;
  const ARotina: string = ''; const ASQL: string = ''; const ADetalhe: string = '';
  const ACallStack: string = '');

implementation

uses
  Windows, FireDAC.Comp.Client, Un_dao, MemCheck, JclDebug;

type
  TOrbiErrorLogger = class
  private
    FSistema: string;
    FOldException: TExceptionEvent;
    FTabelaVerificada: Boolean;
    FRegistrando: Boolean;
    procedure ApplicationException(Sender: TObject; E: Exception);
    procedure GarantirTabela(AConn: TFDConnection);
    procedure GravarBanco(E: Exception; const ARotina, ASQL, ADetalhe,
      ACallStack: string);
    procedure GravarArquivo(E: Exception; const ARotina, ASQL, ADetalhe,
      AErroBanco, ACallStack: string);
    function AplicacaoVersao: string;
    function LocalizacaoCodigo: string;
    function JclDebugInfoEndereco(AEndereco: Pointer): string;
    function Maquina: string;
    function ResolverEnderecoMap(AEndereco: Cardinal): string;
    function PilhaChamadas: string;
    function TelaAtiva: string;
  public
    constructor Create(const ASistema: string);
    procedure Instalar;
    procedure Registrar(E: Exception; const ARotina, ASQL, ADetalhe: string;
      const ACallStack: string = '');
  end;

var
  ErrorLogger: TOrbiErrorLogger;
  MapCache: TStringList;
  MapCacheArquivo: string;

function CapturarPilhaExcecaoAplicacao: string;
var
  Linhas: TStringList;
begin
  Result := '';
  Linhas := TStringList.Create;
  try
    try
      JclLastExceptStackListToStrings(Linhas, False, True, True, False);
      Result := Linhas.Text;
    except
      Result := '';
    end;
  finally
    Linhas.Free;
  end;
end;
constructor TOrbiErrorLogger.Create(const ASistema: string);
begin
  inherited Create;
  FSistema := ASistema;
end;

procedure TOrbiErrorLogger.Instalar;
begin
  try
    Include(JclStackTrackingOptions, stRawMode);
    Include(JclStackTrackingOptions, stAllModules);
    Include(JclStackTrackingOptions, stStaticModuleList);
    JclStartExceptionTracking;
  except
    // Mantem o logger ativo mesmo quando o JCL nao consegue iniciar o hook.
  end;

  FOldException := Application.OnException;
  Application.OnException := ApplicationException;
end;

procedure TOrbiErrorLogger.ApplicationException(Sender: TObject; E: Exception);
begin
  try
    Registrar(E, '', '', '');
  except
    // O logger nunca pode substituir a excecao original da aplicacao.
  end;

  if Assigned(FOldException) then
    FOldException(Sender, E)
  else
    Application.ShowException(E);
end;

function TOrbiErrorLogger.AplicacaoVersao: string;
var
  Size, Handle: DWORD;
  Buffer: Pointer;
  FixedInfo: PVSFixedFileInfo;
  InfoPtr: Pointer;
  Len: UINT;
begin
  Result := '';
  Size := GetFileVersionInfoSize(PChar(Application.ExeName), Handle);
  if Size = 0 then
    Exit;

  GetMem(Buffer, Size);
  try
    if GetFileVersionInfo(PChar(Application.ExeName), Handle, Size, Buffer) and
      VerQueryValue(Buffer, '\', InfoPtr, Len) then
    begin
      FixedInfo := PVSFixedFileInfo(InfoPtr);
      Result := Format('%d.%d.%d.%d',
        [HiWord(FixedInfo.dwFileVersionMS), LoWord(FixedInfo.dwFileVersionMS),
         HiWord(FixedInfo.dwFileVersionLS), LoWord(FixedInfo.dwFileVersionLS)]);
    end;
  finally
    FreeMem(Buffer);
  end;
end;

function TOrbiErrorLogger.JclDebugInfoEndereco(AEndereco: Pointer): string;
var
  Arquivo, Modulo, Rotina: string;
  Linha: Integer;
begin
  Result := '';
  if AEndereco = nil then
    Exit;

  try
    MapOfAddr(AEndereco, Arquivo, Modulo, Rotina, Linha);
    if Rotina <> '' then
      Result := Modulo + ' ' + Rotina + ' linha ' + IntToStr(Linha)
    else if Arquivo <> '' then
      Result := Arquivo + ' linha ' + IntToStr(Linha);
  except
    Result := '';
  end;
end;

function TOrbiErrorLogger.LocalizacaoCodigo: string;
begin
  Result := '';
  if ExceptAddr <> nil then
  begin
    Result := JclDebugInfoEndereco(ExceptAddr);
    if Result = '' then
      Result := ResolverEnderecoMap(Cardinal(ExceptAddr));
    if Result = '' then
      Result := TextualDebugInfoForAddress(Cardinal(ExceptAddr));
  end;
end;

function TOrbiErrorLogger.Maquina: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Len: DWORD;
begin
  Len := MAX_COMPUTERNAME_LENGTH + 1;
  if GetComputerName(Buffer, Len) then
    Result := Buffer
  else
    Result := '';
end;

function TOrbiErrorLogger.PilhaChamadas: string;
var
  CS: TCallStack;
  I: Integer;
  Info: string;
  LinhasJcl: TStringList;
begin
  Result := '';

  LinhasJcl := TStringList.Create;
  try
    try
      JclLastExceptStackListToStrings(LinhasJcl, False, True, True, False);
      if LinhasJcl.Count > 0 then
      begin
        Result := LinhasJcl.Text;
        Exit;
      end;
    except
    end;
  finally
    LinhasJcl.Free;
  end;

  FillCallStack(CS, 3);
  for I := Low(CS) to High(CS) do
  begin
    if CS[I] = nil then
      Continue;
    Info := JclDebugInfoEndereco(CS[I]);
    if Info = '' then
      Info := ResolverEnderecoMap(Cardinal(CS[I]));
    if Info = '' then
      Info := TextualDebugInfoForAddress(Cardinal(CS[I]));
    Result := Result + 'call stack - ' + IntToStr(I) + ' : ' + Info + #13#10;
  end;
end;

function TOrbiErrorLogger.ResolverEnderecoMap(AEndereco: Cardinal): string;
var
  ArquivoMap: string;
  Partes: TStringList;
  I, P, LinhaCodigo, MelhorLinha: Integer;
  Alvo, Offset, Tamanho, FimModulo, MelhorOffset: Cardinal;
  S, Unidade, UnidadeAtual, AddrTxt, OffsetTxt, LenTxt, LinhaTxt: string;

  function HexToCardinal(const AValor: string): Cardinal;
  begin
    Result := Cardinal(StrToInt64('$' + AValor));
  end;

  function Tokenizar(const ATexto: string): TStringList;
  begin
    Result := TStringList.Create;
    ExtractStrings([' ', #9], [], PChar(Trim(ATexto)), Result);
  end;
begin
  Result := '';
  if AEndereco <= Cardinal(HInstance) + $1000 then
    Exit;

  ArquivoMap := ChangeFileExt(Application.ExeName, '.map');
  if not FileExists(ArquivoMap) then
    ArquivoMap := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'ORBI.map';
  if not FileExists(ArquivoMap) then
    Exit;

  Alvo := AEndereco - Cardinal(HInstance) - $1000;
  Partes := nil;
  try
    if (MapCache = nil) or (not SameText(MapCacheArquivo, ArquivoMap)) then
    begin
      FreeAndNil(MapCache);
      MapCache := TStringList.Create;
      MapCache.LoadFromFile(ArquivoMap);
      MapCacheArquivo := ArquivoMap;
    end;

    Unidade := '';
    for I := 0 to MapCache.Count - 1 do
    begin
      S := MapCache[I];
      if (Length(S) < 24) or (Copy(S, 2, 5) <> '0001:') or
        (Pos(' C=CODE', S) = 0) or (Pos(' M=', S) = 0) then
        Continue;

      OffsetTxt := Copy(S, 7, 8);
      LenTxt := Copy(S, 16, 8);
      Offset := HexToCardinal(OffsetTxt);
      Tamanho := HexToCardinal(LenTxt);
      FimModulo := Offset + Tamanho;
      if (Alvo >= Offset) and (Alvo < FimModulo) then
      begin
        P := Pos(' M=', S);
        Unidade := Trim(Copy(S, P + 3, MaxInt));
        P := Pos(' ', Unidade);
        if P > 0 then
          Unidade := Copy(Unidade, 1, P - 1);
        Break;
      end;
    end;

    if Unidade = '' then
      Exit;

    MelhorLinha := 0;
    MelhorOffset := 0;
    UnidadeAtual := '';
    for I := 0 to MapCache.Count - 1 do
    begin
      S := Trim(MapCache[I]);
      if Pos('Line numbers for ', S) = 1 then
      begin
        UnidadeAtual := Copy(S, Length('Line numbers for ') + 1, MaxInt);
        P := Pos('(', UnidadeAtual);
        if P > 0 then
          UnidadeAtual := Copy(UnidadeAtual, 1, P - 1);
        Continue;
      end;

      if not SameText(UnidadeAtual, Unidade) then
        Continue;
      if S = '' then
        Continue;

      FreeAndNil(Partes);
      Partes := Tokenizar(S);
      P := 0;
      while P + 1 < Partes.Count do
      begin
        LinhaTxt := Partes[P];
        AddrTxt := Partes[P + 1];
        Inc(P, 2);
        if Pos('0001:', AddrTxt) <> 1 then
          Continue;

        LinhaCodigo := StrToIntDef(LinhaTxt, 0);
        Offset := HexToCardinal(Copy(AddrTxt, 6, 8));
        if (LinhaCodigo > 0) and (Offset <= Alvo) and (Offset >= MelhorOffset) then
        begin
          MelhorOffset := Offset;
          MelhorLinha := LinhaCodigo;
        end;
      end;
    end;

    if MelhorLinha > 0 then
      Result := Unidade + ' linha ' + IntToStr(MelhorLinha) +
        ' endereco ' + IntToHex(AEndereco, 8)
    else
      Result := Unidade + ' endereco ' + IntToHex(AEndereco, 8);
  finally
    Partes.Free;
  end;
end;

function TOrbiErrorLogger.TelaAtiva: string;
begin
  Result := '';
  if Screen.ActiveCustomForm <> nil then
    Result := Screen.ActiveCustomForm.Name + ' - ' + Screen.ActiveCustomForm.Caption;
end;

procedure TOrbiErrorLogger.GarantirTabela(AConn: TFDConnection);
var
  Q: TFDQuery;
  ExisteTabela, ExisteIndice: Boolean;

  procedure GarantirColuna(const ANomeColuna, ATipoColuna: string);
  begin
    Q.SQL.Text :=
      'select count(*) as total ' +
      'from information_schema.columns ' +
      'where table_schema = current_schema() ' +
      'and lower(table_name) = ''erro_log'' ' +
      'and lower(column_name) = ' + QuotedStr(LowerCase(ANomeColuna));
    Q.Open;
    try
      if Q.FieldByName('total').AsInteger <= 0 then
      begin
        Q.Close;
        Q.SQL.Text := 'alter table erro_log add column ' + ANomeColuna + ' ' + ATipoColuna;
        Q.ExecSQL;
      end;
    finally
      if Q.Active then
        Q.Close;
    end;
  end;
begin
  if FTabelaVerificada then
    Exit;
  if (AConn = nil) or (not AConn.Connected) then
    Exit;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'select count(*) as total ' +
      'from information_schema.tables ' +
      'where table_schema = current_schema() ' +
      'and lower(table_name) = ''erro_log''';
    Q.Open;
    ExisteTabela := Q.FieldByName('total').AsInteger > 0;
    Q.Close;

    if not ExisteTabela then
    begin
      Q.SQL.Text :=
        'create table erro_log (' +
        ' id bigserial primary key,' +
        ' data_hora timestamp without time zone not null default now(),' +
        ' sistema varchar(50),' +
        ' versao varchar(50),' +
        ' cod_usuario varchar(20),' +
        ' usuario varchar(100),' +
        ' cod_empresa varchar(20),' +
        ' empresa varchar(150),' +
        ' maquina varchar(100),' +
        ' tela varchar(150),' +
        ' rotina varchar(150),' +
        ' classe_erro varchar(150),' +
        ' mensagem text,' +
        ' detalhe text,' +
        ' sql_text text,' +
        ' exe_path text)';
      Q.ExecSQL;
    end;

    GarantirColuna('data_hora', 'timestamp without time zone not null default now()');
    GarantirColuna('sistema', 'varchar(50)');
    GarantirColuna('versao', 'varchar(50)');
    GarantirColuna('cod_usuario', 'varchar(20)');
    GarantirColuna('usuario', 'varchar(100)');
    GarantirColuna('cod_empresa', 'varchar(20)');
    GarantirColuna('empresa', 'varchar(150)');
    GarantirColuna('maquina', 'varchar(100)');
    GarantirColuna('tela', 'varchar(150)');
    GarantirColuna('rotina', 'varchar(150)');
    GarantirColuna('classe_erro', 'varchar(150)');
    GarantirColuna('mensagem', 'text');
    GarantirColuna('detalhe', 'text');
    GarantirColuna('sql_text', 'text');
    GarantirColuna('exe_path', 'text');
    GarantirColuna('localizacao_codigo', 'varchar(300)');
    GarantirColuna('call_stack', 'text');

    Q.SQL.Text :=
      'select count(*) as total ' +
      'from pg_indexes ' +
      'where schemaname = current_schema() ' +
      'and lower(indexname) = ''idx_erro_log_data_hora''';
    Q.Open;
    ExisteIndice := Q.FieldByName('total').AsInteger > 0;
    Q.Close;

    if not ExisteIndice then
    begin
      Q.SQL.Text := 'create index idx_erro_log_data_hora on erro_log (data_hora desc)';
      Q.ExecSQL;
    end;

    FTabelaVerificada := True;
  finally
    Q.Free;
  end;
end;

procedure TOrbiErrorLogger.GravarBanco(E: Exception; const ARotina, ASQL,
  ADetalhe, ACallStack: string);
var
  Q: TFDQuery;
  CallStack: string;
  ConnLog: TFDConnection;
  ErroConexaoPrincipal: string;
  UsarConexaoAuxiliar: Boolean;

  procedure ExecutarInsert(AConn: TFDConnection);
  begin
    GarantirTabela(AConn);

    Q.Connection := AConn;
    Q.SQL.Text :=
      'insert into erro_log (' +
      'sistema, versao, cod_usuario, usuario, cod_empresa, empresa, maquina, ' +
      'tela, rotina, classe_erro, mensagem, detalhe, sql_text, exe_path, localizacao_codigo, call_stack) ' +
      'values (:sistema, :versao, :cod_usuario, :usuario, :cod_empresa, :empresa, :maquina, ' +
      ':tela, :rotina, :classe_erro, :mensagem, :detalhe, :sql_text, :exe_path, :localizacao_codigo, :call_stack)';

    Q.ParamByName('sistema').AsString := FSistema;
    Q.ParamByName('versao').AsString := AplicacaoVersao;
    Q.ParamByName('cod_usuario').AsString := cod_usuario;
    Q.ParamByName('usuario').AsString := nom_usuario;
    Q.ParamByName('cod_empresa').AsString := cod_empresa;
    Q.ParamByName('empresa').AsString := nom_empresa;
    Q.ParamByName('maquina').AsString := Maquina;
    Q.ParamByName('tela').AsString := TelaAtiva;
    Q.ParamByName('rotina').AsString := ARotina;
    Q.ParamByName('classe_erro').AsString := E.ClassName;
    Q.ParamByName('mensagem').AsString := E.Message;
    Q.ParamByName('detalhe').AsString := ADetalhe;
    Q.ParamByName('sql_text').AsString := ASQL;
    Q.ParamByName('exe_path').AsString := Application.ExeName;
    Q.ParamByName('localizacao_codigo').AsString := LocalizacaoCodigo;
    Q.ParamByName('call_stack').AsString := CallStack;
    Q.ExecSQL;
  end;
begin
  CallStack := ACallStack;
  if CallStack = '' then
    CallStack := PilhaChamadas;

  if (dao = nil) or (dao.CN = nil) or (not dao.CN.Connected) then
    Exit;

  Q := TFDQuery.Create(nil);
  ConnLog := nil;
  ErroConexaoPrincipal := '';
  UsarConexaoAuxiliar := True;
  try
    ConnLog := TFDConnection.Create(nil);
    ConnLog.LoginPrompt := False;
    if dao.CN.ConnectionDefName <> '' then
      ConnLog.ConnectionDefName := dao.CN.ConnectionDefName;
    ConnLog.Params.Assign(dao.CN.Params);
    if ConnLog.Params.Values['DriverID'] = '' then
      ConnLog.Params.Values['DriverID'] := dao.CN.DriverName;

    try
      ConnLog.Connected := True;
      FTabelaVerificada := False;
      ExecutarInsert(ConnLog);
      UsarConexaoAuxiliar := False;
    except
      on EAux: Exception do
        ErroConexaoPrincipal := 'conexao auxiliar: ' + EAux.Message;
    end;

    if UsarConexaoAuxiliar then
    begin
      if Q.Active then
        Q.Close;
      try
        ExecutarInsert(dao.CN);
      except
        on EPrincipal: Exception do
          raise Exception.Create(ErroConexaoPrincipal +
            '; conexao principal: ' + EPrincipal.Message);
      end;
    end;
  finally
    Q.Free;
    ConnLog.Free;
  end;
end;

procedure TOrbiErrorLogger.GravarArquivo(E: Exception; const ARotina, ASQL,
  ADetalhe, AErroBanco, ACallStack: string);
var
  Dir, Arquivo, CallStack: string;
  F: TextFile;
begin
  CallStack := ACallStack;
  if CallStack = '' then
    CallStack := PilhaChamadas;

  Dir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Logs';
  ForceDirectories(Dir);
  Arquivo := IncludeTrailingPathDelimiter(Dir) + 'erros_' +
    FormatDateTime('yyyy_mm_dd', Now) + '.log';

  AssignFile(F, Arquivo);
  if FileExists(Arquivo) then
    Append(F)
  else
    Rewrite(F);
  try
    Writeln(F, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' +
      FSistema + ' - ' + E.ClassName + ': ' + E.Message);
    Writeln(F, 'Versao=' + AplicacaoVersao + '; Usuario=' + cod_usuario + '-' +
      nom_usuario + '; Empresa=' + cod_empresa + '-' + nom_empresa +
      '; Maquina=' + Maquina + '; Tela=' + TelaAtiva + '; Rotina=' + ARotina);
    if ADetalhe <> '' then
      Writeln(F, 'Detalhe=' + ADetalhe);
    if LocalizacaoCodigo <> '' then
      Writeln(F, 'Localizacao=' + LocalizacaoCodigo);
    Writeln(F, 'CallStack=' + #13#10 + CallStack);
    if ASQL <> '' then
      Writeln(F, 'SQL=' + ASQL);
    if AErroBanco <> '' then
      Writeln(F, 'Erro ao gravar no banco=' + AErroBanco);
    Writeln(F, StringOfChar('-', 120));
  finally
    CloseFile(F);
  end;
end;

procedure TOrbiErrorLogger.Registrar(E: Exception; const ARotina, ASQL,
  ADetalhe, ACallStack: string);
var
  ErroBanco: string;
begin
  if (E = nil) or FRegistrando then
    Exit;

  FRegistrando := True;
  try
    if (dao = nil) or (dao.CN = nil) or (not dao.CN.Connected) then
    begin
      GravarArquivo(E, ARotina, ASQL, ADetalhe,
        'Conexao principal indisponivel', ACallStack);
      Exit;
    end;
    try
      GravarBanco(E, ARotina, ASQL, ADetalhe, ACallStack);
    except
      on ELog: Exception do
      begin
        ErroBanco := ELog.Message;
        try
          GravarArquivo(E, ARotina, ASQL, ADetalhe, ErroBanco, ACallStack);
        except
          // Nao deixa falha de disco/permissao do arquivo mascarar o erro original.
        end;
      end;
    end;
  finally
    FRegistrando := False;
  end;
end;

procedure InstalarLoggerErros(const ASistema: string);
begin
  if ErrorLogger = nil then
    ErrorLogger := TOrbiErrorLogger.Create(ASistema);
  ErrorLogger.Instalar;
end;

procedure RegistrarErroAplicacao(E: Exception; const ARotina, ASQL,
  ADetalhe, ACallStack: string);
begin
  if ErrorLogger = nil then
    ErrorLogger := TOrbiErrorLogger.Create('ORBI');
  ErrorLogger.Registrar(E, ARotina, ASQL, ADetalhe, ACallStack);
end;

procedure RegistrarMensagemErroAplicacao(const AMensagem, ARotina, ASQL,
  ADetalhe, ACallStack: string);
var
  E: Exception;
begin
  E := Exception.Create(AMensagem);
  try
    RegistrarErroAplicacao(E, ARotina, ASQL, ADetalhe, ACallStack);
  finally
    E.Free;
  end;
end;

initialization

finalization
  MapCache.Free;
  ErrorLogger.Free;

end.

