function plot_area_under_the_curve(func, xMin, xMax)
%plot_area_under_the_curvee
%   plot the function and its area under the curve within a limit of xMin
%   and xMax

% Plot the function
fplot(func, [xMin, xMax],'b');
hold on;
% Create x values for fill
x = linspace(xMin, xMax, 1000);
% Evaluate the function at each x-coordinate
f = str2func(['@(x) ' func]);
y = f(x);
% Fill the area under the curve
fill([x, fliplr(x)], [y, zeros(size(y))],'r', 'FaceAlpha', 0.3);
hold off;
xlabel('x');
ylabel('f(x)');
title(['Plot of f(x) = ' func]);
legend('Function', 'Area under the curve');
end