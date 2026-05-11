unit un_sped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sGroupBox, sGauge, Buttons, sSpeedButton, ACBrSpedFiscal,
  sPanel, sLabel, ACBrUtil, ACBrTXTClass, ACBrEFDBlocos, sCheckBox,
  sComboEdit;

type
  Tfm_sped = class(TForm)
    Panel1: TsPanel;
    OpenDialog1: TOpenDialog;
    gbDtInicial: TsGroupBox;
    edDtIni: TsDateEdit;
    gbDtFinal: TsGroupBox;
    edDtFinal: TsDateEdit;
    gbArquivo: TsGroupBox;
    edArquivo: TsFilenameEdit;
    btGerar: TsSpeedButton;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    sPanel1: TsPanel;
    gbStatus: TsGroupBox;
    pgStatus: TsGauge;
    gbEmpresa: TsGroupBox;
    lbEmpresaFat: TsLabel;
    edEmpresaFaturada: TsComboEdit;
    gbBlocos: TsGroupBox;
    cb0: TsCheckBox;
    cbC: TsCheckBox;
    cbD: TsCheckBox;
    cb1: TsCheckBox;
    cbH: TsCheckBox;
    cbE: TsCheckBox;
    cb9: TsCheckBox;
    procedure btGerarClick(Sender: TObject);
    procedure GerarDadosBloco(pBloco: string);
    function ValidarDados: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_sped: Tfm_sped;

implementation

{$R *.dfm}

procedure Tfm_sped.btGerarClick(Sender: TObject);
begin
  if not ValidarDados then exit;
  
  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef('10', 0);
  ACBrSpedFiscal1.DT_INI := edDtIni.Date;
  ACBrSpedFiscal1.DT_FIN := edDtFinal.Date;
  ACBrSpedFiscal1.Arquivo := edArquivo.Text;
  // repassa os dados
  if cb0.Checked then
    GerarDadosBloco('0');
  if cbC.Checked then
    GerarDadosBloco('C');
  if cbD.Checked then
    GerarDadosBloco('D');
  if cbE.Checked then
    GerarDadosBloco('E');
  if cbH.Checked then
    GerarDadosBloco('H');
  if cb1.Checked then
    GerarDadosBloco('1');
  // gera o arquivo
  ACBrSpedFiscal1.SaveFileTXT;
  if cb9.Checked then
    GerarDadosBloco('9');
  ShowMessage('Arquivo Gerado com sucesso!');
end;

function Tfm_sped.ValidarDados: Boolean;
begin
  Result := true;
  if trim(edEmpresaFaturada.Text) = '' then
  begin
    showmessage('Empresa deve ser preenchida!');
    edEmpresaFaturada.SetFocus;
    Result := false;
    exit;
  end;

  if trim(edArquivo.Text) = '' then
  begin
    showmessage('Local do Arquivo deve ser preenchido!');
    edArquivo.SetFocus;
    Result := false;
    exit;
  end;

  if trim(edDtIni.Text) = '/  /' then
  begin
    showmessage('Data Inicial deve ser preenchida!');
    edDtIni.SetFocus;
    Result := false;
    exit;
  end;

  if trim(edDtFinal.Text) = '/  /' then
  begin
    showmessage('Data Final deve ser preenchida!');
    edDtFinal.SetFocus;
    Result := false;
    exit;
  end;

  if edDtIni.Date > edDtFinal.Date then
  begin
    showmessage('Data Inicial não pode ser posterior à Data final!');
    edDtIni.SetFocus;
    Result := false;
    exit;
  end;
end;

procedure Tfm_sped.GerarDadosBloco(pBloco: string);
var
  Int1, Int2, Notas: Integer;
  aTotalICMS: Double;
begin
  aTotalICMS := 0;
  if pBloco = '0' then
  begin
    with ACBrSpedFiscal1.Bloco_0 do
    begin
      // informações da Plasfan
      with Registro0000New do
      begin
        COD_VER := vlVersao104;
        COD_FIN := raOriginal;
        NOME := 'RAZAO SOCIAL DO INFORMANTE';
        CNPJ := '';
        CPF := '12345678901'; // Deve ser uma informação valida
        UF := 'RJ';
        IE := '0000000000';
        COD_MUN := 12345678;
        IM := '';
        SUFRAMA := '';
        IND_PERFIL := pfPerfilA;
        IND_ATIV := atOutros;
      end;
      with Registro0001New do
      begin
        IND_MOV := imComDados;
        // informações complementares da Empresa
        with Registro0005New do
        begin
          FANTASIA := 'NOME FANTASSIA DA EMPRESA';
          CEP := '21000000';
          ENDERECO := 'RUA PRINCIPAL';
          NUM := 'S/N';
          COMPL := '';
          BAIRRO := 'CENTRO';
          FONE := '';
          FAX := '';
          EMAIL := 'email@empresa.net';
        end;
        // informações da contabilidade.
        with Registro0100New do
        begin
          NOME := 'NOME DO CONTADOR';
          CPF := '12345678900'; // Deve ser uma informação valida
          CRC := '123456';
          CNPJ := '';
          CEP := '';
          ENDERECO := '';
          NUM := '';
          COMPL := '';
          BAIRRO := '';
          FONE := '';
          FAX := '';
          EMAIL := '';
          COD_MUN := 3200607;
        end;
        // Clientes
        with Registro0150New do
        begin
          COD_PART := '000001';
          NOME := 'RAZAO SOCIAL DO CLIENTE';
          COD_PAIS := '001';
          CNPJ := '12345678000123';
          CPF := '';
          IE := '';
          COD_MUN := 1;
          SUFRAMA := '';
          ENDERECO := 'ENDERECO';
          NUM := '';
          COMPL := 'COMPL';
          BAIRRO := 'BAIRRO';
        end;
        with Registro0190New do
        begin
          UNID := 'UN';
          DESCR := 'Descricao unidade';
        end;

        for Int1 := 1 to 6 do
        begin
          if not Registro0200.LocalizaRegistro(IntToStrZero(Int1, 6)) then
          begin
            with Registro0200New do
            begin
              COD_ITEM := IntToStrZero(Int1, 6);
              DESCR_ITEM := 'DESCRIÇÃO DO ITEM ' + IntToStrZero(Int1, 6);
              COD_BARRA := IntToStrZero(Int1, 13);
              COD_ANT_ITEM := '';
              UNID_INV := 'UN';
              TIPO_ITEM := tiMercadoriaRevenda;
              COD_NCM := '';
              EX_IPI := '';
              COD_GEN := '';
              COD_LST := '';
              ALIQ_ICMS := 18;
            end;
          end;
        end;
      end;
    end;
  end
  else if pBloco = 'C' then
  begin
    Notas := 2;
    with ACBrSpedFiscal1.Bloco_C do
    begin
      with RegistroC001New do
      begin
        IND_MOV := imComDados;
        //
        for Int1 := 1 to Notas do
        begin
          with RegistroC100New do
          begin
            COD_PART := '000001';
            IND_EMIT := edEmissaoPropria;
            IND_OPER := tpEntradaAquisicao;
            COD_MOD := '01';
            COD_SIT := sdRegular;
            SER := '';
            NUM_DOC := IntToStrZero(Int1, 6);
            CHV_NFE := '';
            DT_DOC := Date();
            DT_E_S := Date();
            VL_DOC := 0;
            IND_PGTO := tpSemPagamento;
            VL_DESC := 0;
            VL_ABAT_NT := 0;
            VL_MERC := 0;
            IND_FRT := tfSemCobrancaFrete;
            VL_SEG := 0;
            VL_OUT_DA := 0;
            VL_BC_ICMS := 0;
            VL_ICMS := 0;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST := 0;
            VL_IPI := 0;
            VL_PIS := 0;
            VL_COFINS := 0;
            VL_PIS_ST := 0;
            VL_COFINS_ST := 0;
            //c170
            for Int2 := 1 to 6 do
            begin
              with RegistroC170New do //Inicio Adicionar os Itens:
              begin
                NUM_ITEM := IntToStrZero(Int2, 3);
                COD_ITEM := IntToStrZero(Int2, 6);
                DESCR_COMPL := 'Descricao do item ' + IntToStrZero(Int2, 6);
                QTD := 1;
                UNID := 'UN';
                VL_ITEM := 10;
                VL_DESC := 0;
                IND_MOV := mfNao;
                CST_ICMS := '000';
                CFOP := '5102';
                COD_NAT := '';
                VL_BC_ICMS := 10;
                ALIQ_ICMS := 18;
                VL_ICMS := 1.8;
                VL_BC_ICMS_ST := 0;
                ALIQ_ST := 0;
                VL_ICMS_ST := 0;
                IND_APUR := iaMensal;
                CST_IPI := ipiEntradaIsenta;
                COD_ENQ := '';
                VL_BC_IPI := 0;
                ALIQ_IPI := 0;
                VL_IPI := 0;
                CST_PIS := pisOutrasOperacoes;
                VL_BC_PIS := 0;
                ALIQ_PIS_PERC := 0;
                QUANT_BC_PIS := 0;
                ALIQ_PIS_R := 0;
                VL_PIS := 0;
                CST_COFINS := cofinsOutrasOperacoes;
                VL_BC_COFINS := 0;
                ALIQ_COFINS_PERC := 0;
                QUANT_BC_COFINS := 0;
                ALIQ_COFINS_R := 0;
                VL_COFINS := 0;
                COD_CTA := '000';
              end;
            end;
            //c190
            with RegistroC190New do
            begin
              CST_ICMS := '000';
              CFOP := '5102';
              ALIQ_ICMS := 18;
              VL_OPR := 60;
              VL_BC_ICMS := 60;
              VL_ICMS := 10.8;
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
              VL_RED_BC := 0;
              VL_IPI := 0;
              COD_OBS := '';
            end;
            aTotalICMS := aTotalICMS + 10.8;
          end;
        end;
      end;
    end;
  end
  else if pBloco = 'D' then
  begin
    with ACBrSpedFiscal1.Bloco_D do
    begin
      with RegistroD001New do
      begin
        IND_MOV := imSemDados;
      end;
    end;
  end
  else if pBloco = 'E' then
  begin
    with ACBrSpedFiscal1.Bloco_E do
    begin
      with RegistroE001New do
      begin
        IND_MOV := imComDados;
        with RegistroE100New do
        begin
          DT_INI := edDtIni.Date;
          DT_FIN := edDtFinal.Date;
        end;
        with RegistroE110New do
        begin
          VL_TOT_DEBITOS := aTotalICMS;
          VL_AJ_DEBITOS := 0;
          VL_TOT_AJ_DEBITOS := 0;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 0;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;
          VL_SLD_APURADO := aTotalICMS;
          VL_TOT_DED := 0;
          VL_ICMS_RECOLHER := aTotalICMS;
          VL_SLD_CREDOR_TRANSPORTAR := 0;
          DEB_ESP := 0;
        end;
      end;
    end;
  end
  else if pBloco = 'H' then
  begin
    with ACBrSpedFiscal1.Bloco_H do
    begin
      with RegistroH001New do
      begin
        IND_MOV := imComDados;
        //
        with RegistroH005New do
        begin
          DT_INV := Date;
          VL_INV := 1000;
          // FILHO
          for Int1 := 1 to 6 do
          begin
            with RegistroH010New do
            begin
              COD_ITEM := IntToStrZero(Int1, 6);
              UNID := 'UN';
              QTD := 1;
              VL_UNIT := 100;
              VL_ITEM := 100;
              IND_PROP := piInformante;
              COD_PART := '';
              TXT_COMPL := '';
              COD_CTA := '';
            end;
          end;
        end;
      end;
    end;
  end
  else if pBloco = '1' then
  begin
    with ACBrSpedFiscal1.Bloco_1 do
    begin
      with Registro1001New do
      begin
        IND_MOV := imSemDados;
      end;
    end;
  end
  else if pBloco = '9' then
  begin
    ACBrSPEDFiscal1.WriteBloco_9;
  end
end;

end.

