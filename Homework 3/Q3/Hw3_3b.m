N = 4;
a = [1 -1 1 -1];
t = linspace(0,1,1000);
y = zeros(size(t));
for jj = 1:4
y = y + a(jj)*phi(N*t - jj + 1/2);
end
plot(t, y)
title('Q.3(b)')
xlabel('Time')
ylabel('Function value')

%Do this for N = 4, and a1 = 1; a2 = -1; a3 = 1; a4 = -1 and turn in your plot.