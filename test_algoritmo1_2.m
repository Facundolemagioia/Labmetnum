%test de algoritmo 1 -> problema 2
% datos para la parte 4.1 2

function test1 = test_algoritmo1()

valores_k = [1/10, 1/8, 1/6, 1/5, 1/3, 1/2, 3/4, 4/5, 17/20, 19/20];


output_precision(16);
tasa = [];
itera = [];
tiempo = [];


for k = valores_k
  disp("k = "), disp(k)
  prom_iteraciones = 0;
  prom_tiempo = 0;
  tasa_convergencia = 0;
  lambda = [3-k, 1+k, -1, -1, -1, -1];
  for i = 1:100
    [Y, i, a, t]= algoritmo1_exp(lambda);
    
    prom_iteraciones = prom_iteraciones + (i/100); 
    prom_tiempo = prom_tiempo + (t/100);
    tasa_convergencia = tasa_convergencia + (a/100);
    
  endfor
  
  tasa = [tasa, tasa_convergencia];
  itera = [itera, prom_iteraciones];
  tiempo = [tiempo, prom_tiempo];
  
  more off
  disp("======================================");
  disp("promedio-iteraciones:"), disp(prom_iteraciones);
  disp("promedio-tiempo:"), disp(prom_tiempo);
  disp("tasa-convergencia:"), disp(tasa_convergencia);
  printf("\n\n");
endfor

endfunction
