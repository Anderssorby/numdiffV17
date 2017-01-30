
f = @(x) sin(pi*x);
alpha = 0;
beta = 0;
M = 100;



U=cendiff(f, alpha, beta, M);
uf = @(x) -1/(pi^2)*sin(pi*x) + (beta - alpha)*x + alpha;

x = linspace(0,1,M);
u = uf(x');
eh = U-u;
ex = linspace(0,1);
ux = uf(ex);

figure();
x = linspace(0,1,M);
plot(x, U, 'b*');
hold on
plot(ex, ux, 'r-');
hold off
grid on
title('f(x) = sin(\pi x)');
legend('Nummerical', 'Exact');




U=cendiff(@(x) cos(pi*x), alpha, beta, M);
uf = @(x) -1/(pi^2)*cos(pi*x) + (beta - alpha - 2/(pi^2))*x + (alpha+1/pi^2);
x = linspace(0,1,M);
u = uf(x');
eh = U-u;
ex = linspace(0,1);
ux = uf(ex);

figure();
plot(x, U, 'b*');
hold on
plot(ex, ux, 'r-');
hold off
grid on
title('f(x) = cos(\pi x)');
legend('Nummerical', 'Exact');


