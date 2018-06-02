function Q5 = funcQ5(R,a,b,c)

B(1)=c*R*transpose(a);
B(2)=c*R*transpose(b);
G(1,1)=a*R*transpose(a);
G(1,2)=a*R*transpose(b);
G(2,1)=b*R*transpose(a);
G(2,2)=b*R*transpose(b);
alpha = inv(G)*transpose(B);
display(alpha);
n1=0;
n2=0;
n3=0;
n1 = c(1) - alpha(1)*a(1) - alpha(2)*b(1);
n2 = c(1) - alpha(1)*a(2) - alpha(2)*b(2);
n3 = c(1) - alpha(1)*a(3) - alpha(2)*b(3);
n = [n1 n2 n3];
MSEexp = n*R*transpose(n);
display (MSEexp);
end
