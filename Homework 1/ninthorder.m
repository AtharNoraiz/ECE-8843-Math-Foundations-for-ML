coeff = polyfit(t,y,9)
xn = linspace(0,10,1000);
yn = polyval(coeff,xn);
plot(xn,yn)
xlabel('t--->');
ylabel('y--->');
hold on
plot(t,y,'*')
hold off

% coeff = 0.0001   -0.0037    0.0427   -0.1616   -0.7653    9.8373  -38.9788   71.9967  -57.8076   13.6239
