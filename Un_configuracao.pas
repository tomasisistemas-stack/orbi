unit Un_configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask,
  ExtCtrls,  Buttons, comobj, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP, sPageControl, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sEdit, sToolEdit, sComboEdit, sSpeedButton, ExtDlgs,
  sComboBox, sButton, jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_configuracao = class(TForm)
    q_entrada: TFDQuery;
    q_produto: TFDQuery;
    q_entrada2: TFDQuery;
    q_venda1: TFDQuery;
    Q_configuracao: TFDQuery;
    Q1: TFDQuery;
    Panel1: tsPanel;
    Button1: TsButton;
    OpenPictureDialog1: TOpenPictureDialog;
    PageControl1: TsPageControl;
    TabSheet1: TsTabSheet;
    TabSheet2: TsTabSheet;
    Panel3: TsPanel;
    gbPlano: TsGroupBox;
    LbSALARIO_PLANO_CONTASN1: TsLabel;
    LbSALARIO_PLANO_CONTASN2: TsLabel;
    LbSALARIO_PLANO_CONTASN3: TsLabel;
    LbSALARIO_PLANO_CONTASN4: TsLabel;
    PrSALARIO_PLANO_CONTAS: TsComboEdit;
    gbForn: TsGroupBox;
    LbSALARIO_FORNECEDOR: TsLabel;
    PrSALARIO_FORNECEDOR: TsComboEdit;
    TabSheet3: TsTabSheet;
    Panel4: TsPanel;
    GroupBox4: TsGroupBox;
    LbCOMISSAO_PLANO_CONTASN1: TsLabel;
    LbCOMISSAO_PLANO_CONTASN2: TsLabel;
    LbCOMISSAO_PLANO_CONTASN3: TsLabel;
    LbCOMISSAO_PLANO_CONTASN4: TsLabel;
    PrCOMISSAO_PLANO_CONTAS: TsComboEdit;
    GroupBox5: TsGroupBox;
    LbCOMISSAO_FORNECEDOR: TsLabel;
    PrCOMISSAO_FORNECEDOR: TsComboEdit;
    tbPlr: TsTabSheet;
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    LbPLR_PLANO_CONTASN1: TsLabel;
    LbPLR_PLANO_CONTASN2: TsLabel;
    LbPLR_PLANO_CONTASN3: TsLabel;
    LbPLR_PLANO_CONTASN4: TsLabel;
    PrPLR_PLANO_CONTAS: TsComboEdit;
    sGroupBox2: TsGroupBox;
    LbPLR_FORNECEDOR: TsLabel;
    PrPLR_FORNECEDOR: TsComboEdit;
    sTabSheet1: TsTabSheet;
    sPanel2: TsPanel;
    sGroupBox3: TsGroupBox;
    LbVALES_PLANO_CONTASN1: TsLabel;
    LbVALES_PLANO_CONTASN2: TsLabel;
    LbVALES_PLANO_CONTASN3: TsLabel;
    LbVALES_PLANO_CONTASN4: TsLabel;
    PrVALE_PLANO_CONTAS: TsComboEdit;
    sGroupBox4: TsGroupBox;
    LbVALE_FORNECEDOR: TsLabel;
    PrVALE_FORNECEDOR: TsComboEdit;
    Panel2: TsPanel;
    gbCaminhoZebra: TsGroupBox;
    PrCaminho_Cod_Barras: TsEdit;
    gbSite: TsGroupBox;
    PrSite: TsEdit;
    gbUsuarioSite: TsGroupBox;
    PrUsuario_Site: TsEdit;
    gbSenhaSite: TsGroupBox;
    PrLogin_Site: TsEdit;
    gbLogo: TsGroupBox;
    BtAnt: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    Label15: TsLabel;
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
    sbImagem: TsSpeedButton;
    PrAgrupar_Pedidos: TsCheckBox;
    gbFTPTabletHost: TsGroupBox;
    PrFTP_TABLET_HOST: TsEdit;
    gbFTPTabletUsuario: TsGroupBox;
    PrFTP_TABLET_USER: TsEdit;
    gbFTPNFeHost: TsGroupBox;
    PrFTP_NFE_HOST: TsEdit;
    gbFTPNFeUsuario: TsGroupBox;
    PrFTP_NFE_USUARIO: TsEdit;
    gbFTPNFeSenha: TsGroupBox;
    PrFTP_NFE_SENHA: TsEdit;
    sTabSheet2: TsTabSheet;
    sGroupBox6: TsGroupBox;
    PrCaminho_Cod_Barras2: TsEdit;
    PrMOSTRA_MARCA_NO_PEDIDO: TsCheckBox;
    PrTINTA_BASE: TsCheckBox;
    PrATUALIZAR_PRECO_NA_ENTRADA: TsCheckBox;
    PrOBRIGATORIEDADE_PESO: TsCheckBox;
    Prcodigo_barras: TsCheckBox;
    sTabSheet3: TsTabSheet;
    PrFRENTE_CAIXA_UTILIZA: TsCheckBox;
    sGroupBox5: TsGroupBox;
    PrFRENTE_CAIXA_SERVIDOR_BD: TsEdit;
    Pr: TsGroupBox;
    PrFRENTE_CAIXA_BD: TsEdit;
    PrMODULO_VENDOR: TsCheckBox;
    gbVendorHostExterno: TsGroupBox;
    PrVENDOR_SERVIDOR_BD_EXTERNO: TsEdit;
    gbVendorLocalBD: TsGroupBox;
    PrVENDOR_BD: TsEdit;
    gbVendorHostInterno: TsGroupBox;
    PrVENDOR_SERVIDOR_BD_INTERNO: TsEdit;
    gbVendorFTPHostInterno: TsGroupBox;
    PrVENDOR_FTP_HOST: TsEdit;
    gbVendorFTPUsuario: TsGroupBox;
    PrVENDOR_FTP_USUARIO: TsEdit;
    gbVendorFTPSenha: TsGroupBox;
    PrVENDOR_FTP_SENHA: TsEdit;
    sGroupBox13: TsGroupBox;
    lbDecTercFornecedor: TsLabel;
    sGroupBox14: TsGroupBox;
    LbDEC_TERC_PLANO_CONTASN1: TsLabel;
    LbDEC_TERC_PLANO_CONTASN2: TsLabel;
    LbDEC_TERC_PLANO_CONTASN3: TsLabel;
    LbDEC_TERC_PLANO_CONTASN4: TsLabel;
    PrDEC_TERC_PLANO_CONTAS: TsComboEdit;
    PrDEC_TERC_fornecedor: TsComboEdit;
    PrREPRESENTACAO: TsCheckBox;
    PrTablet: TsCheckBox;
    gbVendorFTPHostExterno: TsGroupBox;
    PrVENDOR_FTP_HOST_EXTERNO: TsEdit;
    gbUsuarioFTPSite: TsGroupBox;
    PrFTP_SITE_Usuario: TsEdit;
    gbSenhaFTPSite: TsGroupBox;
    PrFTP_SITE_SENHA: TsEdit;
    sGroupBox7: TsGroupBox;
    PrCasasDecimais: TsComboBox;
    gbMalaDireta: TsGroupBox;
    PrMala_Direta: TsEdit;
    sTabSheet4: TsTabSheet;
    PrAVISO_ESTOQUE_MINIMO_CK: TsCheckBox;
    PrAVISO_CONTA_VENCIDA_CK: TsCheckBox;
    gbEstoqueMinimo: TsGroupBox;
    PrAVISO_ESTOQUE_MINIMO_EMAIL: TsEdit;
    gbContaVencida: TsGroupBox;
    PrAVISO_CONTA_VENCIDA_EMAIL1: TsEdit;
    gbModeloDesconto: TsGroupBox;
    PrModelo_Desconto: TsComboBox;
    sGroupBox9: TsGroupBox;
    PrFRENTE_CAIXA_EMPRESA_PADRAO: TsComboEdit;
    Lbempresa_padrao: TsLabel;
    sGroupBox10: TsGroupBox;
    sEdit1: TsEdit;
    sGroupBox11: TsGroupBox;
    sEdit2: TsEdit;
    PrNfe_Homologacao: TsCheckBox;
    PrAVISO_CONTA_VENCIDA_EMAIL2: TsEdit;
    PrAVISO_CONTA_VENCIDA_EMAIL3: TsEdit;
    gbtipo_etiqueta: TsGroupBox;
    PrTipo_Etiqueta: TsComboBox;
    PrIndustria: TsCheckBox;
    gbFTPTabletSenha: TsGroupBox;
    PrFTP_TABLET_SENHA: TsEdit;
    qrGravaLogo: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PrSALARIO_FORNECEDORExit(Sender: TObject);
    procedure PrCOMISSAO_FORNECEDORExit(Sender: TObject);
    procedure PrSALARIO_FORNECEDORButtonClick(Sender: TObject);
    procedure PrCOMISSAO_FORNECEDORButtonClick(Sender: TObject);
    procedure PrSALARIO_PLANO_CONTASButtonClick(Sender: TObject);
    procedure PrCOMISSAO_PLANO_CONTASButtonClick(Sender: TObject);
    procedure PrCOMISSAO_PLANO_CONTASExit(Sender: TObject);
    procedure PrSALARIO_PLANO_CONTASExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrPLR_PLANO_CONTASExit(Sender: TObject);
    procedure PrPLR_PLANO_CONTASButtonClick(Sender: TObject);
    procedure PrPLR_FORNECEDORExit(Sender: TObject);
    procedure PrPLR_FORNECEDORButtonClick(Sender: TObject);
    procedure PrVALE_FORNECEDORButtonClick(Sender: TObject);
    procedure PrVALE_FORNECEDORExit(Sender: TObject);
    procedure PrVALE_PLANO_CONTASButtonClick(Sender: TObject);
    procedure PrVALE_PLANO_CONTASExit(Sender: TObject);
    procedure sbImagemClick(Sender: TObject);
    procedure PrDEC_TERC_fornecedorButtonClick(Sender: TObject);
    procedure PrDEC_TERC_fornecedorExit(Sender: TObject);
    procedure PrDEC_TERC_PLANO_CONTASButtonClick(Sender: TObject);
    procedure PrDEC_TERC_PLANO_CONTASExit(Sender: TObject);
    procedure PrFRENTE_CAIXA_EMPRESA_PADRAOButtonClick(Sender: TObject);
    procedure PrFRENTE_CAIXA_EMPRESA_PADRAOExit(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
  private
    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_cp1(id: string);
    procedure ativa_configuracao(cod_conf: string);
    { Private declarations }
  public
    { Public declarations }
    modificado: Boolean;
    procedure trata_produto_para_filial(nom_arquivo: string);
    procedure ajusta_custo;
    procedure exporta_ocitane;
  end;

var
  Fr_configuracao: TFr_configuracao;
  alterou_imagem: boolean;

implementation

uses UnPri, Un_dao, Math, UnFun, Un_vendas_industria2, Un_montagem_carga,
  Un_importacao_dados, Un_localizar;

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


procedure TFr_configuracao.Button1Click(Sender: TObject);
var
  pasta: string;
  ms: TMemoryStream;
  Jpg: TJPEGImage;
  HexImagem: string;
begin
  pasta := ExtractFilePath(Application.ExeName);

  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.update('configuracao', 'cod_conf', '1', 'Pr', Fr_configuracao);
    dao.cn.Commit;
    showmessage('Dados Gravados com Sucesso!');
  except on e: Exception do
    begin
      dao.cn.Rollback;
      messagedlg('Houve um Problema ao Gravar as Configurações, maiores detalhes abaixo: ' + #13 + e.Message, mtError, [MbOk], 0);
    end;
  end;

  if alterou_imagem then
  begin
    if (Logo.Picture.Graphic = nil) or Logo.Picture.Graphic.Empty then
      Exit;

    ms := TMemoryStream.Create;
    Jpg := TJPEGImage.Create;
    try
      Jpg.Assign(Logo.Picture.Graphic);
      Jpg.CompressionQuality := 60;
      Jpg.Compress;
      Jpg.SaveToStream(ms);

      if ms.Size > 2 * 1024 * 1024 then
        raise Exception.Create('Imagem muito grande para gravacao. Reduza o tamanho da imagem.');

      HexImagem := StreamToHex(ms);
      dao.Execsql('UPDATE configuracao SET logo = decode(''' + HexImagem + ''', ''hex'') WHERE cod_conf = 1');
      SetLength(HexImagem, 0);
      HexImagem := '';
    finally
      Jpg.Free;
      ms.Free;
    end;
  end;

end;

procedure TFr_configuracao.FormShow(Sender: TObject);
begin

  alterou_imagem := false;
  modificado := false;
  ativa_configuracao('1');
  mostra_campos('Pr');


end;

procedure TFr_configuracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if modificado then
    dao.msg('PARA AS ALTERAÇÕES FUNCIONEM DEVE SER REINICIADO O SISTEMA!');
end;

procedure TFr_configuracao.trata_produto_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + 'i.txt');
    Reset(txt);
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    Readln(txt, linha);
    while not eof(txt) do
    begin
      dao.Geral1('select cod_produto from produto where cod_produto= ' + trim(copy(linha, 1, 6)));
      FORMATSETTINGS.DecimalSeparator := '.';
      if dao.Q1.RecordCount <= 0 then
      begin

      end
      else //update
      begin

        FORMATSETTINGS.DecimalSeparator := '.';

        cmd := 'update produto set custo=' + QuotedStr(trim(copy(linha, 255, 11)));

        cmd := cmd + ' where cod_produto =' + QuotedStr(trim(copy(linha, 1, 6)));

        //  ShowMessage(trim(copy(linha,255,11)));
        dao.Execsql(cmd);
        FORMATSETTINGS.DecimalSeparator := ',';

      end;
      ReadLn(txt, linha);
    end;
    CloseFile(txt);
    dao.cn.Commit;
    // end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de atulização!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_configuracao.ajusta_custo;
begin
end;

procedure TFr_configuracao.exporta_ocitane;
begin
end;

procedure TFr_configuracao.Button11Click(Sender: TObject);
begin
  dao.Geral1('select * from cod_barras');
  dao.Q1.First;
  while not (dao.Q1.Eof) do
  begin
    with dao.Q2S do
    begin
      close;
      sql.clear;
      sql.add('select * from cod_barras where cod_produto=' + QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString) + ' and cod_barras=' + QuotedStr(dao.q1.fieldbyname('cod_barras').AsString));
      open;
    end;

    if dao.Q2S.RecordCount <= 0 then
    begin
      with dao.Q1S do
      begin
        close;
        sql.Clear;
        sql.add('insert into cod_barras (id, cod_barras, cod_produto) values (' + QuotedStr(dao.Q1.fieldbyname('id').AsString) + ',' + QuotedStr(dao.Q1.fieldbyname('cod_barras').AsString) + ',' + QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString) + ')');
        ExecSQL;
      end;
    end;
    dao.Q1.Next;
  end;

end;

procedure TFr_configuracao.Button12Click(Sender: TObject);
var
  cmd: string;
begin

  dao.Configura_CN_NET('2');
  dao.Geral1_NET('select * from cliente');
  dao.q1_net.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    while not (dao.q1_net.Eof) do
    begin
      cmd := 'insert into cliente (COD_CLIENTE, NOM_CLIENTE, NOM_FANTASIA, ENDERECO,' +
        'COMPLEMENTO, PROXIMO, BAIRRO, CEP';

      if dao.q1_net.fieldbyname('cod_cidade').AsString <> '' then
        cmd := cmd + ', COD_CIDADE';

      cmd := cmd + ', TIP_PESSOA, TELEFONE, EMAIL, AVISO, CNPJ,IE, IM, CONTATO, LIMITE, CPF, RG, NATURALIDADE, EMPRESA,' +
        'DTA_ANIVERSARIO, OBSERVACOES, FAX, MANEQUIM, CALCADO, COR_PREFERIDA';

      if dao.q1_net.fieldbyname('contato_preferido').AsString <> '' then
        cmd := cmd + ', CONTATO_PREFERIDO';

      if dao.q1_net.fieldbyname('estilo').AsString <> '' then
        cmd := cmd + ', estilo';

      cmd := cmd + ', CONTATO_FONE, CONTATO_EMAIL, CONTATO_CORRESPONDENCIA) values (' +
        QuotedStr(dao.q1_net.fieldbyname('cod_cliente').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('nom_cliente').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('nom_fantasia').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('endereco').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('complemento').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('proximo').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('bairro').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('cep').AsString) + ',';

      if dao.q1_net.fieldbyname('cod_cidade').AsString <> '' then
        cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('cod_cidade').AsString) + ',';

      cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('tip_pessoa').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('telefone').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('email').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('aviso').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('cnpj').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('ie').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('im').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('contato').AsString) + ',' +
        QuotedStr('0') + ',' + QuotedStr(dao.q1_net.fieldbyname('cpf').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('rg').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('naturalidade').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('empresa').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('dta_aniversario').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('observacoes').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('fax').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('manequim').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('CALCADO').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('cor_preferida').AsString) + ',';

      if dao.q1_net.fieldbyname('contato_preferido').AsString <> '' then
        cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('contato_preferido').AsString) + ',';

      if dao.q1_net.fieldbyname('estilo').AsString <> '' then
        cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('estilo').AsString) + ',';

      cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('contato_fone').AsString) + ',' + QuotedStr(dao.q1_net.fieldbyname('contato_email').AsString) + ',' +
        QuotedStr(dao.q1_net.fieldbyname('contato_correspondencia').AsString) + ')';

      dao.Execsql(cmd);
      dao.q1_net.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;
end;

procedure TFr_configuracao.mostra_campos(prefixo: ShortString);
var
  i: integer;
  campo, campo1, pasta: string;
begin
  Screen.Cursor := crSQLWait;

  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := Q_configuracao.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := Q_configuracao.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := Q_configuracao.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TsComboBox then
      begin
        campo := TsComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsComboBox(FindComponent(campo)).ItemIndex := TsComboBox(FindComponent(campo)).IndexOf(Q_configuracao.fieldbyname(campo1).Asstring);
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex := Q_configuracao.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tsCheckbox then
      begin
        campo := tsCheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_configuracao.fieldbyname(campo1).AsString = 'S' then
          tsCheckbox(FindComponent(campo)).Checked := true
        else
          tsCheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_configuracao.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := Q_configuracao.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end; //end do for

  PrSALARIO_FORNECEDORexit(self);
  PrCOMISSAO_FORNECEDORexit(self);
  PrPLR_FORNECEDORexit(self);
  PrVALE_FORNECEDORExit(self);
  PrDEC_TERC_fornecedorExit(self);

  PrSALARIO_PLANO_CONTASexit(self);
  PrCOMISSAO_PLANO_CONTASexit(self);
  PrPLR_PLANO_CONTASexit(self);
  PrVALE_PLANO_CONTASExit(self);
  PrDEC_TERC_PLANO_CONTASExit(self);

  PrFRENTE_CAIXA_EMPRESA_PADRAOExit(Self);

  pasta := ExtractFilePath(Application.ExeName);

  if not Q_configuracao.fieldbyname('LOGO').IsNull then
  begin
    try
      TBlobField(Q_configuracao.fieldbyname('LOGO')).SaveToFile(pasta + 'temp.bmp');
      Logo.Picture.LoadFromFile(pasta + 'temp.bmp');
      DeleteFile(pasta + 'temp.bmp');
    except
      try
        TBlobField(Q_configuracao.fieldbyname('LOGO')).SaveToFile(pasta + 'temp.jpg');
        Logo.Picture.LoadFromFile(pasta + 'temp.jpg');
      finally
        DeleteFile(pasta + 'temp.jpg');
      end;
    end;
  end;

  Screen.Cursor := crDefault;
end;



procedure TFr_configuracao.ativa_cp1(id: string);
begin
  with Q_configuracao do
  begin
    close;
    sql.clear;
    sql.add('select * from configuracao ' +
      'where cod_conf = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_configuracao.Button3Click(Sender: TObject);
var
  id: string;
  cmd: string;
begin
  dao.Geral1_NET('select * from cliente'); //ler clientes da home

  dao.q1_net.first;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    while not (dao.q1_net.Eof) do //insere no cliente
    begin

      dao.Geral2('select cod_cliente, nom_cliente, cpf from cliente where nom_cliente =' + QuotedStr(dao.q1_net.fieldbyname('nom_cliente').AsString));
      if dao.Q2.RecordCount > 0 then
      begin
        //      if MessageDlg('foi encontrado um nome de cliente igual Deseja ignorar esse cliente '+dao.q1_net.fieldbyname('nom_cliente').AsString+'/'+dao.q1_net.fieldbyname('cpf').AsString, mtConfirmation, [mbYes, mbno],0) = mryes then
        //      begin
        dao.Execsql2('update cliente set id_antigo =' + QuotedStr(dao.q1_net.fieldbyname('cod_cliente').AsString) + ' where cod_cliente=' + QuotedStr(dao.Q2.fieldbyname('cod_cliente').AsString));
        dao.q1_net.Next;
        Continue;
        //      end;
      end;

      dao.Geral2('select cod_cliente, nom_cliente, cpf from cliente where nom_cliente =' + QuotedStr(dao.q1_net.fieldbyname('cpf').AsString));
      if dao.Q2.RecordCount > 0 then
      begin
        //      if MessageDlg('foi encontrado um CPF de cliente igual Deseja ignorar esse cliente '+dao.q1_net.fieldbyname('nom_cliente').AsString+'/'+dao.q1_net.fieldbyname('cpf').AsString, mtConfirmation, [mbYes, mbno],0) = mryes then
        //      begin
        dao.q1_net.Next;
        Continue;
        //      end;
      end;

      cmd := 'insert into cliente (';
      if dao.q1_net.FieldByName('nom_cliente').AsString <> '' then
        cmd := cmd + 'NOM_CLIENTE';
      if dao.q1_net.FieldByName('nom_fantasia').AsString <> '' then
        cmd := cmd + ',NOM_FANTASIA';
      if dao.q1_net.FieldByName('endereco').AsString <> '' then
        cmd := cmd + ',ENDERECO';
      if dao.q1_net.FieldByName('complemento').AsString <> '' then
        cmd := cmd + ',COMPLEMENTO';
      if dao.q1_net.FieldByName('proximo').AsString <> '' then
        cmd := cmd + ',PROXIMO';
      if dao.q1_net.FieldByName('bairro').AsString <> '' then
        cmd := cmd + ',BAIRRO';
      if dao.q1_net.FieldByName('cep').AsString <> '' then
        cmd := cmd + ',CEP';
      if dao.q1_net.FieldByName('cod_cidade').AsString <> '' then
        cmd := cmd + ',COD_CIDADE';
      if dao.q1_net.FieldByName('tip_pessoa').AsString <> '' then
        cmd := cmd + ',TIP_PESSOA';
      if dao.q1_net.FieldByName('telefone').AsString <> '' then
        cmd := cmd + ',TELEFONE';
      if dao.q1_net.FieldByName('email').AsString <> '' then
        cmd := cmd + ',EMAIL';
      if dao.q1_net.FieldByName('cnpj').AsString <> '' then
        cmd := cmd + ',CNPJ';
      if dao.q1_net.FieldByName('ie').AsString <> '' then
        cmd := cmd + ',IE';
      if dao.q1_net.FieldByName('cpf').AsString <> '' then
        cmd := cmd + ',CPF';
      if dao.q1_net.FieldByName('rg').AsString <> '' then
        cmd := cmd + ',RG';
      if dao.q1_net.FieldByName('empresa').AsString <> '' then
        cmd := cmd + ',EMPRESA';
      if dao.q1_net.FieldByName('dta_aniversario').AsString <> '' then
        cmd := cmd + ',DTA_ANIVERSARIO';
      if dao.q1_net.FieldByName('fax').AsString <> '' then
        cmd := cmd + ',FAX';
      if dao.q1_net.FieldByName('manequim').AsString <> '' then
        cmd := cmd + ',MANEQUIM';
      if dao.q1_net.FieldByName('calcado').AsString <> '' then
        cmd := cmd + ',CALCADO';
      if dao.q1_net.FieldByName('cor_preferida').AsString <> '' then
        cmd := cmd + ',COR_PREFERIDA';
      if dao.q1_net.FieldByName('contato_preferido').AsString <> '' then
        cmd := cmd + ',CONTATO_PREFERIDO';
      if dao.q1_net.FieldByName('estilo').AsString <> '' then
        cmd := cmd + ',ESTILO';
      if dao.q1_net.FieldByName('contato_fone').AsString <> '' then
        cmd := cmd + ',CONTATO_FONE';
      if dao.q1_net.FieldByName('contato_email').AsString <> '' then
        cmd := cmd + ',CONTATO_EMAIL';
      if dao.q1_net.FieldByName('contato_correspondencia').AsString <> '' then
        cmd := cmd + ',CONTATO_CORRESPONDENCIA';
      if dao.q1_net.FieldByName('cod_cliente').AsString <> '' then
        cmd := cmd + ',id_antigo';

      cmd := cmd + ') values (';

      if dao.q1_net.FieldByName('nom_cliente').AsString <> '' then
        cmd := cmd + QuotedStr(dao.q1_net.fieldbyname('nom_cliente').AsString);
      if dao.q1_net.FieldByName('nom_fantasia').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('nom_fantasia').AsString);
      if dao.q1_net.FieldByName('endereco').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('endereco').AsString);
      if dao.q1_net.FieldByName('complemento').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('complemento').AsString);
      if dao.q1_net.FieldByName('proximo').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('proximo').AsString);
      if dao.q1_net.FieldByName('bairro').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('bairro').AsString);
      if dao.q1_net.FieldByName('cep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('cep').AsString);
      if dao.q1_net.FieldByName('cod_cidade').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('cod_cidade').AsString);
      if dao.q1_net.FieldByName('tip_pessoa').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('tip_pessoa').AsString);
      if dao.q1_net.FieldByName('telefone').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('telefone').AsString);
      if dao.q1_net.FieldByName('email').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('email').AsString);
      if dao.q1_net.FieldByName('cnpj').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CNPJ').AsString);
      if dao.q1_net.FieldByName('ie').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('IE').AsString);
      if dao.q1_net.FieldByName('cpf').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CPF').AsString);
      if dao.q1_net.FieldByName('rg').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('RG').AsString);
      if dao.q1_net.FieldByName('empresa').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('EMPRESA').AsString);
      if dao.q1_net.FieldByName('dta_aniversario').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('DTA_ANIVERSARIO').AsString);
      if dao.q1_net.FieldByName('fax').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('FAX').AsString);
      if dao.q1_net.FieldByName('manequim').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('MANEQUIM').AsString);
      if dao.q1_net.FieldByName('calcado').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CALCADO').AsString);
      if dao.q1_net.FieldByName('cor_preferida').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('COR_PREFERIDA').AsString);
      if dao.q1_net.FieldByName('contato_preferido').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CONTATO_PREFERIDO').AsString);
      if dao.q1_net.FieldByName('estilo').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('ESTILO').AsString);
      if dao.q1_net.FieldByName('contato_fone').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CONTATO_FONE').AsString);
      if dao.q1_net.FieldByName('contato_email').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CONTATO_EMAIL').AsString);
      if dao.q1_net.FieldByName('contato_correspondencia').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('CONTATO_CORRESPONDENCIA').AsString);

      if dao.q1_net.FieldByName('cod_cliente').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.q1_net.fieldbyname('cod_cliente').AsString);

      cmd := cmd + ')';

      dao.Execsql(cmd);

      //    dao.Geral1('select gen_id(gen_cliente,0) from rdb$database');
      //    id:= dao.q1.fieldbyname('gen_id').AsString ;
      //    dao.Execsql_NET('update cliente set id_antigo = '+QuotedStr(id)+' where cod_cliente = '+ QuotedStr(dao.Q1.fieldbyname('cod_cliente').AsString));

      dao.q1_net.Next;

    end;
    dao.cn.Commit;
    dao.msg('Final da Atualização!');
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_configuracao.Button5Click(Sender: TObject);
begin
  with q_venda1 do
  begin
    close;
    sql.Clear;
    sql.add('select numdoc, cod_cliente from vendas1');
    open;
  end;

  q_venda1.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    while not (q_venda1.Eof) do
    begin
      dao.Execsql('update vendas2 set cod_cliente = ' + quotedStr(q_venda1.fieldbyname('cod_cliente').AsString) + ' where numdoc = ' + QuotedStr(q_venda1.fieldbyname('numdoc').AsString));
      q_venda1.Next;
    end;
    dao.cn.Commit;
    showmessage('final');
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_configuracao.ativa_configuracao(cod_conf: string);
begin
  with Q_configuracao do
  begin
    close;
    sql.clear;
    sql.add('select * from configuracao ' +
      'where cod_conf = ' + QuotedStr(cod_conf));
    open;
  end;

end;

procedure TFr_configuracao.Button6Click(Sender: TObject);
begin

  dao.Geral1('select * from vendas1');
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Q1.first;
    while not (dao.Q1.Eof) do
    begin
      dao.Geral2('select cod_cliente, id_antigo from cliente where id_antigo=' + QuotedStr(dao.Q1.fieldbyname('cod_cliente').AsString));
      if dao.Q2.RecordCount > 0 then
      begin
        if dao.Q2.FieldByName('id_antigo').AsString <> '' then
          dao.Execsql('update vendas1 set cod_cliente=' + QuotedStr(dao.Q2.fieldbyname('cod_cliente').AsString) + ' where numdoc=' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));
      end;
      dao.Q1.Next;

    end;
    dao.cn.Commit;
    dao.msg('final');
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_configuracao.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFr_montagem_carga, Fr_montagem_carga);
  Fr_montagem_carga.ShowModal;
end;

procedure TFr_configuracao.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrimportacao_dados, Frimportacao_dados);
  Frimportacao_dados.ShowModal;
end;

procedure TFr_configuracao.PrSALARIO_FORNECEDORExit(Sender: TObject);
begin

  if trim(PrSALARIO_FORNECEDOR.Text) = '' then
    LbSALARIO_FORNECEDOR.Caption := '...';

  if (PrSALARIO_FORNECEDOR.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(PrSALARIO_FORNECEDOR.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbSALARIO_FORNECEDOR.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrSALARIO_FORNECEDOR.Text := '';
      PrSALARIO_FORNECEDOR.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_configuracao.PrCOMISSAO_FORNECEDORExit(Sender: TObject);
begin
  if trim(PrCOMISSAO_FORNECEDOR.Text) = '' then
    LbCOMISSAO_FORNECEDOR.Caption := '...';

  if (PrCOMISSAO_FORNECEDOR.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(PrCOMISSAO_FORNECEDOR.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCOMISSAO_FORNECEDOR.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCOMISSAO_FORNECEDOR.Text := '';
      PrCOMISSAO_FORNECEDOR.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_configuracao.PrSALARIO_FORNECEDORButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_cfg_salario_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
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

procedure TFr_configuracao.PrCOMISSAO_FORNECEDORButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_cfg_comissao_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
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

procedure TFr_configuracao.PrSALARIO_PLANO_CONTASButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cfg_salario_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_configuracao.PrCOMISSAO_PLANO_CONTASButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cfg_comissao_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_configuracao.PrCOMISSAO_PLANO_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin

  if trim(PrCOMISSAO_PLANO_CONTAS.Text) = '' then
  begin
    LbCOMISSAO_PLANO_CONTASN1.Caption := '...';
    LbCOMISSAO_PLANO_CONTASN2.Caption := '...';
    LbCOMISSAO_PLANO_CONTASN3.Caption := '...';
    LbCOMISSAO_PLANO_CONTASN4.Caption := '...';
  end;

  if (PrCOMISSAO_PLANO_CONTAS.Text <> '') then
  begin
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC3.ID IN (''62'') and PC4.ID = ' + QuotedStr(PrCOMISSAO_PLANO_CONTAS.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      LbCOMISSAO_PLANO_CONTASN1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      LbCOMISSAO_PLANO_CONTASN2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      LbCOMISSAO_PLANO_CONTASN3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      LbCOMISSAO_PLANO_CONTASN4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCOMISSAO_PLANO_CONTAS.Text := '';
      PrCOMISSAO_PLANO_CONTAS.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.PrSALARIO_PLANO_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin

  if trim(PrSALARIO_PLANO_CONTAS.Text) = '' then
  begin
    LbSALARIO_PLANO_CONTASN1.Caption := '...';
    LbSALARIO_PLANO_CONTASN2.Caption := '...';
    LbSALARIO_PLANO_CONTASN3.Caption := '...';
    LbSALARIO_PLANO_CONTASN4.Caption := '...';
  end;

  if (PrSALARIO_PLANO_CONTAS.Text <> '') then
  begin
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC3.ID IN (''62'')  AND PC4.ID = ' + QuotedStr(PrSALARIO_PLANO_CONTAS.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      LbSALARIO_PLANO_CONTASN1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      LbSALARIO_PLANO_CONTASN2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      LbSALARIO_PLANO_CONTASN3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      LbSALARIO_PLANO_CONTASN4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrSALARIO_PLANO_CONTAS.Text := '';
      PrSALARIO_PLANO_CONTAS.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


procedure TFr_configuracao.PrPLR_PLANO_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(PrPLR_PLANO_CONTAS.Text) = '' then
  begin
    LbPLR_PLANO_CONTASN1.Caption := '...';
    LbPLR_PLANO_CONTASN2.Caption := '...';
    LbPLR_PLANO_CONTASN3.Caption := '...';
    LbPLR_PLANO_CONTASN4.Caption := '...';
  end;

  if (PrPLR_PLANO_CONTAS.Text <> '') then
  begin
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC3.ID IN (''62'') and PC4.ID = ' + QuotedStr(PrPLR_PLANO_CONTAS.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      LbPLR_PLANO_CONTASN1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      LbPLR_PLANO_CONTASN2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      LbPLR_PLANO_CONTASN3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      LbPLR_PLANO_CONTASN4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrPLR_PLANO_CONTAS.Text := '';
      PrPLR_PLANO_CONTAS.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.PrPLR_PLANO_CONTASButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cfg_plr_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_configuracao.PrPLR_FORNECEDORExit(Sender: TObject);
begin
  if trim(PrPLR_FORNECEDOR.Text) = '' then
    LbPLR_FORNECEDOR.Caption := '...';

  if (PrPLR_FORNECEDOR.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(PrPLR_FORNECEDOR.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbPLR_FORNECEDOR.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrPLR_FORNECEDOR.Text := '';
      PrPLR_FORNECEDOR.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.PrPLR_FORNECEDORButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_cfg_plr_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
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

procedure TFr_configuracao.PrVALE_FORNECEDORButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_cfg_vale_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
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

procedure TFr_configuracao.PrVALE_FORNECEDORExit(Sender: TObject);
begin
  if trim(PrVALE_FORNECEDOR.Text) = '' then
    LbVALE_FORNECEDOR.Caption := '...';

  if (PrVALE_FORNECEDOR.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(PrPLR_FORNECEDOR.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbVALE_FORNECEDOR.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrVALE_FORNECEDOR.Text := '';
      PrVALE_FORNECEDOR.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_configuracao.PrVALE_PLANO_CONTASButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cfg_vale_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_configuracao.PrVALE_PLANO_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(PrVALE_PLANO_CONTAS.Text) = '' then
  begin
    LbVALES_PLANO_CONTASN1.Caption := '...';
    LbVALES_PLANO_CONTASN2.Caption := '...';
    LbVALES_PLANO_CONTASN3.Caption := '...';
    LbVALES_PLANO_CONTASN4.Caption := '...';
  end;

  if (PrVALE_PLANO_CONTAS.Text <> '') then
  begin
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC3.ID IN (''62'') and PC4.ID = ' + QuotedStr(PrVALE_PLANO_CONTAS.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      LbVALES_PLANO_CONTASN1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      LbVALES_PLANO_CONTASN2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      LbVALES_PLANO_CONTASN3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      LbVALES_PLANO_CONTASN4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrVALE_PLANO_CONTAS.Text := '';
      PrVALE_PLANO_CONTAS.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.sbImagemClick(Sender: TObject);
begin
  if OpenPictureDialog1.execute then
  begin
    logo.picture.loadfromfile(OpenPictureDialog1.filename);
    alterou_imagem := true;
  end;
end;

procedure TFr_configuracao.PrDEC_TERC_fornecedorButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_cfg_dec_terc_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
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

procedure TFr_configuracao.PrDEC_TERC_fornecedorExit(Sender: TObject);
begin
  if trim(PrDEC_TERC_fornecedor.Text) = '' then
    lbDecTercFornecedor.Caption := '...';

  if (PrDEC_TERC_fornecedor.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(PrPLR_FORNECEDOR.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbDecTercFornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrDEC_TERC_fornecedor.Text := '';
      PrDEC_TERC_fornecedor.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFr_configuracao.PrDEC_TERC_PLANO_CONTASButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cfg_dec_terc_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_configuracao.PrDEC_TERC_PLANO_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(PrDEC_TERC_PLANO_CONTAS.Text) = '' then
  begin
    LbDEC_TERC_PLANO_CONTASN1.Caption := '...';
    LbDEC_TERC_PLANO_CONTASN2.Caption := '...';
    LbDEC_TERC_PLANO_CONTASN3.Caption := '...';
    LbDEC_TERC_PLANO_CONTASN4.Caption := '...';
  end;

  if (PrDEC_TERC_PLANO_CONTAS.Text <> '') then
  begin
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC3.ID IN (''62'') and PC4.ID = ' + QuotedStr(PrDEC_TERC_PLANO_CONTAS.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      LbDEC_TERC_PLANO_CONTASN1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      LbDEC_TERC_PLANO_CONTASN2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      LbDEC_TERC_PLANO_CONTASN3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      LbDEC_TERC_PLANO_CONTASN4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrDEC_TERC_PLANO_CONTAS.Text := '';
      PrDEC_TERC_PLANO_CONTAS.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.PrFRENTE_CAIXA_EMPRESA_PADRAOButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_configuracao_frente_caixa_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
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

procedure TFr_configuracao.PrFRENTE_CAIXA_EMPRESA_PADRAOExit(
  Sender: TObject);
begin
  empresa_faturar := '';
  if trim(PrFRENTE_CAIXA_EMPRESA_PADRAO.Text) = '' then
    Lbempresa_padrao.Caption := '...';

  if PrFRENTE_CAIXA_EMPRESA_PADRAO.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(PrFRENTE_CAIXA_EMPRESA_PADRAO.Text)) and
      (length(PrFRENTE_CAIXA_EMPRESA_PADRAO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrFRENTE_CAIXA_EMPRESA_PADRAO.SetFocus;
      exit;
    end;

    dao.Geral2('select e.nom_empresa||'' - ''||e.CNPJ AS NOM_EMPRESA, c.id as conta_corrente, e.ENQUADRADA_SIMPLES, e.logo From empresa e inner join conta_corrente c on (c.id_empresa = e.cod_empresa) where c.ativo = ''S'' and e.cod_empresa=' + QuotedStr(PrFRENTE_CAIXA_EMPRESA_PADRAO.Text));
    if dao.q2.RecordCount > 0 then
      Lbempresa_padrao.Caption := dao.Q2.fieldbyname('nom_empresa').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrFRENTE_CAIXA_EMPRESA_PADRAO.Text := '';
      PrFRENTE_CAIXA_EMPRESA_PADRAO.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_configuracao.sSpeedButton2Click(Sender: TObject);
begin
  if OpenPictureDialog1.execute then
  begin
    logo.picture.loadfromfile(OpenPictureDialog1.filename);
    alterou_imagem := true;
  end
end;

end.


















