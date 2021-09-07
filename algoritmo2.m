function a2 = algoritmo2 (eigenvalues)

% eigenvalues es el vector de los valores propios

n = length(eigenvalues); % tama�o del vector eigenvalues

% matriz simetrica Y(nxn) random ( Y = Y^t)
d = 100000*rand(n,1); % valores random en diagonal 
t = triu(bsxfun(@min,d,d.').*rand(n),1); % valores triang superiores random
Y = diag(d)+t+t.'; % juntarlos en una matriz simetrica

% producto de Hadamard a la matrix Y
Y = Y.*Y;
do
  % calcular descomposicion de Y (Metodo de Jacobi o ...)
  vaps_y = eig(Y); % vector columna con vaps de Y
  [V, D] = eig(Y); % relacion: Y = V*D*inv(V) con inv(V) = V'

  % matr�z X
  E = diag(eigenvalues); % matr�z diagonal con eigenvalues
  X = V*E*V'; % paso 4
  X = (1/2)*(X + X'); % paso 5, aseguramos que X sea sim�trica 
  Y = max(X,0); % paso 6
until (norm(X - Y) < eps)

% colocar en test_algoritmo2.m
% ver como importar script / funcion 
more off
disp(Y);
printf("\n");
disp(eig(Y));

endfunction