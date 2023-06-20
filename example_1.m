function example_1()
% Display the equation to solve using bisection method
disp('fm = @(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)-36;');
% Define the function handle for fm
fm = @(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)-36;
% Display the bisection method and its application
disp('for i=1:15, [mass(i) fx ea(i) iter(i)] = bisection_method(fm,40,200,1e-8,i); end');
% Use a for loop to apply the bisection method
for i=1:15
    [mass(i) fx ea(i) iter(i)] = bisection_method(fm,40,200,1e-8,i);
end
% Calculate the relative error
disp('et = abs(mass-142.7376)/142.7376*100;');
et = abs(mass-142.7376)/142.7376*100;
% Plot the iterations vs. the absolute error and the relative error
disp('semilogy(iter,ea,iter,et);');
semilogy(iter,ea,iter,et); grid on;
title('Bungee Jumber Velocity (Using Bisection Mathod)');
xlabel('Iterations'); ylabel('log(|ea|),log(|et|)');
legend('log(|ea|)','log(|et|)');
end