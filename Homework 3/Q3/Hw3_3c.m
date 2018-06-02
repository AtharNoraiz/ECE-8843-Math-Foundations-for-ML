clear all;
close all;

x = @(z) (z < 1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);
N = 5;
phi = @(z) exp(-z.^2);
for jj = 1:N
x_phik = @(z) x(z).*phi(N*z - jj + 1/2);
b(jj) = integral(x_phik, 0, 1); 
% This computes the b matrix in Ga = b
end

for ii = 1:N
    for kk = 1:N
       
gram = @(z) phi(N*z-ii+0.5).*phi(N*z - kk + 1/2);
G(ii,kk) = integral(gram, 0, 1);
% The Grammian matrix
    end
end

Gt = transpose(G);
a = (inv(Gt))* transpose(b);

t = linspace(0,1,1000);
xcap = zeros(size(t));
for jj = 1:N
xcap = xcap + a(jj)*phi(N*t - jj + 1/2);
end
%xcap is the point on the subspace
k = 1;
for z = 0:0.001:1;

if (z >=0) & (z <0.25)
    xt(k) = (4*z);
 else if (z>=0.25) & (z<0.5)
        xt(k) = (2 - 4*z);
    else if (z>=0.5) & (z<1) 
            xt(k) = -sin(20*pi*z);
     end
     end
end
k = k+1;
end
plot(t,xcap,'b',t,xt,'g');
title('Q.3(c)  N = 50')
xlabel('Time')
ylabel('Function value')
legend('xcap','x(t)')
%The approximation is depicted by the blue line

