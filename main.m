%Trabalho Processamento digital de sinais
%Equipe: Tiago Lobão, Arnaldo Oliveira, Érico Cedraz
%Projeto 4

%Limpando as variáveis e Command Window
clear all
clc

format long; %Aumenta a precisão dos valores
T = 1; %Tempo de amostragem


%-------------------Gerando a reposta ao impulso de kaiser----------------------
wc = pi()/2; %Frequencia de corte
Dw_max = 0.1*pi(); %Valores possiveis da banda de transicao maxima
A = 50; %Atenuação da banda de rejeição em db
Beta = (0.5842*(A-21)^0.4) + 0.07886*(A-21); %Equacao utilizada quando 21<=A<=50
M_kaiser = round( (A-8) / (2.285 * Dw_max)+1 ); %Numero de amostras

wdw = kaiser((M_kaiser+1),Beta)'; %Gerando a janela
n = 0:T:(M_kaiser); %Eixo x para plotagem


%-------------------Gerando a resposta sync-------------------------------------
hd = sin((pi()*(n-(M_kaiser/2))) / 2) ./ (pi().*(n-(M_kaiser/2)));
hd((M_kaiser/2)+1) = 0.5; %Ajustando o valor quando n = 0

%-------------------Gerando a resposta ao impulso e plotando a FFT--------------
h = wdw .* hd; %Convolução na frequência janela e sync
%plota a resposta em frequência com diferentes casas decimais
%plot_sensib_direta(h,4);

%-------------------Implementacao do filtro na forma cascata--------------------
%obtendo zeros
% h[n] = h[0]*I[n] + h[1]*I[n-1] + etc
% H(z) = h[0] + h[1]*z^-1 + etc
% H(z) = ( h[0]*z^n + h[1]*z^n-1 + etc ) / z^n
zeros_sis = roots(h); %vetor com os zeros
sos = gerar_sistema_cascata(zeros_sis,h(1));
%plota a resposta em frequência com diferentes casas decimais
%plot_sensib_cascata(sos,4);


%-------------------Interface de usuário-----------------------------------
display(' '); display(' '); display(' ');
display('\n---------Software de projeto de filtro digital----------');
display('Criado por: Érico Cedraz, Arnaldo Oliveira e Tiago Lobão');
display('O que deseja analisar?');
display(' ');
display('1 - Filtro digital implementado na forma direta');
display('2 - Filtro digital implementado na forma cascata');
display('3 - Filtro com transformação em frequência Z^-1 = -Z^-1');
display('4 - Filtro com transformação em frequência Z^-1 = -Z^-2');

in = input('Comando: ');
switch in
    case 1
        display('OBS: Vermelho - truncado, Azul - original')
        cd = input('Precisão de quantas casas decimais? ');
        plot_sensib_direta(h,cd);
    case 2
        display('OBS: Vermelho - truncado, Azul - original')
        cd = input('Precisão de quantas casas decimais? ');
        plot_sensib_cascata(sos,cd);
    case 3
        z2_z(h);
    case 4
        z2_zsq(h);
    otherwise
        display('Comando inválido. Tchau!');
end

