function ft = bsplinex(t,y)
        d = zeros(10,10);

for i=1:length(t)
    d(i,1) = funcb2(t(i));
    d(i,2) = funcb2(t(i)-1);
    d(i,3) = funcb2(t(i)-2);
    d(i,4) = funcb2(t(i)-3);
    d(i,5) = funcb2(t(i)-4);
    d(i,6) = funcb2(t(i)-5);
    d(i,7) = funcb2(t(i)-6);
    d(i,8) = funcb2(t(i)-7);
    d(i,9) = funcb2(t(i)-8);
    d(i,10) = funcb2(t(i)-9);
 
    D = d^(-1);
    % Inverse of the A matrix.
    a = D*y;
    % calculting the alpha vector. 
    
end
  T = linspace (0,10,10000);
 
  for j=1:length(T)
      
     ft(j) = [a(1)*funcb2(T(j)) + a(2)*funcb2(T(j)-1) + a(3)*funcb2(T(j)-2) + a(4)*funcb2(T(j)-3) + a(5)*funcb2(T(j)-4) + a(6)*funcb2(T(j)-5) + a(7)*funcb2(T(j)-6) + a(8)*funcb2(T(j)-7)+ a(9)*funcb2(T(j)-8)+ a(10)*funcb2(T(j)-9)];
  end
  
 plot(T,ft);
 xlabel('t--->');
 ylabel('y--->');
 hold on
 plot(t,y,'*');
 
end