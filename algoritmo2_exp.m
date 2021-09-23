function [X, i, a, t] = algoritmo2_exp(eigenvalues)
  % algoritmo 2 -> problema 1
  t0 = clock();
  
  n = length(eigenvalues);
  
  Y = rand(n); % paso 1, matriz real random
  eps = 10^-10;
  N = factorial(n);
  count = 2;
  count2 = 0;
  P = perms(eigenvalues);
  
  do
    vaps_y = eig(Y); % vector columna con vaps de Y
    [U, T] = schur(Y, "complex"); % paso 3, Schur decomposition: UTU* 
    
    lambda = eig(T);
    
    % falta paso 4, calcular X con permutacion de lambda que minimice ..  
   
    lambda_inicial = P(N,:); % lambda de entrada
    
    lambda_temp = P(1,:); % segunda fila
    
    while(((norm(lambda_inicial - lambda_temp))^2 >= eps) && (count < N))
      lambda_techo = P(count,:);
      diferencia = (norm(lambda_inicial - lambda_techo))^2;
      if(diferencia < (norm(lambda_inicial - lambda_temp))^2)
           lambda_temp = lambda_techo;
      endif
      count++;
    endwhile
    
    T = T - diag(diag(T)) + diag(lambda_temp);
    X = U*T*conj(U.');
    Y = max(real(X), 0); % paso 5
    count2++;
   
  until ((norm(X - Y) < eps ) || (count2 == 5000))
 
  M = X;
  t = etime(clock(), t0);
  i = count2;
  
  if(count == 5000 && (norm(X-Y, "fro") > eps))
    a = 0;
  else 
    a = 1;
  endif
  
endfunction

