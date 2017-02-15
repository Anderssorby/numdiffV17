% The laplace equation

% 5-point N W E S


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
%exact

figure
surf(X, Y, exact);
hold on
title('Exact solution');
xlabel('x')
ylabel('y')
zlabel('U_e')


