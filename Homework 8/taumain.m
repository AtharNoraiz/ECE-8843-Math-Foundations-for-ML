for i = 1:10
    tau = 2^(1-i);
    fprintf('Iteration number: %i\n', i);
    fprintf('Value of tau: %d\n', tau);
    if tau==1
        xxx = [1; 2; 3; 4];
        xhat(:,i) = tauf(tau,xxx)
    else
    xhat(:,i) = tauf(tau,xhat(:,i-1))  
    end
end
