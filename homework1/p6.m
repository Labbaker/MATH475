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