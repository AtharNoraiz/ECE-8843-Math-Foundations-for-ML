clear all;
close all;
load('hw9p3_data.mat')
r = cov(X');
k = 1;
y = zeros(6);
s(:,:,k)  = eye(6,6);
while (k < 20000)
d = -inv(s(:,:,k)) + r; %tolerance value not sure...
if (max(abs(d)) < (10^-4))
    break
end
a = 1;
y = s(:,:,k) - a*(d);
y(1:2,4:6) = 0;
y(3,5) = 0; y(3,6) = 0;
y(4,1) = 0; y(4,2) = 0;
y(5:6,1:3) = 0;
s(:,:,k+1) = y;
while (min(eig(s(:,:,k+1)) <= 0))
a = a/2;
y = s(:,:,k) - a*(d);
y(1:2,4:6) = 0;
y(3,5) = 0; y(3,6) = 0;
y(4,1) = 0; y(4,2) = 0;
y(5:6,1:3) = 0;
s(:,:,k+1) = y;
if a < 10^-6
break
end

end
    k = k+1;
end
wcr = inv(s(:,:,k-1));



