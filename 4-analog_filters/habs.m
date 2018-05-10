function H = habs(w, wc, n, epsilon, k),
    % k = 1 Chebyshev
    % k = 2 Butterworth
    H = [];
    if (k == 1),
        T = calcula_coeficientes(w, wc, n);
        for l=1:size(w)(2),
            H = [H 1/sqrt(1+epsilon^2*T(l)^2)];
        end;
    else if (k == 2),
        for l=w,
            H = [H 1/sqrt(1+(l/wc)^(2*n))];
        end;
    end;
end;

