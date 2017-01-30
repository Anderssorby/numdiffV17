figure
x2_problem

tmax = 2;
it = 10;
k = tmax/(it+1);
M = 100;

% Cranck-Nicholson
[Ucn, xs, ts] = cn(f, g, M, it, tmax);

figure
surf(ts, xs, Ucn)
title('CN')
ylabel('0 \leq x \leq 1')
xlabel('0 \leq t \leq tmax')
zlabel('U')

