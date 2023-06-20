function [a, b] = fitting_power_model(x,y)
%FITTING_POWER_MODEL Fit a power model to data using linear regression.
% [a, b] = FITTING_POWER_MODEL(x, y) finds the coefficients a and b that
% best fit a power model of the form y = a*x^b to the data represented by
% the vectors x and y. The fitting is performed by linear regression on
% the transformed data, using the natural logarithm of x and y. The
% function returns the estimated values of a and b as outputs.
% Input arguments:
% - x: a vector containing the values of the independent variable
% - y: a vector containing the values of the dependent variable
% Output arguments:
% - a: the estimated value of the parameter a in the power model
% - b: the estimated value of the parameter b in the power model
x = log(x);
y = log(y);
n = length(x);
A = [n sum(x); sum(x) sum(x.^2)];
b = [sum(y); sum(x.*y)];
a = A\b;
alpha = a(1);
beta = a(2);
disp(a');
a = exp(alpha);
b = beta;
end