
function [v,d] = eigd (x)
  [v,d] = eig(x);
  [D,I] = sort(diag(d));
  d = diag(flipud(D));
  v = v(:, flipud(I));
end