%Problem 2
format long
p0 = 3.7;
tol = 10^(-13);
i = 0;
f = @(x) 3^x - 27 + cos(x);
fd = @(x) log(3) * 3^x - sin(x)

while i < 1000
    p = p0 - f(p0)/fd(p0);
    if abs(p - p0) < tol 
        break
    end
    p0 = p;
    i = i + 1;
end

%p = 3.032911435921573
%i = 5

%It took 5 iterations to converse using Newton's method, but 23 iterations
%to converge using bisection. Newton's method is much faster.