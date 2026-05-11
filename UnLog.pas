unit UnLog;

interface

uses
  Windows, StdCtrls, Controls, Mask, RxGIF, Classes,
  ExtCtrls, SysUtils, Variants, Graphics, Forms, Messages,
  Dialogs, Buttons, sPanel, sLabel, sCheckBox,
  sComboBox, IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRLOG = class(TForm)
    EDUSU: TMaskEdit;
    EDSEN: TMaskEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    Q_logon: TFDQuery;
    Image2: TImage;
    sPanel1: TsPanel;
    btok: TButton;
    sLabel1: TsLabel;
    cbServidor: TsComboBox;
    procedure EDUSUKeyPress(Sender: TObject; var Key: Char);
    procedure EDSENKeyPress(Sender: TObject; var Key: Char);
    procedure btokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbServidorChange(Sender: TObject);
    procedure cbServidorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
{$IFDEF ORBI}
    procedure habilita_campos(codusu: string);

{$ENDIF}
    procedure ListaServidores;
    function Logon(usuario, senha: string): boolean;
    { Private declarations }
  public
    procedure verifica_senha(login, Senha: ShortString);
    {    procedure teste;
      procedure monta_combo_lojas;}
      { Public declarations }
  end;

var
  FRLOG: TFRLOG;

implementation

uses{$IFDEF ORBI}UnDmConSis, UnPri, {$ENDIF}Un_dao, UnFun, Un_splash
{$IFDEF ORBICOLLETOR}, un_principal{$ENDIF};

{$R *.dfm}

procedure TFRLOG.verifica_senha(login: ShortString; Senha: ShortString);
var
  Query1: TFDQuery;
begin
  Query1 := TFDQuery.Create(self);
  with Query1 do
  begin
    close;
    SQL.clear;
    sql.add('select codusu, logusu, senusu, u.cod_empresa, e.tipo, nivel from tbusu u ' +
      'left join empresa e on e.cod_empresa=u.cod_empresa ' +
      'where logusu=:logusu and senusu = :senha');
    ParamByName('logusu').value := login;
    ParamByName('senha').value := senha;
    open;
  end;

end;
{$IFDEF ORBI}

procedure TFRLOG.habilita_campos(codusu: string);
begin
  FRLOG.Visible := false;
  FRPRI.habilita_menus(codusu);
  //  FRPRI.Show;
  //  if FRPRI=nil then
   /// FRPRI := TFRPRI.Create(Self);
   // FRLOG.Visible :=false;
   // FRPRI.ShowModal;

end;


{$ENDIF}

procedure TFRLOG.EDUSUKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFRLOG.EDSENKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    btok.Click;
    key := #0;
  end;
end;

function TFRLOG.Logon(usuario, senha: string): boolean;
begin
  with Q_logon do
  begin
    close;
    sql.Clear;
    sql.add('select u.codusu, u.logusu, u.nome, r.funcionario, u.email as email_usuario, u.cod_empresa as empresa, u.cod_representante, e.nom_empresa, e.nom_fantasia, e.fone, e.email, e.tipo, u.nivel from tbusu u ' +
      'left join representante r on r.id=u.cod_representante ' +
      'left join empresa e on e.cod_empresa=u.cod_empresa ' +
      'where senusu=' + QuotedStr(senha) + ' and logusu = ' + QuotedStr(usuario));
    open;
  end;

  if Q_logon.RecordCount <= 0 then
  begin
    fm_splash.hide;
    showmessage('SENHA OU LOGIN INCORRETO!');
    show;
    exit;
  end
  else
  begin
    try
{$IFDEF ORBICOLLETOR}
      frpri.cod_usuario := Q_logon.fieldbyname('codusu').AsString;
{$ENDIF}
{$IFDEF ORBI}
      fm_splash.ggProgress.Progress := 60;
      fm_splash.lbStatus.Caption := 'Carregando os Acessos ao Usuário...';
      fm_splash.Refresh;
      sleep(100);

      telemarketing := Q_logon.fieldbyname('funcionario').AsString = '4';
      cod_usuario := Q_logon.fieldbyname('codusu').AsString;
      nom_usuario := Q_logon.fieldbyname('nome').AsString;
      email_usuario := Q_logon.fieldbyname('email_usuario').AsString;
      cod_empresa := Q_logon.fieldbyname('empresa').AsString;
      nom_empresa := Q_logon.fieldbyname('nom_empresa').AsString;
      fantasia := Q_logon.fieldbyname('NOM_FANTASIA').AsString;
      fone_empresa := Q_logon.fieldbyname('fone').AsString;
      tipo_empresa := Q_logon.fieldbyname('tipo').AsString;
      email_empresa := Q_logon.fieldbyname('email').AsString;
      Tipo_usuario := Q_logon.fieldbyname('nivel').AsString;
      Representante_usuario := Q_logon.fieldbyname('cod_representante').AsString;

      habilita_campos(Q_logon.fieldbyname('codusu').asstring);
{$ENDIF}
    finally
      frpri.Show;
      modalresult := mrOK;
    end;
  end;

end;

procedure TFRLOG.btokClick(Sender: TObject);
var
  query1: TFDQuery;
begin
  hide;
{$IFDEF ORBI}
  fm_splash.show;
  fm_splash.ggProgress.Progress := 40;
  fm_splash.lbStatus.Caption := 'Conectando a Base de Dados...';
  fm_splash.Refresh;
  sleep(100);
{$ENDIF}

  dao.servidor_selecionado := cbServidor.ItemIndex;
  dao.conf_CN;

  dao.CN.Connected := True;
{$IFDEF ORBI}
  fm_splash.ggProgress.Progress := 50;
  fm_splash.lbStatus.Caption := 'Verificando Usuário Senha...';
  fm_splash.Refresh;
  sleep(100);
{$ENDIF}
  if not Logon(EDUSU.Text, EDSEN.Text) then
    exit;

end;

procedure TFRLOG.FormShow(Sender: TObject);
var
  titulo: string;
  app: integer;
begin
  modalresult := mrNone;
  dao.skinData1.Active := false;
  EDUSU.SetFocus;

  //  monta_combo_lojas;

  {  titulo:=Application.Title;
    app:= FindWindow(nil, pchar(titulo));
    if app <> 0 then
      showmessage('rodando')
    else
    showmessage('não rodando');}
end;

procedure TFRLOG.ListaServidores;
var
  Ini: TIniFile;
  Path, Usuario, Senha, ServidorPadrao : string;
  x, total_servidores: integer;
begin
  Path := extractFilePath(application.ExeName);
  Ini := TIniFile.Create(Path + 'servidor.ini');

  dao.skin := Ini.ReadString('config', 'skin', '');
  dao.skinPath := Ini.ReadString('config', 'skinPath', '');

  dao.skinData1.Active := false;
  if dao.skinPath <> '' then
  begin
    dao.skinData1.SkinDirectory := dao.skinPath;
    dao.skinData1.SkinName := dao.skin;
    dao.skinData1.Active := true;
  end;

  ServidorPadrao := Ini.ReadString('config', 'Nome', '');
  ServidorPadrao := Ini.ReadString('config', 'servidor_padrao', '');
  Usuario := Ini.ReadString('config', 'usuario', '');
  Senha := Ini.ReadString('config', 'senha', '');

  if not ((ServidorPadrao = '') or (Usuario = '') or (Senha = '')) then
  begin
    dao.servidor_selecionado := StrToInt(ServidorPadrao);
    dao.conf_CN;
    Logon(Usuario, Senha);
  end;

  total_servidores := strtoint(Ini.ReadString('config', 'quantidade', ''));

  cbServidor.Clear;
  for x := 0 to total_servidores - 1 do
    cbServidor.Items.Add(Ini.ReadString(inttostr(x), 'Nome', ''));
  cbServidor.ItemIndex := 0;
end;
(*
procedure TFRLOG.teste;
var
  titulo: string;
  app: integer;
begin
  titulo := Application.Title;
  app := FindWindow(nil, pchar('woietuw'));
  if app <> 0 then
    showmessage('rodando')
  else
    showmessage('não rodando');
end;

procedure TFRLOG.monta_combo_lojas;
begin
  {  dao.Geral1('select cod_empresa, nom_empresa from empresa');
    dao.Q1.First;
    CbLojas.Clear;

    while not(dao.Q1.eof) do
    begin
      CbLojas.AddItem(FMFUN.enchezero(dao.Q1.fieldbyname('cod_empresa').AsString,3)+'-'+ dao.Q1.fieldbyname('nom_empresa').AsString,CbLojas);
      dao.Q1.Next;

    end;
      }
end;
*)

procedure TFRLOG.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFRLOG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if modalresult <> mrOK then
  begin
    frpri.Free;
    Application.Terminate;
    exit;
  end;
end;

procedure TFRLOG.cbServidorChange(Sender: TObject);
begin
  dao.servidor_selecionado := cbServidor.ItemIndex;
end;

procedure TFRLOG.cbServidorClick(Sender: TObject);
begin
  dao.servidor_selecionado := cbServidor.ItemIndex;
end;

procedure TFRLOG.FormActivate(Sender: TObject);
begin
  ListaServidores;
end;

end.
