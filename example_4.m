function example_4()
format compact;
disp('help tic');
% help tic
disp('help toc');
% help toc
disp('To get the average time for a method, you can use tic/toc to time many repetitions of ');
disp('the same method and then divide the elapsed time by the repetitions (50,000 for example)');
disp('');
disp('The following problem is solved using GaussPivot() and its timing in micoseconds is reported,');
disp('then using GaussSeidel() with default tolerance, and its timing in micoseconds is reported.');
disp('And, finally the same is done with left division.');
disp('A = [4  1 -1  0  0   0  0  0;');
disp('     1  6 -2  1 -1   0  0  0;');
disp('     0  1  5  0 -1   1  0  0;');
disp('     0  2  0  6 -1   0 -1 -1;');
disp('     0  0 -1 -1  6  -1  0 -1;');
disp('     0  0 -1  0 -1   5  0  0;');
disp('     0  0  0 -1  0   0  4 -1;');
disp('     0  0  0 -1 -1   0 -1  5];');
disp('b = [3 -6 -5  0 12 -12 -2  2]'';');
A = [4  1 -1  0  0   0  0  0;
    1  6 -2  1 -1   0  0  0;
    0  1  5  0 -1   1  0  0;
    0  2  0  6 -1   0 -1 -1;
    0  0 -1 -1  6  -1  0 -1;
    0  0 -1  0 -1   5  0  0;
    0  0  0 -1  0   0  4 -1;
    0  0  0 -1 -1   0 -1  5];
b = [3 -6 -5  0 12 -12 -2  2]';
disp('Repetitions = 50000;'); Repetitions = 50000;
disp('tic;'); tic;
disp('for i = 1:Repetitions, x = gauss_pivot(A,b); end');
for i = 1:Repetitions
    x = gauss_pivot(A,b);
end
disp('t1 = toc;'); t1 = toc;
fprintf('Average time by gauss_pivot (in micro seconds) = t1/Repetitions*1000000 = %f\n',t1/Repetitions*1000000);
disp('tic;'); tic;
disp('for i = 1:Repetitions, x = gauss_seidel_method(A,b); end');
for i = 1:Repetitions
    x = gauss_seidel_method(A,b);
end
disp('t1 = toc;'); t1 = toc;
fprintf('Average time by gauss_seidel_method (in micro seconds) = t1/Repetitions*1000000 = %f\n',t1/Repetitions*1000000);
disp('tic;'); tic;
disp('for i = 1:Repetitions, x = A\b; end');
for i = 1:Repetitions
    x = A\b;
end
disp('t1 = toc;'); t1 = toc;
fprintf('Average time by Left Division (in micro seconds) = t1/Repetitions*1000000 = %f\n',t1/Repetitions*1000000);
end