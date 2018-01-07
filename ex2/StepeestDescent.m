function [retval] = StepeestDescent (A, b, n)
  
  error = 0.00005;
  k = 0;
  xk = 0;
  rk = b;
  norma = norm(rk);
  while(norma > error)
    k = k + 1;
    ak = dot(rk,rk)/dot(rk,A*rk);
    xk = xk + ak*rk;
    if(mod(k,n) == 0)
      rk = b - A*xk;
    else
      rk = rk - ak*A*rk;
    endif
    norma = norm(rk);
  endwhile
  k
  retval = xk;
  
endfunction
