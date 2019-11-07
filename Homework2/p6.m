format long
syms g(x)
  g(x) = x - (3^x - 27 + cos(x))
 
 figure(1)
 fplot(g,[2 4])
 
 x_k = 2
 x_l = 4
 i = 0
 while abs(x_k-g(x_k))>= 10^-6 && abs(x_l-g(x_l))>= 10^-6
     if abs(x_k-g(x_k)) < abs(x_l-g(x_l))
         x_l = x_k + (x_l - x_k)*.9
     else
         x_k = x_l + (x_k - x_l)*.9
     end
     if abs(x_k - x_l) < 10^-7
         quit cancel
     end
 end
 
x_k
x_l