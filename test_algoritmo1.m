% test de algoritmo 1 -> problema 2
% lambda varia en cada una de las simulaciones 

function test1 = test_algoritmo1()

valores_n = [3, 7, 19, 26, 31, 40, 55, 67, 80, 99];

for i = 1:10
  %ejemplo con caso n = 3;
  
  lambda = 100000*rand(valores_n(1),1);
  Y = algoritmo1(lambda);
  
  
  
  more off
  disp(lambda);
  printf("\n");
  disp(Y);
  printf("\n");
  disp(eig(Y));
  printf("\n");
endfor



endfunction
