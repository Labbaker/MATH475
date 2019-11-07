k = 0;

while(single(k+1) - single(k) == 1)
    k=k+1;
end
disp("k")
k = k-1 % this is the lowest integer represented in single
        %precision
disp("k+1")
j = k+1 %k+1
disp("single(k)")
single(k)
disp("single(k+1)")
single(j)

%though both integers appear the same when printed, we know that k+1 is not
%actually represented in single precision. 16777216 is equivalent to 2^24,
%so we can assume here that single types are stored with 24 bits. 
