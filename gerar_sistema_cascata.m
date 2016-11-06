%Gera sistemas de segunda ordem com os zeros do sistema

function sos=gerar_sistema_cascata(zeros_sis,Gain)
    %Algoritimo para arrumar os coeficientes da multiplicacao dos zeros conjugados
    %Considera-se os polos conjugados estao juntos, ou seja, se Z esta na posicao 4,
    %o Z' esta na posicao 5!!!
    numero_zeros = length(zeros_sis); %número de zeros complexos
    i = 1;
    zeros_conj = [];
    zeros_uni = [];
    while i <= numero_zeros
      if imag(zeros_sis(i)) == 0 %Se for real
        %       Linha anterior ; nova linha          , polos zero
        zeros_uni = [zeros_uni ; 0, 1 ,-zeros_sis(i) , 0 , 1 , 0];
        i=i+1;
      else %Se for complexo
        %obtem os polinomios de 2ª ordem
        %         Linha anterior ; nova linha                  , polos zero
        zeros_conj = [zeros_conj ; getComplxCoef(zeros_sis(i)) , 1 , 0 ,0];
        i=i+2;
      end
    end
    
    %Transformando os polos simples em sistemas de segunda ordem
    plus = [1 , zeros_uni(1,3)+zeros_uni(2,3) , zeros_uni(1,3)*zeros_uni(2,3) , 1 , 0 , 0];
    
    %Os polos sao iguais a zero de ordem = M_kaiser
    %Arrumando em sistemas de segunda ordem
    sos = [zeros_conj ; plus];
    
    %Ajustando o ganho do sistema completo
    sos(30,1:3)= sos(30,1:3)*Gain;
    
end

%A matriz contem o seguinte formato:
%Cada linha possui um sistema de segunda ordem
%[a0 a2 a3 b0 b1 b2]
% b0*Z^2 + b1*Z^1 + b2  /  a0*Z^2 + a1*Z^1 + a2 

%Os valores b0 b1 e b2 nesse caso são [0 1 0] para polos simples e
% [1 0 0] para polos complexos
