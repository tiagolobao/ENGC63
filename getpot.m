%Obtem a ordem de grandeza do n�mero (Negativa)
%EX: caso x = 1.2345 * 10^-12 a fun��o retorna 12
%OBS: n�o funciona para n�meros com pot�ncia de 10 maior que 1


function pot = getpot(number)
  flg=0;
  pot=0;
  for i=0:20
    number=number*10;
    if number > 9
      if flg < 1
        pot = i;
        flg = 1;
      end
    end
  end
end