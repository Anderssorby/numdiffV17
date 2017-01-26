function [exact] = exact_heq(x,t)
u = @(x, t) exp(-pi^2*t)*sin(pi*x);
nx = length(x);
nt = length(t);
exact = zeros(nx, nt);
for j=1:nt
    for i=1:nx
        exact(i,j) = u(x(i), t(j));
    end
end

end
