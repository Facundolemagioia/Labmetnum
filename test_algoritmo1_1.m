% test de algoritmo 1 -> problema 2
% datos para la parte 4.1 1
% lambda varia en cada una de las simulaciones 

function test1 = test_algoritmo1_1()
%36, 55, 80
valores_n = [2, 3, 5, 7, 10, 15, 21, 36, 55, 80];


output_precision(16);
tasa = [];
itera = [];
tiempo = [];

for j = valores_n;
  disp("N = "), disp(j);
  prom_iteraciones = 0;
  prom_tiempo = 0;
  tasa_convergencia = 0;
  for k = 1:100
  
    %vaps en rango de -10 ... 10
    do
      lambda = -10 + (20).*rand(j,1);
    until (sum(lambda) >= 0)
        
    [Y, i, a, t]= algoritmo1_exp(lambda);
    
    %no nos importa por ahora
    %err = norm(lambda - eig(Y), "fro");
    
    % acumulando valores 
    prom_iteraciones = prom_iteraciones + (i/100); 
    prom_tiempo = prom_tiempo + (t/100);
    tasa_convergencia = tasa_convergencia + (a/100);
  endfor
  
  tasa = [tasa, tasa_convergencia];
  itera = [itera, prom_iteraciones];
  tiempo = [tiempo, prom_tiempo];
  
  more off
  
  disp("promedio-iteraciones:"), disp(prom_iteraciones);
  disp("promedio-tiempo:"), disp(prom_tiempo);
  disp("tasa-convergencia:"), disp(tasa_convergencia);
  disp("======================================");
  printf("\n\n");
  
endfor

subplot(1, 3, 1)
plot(valores_n,tasa);
xlabel("N");
ylabel("tasa de exito de convergencia");
subplot(1,3,2)
plot(valores_n, itera);
xlabel("N");
ylabel("iteraciones");
subplot(1,3,3)
plot(valores_n, tiempo);
xlabel("N");
ylabel("tiempo");
 

endfunction
