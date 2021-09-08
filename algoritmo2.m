function a2 = algoritmo2(eigenvalues)
  % algoritmo 2 -> problema 1
  n = length(eigenvalues);
  
  Y = rand(n); % paso 1, matriz real random
  
  do
    vaps_y = eig(Y); % vector columna con vaps de Y
    [U, T] = schur(Y, "complex"); % paso 3, Schur decomposition: UTU* 
    
    lambda = eig(T);
    permutation = Max(
    
    % falta paso 4, calcular X con permutacion de lambda que minimice ... 
    
    Y = max(real(X), 0); % paso 5
  until (norm(X - Y) < eps)
  

endfunction