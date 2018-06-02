phi = @(z) exp(-z.^2);
t = linspace(0, 1, 1000);
figure(1); clf
hold on
N = 10;
%N = 25;
for kk = 1:N
plot(t, phi(N*t - kk + 1/2))
end
title('Q.3(a)  N = 10')
xlabel('Time')
ylabel('Function value')
%Do this for N = 10 and N = 25 and turn in your plots.