figure
x2_problem

tmax = 0.2;
it = 100;
k = tmax/(it+1);


% Exact solution
resol = 100;
x = linspace(0, 1, resol)';
t = linspace(0, tmax, it);
exact = exact_heq(x,t);
subplot(221)
surf(t, x, exact)
title('Exact')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('u(x,t)')

M = 98;
h = 1/(M+1);

% this is unstable!
[Ufe, xs, ts] = fe(f, g, M, it, 0.001);
subplot(222)
surf(ts, xs, Ufe)
title('FE')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('U')

% Backward euler
[Ube, xs, ts] = be(f, g, M, it, tmax);
subplot(223)
surf(ts, xs, Ube)
title('BE')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('U')

% Cranck-Nicholson
[Ucn, xs, ts] = cn(f, g, M, it, tmax);
subplot(224)
surf(ts, xs, Ucn)
title('CN')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('U')
