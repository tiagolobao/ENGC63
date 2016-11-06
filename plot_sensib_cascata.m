%Plota as respostas em frequência com diferentes precisões dos pontos
%flutuantes da forma implementda em cascata

function plot_sensib_cascata(sos,casas_decimais)
    h2 = sos;  
    for l=1:length(sos)
        for k=1:3
            h2(l,k)= trunca(sos(l,k),casas_decimais);
        end
    end
    fvtool(sos,h2);
end

%De azul o original
%De vermelho o truncado