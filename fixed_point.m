function [root,ea,iter] = fixed_point(func,xr,es,maxit,varargin)
% fixed_point: Fixed-Point root location of zeroes
% [root,ea,iter] = fixed_point(func,xr,es,maxit,p1,p2,...):
% uses Fixed-Point iteration method to find the root of func
% input:
% func = name of function
% xr = initial guess
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% root = real root
% ea = approximate relative error (%)
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
while (1)
    xrold = xr;
    xr = func(xr);
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