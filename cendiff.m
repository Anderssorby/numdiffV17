
function [U,h] = cendiff(f, alpha, beta, M)
Ah = diag(ones(M-1,1), -1)-2*eye(M, M)+diag(ones(M-1,1), 1);
h = 1/(M+1);

Ah = 1/(h^2)*Ah;

F = zeros(M, 1);

for i=2:M-1
    F(i) = f(i*h);
end

F(1) = f(h) - alpha/(h^2);
F(M) = f(M*h) - beta/(h^2);
U = Ah\F;
U = [alpha; U; beta];
end
