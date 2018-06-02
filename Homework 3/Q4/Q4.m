t=linspace(0,1,1000);
w = 16*(t-0.5).^2;
plot(t,w);
title('Q.4(a)')
xlabel('Time')
ylabel('Function w(t) value')


% The basis vectors are 1, t and t^2.

x = @(z) exp(z);

x_phik = @(z) (16*(z-0.5).^2).*(x(z));
b(1) = integral(x_phik, 0, 1); 


x_phik =@(z) (16*(z-0.5).^2).*(x(z).*z);
b(2) = integral(x_phik, 0, 1); 


x_phik = @(z) (16*(z-0.5).^2).*(x(z).*z.^2);
b(3) = integral(x_phik, 0, 1); 

% This computes the b matrix in Ga = b
%Do the following to get the Grammian matrix

gram = @(z) (16*(z-0.5).^2);
G(1,1) = integral(gram, 0, 1);
gram = @(z) (16*(z-0.5).^2).*(z).^2;
G(2,2) = integral(gram, 0, 1);
gram = @(z) (16*(z-0.5).^2).*(z).^4;
G(3,3) = integral(gram, 0, 1);

gram = @(z) (16*(z-0.5).^2).*(z);
G(1,2) = integral(gram, 0, 1);
G(2,1) = G(1,2);
gram = @(z) (16*(z-0.5).^2).*(z.^2);
G(1,3) = integral(gram, 0, 1);
G(3,1) = G(1,3);
gram = @(z) (16*(z-0.5).^2).*(z.*z.^2);
G(2,3) = integral(gram, 0, 1);
G(3,2) = G(2,3);

Gt = transpose(G);
bt = transpose(b);
a = inv(Gt) * bt;

t = linspace(0,1,1000);
xcap = a(1)* 1 + a(2) * t + a(3) *t.^2;
hold on
%xcap is the point on the subspace
figure();
plot(t, xcap)

for z = 0:0.0001:1;
    xt = exp(z);
hold on
plot(z,xt,'g');

end
plot(z, xt, 'g')
title('Q.4(c)')
xlabel('Time')
ylabel('Function value')
legend('xcap','exp(t)')
