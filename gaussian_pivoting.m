clc; 
clear;
A = [2 2 1; 4 2 3; 1 -1 1];
b = [6; 4; 0];

tic;
n = length(b);
aug = [A b];

for i = 1:n-1
    max_val = abs(aug(i,i));
    idx = i;
    for j = i+1:n
        if abs(aug(j,i)) > max_val
            max_val = abs(aug(j,i));
            idx = j;
        end
    end
    
    if idx ~= i
        temp = aug(i,:);
        aug(i,:) = aug(idx,:);
        aug(idx,:) = temp;
    end

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
disp('Solution by Gauss Elimination with Pivoting:');
disp(x);
fprintf('Execution Time: %.6f seconds\n',et);

