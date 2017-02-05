

% Wrap it around U_0 = U_M+1


format long
x2_problem

N = 5;
tmax = 0.2;



errFE = zeros(N,1);
errBE = zeros(N,1);
errCN = zeros(N,1);

errFEtime = zeros(N,1);
errBEtime = zeros(N,1);
errCNtime = zeros(N,1);

hs    = zeros(N,1);
ks    = zeros(N,1);

% methods
M = 2^(N+2);
it = 10*M;
[ref, rxs, rts] = cn_periodic(f, g, M, it, tmax);
figure
surf(rts, rxs, ref)
hold on
title('Periodic')
hold off
%
%
%u = @(t, x) exp(-pi^2*t).*sin(pi*x);



% Space
for n=1:N
    M = (n+1)^2;
    it = 10*M;
    hs(n) = 1/(M+1);
    ks(n) = tmax/(it+1);

    h = hs(n);
    k = ks(n);

    %[Ufe, xs, ts] = fe(f, g, M, it, tmax); % O(k^2+k*h^2)

    %FEref = exact_heq(xs, ts);

    %[Ube, xs, ts] = be(f, g, M, it, tmax);
    [Ucn, xs, ts] = cn_periodic(f, g, M, it, tmax);
    %ref = exact_heq(xs, ts);
    fprintf('solved for h=%f, k=%f\n\n', h, k)

    %errFE(n) = sqrt(h)*mnorm(Ufe, ref);
    %errBE(n) = sqrt(h)*mnorm(Ube, ref);
    %errCN(n) = sqrt(h)*mnorm(Ucn, ref);

    %errFE(n) = sqrt(h)*spnorm(Ufe(:, end), ref(:, end));
    %errBE(n) = sqrt(h)*spnorm(Ube(:, end), ref(:, end));
    errCN(n) = sqrt(h)*spnorm(Ucn(:, end), ref(:, end));
end



%time
%for n=1:N
%    it = 2^(n + 1);
%    M  = 2^(N + 1);
%    h  = 1/(M + 1);
%    ks(n) = tmax/(it+1);
%
%    [Ufe, xs, ts] = fe(f, g, M, it, tmax); % O(k^2+k*h^2)
%
%    %FEref = exact_heq(xs, ts);
%
%    [Ube, xs, ts] = be(f, g, M, it, tmax);
%    [Ucn, xs, ts] = cn(f, g, M, it, tmax);
%    %reference = exact_heq(xs, ts);
%
%    errFEtime(n) = sqrt(h)*mnorm(Ufe, ref);
%    errBEtime(n) = sqrt(h)*mnorm(Ube, ref);
%    errCNtime(n) = sqrt(h)*mnorm(Ucn, ref);
%end
%

%s1 = zeros(N, N);
%s2 = zeros(N, N);
%for i=1:N
%    for j=1:N
%        s1(i, j) = ks(j)^2 + ks(j)*hs(i)^2;
%        s2(i, j) = ks(j)^2 + ks(j)*hs(i)^2;
%    end
%end
%
%figure
%grid on
%hold on
%
%subplot(231)
%surf(hs, ks, s1)
%set(gca, 'ZScale', 'log')
%title('k^2+k*h^2')
%
%subplot(232)
%surf(hs, ks, s1)
%set(gca, 'ZScale', 'log')
%title('k^3+k*h^2')
%

figure
%subplot(211)
%loglog(hs, errFE)
%title('Convergence plot for space')
title('Convergence plot')
%loglog(hs, errBE)
loglog(hs, errCN)
hold on
grid on
loglog(hs, ks.^3 + ks.*hs.^2)
legend('CN', 'k^3 + kh^2')



%subplot(212)
%loglog(ks, errFEtime)
%hold on
%grid on
%title('Convergence plot for time')
%loglog(ks, errBEtime)
%loglog(ks, errCNtime)
%loglog(ks, ks.^2+ ks.*h.^2)
%loglog(ks, ks.^3+ ks.*h.^2)
%legend('FE', 'BE', 'CN', 'k^2 + k*h^2', 'k^3 + kh^2')


