## Copyright (C) 2017 user
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} CholeskyFunction (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@USER-PC>
## Created: 2017-11-27

function x = CholeskyFunction (A,b,n)
tStart = tic;
L = zeros(n,n);
LT = zeros(n,n);
L(1,1) = A(1,1);
L(2,1) = A(2,1)/L(1,1);
L(2,2) = (A(2,2)-L(2,1))**0.5;
L(3,1) = A(3,1)/L(1,1);
L(3,2) = (A(3,2)-L(3,1)*L(2,1))/L(2,2);
L(3,3) = (A(3,3)-L(3,2)**2-L(3,1)**2)**0.5;
for i = 4:n
  for j = i-3:2:i-1
    sum = 0;
    for k = i-3:j-1
      sum += L(i,j)*L(j,k);
    endfor
    L(i,j) = (A(i,j)-sum)/L(j,j);
  endfor
  sum = 0;
  for k =i-3:i-1
    sum += L(i,k)**2;
  endfor
  L(i,i) = (A(i,i)-sum)**0.5;
endfor
LT = L.';
L = real(L);
L = single(L);
#Solve Ly=b
b = single(b);
y = L\b;
y = single(y);
#Solve LTx=y
x = real(LT\y);
x = single(x);
tEnd = toc(tStart)
disp("END")
#End of Algorithm
endfunction
