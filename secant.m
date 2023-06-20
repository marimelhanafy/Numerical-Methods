function [root,ea,iter] = secant(func,xrm1,xr0,es,maxit,varargin)
% secant: Secant root location zeroes
% [root,ea,iter] = secant(func,xold,xr,es,maxit,p1,p2,...):
% uses Secant method to find the root of func
% input:
% func = name of function
% xrold, xr = initial guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% root = real root
% ea = approximate relative error (%)
% iter = number of iterations
if nargin < 3
    error('at least 3 input arguments required')
end
if nargin < 5 || isempty(es)
    es=0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit=50;
end
iter = 0;
xrold = xrm1;
xr = xr0;
while (1)
    xrolder = xrold;
    xrold = xr;
    xr = xrold - func(xrold)*(xrolder-xrold)/(func(xrolder)-func(xrold));
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100; 
    end
    if ea <= es || iter >= maxit
        break
    end
end
root = xr;
end