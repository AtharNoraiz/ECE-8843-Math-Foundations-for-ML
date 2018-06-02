VarZ=var(Z);
Zhat = zeros(1,1000,'double');
for i=1:1000       
Zhat(i) = alpha(1)*X(i) + alpha(2)*Y(i);
end
MSEsampled = mean((Zhat-Z).^2);

