del = 10^(-6)*eye(100);
%For 9th order polynomial
for i=1:100
    Anew(i,:) = [T(i)^9 T(i)^8 T(i)^7 T(i)^6 T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- Anew is a 100x10 matrix. 
end
B = Anew'*inv((Anew*Anew') + del);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^9) + x(2)*(T(i)^8) + x(3)*(T(i)^7) + x(4)*(T(i)^6) + x(5)*(T(i)^5) + x(6)*(T(i)^4) + x(7)*(T(i)^3) + x(8)*(T(i)^2) + x(9)*(T(i)) + x(10))));  
    de(i) = se(i)^2;
end
sampleerrorAnew = sqrt(sum((de)));
figure;
t = linspace(0,1);
plot(t,((x(1)*(t.^9) + x(2)*(t.^8) + x(3)*(t.^7) + x(4)*(t.^6) + x(5)*(t.^5) + x(6)*(t.^4) + x(7)*(t.^3) + x(8)*(t.^2) + x(9)*t + x(10))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 9th order polynomial, ridge regression estimate, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(Anew);
smallestsingAnew = min(s);
largestsingAnew = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a8(i) = (x(1)*(t(i).^9) + x(2)*(t(i).^8) + x(3)*(t(i).^7) + x(4)*(t(i).^6) + x(5)*(t(i).^5) + x(6)*(t(i).^4) + x(7)*(t(i).^3) + x(8)*(t(i).^2) + x(9)*t(i) + x(10)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b8(i) = a8(i)^2;
end
c8 = mean(b8);
generrord = sqrt(c8);
