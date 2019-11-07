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
