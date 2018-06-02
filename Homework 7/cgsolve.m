function [x, iter, xx] = cgsolve(H, b, tol, maxiter)
k = 1;
ss = 1000; 
x(:,1) = zeros(1000,1);
% x(:,1) = zeros(2,1);
r(:,1) = b - H*x(:,1); 
d(:,1) = r(:,1);
while (((norm(r(:,k))/norm(b)) > tol) && (k <= maxiter) && (k ~= (ss+1)))
    q = H*r(:,k);
    a(:,k) = ((r(:,k)')*r(:,k))/((d(:,k)')*H*d(:,k)); 
    x(:,k+1) = x(:,k) + (a(:,k)*d(:,k));
    r(:,k+1) = r(:,k) - (a(:,k)*H*d(:,k));
    beta(:,k+1) = ((r(:,k+1)')*r(:,k+1))/((r(:,k)')*(r(:,k)));  
    d(:,k+1) = r(:,k+1) + beta(:,k+1)*d(:,k);
    k = k + 1;    
end
xx = norm(r(:,k));
iter = k-1;