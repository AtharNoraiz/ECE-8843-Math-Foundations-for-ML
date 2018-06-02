function ret = tauf(taunum,xvect)
A = [1 -1 -1 0;2 0 3 0;-2 0 1 1;1 4 0 1;0 3 1 1];
y = [1;-1;1;2;0];
k = 1;
x(:,k) = xvect; 

while (k < 20000)
d = 2*y'*A - 2*x(:,k)'*(A'*A) + taunum*[1/x(1,k) 1/x(2,k) 1/x(3,k) 1/x(4,k)];
d = d';
if (max(abs(d)) < (10^-4))
    break
end
a = 1;
 for i = 1:4
        x(i,k+1) = x(i,k) + a*d(i);
 end
while ((x(1,k+1) < 0)||(x(2,k+1) < 0)||(x(3,k+1) < 0)||(x(4,k+1) < 0))
    a = a/2;
    for i = 1:4
        x(i,k+1) = x(i,k) + a*d(i);
    end
end
pro(k) = x(1,k)*x(2,k)*x(3,k)*x(4,k);
pro(k+1) = x(1,k+1)*x(2,k+1)*x(3,k+1)*x(4,k+1);
fx(k+1) = -taunum*log(pro(k+1)) + (norm(y - A*x(:,k+1)))^2;
fx(k) = -taunum*log(pro(k)) + (norm(y - A*x(:,k)))^2;
while (fx(k+1) >= fx(k))
    a = a/2;
    for i = 1:4
        x(i,k+1) = x(i,k) + a*d(i);
    end
    pro(k+1) = x(1,k+1)*x(2,k+1)*x(3,k+1)*x(4,k+1);
    fx(k+1) = -taunum*log(pro(k+1)) + (norm(y - A*x(:,k+1)))^2;
end
    k = k+1;
end
ret = x(:,k-1); 
fprintf('The number of iterations: %i\n\n', k-1)
end






    
    




