%Fazendo as transformações em frequência

%Transforma Z^-1 = -Z^-2
%Inverter o valor das amostras impares
%colocar amostras 0 entre todas as amostras
function z2_zsq(resp_impul)
    tamanho = length(resp_impul);
    nova_resp = resp_impul(1);
    %inverter valores
    for v=2:2:tamanho
        resp_impul(v) = -resp_impul(v);
    end
    %amostras zero intercaladas
    for j=2:1:tamanho
        nova_resp = [nova_resp , 0 ,resp_impul(j)];
    end
    fvtool(nova_resp);
end