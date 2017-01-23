
%f = @(x) cos(pi*x);
f = @(x) sin(pi*x);
sigma = -1/pi;
beta = 0;
tests = 8;
case1 = zeros(tests, 1);
case2 = zeros(tests, 1);
case3 = zeros(tests, 1);
hs = zeros(tests, 1);

for k=1:tests
    M = 2^k;

    U1 = neumcase1(f, sigma, beta, M);
    U2 = neumcase2(f, sigma, beta, M);
    [U3, h] = neumcase3(f, sigma, beta, M);
    hs(k) = h;
    %uf = @(x) -1/(pi^2)*cos(pi*x) + sigma*x + (sigma-1/pi^2);
    uf = @(x) -1/(pi^2)*sin(pi*x) + (sigma+1/pi)*x + beta-sigma-1/pi;
    x = linspace(0,1,M+2);
    u = uf(x');
    case1(k) = sqrt(h)*norm(U1-u);
    case2(k) = sqrt(h)*norm(U2-u);
    case3(k) = sqrt(h)*norm(U3-u);
end
line = hs.^2;

figure
loglog(hs, case1);
hold on
grid on
loglog(hs, case2);
loglog(hs, case3);
loglog(hs, line);
loglog(hs, hs);
title('Task 3');
legend('Case 1', 'Case 2', 'Case 3', 'h^2', 'h')
xlabel('stepsize log(h)')
ylabel('log 2-norm')

