clc; 
clear;
A = [2 2 1; 4 2 3; 1 -1 1];
b = [6; 4; 0];
tic;
n = length(b);
aug = [A b];

for i = 1:n
    aug(i,:) = aug(i,:) / aug(i,i);
    
    for j = 1:n
        if j ~= i
            factor = aug(j,i);
            aug(j,:) = aug(j,:) - factor*aug(i,:);
        end
    end
end

x = aug(:,end);
et = toc;
disp('Solution by Gauss-Jordan Method:');
disp(x);
fprintf('Execution Time: %.6f seconds\n', et);