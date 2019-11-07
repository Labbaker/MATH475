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


