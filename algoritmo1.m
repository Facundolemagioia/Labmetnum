function M = algoritmo1 (eigenvalues)
% algoritmo 1 -> problema 2
% eigenvalues: es el vector de los valores propios
% M: matrix retornada del algoritmo1

n = length(eigenvalues); % tamaño del vector eigenvalues

% matriz simetrica Y(nxn) random ( Y = Y^t)
d = 1*rand(n,1); % valores random en diagonal 
t = triu(bsxfun(@min,d,d.').*rand(n),1); % valores triang superiores random
Y = diag(d)+t+t.'; % juntarlos en una matriz simetrica

% producto de Hadamard a la matrix Y
Y = Y.*Y;

eps = 10^(-10);
% condicion de parada
count = 0;
eigenvalues = sort(eigenvalues, 'descend');
do
  % calcular descomposicion de Y 
  [V, D] = eigd(Y); % relacion: Y = V*D*inv(V) con inv(V) = V'

  % matríz X
  E = diag(eigenvalues); % matríz diagonal con eigenvalues
  X = V*E*V'; % paso 4
  X = (1/2)*(X + X'); % paso 5, aseguramos que X sea simétrica 
  Y = max(X,0); % paso 6
  count++;
until ((norm(X-Y, "fro") < eps) || count == 1000)

M = Y;

endfunction