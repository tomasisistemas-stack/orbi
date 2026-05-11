unit Un_transferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Mask, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit, sMaskEdit, sCustomComboEdit,
  sTooledit, sComboEdit;

type
  TFr_transferencia = class(TForm)
    sb_transferencia: TStatusBar;
    Panel1: tsPanel;
    im_download: TImage;
    im_connect: TImage;
    procedure bt_transfereClick(Sender: TObject);
    procedure Prcod_empresa1ButtonClick(Sender: TObject);
    procedure Prcod_empresa1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Prcod_empresa2ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrdeKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresa1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure envia_dados; //envia para filial
    procedure recebe_dados; //recebe dados da matriz

    procedure monta_arquivo_envio(nom_arquivo: string; cod_prodini, cod_prodfin: string);

    procedure Monta_produto_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string); //monta o arquivo de produto para enviar ao ftp da filial
    procedure Monta_grade_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string); //monta o arquivo de grade para enviar ao ftp da filial
    procedure Monta_cod_barras_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string); //monta o arquivo de cod Barras para enviar ao ftp da filial
    procedure Monta_cor_para_filial(nom_arquivo: string); //monta o arquivo de COR para enviar ao ftp da filial
    procedure Monta_tamanho_para_filial(nom_arquivo: string); //monta o arquivo de COR para enviar ao ftp da filial
    procedure Monta_colecao_para_filial(nom_arquivo: string); //monta o arquivo de COR para enviar ao ftp da filial

    procedure Monta_usuario_para_filial(nom_arquivo: string); //Monta o arquivo com os dados do cadastro do usuário
    procedure Monta_romaneio1_para_filial(nom_arquivo, empresa_destino: string); //Monta o arquivo com os dados do Romaneio feito na matriz para filial
    procedure Monta_romaneio2_para_filial(nom_arquivo, empresa_destino: string); //Monta o arquivo com os dados do Romaneio feito na matriz para filial

    procedure Monta_venda1_para_filial(nom_arquivo: string); //Monta o arquivo com os dados de Venda feito na matriz para filial
    procedure Monta_venda2_para_filial(nom_arquivo: string); //Monta o arquivo com os dados de Venda feito na matriz para filial

    procedure monta_Usuarios_filial(nom_arquivos: string); //Monta o arquivo com os dados do Romaneio feito na matriz para filial
    procedure trata_lote_para_filial(nom_arquivo: string); //trata os arquivos de cadastro e grava na base de dados da filial

    procedure trata_produto_para_filial(nom_arquivo: string); //trata o arquivo de produto e grava na base de dados da Filial
    procedure trata_grade_para_filial(nom_arquivo: string); //trata o arquivo de grade e grava na base de dados da Filial
    procedure trata_cod_barras_para_filial(nom_arquivo: string); //trata o arquivo de cod barras e grava na base de dados da Filial
    procedure trata_cor_para_filial(nom_arquivo: string); //trata o arquivo de cod barras e grava na base de dados da Filial
    procedure trata_tamanho_para_filial(nom_arquivo: string); //trata o arquivo de cod barras e grava na base de dados da Filial
    procedure trata_colecao_para_filial(nom_arquivo: string); //trata o arquivo de cod barras e grava na base de dados da Filial
    procedure trata_usuario_para_filial(nom_arquivo: string); //trata o arquivo de usuarios e grava na base de dados da Filial

    procedure trata_romaneio_para_filial(nom_arquivo: string; nom_arquivo2: string);

    procedure trata_romaneio1_para_filial(nom_arquivo: string; nom_arquivo2: string);
    procedure trata_romaneio2_para_filial(nom_arquivo: string);

    procedure trata_venda_para_filial(nom_arquivo: string; nom_arquivo2: string);

    procedure cria_arq_txt;
    function AjustaStr(str: string; tam: Integer): string;
    procedure Trata_arq_produtos(nom_arquivo: string);

    procedure envia_dados_internet_filial(cod_empresa: string); //envia os dados para as filiais utilizando a conexão direta de internet
    procedure envia_dados_internet_matriz(cod_empresa: string); //envia os dados para as filiais utilizando a conexão direta de internet
  end;

var
  Fr_transferencia: TFr_transferencia;

implementation

uses Un_dao, UnFun, UnPri, Math, Un_localizar;

{$R *.dfm}

procedure TFr_transferencia.cria_arq_txt;
begin

end;

function TFr_transferencia.AjustaStr(str: string; tam: Integer): string;
begin
  while Length(str) < tam do
    str := str + ' ';

  if Length(str) > tam then
    str := Copy(str, 1, tam);

  Result := str;
end;

procedure TFr_transferencia.bt_transfereClick(Sender: TObject);
begin
  if Prconexao_internet.Checked then
  begin
    try
      Lbaguarde.Visible := true;
      if tipo_transferencia = 'envia_filial' then
        envia_dados_internet_filial(Prcod_empresa1.Text)
      else if tipo_transferencia = 'envia_matriz' then
        envia_dados_internet_matriz(Prcod_empresa1.Text);

      Lbaguarde.Visible := false;
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);
        pb.Position := 0;
        dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario, 'Erro ao executar o procedimento Geral2 módulo Dao', 'claudioplasfan@gmail.com', '', '', '');

      end;
    end;

  end
  else
  begin
    pb.Position := 0;
    if tipo_transferencia = 'envia_dados' then
    begin
      FRPRI.configura_ftp('1');
      envia_dados;
    end
    else if tipo_transferencia = 'recebe_dados' then
    begin
      FRPRI.configura_ftp('1');
      recebe_dados;
    end;
  end;
end;

procedure TFr_transferencia.Monta_produto_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO PRODUTO

  dao.Geral1('select * from produto ' +
    'where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin) +
    ' order by cod_produto');
  dao.Q1.First;
  formatsettings.DecimalSeparator := '.';
  while not dao.Q1.Eof do
  begin
    if dao.Q1.FieldByName('cod_produto').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 6))
    else
      Write(txt, ajustastr(' ', 6));

    Write(txt, '|');
    //if dao.Q1.FieldByName('cod_produto').AsString = '2073' then
    //    showmessage('chegou');

    Write(txt, ajustastr(dao.Q1.FieldByName('nom_produto').AsString, 50));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_grupo').AsString, 4));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('unidade').AsString, 1));

    Write(txt, '|');

    if dao.Q1.FieldByName('peso').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('peso').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('ref_fabrica').AsString, 15));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_prateleira').AsString, 10));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('etiqueta_lin1').AsString, 25));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('etiqueta_lin2').AsString, 25));

    Write(txt, '|');

    Write(txt, ajustastr('', 80)); //nesse espaço vazio era o observação do produto mas resolvi criar um metodo separado só para ele

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('origem_mercadoria').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('trib_icms').AsString, 2));

    Write(txt, '|');

    if dao.Q1.FieldByName('ipi').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('ipi').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    if dao.Q1.FieldByName('custo').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    if dao.Q1.FieldByName('impostos').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('impostos').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    if dao.Q1.FieldByName('geral').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('geral').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    if dao.Q1.FieldByName('lucro').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('lucro').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('avisar_prod_desat').AsString, 2));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('qtd_dias_desat').AsString, 10));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('dta_ult_atualizacao').AsString, 10));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo_medio').AsFloat));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo_calculado').AsFloat));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo_atualizado').AsFloat));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('qtd_embalagem').AsFloat));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('preco_venda').AsFloat));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('status').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('grade').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_colecao').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('id_marca').AsString, 3));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('fornecedor_principal').AsString, 4));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  formatsettings.DecimalSeparator := ',';
  CloseFile(txt);
end;

procedure TFr_transferencia.Monta_grade_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string);
var
  txt: TextFile;
  linha: string;
begin

  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO GRADE
  dao.Geral1('select * from grade ' +
    'where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin));

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));

    Write(txt, ajustastr(dao.Q1.FieldByName('id_cor').AsString, 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id_tamanho').AsString, 3));

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 10));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  CloseFile(txt);

end;

procedure TFr_transferencia.Monta_cod_barras_para_filial(nom_arquivo: string; cod_empresa: string; cod_prodini, cod_prodfin: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO GRADE
  dao.Geral1('select a.ID, a.COD_BARRAS, a.COD_PRODUTO, a.DATA from cod_barras a ' +
    'where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin));

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_barras').AsString, 25));
    Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 10));

    Write(txt, ajustastr(dao.Q1.FieldByName('data').AsString, 10));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  CloseFile(txt);

end;

procedure TFr_transferencia.Trata_arq_produtos(nom_arquivo: string);
var
  arq: TextFile;
  linha: string;
  cod: string;
begin

end;

procedure TFr_transferencia.envia_dados;
var
  i, j, qtd_empresas: integer;
begin
  sb_transferencia.Panels[0].Text := 'Conectando.....';
  Application.ProcessMessages;
  try
    frpri.ftp.Connect;
  except
    dao.msg('Servidor de FTP desconectou-se' + #13 + 'Favor fazer novamente o Envio dos Dados!');
    sb_transferencia.Panels[0].Text := '...';
    Application.ProcessMessages;
    exit;
  end;
  frpri.ftp.ChangeDir('matriz');

  dao.Geral4('select cod_empresa from empresa');
  qtd_empresas := dao.Q4.RecordCount;

  if tipo_empresa = '1' then
  begin
    try
      //  frpri.ftp.Delete('lote_envio.txt');
    except
    end;
  end;
  {   for j:=1 to qtd_empresas do
     begin
       frpri.ftp.ChangeDirUp;
       frpri.ftp.ChangeDir(inttostr(j));
       try
         if PrRomaneio.Checked then
            if FileExists('c:\orbi\Transmicao\Romaneio1-'+IntToStr(j)+'.txt') then
  //             frpri.ftp.Delete('Romaneio1-'+IntToStr(j)+'.txt');
       except
       end;
       try
         if PrRomaneio.Checked then
            if FileExists('c:\orbi\Transmicao\Romaneio2-'+IntToStr(j)+'.txt') then
  //             frpri.ftp.Delete('Romaneio2-'+IntToStr(j)+'.txt');
       except
       end;
     end; }

  frpri.ftp.ChangeDirUp;
  frpri.ftp.ChangeDir('matriz');

  if (Prarquivos_cadastro.Checked) and (tipo_empresa = '1') then
  begin
    sb_transferencia.Panels[0].Text := 'montando Arquivos de Envio para FTP ......';
    Application.ProcessMessages;
    frpri.ftp.Delete('lote_envio.txt');
    monta_arquivo_envio('lote_envio.txt', Prde.Text, Prate.Text);
    frpri.ftp.Put('c:\orbi\Transmicao\lote_envio.txt', 'lote_envio.txt', true);
    for i := PB.Position to 20 do
    begin
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
  end;

  if PrRomaneio.Checked then
  begin
    for j := 1 to qtd_empresas do
    begin
      FRPRI.ftp.ChangeDirUp;
      frpri.ftp.ChangeDir(IntToStr(j));

      sb_transferencia.Panels[0].Text := 'montando Arquivos de Romaneio para Loja ' + nom_empresa + ' ......';
      Application.ProcessMessages;
      try
        if FileExists('c:\orbi\Transmicao\Romaneio1-' + IntToStr(j) + '.txt') then
          DeleteFile('c:\orbi\Transmicao\Romaneio1-' + IntToStr(j) + '.txt');
      except
        //Continue;
      end;
      Monta_romaneio1_para_filial('Romaneio1-' + IntToStr(j) + '.txt', inttostr(j));
      if FileExists('c:\orbi\Transmicao\Romaneio1-' + IntToStr(j) + '.txt') then
        frpri.ftp.Put('c:\orbi\Transmicao\Romaneio1-' + IntToStr(j) + '.txt', 'Romaneio1-' + IntToStr(j) + '.txt', true);
      for i := pb.Position to 100 do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
      end;

      sb_transferencia.Panels[0].Text := 'montando Arquivos de Romaneio para Loja ' + nom_empresa + ' ......';
      Application.ProcessMessages;
      try
        if FileExists('c:\orbi\Transmicao\Romaneio2-' + IntToStr(j) + '.txt') then
          DeleteFile('c:\orbi\Transmicao\Romaneio2-' + IntToStr(j) + '.txt');
      except
        // Continue;
      end;

      Monta_romaneio2_para_filial('Romaneio2-' + IntToStr(j) + '.txt', IntToStr(j));
      if FileExists('c:\orbi\Transmicao\Romaneio2-' + IntToStr(j) + '.txt') then
        frpri.ftp.Put('c:\orbi\Transmicao\Romaneio2-' + IntToStr(j) + '.txt', 'Romaneio2-' + IntToStr(j) + '.txt', true);

      for i := pb.Position to 100 do
      begin
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
      end;
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Geral1('select nr_documento, cod_fornecedor, cod_fiscal, rom_enviado from entrada1 where cod_fiscal = ' + QuotedStr('5152') + ' and rom_enviado=' + QuotedStr('N') + ' and empresa_destino=' + QuotedStr(inttostr(j)));
        dao.Q1.First;
        while not (dao.Q1.Eof) do
        begin
          dao.Execsql('update entrada1 set rom_enviado=' + quotedStr('S') + ' where nr_documento=' + QuotedStr(dao.Q1.fieldbyname('nr_documento').AsString) +
            ' and cod_fornecedor=' + QuotedStr(dao.Q1.fieldbyname('cod_fornecedor').AsString) + ' and pode_enviar=' + QuotedStr('S'));
          dao.Q1.Next;
        end;
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;
    end;
  end;

  if Prvendas.Checked then
  begin
    FRPRI.ftp.ChangeDirUp;
    frpri.ftp.ChangeDir('1');

    sb_transferencia.Panels[0].Text := 'montando Arquivos de Vendas para Matriz ' + nom_empresa + ' ......';
    Application.ProcessMessages;
    try
      if FileExists('c:\orbi\Transmicao\Vendas1-' + IntToStr(1) + '.txt') then
        DeleteFile('c:\orbi\Transmicao\Vendas1-' + IntToStr(1) + '.txt');
    except
      //Continue;
    end;
    Monta_venda1_para_filial('Vendas1-' + '1' + '.txt');
    if FileExists('c:\orbi\Transmicao\Vendas1-' + '1' + '.txt') then
      frpri.ftp.Put('c:\orbi\Transmicao\Vendas1-' + '1' + '.txt', 'Vendas1-' + '1' + '.txt', true);
    for i := pb.Position to 100 do
    begin
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;

    sb_transferencia.Panels[0].Text := 'montando Arquivos de Vendas para Matriz ' + nom_empresa + ' ......';
    Application.ProcessMessages;
    try
      if FileExists('c:\orbi\Transmicao\Vendas2-' + IntToStr(1) + '.txt') then
        DeleteFile('c:\orbi\Transmicao\Vendas2-' + IntToStr(1) + '.txt');
    except
      // Continue;
    end;

    Monta_venda2_para_filial('Vendas2-' + IntToStr(1) + '.txt');
    if FileExists('c:\orbi\Transmicao\Vendas2-' + IntToStr(1) + '.txt') then
      frpri.ftp.Put('c:\orbi\Transmicao\Vendas2-' + IntToStr(1) + '.txt', 'Vendas2-' + IntToStr(1) + '.txt', true);

    for i := pb.Position to 100 do
    begin
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Geral1('select numdoc, venda_enviada  from vendas1 where venda_enviada=' + QuotedStr('N'));
      dao.Q1.First;
      while not (dao.Q1.Eof) do
      begin
        dao.Execsql('update vendas1 set venda_enviada=' + quotedStr('S') + ' where numdoc=' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));
        dao.Q1.Next;
      end;

      //pega o arquivo do ftp
      frpri.FTP.Disconnect;
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
  end;
  sb_transferencia.Panels[0].Text := 'Transferência de Arquivos Realizada com Sucesso para Loja ' + Lbempresa1.Caption + ' ......!';
  Application.ProcessMessages;
end;

procedure TFr_transferencia.recebe_dados; //recebe da matriz arquivos
var
  i, j, qtd_empresas: integer;

begin
  sb_transferencia.Panels[0].Text := 'Conectando.....';
  Application.ProcessMessages;
  try
    frpri.ftp.Connect;
  except
    dao.msg('Servidor de FTP desconectou-se' + #13 + 'Favor fazer novamente o Recebimento dos Dados!');
    sb_transferencia.Panels[0].Text := '...';
    Application.ProcessMessages;
    exit;
  end;

  frpri.ftp.ChangeDir('matriz');
  dao.Geral4('select cod_empresa from empresa');
  qtd_empresas := dao.Q4.RecordCount;
  if MessageDlg('Este recebimento pode levar de 5 a 40 minutos....', mtConfirmation, [mbyes, mbno], 0) = mrno then
    exit;

  if Prarquivos_cadastro.Checked then
  begin
    sb_transferencia.Panels[0].Text := 'Efetuando Download do Arquivo de Cadastros.....';
    Application.ProcessMessages;
    frpri.ftp.Get('lote_envio.txt', 'c:\orbi\Recepcao\lote_envio.txt', true);
    FRPRI.FTP.Disconnect;
    sb_transferencia.Panels[0].Text := 'Processando Arquivo de Cadastros.....';
    if FileExists('c:\orbi\Recepcao\lote_envio.txt') then
      trata_lote_para_filial('lote_envio.txt');
  end;

  if Prvendas.Checked then
  begin
    try
      if not frpri.ftp.Connected then
        frpri.ftp.Connect;

      frpri.ftp.ChangeDirUp;
      frpri.ftp.ChangeDir('1');

    except
      dao.msg('Servidor de FTP desconectou-se' + #13 + 'Favor fazer novamente o Recebimento dos Dados!');
      sb_transferencia.Panels[0].Text := '...';
      Application.ProcessMessages;
      exit;
    end;
    try
      sb_transferencia.Panels[0].Text := 'Recebendo Arquivos de Romaneio 1.....';
      Application.ProcessMessages;

      frpri.ftp.Get('Vendas1-1.txt', 'c:\orbi\Recepcao\Vendas1-1.txt', true);
      frpri.ftp.Get('Vendas2-1.txt', 'c:\orbi\Recepcao\Vendas2-1.txt', true);

      if (FileExists('c:\orbi\Recepcao\Vendas1-1.txt')) and (FileExists('c:\orbi\Recepcao\Vendas2-1.txt')) then
        trata_venda_para_filial('Vendas1-1.txt', 'Vendas2-1.txt');
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro ao receber os dados do Vendas , Tente Novamente, ou chame o administrador do Sistema!' + #13 + e.message);
        FRPRI.FTP.Disconnect;
      end;
    end;
  end;
  if PrRomaneio.Checked then
  begin
    try
      if not frpri.ftp.Connected then
        frpri.ftp.Connect;
      frpri.ftp.ChangeDirUp;
      frpri.ftp.ChangeDir(Prcod_empresa1.Text);

    except
      dao.msg('Servidor de FTP desconectou-se' + #13 + 'Favor fazer novamente o Recebimento dos Dados!');
      sb_transferencia.Panels[0].Text := '...';
      Application.ProcessMessages;
      exit;
    end;

    try
      sb_transferencia.Panels[0].Text := 'Recebendo Arquivos de Romaneio 1.....';
      Application.ProcessMessages;

      //      for j := 1 to qtd_empresas do
      //      begin
      //          if FileExists('c:\orbi\Recepcao\Romaneio1-'+IntToStr(j)+'.txt') then
      frpri.ftp.Get('Romaneio1-' + cod_empresa + '.txt', 'c:\orbi\Recepcao\Romaneio1-' + cod_empresa + '.txt', true);
      //          if FileExists('c:\orbi\Recepcao\Romaneio2-'+IntToStr(j)+'.txt') then
      frpri.ftp.Get('Romaneio2-' + cod_empresa + '.txt', 'c:\orbi\Recepcao\Romaneio2-' + cod_empresa + '.txt', true);

      if (FileExists('c:\orbi\Recepcao\Romaneio1-' + cod_empresa + '.txt')) and (FileExists('c:\orbi\Recepcao\Romaneio2-' + cod_empresa + '.txt')) then
        trata_romaneio1_para_filial('Romaneio1-' + cod_empresa + '.txt', 'Romaneio2-' + cod_empresa + '.txt');
      //           trata_romaneio_para_filial('Romaneio1-'+IntToStr(j)+'.txt','Romaneio2-'+IntToStr(j)+'.txt');
    //      end;

      frpri.FTP.Disconnect;
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro ao receber os dados de Romaneio, Tente Novamente, ou chame o administrador do Sistema!' + #13 + e.message);
        FRPRI.FTP.Disconnect;
      end;
    end;
  end;
  sb_transferencia.Panels[0].Text := 'Recepção de Arquivos Realizada com Sucesso!';
  Application.ProcessMessages;
end;

procedure TFr_transferencia.trata_cod_barras_para_filial(
  nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select id from cod_barras where id = ' + quotedStr(trim(copy(linha, 1, 6))));

      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into cod_barras (id ,cod_barras, cod_produto';
        if trim(copy(linha, 42, 10)) <> '' then
          cmd := cmd + ', data';

        cmd := cmd + ') values (';

        cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 25)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 32, 10)));

        if trim(copy(linha, 42, 10)) <> '' then
          cmd := cmd + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 42, 10)))));

        cmd := cmd + ')';

        dao.Execsql(cmd);

      end
      else //update
      begin
        cmd := 'update cod_barras set ';

        if trim(copy(linha, 7, 25)) <> '' then
          cmd := cmd + ' cod_barras =' + QuotedStr(trim(copy(linha, 7, 25)));

        if trim(copy(linha, 32, 10)) <> '' then
          cmd := cmd + ', cod_produto =' + QuotedStr(trim(copy(linha, 32, 10)));

        if trim(copy(linha, 42, 10)) <> '' then
          cmd := cmd + ', data =' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 42, 10)))));

        cmd := cmd + ' where id=' + QuotedStr(trim(copy(linha, 1, 6)));

        dao.Execsql(cmd);
      end;

      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select id from cod_barras where id = ' + trim(copy(linha, 1, 6)));

        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into cod_barras (id ,cod_barras, cod_produto';
          if trim(copy(linha, 42, 10)) <> '' then
            cmd := cmd + ', data';

          cmd := cmd + ') values (';

          cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 25)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 32, 10)));

          if trim(copy(linha, 42, 10)) <> '' then
            cmd := cmd + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 42, 10)))));

          cmd := cmd + ')';
          dao.Execsql(cmd);
        end
        else //update
        begin
          cmd := 'update cod_barras set ';

          if trim(copy(linha, 7, 25)) <> '' then
            cmd := cmd + ' cod_barras =' + QuotedStr(trim(copy(linha, 7, 25)));

          if trim(copy(linha, 32, 10)) <> '' then
            cmd := cmd + ', cod_produto =' + QuotedStr(trim(copy(linha, 32, 10)));

          if trim(copy(linha, 42, 10)) <> '' then
            cmd := cmd + ', data =' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 42, 10)))));

          cmd := cmd + ' where id=' + QuotedStr(trim(copy(linha, 1, 6)));

          dao.Execsql(cmd);
        end;
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    CloseFile(txt);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de Grade!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.trata_grade_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);

    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select id from grade where id = ' + quotedstr(trim(copy(linha, 1, 6))));

      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into grade (id ,id_cor, id_tamanho, cod_produto)';
        cmd := cmd + ' values (';

        cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 3)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 3)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 13, 10)));
        cmd := cmd + ')';

        dao.Execsql(cmd);

      end
      else //update
      begin
        cmd := 'update grade set ';

        if trim(copy(linha, 7, 3)) <> '' then
          cmd := cmd + ' id_cor =' + QuotedStr(trim(copy(linha, 7, 3)));

        if trim(copy(linha, 10, 3)) <> '' then
          cmd := cmd + ', id_tamanho =' + QuotedStr(trim(copy(linha, 10, 3)));

        if trim(copy(linha, 13, 10)) <> '' then
          cmd := cmd + ', cod_produto =' + QuotedStr(trim(copy(linha, 13, 10)));

        cmd := cmd + ' where id=' + QuotedStr(trim(copy(linha, 1, 6)));

        dao.Execsql(cmd);
      end;

      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select id from grade where id = ' + quotedstr(trim(copy(linha, 1, 6))));

        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into grade (id ,id_cor, id_tamanho, cod_produto)';
          cmd := cmd + ' values (';

          cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 3)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 3)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 13, 10)));
          cmd := cmd + ')';

          dao.Execsql(cmd);

        end
        else //update
        begin
          cmd := 'update grade set ';

          if trim(copy(linha, 7, 3)) <> '' then
            cmd := cmd + ' id_cor =' + QuotedStr(trim(copy(linha, 7, 3)));

          if trim(copy(linha, 10, 3)) <> '' then
            cmd := cmd + ', id_tamanho =' + QuotedStr(trim(copy(linha, 10, 3)));

          if trim(copy(linha, 13, 10)) <> '' then
            cmd := cmd + ', cod_produto =' + QuotedStr(trim(copy(linha, 13, 10)));

          cmd := cmd + ' where id=' + QuotedStr(trim(copy(linha, 1, 6)));

          dao.Execsql(cmd);
        end;
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    CloseFile(txt);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de Grade!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.trata_produto_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try

    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select cod_produto from produto where cod_produto= ' + trim(copy(linha, 1, 6)));
      formatsettings.DecimalSeparator := '.';
      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into produto (cod_produto, nom_produto';

        if trim(copy(linha, 59, 4)) <> '' then
          cmd := cmd + ',cod_grupo';

        cmd := cmd + ', unidade, peso, ref_fabrica, cod_prateleira, ' +
          'observacao, custo, avisar_prod_desat';

        if trim(copy(linha, 306, 10)) <> '' then
          cmd := cmd + ',qtd_dias_desat ';

        if trim(copy(linha, 317, 10)) <> '' then
          cmd := cmd + ',dta_ult_atualizacao';

        cmd := cmd + ',custo_medio, custo_calculado, custo_atualizado, qtd_embalagem, preco_venda, status';

        if trim(copy(linha, 390, 1)) <> '' then
          cmd := cmd + ', grade';

        if trim(copy(linha, 392, 1)) <> '' then
          cmd := cmd + ', cod_colecao';

        if trim(copy(linha, 394, 3)) <> '' then
          cmd := cmd + ', id_marca';

        if trim(copy(linha, 398, 3)) <> '' then
          cmd := cmd + ', id_marca';

        cmd := cmd + ')';

        cmd := cmd + ' values (' +
          QuotedStr(trim(copy(linha, 1, 6))) + ',' + //cod_produto
          QuotedStr(trim(copy(linha, 8, 50))) + ','; //nom_produto

        if trim(copy(linha, 59, 4)) <> '' then
          cmd := cmd + QuotedStr(trim(copy(linha, 59, 4))) + ','; //cod_grupo

        cmd := cmd + QuotedStr(trim(copy(linha, 64, 1))) + ',' + //unidade
          QuotedStr(trim(copy(linha, 66, 11))) + ',' + //peso
          QuotedStr(trim(copy(linha, 78, 15))) + ',' + //ref_fabrica
          QuotedStr(trim(copy(linha, 94, 10))) + ',' + //cod_prateleira
          QuotedStr(trim(copy(linha, 157, 80))) + ',' + //observacao
          QuotedStr(trim(copy(linha, 255, 11))) + ',' + //custo
          QuotedStr(trim(copy(linha, 303, 2))) + ','; //avisar prod desatu
        if trim(copy(linha, 306, 10)) <> '' then
          cmd := cmd + QuotedStr(trim(copy(linha, 306, 10))) + ','; //qtd_dias_desat

        if trim(copy(linha, 317, 10)) <> '' then
          cmd := cmd + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 317, 10))))) + ','; //dta_ult_atualizacao

        cmd := cmd + QuotedStr(trim(copy(linha, 328, 11))) + ',' + //custo_medio
          QuotedStr(trim(copy(linha, 340, 11))) + ',' + //custo_calculado
          QuotedStr(trim(copy(linha, 352, 11))) + ',' + //custo_atualizado
          QuotedStr(trim(copy(linha, 364, 11))) + ',' + //qtd_embalagem
          QuotedStr(trim(copy(linha, 376, 11))) + ',' + //preco venda
          QuotedStr(trim(copy(linha, 388, 1))) + ','; //status

        if trim(copy(linha, 390, 1)) <> '' then
          cmd := cmd + QuotedStr(trim(copy(linha, 390, 1))); //grade
        if trim(copy(linha, 392, 1)) <> '' then
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 392, 1)));

        if trim(copy(linha, 394, 3)) <> '' then //id_marca
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 394, 3)));

        if trim(copy(linha, 398, 4)) <> '' then //fornecedor_principal
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 398, 4)));

        cmd := cmd + ')'; //cod_colecao

        dao.Execsql(cmd);
        formatsettings.decimalseparator := ',';

      end
      else //update
      begin

        formatsettings.DecimalSeparator := '.';

        cmd := 'update produto set nom_produto=' + QuotedStr(trim(copy(linha, 8, 50)));

        if trim(copy(linha, 59, 4)) <> '' then
          cmd := cmd + ', cod_grupo =' + QuotedStr(trim(copy(linha, 59, 4)));

        cmd := cmd + ', unidade =' + QuotedStr(trim(copy(linha, 64, 1))) +
          ', peso =' + QuotedStr(trim(copy(linha, 66, 11))) + ', ref_fabrica =' + QuotedStr(trim(copy(linha, 78, 15))) +
          ', cod_prateleira =' + QuotedStr(trim(copy(linha, 94, 10)));

        // if trim(copy(linha,157,80)) <> '' then
         //   cmd:= cmd + ',observacao ='+ QuotedStr(trim(copy(linha,157,80)));

        cmd := cmd + ', custo =' + QuotedStr(trim(copy(linha, 255, 11))) +
          ', avisar_prod_desat =' + QuotedStr(trim(copy(linha, 303, 2)));

        if trim(copy(linha, 306, 10)) <> '' then
          cmd := cmd + ', qtd_dias_desat =' + QuotedStr(trim(copy(linha, 306, 10)));

        //      cmd:= cmd + ', dta_ult_atualizacao ='+QuotedStr(trim(copy(linha,317,10)));
        if trim(copy(linha, 317, 10)) <> '' then
          cmd := cmd + ', dta_ult_atualizacao =' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 317, 10)))));

        cmd := cmd + ',custo_medio =' + QuotedStr(trim(copy(linha, 328, 11))) + ', custo_calculado = ' + QuotedStr(trim(copy(linha, 340, 11))) +
          ', custo_atualizado =' + QuotedStr(trim(copy(linha, 352, 11))) + ', qtd_embalagem =' + QuotedStr(trim(copy(linha, 364, 11))) +
          ', preco_venda =' + QuotedStr(trim(FormatFloat('0.00', strtofloat(copy(linha, 376, 11))))) + ', status =' + QuotedStr(trim(copy(linha, 388, 1)));

        if trim(copy(linha, 390, 1)) <> '' then
          cmd := cmd + ', grade = ' + QuotedStr(trim(copy(linha, 390, 1)));

        if trim(copy(linha, 392, 1)) <> '' then
          cmd := cmd + ', cod_colecao = ' + QuotedStr(trim(copy(linha, 392, 1)));

        if trim(copy(linha, 394, 3)) <> '' then
          cmd := cmd + ', id_marca = ' + QuotedStr(trim(copy(linha, 394, 3)));

        if trim(copy(linha, 398, 4)) <> '' then
          cmd := cmd + ', fornecedor_principal = ' + QuotedStr(trim(copy(linha, 398, 4)));

        cmd := cmd + ' where cod_produto =' + QuotedStr(trim(copy(linha, 1, 6)));

        dao.Execsql(cmd);
        formatsettings.DecimalSeparator := ',';

      end;

      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select cod_produto from produto where cod_produto= ' + trim(copy(linha, 1, 6)));
        formatsettings.DecimalSeparator := '.';
        if dao.Q1.RecordCount <= 0 then
        begin

          cmd := 'insert into produto (cod_produto, nom_produto';

          if trim(copy(linha, 59, 4)) <> '' then
            cmd := cmd + ',cod_grupo';

          cmd := cmd + ', unidade, peso, ref_fabrica, cod_prateleira, etiqueta_lin1, etiqueta_lin2, ' +
            'observacao, origem_mercadoria, trib_icms, ipi, custo, impostos, geral, lucro, avisar_prod_desat';

          if trim(copy(linha, 306, 10)) <> '' then
            cmd := cmd + ',qtd_dias_desat ';

          if trim(copy(linha, 317, 10)) <> '' then
            cmd := cmd + ',dta_ult_atualizacao';

          cmd := cmd + ',custo_medio, custo_calculado, custo_atualizado, qtd_embalagem, preco_venda, status';

          if trim(copy(linha, 390, 1)) <> '' then
            cmd := cmd + ', grade';

          if trim(copy(linha, 392, 1)) <> '' then
            cmd := cmd + ', cod_colecao';

          if trim(copy(linha, 394, 3)) <> '' then
            cmd := cmd + ', id_marca';

          if trim(copy(linha, 398, 4)) <> '' then
            cmd := cmd + ', fornecedor_principal';

          cmd := cmd + ')';

          cmd := cmd + ' values (' +
            QuotedStr(trim(copy(linha, 1, 6))) + ',' + //cod_produto
            QuotedStr(trim(copy(linha, 8, 50))) + ','; //nom_produto

          if trim(copy(linha, 59, 4)) <> '' then
            cmd := cmd + QuotedStr(trim(copy(linha, 59, 4))) + ','; //cod_grupo

          cmd := cmd + QuotedStr(trim(copy(linha, 64, 1))) + ',' + //unidade
            QuotedStr(trim(copy(linha, 66, 11))) + ',' + //peso
            QuotedStr(trim(copy(linha, 78, 15))) + ',' + //ref_fabrica
            QuotedStr(trim(copy(linha, 94, 10))) + ',' + //cod_prateleira
            QuotedStr(trim(copy(linha, 105, 25))) + ',' + //etiqueta linha 1
            QuotedStr(trim(copy(linha, 131, 25))) + ',' + //etiqueta linha 2
            QuotedStr(trim(copy(linha, 157, 80))) + ',' + //observacao
            QuotedStr(trim(copy(linha, 238, 1))) + ',' + //origem_mercadoria
            QuotedStr(trim(copy(linha, 240, 2))) + ',' + //trib_icms
            QuotedStr(trim(copy(linha, 243, 11))) + ',' + //ipi
            QuotedStr(trim(copy(linha, 255, 11))) + ',' + //custo
            QuotedStr(trim(copy(linha, 267, 11))) + ',' + //impostos
            QuotedStr(trim(copy(linha, 279, 11))) + ',' + //geral
            QuotedStr(trim(copy(linha, 291, 11))) + ',' + //lucro
            QuotedStr(trim(copy(linha, 303, 2))) + ','; //avisar prod desatu
          if trim(copy(linha, 306, 10)) <> '' then
            cmd := cmd + QuotedStr(trim(copy(linha, 306, 10))) + ','; //qtd_dias_desat

          if trim(copy(linha, 317, 10)) <> '' then
            cmd := cmd + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 317, 10))))) + ','; //dta_ult_atualizacao

          cmd := cmd + QuotedStr(trim(copy(linha, 328, 11))) + ',' + //custo_medio
            QuotedStr(trim(copy(linha, 340, 11))) + ',' + //custo_calculado
            QuotedStr(trim(copy(linha, 352, 11))) + ',' + //custo_atualizado
            QuotedStr(trim(copy(linha, 364, 11))) + ',' + //qtd_embalagem
            QuotedStr(trim(copy(linha, 376, 11))) + ',' + //preco venda
            QuotedStr(trim(copy(linha, 388, 1))) + ','; //status

          if trim(copy(linha, 390, 1)) <> '' then
            cmd := cmd + QuotedStr(trim(copy(linha, 390, 1))); //grade

          if trim(copy(linha, 392, 1)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 392, 1))); //COD_COLECAO

          if trim(copy(linha, 394, 3)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 394, 3))); //id_marca

          if trim(copy(linha, 398, 4)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 398, 4))); //fornecedor_principal

          cmd := cmd + ')'; //cod_colecao

          dao.Execsql(cmd);
          formatsettings.decimalseparator := ',';

        end
        else //update
        begin

          formatsettings.DecimalSeparator := '.';

          cmd := 'update produto set nom_produto=' + QuotedStr(trim(copy(linha, 8, 50)));

          if trim(copy(linha, 59, 4)) <> '' then
            cmd := cmd + ', cod_grupo =' + QuotedStr(trim(copy(linha, 59, 4)));

          cmd := cmd + ', unidade =' + QuotedStr(trim(copy(linha, 64, 1))) +
            ', peso =' + QuotedStr(trim(copy(linha, 66, 11))) + ', ref_fabrica =' + QuotedStr(trim(copy(linha, 78, 15))) +
            ', cod_prateleira =' + QuotedStr(trim(copy(linha, 94, 10))) + ', etiqueta_lin1 =' + QuotedStr(trim(copy(linha, 105, 25))) +
            ', etiqueta_lin2 = ' + QuotedStr(trim(copy(linha, 131, 25)));

          // if trim(copy(linha,157,80)) <> '' then
           //   cmd:= cmd + ',observacao ='+ QuotedStr(trim(copy(linha,157,80)));

          cmd := cmd + ', origem_mercadoria =' + QuotedStr(trim(copy(linha, 238, 1))) + ', trib_icms =' + QuotedStr(trim(copy(linha, 240, 2))) +
            ', ipi =' + QuotedStr(trim(copy(linha, 243, 11))) + ', custo =' + QuotedStr(trim(copy(linha, 255, 11))) +
            ', impostos =' + QuotedStr(trim(copy(linha, 267, 11))) + ', geral =' + QuotedStr(trim(copy(linha, 279, 11))) +
            ', lucro =' + QuotedStr(trim(copy(linha, 291, 11))) + ', avisar_prod_desat =' + QuotedStr(trim(copy(linha, 303, 2)));

          if trim(copy(linha, 306, 10)) <> '' then
            cmd := cmd + ', qtd_dias_desat =' + QuotedStr(trim(copy(linha, 306, 10)));

          //      cmd:= cmd + ', dta_ult_atualizacao ='+QuotedStr(trim(copy(linha,317,10)));
          if trim(copy(linha, 317, 10)) <> '' then
            cmd := cmd + ', dta_ult_atualizacao =' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 317, 10)))));

          cmd := cmd + ',custo_medio =' + QuotedStr(trim(copy(linha, 328, 11))) + ', custo_calculado = ' + QuotedStr(trim(copy(linha, 340, 11))) +
            ', custo_atualizado =' + QuotedStr(trim(copy(linha, 352, 11))) + ', qtd_embalagem =' + QuotedStr(trim(copy(linha, 364, 11))) +
            ', preco_venda =' + QuotedStr(trim(FormatFloat('0.00', strtofloat(copy(linha, 376, 11))))) + ', status =' + QuotedStr(trim(copy(linha, 388, 1)));

          if trim(copy(linha, 390, 1)) <> '' then
            cmd := cmd + ', grade = ' + QuotedStr(trim(copy(linha, 390, 1)));

          if trim(copy(linha, 392, 1)) <> '' then
            cmd := cmd + ', cod_colecao = ' + QuotedStr(trim(copy(linha, 392, 1)));

          if trim(copy(linha, 394, 3)) <> '' then
            cmd := cmd + ', id_marca = ' + QuotedStr(trim(copy(linha, 394, 3)));

          if trim(copy(linha, 398, 4)) <> '' then
            cmd := cmd + ', fornecedor_principal = ' + QuotedStr(trim(copy(linha, 398, 4)));

          cmd := cmd + ' where cod_produto =' + QuotedStr(trim(copy(linha, 1, 6)));

          dao.Execsql(cmd);
          formatsettings.DecimalSeparator := ',';

        end;
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;

    end;
    CloseFile(txt);
    formatsettings.DecimalSeparator := ','
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

procedure TFr_transferencia.Monta_usuario_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin

  {    AssignFile(txt, 'c:\orbi\Transmicao\'+ nom_arquivo);
      Rewrite(txt);

      //CRIAR ARQUIVO PRODUTO
      dao.Geral1('select * from tbusu');

      dao.Q1.First;
      while not dao.Q1.Eof do
      begin
        if dao.Q1.FieldByName('codusu').AsString <> '' then
          Write(txt, ajustastr(dao.Q1.FieldByName('codusu').AsString, 4))
        else
          Write(txt, ajustastr(' ', 4));

        Write(txt, '|');

        Write(txt, ajustastr(dao.Q1.FieldByName('logusu').AsString, 10));

        Write(txt, '|');

        Write(txt, ajustastr(dao.Q1.FieldByName('senusu').AsString,10));

        Write(txt, '|');

        Write(txt, ajustastr(dao.Q1.FieldByName('senesp').AsString,10));

        Write(txt, '|');
   }
end;

procedure TFr_transferencia.trata_usuario_para_filial(nom_arquivo: string);
begin

end;

procedure TFr_transferencia.Monta_romaneio1_para_filial(nom_arquivo, empresa_destino: string);
var
  txt: TextFile;
  linha: string;
begin
  dao.Geral1('select * from entrada1 where cod_fiscal = ' + QuotedStr('5152') + ' and rom_enviado=' + QuotedStr('N') +
    ' and pode_enviar=' + QuotedStr('S') + ' and empresa_destino=' + QuotedStr(empresa_destino));
  if dao.Q1.RecordCount > 0 then
  begin
    AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
    Rewrite(txt);

    //CRIAR ARQUIVO PRODUTO

    dao.Q1.First;
    formatsettings.DecimalSeparator := '.';
    while not dao.Q1.Eof do
    begin
      if dao.Q1.FieldByName('nr_documento').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('nr_documento').AsString, 6))
      else
        Write(txt, ajustastr(' ', 6));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_fornecedor').AsString, 4));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('dta_documento').AsString, 10));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_fiscal').AsString, 5));

      Write(txt, '|');

      if dao.Q1.FieldByName('vl_frete').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('vl_frete').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('vl_outros').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('vl_outros').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('total_mercadorias').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('total_mercadorias').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('vl_total').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('vl_total').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('obs_nota1').AsString, 50));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('obs_nota2').AsString, 50));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('obs_nota3').AsString, 50));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_empresa').AsString, 3));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_transportadora').AsString, 4));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('empresa_destino').AsString, 3));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('nr_romaneio').AsString, 6));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('nota_fiscal').AsString, 6));

      Write(txt, '|');

      WriteLn(txt);
      dao.Q1.Next;
    end;

    formatsettings.DecimalSeparator := ',';
    CloseFile(txt);

  end;
end;

procedure TFr_transferencia.Monta_romaneio2_para_filial(
  nom_arquivo, empresa_destino: string);
var
  txt: TextFile;
  linha: string;
begin
  //CRIAR ARQUIVO PRODUTO
  dao.Geral1('select e2.* from entrada2 e2 ' +
    'left join entrada1 e1 on e1.nr_documento=e2.nr_documento and e1.cod_fornecedor=e2.cod_fornecedor ' +
    'where e1.cod_fiscal = ' + QuotedStr('5152') + ' and e1.rom_enviado=' + QuotedStr('N') + ' and e1.pode_enviar= ' + QuotedStr('S') + ' and empresa_destino=' + QuotedStr(empresa_destino));

  if dao.Q1.RecordCount > 0 then
  begin
    AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
    Rewrite(txt);

    dao.Q1.First;
    formatsettings.DecimalSeparator := '.';
    while not dao.Q1.Eof do
    begin
      if dao.Q1.FieldByName('id').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6))
      else
        Write(txt, ajustastr(' ', 6));

      Write(txt, '|');

      if dao.Q1.FieldByName('nr_documento').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('nr_documento').AsString, 6))
      else
        Write(txt, ajustastr(' ', 6));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_fornecedor').AsString, 4));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 6));

      Write(txt, '|');

      if dao.Q1.FieldByName('qtd_entrada').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('qtd_entrada').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('custo').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('sub_total').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('sub_total').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('custo_final').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo_final').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('id_cor').AsString, 4));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('id_tamanho').AsString, 4));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_colecao').AsString, 4));

      WriteLn(txt);
      dao.Q1.Next;
    end;
    formatsettings.DecimalSeparator := ',';
    CloseFile(txt);
  end;
end;

procedure TFr_transferencia.trata_romaneio1_para_filial(
  nom_arquivo: string; nom_arquivo2: string);
var
  txt, txt1: TextFile;
  linha, linha2: string;
  cmd: string;
  qtdlin: integer;
  nr_documento, cod_fornecedor: string;
begin
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('delete from romaneio2');
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    AssignFile(txt1, 'c:\orbi\Recepcao\' + nom_arquivo2);
    Reset(txt);
    Reset(txt1);
    Readln(txt, linha);
    Readln(txt1, linha2);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      formatsettings.DecimalSeparator := '.';
      dao.Geral1('select nr_documento from romaneio1 where nr_documento=' + QuotedStr(trim(copy(linha, 1, 6))) + ' and cod_fornecedor=' + QuotedStr(trim(copy(linha, 8, 4))));

      if dao.q1.RecordCount <= 0 then
      begin
        cmd := 'insert into romaneio1 (nr_documento, cod_fornecedor, dta_documento, cod_fiscal, vl_frete';
        cmd := cmd + ', vl_outros, total_mercadorias, vl_total, obs_nota1, obs_nota2, obs_nota3, rom_fechado' +
          ',cod_empresa ';

        if trim(copy(linha, 235, 4)) <> '' then
          cmd := cmd + ',cod_transportadora';

        cmd := cmd + ', empresa_destino';

        cmd := cmd + ')';

        cmd := cmd + ' values (' +
          QuotedStr(trim(copy(linha, 1, 6))) + ',' + //nr_documento
          QuotedStr(trim(copy(linha, 8, 4))) + ',' + //cod_fornecedor
          QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 13, 10))))) + ',' + //dta_ult_atualizacao
          QuotedStr(trim(copy(linha, 24, 5))) + ',' + //cod_fiscal
          QuotedStr(trim(copy(linha, 30, 11))) + ',' + //vl_frete
          QuotedStr(trim(copy(linha, 42, 11))) + ',' + //vl_outros
          QuotedStr(trim(copy(linha, 54, 11))) + ',' + //total_mercadorias
          QuotedStr(trim(copy(linha, 66, 11))) + ',' + //vl_outros
          QuotedStr(trim(copy(linha, 78, 50))) + ',' + //obs_nota1
          QuotedStr(trim(copy(linha, 129, 50))) + ',' + //obs_nota2
          QuotedStr(trim(copy(linha, 180, 50))) + ',' + //obs_nota3
          QuotedStr(trim('N')) + ',' + //rom_fechado
          QuotedStr(trim(copy(linha, 231, 3))) + ','; //cod_empresa
        if trim(copy(linha, 235, 4)) <> '' then
          cmd := cmd + QuotedStr(trim(copy(linha, 235, 4))) + ','; //cod_transportadora

        cmd := cmd + QuotedStr(trim(copy(linha, 240, 3))); //empresa destino

        cmd := cmd + ')';

        dao.Execsql(cmd);
        formatsettings.decimalseparator := ',';
      end;

      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
      ReadLn(txt, linha);

      if eof(txt) then
      begin
        formatsettings.DecimalSeparator := '.';
        dao.Geral1('select nr_documento from romaneio1 where nr_documento=' + QuotedStr(trim(copy(linha, 1, 6))) + ' and cod_fornecedor=' + QuotedStr(trim(copy(linha, 8, 4))));

        if dao.q1.RecordCount <= 0 then
        begin
          cmd := 'insert into romaneio1 (nr_documento, cod_fornecedor, dta_documento, cod_fiscal, vl_frete';
          cmd := cmd + ', vl_outros, total_mercadorias, vl_total, obs_nota1, obs_nota2, obs_nota3, rom_fechado' +
            ',cod_empresa ';

          if trim(copy(linha, 235, 4)) <> '' then
            cmd := cmd + ',cod_transportadora';

          cmd := cmd + ', empresa_destino';

          cmd := cmd + ')';

          cmd := cmd + ' values (' +
            QuotedStr(trim(copy(linha, 1, 6))) + ',' + //nr_documento
            QuotedStr(trim(copy(linha, 8, 4))) + ',' + //cod_fornecedor
            QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 13, 10))))) + ',' + //dta_ult_atualizacao
            QuotedStr(trim(copy(linha, 24, 5))) + ',' + //cod_fiscal
            QuotedStr(trim(copy(linha, 30, 11))) + ',' + //vl_frete
            QuotedStr(trim(copy(linha, 42, 11))) + ',' + //vl_outros
            QuotedStr(trim(copy(linha, 54, 11))) + ',' + //total_mercadorias
            QuotedStr(trim(copy(linha, 66, 11))) + ',' + //vl_outros
            QuotedStr(trim(copy(linha, 78, 50))) + ',' + //obs_nota1
            QuotedStr(trim(copy(linha, 129, 50))) + ',' + //obs_nota2
            QuotedStr(trim(copy(linha, 180, 50))) + ',' + //obs_nota3
            QuotedStr(trim('N')) + ',' + //rom_fechado
            QuotedStr(trim(copy(linha, 231, 3))) + ','; //cod_empresa
          if trim(copy(linha, 235, 4)) <> '' then
            cmd := cmd + QuotedStr(trim(copy(linha, 235, 4))) + ','; //cod_transportadora

          cmd := cmd + QuotedStr(trim(copy(linha, 240, 3))); //empresa destino

          cmd := cmd + ')';

          dao.Execsql(cmd);
          formatsettings.decimalseparator := ',';
        end;
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
        ReadLn(txt, linha);
      end;

    end; //end do while txt
    CloseFile(txt);
    { *****************}

    //aqui vai o proc do romaneio2
    Reset(txt1);

    while not eof(txt1) do
    begin
      formatsettings.DecimalSeparator := '.';
      cmd := 'insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, custo, ' +
        'sub_total';

      if trim(copy(linha2, 75, 4)) <> '' then
        cmd := cmd + ',id_cor';
      if trim(copy(linha2, 80, 4)) <> '' then
        cmd := cmd + ',id_tamanho';

      cmd := cmd + ') values (' +
        QuotedStr(trim(copy(linha2, 8, 6))) + ',' + //nr_documento
        QuotedStr(trim(copy(linha2, 15, 4))) + ',' + //cod_fornecedor
        QuotedStr(trim(copy(linha2, 20, 6))) + ',' + //cod_produto
        QuotedStr(trim(copy(linha2, 27, 11))) + ',' + //qtd_entrada
        QuotedStr(trim(copy(linha2, 39, 11))) + ',' + //custo
        QuotedStr(trim(copy(linha2, 51, 11))); //sub_total
      if trim(copy(linha2, 75, 4)) <> '' then
        cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 75, 4))); //id_cor

      if trim(copy(linha2, 80, 4)) <> '' then
        cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 80, 4))); //id_tamanho

      cmd := cmd + ')'; //cod_colecao

      dao.Execsql(cmd);
      ReadLn(txt1, linha2);

      if eof(txt1) then
      begin
        FORMATSETTINGS.DecimalSeparator := '.';
        cmd := 'insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, custo, ' +
          'sub_total';
        if trim(copy(linha2, 75, 4)) <> '' then
          cmd := cmd + ',id_cor';
        if trim(copy(linha2, 80, 4)) <> '' then
          cmd := cmd + ',id_tamanho';
        cmd := cmd + ') values (' +
          QuotedStr(trim(copy(linha2, 8, 6))) + ',' + //nr_documento
          QuotedStr(trim(copy(linha2, 15, 4))) + ',' + //cod_fornecedor
          QuotedStr(trim(copy(linha2, 20, 6))) + ',' + //cod_produto
          QuotedStr(trim(copy(linha2, 27, 11))) + ',' + //qtd_entrada
          QuotedStr(trim(copy(linha2, 39, 11))) + ',' + //custo
          QuotedStr(trim(copy(linha2, 51, 11))); //sub_total
        if trim(copy(linha2, 75, 4)) <> '' then
          cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 75, 4))); //id_cor
        if trim(copy(linha2, 80, 4)) <> '' then
          cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 80, 4))); //id_tamanho
        cmd := cmd + ')'; //cod_colecao
        dao.Execsql(cmd);
      end;
    end;

    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;
  CloseFile(txt1);
end;

procedure TFr_transferencia.Monta_cor_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO GRADE
  dao.Geral1('select * from cores');

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));

    Write(txt, ajustastr(dao.Q1.FieldByName('Cor').AsString, 31));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  CloseFile(txt);

end;

procedure TFr_transferencia.trata_cor_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select id from cores where id = ' + trim(copy(linha, 1, 6)) + ' and cor=' + QuotedStr(trim(copy(linha, 7, 31))));
      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into cores (id ,cor ';

        cmd := cmd + ') values (';

        cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 31)));

        cmd := cmd + ')';

        dao.Execsql(cmd);

      end;
      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select id from cores where id = ' + trim(copy(linha, 1, 6)) + ' and cor=' + QuotedStr(trim(copy(linha, 7, 31))));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into cores (id ,cor ';

          cmd := cmd + ') values (';

          cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 31)));

          cmd := cmd + ')';

          dao.Execsql(cmd);

        end;
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    CloseFile(txt);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de Cor!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.Monta_tamanho_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO GRADE
  dao.Geral1('select * from tamanho');

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));

    Write(txt, ajustastr(dao.Q1.FieldByName('tamanho').AsString, 50));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  CloseFile(txt);

end;

procedure TFr_transferencia.trata_tamanho_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select id from tamanho where id = ' + trim(copy(linha, 1, 6)) + ' and tamanho =' + QuotedStr(trim(copy(linha, 7, 25))));

      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into tamanho (id , tamanho ';

        cmd := cmd + ') values (';

        cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 25)));

        cmd := cmd + ')';

        dao.Execsql(cmd);

      end;
      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select id from tamanho where id = ' + trim(copy(linha, 1, 6)) + ' and tamanho =' + QuotedStr(trim(copy(linha, 7, 25))));

        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into tamanho (id , tamanho ';

          cmd := cmd + ') values (';

          cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 25)));

          cmd := cmd + ')';

          dao.Execsql(cmd);

        end
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    CloseFile(txt);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de tamanho!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.Monta_colecao_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
  Rewrite(txt);

  //CRIAR ARQUIVO GRADE
  dao.Geral1('select * from colecao');

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('descricao').AsString, 50));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  CloseFile(txt);

end;

procedure TFr_transferencia.trata_colecao_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      dao.Geral1('select id from colecao where id = ' + trim(copy(linha, 1, 6)) + ' and descricao = ' + QuotedStr(trim(copy(linha, 7, 50))));

      if dao.Q1.RecordCount <= 0 then
      begin
        cmd := 'insert into colecao (id , descricao ';

        cmd := cmd + ') values (';

        cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
        cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 50)));

        cmd := cmd + ')';

        dao.Execsql(cmd);

      end;
      ReadLn(txt, linha);

      if eof(txt) then
      begin
        dao.Geral1('select id from colecao where id = ' + trim(copy(linha, 1, 6)) + ' and descricao = ' + QuotedStr(trim(copy(linha, 7, 50))));

        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into colecao (id , descricao ';

          cmd := cmd + ') values (';

          cmd := cmd + QuotedStr(trim(copy(linha, 1, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 7, 50)));

          cmd := cmd + ')';

          dao.Execsql(cmd);

        end;
      end;
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
    end;
    CloseFile(txt);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de tamanho!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.Prcod_empresa1ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_transferencia_empresa1';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_transferencia.Prcod_empresa1KeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if key = #13 then
  begin
    if (Prcod_empresa1.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_transferencia_empresa1';
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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;

    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;

  end;
end;

procedure TFr_transferencia.Prcod_empresa2ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_transferencia_empresa2';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_transferencia.FormShow(Sender: TObject);
begin
  Prarquivos_cadastro.Checked := true;
  PrRomaneio.Checked := true;
  Prvendas.Checked := false;
  Prde.Enabled := true;
  Prate.Enabled := true;

  dao.Geral1('select max(cod_produto) as maximo from produto');
  Prde.Text := inttostr(dao.Q1.fieldbyname('maximo').AsInteger - 1100);
  Prate.Text := dao.Q1.fieldbyname('maximo').AsString;

  if tipo_transferencia = 'recebe_dados' then
  begin
    if tipo_empresa = '1' then
    begin
      Prarquivos_cadastro.Checked := false;
    end
    else
    begin
      Prarquivos_cadastro.Checked := true;

    end;
    Prcod_empresa1.Text := cod_empresa;
    Lbempresa1.Caption := nom_empresa;
    PaTransferencia.visible := false;
  end
  else
  begin
    if tipo_empresa = '0' then
    begin
      Prarquivos_cadastro.Checked := false;
      pacod_produto.Visible := false;
      Prconfiguracoes.Checked := false;
      gbarquivos.Visible := false;
    end
    else
    begin
      gbopcoes.visible := true;
    end;
  end;

end;

procedure TFr_transferencia.monta_Usuarios_filial(nom_arquivos: string);
begin

end;

procedure TFr_transferencia.envia_dados_internet_filial(cod_empresa: string);
begin
  //envia cadastro produtos
{    Application.ProcessMessages;
    dao.Configura_CN_NET(cod_empresa);

    //if not(dao.cn_net.InTransaction) then dao.cn_net.StartTransaction;

    sb_transferencia.Panels[0].Text:='Conectando.....';
    Application.ProcessMessages;

    //produto
    if Prarquivos_cadastro.Checked = true then
    begin
      sb_transferencia.Panels[0].Text:='Transferindo arquivo de Produtos para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;
      dao.Geral1('select * from produto p '+
                 'left join produto_empresa pe on pe.cod_produto = p.cod_produto '+
                 'where pe.cod_empresa = '+QuotedStr(cod_empresa)+' and p.cod_produto between '+QuotedStr(Prde.Text)+' and '+QuotedStr(Prate.Text));

      PB.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      Application.ProcessMessages;
      dao.Q1.First;
      while not(dao.Q1.eof) do
      begin
        dao.Geral1_NET('select cod_produto from produto where cod_produto='+QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));

        if dao.q1_net.RecordCount > 0 then
           dao.Execsql_NET('update produto set nom_produto='+QuotedStr(dao.Q1.fieldbyname('nom_produto').AsString)+', cod_grupo='+ QuotedStr(dao.Q1.fieldbyname('cod_grupo').AsString) +
                           ', unidade='+QuotedStr(dao.Q1.fieldbyname('unidade').AsString)+', qtd_embalagem= '+QuotedStr(dao.Q1.fieldbyname('qtd_embalagem').AsString) +
                           ', ref_fabrica='+QuotedStr(dao.Q1.fieldbyname('ref_fabrica').AsString)+
                           ', origem_mercadoria='+QuotedStr(dao.Q1.fieldbyname('origem_mercadoria').AsString)+', trib_icms= '+QuotedStr(dao.Q1.fieldbyname('trib_icms').AsString) +
                           ', custo='+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('custo').AsString))+', lucro= '+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('lucro').AsString)) +
                           ', preco_venda='+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('preco_venda').AsString))+', grade= '+QuotedStr(dao.Q1.fieldbyname('grade').AsString) +
                           ', fornecedor_principal='+QuotedStr(dao.Q1.fieldbyname('fornecedor_principal').AsString)+' where cod_produto='+QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString))
        else
           dao.Execsql_NET('insert into produto (cod_produto, nom_produto, cod_grupo, unidade, qtd_embalagem, ref_fabrica, origem_mercadoria, '+
                           'trib_icms, custo, lucro, preco_venda, grade, fornecedor_principal) values ('+
                           QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString)+','+ QuotedStr(dao.Q1.fieldbyname('nom_produto').AsString)+','+ QuotedStr(dao.Q1.fieldbyname('cod_grupo').AsString) +','+QuotedStr(dao.Q1.fieldbyname('unidade').AsString)+
                           ','+QuotedStr(dao.Q1.fieldbyname('qtd_embalagem').AsString) +','+QuotedStr(dao.Q1.fieldbyname('ref_fabrica').AsString)+
                           ','+QuotedStr(dao.Q1.fieldbyname('origem_mercadoria').AsString)+','+QuotedStr(dao.Q1.fieldbyname('trib_icms').AsString) +
                           ','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('custo').AsString))+','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('lucro').AsString)) +
                           ','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('preco_venda').AsString))+','+QuotedStr(dao.Q1.fieldbyname('grade').AsString) +
                           ','+QuotedStr(dao.Q1.fieldbyname('fornecedor_principal').AsString)+')');
        dao.q1.Next;
        pb.Position:= pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;
    //**final produto

    //** inicio do cod_barras
    if Prcod_barras.Checked = true then
    begin
      pb.Position:= 0;
      sb_transferencia.Panels[0].Text:='Transferindo Arquivo de Código de Barras para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;

      dao.Geral1('select * from cod_barras where cod_produto between '+QuotedStr(Prde.Text)+' and '+QuotedStr(Prate.Text));

      PB.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      Application.ProcessMessages;
      dao.Q1.First;
      while not(dao.Q1.Eof) do
      begin
        dao.Geral1_NET('select * from cod_barras where cod_barras ='+QuotedStr(dao.Q1.fieldbyname('cod_barras').AsString));
        if dao.q1_net.RecordCount <=0 then
        begin
          dao.Execsql_NET('insert into cod_barras (id, cod_barras, cod_produto) values ('+
                          QuotedStr(dao.Q1.fieldbyname('id').AsString) +','+QuotedStr(dao.Q1.fieldbyname('cod_barras').AsString)+','+QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString)+')');
        end;
        dao.Q1.Next;
        pb.Position:= pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;
    //final cod_barras

    // inicio do cores
    if Prcores.Checked = true then
    begin
      pb.Position:= 0;
      sb_transferencia.Panels[0].Text:='Transferindo Arquivo de Cores para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;

      dao.Geral1('select * from cores');
      pb.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      dao.Q1.First;
      while not(dao.Q1.Eof) do
      begin
        dao.Geral1_NET('select * from cores where id ='+QuotedStr(dao.Q1.fieldbyname('id').AsString));
        if dao.q1_net.RecordCount <=0 then
           dao.Execsql_NET('insert into cores (id, cor) values ('+ QuotedStr(dao.Q1.fieldbyname('id').AsString) +','+QuotedStr(dao.Q1.fieldbyname('cor').AsString)+')')
        else
        begin
          if dao.q1_net.FieldByName('cor').AsString <> dao.Q1.FieldByName('cor').AsString then
             dao.Execsql_NET('update cores set id='+QuotedStr(dao.Q1.fieldbyname('id').AsString)+', cor = '+QuotedStr(dao.Q1.fieldbyname('cor').AsString)+' where id = '+QuotedStr(dao.q1.fieldbyname('id').asstring));
        end;

        dao.Q1.Next;
        pb.Position:= pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;
    //final cores

    // inicio do tamanho
    if Prtamanho.Checked = true then
    begin
      pb.Position:= 0;
      sb_transferencia.Panels[0].Text:='Transferindo Arquivo de Tamanho para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;

      dao.Geral1('select * from tamanho ');
      pb.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      Application.ProcessMessages;
      dao.Q1.First;
      while not(dao.Q1.Eof) do
      begin
        dao.Geral1_NET('select * from tamanho where id ='+QuotedStr(dao.Q1.fieldbyname('id').AsString));
        if dao.q1_net.RecordCount <=0 then
          dao.Execsql_NET('insert into tamanho (id, tamanho) values ('+
                          QuotedStr(dao.Q1.fieldbyname('id').AsString) +','+QuotedStr(dao.Q1.fieldbyname('tamanho').AsString)+')')
        else
        begin
          if dao.q1_net.FieldByName('tamanho').AsString <> dao.Q1.FieldByName('tamanho').AsString then
             dao.Execsql_NET('update tamanho set id='+QuotedStr(dao.Q1.fieldbyname('id').AsString)+', tamanho = '+QuotedStr(dao.Q1.fieldbyname('tamanho').AsString)+' where id = '+QuotedStr(dao.q1.fieldbyname('id').AsString));

        end;
        dao.Q1.Next;
        pb.Position:= pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;
    //final tamanho

    // inicio do colecao
    if Prcolecao.Checked = true then
    begin
      pb.Position:= 0;
      sb_transferencia.Panels[0].Text:='Transferindo Arquivo de Coleção para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;

      dao.Geral1('select * from colecao ');//campos id e descricao
      pb.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      Application.ProcessMessages;
      dao.Q1.First;
      while not(dao.Q1.Eof) do
      begin
        dao.Geral1_NET('select * from colecao where id ='+QuotedStr(dao.Q1.fieldbyname('id').AsString));
        if dao.q1_net.RecordCount <=0 then
          dao.Execsql_NET('insert into colecao (id, descricao) values ('+QuotedStr(dao.Q1.fieldbyname('id').AsString) +','+QuotedStr(dao.Q1.fieldbyname('descricao').AsString)+')')
        else
        begin
          if dao.q1_net.FieldByName('descricao').AsString <> dao.Q1.FieldByName('descricao').AsString then
             dao.Execsql_NET('update colecao set id='+QuotedStr(dao.Q1.fieldbyname('id').AsString)+', descricao = '+QuotedStr(dao.Q1.fieldbyname('descricao').AsString)+' where id = '+QuotedStr(dao.q1.fieldbyname('id').AsString));
        end;
        dao.Q1.Next;
        pb.Position:= pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;
    //final coleção

    // inicio do grade
    if Prgrade.Checked = true then
    begin
      pb.Position:= 0;
      sb_transferencia.Panels[0].Text:='Transferindo Arquivo de Grade para Loja '+ nom_empresa+' ......';
      Application.ProcessMessages;

      dao.Geral1('select * from grade where cod_produto between '+QuotedStr(Prde.Text)+' and '+QuotedStr(Prate.Text));//campos id e descricao
      pb.Max:= dao.Q1.RecordCount;
      pb.Position:= pb.Position + 1;
      Application.ProcessMessages;
      dao.Q1.First;
      while not(dao.Q1.Eof) do
      begin
        dao.Geral1_NET('select * from grade where id ='+QuotedStr(dao.Q1.fieldbyname('id').AsString));
        if dao.q1_net.RecordCount <=0 then
        begin
          dao.Execsql_NET('insert into grade (id, id_cor, id_tamanho, cod_produto) values ('+QuotedStr(dao.Q1.fieldbyname('id').AsString) +','+QuotedStr(dao.Q1.fieldbyname('id_cor').AsString)+','+
          QuotedStr(dao.Q1.fieldbyname('id_tamanho').AsString) +','+QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString)+')');
        end;
        dao.Q1.Next;
        pb.Position := pb.Position + 1;
        Application.ProcessMessages;
      end;
    end;

    //final coleção
    sb_transferencia.Panels[0].Text:='Transferencia Concluida para Loja '+ nom_empresa+' ......';
    Application.ProcessMessages;

    dao.cn_net.Commit;
    Lbaguarde.Visible := false;
    Application.ProcessMessages;

 }
end;

procedure TFr_transferencia.PrdeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end
end;

procedure TFr_transferencia.envia_dados_internet_matriz(
  cod_empresa: string);
var
  cmd, cmd_values, values: string;
begin
  {   dao.Configura_CN_NET(Prcod_empresa1.Text);

     if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
     //transfere vendas.
     dao.Geral1('select * from vendas1 where dtadoc >= '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdata.Date)));
     dao.Q1.First;

     while not(dao.Q1.Eof) do
     begin
       //ENVIA O VENDAS 1
       cmd:= 'insert into vendas1 (numdoc, dtadoc,cod_cliente,cod_usuario,cod_empresa,faturado,consignacao,orcamento ';
       cmd_values:= QuotedStr(dao.Q1.fieldbyname('numdoc').AsString)+','+QuotedStr(dao.Q1.fieldbyname('dtadoc').AsString)+','+QuotedStr(dao.Q1.fieldbyname('cod_cliente').AsString)+
       ','+QuotedStr(dao.Q1.fieldbyname('cod_usuario').AsString)+','+QuotedStr(dao.Q1.fieldbyname('cod_empresa').AsString)+','+QuotedStr(dao.Q1.fieldbyname('faturado').AsString)+','+QuotedStr(dao.Q1.fieldbyname('consignacao').AsString)+
       ','+QuotedStr(dao.Q1.fieldbyname('orcamento').AsString);

       if dao.Q1.FieldByName('entregue').AsString <> '' then
       begin
         cmd:= cmd + ',entregue';
         cmd_values:= cmd_values + ','+QuotedStr(dao.Q1.fieldbyname('entregue').AsString) ;
       end;

       cmd:= cmd + ',tot_bruto, tot_liquido, prazo_pgto, cod_fop';
       cmd_values:= cmd_values + ','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('tot_bruto').AsString))+','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('tot_liquido').AsString))+','+
                                 QuotedStr(dao.Q1.fieldbyname('prazo_pgto').AsString)+','+QuotedStr(dao.Q1.fieldbyname('cod_fop').AsString);

       if dao.Q1.FieldByName('num_cupom').AsString <> '' then
       begin
         cmd:= cmd + ',num_cupom';
         cmd_values:= cmd_values + ',' +QuotedStr(dao.Q1.fieldbyname('num_cupom').AsString);
       end;

       cmd:= cmd + ',tipo_venda, qtd_parcelas';
       cmd_values:= cmd_values +',' +QuotedStr(dao.Q1.fieldbyname('tipo_venda').AsString)+','+QuotedStr(dao.Q1.fieldbyname('qtd_parcelas').AsString);

       if dao.Q1.FieldByName('valor_credito_usado').AsString <> '' then
       begin
         cmd:= cmd + ',valor_credito_usado';
         cmd_values:= cmd_values +','+QuotedStr(FMFUN.prepara_valor(dao.Q1.fieldbyname('valor_credito_usado').AsString));
       end;
       dao.Execsql_NET(cmd +' ) values ('+cmd_values+')');
       //FINAL DO ENVIA VENDAS2

       //ENVIA O VENDAS 2
       dao.Geral2('select * from vendas2 where numdoc='+QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));
       dao.Q2.First;
       while not(dao.Q2.Eof) do
       begin
         cmd:= 'insert into vendas2 (numdoc, cod_produto';
         cmd_values:= QuotedStr(dao.Q2.fieldbyname('numdoc').AsString)+','+QuotedStr(dao.q2.fieldbyname('cod_produto').AsString);

         if dao.Q2.FieldByName('id_cor').AsString <> '' then
         begin
           cmd:= cmd + ',id_cor';
           cmd_values:= cmd_values +','+ QuotedStr(dao.Q2.fieldbyname('id_cor').AsString);
         end;

         if dao.Q2.FieldByName('id_tamanho').AsString <> '' then
         begin
           cmd:= cmd + ',id_tamanho';
           cmd_values:= cmd_values +','+ QuotedStr(dao.Q2.fieldbyname('id_tamanho').AsString);
         end;

         if dao.Q2.FieldByName('qtd').AsString <> '' then
         begin
           cmd:= cmd + ',qtd';
           cmd_values:= cmd_values +','+ QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('qtd').AsString));
         end;

         if dao.Q2.FieldByName('qtd_devolvida').AsString <> '' then
         begin
           cmd:= cmd + ',qtd_devolvida';
           cmd_values:= cmd_values +','+ QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('qtd_devolvida').AsString));
         end;

         cmd:= cmd + ',preco,sub_total';
         cmd_values:= cmd_values + ','+QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('preco').AsString))+','+QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('sub_total').AsString));

         dao.Execsql2_NET(cmd+') values ('+cmd_values);
         dao.Q2.Next;
       end;

       dao.Q1.Next;
     end;

     dao.cn.Commit;

   }
end;

procedure TFr_transferencia.trata_romaneio2_para_filial(
  nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);

    while not eof(txt) do
    begin
      FORMATSETTINGS.DecimalSeparator := '.';
      dao.Geral1('select nr_documento from romaneio2 where nr_documento=' + QuotedStr(trim(copy(linha, 1, 6))) + ' and cod_fornecedor=' + QuotedStr(trim(copy(linha, 15, 4))));

      if dao.q1.RecordCount <= 0 then
      begin

        cmd := 'insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, custo, ' +
          'sub_total';

        if trim(copy(linha, 75, 4)) <> '' then
          cmd := cmd + ',id_cor';
        if trim(copy(linha, 80, 4)) <> '' then
          cmd := cmd + ',id_tamanho';

        cmd := cmd + ') values (' +
          QuotedStr(trim(copy(linha, 8, 6))) + ',' + //nr_documento
          QuotedStr(trim(copy(linha, 15, 4))) + ',' + //cod_fornecedor
          QuotedStr(trim(copy(linha, 20, 6))) + ',' + //cod_produto
          QuotedStr(trim(copy(linha, 27, 11))) + ',' + //qtd_entrada
          QuotedStr(trim(copy(linha, 39, 11))) + ',' + //custo
          QuotedStr(trim(copy(linha, 51, 11))); //sub_total
        if trim(copy(linha, 75, 4)) <> '' then
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 75, 4))); //id_cor

        if trim(copy(linha, 80, 4)) <> '' then
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 80, 4))); //id_tamanho

        cmd := cmd + ')'; //cod_colecao

        dao.Execsql(cmd);
      end;
      FORMATSETTINGS.decimalseparator := ',';

      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
      ReadLn(txt, linha);
    end;
    CloseFile(txt);
    // end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de atualização!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_transferencia.Prcod_empresa1Exit(Sender: TObject);
begin
  if trim(Prcod_empresa1.Text) = '' then
    Lbempresa1.Caption := '...';

  if Prcod_empresa1.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' + QuotedStr(Prcod_empresa1.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa1.Caption := dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_empresa1.Text := '';
      Prcod_empresa1.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_transferencia.trata_romaneio_para_filial(nom_arquivo: string; nom_arquivo2: string);
var
  txt, txt1: TextFile;
  linha, linha2: string;
  cmd: string;
  qtdlin: integer;
  nr_documento, cod_fornecedor: string;
begin
  AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
  AssignFile(txt1, 'c:\orbi\Recepcao\' + nom_arquivo2);
  Reset(txt);
  Reset(txt1);
  Readln(txt, linha);
  Readln(txt1, linha2);
  pb.Position := 0;
  qtdlin := 0;
  while not eof(txt) do
  begin
    qtdlin := qtdlin + 1;
    ReadLn(txt, linha);
  end;
  pb.Max := qtdlin;
  Reset(txt);

  while not eof(txt) do
  begin
    //      if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    FORMATSETTINGS.DecimalSeparator := '.';
    dao.Geral1('select nr_documento from romaneio1 where nr_documento=' + QuotedStr(trim(copy(linha, 1, 6))) + ' and cod_fornecedor=' + QuotedStr(trim(copy(linha, 8, 4))));

    if dao.q1.RecordCount <= 0 then
    begin
      nr_documento := trim(copy(linha, 1, 6));
      cod_fornecedor := trim(copy(linha, 8, 4));
      cmd := 'insert into romaneio1 (nr_documento, cod_fornecedor, dta_documento, cod_fiscal, vl_frete';
      cmd := cmd + ', vl_outros, total_mercadorias, vl_total, obs_nota1, obs_nota2, obs_nota3, rom_fechado' +
        ',cod_empresa ';

      if trim(copy(linha, 235, 4)) <> '' then
        cmd := cmd + ',cod_transportadora';

      cmd := cmd + ', empresa_destino';

      cmd := cmd + ')';

      cmd := cmd + ' values (' +
        QuotedStr(trim(copy(linha, 1, 6))) + ',' + //nr_documento
        QuotedStr(trim(copy(linha, 8, 4))) + ',' + //cod_fornecedor
        QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 13, 10))))) + ',' + //dta_ult_atualizacao
        QuotedStr(trim(copy(linha, 24, 5))) + ',' + //cod_fiscal
        QuotedStr(trim(copy(linha, 30, 11))) + ',' + //vl_frete
        QuotedStr(trim(copy(linha, 42, 11))) + ',' + //vl_outros
        QuotedStr(trim(copy(linha, 54, 11))) + ',' + //total_mercadorias
        QuotedStr(trim(copy(linha, 66, 11))) + ',' + //vl_outros
        QuotedStr(trim(copy(linha, 78, 50))) + ',' + //obs_nota1
        QuotedStr(trim(copy(linha, 129, 50))) + ',' + //obs_nota2
        QuotedStr(trim(copy(linha, 180, 50))) + ',' + //obs_nota3
        QuotedStr(trim('N')) + ',' + //rom_fechado
        QuotedStr(trim(copy(linha, 231, 3))) + ','; //cod_empresa
      if trim(copy(linha, 235, 4)) <> '' then
        cmd := cmd + QuotedStr(trim(copy(linha, 235, 4))) + ','; //cod_transportadora

      cmd := cmd + QuotedStr(trim(copy(linha, 240, 3))); //empresa destino

      cmd := cmd + ')';

      dao.Execsql(cmd);
    end;

    FORMATSETTINGS.decimalseparator := ',';
    pb.Position := pb.Position + 1;
    Application.ProcessMessages;
    ReadLn(txt, linha);

    if eof(txt) then
    begin
      //          if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
      FORMATSETTINGS.DecimalSeparator := '.';
      dao.Geral1('select nr_documento from romaneio1 where nr_documento=' + QuotedStr(trim(copy(linha, 1, 6))) + ' and cod_fornecedor=' + QuotedStr(trim(copy(linha, 8, 4))));

      if dao.q1.RecordCount <= 0 then
      begin
        nr_documento := trim(copy(linha, 1, 6));
        cod_fornecedor := trim(copy(linha, 8, 4));
        cmd := 'insert into romaneio1 (nr_documento, cod_fornecedor, dta_documento, cod_fiscal, vl_frete';
        cmd := cmd + ', vl_outros, total_mercadorias, vl_total, obs_nota1, obs_nota2, obs_nota3, rom_fechado' +
          ',cod_empresa ';

        if trim(copy(linha, 235, 4)) <> '' then
          cmd := cmd + ',cod_transportadora';

        cmd := cmd + ', empresa_destino';

        cmd := cmd + ')';

        cmd := cmd + ' values (' +
          QuotedStr(trim(copy(linha, 1, 6))) + ',' + //nr_documento
          QuotedStr(trim(copy(linha, 8, 4))) + ',' + //cod_fornecedor
          QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 13, 10))))) + ',' + //dta_ult_atualizacao
          QuotedStr(trim(copy(linha, 24, 5))) + ',' + //cod_fiscal
          QuotedStr(trim(copy(linha, 30, 11))) + ',' + //vl_frete
          QuotedStr(trim(copy(linha, 42, 11))) + ',' + //vl_outros
          QuotedStr(trim(copy(linha, 54, 11))) + ',' + //total_mercadorias
          QuotedStr(trim(copy(linha, 66, 11))) + ',' + //vl_outros
          QuotedStr(trim(copy(linha, 78, 50))) + ',' + //obs_nota1
          QuotedStr(trim(copy(linha, 129, 50))) + ',' + //obs_nota2
          QuotedStr(trim(copy(linha, 180, 50))) + ',' + //obs_nota3
          QuotedStr(trim('N')) + ',' + //rom_fechado
          QuotedStr(trim(copy(linha, 231, 3))) + ','; //cod_empresa
        if trim(copy(linha, 235, 4)) <> '' then
          cmd := cmd + QuotedStr(trim(copy(linha, 235, 4))) + ','; //cod_transportadora

        cmd := cmd + QuotedStr(trim(copy(linha, 240, 3))); //empresa destino

        cmd := cmd + ')';

        dao.Execsql(cmd);
      end;

      FORMATSETTINGS.decimalseparator := ',';
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
      ReadLn(txt, linha);
    end;

  end;
  CloseFile(txt);

  //aqui vai o proc do romaneio2
  Reset(txt1);

  while not eof(txt1) do
  begin
    FORMATSETTINGS.DecimalSeparator := '.';
    cmd := 'insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, custo, ' +
      'sub_total';

    if trim(copy(linha2, 75, 4)) <> '' then
      cmd := cmd + ',id_cor';
    if trim(copy(linha2, 80, 4)) <> '' then
      cmd := cmd + ',id_tamanho';

    cmd := cmd + ') values (' +
      QuotedStr(trim(copy(linha2, 8, 6))) + ',' + //nr_documento
      QuotedStr(trim(copy(linha2, 15, 4))) + ',' + //cod_fornecedor
      QuotedStr(trim(copy(linha2, 20, 6))) + ',' + //cod_produto
      QuotedStr(trim(copy(linha2, 27, 11))) + ',' + //qtd_entrada
      QuotedStr(trim(copy(linha2, 39, 11))) + ',' + //custo
      QuotedStr(trim(copy(linha2, 51, 11))); //sub_total
    if trim(copy(linha2, 75, 4)) <> '' then
      cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 75, 4))); //id_cor

    if trim(copy(linha2, 80, 4)) <> '' then
      cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 80, 4))); //id_tamanho

    cmd := cmd + ')'; //cod_colecao

    dao.Execsql(cmd);
    ReadLn(txt1, linha2);
  end;
  if eof(txt1) then
  begin
    FORMATSETTINGS.DecimalSeparator := '.';
    cmd := 'insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, custo, ' +
      'sub_total';

    if trim(copy(linha2, 75, 4)) <> '' then
      cmd := cmd + ',id_cor';
    if trim(copy(linha2, 80, 4)) <> '' then
      cmd := cmd + ',id_tamanho';

    cmd := cmd + ') values (' +
      QuotedStr(trim(copy(linha2, 8, 6))) + ',' + //nr_documento
      QuotedStr(trim(copy(linha2, 15, 4))) + ',' + //cod_fornecedor
      QuotedStr(trim(copy(linha2, 20, 6))) + ',' + //cod_produto
      QuotedStr(trim(copy(linha2, 27, 11))) + ',' + //qtd_entrada
      QuotedStr(trim(copy(linha2, 39, 11))) + ',' + //custo
      QuotedStr(trim(copy(linha2, 51, 11))); //sub_total
    if trim(copy(linha2, 75, 4)) <> '' then
      cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 75, 4))); //id_cor

    if trim(copy(linha2, 80, 4)) <> '' then
      cmd := cmd + ',' + QuotedStr(trim(copy(linha2, 80, 4))); //id_tamanho

    cmd := cmd + ')'; //cod_colecao

    dao.Execsql(cmd);
  end;

end;

procedure TFr_transferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FORMATSETTINGS.DecimalSeparator := ',';
end;

{try   //  quardando o procedimento para o envio do email
  FRPRI.Configura_Email(cod_empresa);
  if trim(copy(linha,8,4)) <> '' then
     dao.Geral3('select razao_social from fornecedor where cod_fornecedor='+QuotedStr(trim(copy(linha,8,4))));
  if trim(copy(linha,240,3)) <> '' then
      dao.Geral2('select ema_email from empresa where cod_empresa ='+QuotedStr(trim(copy(linha,240,3))));

  if (dao.Q2.FieldByName('ema_email').AsString <> '') and (dao.Q3.FieldByName('razao_social').AsString <> '') then
     FRPRI.envia_email('Voce Recebeu um Romaneio para Lançamento no Sistema '+#13+
                       'Nº Romaneio: '+trim(copy(linha,1,6))+#13+
                       'Data: '+trim(copy(linha,13,10))+#13+
                       'Fornecedor: '+dao.Q3.fieldbyname('razao_social').AsString+#13+
                       'Qtd Itens: '+trim(copy(linha,54,11)),
                       'Romaneio '+trim(copy(linha,1,6))+ 'Recebido no Sistema',dao.q2.fieldbyname('ema_email').AsString,'','','');
except
  dao.msg('Não foi possivel enviar o email de aviso de Romaneio!');
end;}

procedure TFr_transferencia.monta_arquivo_envio(nom_arquivo, cod_prodini, cod_prodfin: string);
var
  txt: TextFile;
  linha: string;
begin
  AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);

  Rewrite(txt);

  //CRIAR ARQUIVO PRODUTO

  dao.Geral1('select cod_produto, nom_produto, cod_grupo, unidade, custo, qtd_embalagem, preco_venda, ' +
    'status, grade, cod_colecao, id_marca, fornecedor_principal from produto ' +
    'where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin) +
    ' order by cod_produto');
  dao.Q1.First;
  FORMATSETTINGS.DecimalSeparator := '.';
  while not (dao.q1.eof) do
  begin
    write(txt, ajustastr('1', 3));
    if dao.Q1.FieldByName('cod_produto').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 6))
    else
      Write(txt, ajustastr(' ', 6));

    Write(txt, '|');
    //if dao.Q1.FieldByName('cod_produto').AsString = '2073' then
    //    showmessage('chegou');

    Write(txt, ajustastr(dao.Q1.FieldByName('nom_produto').AsString, 50));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_grupo').AsString, 4));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('unidade').AsString, 1));

    Write(txt, '|');

    if dao.Q1.FieldByName('custo').AsString <> '' then
      Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('custo').AsFloat))
    else
      Write(txt, FormatFloat('00000000.00', 0));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('qtd_embalagem').AsFloat));

    Write(txt, '|');

    Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('preco_venda').AsFloat));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('status').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('grade').AsString, 1));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('cod_colecao').AsString, 3));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('id_marca').AsString, 3));

    Write(txt, '|');

    Write(txt, ajustastr(dao.Q1.FieldByName('fornecedor_principal').AsString, 4));

    WriteLn(txt);
    dao.Q1.Next;
  end;

  {*********** monta grade*****************}
  dao.Geral1('select * from grade ' +
    'where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin));
  dao.Q1.First;
  while not (dao.Q1.Eof) do
  begin
    write(txt, ajustastr('2', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('id_cor').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('id_tamanho').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 12));
    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta cod_barras*****************}
  dao.Geral1('select cb.* from cod_barras cb where cod_produto between ' + QuotedStr(cod_prodini) + ' and ' + QuotedStr(cod_prodfin));
  dao.Q1.first;
  while not (dao.q1.eof) do
  begin
    write(txt, ajustastr('3', 3));
    write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('cod_barras').AsString, 25));
    Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 10));
    Write(txt, ajustastr(dao.Q1.FieldByName('data').AsString, 10));
    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta cor*****************}
  dao.Geral1('select * from cores');
  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    write(txt, ajustastr('4', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('Cor').AsString, 31));
    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta tamanho*****************}
  dao.Geral1('select * from tamanho');
  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    write(txt, ajustastr('5', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('tamanho').AsString, 50));
    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta coleção*****************}
  dao.Geral1('select * from colecao');

  dao.Q1.First;
  while not dao.Q1.Eof do
  begin
    write(txt, ajustastr('6', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('descricao').AsString, 50));
    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta marca*****************}
  dao.geral1('select * from marcas');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    write(txt, ajustastr('7', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('id').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('nom_marca').AsString, 50));

    WriteLn(txt);
    dao.Q1.Next;
  end;
  {*********** monta fornecedor*****************}
  dao.Geral1('select * from fornecedor');
  dao.Q1.First;
  while not (dao.q1.Eof) do
  begin
    write(txt, ajustastr('8', 3));
    Write(txt, ajustastr(dao.Q1.FieldByName('cod_fornecedor').AsString, 6));
    Write(txt, ajustastr(dao.Q1.FieldByName('razao_social').AsString, 50));
    Write(txt, ajustastr(dao.Q1.FieldByName('fantasia').AsString, 50));

    WriteLn(txt);
    dao.Q1.Next;

  end;

  CloseFile(txt);

end;

procedure TFr_transferencia.trata_lote_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    Reset(txt);

    Readln(txt, linha);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);
    ReadLn(txt, linha);
    pb.Position := 0;

    if (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not eof(txt) do
    begin
      if trim(copy(linha, 1, 3)) = '1' then //produto
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Produto.....';
        dao.Geral1('select cod_produto from produto where cod_produto= ' + QuotedStr(trim(copy(linha, 4, 6))));
        FORMATSETTINGS.DecimalSeparator := '.';
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into produto (';

          if trim(copy(linha, 4, 6)) <> '' then
            cmd := cmd + ' cod_produto';
          if trim(copy(linha, 11, 50)) <> '' then
            cmd := cmd + ', nom_produto';
          if trim(copy(linha, 62, 4)) <> '' then
            cmd := cmd + ',cod_grupo';
          //        if trim(copy(linha,67,1)) <> '' then
          //           cmd:= cmd + ', unidade ';
          if trim(copy(linha, 69, 11)) <> '' then
            cmd := cmd + ' , custo';
          if trim(copy(linha, 81, 11)) <> '' then
            cmd := cmd + ' , qtd_embalagem';
          if trim(copy(linha, 93, 11)) <> '' then
            cmd := cmd + ' , preco_venda';
          if trim(copy(linha, 105, 1)) <> '' then
            cmd := cmd + ' , status';
          if trim(copy(linha, 107, 1)) <> '' then
            cmd := cmd + ', grade';
          if trim(copy(linha, 109, 3)) <> '' then
            cmd := cmd + ', cod_colecao';
          if trim(copy(linha, 113, 3)) <> '' then
            cmd := cmd + ', id_marca';
          if trim(copy(linha, 117, 4)) <> '' then
            cmd := cmd + ', fornecedor_principal';
          cmd := cmd + ')';
          cmd := cmd + ' values (';
          if trim(copy(linha, 4, 6)) <> '' then
            cmd := cmd + QuotedStr(trim(copy(linha, 4, 6))); //cod_produto
          if trim(copy(linha, 11, 50)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 11, 50))); //nom_produto
          if trim(copy(linha, 62, 4)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 62, 4))); //cod_grupo
          //        cmd:= cmd + QuotedStr(trim(copy(linha,64,1)))+ ','+//unidade
          if trim(copy(linha, 69, 11)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 69, 11))); //custo
          if trim(copy(linha, 81, 11)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 81, 11))); //qtd_embalagem
          if trim(copy(linha, 93, 11)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 93, 11))); //preco venda
          if trim(copy(linha, 105, 1)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 105, 1))); //status
          if trim(copy(linha, 107, 1)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 107, 1))); //Grade
          if trim(copy(linha, 109, 3)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 109, 3))); //cod_colecao
          if trim(copy(linha, 113, 3)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 113, 3))); //id_marca
          if trim(copy(linha, 117, 4)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 117, 4))); //fornecedor_principal
          cmd := cmd + ')'; //cod_colecao

          dao.Execsql(cmd);
          FORMATSETTINGS.decimalseparator := ',';
        end
        else //update
        begin
          FORMATSETTINGS.DecimalSeparator := '.';
          cmd := 'update produto set nom_produto=' + QuotedStr(trim(copy(linha, 11, 50)));
          if trim(copy(linha, 62, 4)) <> '' then
            cmd := cmd + ',cod_grupo=' + QuotedStr(trim(copy(linha, 62, 4))); //cod_grupo
          //        cmd:= cmd + QuotedStr(trim(copy(linha,64,1)))+ ','+//unidade
          if trim(copy(linha, 69, 11)) <> '' then
            cmd := cmd + ',custo=' + QuotedStr(trim(copy(linha, 69, 11))); //custo
          if trim(copy(linha, 81, 11)) <> '' then
            cmd := cmd + ',qtd_embalagem=' + QuotedStr(trim(copy(linha, 81, 11))); //qtd_embalagem
          if trim(copy(linha, 93, 11)) <> '' then
            cmd := cmd + ',preco_venda=' + QuotedStr(trim(copy(linha, 93, 11))); //preco venda
          if trim(copy(linha, 105, 1)) <> '' then
            cmd := cmd + ',status=' + QuotedStr(trim(copy(linha, 105, 1))); //status
          if trim(copy(linha, 107, 1)) <> '' then
            cmd := cmd + ',grade=' + QuotedStr(trim(copy(linha, 107, 1))); //Grade
          if trim(copy(linha, 109, 3)) <> '' then
            cmd := cmd + ',cod_colecao=' + QuotedStr(trim(copy(linha, 109, 3))); //cod_colecao
          if trim(copy(linha, 113, 3)) <> '' then
            cmd := cmd + ',id_marca=' + QuotedStr(trim(copy(linha, 113, 3))); //id_marca
          if trim(copy(linha, 117, 4)) <> '' then
            cmd := cmd + ',fornecedor_principal=' + QuotedStr(trim(copy(linha, 117, 4))); //fornecedor_principal
          //          if trim(copy(linha,4,6)) <> '' then
          cmd := cmd + ' where cod_produto =' + QuotedStr(trim(copy(linha, 4, 6)));

          dao.Execsql(cmd);
          FORMATSETTINGS.DecimalSeparator := ',';
        end;
      end; //end do if para produto='1'
      if trim(copy(linha, 1, 3)) = '2' then
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Grade.....';
        dao.Geral1('select id from grade where id = ' + quotedstr(trim(copy(linha, 4, 6))));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into grade (id ,id_cor, id_tamanho, cod_produto)';
          cmd := cmd + ' values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 16, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 22, 12)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end
        else //update
        begin
          cmd := 'update grade set ';
          if trim(copy(linha, 7, 3)) <> '' then
            cmd := cmd + ' id_cor =' + QuotedStr(trim(copy(linha, 10, 6)));
          if trim(copy(linha, 10, 6)) <> '' then
            cmd := cmd + ', id_tamanho =' + QuotedStr(trim(copy(linha, 16, 6)));
          if trim(copy(linha, 16, 6)) <> '' then
            cmd := cmd + ', cod_produto =' + QuotedStr(trim(copy(linha, 22, 12)));
          cmd := cmd + ' where id=' + QuotedStr(trim(copy(linha, 4, 6)));
          dao.Execsql(cmd);
        end;
      end; //end do if grade = '2'

      if trim(copy(linha, 1, 3)) = '3' then //cod_barras
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Código de Barras.....';
        dao.Geral1('select id from cod_barras where id = ' + quotedStr(trim(copy(linha, 4, 6))));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into cod_barras (id ,cod_barras, cod_produto';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 25)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 35, 10)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; // end do if da cod _barras
      if trim(copy(linha, 1, 3)) = '4' then //*****cor
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Cor.....';
        dao.Geral1('select id from cores where id = ' + trim(copy(linha, 4, 6)) + ' and cor=' + QuotedStr(trim(copy(linha, 10, 31))));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into cores (id ,cor ';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 31)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; //end do if do cores

      if trim(copy(linha, 1, 3)) = '5' then //***** tamanho
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Tamanho.....';
        dao.Geral1('select id from tamanho where id = ' + trim(copy(linha, 4, 6)) + ' and tamanho =' + QuotedStr(trim(copy(linha, 10, 25))));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into tamanho (id , tamanho ';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 25)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; //end do if tamanho

      if trim(copy(linha, 1, 3)) = '6' then //**********colecao
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Coleção.....';
        dao.Geral1('select id from colecao where id = ' + trim(copy(linha, 4, 6)));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into colecao (id , descricao ';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 50)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; //end do if colecao

      if trim(copy(linha, 1, 3)) = '7' then //****** Marca
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Marca.....';
        dao.Geral1('select id from marcas where id = ' + trim(copy(linha, 4, 6)));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into marcas (id , nom_marca ';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 25)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; //end do if marca

      if trim(copy(linha, 1, 3)) = '8' then //****** Fornecedor
      begin
        sb_transferencia.Panels[0].text := 'Recebendo Arquivo de Fonecedor.....';
        dao.Geral1('select cod_fornecedor from fornecedor where cod_fornecedor = ' + trim(copy(linha, 4, 6)));
        if dao.Q1.RecordCount <= 0 then
        begin
          cmd := 'insert into fornecedor (cod_fornecedor , razao_social';
          if trim(copy(linha, 60, 50)) <> '' then
            cmd := cmd + ',fantasia ';
          cmd := cmd + ') values (';
          cmd := cmd + QuotedStr(trim(copy(linha, 4, 6)));
          cmd := cmd + ',' + QuotedStr(trim(copy(linha, 10, 25)));
          if trim(copy(linha, 60, 50)) <> '' then
            cmd := cmd + ',' + QuotedStr(trim(copy(linha, 60, 50)));
          cmd := cmd + ')';
          dao.Execsql(cmd);
        end;
      end; //end do if marca

      ReadLn(txt, linha);
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;

    end; //end do while do txt

    CloseFile(txt);
    dao.cn.commit;
    FORMATSETTINGS.DecimalSeparator := ','
      // end;
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao Transmitir o arquivo de atulização!' + #13 +
        e.message + #13 + cmd + #13 + linha);
      dao.cn.Rollback;
      CloseFile(txt)

    end;
  end;

end;

procedure TFr_transferencia.Monta_venda1_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin
  dao.Geral1('select * from vendas1 where venda_enviada = ' + QuotedStr('N'));
  if dao.Q1.RecordCount > 0 then
  begin
    AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
    Rewrite(txt);

    //CRIAR ARQUIVO PRODUTO

    dao.Q1.First;
    FORMATSETTINGS.DecimalSeparator := '.';
    while not dao.Q1.Eof do
    begin
      if dao.Q1.FieldByName('numdoc').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('numdoc').AsString, 7))
      else
        Write(txt, ajustastr(' ', 7));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('dtadoc').AsString, 11));

      Write(txt, '|');

      Write(txt, ajustastr(dao.Q1.FieldByName('cod_cliente').AsString, 6));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_representante').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_representante').AsString, 5))
      else
        Write(txt, ajustastr(' ', 5));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_empresa').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_empresa').AsString, 5))
      else
        Write(txt, ajustastr('', 5));

      Write(txt, '|');

      if dao.Q1.FieldByName('faturado').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('faturado').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('consignacao').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('consignacao').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('orcamento').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('orcamento').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('tot_bruto').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('tot_bruto').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('desconto').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('desconto').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('tot_liquido').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('tot_liquido').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('prazo_pgto').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('prazo_pgto').AsString, 30))
      else
        Write(txt, ajustastr('', 30));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_fop').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_fop').AsString, 5))
      else
        Write(txt, ajustastr('', 5));

      Write(txt, '|');

      if dao.Q1.FieldByName('tipo_venda').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('tipo_venda').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('qtd_parcelas').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('qtd_parcelas').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('credito_usado').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('credito_usado').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('usuario_desfaturou').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('usuario_desfaturou').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('contem_avaria').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('contem_avaria').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('contem_etiqueta').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('contem_etiqueta').AsString, 2))
      else
        Write(txt, ajustastr('', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('nr_venda_original').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('nr_venda_original').AsString, 10))
      else
        Write(txt, ajustastr('', 10));

      WriteLn(txt);
      dao.Q1.Next;
    end;

    FORMATSETTINGS.DecimalSeparator := ',';
    CloseFile(txt);

  end;

end;

procedure TFr_transferencia.Monta_venda2_para_filial(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
begin
  //CRIAR ARQUIVO PRODUTO
  dao.Geral1('select v2.* from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc=v2.numdoc ' +
    'where  v1.venda_enviada=' + QuotedStr('N'));

  if dao.Q1.RecordCount > 0 then
  begin
    AssignFile(txt, 'c:\orbi\Transmicao\' + nom_arquivo);
    Rewrite(txt);

    dao.Q1.First;
    FORMATSETTINGS.DecimalSeparator := '.';
    while not dao.Q1.Eof do
    begin
      if dao.Q1.FieldByName('numdoc').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('numdoc').AsString, 7))
      else
        Write(txt, ajustastr(' ', 7));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_empresa').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_empresa').AsString, 5))
      else
        Write(txt, ajustastr(' ', 5));

      Write(txt, '|');

      if dao.Q1.FieldByName('dtadoc').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('dtadoc').AsString, 11))
      else
        Write(txt, ajustastr(' ', 11));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_produto').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_produto').AsString, 10))
      else
        Write(txt, ajustastr(' ', 10));

      Write(txt, '|');

      if dao.Q1.FieldByName('cod_cliente').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('cod_cliente').AsString, 10))
      else
        Write(txt, ajustastr(' ', 10));

      Write(txt, '|');

      if dao.Q1.FieldByName('id_cor').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('id_cor').AsString, 6))
      else
        Write(txt, ajustastr(' ', 6));

      Write(txt, '|');

      if dao.Q1.FieldByName('id_tamanho').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('id_tamanho').AsString, 6))
      else
        Write(txt, ajustastr(' ', 6));

      Write(txt, '|');

      if dao.Q1.FieldByName('qtd').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('qtd').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('qtd_devolvida').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('qtd_devolvida').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('devolvido').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('devolvido').AsString, 2))
      else
        Write(txt, ajustastr(' ', 2));

      Write(txt, '|');

      if dao.Q1.FieldByName('preco').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('preco').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('sub_total').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('sub_total').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('desconto').AsString <> '' then
        Write(txt, FormatFloat('00000000.00', dao.Q1.FieldByName('desconto').AsFloat))
      else
        Write(txt, FormatFloat('00000000.00', 0));

      Write(txt, '|');

      if dao.Q1.FieldByName('trocado').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('trocado').AsString, 2))
      else
        Write(txt, ajustastr(' ', 2));

      WriteLn(txt);
      dao.Q1.Next;
    end;
    FORMATSETTINGS.DecimalSeparator := ',';
    CloseFile(txt);
  end;

end;

procedure TFr_transferencia.trata_venda_para_filial(nom_arquivo,
  nom_arquivo2: string);
var
  txt, txt1: TextFile;
  linha, linha2: string;
  cmd: string;
  qtdlin: integer;
  nr_documento, cod_fornecedor: string;
  valor: string;
begin // begin inicial
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    AssignFile(txt, 'c:\orbi\Recepcao\' + nom_arquivo);
    AssignFile(txt1, 'c:\orbi\Recepcao\' + nom_arquivo2);
    Reset(txt);
    Reset(txt1);
    Readln(txt, linha);
    Readln(txt1, linha2);
    pb.Position := 0;
    qtdlin := 0;
    while not eof(txt) do
    begin
      qtdlin := qtdlin + 1;
      ReadLn(txt, linha);
    end;
    pb.Max := qtdlin;
    Reset(txt);
    while not eof(txt) do
    begin // begin 1
      FORMATSETTINGS.DecimalSeparator := '.';
      dao.Geral1('select numdoc from vendas1 where numdoc=' + QuotedStr(trim(copy(linha, 1, 7))) + ' and cod_empresa =' + quotedstr(trim(copy(linha, 34, 5))));
      if dao.q1.RecordCount <= 0 then
      begin // begin 2
        cmd := 'insert into vendas1 (num_doc';
        if trim(copy(linha, 9, 11)) <> '' then
          cmd := cmd + ',datadoc';
        if trim(copy(linha, 21, 6)) <> '' then
          cmd := cmd + ',cod_cliente';
        if trim(copy(linha, 28, 5)) <> '' then
          cmd := cmd + ',cod_representante';
        if trim(copy(linha, 34, 5)) <> '' then
          cmd := cmd + ',cod_empresa';
        if trim(copy(linha, 40, 2)) <> '' then
          cmd := cmd + ',faturado';
        if trim(copy(linha, 43, 2)) <> '' then
          cmd := cmd + ',consignacao';
        if trim(copy(linha, 46, 2)) <> '' then
          cmd := cmd + ',orcamento';
        if trim(copy(linha, 49, 11)) <> '' then
          cmd := cmd + ',tot_bruto';
        if trim(copy(linha, 61, 11)) <> '' then
          cmd := cmd + ',desconto';
        if trim(copy(linha, 73, 11)) <> '' then
          cmd := cmd + ',tot_liquido';
        if trim(copy(linha, 85, 30)) <> '' then
          cmd := cmd + ',prazo_pgto';
        if trim(copy(linha, 116, 6)) <> '' then
          cmd := cmd + ',cod_fop';
        if trim(copy(linha, 122, 2)) <> '' then
          cmd := cmd + ',tipo_venda';
        if trim(copy(linha, 125, 2)) <> '' then
          cmd := cmd + ',qtd_parcelas';
        if trim(copy(linha, 128, 11)) <> '' then
          cmd := cmd + ',credito_usado';
        if trim(copy(linha, 140, 2)) <> '' then
          cmd := cmd + ',usuario_desfaturou';
        if trim(copy(linha, 143, 2)) <> '' then
          cmd := cmd + ',contem_avaria';
        if trim(copy(linha, 146, 2)) <> '' then
          cmd := cmd + ',contem_etiqueta ';
        if trim(copy(linha, 149, 10)) <> '' then
          cmd := cmd + ',nr_venda_original';
        cmd := cmd + ' values (';
        if trim(copy(linha, 1, 7)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha, 1, 7))); //num_doc
        if trim(copy(linha, 9, 11)) <> '' then
          valor := valor + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 9, 11))))); //data do documento
        if trim(copy(linha, 21, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 21, 6))); //cod do cliente
        if trim(copy(linha, 28, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 28, 5))); //cod do representante
        if trim(copy(linha, 34, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 34, 5))); //cod da empresa
        if trim(copy(linha, 40, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 40, 2))); //faturado
        if trim(copy(linha, 43, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 43, 2))); //consignação
        if trim(copy(linha, 46, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 46, 2))); //orçamento
        if trim(copy(linha, 49, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 49, 11))); //tot_bruto
        if trim(copy(linha, 61, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 61, 11))); //desconto
        if trim(copy(linha, 73, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 73, 11))); //tot_liquido
        if trim(copy(linha, 85, 30)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 85, 30))); //prazo_pagamento
        if trim(copy(linha, 116, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 116, 6))); //cod fop
        if trim(copy(linha, 122, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 122, 2))); //tipo de venda
        if trim(copy(linha, 125, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 125, 2))); //quantidade parcela
        if trim(copy(linha, 128, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 128, 11))); //credito usado
        if trim(copy(linha, 140, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 140, 2))); //usuario desfaturou
        if trim(copy(linha, 143, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 143, 2))); //contem avaria
        if trim(copy(linha, 146, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 146, 2))); //contem etiqueta
        if trim(copy(linha, 149, 10)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 149, 10))); //numero da venda original

        cmd := cmd + valor + ')';

        dao.Execsql(cmd);
        FORMATSETTINGS.decimalseparator := ',';
      end; // end do begin 2

      //aqui vai o proc do vendas2
      Reset(txt1);
      while not eof(txt1) do
      begin // begin 1
        FORMATSETTINGS.DecimalSeparator := '.';
        cmd := 'insert into vendas2 (';
        if trim(copy(linha2, 1, 7)) <> '' then
          cmd := cmd + 'numdoc';
        if trim(copy(linha2, 9, 5)) <> '' then
          cmd := cmd + ',cod_empresa';
        if trim(copy(linha2, 15, 11)) <> '' then
          cmd := cmd + ',dtadoc';
        if trim(copy(linha2, 27, 10)) <> '' then
          cmd := cmd + ',cod_produto';
        if trim(copy(linha2, 38, 10)) <> '' then
          cmd := cmd + ',cod_cliente';
        if trim(copy(linha2, 49, 6)) <> '' then
          cmd := cmd + ',id_cor';
        if trim(copy(linha2, 56, 6)) <> '' then
          cmd := cmd + ',id_tamanho';
        if trim(copy(linha2, 63, 11)) <> '' then
          cmd := cmd + ',qtd';
        if trim(copy(linha2, 75, 11)) <> '' then
          cmd := cmd + ',qtd_devolvida';
        if trim(copy(linha2, 87, 2)) <> '' then
          cmd := cmd + ',devolvido';
        if trim(copy(linha2, 90, 11)) <> '' then
          cmd := cmd + ',preco';
        if trim(copy(linha2, 102, 11)) <> '' then
          cmd := cmd + ',sub_total';
        if trim(copy(linha2, 114, 11)) <> '' then
          cmd := cmd + ',desconto';
        if trim(copy(linha2, 126, 2)) <> '' then
          cmd := cmd + ',trocado';
        cmd := cmd + ') values (';
        if trim(copy(linha2, 1, 7)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha2, 1, 7))); //num_doc
        if trim(copy(linha2, 9, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 9, 5))); //cod_empresa
        if trim(copy(linha2, 15, 11)) <> '' then
          valor := valor + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha2, 15, 11))))); //dtadoc
        if trim(copy(linha2, 27, 10)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 27, 10))); //cod_produto
        if trim(copy(linha2, 38, 10)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 38, 10))); //cod_cliente
        if trim(copy(linha2, 49, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 49, 6))); //id_cor
        if trim(copy(linha2, 56, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 56, 6))); //id_tamanho
        if trim(copy(linha2, 63, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 63, 11))); //qtd
        if trim(copy(linha2, 75, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 75, 11))); //qtd_devolvida
        if trim(copy(linha2, 87, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 87, 2))); //devolvido
        if trim(copy(linha2, 90, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 90, 11))); //preco
        if trim(copy(linha2, 102, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 102, 11))); //sub_total
        if trim(copy(linha2, 114, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 114, 11))); // desconto
        if trim(copy(linha2, 126, 2)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha2, 126, 2))); //trocado
        cmd := cmd + valor + ')';
        dao.Execsql(cmd);
        FORMATSETTINGS.decimalseparator := ',';
        ReadLn(txt1, linha2);
        Valor := '';
      end; // end do begin 1

      if eof(txt1) then
      begin // begin 1
        FORMATSETTINGS.DecimalSeparator := '.';
        cmd := 'insert into vendas2 (';
        if trim(copy(linha2, 1, 7)) <> '' then
          cmd := cmd + 'numdoc';
        if trim(copy(linha2, 9, 5)) <> '' then
          cmd := cmd + ',cod_empresa';
        if trim(copy(linha2, 15, 11)) <> '' then
          cmd := cmd + ',dtadoc';
        if trim(copy(linha2, 27, 10)) <> '' then
          cmd := cmd + ',cod_produto';
        if trim(copy(linha2, 38, 10)) <> '' then
          cmd := cmd + ',cod_cliente';
        if trim(copy(linha2, 49, 6)) <> '' then
          cmd := cmd + ',id_cor';
        if trim(copy(linha2, 56, 6)) <> '' then
          cmd := cmd + ',id_tamanho';
        if trim(copy(linha2, 63, 11)) <> '' then
          cmd := cmd + ',qtd';
        if trim(copy(linha2, 75, 11)) <> '' then
          cmd := cmd + ',qtd_devolvida';
        if trim(copy(linha2, 87, 2)) <> '' then
          cmd := cmd + ',devolvido';
        if trim(copy(linha2, 90, 11)) <> '' then
          cmd := cmd + ',preco';
        if trim(copy(linha2, 102, 11)) <> '' then
          cmd := cmd + ',sub_total';
        if trim(copy(linha2, 114, 11)) <> '' then
          cmd := cmd + ',desconto';
        if trim(copy(linha2, 126, 2)) <> '' then
          cmd := cmd + ',trocado';
        cmd := cmd + ') values (';
        if trim(copy(linha2, 1, 7)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha2, 1, 7))); //num_doc
        if trim(copy(linha2, 9, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 9, 5))); //cod_empresa
        if trim(copy(linha2, 15, 11)) <> '' then
          valor := valor + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha2, 15, 11))))); //dtadoc
        if trim(copy(linha2, 27, 10)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 27, 10))); //cod_produto
        if trim(copy(linha2, 38, 10)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 38, 10))); //cod_cliente
        if trim(copy(linha2, 49, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 49, 6))); //id_cor
        if trim(copy(linha2, 56, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 56, 6))); //id_tamanho
        if trim(copy(linha2, 63, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 63, 11))); //qtd
        if trim(copy(linha2, 75, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 75, 11))); //qtd_devolvida
        if trim(copy(linha2, 87, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 87, 2))); //devolvido
        if trim(copy(linha2, 90, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 90, 11))); //preco
        if trim(copy(linha2, 102, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 102, 11))); //sub_total
        if trim(copy(linha2, 114, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha2, 114, 11))); // desconto
        if trim(copy(linha2, 126, 2)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha2, 126, 2))); //trocado
        cmd := cmd + valor + ')';
        dao.Execsql(cmd);
        ReadLn(txt1, linha2);
      end; //end do begin 1 orf do txt1

    end; // end do begin 1 recordcont < 0 do txt

    if eof(txt) then
    begin // begin 1
      FORMATSETTINGS.DecimalSeparator := '.';
      dao.Geral1('select numdoc from vendas1 where numdoc=' + QuotedStr(trim(copy(linha, 1, 7))) + ' and cod_empresa =' + quotedstr(trim(copy(linha, 34, 5))));

      if dao.q1.RecordCount <= 0 then
      begin // begin 2
        cmd := 'insert into vendas1 (num_doc';
        if trim(copy(linha, 9, 11)) <> '' then
          cmd := cmd + ',datadoc';
        if trim(copy(linha, 21, 6)) <> '' then
          cmd := cmd + ',cod_cliente';
        if trim(copy(linha, 28, 5)) <> '' then
          cmd := cmd + ',cod_representante';
        if trim(copy(linha, 34, 5)) <> '' then
          cmd := cmd + ',cod_empresa';
        if trim(copy(linha, 40, 2)) <> '' then
          cmd := cmd + ',faturado';
        if trim(copy(linha, 43, 2)) <> '' then
          cmd := cmd + ',consignacao';
        if trim(copy(linha, 46, 2)) <> '' then
          cmd := cmd + ',orcamento';
        if trim(copy(linha, 49, 11)) <> '' then
          cmd := cmd + ',tot_bruto';
        if trim(copy(linha, 61, 11)) <> '' then
          cmd := cmd + ',desconto';
        if trim(copy(linha, 73, 11)) <> '' then
          cmd := cmd + ',tot_liquido';
        if trim(copy(linha, 85, 30)) <> '' then
          cmd := cmd + ',prazo_pgto';
        if trim(copy(linha, 116, 6)) <> '' then
          cmd := cmd + ',cod_fop';
        if trim(copy(linha, 122, 2)) <> '' then
          cmd := cmd + ',tipo_venda';
        if trim(copy(linha, 125, 2)) <> '' then
          cmd := cmd + ',qtd_parcelas';
        if trim(copy(linha, 128, 11)) <> '' then
          cmd := cmd + ',credito_usado';
        if trim(copy(linha, 140, 2)) <> '' then
          cmd := cmd + ',usuario_desfaturou';
        if trim(copy(linha, 143, 2)) <> '' then
          cmd := cmd + ',contem_avaria';
        if trim(copy(linha, 146, 2)) <> '' then
          cmd := cmd + ',contem_etiqueta ';
        if trim(copy(linha, 149, 10)) <> '' then
          cmd := cmd + ',nr_venda_original';
        cmd := cmd + ' values (';
        if trim(copy(linha, 1, 7)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 1, 7))); //num_doc
        if trim(copy(linha, 9, 11)) <> '' then
          valor := valor + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', strtodate(trim(copy(linha, 9, 11))))); //data do documento
        if trim(copy(linha, 21, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 21, 6))); //cod do cliente
        if trim(copy(linha, 28, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 28, 5))); //cod do representante
        if trim(copy(linha, 34, 5)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 34, 5))); //cod da empresa
        if trim(copy(linha, 40, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 40, 2))); //faturado
        if trim(copy(linha, 43, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 43, 2))); //consignação
        if trim(copy(linha, 46, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 46, 2))); //orçamento
        if trim(copy(linha, 49, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 49, 11))); //tot_bruto
        if trim(copy(linha, 61, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 61, 11))); //desconto
        if trim(copy(linha, 73, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 73, 11))); //tot_liquido
        if trim(copy(linha, 85, 30)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 85, 30))); //prazo_pagamento
        if trim(copy(linha, 116, 6)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 116, 6))); //cod fop
        if trim(copy(linha, 122, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 122, 2))); //tipo de venda
        if trim(copy(linha, 125, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 125, 2))); //quantidade parcela
        if trim(copy(linha, 128, 11)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 128, 11))); //credito usado
        if trim(copy(linha, 140, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 140, 2))); //usuario desfaturou
        if trim(copy(linha, 143, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 143, 2))); //contem avaria
        if trim(copy(linha, 146, 2)) <> '' then
          valor := valor + ',' + QuotedStr(trim(copy(linha, 146, 2))); //contem etiqueta
        if trim(copy(linha, 149, 10)) <> '' then
          valor := valor + QuotedStr(trim(copy(linha, 149, 10))); //numero da venda original
        cmd := cmd + valor + ')';
        dao.Execsql(cmd); //executa o sql

        FORMATSETTINGS.decimalseparator := ',';
      end; //end do begin 2
      pb.Position := pb.Position + 1;
      Application.ProcessMessages;
      ReadLn(txt1, linha2);
      Valor := '';
    end; //end do begin1
    CloseFile(txt);

    dao.cn.Commit;
    CloseFile(txt1);
  except
    dao.cn.rollback;
  end;
end; // do begin inicial

end.









