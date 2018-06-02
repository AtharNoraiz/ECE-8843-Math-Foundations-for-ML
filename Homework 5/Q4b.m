%For 3rd order polynomial 
%Sampling 5000 points between 0 and 1 and at intervals of 1/5000.
t = linspace(0,1,5000);
for i = 1:5000
a1(i) = (x(1)*(t(i).^3) + x(2)*(t(i).^2) + x(3)*t(i) + x(4)) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2));
b1(i) = a1(i)^2;
end
c1 = mean(b1);
generror3 = c1^(0.5);

