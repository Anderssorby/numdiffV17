function [U, x, t] = be(f, g, M, it, tmax)

k = tmax/(it+1);
h = 1/(M+1);
r = k/(h^2);
t = linspace(0, tmax, it+1);
x = linspace(0, 1, M+2)';

U = zeros(M+2, it);
U(:, 1) = f(x); % shifted index

%T = -r*diag(ones(M-1), -1) + (1+2*r)*eye(M) -r*diag(ones(M-1), 1);
e = ones(M, 1);
A = spdiags([-r*e, (1+2*r)*e, -r*e], -1:1, M, M);

for n=1:it
    gt = g(t(n+1));
    B = U(2:M+1, n);
    B(1) = U(2, n) + r*gt(1);
    B(M) = U(M, n) + r*gt(2);
    U(2:M+1, n+1) = A\B;
end



end
