clc;
clear;

x1 = 0; 
x2 = 0; 
x3 = 0;

tol = 1e-4;
maxIter = 100;

fprintf('Assuming initial value: x1 = %.1f, x2 = %.1f, x3 = %.1f\n\n',x1,x2,x3);
tic;
for k = 1:maxIter
    old_x1 = x1;
    old_x2 = x2;
    old_x3 = x3;
    
    fprintf('Iteration %d:\n',k);
    
    x1 = (5 - x2 - x3)/2;
    fprintf('x1 = (5 - %.4f - %.4f)/2 = %.4f\n',old_x2,old_x3,x1);
    
    x2 = (15 - 3*x1 - 2*x3)/5;
    fprintf('x2 = (15 - 3*%.4f - 2*%.4f)/5 = %.4f\n',x1,old_x3,x2);
    
    x3 = (8 - 2*x1 - x2)/4;
    fprintf('x3 = (8 - 2*%.4f - %.4f)/4 = %.4f\n',x1,x2,x3);
    
    fprintf('\n');
    
    if abs(x1 - old_x1) < tol && abs(x2 - old_x2) < tol && abs(x3 - old_x3) < tol
        break;
    end
end

et = toc;
fprintf('Final Solution:\n');
fprintf('x1 = %.4f\n',x1);
fprintf('x2 = %.4f\n',x2);
fprintf('x3 = %.4f\n',x3);
fprintf('Execution Time: %.6f seconds\n', et);