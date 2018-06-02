
%Finally it should be linspace T and plot T vs f(t) and a(m+1) vector is the y vector.
T = linspace (0,10,100);
x=1;
num =1;
den =1;


for i=1:length(T)
    f(i) = 0;

for m=0:9
    for k=0:9
        if (m~=k)
         b(k+1) = (t(m+1)-t(k+1));
         x(k+1) = T(i) - t(k+1);
        else b(k+1)=1;
            x(k+1)=1;
        end
    end
    den = cumprod(b);
    num = cumprod(x);
    p(m+1) = num(10)/den(10);
end        
    
 for m=0:9
    f(i) = f(i) + a(m+1)*p(m+1);
 end
      
end

plot(T,f);
xlabel('t--->');
ylabel('y--->');
hold on
plot(t,y,'*');
hold off
