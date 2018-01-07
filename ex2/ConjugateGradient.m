function [retval] = ConjugateGradient (A, b, n)

  x0 = 0;
  r0 = b;
  p1 = b;
  a1 = dot(r0,r0)/dot(A*p1,p1);
  x1 = x0 + a1*p1;
  r1 = b - A*x1;
  error = 0.00005;
  norma = norm(r1);
  k = 1;
  while(norma > error)
    k = k +1;
    bk = dot(r1,r1)/dot(r0,r0);
    pk = r1 + bk*p1;
    ak = dot(r1,r1)/dot(A*pk,pk);
    xk = x1 + ak*pk;
    if(mod(k,n) == 0)
      rk = b - A*xk;
    else
      rk = r1 - ak*A*pk;
    endif
    norma = norm(rk);
    r0 = r1;
    r1 = rk;
    p1 = pk;
    x1 = xk;
  endwhile
  k
  retval = x1;

endfunction
