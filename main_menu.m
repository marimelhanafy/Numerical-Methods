function main_menu()
% main_menu: displays a menu of numerical methods for solving various mathematical problems.
% The function prints out the options for different categories of numerical methods,
% such as roots of equations, linear algebraic equations, curve fitting and interpolation,
% numerical differentiation and integration, and ordinary differential equations.
% The user is prompted to enter a number corresponding to the task they want to perform.
repeat = 'Y';
while repeat == 'Y' || repeat == 'y'
    % Display menu options
    disp('Main Menu:')
    menu_options();
    % Get the user's input
    choice = input('Please select the task you want to perform: ')
    % Input validation
    while ~ismember(choice, 0:30)
        disp('Invalid input. Please select a valid option.')
        choice = input('Please select the task you want to perform: ')
    end
    % Exit option
    if choice == 0
        fprintf('Exiting the program. \nThank You!\n');
        return;
    end
    % Call the appropriate function based on the user's choice
    switch choice
        case {1, 2} % Bisection and False Position
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            func = str2func(['@(x) ' expression])
            xl = input('Lower Guess xl = ') % user input for lower guess
            xu = input('Upper Guess xu = ') % user input for upper guess
            % Ask user if they want to enter desired relative error (es)
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            end
            % Set es to user input if they want to enter it, otherwise set it to default value of 0.0001
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.0001
            end
            % Ask user if they want to enter maximum allowable iterations (maxit)
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            % Set maxit to user input if they want to enter it, otherwise set it to default value of 50
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('Output: ');
            % Call bisection_method or false_position_method based on user's choice
            if choice == 1
                [root,fx,ea,iter] = bisection_method(func,xl,xu,es,maxit) % Call bisection method
            elseif choice == 2
                [root,fx,ea,iter] = false_position_method(func,xl,xu,es,maxit) % Call false position method
            end
        case 3
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            func = str2func(['@(x) ' expression])
            xr = input('Initial Guess xr = ')
            % Get desired relative error
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            end
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.0001
            end
            % Get maximum allowable iterations
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('Output:');
            % Compute root using fixed point method
            [root,ea,iter] = fixed_point(func,xr,es,maxit)
        case 4
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            f_expression = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            func = str2func(['@(x) ' f_expression])
            % Prompt the user for the derivative expression
            df_expression = input('Derivative expression: df(x) = ', 's');
            % Define the function using the user input
            dfunc = str2func(['@(x) ' df_expression])
            xr = input('Initial Guess xr = ')
            % Get desired relative error
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            end
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.0001
            end
            % Get maximum allowable iterations
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('Output:')
            % Compute root using Newton Raphson method
            [root,ea,iter] = newton_raphson(func,dfunc,xr,es,maxit)
        case 5
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            func = str2func(['@(x) ' expression])
            xrold = input('Initial Guess xrold = ')
            xr = input('Initial Guess xr = ')
            % Get desired relative error
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            end
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.0001
            end
            % Get maximum allowable iterations
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('Output:');
            % Compute root using Secant method
            [root,ea,iter] = secant(func,xrold,xr,es,maxit)
        case 6
            % Get the user's input
            disp('Please Enter The following:');
            % Ask user to input the coefficient matrix A and the right hand side vector b
            A = input('Coefficient Matrix A = ')
            b = input('Right Hand Side Vector b = ')
            % Use the cramer's rule to solve the system of linear equations
            disp('The solution of the linear system is: ');
            x = cramer(A, b)
        case 7
            % Get the user's input
            disp('Please Enter The following:');
            A = input('Coefficient Matrix A = ')
            b = input('Right Hand Side Vector b = ')
            % Use the naive_gauss_elimination to solve the system of linear equations
            disp('The solution of the linear system is: ');
            x = naive_gauss_elimination(A,b)
        case 8
            % Get the user's input
            disp('Please Enter The following:');
            A = input('Coefficient Matrix A = ')
            b = input('Right Hand Side Vector b = ')
            % Use the gauss_pivot to solve the system of linear equations
            disp('The solution of the linear system is: ');
            x = gauss_pivot(A,b)
        case 9
            % Get the user's input
            disp('Please Enter The following:');
            A = input('Coefficient Matrix A = ')
            b = input('Right Hand Side Vector b = ')
            % Compute LU decomposition
            [L, U] = lu_decomposition(A)
            % Solve system of equations
            d = L\b;
            x = U\d;
            % Display solution
            disp('The solution is: ');
            disp(x);
        case 10
            % Get the user's input
            disp('Please Enter The following:');
            A = input('Coefficient Matrix A = ')
            b = input('Right Hand Side Vector b = ')
            % Get desired relative error
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
            end
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.0001
            end
            % Get maximum allowable iterations
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('The solution is: ');
            [x, err, iter] = gauss_seidel_method(A,b,es,maxit) % Call gauss_seidel_method method
%         case 11
%             % Get the user's input
%             disp('Please Enter The following:');
%             % Prompt the user for the function expression
%             expression = input('Function expression: f(x) = ', 's');
%             % Define the function using the user input
%             func = str2func(['@(x) ' expression])
%             x0 = input('Initial Guess x0 = ')
%             % Get desired relative error
%             ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
%             while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
%                 disp('Please Enter [Y/N].');
%                 ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
%             end
%             if ans_es == 'Y' || ans_es == 'y'
%                 es = input('es = ')
%             else
%                 es = 0.0001
%             end
%             % Get maximum allowable iterations
%             ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
%             while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
%                 disp('Please Enter [Y/N].');
%                 ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
%             end
%             if ans_maxit == 'Y' || ans_maxit == 'y'
%                 maxit = input('maxit = ')
%             else
%                 maxit = 50
%             end
%             disp('The solution is: ');
%             [x,f,ea,iter] = newton_raphson_nonlinear(func,x0,es,maxit) % Call newton_raphson_nonlinear method
%         case 12
%             % Get the user's input
%             disp('Please Enter The following:');
%             % Prompt the user for the function expression
%             expression = input('Function expression: f(x) = ', 's');
%             % Define the function using the user input
%             func = str2func(['@(x) ' expression])
%             x0 = input('Initial Guess x0 = ')
%             % Get desired relative error
%             ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
%             while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
%                 disp('Please Enter [Y/N].');
%                 ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.0001%) [Y/N]', 's');
%             end
%             if ans_es == 'Y' || ans_es == 'y'
%                 es = input('es = ')
%             else
%                 es = 0.0001
%             end
%             % Get maximum allowable iterations
%             ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
%             while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
%                 disp('Please Enter [Y/N].');
%                 ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
%             end
%             if ans_maxit == 'Y' || ans_maxit == 'y'
%                 maxit = input('maxit = ')
%             else
%                 maxit = 50
%             end
%             disp('The solution is: ');
%             [x,f,ea,iter] = secant_nonlinear(func,x0,es,maxit) % Call secant_nonlinear method
        case 11
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user to enter values for x and y
            x = input('Independent Variable x = ')
            y = input('Dependent Variable y = ')
            % Perform linear regression on the input data
            [a, r2] = linear_regression(x,y);
            % Calculate the predicted values of y using the regression line
            y_expected = a(2) + a(1)*x;
            % Display the regression model with the calculated coefficients
            y_model = ['ymodel = ' num2str(a(2)) '+' num2str(a(1)) 'x']
            % Prompt the user whether to display the correlation coefficient or not
            ans_cor_coe = input('Do you want to display the Correlation Coefficient? [Y/N]', 's');
            while ~(ans_cor_coe == 'Y' || ans_cor_coe == 'y' || ans_cor_coe == 'N' || ans_cor_coe == 'n')
                disp('Please Enter [Y/N].');
                ans_cor_coe = input('Do you want to display the Correlation Coefficient? [Y/N]', 's');
            end
            % Display the correlation coefficient if user requested it
            if ans_cor_coe == 'Y' || ans_cor_coe == 'y'
                disp(['Correlation Coefficient: ' num2str(r2)])
            end
        case 12
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user to enter values for x and y
            x = input('Independent Variable x = ')
            y = input('Dependent Variable y = ')
            % Fit a power model to the data
            disp('The solution is: ');
            [a, b] = fitting_power_model(x,y);
            % Calculate the expected values of y
            y_expected = a*x.^b;
            % Create a string for the power model formula
            y_model = ['fmodel = ' num2str(a) 'x\^' num2str(b)]
            % Prompt the user whether to plot the data and expected values
            ans_plot = input('Do you want to plot x vs. y and y_expected? [Y/N]', 's');
            while ~(ans_plot == 'Y' || ans_plot == 'y' || ans_plot == 'N' || ans_plot == 'n')
                disp('Please Enter [Y/N].');
                ans_plot = input('Do you want to plot x vs. y and y_expected? [Y/N]', 's');
            end
            % If the user wants to plot the data and expected values
            if ans_plot == 'Y' || ans_plot == 'y'
                % Plot the data and expected values
                plot(x,y,'o',x,y_expected); grid on;
                legend('measured f (Original points)', y_model);
            end
        case 13
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user to enter values for x and y
            x = input('Independent Variable x = ')
            y = input('Dependent Variable y = ')
            % Call the fitting_exponential_model function to calculate alpha and beta
            [alpha, beta] = fitting_exponential_model(x,y);
            % Calculate the expected y values using alpha and beta
            x_plot = linspace(min(x),max(x),50); % generate 50 points to make the line smoother
            disp('The solution is: ');
            y_model = [num2str(alpha) '*' 'e^(' num2str(beta) ')*x']
            y_expeted = alpha*exp(beta*x_plot);
            % Ask the user if they want to plot x vs. y and y_expected
            ans_plot = input('Do you want to plot x vs. y and y_expected? [Y/N]', 's');
            while ~(ans_plot == 'Y' || ans_plot == 'y' || ans_plot == 'N' || ans_plot == 'n')
                disp('Please Enter [Y/N].');
                ans_plot = input('Do you want to plot x vs. y and y_expected? [Y/N]', 's');
            end
            % Plot the data and the expected curve if the user chooses to do so
            if ans_plot == 'Y' || ans_plot == 'y'
                plot(x,y,'o',x_plot,y_expeted); grid on;
                legend('y-table','y-exponential');
            end
        case 14
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user to enter values for x and y
            x = input('Independent Variable x = ')
            y = input('Dependent Variable y = ')
            xx = input('Value of independent variable at which interpolation is calculated xx = ')
            % Call the newton_interpolating_polynomial function to calculate the interpolated y value
            disp('The interpolated y value is: ');
            yint = newton_interpolating_polynomial(x,y,xx)
        case 15
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user to enter values for x and y
            x = input('Independent Variable x = ')
            y = input('Dependent Variable y = ')
            xx = input('Value of independent variable at which interpolation is calculated xx = ')
            % Call the lagrange_interpolating_polynomial function to calculate the interpolated y value
            disp('The interpolated y value is: ');
            yint = lagrange_interpolating_polynomial(x,y,xx)
        case 16
            % Get the user's input
            disp('Please Enter The following:');
            disp('Define the data points:');
            x = input('x = ')
            y = input('y = ')
            % Compute the cubic spline coefficients
            disp('Output:');
            [s0, s1, s2, s3] = cubic_spline(x, y)
            % Plot the cubic spline
            plot_cubic_spline(x, s0, s1, s2, s3);
            % Add the original data points to the plot
            hold on; plot(x, y, 'ro'); hold off;
            % Set the plot labels
            title('Cubic Spline Interpolation');
            xlabel('x'); ylabel('y');
        case 17
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            func = input('Function expression: f(x) = ','s');
            % Define the function using the user input
            % func = str2func(['@(x) ' expression])
            % Define the x-axis limits for plotting and calculating the area
            a = input('Lower limit of x-axis: Lower Limit = ')
            b = input('Upper limit of x-axis: Upper Limit = ')
            n = input('Number of Segments = ')
            I = simpsons_1_3(func,a,b,n);
            fprintf('The approximation of above integral is: %.f',I);
            % Ask the user if they want to plot the function with the area
            % under the curve
            ans_plot = input('Do you want to plot the function with the area under the curve? [Y/N]', 's');
            while ~(ans_plot == 'Y' || ans_plot == 'y' || ans_plot == 'N' || ans_plot == 'n')
                disp('Please Enter [Y/N].');
                ans_plot = input('Do you want to plot the function with the area under the curve? [Y/N]', 's');
            end
            % Plot the data and the expected curve if the user chooses to do so
            if ans_plot == 'Y' || ans_plot == 'y'
                plot_area_under_the_curve(func,a,b);
            end
        case 18
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            func = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            % func = str2func(['@(x) ' expression])
            % Define the x-axis limits for plotting and calculating the area
            a = input('Lower limit of x-axis: Lower Limit = ')
            b = input('Upper limit of x-axis: Upper Limit = ')
            plot_area_under_the_curve(func,a,b);
        case 19
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('ODE expression: dydt = ', 's');
            % Define the function using the user input
            dydt = str2func(['@(t,y) ' expression])
            disp('Interval of independent variable');
            t1 = input('Initial Value = ');
            t2 = input('Final Value = ');
            tspan = [t1, t2]
            y0 = input('Initial value of dependent variable = ')
            h = input('Step Size h = ')
            disp('The solution is: ');
            [t,y] = eulode(dydt,tspan,y0,h)
            plot(t,y); grid on;
            title('Euler Method');
            xlabel('x'); ylabel('y');
        case 20
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('ODE expression: dydt = ', 's');
            % Define the function using the user input
            dydt = str2func(['@(t,y) ' expression])
            disp('Interval of independent variable');
            t1 = input('Initial Value = ');
            t2 = input('Final Value = ');
            tspan = [t1, t2]
            y0 = input('Initial value of dependent variable = ')
            h = input('Step Size h = ')
            % Get desired relative error
            ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.001%) [Y/N]', 's');
            while ~(ans_es == 'Y' || ans_es == 'y' || ans_es == 'N' || ans_es == 'n')
                disp('Please Enter [Y/N].');
                ans_es = input('Do you want to enter your desired relative error (es)? (default = 0.001%) [Y/N]', 's');
            end
            if ans_es == 'Y' || ans_es == 'y'
                es = input('es = ')
            else
                es = 0.001
            end
            % Get maximum allowable iterations
            ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            while ~(ans_maxit == 'Y' || ans_maxit == 'y' || ans_maxit == 'N' || ans_maxit == 'n')
                disp('Please Enter [Y/N].');
                ans_maxit = input('Do you want to enter your maximum allowable iterations (maxit)? (default = 50) [Y/N]', 's');
            end
            if ans_maxit == 'Y' || ans_maxit == 'y'
                maxit = input('maxit = ')
            else
                maxit = 50
            end
            disp('The solution is: ');
            [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
            plot(t,y); grid on;
            title('Heun Method');
            xlabel('x'); ylabel('y');
        case 21
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('ODE expression: dydt = ', 's');
            % Define the function using the user input
            dydt = str2func(['@(t,y) ' expression])
            disp('Interval of independent variable');
            t1 = input('Initial Value = ');
            t2 = input('Final Value = ');
            tspan = [t1, t2]
            y0 = input('Initial value of dependent variable = ')
            h = input('Step Size h = ')
            disp('The solution is: ');
            [t,y] = midpoint(dydt,tspan,y0,h)
            plot(t,y); grid on;
            title('Midpoint Method');
            xlabel('x'); ylabel('y');
        case 22
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('ODE expression: dydt = ', 's');
            % Define the function using the user input
            dydt = str2func(['@(t,y) ' expression])
            disp('Interval of independent variable');
            t1 = input('Initial Value = ');
            t2 = input('Final Value = ');
            tspan = [t1, t2]
            y0 = input('Initial value of dependent variable = ')
            h = input('Step Size h = ')
            disp('The solution is: ');
            [t,y] = rk4(dydt,tspan,y0,h)
            plot(t,y); grid on;
            title('Runge-Kutta Methods 4th order');
            xlabel('x'); ylabel('y');
        case 23
            % Get the user's input
            disp('Please Enter The following:');
            % Prompt the user for the function expression
            expression = input('Function expression: f(x) = ', 's');
            % Define the function using the user input
            func = str2func(['@(x) ' expression])
            % Plot the function
            fplot(func); grid on; grid minor;
        case 24
            example_1(); % Description
        case 25
            example_2(); % Description
        case 26
            example_3(); % Description
        case 27
            example_4(); % Description
        case 28
            example_5(); % Description
    end
    repeat = input('Do you want to perform another task? [Y/N]','s');
    while ~(repeat == 'Y' || repeat == 'y' || repeat == 'N' || repeat == 'n')
        disp('Please Enter [Y/N].');
        repeat = input('Do you want to perform another task? [Y/N]','s');
    end
end
if repeat == 'N' || repeat == 'n'
    fprintf('Exiting the program. \nThank You!\n')
    return;
end
end