function [U, xs, ts] = fe(f, g, t0, k, h, M, tmax)

it = (tmax-t0)/k;
U = zeros(M+2,it+1); % shifted index
xs = linspace(0,1,M+2)';
ts = linspace(t0, tmax, it+1)';
U(:,1) = f(xs);

r = k/(h^2);
t = t0;
for n=1:it
    gt = g(t+k); % g(t+k);
    U(1, n) = gt(1);
    U(M+2, n) = gt(2);

    for m=2:M+1
        U(m, n+1) = U(m, n) + r*(U(m+1, n)-2*U(m, n)+U(m-1, n)); % Central differences
    end
    t = t+k;
end

end
