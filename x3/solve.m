function [U, X, Y] = solve(k,h)

g4 = @(x) sin(pi*x);


%k = 0.1;
%h = 0.1;

% # unknowns
Ny = ceil(1/k);
Nx = ceil(1/h);


[X, Y] = meshgrid(linspace(0, 1, Nx + 2), linspace(0, 1, Ny + 2));
%size(X)
%size(Y)
% Boundary points 1, Ny+2 etc. known

% stack the solution columns above each other
% U = zeros(Nx + 2, Ny + 2);
% Nx*Ny equations
% Known
F = zeros(Nx*Ny, 1);

% Last row
F((Ny-1)*Nx+1:Ny*Nx) = -g4(X(Ny, 2:Nx+1)); % non-zero Boundary

%I = eye(Nx);

n = Nx;
I = speye(Nx,Nx);
E = sparse(2:Nx, 1:Nx-1, 1/h^2, Nx, Nx);
D = 1/h^2*E + 1/h^2*E' - (2/h^2+2/k^2)*I;
A = kron(D,I)+kron(I,D);
%full(A)
%1/k^2
%1/h^2
%B=zeros(n*m,5);
%B(:,1)=1/k^2; B(:,5)=1/k^2;
%B(:,2)=1/h^2; B(:,4)=1/h^2;
%B(:,3)=-2*(1/h^2+1/k^2);
%
%A = spdiags(B,[-m,-1,0,1,m],n*m,n*m);

size(A)
size(F)

Ustacked = A\F;

U = zeros(Nx+2, Ny+2);

% boundary y=1
U(:, Ny+2) = g4(X(Nx, :));


for i=2:Ny+1
    U(2:Nx+1, i) = Ustacked(((i-2)*Nx+1):((i-1)*Nx));
end

end
