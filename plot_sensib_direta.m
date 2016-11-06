%Plota as respostas em frequência com diferentes precisões dos pontos
%flutuantes

function plot_sensib_direta(resp_impulso,casas_decimais)

    %Criando o vetor que representa os coeficientes a (polos)
    %Utilizado para plotar mais de um filtro diferente no fvtool
    a = [1 zeros(1,(length(resp_impulso)-1))];

    for l=1:length(resp_impulso)
       h2(l)= trunca(resp_impulso(l),casas_decimais);
    end
    %fvtool(b1,a1,b2,a2); Formato dos argumentos
    fvtool(resp_impulso,a,h2,a);
end

%De azul o original
%De vermelho o truncado