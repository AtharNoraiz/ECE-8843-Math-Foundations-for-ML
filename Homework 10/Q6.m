clear all; close all; clc;
load('hw10p6_data.mat')
%% To inspect the scatter plot..
for i = 1:1000
    plot(X(1,i),X(2,i),'ko'); hold on;
end
%% Initialization..on observing the scatter plot
k = 1; %number of iterations
ex(k) = 1;
q = [1 2 3 4 5]; %number of gaussian distributions
n = 1; % varies from 1 to 1000
m(:,1,k) = [-0.8; 0.15]; m(:,2,k) = [-0.5; 0.05]; m(:,3,k) = [0.025; 0.04]; m(:,4,k) = [0.6; -0.05]; m(:,5,k) = [0.92; -0.07];
b(q,k) = [0.1 0.2 0.4 0.2 0.1];
cov(:,:,1,k) = 0.026*eye(2); cov(:,:,2,k) = 0.022*eye(2); cov(:,:,3,k) = 0.046*eye(2); cov(:,:,4,k) = 0.013*eye(2); cov(:,:,5,k) = 0.003*eye(2);
%cov(:,:,1,k) = eye(2); cov(:,:,2,k) = eye(2); cov(:,:,3,k) = eye(2); cov(:,:,4,k) = eye(2); cov(:,:,5,k) = eye(2);
al = 0;
%%
while (abs(ex(k) - al) > 0.0001)
    for n = 1:1000
        for q = 1:5
            phi(k,n,q) = (1/((2*pi)*sqrt(det(cov(:,:,q,k))))*(exp(-0.5*((X(:,n) - m(:,q,k))'*(inv((cov(:,:,q,k))))*(X(:,n) - m(:,q,k))))));
        end
    end
    sumo = zeros(1,1000);
    for n = 1:1000
        for q = 1:5
            sumo(n) = sumo(n) + b(q,k)*phi(k,n,q);
        end
    end
    
    for q = 1:5
        for n = 1:1000
            g(k,n,q) = (b(q,k)*phi(k,n,q))/sumo(n);
        end
    end
    
    for q = 1:5
        b(q,k+1) = 0;
        for n = 1:1000
            b(q,k+1) = b(q,k+1) + g(k,n,q);
        end
        b(q,k+1) = b(q,k+1)/1000;
    end
    
    for q = 1:5
        m(:,q,k+1) = zeros;
        for n = 1:1000
            m(:,q,k+1) = m(:,q,k+1) + g(k,n,q)*X(:,n);
        end
        m(:,q,k+1) = m(:,q,k+1)/(1000*b(q,k+1));
    end
    
    for q = 1:5
        cov(:,:,q,k+1) = zeros;
        for n = 1:1000
            cov(:,:,q,k+1) = cov(:,:,q,k+1) + g(k,n,q)*(X(:,n)-(m(:,q,k+1)))*(X(:,n)-(m(:,q,k+1)))';
        end
        cov(:,:,q,k+1) = cov(:,:,q,k+1)/(1000*b(q,k+1));
    end
    %% for calculating new E
    ex(k+1) = 0;
    for n = 1:1000
        for q = 1:5
            phi(k+1,n,q) = (1/((2*pi)*sqrt(det(cov(:,:,q,k+1))))*(exp(-0.5*((X(:,n) - m(:,q,k+1))'*(inv((cov(:,:,q,k+1))))*(X(:,n) - m(:,q,k+1))))));
        end
    end
    sumon = zeros(1,1000);
    for n = 1:1000
        for q = 1:5
            sumon(n) = sumon(n) + b(q,k+1)*phi(k+1,n,q);
        end
    end
    
    for q = 1:5
        for n = 1:1000
            g(k+1,n,q) = (b(q,k+1)*phi(k+1,n,q))/sumon(n);
        end
    end
    
    
    for n = 1:1000
        for q = 1:5
            %     ex(k+1) = ex(k+1) + g(k+1,n,q)*(log(abs((b(q,k+1))))+log(abs((phi(k+1,n,q)))));
            ex(k+1) = ex(k+1) + g(k+1,n,q)*(log(abs((b(q,k+1)))) *(abs((phi(k+1,n,q)))));
        end
    end
    k = k + 1;
    al = ex(k-1);
    %     abs(ex(k) - al)
end

syms x y
f1(x,y) = (1/((2*pi)*sqrt(det(cov(:,:,1,k))))*(exp(-0.5*([x;y] - m(:,1,k))'*(inv((cov(:,:,1,k))))*([x;y] - m(:,1,k)))));
fcontour(f1,[-1.5 1.5 -0.15 0.25],'MeshDensity',1000); hold on;
f2(x,y) = (1/((2*pi)*sqrt(det(cov(:,:,2,k))))*(exp(-0.5*([x;y] - m(:,2,k))'*(inv((cov(:,:,2,k))))*([x;y] - m(:,2,k)))));
fcontour(f2,[-1.5 1.5 -0.15 0.25],'MeshDensity',1000); hold on;
f3(x,y) = (1/((2*pi)*sqrt(det(cov(:,:,3,k))))*(exp(-0.5*([x;y] - m(:,3,k))'*(inv((cov(:,:,3,k))))*([x;y] - m(:,3,k)))));
fcontour(f3,[-1.5 1.5 -0.15 0.25],'MeshDensity',1000); hold on;
f4(x,y) = (1/((2*pi)*sqrt(det(cov(:,:,4,k))))*(exp(-0.5*([x;y] - m(:,4,k))'*(inv((cov(:,:,4,k))))*([x;y] - m(:,4,k)))));
fcontour(f4,[-1.5 1.5 -0.15 0.25],'MeshDensity',1000); hold on;
f5(x,y) = (1/((2*pi)*sqrt(det(cov(:,:,5,k))))*(exp(-0.5*([x;y] - m(:,5,k))'*(inv((cov(:,:,5,k))))*([x;y] - m(:,5,k)))));
fcontour(f5,[-1.5 1.5 -0.15 0.25],'MeshDensity',1000); hold on;





