function [L,U] = lu_decomposition(A)
% Perform LU decomposition of matrix A
% Inputs:
%   A: square matrix of size n x n
% Outputs:
%   L: lower triangular matrix of size n x n
%   U: upper triangular matrix of size n x n
[m,n] = size(A);
if m ~= n
    error('Matrix must be square')
end
U = zeros(m);
L = eye(m);
for k = 1:m
    U(k,k:end) = A(k,k:end) - L(k,1:k-1)*U(1:k-1,k:end);
    L(k+1:end,k) = (A(k+1:end,k) - L(k+1:end,1:k-1)*U(1:k-1,k))/U(k,k);
end
end