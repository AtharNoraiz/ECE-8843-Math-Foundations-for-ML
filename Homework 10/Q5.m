clear all; close all; clc;%% Generate a distribution for each covariance matrix defined.
load('F:\Fall 2017\Math Foundations for ML\Assignments\Homework 10\hw10p4_data.mat')
%% Generating variables..using the covariances and means in Q2.
mu1 = [0;1];
sigma1 = [3,-6;-6,18];
% rng default % for reproducability
r1 = mvnrnd(mu1,sigma1,1000);
mu2 = [1;0];
sigma2 = [1,0;0,1];
% rng default
r2 = mvnrnd(mu2,sigma2,1000);
r1 = r1';
r2 = r2';
%% Each data point in r1 and r2 are to be compared with X1 and X2 separately..
for j = 1:1000
    for i = 1:100
        d1(j,i) = sqrt((r1(1,j) - X1(1,i))^2 + (r1(2,j) - X1(2,i))^2);
    end
    for i = 1:100
        d2(j,i) = sqrt((r1(1,j) - X2(1,i))^2 + (r1(2,j) - X2(2,i))^2);
    end
    for i = 1:100
        d3(j,i) = sqrt((r2(1,j) - X1(1,i))^2 + (r2(2,j) - X1(2,i))^2);
    end
    for i = 1:100
        d4(j,i) = sqrt((r2(1,j) - X2(1,i))^2 + (r2(2,j) - X2(2,i))^2);
    end
end
for k = 1:1000
    mind1(k) = min(d1(k,:));
end
for k = 1:1000
    mind2(k) = min(d2(k,:));
end
for k = 1:1000
    mind3(k) = min(d3(k,:));
end
for k = 1:1000
    mind4(k) = min(d4(k,:));
end
q1 = 0; q2 = 0; q3 = 0; q4 = 0;
%% bo (blue circles) -- belongs to X1 and k* (black stars) -- belongs to X2.
for k = 1:1000
    if mind1(k)<mind2(k)
        plot(r1(1,k),r1(2,k),'bo'); hold on;
        q1 = q1+1;
    end
    if mind1(k)> mind2(k)
        plot(r1(1,k),r1(2,k),'k*'); hold on;
        q2 = q2+1;
    end
end
for k = 1:1000
    if mind3(k)<mind4(k)
        plot(r2(1,k),r2(2,k),'bo'); hold on;
        q3 = q3+1;
    end
    if mind3(k)> mind4(k)
        plot(r2(1,k),r2(2,k),'k*'); hold on;
        q4 = q4+1;
    end
end
GENN = ((q2 + q3)/2000)*100; %This is GE for Nearest Neighbours case.
%% Calculating GE for Bayes Classifer..
syms x1 x2
f1(x1,x2) = (1/(2*pi*sqrt(18)))*(exp(-(1/36)*(18*x1^2 + 3*x2^2 + 12*x1*x2 - 12*x1 - 6*x2 + 3)));
f2(x1,x2) = (1/(2*pi))*(exp(-0.5*(x1^2 + x2^2 - 2*x1 + 1)));
err = 0;
for j = 1:1000
    if double(f1(r1(1,j),r1(2,j))) < double(f2(r1(1,j),r1(2,j)))
        err = err + 1;
    end
    if double(f1(r2(1,j),r2(2,j))) > double(f2(r2(1,j),r2(2,j)))
        err = err + 1;
    end
end
GEBC = (err/2000)*100;
