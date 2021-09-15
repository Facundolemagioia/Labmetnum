% test de algoritmo 1 -> problema 2
% lambda varia en cada una de las simulaciones 

function test1 = test_algoritmo1()

valores_n = [3, 7, 19, 26, 31, 40, 55, 67, 80, 99];

output_precision(16);
for j = valores_n
  disp("N = "), disp(j)
  for i = 1:100
    lambda = 1*rand(j,1);
    [Y, i, a, t]= algoritmo1_exp(lambda);
    err = norm(lambda - eig(Y), "fro");
  
    more off
    
    %se muestra error
    disp("Error:"), disp(err);
    printf("\n");
    
    % matriz buscada
    disp("iteraciones:"), disp(i);
    printf("\n");
    
    % tasa de convergencia
    disp("tasa de convergencia:"), disp(a);
    printf("\n");
    
    %tiempo
    disp("tiempo:"), disp(t);
    print("\n");
  endfor
  disp("======================================");
endfor

endfunction
