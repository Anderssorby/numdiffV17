function [r] = mnrom(a,b)
[ha, wa] = size(a);
[hb, wb] = size(b);
dh = floor(hb/ha);
dw = floor(wb/wa);
r = 0;
for i=1:ha
    for j=1:wa
        r = r + (a(i,j)-b(i*dh, j*dw))^2;
    end
end
r = sqrt(r);
end
