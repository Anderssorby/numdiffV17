
x2_problem

N = 8;
tmax = 0.001;



errFE = zeros(N,1);
errBE = zeros(N,1);
errCN = zeros(N,1);

errFEtime = zeros(N,1);
errBEtime = zeros(N,1);
errCNtime = zeros(N,1);

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



% Space
for n=1:N
    it = 2^(N+1);
    M = 2^(n+1);
    hs(n) = 1/(M+1);
    k = tmax/(it+1);

    [Ufe, xs, ts] = fe(f, g, M, it, tmax); % O(k^2+k*h^2)

    %FEref = exact_heq(xs, ts);

    [Ube, xs, ts] = be(f, g, M, it, tmax);
    [Ucn, xs, ts] = cn(f, g, M, it, tmax);
    %reference = exact_heq(xs, ts);

    errFE(n) = sqrt(h)*mnorm(Ufe, ref);
    errBE(n) = sqrt(h)*mnorm(Ube, ref);
    errCN(n) = sqrt(h)*mnorm(Ucn, ref);
end



%time
for n=1:N
    it = 2^(n+1);
    M = 2^(N+1);
    h = 1/(M+1);
    ks(n) = tmax/(it+1);

    [Ufe, xs, ts] = fe(f, g, M, it, tmax); % O(k^2+k*h^2)

    %FEref = exact_heq(xs, ts);

    [Ube, xs, ts] = be(f, g, M, it, tmax);
    [Ucn, xs, ts] = cn(f, g, M, it, tmax);
    %reference = exact_heq(xs, ts);

    errFEtime(n) = sqrt(h)*mnorm(Ufe, ref);
    errBEtime(n) = sqrt(h)*mnorm(Ube, ref);
    errCNtime(n) = sqrt(h)*mnorm(Ucn, ref);
end


figure
subplot(211)
loglog(hs, errFE)
hold on
grid on
title('Convergence plot for space')
loglog(hs, errBE)
loglog(hs, errCN)
loglog(hs, k.^2 + k.*hs.^2)
loglog(hs, k.^3 + k.*hs.^2)
legend('FE', 'BE', 'CN', 'k^2 + k*h^2', 'k^3 + k*h^2')



subplot(212)
loglog(ks, errFEtime)
hold on
grid on
title('Convergence plot for time')
loglog(ks, errBEtime)
loglog(ks, errCNtime)
loglog(ks, ks.^2+ ks.*h.^2)
loglog(ks, ks.^3+ ks.*h.^2)
legend('FE', 'BE', 'CN', 'k^2 + k*h^2', 'k^3 + k*h^2')

