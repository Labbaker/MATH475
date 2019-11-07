array = randn(1,10000);
singleArray = arrayfun(@(x) single(x),array); %this applies the single() operation to each element of array

errors = singleArray - array; %compute error, you can add/subtract arrays "directly"
absErrors = arrayfun(@(x) abs(x), errors); %this put the absolute value of each element in errors into absErrors
relErrors = absErrors./abs(array); %./ allows each element of absErrors to be divided by the corresponding element of array
disp("max relative error")
maxRel = max(relErrors) %max relative error
disp("machine epsilon for single precision")
e=eps("single")
disp("half machine epsilon")
e/2
%half machine epsilon seems to be a much more accurate measure for the
%upper bound on relative error. This makes sense because the largest
%distance from a number to the closest number represented in single
%precision would be halfway between 2 numbers that can be represented in
%single precision. (i.e., if 1.5 cannot be represented, but both 1 and 2
%can be, .5 is the farthest a number could be from the closest single point
%represented number)