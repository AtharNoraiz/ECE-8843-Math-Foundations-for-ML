%Question:3.
syms x1 x2
f1(x1,x2) = (1/(2*pi*sqrt(18)))*(exp(-(1/36)*(18*x1^2 + 3*x2^2 + 12*x1*x2 - 12*x1 - 6*x2 + 3)));
f2(x1,x2) = (1/(2*pi))*(exp(-0.5*(x1^2 + x2^2 - 2*x1 + 1)));
f3(x1,x2) = (-5)*x2^2 + (4)*x1*x2 - (8)*x1 - (2)*x2 - (5) - 12*log(1/sqrt(18));
ezsurf(f3);
hold on; 
% eqn = (-5)*x2^2 + (4)*x1*x2 - (8)*x1 - (2)*x2 - (5) - 12*log(1/sqrt(18));
% sol = solve(eqn);
y2 = linspace(-6,6,1000);
for i = 1:1000
y1(i) = (5*y2(i)^2 + 2*y2(i) - 868507263970121/70368744177664)/(4*y2(i) - 8); 
end
figure;
plot(y1,y2,'ko');
%axis([-6 6 -6 6])
% Now evaluate random points for f1,f2 and f3 and see which is greater.