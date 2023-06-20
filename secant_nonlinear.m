function [x,f,ea,iter] = secant_nonlinear(func,x0,es,maxit,varargin)
% secant_nonlinear: Secant method for zeroes of nonlinear systems
% [x,f,ea,iter] = secant_nonlinear(func,x0,es,maxit,p1,p2,...):
% uses the Newton-Raphson method to find the roots of
% a system of nonlinear equations, but with an apprximantion
% for the Jacobian
% input:
% func = name of function that returns f
% x0 = initial guess
% es = desired percent relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% x = vector of roots
% f = vector of functions evaluated at roots
% ea = approximate percent relative error (%)
% iter = number of iterations
if nargin < 2
    error('at least 2 input arguments required')
end
if nargin < 3 || isempty(es)
    es=0.0001;
end
if nargin < 4 || isempty(maxit)
    maxit=50;
end
iter = 0;
x = x0;
n = length(x);
Jacobian = zeros(n);
delta = 0.000001;
while (1)
    incrementedX = x;
    for i = 1:n
        %Loop to apprximate the Jacobian matrix:
        incrementedX(i) = x(i)+delta;
        %The ith column of Jacobian is the partial derivative of func()
        %with respect to x(i), i.e. the ith independent variable.
        Jacobian(:,i) = (func(incrementedX,varargin{:})-func(x,varargin{:}))/delta;
        incrementedX(i) = x(i); %restore it to x(i)
    end %for
    f = func(x);
    dx = Jacobian\f;
    x = x-dx;
    iter = iter + 1;
    ea = 100*max(abs(dx./x));
    if iter >= maxit || ea<=es
        break
    end
end
end
