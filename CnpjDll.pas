unit CnpjDll;

interface

  type
    TEmpresa = Record
      Tipo: ShortString;
      Abertura: ShortString;
      RazaoSocial: ShortString;
      Fantasia: ShortString;
      Endereco: ShortString;
      Numero: ShortString;
      Complemento: ShortString;
      CEP: ShortString;
      Bairro: ShortString;
      Cidade: ShortString;
      UF: ShortString;
      Situacao: ShortString;
    End;

  function ConsultarCNPJ(CNPJ: ShortString): TEmpresa; stdcall;

implementation

function ConsultarCNPJ(CNPJ: ShortString): TEmpresa; stdcall; external 'CnpjDll.dll';

end.
