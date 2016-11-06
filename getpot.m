%Obtem a ordem de grandeza do número (Negativa)
%EX: caso x = 1.2345 * 10^-12 a função retorna 12
%OBS: não funciona para números com potência de 10 maior que 1


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