function ft1 = piecepoly2(t,alpha)
% gets an input time vector t. 
% gets an input alpha vector alpha. 

% The following lines of code are written:
% alpha = [-1 3 2 -1 4] or any alpha you want.
% t = linspace (-5,7,10000) or any time vector you want. The third
% parameter in linspace command gives the sampling rate/ number of samples.
% Higher the value of the rate, smoother is the curve.
% ft = piecepoly2(t,alpha) to get samples of ft as per the question. 
% plot(t,ft); xlabel('t'); ylabel('ft') for getting the smooth curve. 

for i=1:length(t)
    ft1(i) = alpha(1)*funcb2(t(i)) + alpha(2)*funcb2(t(i)-1) + alpha(3)*funcb2(t(i)-2) + alpha(4)*funcb2(t(i)-3) + alpha(5)*funcb2(t(i)-4);
end
end