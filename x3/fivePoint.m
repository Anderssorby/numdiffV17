function U = fivePoint(n,m)

g = @(x) sin(pi*x);
ga = @(x) 0;

h = 1/(1+m);
k = 1/(1+n);

%e=ones(m,1);
%T = spdiags([1*e, -4*e, 1*e], -1:1,m,m);
%id = spdiags(1*e,0,m,m);
%A=blktridiag(T,id,id,n);

B=zeros(n*m,5);
B(:,1)=1/k^2; B(:,5)=1/k^2;
B(:,2)=1/h^2; B(:,4)=1/h^2;
B(:,3)=-2*(1/h^2+1/k^2);

A = spdiags(B,[-m,-1,0,1,m],n*m,n*m);

for i = m:m:(n-1)*m
    A(i,i+1)=0;
    A(i+1,i)=0;
end

x = transpose(h:h:1-h);
G = [-g(x)/k^2;zeros((n-1)*m,1)];

Ull=A\G;

for i = 1:n
    U(i,:) = Ull((i-1)*m+1:i*m);
end

nunu = zeros(n,1);numu=zeros(1,m+2);
U = [nunu, U,nunu];
U = [0,transpose(g(x)),0;U;numu];
end
 
% % % %Dont need this
% % % B=zeros(n*m,5);
% % % B(:,1)=1/k^2; B(:,5)=1/k^2;
% % % B(:,2)=1/h^2; B(:,4)=1/h^2;
% % % B(:,3)=-2*(1/h^2+1/k^2);
% % % 
% % % A = spdiags(B,[-m,-1,0,1,m],n*m,n*m);
% % % 
% % % for i = m:m:(n-1)*m
% % %     A(i,i+1)=0;
% % %     A(i+1,i)=0;
% % % end
