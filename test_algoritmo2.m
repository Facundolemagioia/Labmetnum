% test de algoritmo 2

function test2 = test_algoritmo2(vaps)
more off
printf("matriz usando algoritmo 2:\n");
A = source(algoritmo2, algoritmo2(vaps));
vaps_A = eig(A);
printf("Valores Propios de A:\n");
disp(vaps_A);
 
endfunction
