unit DVs;

{ DVs.Pas - Copyleft (1997) - Ivan C Cruz.

  ivancruz@centroin.com.br
  www.forumbr.com

  Você pode distribuir, utilizar e alterar livremente estas rotinas desde
  que mantenha este comentário que identifica o autor original.
}

interface

function DvModulo11(str: string): Char;
function DvModulo10(str: string): Char;
function DvCGC(str: string): string;
function DvCPF(str: string): string;
function ValidaCGC(str: string): Boolean;
function ValidaCPF(str: string): Boolean;

implementation

{ chInt - Converte um caracter numérico para o valor inteiro correspondente. }

function chInt(ch: Char): ShortInt;
begin
  Result := Ord(ch) - Ord('0');
end;

{ intCh = Converte um valor inteiro (de 0 a 9) para o caracter numérico
  correspondente. }

function intCh(int: ShortInt): Char;
begin
  Result := Chr(int + Ord('0'));
end;

{ DvModulo11 - Retorna 1 dv calculado pelo método do modulo 11 padrão. }

function DvModulo11(str: string): Char;
var soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Inc(fator);
    if fator = 10 then
      fator := 2;
  end;
  soma := 11 - (soma mod 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ dvModulo11ParaCPF - Retorna 1 dv calculado pelo método do modulo 11
  ligeiramente alterado para o CPF. }

function dvModulo11ParaCPF(str: string): Char;
var soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Inc(fator);
  end;
  soma := 11 - (soma mod 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ DvModulo10 - Retorna 1 dv calculado pelo método do modulo 10 padrão. }

function DvModulo10(str: string): Char;
var soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;
  for i := Length(str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Dec(fator);
    if fator = 0 then
      fator := 2;
  end;
  soma := 10 - (soma div 11);
  if soma >= 10 then
    Result := '0'
  else
    Result := intCh(soma);
end;

{ DvCGC - Retorna os dois dvs de um CGC, dado o CGC sem os dvs em forma de
  string (12 caracteres numéricos). }

function DvCGC(str: string): string;
var dv1: Char;
begin
  dv1 := DvModulo11(str);
  Result := dv1 + DvModulo11(str + dv1);
end;

{ DvCPF - Retorna os dois dvs de um CPF, dado o CPF sem os dvs em forma de
  string (9 caracteres numéricos). }

function DvCPF(str: string): string;
var dv1: Char;
begin
  dv1 := dvModulo11ParaCPF(str);
  Result := dv1 + dvModulo11ParaCPF(str + dv1);
end;

{ ValidaCGC - Retorna true se o CGC dado é valido. O CGC deve ser um string
  de 14 caracteres numéricos. }

function ValidaCGC(str: string): Boolean;
begin
  Result := Copy(str, 13, 2) = DvCGC(Copy(str, 1, 12));
end;

{ ValidaCPF - Retorna true se o CPF dado é valido. O CPF deve ser um string
  de 11 caracteres numéricos. }

function ValidaCPF(str: string): Boolean;
begin
  Result := Copy(str, 10, 2) = DvCPF(Copy(str, 1, 9));
end;

end.
