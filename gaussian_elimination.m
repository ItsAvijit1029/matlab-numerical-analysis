clc;
clear;
A = [2 2 1; 4 2 3; 1 -1 1];
b = [6; 4; 0];
tic;
n = length(b);
aug = [A b];  
for i = 1:n-1
    for j = i+1:n
        factor = aug(j,i)/aug(i,i);
        aug(j,:) = aug(j,:) - factor*aug(i,:);
    end
end
x = zeros(n,1);
x(n) = aug(n,end)/aug(n,n);
for i = n-1:-1:1
    sum = 0;
    for k = i+1:n
        sum = sum + aug(i,k)*x(k);
    end
    x(i) = (aug(i,end) - sum)/aug(i,i);
end
et = toc;
disp('Solution by Gauss Elimination:');
disp(x);
fprintf('Execution Time: %.6f seconds\n', et);
