function test1 = test_algoritmo2_1()

t0 = clock();

valores_n = [2, 3 , 5, 7, 9];


output_precision(16);
tasa = [];


for j = valores_n;
  
  disp("N = "), disp(j);
  prom_iteraciones = 0;
  prom_tiempo = 0;
  tasa_convergencia = 0;
  
  
  for i = 1:100
    
      re = (20).*rand(j,1) - 10;
      im = (20).*rand(j,1) - 10;
      lambda = re + im*i;
        
    [Y, i, a, t]= algoritmo2_exp(lambda);
    
  
    prom_iteraciones = prom_iteraciones + (i/100); 
    prom_tiempo = prom_tiempo + (t/100);
    tasa_convergencia = tasa_convergencia + (a/100);
  endfor
  
  tasa = [tasa, tasa_convergencia];
  more off
  
  disp("promedio-iteraciones:"), disp(prom_iteraciones);
  disp("promedio-tiempo:"), disp(prom_tiempo);
  disp("tasa-convergencia:"), disp(tasa_convergencia);
  disp("======================================");
  printf("\n\n");
  
endfor
t = etime(clock(), t0);
plot(valores_n, tasa);

endfunction
