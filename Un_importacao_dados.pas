unit Un_importacao_dados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, comobj, sLabel, sCheckBox, sGroupBox;

type
  TFrimportacao_dados = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    OD: TOpenDialog;
    Button1: TButton;
    PB: TProgressBar;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Trata_arquivo_importacao(nom_arquivo: string); //Trata o Arquivo que é recebido para importar na Base de Dados
  end;

var
  Frimportacao_dados: TFrimportacao_dados;

implementation

uses Un_dao, UnPri, UnFun;

{$R *.dfm}

procedure TFrimportacao_dados.Button1Click(Sender: TObject);
begin
  OD.Execute;
end;

procedure TFrimportacao_dados.Trata_arquivo_importacao(
  nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
begin
  try
    AssignFile(txt, nom_arquivo); //caminho com o arquivo de importação
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

   // if (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not eof(txt) do
    begin
      if trim(copy(linha, 1, 3)) = '001' then //produto
      begin
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
        ///        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Grade.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Código de Barras.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Cor.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Tamanho.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Coleção.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Marca.....';
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
        //        sb_transferencia.Panels[0].text:= 'Recebendo Arquivo de Fonecedor.....';
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
      dao.msg('Houve um erro ao Transmitir o arquivo de atulização!' + #13 +
        e.message + #13 + cmd + #13 + linha);
      dao.cn.Rollback;
      CloseFile(txt)

    end;
  end;

end;

procedure TFrimportacao_dados.Button2Click(Sender: TObject);
var
  cmd: string;
  telefone: string;
begin
  with dao.Q1S do
  begin
    close;
    sql.Clear;
    sql.add('select * from tacli');
    open;
  end;
  dao.Q1S.First;
  cmd := '';

  //  cmd:= cmd + 'DTA_CAD, PRI_COMPRA, NOM_CLIENTE,NOM_FANTASIA,ENDERECO '+
  //              ',BAIRRO,CEP,COD_CIDADE,TIP_PESSOA,TELEFONE, EMAIL,AVISO, CNPJ,IE,CONTATO, LIMITE '+
  //              ',CPF, RG, FAX,ID_REPRESENTANTE, DESCONTO_MAXIMO ) values (';
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (dao.Q1S.Eof) do
    begin
      cmd := '';
      cmd := 'insert into cliente (';
      if dao.Q1S.fieldbyname('dtacad').AsString <> '' then
        cmd := cmd + 'dta_cad';

      if dao.Q1S.fieldbyname('dtapricom').AsString <> '' then
        cmd := cmd + ',' + 'pri_compra';

      if dao.Q1S.fieldbyname('razcli').AsString <> '' then
        cmd := cmd + ',nom_cliente';

      if dao.Q1S.fieldbyname('nomcli').AsString <> '' then
        cmd := cmd + ',nom_fantasia';

      if dao.Q1S.fieldbyname('endcli').AsString <> '' then
        cmd := cmd + ',endereco';

      if dao.Q1S.fieldbyname('baicli').AsString <> '' then
        cmd := cmd + ',bairro';

      if dao.Q1S.fieldbyname('cepcli').AsString <> '' then
        cmd := cmd + ',cep';

      if dao.Q1S.fieldbyname('codcid').AsString <> '' then
        cmd := cmd + ',cod_cidade';

      if dao.Q1S.fieldbyname('stacli').AsString <> '' then
        cmd := cmd + ',tip_pessoa';

      if dao.Q1S.fieldbyname('foncli').AsString <> '' then
        cmd := cmd + ',telefone';

      if dao.Q1S.fieldbyname('emacli').AsString <> '' then
        cmd := cmd + ',email';

      if dao.Q1S.fieldbyname('obscli').AsString <> '' then
        cmd := cmd + ',aviso';

      if dao.Q1S.fieldbyname('cnpcli').AsString <> '' then
        cmd := cmd + ',cnpj';

      if dao.Q1S.fieldbyname('iecli').AsString <> '' then
        cmd := cmd + ',ie';

      if dao.Q1S.fieldbyname('comcli').AsString <> '' then
        cmd := cmd + ',contato';

      if dao.Q1S.fieldbyname('limcli').AsString <> '' then
        cmd := cmd + ',limite';

      if dao.Q1S.fieldbyname('cpfcli').AsString <> '' then
        cmd := cmd + ',cpf';

      if dao.Q1S.fieldbyname('rgcli').AsString <> '' then
        cmd := cmd + ',rg';

      if dao.Q1S.fieldbyname('faxcli').AsString <> '' then
        cmd := cmd + ',fax';

      if dao.Q1S.fieldbyname('codrep').AsString <> '' then
        cmd := cmd + ',id_representante';

      if (dao.Q1S.fieldbyname('descli').AsString <> '') and (dao.Q1S.FieldByName('descli').AsFloat <> 0) then
        cmd := cmd + ',desconto_maximo';

      cmd := cmd + ') values (';

      if dao.Q1S.fieldbyname('dtacad').AsString <> '' then
        cmd := cmd + quotedStr(FormatDateTime('dd.mm.yyyy', dao.Q1S.fieldbyname('dtacad').AsDateTime));

      if dao.Q1S.fieldbyname('dtapricom').AsString <> '' then
        cmd := cmd + ',' + quotedStr(FormatDateTime('dd.mm.yyyy', dao.Q1S.fieldbyname('dtapricom').AsDateTime));

      if dao.Q1S.fieldbyname('razcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('razcli').AsString, 1, 60));

      if dao.Q1S.fieldbyname('nomcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('nomcli').AsString, 1, 60));

      if dao.Q1S.fieldbyname('endcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('endcli').AsString);

      if dao.Q1S.fieldbyname('baicli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('baicli').AsString);

      if dao.Q1S.fieldbyname('cepcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cepcli').AsString);

      if dao.Q1S.fieldbyname('codcid').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('codcid').AsString);

      if dao.Q1S.fieldbyname('stacli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('stacli').AsString);
      //    telefone:= '(';
       //   telefone:= telefone+copy(dao.Q1S.fieldbyname('foncli').AsString,2,12);
      if dao.Q1S.fieldbyname('foncli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('foncli').AsString, 2, 13));

      if dao.Q1S.fieldbyname('emacli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('emacli').AsString);

      if dao.Q1S.fieldbyname('obscli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('obscli').AsString);

      if dao.Q1S.fieldbyname('cnpcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cnpcli').AsString);

      if dao.Q1S.fieldbyname('iecli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('iecli').AsString);

      if dao.Q1S.fieldbyname('comcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('comcli').AsString);

      if dao.Q1S.fieldbyname('limcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('limcli').AsString));

      if dao.Q1S.fieldbyname('cpfcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cpfcli').AsString);

      if dao.Q1S.fieldbyname('rgcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('rgcli').AsString);

      if dao.Q1S.fieldbyname('faxcli').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('faxcli').AsString, 2, 13));

      if dao.Q1S.fieldbyname('codrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('codrep').AsString);

      if (dao.Q1S.fieldbyname('descli').AsString <> '') and (dao.Q1S.FieldByName('descli').AsFloat <> 0) then
        cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('descli').AsString));

      cmd := cmd + ')';

      dao.Execsql(cmd);
      dao.Q1S.Next;
    end;
    dao.cn.Commit;
    ShowMessage('final');
  except
    dao.cn.Rollback;
  end;

end;

procedure TFrimportacao_dados.Button3Click(Sender: TObject);
var
  cmd: string;
  nompro: string;
begin
  with dao.Q1S do
  begin
    close;
    sql.Clear;
    sql.add('select * from tapro where stapro=' + QuotedStr('S'));
    open;
  end;
  dao.Q1S.First;
  cmd := '';
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (dao.Q1S.Eof) do
    begin
      cmd := '';
      cmd := 'insert into produto (';

      if dao.Q1S.fieldbyname('nompro').AsString <> '' then
      begin
        if dao.Q1S.fieldbyname('nompro').AsString <> '' then
          cmd := cmd + 'nom_produto';

        if dao.Q1S.fieldbyname('qtdemb').AsString <> '' then
          cmd := cmd + ',qtd_embalagem';

        if dao.Q1S.fieldbyname('codgru').AsString <> '' then
          cmd := cmd + ',cod_grupo';

        if dao.Q1S.fieldbyname('codfor').AsString <> '' then
          cmd := cmd + ',fornecedor_principal';

        if dao.Q1S.fieldbyname('codmedida').AsString <> '' then
          cmd := cmd + ',unidade';

        if dao.Q1S.fieldbyname('pespro').AsString <> '' then
          cmd := cmd + ',peso';

        if dao.Q1S.fieldbyname('prerev').AsString <> '' then
          cmd := cmd + ',preco_venda';

        if dao.Q1S.fieldbyname('stapro').AsString <> '' then
          cmd := cmd + ',status';

        if dao.Q1S.fieldbyname('nometi').AsString <> '' then
          cmd := cmd + ',etiqueta_lin1';

        if dao.Q1S.fieldbyname('nometi2').AsString <> '' then
          cmd := cmd + ',etiqueta_lin2';

        if dao.Q1S.fieldbyname('reffab').AsString <> '' then
          cmd := cmd + ',ref_fabrica';

        if dao.Q1S.fieldbyname('vlrcus').AsString <> '' then
          cmd := cmd + ',custo';

        if dao.Q1S.fieldbyname('permven').AsString <> '' then
          cmd := cmd + ',lucro';

        if dao.Q1S.fieldbyname('cod_prateleira').AsString <> '' then
          cmd := cmd + ',cod_prateleira';

        cmd := cmd + ') values (';

        if dao.Q1S.fieldbyname('nompro').AsString <> '' then
          cmd := cmd + quotedStr(dao.Q1S.fieldbyname('nompro').AsString);

        if dao.Q1S.fieldbyname('qtdemb').AsString <> '' then
          cmd := cmd + ',' + quotedStr(FormatFloat('#', dao.Q1S.fieldbyname('qtdemb').AsFloat));

        if dao.Q1S.fieldbyname('codgru').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('codgru').AsString);

        if dao.Q1S.fieldbyname('codfor').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('codfor').AsString, 1, 50));

        if dao.Q1S.fieldbyname('codmedida').AsString <> '' then
        begin
          if dao.Q1S.FieldByName('codmedida').AsString = '1' then
            cmd := cmd + ',' + QuotedStr('KG')
          else if dao.Q1S.FieldByName('codmedida').AsString = '2' then
            cmd := cmd + ',' + QuotedStr('MT')
          else if dao.Q1S.FieldByName('codmedida').AsString = '3' then
            cmd := cmd + ',' + QuotedStr('PC')
          else if dao.Q1S.FieldByName('codmedida').AsString = '4' then
            cmd := cmd + ',' + QuotedStr('UN')
          else if dao.Q1S.FieldByName('codmedida').AsString = '5' then
            cmd := cmd + ',' + QuotedStr('CT')
          else if dao.Q1S.FieldByName('codmedida').AsString = '6' then
            cmd := cmd + ',' + QuotedStr('RL')
          else if dao.Q1S.FieldByName('codmedida').AsString = '7' then
            cmd := cmd + ',' + QuotedStr('CX');
        end;

        if dao.Q1S.fieldbyname('pespro').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('pespro').AsString));

        if dao.Q1S.fieldbyname('prerev').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('prerev').AsString));

        if dao.Q1S.fieldbyname('stapro').AsString <> '' then
          cmd := cmd + ',' + QuotedStr('N');

        if dao.Q1S.fieldbyname('nometi').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('nometi').AsString);

        if dao.Q1S.fieldbyname('nometi2').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('nometi2').AsString);

        if dao.Q1S.fieldbyname('reffab').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('reffab').AsString);

        if dao.Q1S.fieldbyname('vlrcus').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('vlrcus').AsString));

        if dao.Q1S.fieldbyname('PERMVEN').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(FMFUN.prepara_valor(dao.Q1S.fieldbyname('PERMVEN').AsString));

        if dao.Q1S.fieldbyname('cod_prateleira').AsString <> '' then
          cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cod_prateleira').AsString);

        cmd := cmd + ')';

        dao.Execsql(cmd);
      end;
      dao.Q1S.Next;

    end;
    dao.cn.Commit;
    ShowMessage('final');
  except
    dao.cn.Rollback;
  end;

end;

procedure TFrimportacao_dados.Button4Click(Sender: TObject);
var
  cmd: string;
begin
  with dao.Q1S do
  begin
    close;
    sql.Clear;
    sql.add('select * from tagru');
    open;
  end;
  dao.Q1S.First;
  cmd := '';
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (dao.Q1S.Eof) do
    begin
      cmd := '';
      cmd := 'insert into grupo (';

      if dao.Q1S.fieldbyname('codgru').AsString <> '' then
        cmd := cmd + 'cod_grupo';

      if dao.Q1S.fieldbyname('nomgru').AsString <> '' then
        cmd := cmd + ',nom_grupo';

      cmd := cmd + ') values (';

      if dao.Q1S.fieldbyname('codgru').AsString <> '' then
        cmd := cmd + quotedStr(dao.Q1S.fieldbyname('codgru').AsString);

      if dao.Q1S.fieldbyname('nomgru').AsString <> '' then
        cmd := cmd + ',' + quotedStr(dao.Q1S.fieldbyname('nomgru').AsString);

      cmd := cmd + ')';

      dao.Execsql(cmd);
      dao.Q1S.Next;

    end;
    dao.cn.Commit;
    ShowMessage('final');
  except
    dao.cn.Rollback;
  end;

end;

procedure TFrimportacao_dados.Button5Click(Sender: TObject);
var
  cmd: string;
begin
  with dao.Q1S do
  begin
    close;
    sql.Clear;
    sql.add('select * from tarep');
    open;
  end;
  dao.Q1S.First;
  cmd := '';
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (dao.Q1S.Eof) do
    begin
      cmd := '';
      cmd := 'insert into representante (';
      if dao.Q1S.fieldbyname('codrep').AsString <> '' then
        cmd := cmd + 'id';

      if dao.Q1S.fieldbyname('nomrep').AsString <> '' then
        cmd := cmd + ',' + 'nom_representante';

      if dao.Q1S.fieldbyname('emprep').AsString <> '' then
        cmd := cmd + ',nom_empresa';

      if dao.Q1S.fieldbyname('endrep').AsString <> '' then
        cmd := cmd + ',endereco';

      if dao.Q1S.fieldbyname('bairep').AsString <> '' then
        cmd := cmd + ',bairro';

      if dao.Q1S.fieldbyname('ceprep').AsString <> '' then
        cmd := cmd + ',cep';

      if dao.Q1S.fieldbyname('codcid').AsString <> '' then
        cmd := cmd + ',id_cidade';

      if dao.Q1S.fieldbyname('cnprep').AsString <> '' then
        cmd := cmd + ',cnpj';

      if dao.Q1S.fieldbyname('ierep').AsString <> '' then
        cmd := cmd + ',ie';

      if dao.Q1S.fieldbyname('cpfrep').AsString <> '' then
        cmd := cmd + ',cpf';

      if dao.Q1S.fieldbyname('rgrep').AsString <> '' then
        cmd := cmd + ',rg';

      if dao.Q1S.fieldbyname('fonrep').AsString <> '' then
        cmd := cmd + ',fone';

      if dao.Q1S.fieldbyname('faxrep').AsString <> '' then
        cmd := cmd + ',fax';

      if dao.Q1S.fieldbyname('celrep').AsString <> '' then
        cmd := cmd + ',celular';

      if dao.Q1S.fieldbyname('obsrep').AsString <> '' then
        cmd := cmd + ',observacao';

      if dao.Q1S.fieldbyname('emarep').AsString <> '' then
        cmd := cmd + ',email';

      cmd := cmd + ') values (';

      if dao.Q1S.fieldbyname('codrep').AsString <> '' then
        cmd := cmd + quotedStr(dao.Q1S.fieldbyname('codrep').AsString);

      if dao.Q1S.fieldbyname('nomrep').AsString <> '' then
        cmd := cmd + ',' + quotedStr(dao.Q1S.fieldbyname('nomrep').AsString);

      if dao.Q1S.fieldbyname('emprep').AsString <> '' then
        cmd := cmd + ',' + quotedStr(dao.Q1S.fieldbyname('emprep').AsString);

      if dao.Q1S.fieldbyname('endrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('endrep').AsString);

      if dao.Q1S.fieldbyname('bairep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('bairep').AsString);

      if dao.Q1S.fieldbyname('ceprep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('ceprep').AsString);

      if dao.Q1S.fieldbyname('codcid').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('codcid').AsString);

      if dao.Q1S.fieldbyname('cnprep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cnprep').AsString);

      if dao.Q1S.fieldbyname('ierep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('ierep').AsString);

      if dao.Q1S.fieldbyname('cpfrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('cpfrep').AsString);
      //    telefone:= '(';
       //   telefone:= telefone+copy(dao.Q1S.fieldbyname('foncli').AsString,2,12);
      if dao.Q1S.fieldbyname('rgrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(copy(dao.Q1S.fieldbyname('rgrep').AsString, 2, 12));

      if dao.Q1S.fieldbyname('fonrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('fonrep').AsString);

      if dao.Q1S.fieldbyname('faxrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('faxrep').AsString);

      if dao.Q1S.fieldbyname('celrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('celrep').AsString);

      if dao.Q1S.fieldbyname('obsrep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('obsrep').AsString + #13 + dao.Q1S.fieldbyname('concor').AsString);

      if dao.Q1S.fieldbyname('emarep').AsString <> '' then
        cmd := cmd + ',' + QuotedStr(dao.Q1S.fieldbyname('emarep').AsString);

      cmd := cmd + ')';

      dao.Execsql(cmd);
      dao.Q1S.Next;
    end;
    dao.cn.Commit;
    ShowMessage('final');
  except
    dao.cn.Rollback;
  end;

end;

procedure TFrimportacao_dados.Button7Click(Sender: TObject);
var
  fone, fax: string;
  excel: Variant;
  I: Integer;
begin
  {   Excel := CreateOleObject('Excel.Application');
     Excel.WorkBooks.Open('c:\cidades.xls');
     Excel.Visible := true;
     i:=1;
     if not(dao.cn.InTransaction) then (dao.cn.StartTransaction);
     for i:=1 to 5565 do
     begin
  //     if Excel.WorkBooks[1].Sheets[1].Cells[1,1] <> '' then
          dao.Execsql('insert into cidade_brinde (cod_cidade_b,nom_cidade) values ('+QuotedStr(Excel.WorkBooks[1].Sheets[1].Cells[i,1])+','+ QuotedStr(Excel.WorkBooks[1].Sheets[1].Cells[i,2])+')');
          dao.cn.Commit;
     end;
     ShowMessage('fim');}

  dao.Geral1('select * from cidades');
  dao.Q1.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (dao.q1.eof) do
    begin
      dao.Geral2('select * from cidade_brinde where nom_cidade = ' + QuotedStr(dao.Q1.fieldbyname('nom_cidade').AsString));
      if dao.Q2.RecordCount >= 1 then
      begin
        dao.Execsql('update cidades set cod_ibge=' + QuotedStr(dao.Q2.fieldbyname('cod_cidade_b').AsString) + ' where cod_cidade=' + QuotedStr(dao.Q1.fieldbyname('cod_cidade').AsString));
      end;

      dao.Q1.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFrimportacao_dados.Button8Click(Sender: TObject);
var
  fone, fax: string;
begin

end;

end.
