% version del algoritmo 1 modificada para experimentación

function [M, i, a, t] = algoritmo1_exp (eigenvalues)
% valores retornados:
% M : matriz retornada del algoritmo 1
% i : cantidad de iteraciones
% a : tasa de exito de convergencia
% t : tiempo requerido

t0 = clock();

n = length(eigenvalues);

d = 1*rand(n,1);
t = triu(bsxfun(@min,d,d.').*rand(n),1); 
Y = diag(d)+t+t.'; 

Y = Y.*Y;

eps = 10^(-10);
count = 0;
eigenvalues = sort(eigenvalues, 'descend');
do
  % usa eigd, llamando a funcion de eigd.m
  [V, D] = eigd(Y); 

  E = diag(eigenvalues); 
  X = V*E*V'; 
  X = (1/2)*(X + X'); 
  Y = max(X,0); 
  count++;
until ((norm(X-Y, "fro") < eps) || count == 1000)

M = X;
i = count;
t = etime(clock(), t0); %numero de segundo desde que t0 fue inicializada

% si converge -> 1 , no converge -> 0
% va sumando los que converge
%luego divide por 100 (en test_algoritmo1)

if(count == 1000 && (norm(X-Y, "fro") > eps))
  a = 0;
else 
  a = 1;
endif

endfunction