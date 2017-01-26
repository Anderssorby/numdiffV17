function [U, xs, ts] = fe(f, g, M, it, tmax)

k = tmax/(it+1);
h = 1/(M+1);
U  = zeros(M+2, it+1); % shifted index
xs = linspace(0, 1, M+2)';
ts = linspace(0, tmax, it+1)';
U(:,1) = f(xs);

r = k/(h^2);
for n=1:it
    gt = g(ts(n+1)); % g(t+k);
    U(1, n+1) = gt(1);
    U(M+2, n+1) = gt(2);

    for m=2:M+1
        U(m, n+1) = U(m, n) + r*(U(m+1, n) - 2*U(m, n) + U(m-1, n)); % Central differences
    end
end

end
