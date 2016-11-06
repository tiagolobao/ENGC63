%Obtem os indices do polinômio de raizes complexas dado uma das raízes
%(X-Z)*(X+Z') = X² + 2*Re{Z}*S + Re{Z}² - Im{Z}²
function Coef = getComplxCoef(raiz)
  Coef(1) = 1;
  Coef(2) = -2*real(raiz(1));
  Coef(3) = real(raiz(1))^2 + imag(raiz(1))^2;
end