function example_2()
disp('help fzero');
% Display help for fzero function
% help fzero
disp('fx = @(x) x.^4-6*x.^3+12*x.^2-10*x+3;');
% Define the function fx as a function handle
fx = @(x) x.^4-6*x.^3+12*x.^2-10*x+3;
disp('options = optimset(''display'', ''iter'');');
% Define options for the fzero function
options = optimset('display', 'iter');
disp('fzero(fx,0.5,options)');
% Use fzero to find the root of fx starting from 0.5 with options
fzero(fx,0.5,options)
disp('fzero(fx,0.5)')
% Use fzero to find the root of fx starting from 0.5 with default options
fzero(fx,0.5)
end