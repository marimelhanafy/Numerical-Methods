function x = cramer(A, b)
% Solve the system of linear equations Ax = b using Cramer's rule.
% Input:
% - A: an n-by-n matrix representing the coefficients of the linear system.
% - b: an n-by-1 vector representing the right-hand side of the linear system.
% Output:
% - x: an n-by-1 vector representing the solution of the linear system.
n = length(b);
x = zeros(n,1);
D = det(A);
for i = 1:n
    temp = A;
    temp(:,i) = b;
    x(i) = det(temp)/D;
end
end