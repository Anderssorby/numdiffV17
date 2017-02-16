% Solve Hyperbolic equation

format long
h = 0.01;
k = 0.001;
%p = h/k;


% Forward difference in time
tmax = 1;
nu = 0.1;
[U, X, T] = for_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Forward \nu = 0.1')


nu = 0.01;
[U, X, T] = for_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Forward \nu = 0.01')

nu = 0.001;
[U, X, T] = for_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Forward \nu = 0.001')

% Backward difference in time
tmax = 0.3;
nu = 0.1;
[U, X, T] = back_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Backward \nu = 0.1')


nu = 0.01;
[U, X, T] = back_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Backward \nu = 0.01')

nu = 0.001;
[U, X, T] = back_for_2cen(k, h, nu, tmax);

figure
%plot(X, U(:, 1))
surf(T, X, U);
hold on
grid on
title('Backward \nu = 0.001')
