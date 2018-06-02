clear all;
close all;
A = [1.01 0.99;0.99 0.98];
x = 0;
b = randn(2,10000); % generates a 2x10 matrix with randn values.
for i = 1:10000
    e(:,i) = inv(A)*b(:,i);
    e2(i) = (e(1,i)^2 + e(2,i)^2);
    x = x + e2(i); 
end
average = x/10000;
 