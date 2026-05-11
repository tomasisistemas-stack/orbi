unit ExceptLog;

// Delphi Exception Logger
// http://www.jirihajek.net/delphi/ExceptLog.htm
// (c) Jiri Hajek 2003-2005
// E-mail: jh@jirihajek.net
// Created for MediaMonkey (http://www.mediamonkey.com), a free mp3 jukebox player and music library organizer

// Purpose: When you include this unit in your project, all exceptions that happens at run-time
// are automatically logged together with exception message, information about source of the
// exception and call stack content together with source files and line numbers information.

// Environment:
//  This unit was tested under Delphi 7, it would probably work under other Delphi versions
//  as well, but it might need some modifications in some magic constants in the code below.

// Usage:
//  1. Include this unit in your project
//  2. You'll also need an excellent leak detector for Delphi, MemCheck, from here:
//             http://v.mahon.free.fr/pro/freeware/memcheck/
//      (Exception Logger uses its methods to analyze callstack)
//  3. Modify OutputFile constant below so that logs are written to a file you want.
//  4. Recommended: Set your compiler options for debugging, this is described here:
//             http://v.mahon.free.fr/pro/freeware/memcheck/project_options.htm
//     It's a good idea to turn on "Project|Options|Linker|Include TD32 debug info"
//     because then you get complete reports about source files, procedure names and line numbers.
//     On the other hand, it makes your compiled exe file much bigger.
//  5. Compile and run! You can distribute such compiled file even to your users and they can
//     directly report any problem to you. Any exception that happens is written to the OutputFile
//     as specified below. It is also reported using OutputDebugString() method and so it can
//     be trapped for example by Debug View application from System Internals.

// License:
//   You can use this unit for any purpose, even commercial, as long as you leave this header here.
//   Author cannot be blamed for any problem with this unit. If you don't agree, don't use it.

interface

implementation

uses MemCheck, SysUtils, Windows, Classes, IniFiles;

const
  OutputFile = 'c:\orbi\Orbi.log';
  TrelloApiBase = 'https://api.trello.com/1/cards';
  TrelloApiKey = '0b3055e52cf5a413b1972a1492fa8858';
  INTERNET_OPEN_TYPE_PRECONFIG = 0;
  INTERNET_SERVICE_HTTP = 3;
  INTERNET_DEFAULT_HTTPS_PORT = 443;
  INTERNET_FLAG_SECURE = $00800000;
  INTERNET_FLAG_RELOAD = $80000000;
  INTERNET_FLAG_NO_CACHE_WRITE = $04000000;
  HTTP_QUERY_STATUS_CODE = 19;
  HTTP_QUERY_FLAG_NUMBER = $20000000;

function InternetOpen(lpszAgent: PChar; dwAccessType: DWORD; lpszProxy,
  lpszProxyBypass: PChar; dwFlags: DWORD): Pointer; stdcall;
  external 'wininet.dll' name 'InternetOpenA';
function InternetConnect(hInternet: Pointer; lpszServerName: PChar;
  nServerPort: Word; lpszUserName, lpszPassword: PChar; dwService: DWORD;
  dwFlags, dwContext: DWORD): Pointer; stdcall;
  external 'wininet.dll' name 'InternetConnectA';
function HttpOpenRequest(hConnect: Pointer; lpszVerb, lpszObjectName,
  lpszVersion, lpszReferrer: PChar; lplpszAcceptTypes: Pointer; dwFlags,
  dwContext: DWORD): Pointer; stdcall;
  external 'wininet.dll' name 'HttpOpenRequestA';
function HttpSendRequest(hRequest: Pointer; lpszHeaders: PChar;
  dwHeadersLength: DWORD; lpOptional: Pointer; dwOptionalLength: DWORD): BOOL; stdcall;
  external 'wininet.dll' name 'HttpSendRequestA';
function HttpQueryInfo(hRequest: Pointer; dwInfoLevel: DWORD; lpvBuffer: Pointer;
  var lpdwBufferLength: DWORD; var lpdwIndex: DWORD): BOOL; stdcall;
  external 'wininet.dll' name 'HttpQueryInfoA';
function InternetCloseHandle(hInternet: Pointer): BOOL; stdcall;
  external 'wininet.dll' name 'InternetCloseHandle';

type
  PExceptionRecord = ^TExceptionRecord;
  TExceptionRecord =
  record
    ExceptionCode        : LongWord;
    ExceptionFlags       : LongWord;
    OuterException       : PExceptionRecord;
    ExceptionAddress     : Pointer;
    NumberParameters     : Longint;
    case {IsOsException:} Boolean of
    True:  (ExceptionInformation : array [0..14] of Longint);
    False: (ExceptAddr: Pointer; ExceptObject: Pointer);
  end;

var
  oldRTLUnwindProc: procedure; stdcall;
  writeToFile : boolean = false;
  trelloConfigLoaded: boolean = false;
  trelloEnabled: boolean = false;
  trelloToken: string = '';
  trelloListId: string = '';
  trelloSending: boolean = false;

procedure LoadTrelloConfig;
var
  iniPath: string;
  ini: TIniFile;
begin
  if trelloConfigLoaded then
    exit;
  trelloConfigLoaded := true;
  iniPath := ExtractFilePath(ParamStr(0)) + 'servidor.ini';
  if not FileExists(iniPath) then
  begin
    trelloEnabled := false;
    exit;
  end;
  ini := TIniFile.Create(iniPath);
  try
    trelloEnabled := ini.ReadBool('trello', 'enabled', false);
    trelloToken := Trim(ini.ReadString('trello', 'token', ''));
    trelloListId := Trim(ini.ReadString('trello', 'list_id', ''));
  finally
    ini.Free;
  end;
  if (not trelloEnabled) or (trelloToken = '') or (trelloListId = '') then
    trelloEnabled := false;
end;

procedure SendToTrello(const S: string);
var
  hInternet: Pointer;
  hConnect: Pointer;
  hRequest: Pointer;
  headers: string;
  postData: string;
  cardName: string;
  ok: BOOL;
  statusCode: DWORD;
  statusLen: DWORD;
  idx: DWORD;

  function UrlEncode(const Value: string): string;
  const
    Hex: array[0..15] of Char = (
      '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
  var
    i: Integer;
    c: Byte;
  begin
    Result := '';
    for i := 1 to Length(Value) do
    begin
      c := Ord(Value[i]);
      if (c >= Ord('A')) and (c <= Ord('Z')) or
         (c >= Ord('a')) and (c <= Ord('z')) or
         (c >= Ord('0')) and (c <= Ord('9')) or
         (c = Ord('-')) or (c = Ord('_')) or (c = Ord('.')) or (c = Ord('~')) then
        Result := Result + Char(c)
      else if c = Ord(' ') then
        Result := Result + '+'
      else
        Result := Result + '%' + Hex[c shr 4] + Hex[c and $0F];
    end;
  end;
begin
  if trelloSending then
    exit;
  LoadTrelloConfig;
  if not trelloEnabled then
    exit;
  trelloSending := true;
  try
    cardName := 'ORBI Exception - ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    postData :=
      'key=' + UrlEncode(TrelloApiKey) +
      '&token=' + UrlEncode(trelloToken) +
      '&idList=' + UrlEncode(trelloListId) +
      '&name=' + UrlEncode(cardName) +
      '&desc=' + UrlEncode(S);
    hInternet := InternetOpen('ORBI-ExceptLog', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    if hInternet <> nil then
    begin
      hConnect := InternetConnect(hInternet, 'api.trello.com', INTERNET_DEFAULT_HTTPS_PORT,
        nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
      if hConnect <> nil then
      begin
        hRequest := HttpOpenRequest(hConnect, 'POST', '/1/cards', nil, nil, nil,
          INTERNET_FLAG_SECURE or INTERNET_FLAG_RELOAD or INTERNET_FLAG_NO_CACHE_WRITE, 0);
        if hRequest <> nil then
        begin
          headers := 'Content-Type: application/x-www-form-urlencoded';
          ok := HttpSendRequest(hRequest, PChar(headers), Length(headers),
            PChar(postData), Length(postData));
          if ok then
          begin
            statusCode := 0;
            statusLen := SizeOf(statusCode);
            idx := 0;
            if HttpQueryInfo(hRequest, HTTP_QUERY_STATUS_CODE or HTTP_QUERY_FLAG_NUMBER,
              @statusCode, statusLen, idx) then
            begin
              if statusCode <> 200 then
                OutputDebugString(PChar('Trello HTTP status: ' + IntToStr(statusCode)));
            end;
          end
          else
            OutputDebugString(PChar('Trello HttpSendRequest failed. GetLastError=' + IntToStr(GetLastError)));
          InternetCloseHandle(hRequest);
        end;
        InternetCloseHandle(hConnect);
      end;
      InternetCloseHandle(hInternet);
    end;
  except
    // swallow any errors to avoid recursive exception logging
  end;
  trelloSending := false;
end;

procedure MyRtlUnwind; stdcall;
var
  PER : PExceptionRecord;

  procedure DoIt;
  var             // This is done in a sub-routine because string variable is used and we want it finalized
    s : string;
    E: Exception;
    CS: TCallStack;
    t : TextFile;
  begin
    s:='--------------------------------------------------------'#13#10;
    s:=s+'New exception:'#13#10;

    if PER^.ExceptionFlags and 1=1 then      // This seems to be an indication of internal Delphi exception,
    begin                                    // thus we can access 'Exception' class
      try
        E := Exception( PER^.ExceptObject);
        if (E is Exception) then
          s:=s+'Delphi exception, type '+E.ClassName+', message: '+E.Message+#13#10;
      except
      end;
    end;

    FillCallStack(CS, 5);    // 5 last entries seem to be unusable
    s:=s+        'Exception code: '+inttostr( PER^.ExceptionCode)+#13#10+
                 'Exception flags: '+inttostr( PER^.ExceptionFlags)+#13#10+
                 'Number of parameters: '+inttostr( PER^.NumberParameters)+#13#10+
                 TextualDebugInfoForAddress(Cardinal(PER^.ExceptionAddress))+#13#10+
                 CallStackTextualRepresentation(CS, '')+#13#10;

    OutputDebugString( PChar( s));

    if writeToFile then
    begin
      try
        Assign( t, OutputFile);
        Append( t);
        Writeln( t, s);
        Close( t);
      except
      end;
    end;

    SendToTrello(s);
  end;
begin
  asm
    mov eax, dword ptr [EBP+8+13*4]         // magic numbers - works for Delphi 7
    mov PER, eax
  end;

  DoIt;
    
  asm
    mov esp, ebp
    pop ebp
    jmp oldRTLUnwindProc
  end;
end;

procedure InitExceptionLogging;
var
  f : file;
begin
  try
    Assign( f, OutputFile);
    Rewrite( f);
    Close( f);
    writeToFile := true;
  except
    writeToFile := false;
  end;
  oldRTLUnwindProc := RTLUnwindProc;
  RTLUnwindProc := @MyRtlUnwind;
end;

initialization
  InitExceptionLogging;
end.

