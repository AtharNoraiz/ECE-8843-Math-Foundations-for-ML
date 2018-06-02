%More efficient version 2.
function [x, iter, xx] = sdsolve(H, b, tol, maxiter)
k = 1; 
x(:,1) = zeros(1000,1);
% x(:,1) = zeros(2,1);
r(:,1) = b - H*x(:,1); 
while (((norm(r(:,k))/norm(b)) > tol) && (k <= maxiter))
    q = H*r(:,k);
    a(:,k) = ((r(:,k)')*r(:,k))/((r(:,k)')*q);
    x(:,k+1) = x(:,k) + (a(:,k)*r(:,k));
    r(:,k+1) = r(:,k) - (a(:,k)*q);
    k = k + 1;    
end
xx = norm(r(:,k));
iter = k-1;

