

        function [v,d] = eigd (x)
           [v,d]   = eig (x);
           v = fliplr(v);
           d = flipud(fliplr(d));  % or use:  d = diag(flipud(diag(d)))
                                   % ...whichever is faster
        end