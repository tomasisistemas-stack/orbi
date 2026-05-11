unit Un_categoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,    Grids,  ComCtrls, xmldom,
  XMLIntf, msxmldom, XMLDoc, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ExtDlgs, JPEG, sSpeedButton, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, idFTPCommon, sEdit, sToolEdit, SComboEdit,  sMaskEdit,
  sCustomComboEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_categoria = class(TForm)
    q_categoria: TFDQuery;
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
    PrID: TsEdit;
    PrCategoria: TsEdit;
    PrImagem: TsEdit;
    idHttpGeral: TIdHTTP;
    XMLGeral: TXMLDocument;
    sbImagem: TsSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox3: TsGroupBox;
    BtAnt: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    Label15: TsLabel;
    BtExc_fot: TsBitBtn;
    BtCan_fot: TsBitBtn;
    BtGra_fot: TsBitBtn;
    BtAlt_fot: TsBitBtn;
    bt_Sel_foto: TsBitBtn;
    BtIns_fot: TsBitBtn;
    Panel7: TsPanel;
    Shape1: TShape;
    Foto: TImage;
    qrGravaFoto: TFDQuery;
    Label22: TsLabel;
    LbCor: TsLabel;
    PrCor: TsComboEdit;
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
    procedure zzcod_TamanhoButtonClick(Sender: TObject);
    procedure PrImagemButtonClick(Sender: TObject);
    procedure sbImagemClick(Sender: TObject);
    procedure PrCorExit(Sender: TObject);
    procedure PrCorButtonClick(Sender: TObject);
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
    procedure ativa_categoria(id: string); //carrega a Q_cidade
    procedure AtualizaCategoriaWeb;
    procedure DeletaCategoriaWeb;
  end;

var
  Fr_categoria: TFr_categoria;
  comando_campos, comando_valor, condicao: string;
  alterou_imagem: boolean;
  Query: TFDQuery;

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
procedure TFr_categoria.btaltClick(Sender: TObject);
begin
  try
    if PrId.Text = '' then
    begin
      dao.msg('Selecione uma Categoria para Alterar!');
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
    PrImagem.Enabled := true;
    PrCategoria.SetFocus;

  except
  end;
end;

procedure TFr_categoria.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin

  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;
      PrImagem.Enabled := false;
      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else
        if modo_insert = false then
        begin
          mostra_campos(PrId.Text);
          readonly_true;
        end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_categoria.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if PrId.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Categoria por não ter Código!');
    PrCategoria.SetFocus;
    Exit;
  end;

  dao.Geral1('select id from subcategoria where categoria = ' + Prid.Text);
  if dao.Q1.RecordCount > 0 then
  begin
    showmessage('Não é possível Excluir a Categoria. Há subcategorias relacionados a mesma.');
    PrCategoria.SetFocus;
    Exit;
  end;


  if MessageDlg('Tem Certeza que Deseja Excluir Este Categoria?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DeletaCategoriaWeb;

    tipo := '3';
    try
      if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.delete('id', q_categoria.fieldbyname('id').AsString, 'categoria');
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    Limpa_campos;
  end;
 // mostra_campos('');

end;

procedure TFr_categoria.btgraClick(Sender: TObject);
var
  pasta: string;
  bmp, bmp_mini: TBitmap;
  nova_largura: integer;
  MS: TMemoryStream;
  Jpg: TJPEGImage;
  HexImagem: string;
begin
  try
    pasta := ExtractFilePath(Application.ExeName);
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    PrImagem.Enabled := false;
    if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'categoria', 'ID', Fr_categoria, 'gen_categoria');
      PrId.Text := id;
      btNov.setFocus;
    end
    else
      dao.update('categoria', 'id', PrID.Text, 'Pr', Fr_categoria);

    dao.cn.Commit;

    ativa_categoria(PrId.Text);
    readonly_true;

    if alterou_imagem then
    begin
      foto.Picture.SaveToFile(pasta + 'temp.jpg');

      fmfun.ConverterJPegParaBmp(pasta + 'temp.jpg');
      bmp := TBitmap.create;
      bmp_mini := TBitmap.create;

      Bmp.LoadFromFile(pasta + 'temp.bmp');

      nova_largura := trunc(Bmp.Width * (78 / Bmp.Height));

      FMFUN.SaveJPEGPictureFile(bmp, pasta, prImagem.text, 100);

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
        dao.Execsql('UPDATE categoria SET imagem_bd = decode(''' + HexImagem + ''', ''hex'') WHERE id = ' + PrId.Text);
        SetLength(HexImagem, 0);
        HexImagem := '';
      finally
        Jpg.Free;
        MS.Free;
      end;

      deletefile(pasta + 'temp.bmp');
    end;

    AtualizaCategoriaWeb;

    dm.FTPSite.disconnect;
    dm.FTPSite.Port := 21;
    dm.FTPSite.Connect;
    if dm.FTPSite.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPSite.Passive := true;
      dm.FTPSite.TransferType := ftBinary;
      dm.FTPSite.ChangeDir('/public/categoria');
      dm.FTPSite.put(pasta + prImagem.text, prImagem.text);
{      dm.FTPSite.ChangeDir('/categoria/mini');
      dm.FTPSite.put(pasta_produto + prImagem.text, prImagem.text);
 }
      dm.FTPSite.Quit;
      dm.FTPSite.disconnect;
    end;

  except
    dm.FTPSite.Quit;
    dm.FTPSite.disconnect;

    dao.cn.Rollback;
  end;
end;

procedure TFr_categoria.DeletaCategoriaWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=deleta_categoria');
  Consulta.WriteString('&id='+Prid.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFr_categoria.AtualizaCategoriaWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=categoria');
  Consulta.WriteString('&id='+Prid.Text);
  Consulta.WriteString('&categoria='+PrCategoria.Text);
  Consulta.WriteString('&imagem='+PrImagem.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;
end;


procedure TFr_categoria.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    PrCategoria.SetFocus;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    PrImagem.Enabled := true;
    Limpa_campos;

  except

  end;
end;

procedure TFr_categoria.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Categoria de Produtos';
  chamou_pesquisa := 'fr_categoria';
  chamou_form := 'fr_categoria';
  chamou_cadastro := 'Fr_categoria';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Categoria';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
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
    Fr_localizar.loc_categoria(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_categoria.PrIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;



procedure TFr_categoria.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TsComboEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_categoria.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := True;
  end;
end;


procedure TFr_categoria.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_categoria.mostra_campos(prefixo: string);
var
  campo, campo1, categoria_pasta, categoria_imagem: string; //campo tem o nome do  sem tirar as primeiras letras
                        //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin

  categoria_pasta := ExtractFilePath(Application.ExeName) + 'categoria_imagens\';
  ForceDirectories(categoria_pasta);
  categoria_imagem := categoria_pasta + 'temp.jpg';
  foto.Picture := nil;
  if not q_categoria.fieldbyname('IMAGEM_BD').IsNull then
  begin
    try
      TBlobField(q_categoria.fieldbyname('IMAGEM_BD')).SaveToFile(categoria_pasta + 'temp.bmp');
      foto.picture.Bitmap.LoadFromFile(categoria_pasta + 'temp.bmp');
      deletefile(categoria_pasta + 'temp.bmp');
    except
      TBlobField(q_categoria.fieldbyname('IMAGEM_BD')).SaveToFile(categoria_pasta + 'temp.jpg');
      fmfun.ConverterJPegParaBmp(categoria_imagem);
      foto.picture.Bitmap.LoadFromFile(categoria_pasta + 'temp.bmp');
      deletefile(categoria_pasta + 'temp.jpg');
      deletefile(categoria_pasta + 'temp.bmp');
    end;
    deletefile(categoria_imagem);

  end;
  alterou_imagem := false;


  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsEdit(FindComponent(campo)).Text := q_categoria.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsComboEdit(FindComponent(campo)).Text := q_categoria.fieldbyname(campo1).AsString;
    end

  end; //end do for
end;

procedure TFr_categoria.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_categoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_categoria.FormCloseQuery(Sender: TObject;
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

procedure TFr_categoria.ativa_categoria(id: string);
begin
  with q_categoria do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from categoria where id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_categoria.Button1Click(Sender: TObject);
begin
  if PrId.Text = '' then
  begin
    dao.msg('Você deve Gravar a Categoria que está cadastrando!');
    btgra.SetFocus;
    Exit;

  end;
end;


procedure TFr_categoria.zzcod_TamanhoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Tamanho';

  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_template_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + ' Tamanhos';
  Fr_localizar.BT_cadastro.Visible := true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

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

procedure TFr_categoria.PrImagemButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar NCM';
  chamou_pesquisa := 'fr_ncm';
  chamou_form := 'fr_grupo_ncm';
  chamou_cadastro := 'Fr_ncm';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'NCM';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

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

procedure TFr_categoria.sbImagemClick(Sender: TObject);
begin
  if OpenPictureDialog1.execute then
  begin
    PrImagem.Text := ExtractFileName(OpenPictureDialog1.filename);
    foto.picture.loadfromfile(OpenPictureDialog1.filename);
    alterou_imagem := true;
  end;
end;

procedure TFr_categoria.PrCorExit(Sender: TObject);
begin
  if trim(PrCor.Text) = '' then
    LbCor.Caption := '...';

  if (PrCor.Text <> '') then
  begin
    dao.Geral2('select id, cor from cores where id =' + QuotedStr(PrCor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.Q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCor.Text := '';
      PrCor.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_categoria.PrCorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cor';
  chamou_pesquisa := 'fr_cor';
  chamou_form := 'fr_categoria_cor';
  chamou_cadastro := 'Fr_cor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cores';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

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

end.








