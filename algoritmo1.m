function a1 = algoritmo1 (eigenvalues)
% algoritmo 1 -> problema 2
% eigenvalues es el vector de los valores propios

n = length(eigenvalues); % tamaño del vector eigenvalues

% matriz simetrica Y(nxn) random ( Y = Y^t)
d = 100000*rand(n,1); % valores random en diagonal 
t = triu(bsxfun(@min,d,d.').*rand(n),1); % valores triang superiores random
Y = diag(d)+t+t.'; % juntarlos en una matriz simetrica

% producto de Hadamard a la matrix Y
Y = Y.*Y;

% condicion de parada
count = 0;
do
  % calcular descomposicion de Y (Metodo de Jacobi o ...)
  vaps_y = eig(Y); % vector columna con vaps de Y
  [V, D] = eig(Y); % relacion: Y = V*D*inv(V) con inv(V) = V'

  % matríz X
  E = diag(eigenvalues); % matríz diagonal con eigenvalues
  X = V*E*V'; % paso 4
  X = (1/2)*(X + X'); % paso 5, aseguramos que X sea simétrica 
  Y = max(X,0); % paso 6
  count++;
until ((norm(X - Y) < eps) || count == 1000)

a1 = Y;

endfunction