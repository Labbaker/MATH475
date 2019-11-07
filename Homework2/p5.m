format long
syms f(x)
f(x) = 3.^x - 27 + cos(x)
fplot(f, [2 4])

x_m = 2
x_n = 4
x_p = (x_m + x_n)/2
i = 0
 while abs(0-f(x_p))>= 10^-6
     if f(x_m)*f(x_p) >= 0
         x_m = x_p
     else
         x_n = x_p
     end
     if abs(x_m - x_n) < 10^-7
         quit cancel
     end
     x_p = (x_m + x_n)/2
     i = i + 1
 end
 
 x_p
