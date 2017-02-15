close all

k = 0.02;
h = 0.02;
[U, X, Y] = solve(k,h);


figure
surf(X, Y, U');
hold on
title('Solution');
xlabel('x')
ylabel('y')
zlabel('U')


exact_plot


