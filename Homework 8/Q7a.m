t=linspace(0,5,10000);
phi = log(t);
phi1 = (-2)*phi;
phi2 = -phi;
phi3 = -(0.5)*phi;
phi4 = -(0.2)*phi;
figure;

plot (t,phi1,'b');
hold on;
plot (t,phi2,'y');
hold on;
plot (t,phi3,'k');
hold on;
plot (t,phi4,'r');
hold on;
xlabel ('t axis');
ylabel ('phi axis'); 
title ('phi(T,t) = -Tlog(t), for different values of T');
xlim([0 5])
ylim([-4 12])
hold off;
legend('T = 2','T = 1','T = 0.5','T = 0.2');