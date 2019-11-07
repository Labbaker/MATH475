format long
syms g(x)
  g(x) = 4 + 0.5*cos(x) + 1/log(x)
 
 figure(1)
 fplot(g,[4 5])
 
 gd = diff(g)
 
 figure(2)
 fplot(gd,[4 5])
 
 
 x_k = 4
 x_l = 5
 while abs(x_k-g(x_k))>= 10^-5 && abs(x_l-g(x_l))>= 10^-5
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