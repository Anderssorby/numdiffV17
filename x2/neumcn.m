function [U, x, t] = neumcn(f, g, sigma, M, it, tmax)

k = tmax/(it+1);
h = 1/(M+1);
r = k/(h^2);
t = linspace(0, tmax, it+1);
x = linspace(0, 1, M+2)';

U = zeros(M+2, it);
U(:, 1) = f(x); % shifted index

%T = -r*diag(ones(M-1), -1) + (1+2*r)*eye(M) -r*diag(ones(M-1), 1);
e = ones(M, 1);
a = [-1/h, 1/h, 0; -r/2*e, (1+r)*e, -r/2*e];
A = spdiags(a, -1:1, M+1, M+1);

for n=1:it
    gt = g(t(n+1));
    d = zeros(M+1, 1);
    
    d(1) = r/2*(U(2, n) - sigma*h) + (1-r)*U(2, n) + r/2*U(3,n);
    

    for i=2:M
        m = i+1;
        d(i) = r/2*U(m-1, n) + (1-r)*U(m, n) + r/2*U(m+1,n);
    end
    d(1) = d(1) + r/2*gt(1);
    d(M) = d(M) + r/2*gt(2);
    U(1:M+1, n+1) = A\d;
end



end
