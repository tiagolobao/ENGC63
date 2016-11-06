%Trunca o numero na ultima casa decimal
%EX: o número 2.234 * 10^-19 se torna 2.23 * 10^-19
%decm é o número de casas decimais a serem mantidas (num natural)
function truncado = trunca(number,decm)
  ordem = getpot(number);
  number = number * (10^(ordem+decm));
  number = floor(number);
  truncado = number / (10^(ordem+decm));
end