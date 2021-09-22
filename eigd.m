
function [v,d] = eigd (x)
  [v,d]   = eig (x);
  
  %flip lef to right
  v = fliplr(v);
  
  %d = flipud(fliplr(d));
  d = diag(flipud(diag(d)));
  % or use:  d = diag(flipud(diag(d)))
                                   % ...whichever is faster
                                   
end