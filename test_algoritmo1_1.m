% test de algoritmo 1 -> problema 2
% datos para la parte 4.1 1
% lambda varia en cada una de las simulaciones 

function test1 = test_algoritmo1_1()

valores_n = [2, 3, 5, 7, 10, 15, 21, 29, 55, 67];


output_precision(16);
for j = valores_n
  disp("N = "), disp(j)
  prom_iteraciones = 0;
  prom_tiempo = 0;
  tasa_convergencia = 0;
  for i = 1:100
    %vaps en rango de -10 ... 10
    %-5 + (5-(-5))
    lambda = -10 + (10-(-10)).*rand(j,1);
    [Y, i, a, t]= algoritmo1_exp(lambda);
    
    %no nos importa por ahora
    %err = norm(lambda - eig(Y), "fro");
    
    % acumulando valores 
    prom_iteraciones = prom_iteraciones + (i/100); 
    prom_tiempo = prom_tiempo + (t/100);
    tasa_convergencia = tasa_convergencia + (a/100);
    
  endfor
  more off
  disp("======================================");
  disp("promedio-iteraciones:"), disp(prom_iteraciones);
  disp("promedio-tiempo:"), disp(prom_tiempo);
  disp("tasa-convergencia:"), disp(tasa_convergencia);
  printf("\n\n");
endfor

endfunction
