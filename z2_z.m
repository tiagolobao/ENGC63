%Fazendo as transformações em frequência

%Transforma Z^-1 = -Z^-1
%Inverter as amostras impares
function z2_z(resp_impul)
    for i=2:2:length(resp_impul)
        resp_impul(i) = -resp_impul(i);
    end
    fvtool(resp_impul);
end