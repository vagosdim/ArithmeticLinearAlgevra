#Implementation of Cholesky's Algorithm

promt = 'Enter dimension n:';
n = input(promt);

b1 = zeros(n,1);
b2 = ones(n,1);

b1(1,1) = 8; b1(2,1) = -1; b1(3,1) = -1;
b1(n,1) = 8; b1(n-1,1) = -1; b1(n-2,1) = -1;

b2(1,1) = 9; b2(2,1) = 0; b2(3,1) = 0;
b2(n,1) = 9; b2(n-1,1) = 0; b2(n-2,1) = 0;

A1 = zeros(n,n);
A2 = zeros(n,n);

for i = 1:n
  for j = 1:n
    if(i == j)
      A1(i,j) = 16;
      A2(i,j) = 17;
    elseif((i == j-1)||(j == i-1))
      A1(i,j) = -9;
      A2(i,j) = -9;
    elseif((i == j-3)||(j == i-3))
      A1(i,j) = 1;
      A2(i,j) = 1;
    endif
  endfor
endfor

A1;
A2;
b1;
b2;

L = zeros(n,n);
LT = zeros(n,n);

#Cholesky Algorithm
for i = 1:n
  for j = 1:(i-1)
    sum = 0;
    #Economy
    if(A1(i,j) != 0)
      for k = 1:(j-1)
        sum += L(i,j)*L(j,k);
      endfor
      L(i,j) = (A1(i,j)-sum)/L(j,j);
    else  
      L(i,j) = 0;
    endif
    #EndEconomy
  endfor
  sum = 0;
  for k = 1:(i-1)
    sum += L(i,k)**2;
  endfor
  L(i,i) = sqrt(A1(i,i)-sum);
endfor

LT = L.';
L = real(L);
#L = single(L)
A1;
LT;
disp("END")
#End of Algorithm