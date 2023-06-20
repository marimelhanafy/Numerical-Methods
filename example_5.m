function example_5()
disp('help polyfit');
% help polyfit
disp('help polyval');
% help polyval
disp('x = [1 2 3 4 5 6 7];');
x = [1 2 3 4 5 6 7];
disp('y = [0.5 2.5 2 4 3.5 6 5.5];')
y = [0.5 2.5 2 4 3.5 6 5.5];
disp('p = polyfit(x,y,1);')
p = polyfit(x,y,1);
pf_model = ['polyfit model = ' num2str(p(2)) '+' num2str(p(1)) 'x'];
disp(pf_model);
y_3_5_pv = polyval(p,3.5);
disp(['y(3.5) = polyval(p,3.5) = ' num2str(y_3_5_pv)]);

end