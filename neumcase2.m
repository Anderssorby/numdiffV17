
function [U,h] = neumcase2(f, sigma, beta, M)
Ah = zeros(M+1, M+1);
h = 1/(M+1);

Ah(1,1) = -h;
Ah(1,2) = h;

for i=1:M
     Ah(i+1,i+1) = -2;
     Ah(i+1,i) = 1;
     if i~=M
        Ah(i+1,i+2) = 1;
     end
end

Ah = 1/(h^2)*Ah;

F = zeros(M+1, 1);

for i=1:M
    F(i+1) = f(i*h);
end

F(1) = (f(0)*h)/2 + sigma;
F(M+1) = F(M+1) - beta/(h^2);

U = Ah\F;
U = [U; beta];
end
