
x2_problem

N = 8;
tmax = 0.001;

t0 = 0;
k = 0.5;


errFE = zeros(N,1);
errBE = zeros(N,1);
errCN = zeros(N,1);
hs    = zeros(N,1);
ks    = zeros(N,1);

% methods
M = 2^(N+1);
[ref, rxs, rts] = cn(f, g, M, 100*N, tmax);
%figure
%surface(meshgrid(rts), meshgrid(rxs), reference)
%hold on
%title('Solution of u_t=u_{xx}')
%
%
%u = @(t, x) exp(-pi^2*t).*sin(pi*x);

for n=1:N
    it = 100*n;
    M = 2^(n+1);
    hs(n) = 1/(M+1);
    ks(n) = tmax/(it+1);

    [Ufe, xs, ts] = fe(f, g, M, it, tmax); % O(k^2+k*h^2)

    %FEref = exact_heq(xs, ts);

    [Ube, xs, ts] = be(f, g, M, it, tmax);
    [Ucn, xs, ts] = cn(f, g, M, it, tmax);
    %reference = exact_heq(xs, ts);

    errFE(n) = sqrt(h)*mnorm(Ufe, ref);
    errBE(n) = sqrt(h)*spnorm(Ube(:, end), ref(:, end));
    errCN(n) = sqrt(h)*spnorm(Ucn(:, end), ref(:, end));
end
k.^2+ k.*hs.^2
figure
title('Convergence plot')
loglog(hs, errFE)
hold on
grid on
loglog(hs, errBE)
loglog(hs, errCN)
loglog(hs, k.^2+ k.*hs.^2)
loglog(hs, k.^3+ k.*hs.^2)
legend('FE', 'BE', 'CN', 'k^2 + k*h^2', 'k^3 + k*h^2')

