clc;
clear;
f = @(x) x^2 + x - 2; 
a = input('Enter first guess a: ');
b = input('Enter second guess b: ');
while f(a)*f(b) > 0
    disp('Invalid guesses! Try again.');
    a = input('Enter first guess a: ');
    b = input('Enter second guess b: ');
end
E = 1e-6;
iter = 0;
c_old = a;  
error = abs(b - a); 
tic; 
while error > E
    iter = iter + 1;
    c = (a + b) / 2;
    disp(['Iter ' num2str(iter) ': c = ' num2str(c) ', f(c) = ' num2str(f(c))]);
    
   if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
     error = abs(c - c_old); 
    c_old = c;
    
    if abs(f(c)) < E
        break;
    end
end
time_taken = toc; 
disp(['Root found at x = ' num2str(c)]);
disp(['Iterations: ' num2str(iter)]);
disp(['Execution time: ' num2str(time_taken) ' seconds']); 
