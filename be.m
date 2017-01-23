function [U] = be(f, g, t0, k, h, M)

U = f(zeros(M,1)); % shifted index

r = k/(h^2);
it = 100;
t=t0;
e = ones(M-1);
%T = -r*diag(ones(M-1), -1) + (1+2*r)*eye(M) -r*diag(ones(M-1), 1);
e = ones(M, 1);
d = spdiags([-r*e, (1+2*r)*e, -r*e], -1:1, M, M);

for n=0:it
    gt = g(t+k); % g(t+k);
    U(1) = (1+r)*gt(1);
    U(M+2) = (1+r)*gt(2);
    U = A\d;
    t = t+k;
end

U = [0; U; 0];

end
