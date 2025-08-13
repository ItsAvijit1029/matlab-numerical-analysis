clc;
clear;
x1 = 0; 
x2 = 0; 
x3 = 0;

tol = 1e-8;       
maxIter = 500;    

fprintf('Assuming initial value: x1 = %.1f, x2 = %.1f, x3 = %.1f\n\n',x1,x2,x3);
tic;
for k = 1:maxIter
    old_x1 = x1;
    old_x2 = x2;
    old_x3 = x3;
    
    fprintf('Iteration %d:\n',k);
    
    x1_new = (5 - old_x2 - old_x3)/2;
    fprintf('x1 = (5 - %.4f - %.4f)/2 = %.4f\n',old_x2,old_x3,x1_new);
    
    x2_new = (15 - 3*old_x1 - 2*old_x3)/5;
    fprintf('x2 = (15 - 3*%.4f - 2*%.4f)/5 = %.4f\n',old_x1,old_x3,x2_new);
    
    x3_new = (8 - 2*old_x1 - old_x2)/4;
    fprintf('x3 = (8 - 2*%.4f - %.4f)/4 = %.4f\n',old_x1,old_x2,x3_new);
    
    x1 = x1_new;
    x2 = x2_new;
    x3 = x3_new;
    
    fprintf('\n');
    
    if abs(x1 - old_x1) < tol && abs(x2 - old_x2) < tol && abs(x3 - old_x3) < tol
        break;
    end
end

et = toc;
fprintf('Final Solution:\n');
fprintf('x1 = %.8f\n',x1);
fprintf('x2 = %.8f\n',x2);
fprintf('x3 = %.8f\n',x3);
fprintf('Execution Time: %.6f seconds\n', et);
