clear all
close all
load('hw5p4_data.mat');
for i=1:100
    A(i,:) = [T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x4 matrix. 
end
B = pinv(A);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se = se + ((y(i) - (x(1)*(T(i)^3) + x(2)*(T(i)^2) + x(3)*(T(i)) + x(4)))^2);
end
sampleerror = sqrt(se);
t = linspace(0,1,5000);
plot(t,(x(1)*(t.^3) + x(2)*(t.^2) + x(3)*t + x(4)));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t) with sample points overlaid');
hold on;
plot(T,y,'o');





