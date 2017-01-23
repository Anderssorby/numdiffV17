
f = @(x) sin(pi*x);
% Boundary values
g = @(tn) [0; 0];


N = 8;
tmax = 10;

t0 = 0;
k = 0.5;

errFE = zeros(N,1);
errBE = zeros(N,1);
errCN = zeros(N,1);
hs = zeros(N,1);

% methods

[reference, rxs, rts] = fe(f, g, 0, 1, 1/(N+1), N, tmax);
figure
plot3(meshgrid(rxs), meshgrid(rts), reference)

for k=1:N
    M = 2^(k+1);
    h = 1/(M+1);

    [Ufe, xs, ts] = fe(f, g, t0, k, h, M, tmax);


    %Ube = be(f, g, t0, k, h, M);
    %Ucn = cn(f, g, t0, k, h, M);
    hs(k) = h;

    %errFE(k) = sqrt(h)*norm(Ufe(:,1)-reference(:,1));
    %errBE(k) = sqrt(h)*norm(Ube-reference);
end

figure
loglog(hs, errFE)
hold on
grid on
loglog(hs, errBE)
loglog(hs, errCN)
loglog(hs, hs.^2)
legend('FE', 'BE', 'CN', 'h^2')

