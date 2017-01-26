
% Neumann boundary conditions
f = @(x) sin(pi*x); % = du/dx(x,0)
g = @(tn) [0; 0];


errCN = zeros(N,1);
hs    = zeros(N,1);

% methods
M = 2^(N+1);
[ref, rxs, rts] = cn(f, g, M, 100*N, tmax);

it = 100;
k = tmax/(it+1);
for n=1:N
    M = 2^(n+1);
    hs(n) = 1/(M+1);

    [Ucn, xs, ts] = cn(f, g, M, it, tmax);

    errCN(n) = sqrt(h)*mnorm(Ucn, ref);
end
k.^2+ k.*hs.^2
figure
title('Convergence plot for Neumann BC')
loglog(hs, errCN)
hold on
grid on
loglog(hs, k.^3+ k.*hs.^2)
xlabel('')
legend('CN', 'k^3 + k*h^2')


