#Implementation of Cholesky's Algorithm
#Cholesky Algorithm
promt = 'Enter dimension n:';
n = input(promt);

#Initialiazing b1 b2
b1 = zeros(n,1);
b2 = ones(n,1);

b1(1,1) = 8; b1(2,1) = -1; b1(3,1) = -1;
b1(n,1) = 8; b1(n-1,1) = -1; b1(n-2,1) = -1;

b2(1,1) = 9; b2(2,1) = 0; b2(3,1) = 0;
b2(n,1) = 9; b2(n-1,1) = 0; b2(n-2,1) = 0;

#Initiliazing A1,A2
A1 = zeros(n,n);
A2 = zeros(n,n);

tStart = tic;
l1 = [16   -9    0    1    0];
l1(end+1:numel(b1.'))=0;
l2 = [-9   16   -9    0    1];
l2(end+1:numel(b1.'))=0;
l3 = [0   -9   16   -9    0  1];
l3(end+1:numel(b1.'))=0;
l4 = [1    0   -9   16   -9   0   1];
l4(end+1:numel(b1.'))=0;
  
A1(1,:) = l1; A1(2,:) = l2;
A1(3,:) = l3;A1(4,:) = l4;    
for i = 5:n-4
  A1(i,i-3) = 1;
  A1(i,i+3) = 1;
  A1(i,i-1) = -9;
  A1(i,i+1) = -9;
  A1(i,i) = 16;
  
  A2(i,i-3) = 1;
  A2(i,i+3) = 1;
  A2(i,i-1) = -9;
  A2(i,i+1) = -9;
  A2(i,i) = 17;
endfor

A1(n,:) = fliplr(l1); 
A1(n-1,:) = fliplr(l2);
A1(n-2,:) = fliplr(l3);
A1(n-3,:) = fliplr(l4);

l1(1) += 1;l2(2) += 1;l3(3) += 1;l4(4) += 1;
A2(1,:) = l1; A2(2,:) = l2;
A2(3,:) = l3;A2(4,:) = l4; 

A2(n,:) = fliplr(l1); 
A2(n-1,:) = fliplr(l2);
A2(n-2,:) = fliplr(l3);
A2(n-3,:) = fliplr(l4); 

tEnd = toc(tStart)
#End Initialization
A1;A2;b1;b2;
x1 = CholeskyFunction(A1,b1,n);
x2 = CholeskyFunction(A2,b2,n);
