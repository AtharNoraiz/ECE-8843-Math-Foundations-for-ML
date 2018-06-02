sigma = [1/20 1/50 1/100 1/300 1/1000];
for k = 1:5
    
    for i = 1:100
    for j = 1:100
        K(i,j) = exp(-((T(i)-T(j))^2)/(2*sigma(k)*sigma(k)));
    end
    end
    
e = eig(K);
del(k) = max(e)/1000;
delta = del(k)*eye(100);    
B = inv(K + delta);
alpha = B*y;

 for i = 1:100
     ft(i) = 0; 
    for j = 1:100
        ft(i) = ft(i) + (alpha(j) * exp(-((T(i)-T(j))^2)/(2*sigma(k)*sigma(k))));
    end
 end
se = 0;
for i=1:100
    se = se + ((y(i) - ft(i))^2);
end
sampleerror(k) = sqrt(se);    

tx = linspace(0,1,5000);
for i = 1:5000
     ft(i) = 0; 
    for j = 1:100
        ft(i) = ft(i) + (alpha(j) * exp(-((T(j)-tx(i))^2)/(2*sigma(k)*sigma(k))));
    end
end

%Sampling 5000 points between 0 and 1 and at intervals of 1/5000.
t = linspace(0,1,5000);
for i = 1:5000
ax = (ft(i) - ((sin(12*(t(i) + 0.2)))/(t(i) + 0.2)));
b(i) = ax^2;
end
c = mean(b);
generror(k) = c^(0.5);

figure;
t = linspace(0,1,5000);
plot(t,ft);
ylabel('fhat(t)');
xlabel('t axis');
title(['Plot of fhat(t) for sigma = ' num2str(sigma(k)) ', kernel regression estimate, with sample points overlaid']);
hold on;
plot(T,y,'o');
end

    