function [root,fx,ea,iter] = false_position_method(func,xl,xu,es,maxit,varargin)
% false_position_method: root location zeroes using false position method
% [root,fx,ea,iter] = false_position_method(func,xl,xu,es,maxit,p1,p2,...):
% uses false position method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations
if nargin < 3
    error('at least 3 input arguments required')
end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test > 0
    error('no sign change')
end
if nargin < 4 || isempty(es)
    es=0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
end
iter = 0;
xr = xl;
ea = 100;
while (1)
    xrold = xr;
    xr = xu - ((func(xu, varargin{:}) * (xl - xu))/(func(xl, varargin{:}) - func(xu, varargin{:})));
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit
        break;
    end
end
root = xr;
fx = func(xr, varargin{:});
end