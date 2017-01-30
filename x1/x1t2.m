
f = @(x) sin(pi*x);
alpha = 0;
beta = 0;
tests = 8;
twonorm = zeros(tests, 1);
onenorm = zeros(tests, 1);
maxnorm = zeros(tests, 1);
hs = zeros(tests, 1);

for k=1:tests
    M = 2^k;

    [U, h] = cendiff(f, alpha, beta, M);
    hs(k) = h;
    uf = @(x) -1/(pi^2)*sin(pi*x) + (beta - alpha)*x + alpha;
    
    x = linspace(0,1,M+2);
    u = uf(x');
    onenorm(k) = h*norm(U-u,1);
    twonorm(k) = sqrt(h)*norm(U-u,2);
    maxnorm(k) = max(abs(U-u));
end
line1 = 2*hs;
line = hs.^2;

onenorm
twonorm
maxnorm

figure
loglog(hs, twonorm);
hold on
grid on
loglog(hs, onenorm);
loglog(hs, maxnorm);
loglog(hs, line, '--');
loglog(hs, line1, '--');
title('Task 2');
legend('2-norm', '1-norm', 'maxnorm', 'h^2', '2h')
xlabel('stepsize log(h)')
ylabel('log norm size')

