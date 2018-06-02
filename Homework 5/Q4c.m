%For 4th order polynomial 
for i=1:100
    A1(i,:) = [T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x5 matrix. 
end
B = pinv(A1);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^4) + x(2)*(T(i)^3) + x(3)*(T(i)^2) + x(4)*(T(i)) + x(5))));
    de(i) = se(i)^2;
end
sampleerrorA1 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,(x(1)*(t.^4) + x(2)*(t.^3) + x(3)*(t.^2) + x(4)*t + x(5)));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 4th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A1);
smallestsingA1 = min(s);
largestsingA1 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a2(i) = (x(1)*(t(i).^4) + x(2)*(t(i).^3) + x(3)*(t(i).^2) + x(4)*t(i) + x(5)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b2(i) = a2(i)^2;
end
c2 = mean(b2);
generror4 = sqrt(c2);

%For 5th order polynomial
for i=1:100
    A2(i,:) = [T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x6 matrix. 
end
B = pinv(A2);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^5) + x(2)*(T(i)^4) + x(3)*(T(i)^3) + x(4)*(T(i)^2) + x(5)*(T(i)) + x(6))));
    de(i) = se(i)^2;
end
sampleerrorA2 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,((x(1)*(t.^5) + x(2)*(t.^4) + x(3)*(t.^3) + x(4)*(t.^2) + x(5)*(t) + x(6))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 5th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A2);
smallestsingA2 = min(s);
largestsingA2 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a3(i) = (x(1)*(t(i).^5) + x(2)*(t(i).^4) + x(3)*(t(i).^3) + x(4)*(t(i).^2) + x(5)*(t(i)) + x(6)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b3(i) = a3(i)^2;
end
c3 = mean(b3);
generror5 = sqrt(c3);


%For 6th order polynomial
for i=1:100
    A3(i,:) = [T(i)^6 T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x7 matrix. 
end
B = pinv(A3);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^6) + x(2)*(T(i)^5) + x(3)*(T(i)^4) + x(4)*(T(i)^3) + x(5)*(T(i)^2) + x(6)*(T(i)) + x(7))));
    de(i) = se(i)^2;
end
sampleerrorA3 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,((x(1)*(t.^6) + x(2)*(t.^5) + x(3)*(t.^4) + x(4)*(t.^3) + x(5)*(t.^2) + x(6)*t + x(7))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 6th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A3);
smallestsingA3 = min(s);
largestsingA3 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a4(i) = (x(1)*(t(i).^6) + x(2)*(t(i).^5) + x(3)*(t(i).^4) + x(4)*(t(i).^3) + x(5)*(t(i).^2) + x(6)*t(i) + x(7)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b4(i) = a4(i)^2;
end
c4 = mean(b4);
generror6 = sqrt(c4);

%For 7th order polynomial
for i=1:100
    A4(i,:) = [T(i)^7 T(i)^6 T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x8 matrix. 
end
B = pinv(A4);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^7) + x(2)*(T(i)^6) + x(3)*(T(i)^5) + x(4)*(T(i)^4) + x(5)*(T(i)^3) + x(6)*(T(i)^2) + x(7)*(T(i)) + x(8))));
    de(i) = se(i)^2;
end
sampleerrorA4 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,((x(1)*(t.^7) + x(2)*(t.^6) + x(3)*(t.^5) + x(4)*(t.^4) + x(5)*(t.^3) + x(6)*(t.^2) + x(7)*t + x(8))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 7th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A4);
smallestsingA4 = min(s);
largestsingA4 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a5(i) = (x(1)*(t(i).^7) + x(2)*(t(i).^6) + x(3)*(t(i).^5) + x(4)*(t(i).^4) + x(5)*(t(i).^3) + x(6)*(t(i).^2) + x(7)*t(i) + x(8)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b5(i) = a5(i)^2;
end
c5 = mean(b5);
generror7 = sqrt(c5);


%For 8th order polynomial
for i=1:100
   A5(i,:) = [T(i)^8 T(i)^7 T(i)^6 T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x9 matrix. 
end
B = pinv(A5);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^8) + x(2)*(T(i)^7) + x(3)*(T(i)^6) + x(4)*(T(i)^5) + x(5)*(T(i)^4) + x(6)*(T(i)^3) + x(7)*(T(i)^2) + x(8)*(T(i)) + x(9))));
    de(i) = se(i)^2;
end
sampleerrorA5 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,((x(1)*(t.^8) + x(2)*(t.^7) + x(3)*(t.^6) + x(4)*(t.^5) + x(5)*(t.^4) + x(6)*(t.^3) + x(7)*(t.^2) + x(8)*t + x(9))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 8th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A5);
smallestsingA5 = min(s);
largestsingA5 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a6(i) = (x(1)*(t(i).^8) + x(2)*(t(i).^7) + x(3)*(t(i).^6) + x(4)*(t(i).^5) + x(5)*(t(i).^4) + x(6)*(t(i).^3) + x(7)*(t(i).^2) + x(8)*t(i) + x(9)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b6(i) = a6(i)^2;
end
c6 = mean(b6);
generror8 = sqrt(c6);

%For 9th order polynomial
for i=1:100
    A6(i,:) = [T(i)^9 T(i)^8 T(i)^7 T(i)^6 T(i)^5 T(i)^4 T(i)^3 T(i)^2 T(i) 1]; % ---- A is a 100x10 matrix. 
end
B = pinv(A6);
x = B*y;
se = 0;
%sample error:
for i=1:100
    se(i) = (y(i) - ((x(1)*(T(i)^9) + x(2)*(T(i)^8) + x(3)*(T(i)^7) + x(4)*(T(i)^6) + x(5)*(T(i)^5) + x(6)*(T(i)^4) + x(7)*(T(i)^3) + x(8)*(T(i)^2) + x(9)*(T(i)) + x(10))));  
    de(i) = se(i)^2;
end
sampleerrorA6 = sqrt(sum((de)));
figure;
t = linspace(0,1,5000);
plot(t,((x(1)*(t.^9) + x(2)*(t.^8) + x(3)*(t.^7) + x(4)*(t.^6) + x(5)*(t.^5) + x(6)*(t.^4) + x(7)*(t.^3) + x(8)*(t.^2) + x(9)*t + x(10))));
ylabel('fhat(t)');
xlabel('t axis');
title('Plot of fhat(t), 9th order polynomial, with sample points overlaid');
hold on;
plot(T,y,'o');
s = svd(A6);
smallestsingA6 = min(s);
largestsingA6 = max(s);

t = linspace(0,1,5000);
for i = 1:5000
a7(i) = (x(1)*(t(i).^9) + x(2)*(t(i).^8) + x(3)*(t(i).^7) + x(4)*(t(i).^6) + x(5)*(t(i).^5) + x(6)*(t(i).^4) + x(7)*(t(i).^3) + x(8)*(t(i).^2) + x(9)*t(i) + x(10)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b7(i) = a7(i)^2;
end
c7 = mean(b7);
generror9 = sqrt(c7);



