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
do
  vaps_y = eig(Y); 
  [V, D] = eig(Y); 

  E = diag(eigenvalues); 
  X = V*E*V'; 
  X = (1/2)*(X + X'); 
  Y = max(X,0); 
  count++;
until ((norm(X-Y, "fro") < eps) || count == 1000)

M = X;
i = count;
t = etime(clock(), t0); %numero de segundo desde que t0 fue inicializada
a = (norm(X-Y, "fro") < eps) / eps;

endfunction