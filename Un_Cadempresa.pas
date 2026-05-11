unit Un_Cadempresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Jpeg,
  Dialogs, StdCtrls, Mask,  Buttons, ExtCtrls, ComCtrls, sPageControl,
  sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sEdit, sToolEdit, sMaskEdit, sCustomComboEdit, sComboEdit,
  ACBrBase, ACBrSocket, ACBrCEP, ExtDlgs, sSpeedButton, MaskUtils, 
  ACBrDFe, ACBrNFe, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_Empresa = class(TForm)
    q_empresa: TFDQuery;
    pg_empresa: TsPageControl;
    TabSheet1: TsTabSheet;
    TabSheet2: TsTabSheet;
    GroupBox1: TsGroupBox;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Label8: tsLabel;
    Lbnom_cidade: tsLabel;
    PrEndereco: TsEdit;
    PrCEP: TMaskEdit;
    PrFone: TMaskEdit;
    PrCod_Cidade: TsComboEdit;
    PrTipo: TComboBox;
    PrResponsavel: TsEdit;
    Premail: TsEdit;
    Label9: tsLabel;
    Prhomepage: TsEdit;
    Label10: tsLabel;
    Panel1: tsPanel;
    PrCod_Empresa: TsEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    PrNom_Empresa: TsEdit;
    TabSheet3: TsTabSheet;
    GB_contas: TsGroupBox;
    Label11: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    Label14: tsLabel;
    Label15: tsLabel;
    Label16: tsLabel;
    Prema_nom_apresentacao: TsEdit;
    Prema_smtp: TsEdit;
    Prema_login: TsEdit;
    Prema_senha: TMaskEdit;
    Prema_porta: TsEdit;
    Prema_autenticacao: tsCheckbox;
    Prema_email: TsEdit;
    GroupBox2: TsGroupBox;
    Prftp_host: TsEdit;
    Label17: tsLabel;
    Prftp_login: TsEdit;
    Label18: tsLabel;
    Label19: tsLabel;
    Prftp_senha: TMaskEdit;
    Prftp_porta: TsEdit;
    Label20: tsLabel;
    Prftp_habilita_transferencia: tsCheckbox;
    Prip_valido: TsEdit;
    sdf: tsLabel;
    PrCNPJ: TMaskEdit;
    Label21: tsLabel;
    Label22: tsLabel;
    Prcaminho_ftp: TsEdit;
    Label23: tsLabel;
    PrIE: TMaskEdit;
    tab_nfe: TsTabSheet;
    PrENQUADRADA_SIMPLES: TsCheckBox;
    sLabel1: TsLabel;
    PrNR_ENDERECO: TsEdit;
    sLabel2: TsLabel;
    PrComplemento: TsEdit;
    Panel2: TsPanel;
    sBitBtn6: TsBitBtn;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtCan: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    BtBuscaEnd: TsBitBtn;
    ACBrCEP1: TACBrCEP;
    sLabel3: TsLabel;
    PrBairro: TsEdit;
    sbImagem: TsSpeedButton;
    gbLogo: TsGroupBox;
    BtAnt: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    sLabel4: TsLabel;
    zzDescricao: TsEdit;
    BtExc_fot: TsBitBtn;
    BtCan_fot: TsBitBtn;
    BtGra_fot: TsBitBtn;
    BtAlt_fot: TsBitBtn;
    bt_Sel_foto: TsBitBtn;
    BtIns_fot: TsBitBtn;
    Panel7: TsPanel;
    Shape1: TShape;
    Logo: TImage;
    qrGravaLogo: TFDQuery;
    OpenPictureDialog1: TOpenPictureDialog;
    BtnBuscarCNPJ: TsBitBtn;
    PrIndustria: TsCheckBox;
    GroupBox3: TGroupBox;
    sLabel5: TsLabel;
    PrSERIE_CERTIFICADO: TsEdit;
    PrCERTIFICADO_VCTO: TsDateEdit;
    sbBuscaCert: TSpeedButton;
    ACBrNFe1: TACBrNFe;
    NfeContigencialb: TsLabel;
    PrNFECONTIGENCIA: TsCheckBox;
    PrConsumidorFinal: TsCheckBox;
    procedure PrCod_EmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure BtAltClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGraClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtNovClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrCod_CidadeButtonClick(Sender: TObject);
    procedure PrCod_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BtBuscaEndClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure sbImagemClick(Sender: TObject);
    procedure BtnBuscarCNPJClick(Sender: TObject);
    procedure sbBuscaCertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_empresa(id: string); //carrega a query q_fornecedor
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

  end;

var
  Fr_Empresa: TFr_Empresa;
  alterou_imagem: boolean;
  
implementation

uses Un_dao, UnPri, Un_localizar, UnFun;

{$R *.dfm}

function IsBmpFile(const AFile: string): Boolean;
var
  FS: TFileStream;
  Sig: Word;
begin
  Result := False;
  if not FileExists(AFile) then
    Exit;
  FS := TFileStream.Create(AFile, fmOpenRead or fmShareDenyNone);
  try
    if FS.Size < 2 then
      Exit;
    FS.ReadBuffer(Sig, SizeOf(Sig));
    Result := Sig = $4D42;
  finally
    FS.Free;
  end;
end;

function IsJpegFile(const AFile: string): Boolean;
var
  FS: TFileStream;
  B1, B2: Byte;
begin
  Result := False;
  if not FileExists(AFile) then
    Exit;
  FS := TFileStream.Create(AFile, fmOpenRead or fmShareDenyNone);
  try
    if FS.Size < 2 then
      Exit;
    FS.ReadBuffer(B1, 1);
    FS.ReadBuffer(B2, 1);
    Result := (B1 = $FF) and (B2 = $D8);
  finally
    FS.Free;
  end;
end;

function StreamToHex(AStream: TStream): string;
const
  Digits: array[0..15] of Char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
var
  Buffer: array[0..4095] of Byte;
  ReadCount, I, P: Integer;
begin
  SetLength(Result, 0);
  if AStream = nil then
    Exit;

  AStream.Position := 0;
  SetLength(Result, AStream.Size * 2);
  P := 1;

  while True do
  begin
    ReadCount := AStream.Read(Buffer, SizeOf(Buffer));
    if ReadCount = 0 then
      Break;

    for I := 0 to ReadCount - 1 do
    begin
      Result[P] := Digits[Buffer[I] shr 4];
      Inc(P);
      Result[P] := Digits[Buffer[I] and $0F];
      Inc(P);
    end;
  end;

  SetLength(Result, P - 1);
end;
procedure TFr_Empresa.PrCod_EmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    selectnext(sender as twincontrol, true, true);
    key := #0;
  end;
end;

procedure TFr_Empresa.BtAltClick(Sender: TObject);
begin
  try
    modo_insert := false;
    readonly_false('Pr');
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;

    PrNom_Empresa.SetFocus;

  except
  end;

end;

procedure TFr_Empresa.BtCanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      BtLocalizar.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('Pr');
        readonly_true('Pr');
      end
      else if not (modo_insert) then
      begin
        mostra_campos(q_empresa.fieldbyname('cod_empresa').AsString);
      end;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_Empresa.BtExcClick(Sender: TObject);
begin
  try
    if PRcod_cidade.Text = '' then
    begin
      showmessage('Não é possivel excluir esta Empresa por não ter Código!');
      BtNov.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Esta Empresa?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      //estou testando com as foreingKey exclui os registros filho..
      //dao.delete('cod_fornecedor',Q_fornecedor.fieldbyname('cod_fornecedor').AsString,'fornecedor_contato');

      //exclui os registros pai..
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.delete('cod_fornecedor', q_empresa.fieldbyname('cod_empresa').AsString, 'empresa');
      dao.cn.commit;

      dao.msg('Empresa excluida com sucesso!');
      limpa_campos('Pr');
    end;
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao Excluir a Empresa!' + #13 +
        e.message);
    end;
  end;

end;

procedure TFr_Empresa.BtGraClick(Sender: TObject);
var
  MS: TMemoryStream;
  Jpg: TJPEGImage;
  HexLogo: string;
begin
  try
    if PrNom_Empresa.Text = '' then
    begin
      dao.msg('O campo Nome da Empresa deve ser preenchido!');
      Exit;
    end;

    btnov.Enabled := True;
    btalt.Enabled := True;
    btgra.Enabled := False;
    btcan.Enabled := False;
    btexc.Enabled := True;
    BtLocalizar.Enabled := True;

    if modo_insert then
    begin
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        id := dao.insert('Pr', 'empresa', 'cod_empresa', Fr_Empresa, 'gen_empresa');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      PrCod_Empresa.Text := id;
      ativa_empresa(id);
    end
    else
    begin
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.update('empresa', 'cod_empresa', q_empresa.FieldByName('cod_empresa').AsString, 'Pr', Fr_Empresa);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      ativa_empresa(PrCod_Empresa.Text);
    end;

    if alterou_imagem then
    begin
      if Assigned(Logo.Picture.Graphic) and (not Logo.Picture.Graphic.Empty) then
      begin
        MS := TMemoryStream.Create;
        Jpg := TJPEGImage.Create;
        try
          Jpg.Assign(Logo.Picture.Graphic);
          Jpg.CompressionQuality := 60;
          Jpg.Compress;
          Jpg.SaveToStream(MS);

          // Evita picos absurdos de memoria no XE7 (hex + Unicode string)
          if MS.Size > 2 * 1024 * 1024 then
            raise Exception.Create('Imagem muito grande para gravacao. Reduza o tamanho do logo.');

          HexLogo := StreamToHex(MS);

          dao.Execsql('UPDATE empresa SET logo = decode(''' + HexLogo + ''', ''hex'') where cod_empresa = ' +
            IntToStr(StrToIntDef(PrCod_Empresa.Text, 0)));

          SetLength(HexLogo, 0);
          HexLogo := '';
        finally
          FreeAndNil(Jpg);
          FreeAndNil(MS);
        end;
      end;
    end;

    //mostra_campos('Pr');
  except
    on e: Exception do
      dao.msg('Houve um erro ao Gravar os dados da Empresa!' + #13 + e.Message);
  end;
end;

procedure TFr_Empresa.BtLocalizarClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa/Filial';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro da' + #13 + 'Empresa Matriz/Filial';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 3 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_empresa(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Empresa.BtNovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false('Pr');
    PrNom_Empresa.SetFocus;

    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;

    Limpa_campos('Pr');

  except

  end;

end;

procedure TFr_Empresa.ativa_empresa(id: string);
begin
  with q_empresa do
  begin
    close;
    sql.clear;
    sql.add('select a.COD_EMPRESA, a.NOM_EMPRESA, a.ENDERECO, a.CEP, a.FONE, a.COD_CIDADE, a.TIPO, ' +
      'a.RESPONSAVEL, a.EMAIL, a.HOMEPAGE, a.EMA_NOM_APRESENTACAO, a.EMA_EMAIL, a.EMA_SMTP, ' +
      'a.EMA_LOGIN, a.EMA_SENHA, a.EMA_PORTA, a.EMA_AUTENTICACAO, a.FTP_HOST, a.FTP_LOGIN, ' +
      'a.FTP_SENHA, a.FTP_PORTA, a.FTP_HABILITA_TRANSFERENCIA, a.IP_VALIDO, a.CAMINHO_FTP, ' +
      'a.TITULAR_CERTIFICADO, a.NOM_FANTASIA, a.COMPLEMENTO, a.BAIRRO, a.CNPJ, a.IE, a.IM, a.nfecontigencia, ' +
      'a.SERIE_CERTIFICADO, a.CERTIFICADO_VCTO,  a.NR_ENDERECO, a.PRE_CADASTRO, c.nom_cidade, c.uf, a.logo, '+
      'a.industria, A.ENQUADRADA_SIMPLES, a.consumidorfinal '+
      'from empresa a ' +
      'left join cidades c on c.cod_cidade = a.cod_cidade ' +
      'where a.cod_empresa=' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_Empresa.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear
      else if Components[i] is tsCheckbox then
        tsCheckbox(components[i]).Checked := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear;
      LbNom_cidade.Caption := '...';

    end;
  end;

end;

procedure TFr_Empresa.mostra_campos(prefixo: ShortString);
var
  i: integer;
  campo, campo1: string;
  MS: TMemoryStream;
  BlobStm: TStream;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
begin
  Screen.Cursor := crSQLWait;
  try
    Logo.Picture.Assign(nil);


  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_empresa.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsDateEdit(FindComponent(campo)).Date := q_empresa.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is tsCheckbox then
      begin
        campo := tsCheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_empresa.fieldbyname(campo1).AsString = 'S' then
          tsCheckbox(FindComponent(campo)).Checked := true
        else
          tsCheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_empresa.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_empresa.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TComboBox(FindComponent(campo)).ItemIndex := q_empresa.fieldbyname(campo1).AsInteger;
      end;

    end;
  end; //end do for

  LbNom_cidade.Caption := q_empresa.fieldbyname('nom_cidade').AsString;

  if not q_empresa.FieldByName('LOGO').IsNull then
  begin
    MS := TMemoryStream.Create;
    BlobStm := q_empresa.CreateBlobStream(q_empresa.FieldByName('LOGO'), bmRead);
    try
      MS.CopyFrom(BlobStm, 0);
      MS.Position := 0;

      Jpg := TJPEGImage.Create;
      try
        try
          Jpg.LoadFromStream(MS);
          Logo.Picture.Assign(Jpg);
        except
          MS.Position := 0;
          Bmp := TBitmap.Create;
          try
            try
              Bmp.LoadFromStream(MS);
              Logo.Picture.Assign(Bmp);
            except
              Logo.Picture.Assign(nil);
            end;
          finally
            Bmp.Free;
          end;
        end;
      finally
        Jpg.Free;
      end;
    finally
      BlobStm.Free;
      MS.Free;
    end;
  end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFr_Empresa.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_Empresa.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := True
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := True;
    end;
  end;

end;

procedure TFr_Empresa.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
end;

procedure TFr_Empresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    close;
  end;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_Empresa.PrCod_CidadeButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_empresa_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Empresa.PrCod_CidadeKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if key = #13 then
  begin
    if (PrCod_Cidade.Text = '') and (BtNov.Enabled = false) then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_empresa_cidade';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end
end;

procedure TFr_Empresa.BtBuscaEndClick(Sender: TObject);
begin
  if trim(prcep.Text) = '-' then
  begin
    showmessage('Informe o CEP!!');
    prcep.SetFocus;
    exit;
  end;

  ACBrCEP1.BuscarPorCEP(prcep.Text);


  prendereco.SetFocus;
end;

procedure TFr_Empresa.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  I: Integer;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    showmessage('Endereço não Encontrado.')
  else
  begin
    for I := 0 to ACBrCEP1.Enderecos.Count - 1 do
    begin
      with ACBrCEP1.Enderecos[I] do
      begin
        prendereco.Text := trim(Tipo_Logradouro + ' ' + Logradouro);
        prcomplemento.Text := Complemento;
        prbairro.Text := Bairro;

        dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where NOM_cidade = ' +
          QuotedStr(Municipio));

        if dao.q2.RecordCount > 0 then
        begin
          LbNom_cidade.Caption := dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.Q2.fieldbyname('UF').AsString;
          prcod_cidade.Text := dao.Q2.fieldbyname('cod_CIDADE').AsString;
        end
        else
        begin
          dao.msg('Registro não Encontrado!');
          PrCod_Cidade.Text := '';
          PrCod_Cidade.setfocus;
          LbNom_cidade.Caption := '...';
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TFr_Empresa.sbBuscaCertClick(Sender: TObject);
begin
  try
    ACBrNFe1.SSL.SelecionarCertificado;
  finally
    PrSERIE_CERTIFICADO.Text := ACBrNFe1.SSL.CertNumeroSerie;
    PrCERTIFICADO_VCTO.Date  := ACBrNFe1.SSL.CertDataVenc;
  end;

end;

procedure TFr_Empresa.sbImagemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    try
      if IsBmpFile(OpenPictureDialog1.FileName) or IsJpegFile(OpenPictureDialog1.FileName) then
      begin
        Logo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        alterou_imagem := True;
      end
      else
        dao.msg('Arquivo de imagem invalido. Use BMP ou JPG.');
    except
      on E: Exception do
        dao.msg('Nao foi possivel carregar a imagem selecionada: ' + E.Message);
    end;
  end;
end;

procedure TFr_Empresa.BtnBuscarCNPJClick(Sender: TObject);
var
  RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro, Cidade,
    UF, EmpresaTipo, Situacao: string;
begin
  FMFUN.BuscaDadosPorCNPJJson(PrCNPJ.Text, RazaoSocial, Fantasia, CEP, Endereco,
    Numero, Complemento, Bairro, Cidade, UF, EmpresaTipo, Situacao);

  PrNom_Empresa.Text := RazaoSocial;
  PrCep.Text := FMFUN.FormataCEP(CEP);
  PrEndereco.Text := Endereco;
  PrNR_ENDERECO.Text := Numero;
  PrComplemento.Text := Complemento;
  PrBairro.Text := Bairro;

  dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = ''' + UF + ''' AND NOM_cidade = ' +
    QuotedStr(Cidade));

  if dao.q2.RecordCount > 0 then
  begin
    LbNom_cidade.Caption := dao.Q2.FieldByName('NOM_CIDADE').AsString + '-'
      + dao.Q2.FieldByName('UF').AsString;
    PrCod_cidade.Text := dao.Q2.FieldByName('COD_CIDADE').AsString;
  end;
end;

end.












