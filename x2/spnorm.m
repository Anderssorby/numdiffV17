function [r] = spnrom(a,b)
la = length(a);
lb = length(b);
d = floor(lb/la);
r = 0;
for i=1:la
    r = r + (a(i)-b(i*d))^2;
end
r = sqrt(r);
end
