
format long
% Neumann boundary conditions
f = @(x) sin(pi*x); 
g = @(tn) [0; 0];
sigma = 0; % = du/dt(0,t)

N = 5;

errCN = zeros(N,1);
hs    = zeros(N,1);


% methods
M = 100*2^N;
[ref, rxs, rts] = neumcn(f, g, sigma, M, 100*N, tmax);

figure
surf(rts, rxs, ref)
title('Neuman BC')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('U')


it = 100;
k = tmax/(it+1);
for n=1:N
    M = 10*2^n;
    hs(n) = 1/(M+1);

    [Ucn, xs, ts] = neumcn(f, g, sigma, M, it, tmax);

    errCN(n) = sqrt(h)*spnorm(Ucn(:, end), ref(:, end));
end

%k.^2+ k.*hs.^2

figure
loglog(hs, errCN)
hold on
grid on
title('Convergence plot for Neumann BC')
loglog(hs, k.^3+ k.*hs.^2)
xlabel('h + k')
legend('CN', 'k^3 + k*h^2')


