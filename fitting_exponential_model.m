function [alpha, beta] = fitting_exponential_model(x,y)
% fitting_exponential_model fits an exponential model y = alpha * exp(beta * x)
% to the given data points (x,y) using linear regression. 
% INPUTS:
% x - a vector of n x-values 
% y - a vector of n y-values
% OUTPUTS:
% alpha - the coefficient alpha in the model
% beta - the coefficient beta in the model
yt = log(y);
p = polyfit(x,yt,1);
alpha = exp(p(2));
beta = p(1);
end