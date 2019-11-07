%Problem 4
%perform LU fac w/out pivoting

function [L, U] = LUwithout(A, n)

    L = eye(n); %create L as I and populate through for loop
    for k = 1 : n

        L(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
        
        %transform A into U through Guassian Elimination
        for l = k + 1 : n
            A(l, :) = A(l, :) - L(l, k) * A(k, :);
        end
    end
    L
    U = A
    L*U 
end
%Output for Problem 4 part a
>> LUwithout

A =

     1     1     0     3
     2     1    -1     1
     3    -1    -1     2
    -1     2     6    -1


n =

     4


L =

     1     0     0     0
     2     1     0     0
     3     4     1     0
    -1    -3     1     1


U =

     1     1     0     3
     0    -1    -1    -5
     0     0     3    13
     0     0     0   -26


L*U =

     1     1     0     3
     2     1    -1     1
     3    -1    -1     2
    -1     2     6    -1

>> 

%Output for Problem 4 part b

>> LUwithout

A =

           1           1           1           1           1           1
           1           2           3           4           5           6
           1           4           9          16          25          36
           1           8          27          64         125         216
           1          16          81         256         625        1296
           1          32         243        1024        3125        7776


n =

     6


L =

     1     0     0     0     0     0
     1     1     0     0     0     0
     1     3     1     0     0     0
     1     7     6     1     0     0
     1    15    25    10     1     0
     1    31    90    65    15     1


U =

     1     1     1     1     1     1
     0     1     2     3     4     5
     0     0     2     6    12    20
     0     0     0     6    24    60
     0     0     0     0    24   120
     0     0     0     0     0   120


L*U =

           1           1           1           1           1           1
           1           2           3           4           5           6
           1           4           9          16          25          36
           1           8          27          64         125         216
           1          16          81         256         625        1296
           1          32         243        1024        3125        7776

>> 
%Problem 5
%perform LU fac with pivoting

function [P, L, U] = LUwith(A, n)
    %start L and P as I matrices, U as A
    format shortG
    L = eye(n); 
    P = eye(n); 
    U = A; 
    for k = 1:n - 1
        pivot = max(abs(U(k:n, k))); %pivot based on largest value
        for j = k:n
            if(abs(U(j, k)) == pivot)
                ind = j;
                break;
            end
        end
        U([k, ind], k:n) = U([ind,k], k:n); %U is now ordered from largest to smalled row by 1st value
        L([k, ind], 1:k - 1) = L([ind,k], 1:k - 1); %L stays identity
        P([k, ind], :) = P([ind, k],:); %P has swapped to match
        for j = k + 1:n %transform U to lower triangular and perform the same operations on L
            L(j, k) = U(j, k) / U(k, k);
            U(j, k:n) = U(j, k:n) - L(j, k) * U(k, k:n);
        end
    end
    P
    L
    U
    transpose(P) * L * U
end
%Output for Problem 5 part a
>> LUwith

A =

     1     1     0     3
     2     1    -1     1
     3    -1    -1     2
    -1     2     6    -1


n =

     4


P =

     0     0     1     0
     0     0     0     1
     0     1     0     0
     1     0     0     0


L =

    1.0000         0         0         0
   -0.3333    1.0000         0         0
    0.6667    1.0000    1.0000         0
    0.3333    0.8000    0.7000    1.0000


U =

    3.0000   -1.0000   -1.0000    2.0000
         0    1.6667    5.6667   -0.3333
         0         0   -6.0000    0.0000
         0         0         0    2.6000


transpose(P) * L * U =

    1.0000    1.0000   -0.0000    3.0000
    2.0000    1.0000   -1.0000    1.0000
    3.0000   -1.0000   -1.0000    2.0000
   -1.0000    2.0000    6.0000   -1.0000

>> 

%Output for Problem 5 part b
>> LUwith

A =

           1           1           1           1           1           1
           1           2           3           4           5           6
           1           4           9          16          25          36
           1           8          27          64         125         216
           1          16          81         256         625        1296
           1          32         243        1024        3125        7776


n =

     6


P =

     1     0     0     0     0     0
     0     0     0     0     0     1
     0     0     0     0     1     0
     0     0     0     1     0     0
     0     0     1     0     0     0
     0     1     0     0     0     0


L =

            1            0            0            0            0            0
            1            1            0            0            0            0
            1      0.48387            1            0            0            0
            1      0.22581      0.77217            1            0            0
            1     0.096774      0.41565      0.90964            1            0
            1     0.032258      0.15652      0.43675      0.82117            1


U =

            1            1            1            1            1            1
            0           31          242         1023         3124         7775
            0            0      -37.097         -240      -887.61      -2467.1
            0            0            0       17.322       103.97       364.38
            0            0            0            0      -3.9614      -23.422
            0            0            0            0            0      0.43796


ans =

            1            1            1            1            1            1
            1            2            3            4            5            6
            1            4            9           16           25           36
            1            8           27           64          125          216
            1           16           81          256          625         1296
            1           32          243         1024         3125         7776

>> 
    A =[  1      1      1      1      1      1;
      1      2      3      4      5      6;
      1      4      9     16     25     36;
      1      8     27     64    125    216;
      1     16     81    256    625   1296;
      1     32    243   1024   3125   7776]
% A = [1 2;
%     3 4]
    b = transpose([ -9, -14, -14, 70, 826, 6166])
    %b = transpose([5, 6])
    s = size(A)
    [P, L, U] = LUwith(A, s(1));

    b1 = P*b
    %forwards substitution
    y = zeros(s(1), 1);
    for k = 1:s
        sum = 0;
        k;
        for i = 1:k - 1
            i;
            L(i, k);
            sum = sum + L(k, i) * y(i);
        end
        L(k, k);
        y(k) = (b1(k, 1));
        y(k) = y(k) - sum;
        y(k) = y(k) / L(k, k);
    end
    y
    L*y
    
    x = zeros(s(1), 1);
    %backwards substitution
    for k = s:-1:1
        sum = 0;
        k;
        for i = k:s
            i;
            U(i, k);
            sum = sum + U(k, i) * x(i);
        end
        U(k, k);
        x(k) = (y(k, 1));
        x(k) = x(k) - sum;
        x(k) = x(k) / U(k, k);
    end
    x
    U*x
    
    A*x
%Output for Problem 6
>> p6

A =

           1           1           1           1           1           1
           1           2           3           4           5           6
           1           4           9          16          25          36
           1           8          27          64         125         216
           1          16          81         256         625        1296
           1          32         243        1024        3125        7776


b =

          -9
         -14
         -14
          70
         826
        6166


P =

     1     0     0     0     0     0
     0     0     0     0     0     1
     0     0     0     0     1     0
     0     0     0     1     0     0
     0     0     1     0     0     0
     0     1     0     0     0     0


L =

            1            0            0            0            0            0
            1            1            0            0            0            0
            1      0.48387            1            0            0            0
            1      0.22581      0.77217            1            0            0
            1     0.096774      0.41565      0.90964            1            0
            1     0.032258      0.15652      0.43675      0.82117            1


U =

            1            1            1            1            1            1
            0           31          242         1023         3124         7775
            0            0      -37.097         -240      -887.61      -2467.1
            0            0  -3.5527e-15       17.322       103.97       364.38
            0            0            0            0      -3.9614      -23.422
            0            0            0            0            0      0.43796


b1 =

          -9
        6166
         826
          70
         -14
         -14


y =

           -9
         6175
      -2152.9
       347.06
      -23.422
      0.43796


L*y =

           -9
         6166
          826
           70
          -14
          -14


x =

           -4
           -3
           -2
           -1
  -9.9278e-13
            1


U*x =

           -9
         6175
      -2152.9
       347.06
      -23.422
      0.43796


A*x =

           -9
          -14
          -14
           70
          826
         6166

>> 