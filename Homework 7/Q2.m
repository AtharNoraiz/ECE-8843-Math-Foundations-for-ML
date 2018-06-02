H = [2 1; 1 2];
b = [-1; -3];
syms x1 x2
f(x1,x2) = x1^2 + x2^2 + x1*x2 + x1 + 3*x2;
figure;
fcontour(f);
title('f(x,y) = x^2 + y^2 + xy + x + 3y');
xlabel('x-->');
ylabel('y-->');

figure;
fcontour(f);
hold on; 
title('f(x,y) = x^2 + y^2 + xy + x + 3y: Steepest Descent');
xlabel('x-->');
ylabel('y-->');
[xsd, itersd] = sdsolve(H, b, 10^-6, 4); 
plot(xsd(1,:),xsd(2,:));

figure;
fcontour(f);
hold on; 
title('f(x,y) = x^2 + y^2 + xy + x + 3y: Conjugate Gradient');
xlabel('x-->');
ylabel('y-->');
[xcg, itercg] = cgsolve(H, b, 10^-6, 2);
plot(xcg(1,:),xcg(2,:));
