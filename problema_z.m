function pz = problema_z()
  
  eigenvalues = normrnd(0, 1,[5,1]);
  eigenvalues(1,1) = 1;
  
  for j = 2:5
    if(eigenvalues(j,1) > 1) 
      eigenvalues(j,1) = 1;
    else if(eigenvalues(j,1) < -1)
      eigenvalues(j,1) = -1;
      endif
    endif
  endfor
  
  disp(eigenvalues);
  printf("\n");
  
  # matriz retornada por alg 2
  X = algoritmo2_exp(eigenvalues);
  X = real(X);

  disp(X);
  printf("\n");
  disp(eig(X));
  printf("\n");
  
 
  #hallar autovector x asociado a vap 1
  [V, R] = eig(X);
  disp(V);

 
  D = diag(V(:,1));
  disp(D);
  X = inv(D)*X*D; 
  
  #patron z
  X(1,3) = 0; X(1,4) = 0;
  X(2,4) = 0; X(2,5) = 0;
  X(3,1) = 0; X(3,5) = 0;
  X(4,1) = 0; X(4,2) = 0;
  X(5,2) = 0; X(5,3) = 0;

  disp(X);
  printf("\n");
  disp(eig(X));
  printf("\n");
  
endfunction