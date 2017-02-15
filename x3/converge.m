
ue = @(x, y) 1/sinh(pi) * sin(pi*x) * sinh(pi*y);

N=100; 

k = 1/(N-1);
h = 1/(N-1);

[X, Y] = meshgrid(linspace(0, 1, N), linspace(0, 1, N));

exact = zeros(N,N);
for i=1:N
   for j=1:N
       exact(i,j) = ue(X(i,j), Y(i,j));
   end
end


g4 = @(x) sin(pi*x);

tests = 8;
hs = zeros(tests, 1);
errX = zeros(tests, 1);
% for x
for t=1:tests
    h = 0.1-0.01*t;
    k = 0.05;
    hs(t) = h;

    %U = solve(k,h);
    n = ceil(1/h);
    m = ceil(1/k);
    U = fivePoint(n, m);

    errX(t) = sqrt(h)*spnorm(U(:, end), exact(:, end));
end

ks = zeros(tests, 1);
errY = zeros(tests, 1);
% for y
for t=1:tests
    k = 0.1-0.01*t;
    h = 0.05;
    ks(t) = k;

    %U = solve(k,h);
    n = ceil(1/h);
    m = ceil(1/k);
    U = fivePoint(n, m);

    errY(t) = sqrt(h)*spnorm(U(:, end), exact(:, end));
end

figure
subplot(121)
loglog(hs, errX)
hold on
loglog(hs, hs.^2)
title('Convergence in x')
hold off

subplot(122)
loglog(ks, errY)
hold on
loglog(ks, ks.^2)
title('Convergence in y')
