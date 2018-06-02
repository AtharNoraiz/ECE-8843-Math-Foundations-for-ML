clear all;
close all;
t = 1/3;
N = [10, 20, 50, 100, 200];
for i = 1:5
    figure;
    for k = 1:N(i)
    psit(k) = exp(-200*((t-(k/N(i)))^2));
    plot(k, psit(k),'o');
    xlabel ('K axis');
    ylabel ('Psi value');
    hold on;
    end
    title(['Feature map for t = 1/3, N = ' num2str(k) '']);
end
figure;
s = linspace(0,1,5000);
plot(s, exp(-200*((s-(1/3)).^2)));
xlabel ('s axis');
title('Radial basis kernel map for t = 1/3');
ylabel ('Psi value');

