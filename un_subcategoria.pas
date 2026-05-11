unit Un_subcategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Grids,  ComCtrls, xmldom,
  XMLIntf, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, msxmldom, XMLDoc, ExtDlgs, JPEG, Math, IdFTPCommon, sSpeedButton,
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, sEdit, sMaskEdit,
  sCustomComboEdit, sComboEdit,  IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdURI, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_subcategoria = class(TForm)
    q_template_grupo: TFDQuery;
    ds_template_grupo: TDataSource;
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Label2: tsLabel;
    Label22: tsLabel;
    PrID: TsEdit;
    PrSubCategoria: TsEdit;
    PrImagem: TsEdit;
    PrCategoria: TsComboEdit;
    LbCategoria: tsLabel;
    XMLGeral: TXMLDocument;
    GroupBox3: TsGroupBox;
    BtAnt: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    Label15: tsLabel;
    zzDescricao: TsEdit;
    BtExc_fot: TsBitBtn;
    BtCan_fot: TsBitBtn;
    BtGra_fot: TsBitBtn;
    BtAlt_fot: TsBitBtn;
    bt_Sel_foto: TsBitBtn;
    BtIns_fot: TsBitBtn;
    Panel7: tsPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    sbImagem: TsSpeedButton;
    qrGravaFoto: TFDQuery;
    Shape1: TShape;
    Foto: TImage;
    idHttpGeral: TIdHTTP;
    sLabel1: TsLabel;
    PrVideo: TsEdit;
    q_subcategoria: TFDQuery;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PrIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure PrCategoriaButtonClick(Sender: TObject);
    procedure PrCategoriaEnter(Sender: TObject);
    procedure PrCategoriaExit(Sender: TObject);
    procedure PrCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaSubCategoriaWeb;
    procedure DeletaSubCategoriaWeb;
    procedure sbImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    tipo: string;
    { Public declarations }
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure mostra_campos(prefixo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    procedure ativa_subcategoria(id: string); //carrega a Q_cidade
  end;

var
  Fr_subcategoria: TFr_subcategoria;
  comando_campos, comando_valor, condicao: string;
  Query: TFDQuery;
  alterou_imagem: boolean;

implementation

uses UnPri, Un_dao, Un_localizar, unfun, un_ncm, Un_dm;

{$R *.dfm}

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
procedure TFr_subcategoria.btaltClick(Sender: TObject);
begin
  try
    if PrId.Text = '' then
    begin
      dao.msg('Selecione uma SubCategoria para Alterar!');
      exit;
    end;

    modo_insert := false;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    PrCategoria.Enabled := true;
    PrSubCategoria.SetFocus;

  except
  end;
end;

procedure TFr_subcategoria.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin

  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes,
      mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;
      PrCategoria.Enabled := false;
      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        mostra_campos(PrID.Text);
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_subcategoria.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir esta SubCategoria por não ter Código!');
    PrSubCategoria.SetFocus;
    Exit;
  end;

  dao.Geral1('select cod_produto from produto where subcategoria = ' + Prid.Text);
  if dao.Q1.RecordCount > 0 then
  begin
    showmessage('Não é possível Excluir a SubCategoria. Há produtos relacionados a mesma.');
    PrSubCategoria.SetFocus;
    Exit;
  end;


  if MessageDlg('Tem Certeza que Deseja Excluir Esta SubCategoria?',
    mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DeletaSubCategoriaWeb;

    tipo := '3';
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', prid.Text, 'subcategoria');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
      exit;
    end;
    Limpa_campos;
  end;
  // mostra_campos('');

end;

procedure TFr_subcategoria.btgraClick(Sender: TObject);
var
  pasta_produto, pasta_produto_mini: string;
  bmp, bmp_mini: TBitmap;
  nova_largura: integer;
  MS: TMemoryStream;
  Jpg: TJPEGImage;
  HexImagem: string;
begin

  if PrCategoria.Text = '' then
  begin
    dao.msg('O campo Categoria deve ser Informado!');
    Prcategoria.SetFocus;
    Exit;
  end;

  try
    pasta_produto := ExtractFilePath(Application.ExeName) + 'produto_imagens\';
    pasta_produto_mini := ExtractFilePath(Application.ExeName) + 'produto_imagens_mini\';
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    PrCategoria.Enabled := false;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if modo_insert then
      begin
        id := dao.insert('Pr', 'subcategoria', 'ID', Fr_subcategoria,
          'gen_subcategoria');
        PrId.Text := id;
        ativa_subcategoria(id);
        btNov.setFocus;
      end
      else
        dao.update('subcategoria', 'ID', prid.text, 'Pr', Fr_subcategoria);

      dao.cn.Commit;
    except
      dao.cn.Rollback;
      exit;
    end;

    readonly_true;

    if alterou_imagem then
    begin
      ForceDirectories(pasta_produto);
      ForceDirectories(pasta_produto_mini);
      bmp := TBitmap.create;
      bmp_mini := TBitmap.create;
      try
        foto.Picture.SaveToFile(pasta_produto + 'temp.jpg');
        fmfun.ConverterJPegParaBmp(pasta_produto + 'temp.jpg');
      except
        foto.Picture.SaveToFile(pasta_produto + 'temp.bmp');
      end;
      Bmp.LoadFromFile(pasta_produto + 'temp.bmp');
      nova_largura := trunc(Bmp.Width * (78 / Bmp.Height));

      fmfun.QualityResizeBitmap(Bmp, bmp_mini, nova_largura, 78);
      bmp_mini.SaveToFile(pasta_produto_mini + 'temp.bmp');

      FMFUN.SaveJPEGPictureFile(bmp_mini, pasta_produto_mini, prImagem.text, 100);
      FMFUN.SaveJPEGPictureFile(bmp, pasta_produto, prImagem.text, 100);

      bmp_mini.Free;
      bmp.Free;

      MS := TMemoryStream.Create;
      Jpg := TJPEGImage.Create;
      try
        Jpg.Assign(foto.Picture.Graphic);
        Jpg.CompressionQuality := 60;
        Jpg.Compress;
        Jpg.SaveToStream(MS);

        if MS.Size > 2 * 1024 * 1024 then
          raise Exception.Create('Imagem muito grande para gravacao. Reduza o tamanho da imagem.');

        HexImagem := StreamToHex(MS);
        dao.Execsql('UPDATE subcategoria SET imagem_bd = decode(''' + HexImagem + ''', ''hex'') WHERE id = ' + PrId.Text);
        SetLength(HexImagem, 0);
        HexImagem := '';
      finally
        Jpg.Free;
        MS.Free;
      end;

      deletefile(pasta_produto + 'temp.bmp');
      deletefile(pasta_produto_mini + 'temp.bmp');

      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('UPDATE SUBCATEGORIA SET ALTEROU_IMAGEM = ''1'' WHERE ID = ' + PrId.Text);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
        exit;
      end;


    end;

    AtualizaSubCategoriaWeb;

    dm.FTPSite.disconnect;
    dm.FTPSite.Port := 21;
    dm.FTPSite.Connect;
    if dm.FTPSite.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPSite.Passive := true;
      dm.FTPSite.TransferType := ftASCII;
      dm.FTPSite.ChangeDir('/public/produto');
      dm.FTPSite.put(pasta_produto + prImagem.text, prImagem.text);
      dm.FTPSite.ChangeDir('/public/produto/mini');
      dm.FTPSite.put(pasta_produto_mini + prImagem.text, prImagem.text);

      dm.FTPSite.Quit;
      dm.FTPSite.disconnect;
    end;
  except
    dm.FTPSite.Quit;
    dm.FTPSite.disconnect;

    ativa_subcategoria(prid.text);
    mostra_campos(PrID.Text);
  end;
end;

procedure TFr_subcategoria.DeletaSubCategoriaWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=deleta_subcategoria');
  Consulta.WriteString('&id='+Prid.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_subcategoria.AtualizaSubCategoriaWeb;
var
  Consulta : TStringStream;
begin

  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=subcategoria');
  Consulta.WriteString('&id='+Prid.Text);
  Consulta.WriteString('&subcategoria='+PrSubCategoria.Text);
  Consulta.WriteString('&imagem='+PrImagem.Text);
  Consulta.WriteString('&categoria='+PrCategoria.Text);
  Consulta.WriteString('&video='+PrVideo.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_subcategoria.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    PrSubCategoria.SetFocus;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    PrCategoria.Enabled := true;
    Limpa_campos;

  except

  end;
end;

procedure TFr_subcategoria.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar SubCategoria';
  chamou_pesquisa := 'fr_subcategoria';
  chamou_form := 'fr_subcategoria';
  chamou_cadastro := 'fr_subcategoria';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
    'SubCategoria de Produtos';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Categoria';

  for i := 0 to 2 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex :=
      Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_subcategoria_produto(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_subcategoria.PrIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_subcategoria.Limpa_campos;
var
  i: integer;
begin
  foto.Picture := nil;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsComboEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_subcategoria.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

end;

procedure TFr_subcategoria.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_subcategoria.mostra_campos(prefixo: string);
var
  campo, campo1, produto_pasta, produto_imagem: string; //campo tem o nome do  sem tirar as primeiras letras
  //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
  Bmp: TBitmap;
  jpeg: TJPEGImage;
begin
  produto_pasta := ExtractFilePath(Application.ExeName) + 'produto_imagens\';
  ForceDirectories(produto_pasta);
  produto_imagem := produto_pasta + 'temp.jpg';
  foto.Picture := nil;
  if not q_subcategoria.fieldbyname('IMAGEM_BD').IsNull then
  begin
    try
      TBlobField(q_subcategoria.fieldbyname('IMAGEM_BD')).SaveToFile(produto_pasta + 'temp.bmp');
      //    fmfun.ConverterJPegParaBmp(produto_imagem);
      foto.picture.Bitmap.LoadFromFile(produto_pasta + 'temp.bmp');
      deletefile(produto_pasta + 'temp.bmp');
    except
      TBlobField(q_subcategoria.fieldbyname('IMAGEM_BD')).SaveToFile(produto_pasta + 'temp.jpg');
      fmfun.ConverterJPegParaBmp(produto_imagem);
      foto.picture.Bitmap.LoadFromFile(produto_pasta + 'temp.bmp');
      deletefile(produto_pasta + 'temp.jpg');
      deletefile(produto_pasta + 'temp.bmp');
    end;
    deletefile(produto_imagem);

  end;
  alterou_imagem := false;

  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsEdit(FindComponent(campo)).Text :=
          q_subcategoria.fieldbyname(campo1).AsString;
      end;
      if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsComboEdit(FindComponent(campo)).Text :=
          q_subcategoria.fieldbyname(campo1).AsString;
      end
    end;
  end; //end do for
  PrCategoriaExit(self);
end;

procedure TFr_subcategoria.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_subcategoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure TFr_subcategoria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_subcategoria.ativa_subcategoria(id: string);
begin
  with q_subcategoria do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from subcategoria where id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_subcategoria.Button1Click(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('Você deve Gravar a SubCategoria que está cadastrando!');
    btgra.SetFocus;
    Exit;

  end;
end;

procedure TFr_subcategoria.PrCategoriaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Categoria';
  chamou_pesquisa := 'fr_categoria';
  chamou_form := 'fr_subcategoria_categoria';
  chamou_cadastro := 'Fr_categoria';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Categoria';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome';

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

procedure TFr_subcategoria.PrCategoriaEnter(Sender: TObject);
begin
  PrCategoria.Text := FMFUN.TratarCodigoNCM(PrCategoria.Text, 1);
end;

procedure TFr_subcategoria.PrCategoriaExit(Sender: TObject);
begin
  if trim(PrCategoria.Text) = '' then
    LbCategoria.Caption := '...';

  if (PrCategoria.Text <> '') then
  begin
    dao.Geral2('select id, categoria from categoria where id =' +
      QuotedStr(PrCategoria.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCategoria.Caption := dao.Q2.fieldbyname('categoria').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCategoria.Text := '';
      PrCategoria.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFr_subcategoria.PrCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;


procedure TFr_subcategoria.sbImagemClick(Sender: TObject);
var
  arquivo, arquivo_mini: string;
begin
  if OpenPictureDialog1.execute then
  begin
    PrImagem.Text := ExtractFileName(OpenPictureDialog1.filename);
    foto.picture.loadfromfile(OpenPictureDialog1.filename);
    alterou_imagem := true;
  end;
end;

end.


